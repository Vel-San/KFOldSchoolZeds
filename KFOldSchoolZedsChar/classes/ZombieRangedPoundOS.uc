//Because we want the zeds to extend to KFMonsterOS,
//We'll need to overhaul all class files of each zed, 
//Controllers as well if we count certain Zeds

// A "mini" patty that fires incendiary rounds as a Husk replacement
class ZombieRangedPoundOS extends ZombieRangedPoundBaseOS
    abstract;

//Issues
//Does not always play the FireMGEnd animation after he's finished firing,
//Resulting in him walking weirdly towards the player. Try to suss it out using logs?

// Load all relevant texture, sound, and other packages
#exec OBJ LOAD FILE=KFCharacterModelsOldSchool.ukx
#exec OBJ LOAD FILE=KFOldSchoolZeds_Textures.utx
#exec OBJ LOAD FILE=KFOldSchoolZeds_Sounds.uax

//----------------------------------------------------------------------------
// NOTE: Most Variables are declared in the base class to eliminate hitching
//----------------------------------------------------------------------------


//We'll keep this modern code
function vector ComputeTrajectoryByTime( vector StartPosition, vector EndPosition, float fTimeEnd  )
{
	local vector NewVelocity;

	NewVelocity = Super.ComputeTrajectoryByTime( StartPosition, EndPosition, fTimeEnd );

	if( PhysicsVolume.IsA( 'KFPhysicsVolume' ) && StartPosition.Z < EndPosition.Z )
	{
		if( PhysicsVolume.Gravity.Z < class'PhysicsVolume'.default.Gravity.Z )
		{
			// Just checking mass to be extra-cautious.
			if( Mass > 900 )
			{
				// Extra velocity boost to counter oversized mass weighing the boss down.
				NewVelocity.Z += 90;
			}
		}
	}
	return NewVelocity;
}


//We want to keep this
function bool CanGetOutOfWay()
{
    return false;
}


//-----------------------------------------------------------------------------
// PostBeginPlay
//-----------------------------------------------------------------------------

//Retail Code were expanding on
//We want MGDamage to scale with difficulty, but not based on amount of players
//To further balance this, we'll tweak rate of fire, accuracy, and amount of shots fired
//Also, take reduced fire damage like the Husk does
simulated function PostBeginPlay()
{
	//super.PostBeginPlay(); moved to bottom to match with Husk PostBeginPlay

    if( Role < ROLE_Authority )
    {
        return;
    }

	// Difficulty Scaling
	// Minigun damage, Accuracy, Shots per burst and rate of fire set here
	// Carried over BurnDamageScale from Husk, since he is meant to replace him after all
	if (Level.Game != none)
	{
        if( Level.Game.GameDifficulty < 2.0 )
        {
            MGDamage = default.MGDamage * 0.75;//0.5//0.375
            BurnDamageScale = default.BurnDamageScale * 2.0;
			MGAccuracy = default.MGAccuracy * 1.25;
			MGFireBurst = default.MGFireBurst * 0.5;
			MGFireRate = default.MGFireRate * 1.5;
        }
        else if( Level.Game.GameDifficulty < 4.0 )
        {
            MGDamage = default.MGDamage * 1.0;
            BurnDamageScale = default.BurnDamageScale * 1.0;
			MGAccuracy = default.MGAccuracy * 1.0;
			MGFireBurst = default.MGFireBurst * 1.0;
			MGFireRate = default.MGFireRate * 1.0;			
        }
        else if( Level.Game.GameDifficulty < 5.0 )
        {
            MGDamage = default.MGDamage * 1.5;
            BurnDamageScale = default.BurnDamageScale * 0.75;
			MGAccuracy = default.MGAccuracy * 0.75;//875
			MGFireBurst = default.MGFireBurst * 1.3;
			MGFireRate = default.MGFireRate * 0.833333;		
        }
        else // Hardest difficulty
        {
            MGDamage = default.MGDamage * 2.0;
            BurnDamageScale = default.BurnDamageScale * 0.5;
			MGAccuracy = default.MGAccuracy * 0.5;
			MGFireBurst = default.MGFireBurst * 1.6;
			MGFireRate = default.MGFireRate * 0.68; //0.583333			
        }
     
	}

    super.PostBeginPlay();
}

