// KFMod BloodJet
class BloodJetOS extends xEmitter;

// TODO: Import necessary file from this package
// Into KFOldSchoolZeds_Textures, and load it too.
#exec OBJ LOAD File=KFOldSchoolZeds_Textures.utx

var class<ProjectedDecal> SplatterClass;

state Ticking
{
	simulated function Tick( float dt )
	{
		if( LifeSpan < 1.0 )
		{
			mRegenRange[0] *= LifeSpan;
			mRegenRange[1] = mRegenRange[0];
		}
	}
}

simulated function timer()
{
	GotoState('Ticking');
}

simulated function PostNetBeginPlay()
{
	SetTimer(LifeSpan - 1.0,false);
	if ( Level.NetMode != NM_DedicatedServer )
		WallSplat();
	Super.PostNetBeginPlay();
}

simulated function WallSplat()
{
	local vector WallHit, WallNormal;
	local Actor WallActor;

	if ( FRand() > 0.8 )
		return;
	WallActor = Trace(WallHit, WallNormal, Location + vect(0,0,-200), Location, false);
	if ( WallActor != None )
		spawn(SplatterClass,,,WallHit + 20 * (WallNormal + VRand()), rotator(-WallNormal));
}

defaultproperties
{
	 // Use Old Splatterclass
     SplatterClass=Class'KFOldSchoolZedsMod.BloodSplatterOS'
     mRegenPause=True
     mRegenOnTime(0)=1.000000
     mRegenOnTime(1)=2.000000
     mRegenOffTime(0)=0.400000
     mRegenOffTime(1)=1.000000
     mStartParticles=0
     mMaxParticles=60
     mLifeRange(0)=1.000000
     mLifeRange(1)=1.000000
     mRegenRange(0)=80.000000
     mRegenRange(1)=80.000000
     mDirDev=(X=0.050000,Y=0.050000,Z=0.050000)
     mSpeedRange(0)=50.000000
     mSpeedRange(1)=90.000000
     mMassRange(0)=0.400000
     mMassRange(1)=0.500000
     mAirResistance=0.600000
     mRandOrient=True
     mSizeRange(0)=1.500000
     mSizeRange(1)=2.500000
     mGrowthRate=12.000000
     mRandTextures=True
     mNumTileColumns=4
     mNumTileRows=4
     LifeSpan=3.500000	
	 // Texture originally from UT2004	 
     Skins(0)=Texture'KFOldSchoolZeds_Textures.Shared.BloodJetc'
     Style=STY_Alpha	 
}
