//=============================================================================
// KF GibJet.      This streaks after bits of flesh. Yum.
//=============================================================================
class KFGibJet extends Emitter;

defaultproperties
{
//     mMaxParticles=40
//     mNumTileColumns = 2
//     mNumTileRows = 2
//     mLifeRange(0)=2.500000
//     mLifeRange(1)=3.000000
//     mColorRange(0)=(B=120,G=120,R=120)
//     mColorRange(1)=(B=120,G=120,R=120)
//     Skins(0)=Texture'kf_fx_trip_t.Gore.blood_drips'
//     bUnlit=False
//     Style= STY_Modulated
//     mGrowthRate=2.0
//     mAirResistance=0.25
//
//     mRegenRange(0)=40.000000
//	 mRegenRange(1)=40.000000
//     mRegenOnTime(0)=2.0
//	 mRegenOnTime(1)=3.0
//	 mRegenOffTime(0)=1.0
//	 mRegenOffTime(1)=2.0
//
//     LifeSpan=6

    Begin Object Class=SpriteEmitter Name=SpriteEmitter29
        ResetAfterChange=True
        RespawnDeadParticles=False
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        Acceleration=(Z=-50.000000)
        ColorScale(0)=(Color=(B=250,G=250,R=250))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        FadeOutStartTime=0.750000
        MaxParticles=32
        Name="SpriteEmitter29"
        StartLocationShape=PTLS_Sphere
        UseRotationFrom=PTRS_Actor
        StartSpinRange=(X=(Min=0.500000,Max=0.500000))
        SizeScale(0)=(RelativeSize=0.150000)
        SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
        StartSizeRange=(X=(Min=25.000000,Max=25.000000),Y=(Min=25.000000,Max=25.000000),Z=(Min=25.000000,Max=25.000000))
        InitialParticlesPerSecond=4.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_diff'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.500000,Max=0.750000)
        StartVelocityRange=(X=(Min=-60.000000,Max=-40.000000),Y=(Min=-60.000000,Max=40.000000),Z=(Max=75.000000))
        MaxAbsVelocity=(X=1000.000000,Y=1000.000000,Z=1000.000000)
        GetVelocityDirectionFrom=PTVD_OwnerAndStartPosition
    End Object
    Emitters(0)=SpriteEmitter'SpriteEmitter29'

}