// Copied from Husk
// don't interrupt the bloat while he is puking
simulated function bool HitCanInterruptAction()
{
    if( bShotAnim )
    {
        return false;
    }

    return true;
}

//Needed Retail Code
simulated function Destroyed()
{
	if( mTracer!=None )
		mTracer.Destroy();
	if( mMuzzleFlash!=None )
		mMuzzleFlash.Destroy();
	Super.Destroyed();
}

//Needed Retail Code
simulated Function PostNetBeginPlay()
{
	EnableChannelNotify ( 1,1);
	AnimBlendParams(1, 1.0, 0.0,, 'Bip01 Spine1'); //SpineBone1 to Bip01 Spine1
	super.PostNetBeginPlay();
	TraceHitPos = vect(0,0,0);
	bNetNotify = True;
}


//Need to overhaul this(Done!)
function RangedAttack(Actor A)
{
	local float Dist; //That distance check that was used for Siren
	local int LastFireTime; //Husk variable

	if ( bShotAnim )
		return;		
	Dist = VSize(A.Location-Location);
	
	//Using the Husks code, albeit modified
	if ( Physics == PHYS_Swimming )
	{
		SetAnimAction('Claw');
		bShotAnim = true;
		LastFireTime = Level.TimeSeconds;
	}
	else if ( Dist < MeleeRange + CollisionRadius + A.CollisionRadius )
	{
		bShotAnim = true;
		LastFireTime = Level.TimeSeconds;
		SetAnimAction('Claw');
		PlaySound(sound'Claw2s', SLOT_Interact); // We have this sound, use it
		Controller.bPreparingMove = true;
		Acceleration = vect(0,0,0);	
	}
	else if ( !bWaitForAnim && !bShotAnim && !bDecapitated && LastChainGunTime<Level.TimeSeconds )
	{
		if ( !Controller.LineOfSightTo(A) || FRand()> 0.85 )
		{
			LastChainGunTime = Level.TimeSeconds + MGFireInterval + (FRand() *2.0); //Level.TimeSeconds+FRand()*4;
			Return;
		}

		LastChainGunTime = Level.TimeSeconds + MGFireInterval + (FRand() *2.0); //Level.TimeSeconds + 5 + FRand() * 10;

		bShotAnim = true;
		Acceleration = vect(0,0,0);
		SetAnimAction('RangedPreFireMG'); //PreFireMG

		HandleWaitForAnim('RangedPreFireMG'); //PreFireMG
		//Tweak the amount of bullets he fires so its more predictable
		MGFireCounter =  MGFireBurst + Rand(10); //Rand(60) + 35;
		GoToState('FireChaingun');
	}	
}

simulated function AddTraceHitFX( vector HitPos )
{
	local vector Start,SpawnVel,SpawnDir;
	local float hitDist;
	
	//Play Old L85 fire sound
	PlaySound(sound'KFOldSchoolZeds_Sounds.MinigunFire',SLOT_Misc,2,,1400,0.9+FRand()*0.2);	
	Start = GetBoneCoords('FireBone').Origin; //tip to FireBone
	if( mTracer==None )
		mTracer = Spawn(Class'KFMod.KFNewTracer',,,Start); //KFNewTracer from KFMod and Retail are similar, so were not replacing it
	else mTracer.SetLocation(Start);
	if( mMuzzleFlash==None )
	{
		//Swap with NewMinigunMFlash(Done!)
        mMuzzleFlash = Spawn(Class'NewMinigunMFlashOS');
		AttachToBone(mMuzzleFlash, 'FireBone'); //tip to FireBone
	}
	else mMuzzleFlash.SpawnParticle(1);
	hitDist = VSize(HitPos - Start) - 50.f;

	if( hitDist>10 )
	{
		SpawnDir = Normal(HitPos - Start);
		SpawnVel = SpawnDir * 10000.f;
		mTracer.Emitters[0].StartVelocityRange.X.Min = SpawnVel.X;
		mTracer.Emitters[0].StartVelocityRange.X.Max = SpawnVel.X;
		mTracer.Emitters[0].StartVelocityRange.Y.Min = SpawnVel.Y;
		mTracer.Emitters[0].StartVelocityRange.Y.Max = SpawnVel.Y;
		mTracer.Emitters[0].StartVelocityRange.Z.Min = SpawnVel.Z;
		mTracer.Emitters[0].StartVelocityRange.Z.Max = SpawnVel.Z;
		mTracer.Emitters[0].LifetimeRange.Min = hitDist / 10000.f;
		mTracer.Emitters[0].LifetimeRange.Max = mTracer.Emitters[0].LifetimeRange.Min;
		mTracer.SpawnParticle(1);
	}
	Instigator = Self;

	if( HitPos != vect(0,0,0) )
	{
        Spawn(class'ROBulletHitEffect',,, HitPos, Rotator(Normal(HitPos - Start))); //Can't be bothered to replace this
    }
}

