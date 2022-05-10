class KFGibBrain extends KFGib;

defaultproperties
{
     GibGroupClass=Class'KFMod.KFHumanGibGroup'
     TrailClass=Class'ROEffects.BloodTrail'
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.Gib1'
     LifeSpan=6.000000
     DrawScale=0.300000
     Skins(0)=Texture'KillingFloorTextures.Statics.GibsSKin'
     bUnlit=False
     TransientSoundVolume=0.500000
     CollisionRadius=5.000000
     CollisionHeight=2.500000

     HitSounds(0)=sound'KF_EnemyGlobalSnd.Gibs_Small'
}
