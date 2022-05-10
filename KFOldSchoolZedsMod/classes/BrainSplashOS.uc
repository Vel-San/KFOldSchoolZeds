class BrainSplash extends Emitter; //KFBloodPuff

defaultproperties
{
    Begin Object Class=SpriteEmitter Name=SpriteEmitter21
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
        MaxParticles=4
        Name="SpriteEmitter21"
        StartLocationRange=(X=(Min=10.000000,Max=10.000000))
        UseRotationFrom=PTRS_Actor
        StartSpinRange=(X=(Min=0.500000,Max=0.500000))
        SizeScale(0)=(RelativeSize=0.150000)
        SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
        StartSizeRange=(X=(Min=25.000000,Max=25.000000),Y=(Min=25.000000,Max=25.000000),Z=(Min=25.000000,Max=25.000000))
        InitialParticlesPerSecond=1000.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_diff'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.500000,Max=0.750000)
        StartVelocityRange=(X=(Min=-60.000000,Max=-40.000000),Y=(Min=-60.000000,Max=40.000000),Z=(Max=75.000000))
        MaxAbsVelocity=(X=1000.000000,Y=1000.000000,Z=1000.000000)
        GetVelocityDirectionFrom=PTVD_OwnerAndStartPosition
    End Object
    Emitters(0)=SpriteEmitter'SpriteEmitter21'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter22
        RespawnDeadParticles=False
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        Acceleration=(Z=-200.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        FadeOutStartTime=0.750000
        MaxParticles=4
        Name="SpriteEmitter22"
        UseRotationFrom=PTRS_Actor
        StartSpinRange=(X=(Min=-180.000000,Max=180.000000),Y=(Min=-180.000000,Max=180.000000),Z=(Min=-180.000000,Max=180.000000))
        SizeScale(0)=(RelativeSize=0.150000)
        SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
        StartSizeRange=(X=(Min=25.000000,Max=25.000000),Y=(Min=25.000000,Max=25.000000),Z=(Min=25.000000,Max=25.000000))
        InitialParticlesPerSecond=1000.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_diff'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.500000,Max=0.750000)
        StartVelocityRange=(X=(Min=-75.000000,Max=-150.000000),Z=(Max=75.000000))
    End Object
    Emitters(1)=SpriteEmitter'SpriteEmitter22'

	AutoDestroy=True
    Style=STY_Alpha
    bDirectional=True
    bNoDelete=false
    //required because this is spawned on server during netplay.
    RemoteRole=ROLE_DumbProxy
    //make sure initial rotation is replicated
    bNetInitialRotation=true
    LifeSpan = 1.5


}