//Keep this the same as retail
simulated function AnimEnd( int Channel )
{
	local name  Sequence;
	local float Frame, Rate;
	
	if( Level.NetMode==NM_Client && bMinigunning )
	{
        GetAnimParams( Channel, Sequence, Frame, Rate );
	
        if( Sequence != 'RangedPreFireMG' && Sequence != 'RangedFireMG' ) //PreFireMG and FireMG now use RangedPound anims
        {
            Super.AnimEnd(Channel);
            return;
        }
	
		PlayAnim('RangedFireMG'); //Rangedpound Anims
		bWaitForAnim = true;
		bShotAnim = true;
		IdleTime = Level.TimeSeconds;
	}
	else Super.AnimEnd(Channel);
}

//We'll use retail code(modified) instead of KFMod code for this
state FireChaingun
{
	function RangedAttack(Actor A)
	{
		Controller.Target = A;
		Controller.Focus = A;
	}

	function EndState()
	{
        TraceHitPos = vect(0,0,0);
		bMinigunning = False;

        AmbientSound = default.AmbientSound;
        SoundVolume=default.SoundVolume;
        SoundRadius=default.SoundRadius;
        MGFireCounter=0;

        LastChainGunTime = Level.TimeSeconds + MGFireInterval + (FRand() *2.0); //Level.TimeSeconds + 5 + FRand() * 10;
	}

	function BeginState()
	{
        bFireAtWill = False;
		Acceleration = vect(0,0,0);
		MGLostSightTimeout = 0.0;
		bMinigunning = True;
	}

	function AnimEnd( int Channel )
	{
		if( MGFireCounter <= 0 )
		{
			bShotAnim = true;
			Acceleration = vect(0,0,0);
			SetAnimAction('RangedFireMGEnd'); //RangedPound Anims
			HandleWaitForAnim('RangedFireMGEnd'); //RangedPound Anims
			GoToState('');
		}
		else
		{
			if ( Controller.Enemy != none )
			{
				if ( Controller.LineOfSightTo(Controller.Enemy) && FastTrace(GetBoneCoords('FireBone').Origin,Controller.Enemy.Location)) //tip to FireBone
				{
					MGLostSightTimeout = 0.0;
                    Controller.Focus = Controller.Enemy;
					Controller.FocalPoint = Controller.Enemy.Location;
				}
				else
                {
                    MGLostSightTimeout = Level.TimeSeconds + (0.25 + FRand() * 0.35);
                    Controller.Focus = None;
                }

				Controller.Target = Controller.Enemy;
			}
			else
			{
                MGLostSightTimeout = Level.TimeSeconds + (0.25 + FRand() * 0.35);
                Controller.Focus = None;
			}

			//if ( FRand() < 0.03 && Controller.Enemy != none && PlayerController(Controller.Enemy.Controller) != none )
			//{
			//	// Randomly send out a message about Patriarch shooting chain gun(3% chance)
			//	   Wanted to keep this, but the line "what else does that bastard have up his sleeve" 
			//	   Bothers me. Maybe players don't care about this, so I should add it in next patch?
			//	PlayerController(Controller.Enemy.Controller).Speech('AUTO', 9, "");
			//}

			bFireAtWill = True;
			bShotAnim = true;
			Acceleration = vect(0,0,0);

			SetAnimAction('RangedFireMG'); //Use RangedPound anim
			bWaitForAnim = true;
		}
	}

	function FireMGShot()
	{
		local vector Start,End,HL,HN,Dir;
		local rotator R;
		local Actor A;
		
		MGFireCounter--;


		Start = GetBoneCoords('FireBone').Origin; //tip to FireBone
		if( Controller.Focus!=None )
			R = rotator(Controller.Focus.Location-Start);
		else R = rotator(Controller.FocalPoint-Start);
		if( NeedToTurnFor(R) )
			R = Rotation;
		// KFTODO: Maybe scale this accuracy by his skill or the game difficulty(Done!)
		Dir = Normal(vector(R)+VRand()*MGAccuracy); //*0.04//Now uses our own accuracy multiplier!
		End = Start+Dir*10000;

        // Have to turn of hit point collision so trace doesn't hit the Human Pawn's bullet whiz cylinder
        bBlockHitPointTraces = false;
		A = Trace(HL,HN,End,Start,True);
		bBlockHitPointTraces = true;

		if( A==None )
			Return;
		TraceHitPos = HL;
		if( Level.NetMode!=NM_DedicatedServer )
			AddTraceHitFX(HL);

		//TODO Figure out a way to make it so KFMonsters dont take damage(Done!)
		//Make it so only Humans, Glass, and Doors take damage 
		if( A!=Level && ( A == KFPawn(A) || A == KFGlassMover(A) || A == KFDoorMover(A)))
        	A.TakeDamage(MGDamage+Rand(3),Self,HL,Dir*500,Class'DamTypeBurned'); //Make MGDamage deal DamTypeBurned //Formerly "DamageType"
		else
			return;
	}

	function bool NeedToTurnFor( rotator targ )
	{
		local int YawErr;

		targ.Yaw = DesiredRotation.Yaw & 65535;
		YawErr = (targ.Yaw - (Rotation.Yaw & 65535)) & 65535;
		return !((YawErr < 2000) || (YawErr > 64535));
	}

Begin:
	While( True )
	{
		Acceleration = vect(0,0,0);

        if( MGLostSightTimeout > 0 && Level.TimeSeconds > MGLostSightTimeout )
        {
            bShotAnim = true;
			Acceleration = vect(0,0,0);
			SetAnimAction('RangedFireMGEnd'); //Ranged Anims
			HandleWaitForAnim('RangedFireMGEnd'); //Ranged Anims
			GoToState('');
        }

		if( MGFireCounter <= 0 )
		{
			bShotAnim = true;
			Acceleration = vect(0,0,0);
			SetAnimAction('RangedFireMGEnd'); //Ranged Anims
			HandleWaitForAnim('RangedFireMGEnd'); //Ranged Anims
			GoToState('');
		}
		
		if( bFireAtWill )
			FireMGShot();
		Sleep(MGFireRate); //0.05//Uses our own fire rate set in the base file
	}
}


simulated function PostNetReceive()
{
	if( bClientMiniGunning != bMinigunning )
	{
        bClientMiniGunning = bMinigunning;
        // Hack so Patriarch won't go out of MG Firing to play his idle anim online
        if( bMinigunning )
        {
			//Make sure all of these are RangedPound Anims
        	IdleHeavyAnim='RangedFireMG';
        	IdleRifleAnim='RangedFireMG';
        	IdleCrouchAnim='RangedFireMG';
        	IdleWeaponAnim='RangedFireMG';
        	IdleRestAnim='RangedFireMG';
        }
        else
        {
        	IdleHeavyAnim='RangedIdle';
        	IdleRifleAnim='RangedIdle';
        	IdleCrouchAnim='RangedIdle';
        	IdleWeaponAnim='RangedIdle';
        	IdleRestAnim='RangedIdle';
        }
	}

	//We just need this, the else if portion in the retail version is unnecessary
	if( TraceHitPos!=vect(0,0,0) )
	{
		AddTraceHitFX(TraceHitPos);
		TraceHitPos = vect(0,0,0);
	}
}

//Overhauled with KFMod Code
simulated function int DoAnimAction( name AnimName )
{
	//Removed boss anims and replaced with Ranged
	if( AnimName=='PoundPunch2' || AnimName=='RangedHitF' || AnimName=='RangedFireMG'  )
	{
		AnimBlendParams(1, 1.0, 0.0,, 'Bip01 Spine1');
		PlayAnim(AnimName,, 0.0, 1);
		Return 1;
	}
	Return Super.DoAnimAction(AnimName);
}

//We need this retail Code
simulated event SetAnimAction(name NewAction)
{
	local int meleeAnimIndex;

	if( NewAction=='' )
		Return;
	if(NewAction == 'Claw')
	{
		meleeAnimIndex = Rand(3);
		NewAction = meleeAnims[meleeAnimIndex];
		CurrentDamtype = ZombieDamType[meleeAnimIndex];
	}

	ExpectingChannel = DoAnimAction(NewAction);

    if( Controller != none )
    {
	   RangedPoundZombieControllerOS(Controller).AnimWaitChannel = ExpectingChannel; //BossZombieController to RangedPoundZombieControllerOS
	}

    if( AnimNeedsWait(NewAction) )
    {
        bWaitForAnim = true;
    }
    else
    {
        bWaitForAnim = false;
    }

	if( Level.NetMode!=NM_Client )
	{
		AnimAction = NewAction;
		bResetAnimAct = True;

        ResetAnimActTime = Level.TimeSeconds+0.3;
	}
}

//We need this retail code
simulated function HandleWaitForAnim( name NewAnim )
{
    local float RageAnimDur;

    Controller.GoToState('WaitForAnim');
	RageAnimDur = GetAnimDuration(NewAnim);

	//RangedPound controller
    RangedPoundZombieControllerOS(Controller).SetWaitForAnimTimout(RageAnimDur,NewAnim); //BossZombieController to BossZombieControllerOS
}

//We need this retail code
// The animation is full body and should set the bWaitForAnim flag
simulated function bool AnimNeedsWait(name TestAnim)
{
	//Removed the extra patty anims
    if( TestAnim == 'RangedFireMG' || TestAnim == 'RangedPreFireMG' || TestAnim == 'RangedFireMGEnd' ) 
    {
        return true;
    }

    return false;
}


// We can Flipover as were considered "Husks"
// High damage was taken, make em fall over.
function bool FlipOver()
{
	//Ranged Pound has a unique animation for getting stunned
	SetAnimAction('RangedKnockDown');
	return true;
	super.FlipOver();
}

//Overhauled with Husk code
function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType, optional int HitIndex)
{
	// Reduced damage from fire
	if (DamageType == class 'DamTypeBurned' || DamageType == class 'DamTypeFlamethrower')
	{
		Damage *= BurnDamageScale;
	}

	Super.TakeDamage(Damage,instigatedBy,hitlocation,momentum,damageType,HitIndex);
}

//Precache KFMod textures
static simulated function PreCacheMaterials(LevelInfo myLevel)
{//should be derived and used.
	myLevel.AddPrecacheMaterial(Shader'KFOldSchoolZeds_Textures.Fleshpound.PoundBitsShader');
	myLevel.AddPrecacheMaterial(Texture'KFOldSchoolZeds_Textures.GunPound.AutoTurretGunTex');
	myLevel.AddPrecacheMaterial(Texture'KFOldSchoolZeds_Textures.GunPound.GunPoundSkin');
}

defaultproperties
{
	//-------------------------------------------------------------------------------
	// NOTE: Most Default Properties are set in the base class to eliminate hitching
	//-------------------------------------------------------------------------------
	
	//Use Rangedpound controller
	ControllerClass=Class'KFOldSchoolZedsChar.RangedPoundZombieControllerOS'
}
