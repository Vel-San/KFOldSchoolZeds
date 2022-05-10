class BileExplosion extends FleshHitEmitter;

defaultproperties
{
    Begin Object Class=SpriteEmitter Name=SpriteEmitter103
        FadeOut=True
        RespawnDeadParticles=False
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        Acceleration=(Z=-500.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        FadeOutStartTime=0.200000
        MaxParticles=2
        Name="SpriteEmitter103"
        SizeScale(1)=(RelativeTime=0.070000,RelativeSize=1.000000)
        SizeScale(2)=(RelativeTime=1.000000,RelativeSize=2.000000)
        InitialParticlesPerSecond=1000.000000
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'kf_fx_trip_t.Gore.bloat_explode_blood'
        LifetimeRange=(Min=1.000000,Max=1.000000)
        StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=150.000000,Max=300.000000))
    End Object
    Emitters(0)=SpriteEmitter'SpriteEmitter103'

    Begin Object Class=MeshEmitter Name=MeshEmitter24
        StaticMesh=StaticMesh'kf_gore_trip_sm.limbs.bloat_arm_resource'
        UseCollision=True
        RespawnDeadParticles=False
        SpinParticles=True
        DampRotation=True
        AutomaticInitialSpawning=False
        Acceleration=(Z=-1000.000000)
        DampingFactorRange=(X=(Min=0.200000,Max=0.500000),Y=(Min=0.200000,Max=0.500000),Z=(Min=0.200000,Max=0.500000))
        MaxCollisions=(Max=2.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        MaxParticles=1
        Name="MeshEmitter24"
        StartLocationRange=(Z=(Min=10.000000,Max=64.000000))
        SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSpinRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSizeRange=(X=(Min=1.150000,Max=1.150000),Y=(Min=1.150000,Max=1.150000),Z=(Min=1.150000,Max=1.150000))
        InitialParticlesPerSecond=1000.000000
        LifetimeRange=(Min=10.000000,Max=10.000000)
        StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=250.000000,Max=500.000000))
    End Object
    Emitters(1)=MeshEmitter'MeshEmitter24'

    Begin Object Class=MeshEmitter Name=MeshEmitter25
        StaticMesh=StaticMesh'EffectsSM.PlayerGibbs.Chunk1_Gibb'
        UseCollision=True
        RespawnDeadParticles=False
        SpinParticles=True
        DampRotation=True
        AutomaticInitialSpawning=False
        Acceleration=(Z=-1000.000000)
        DampingFactorRange=(X=(Min=0.200000,Max=0.500000),Y=(Min=0.200000,Max=0.500000),Z=(Min=0.200000,Max=0.500000))
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        MaxParticles=30
        Name="MeshEmitter25"
        SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSpinRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSizeRange=(X=(Min=0.500000,Max=2.000000),Y=(Min=0.500000,Max=2.000000),Z=(Min=0.500000,Max=2.000000))
        InitialParticlesPerSecond=1000.000000
        LifetimeRange=(Min=10.000000,Max=10.000000)
        StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=1000.000000))
        VelocityLossRange=(Z=(Min=1.000000,Max=1.000000))
    End Object
    Emitters(2)=MeshEmitter'MeshEmitter25'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter109
        RespawnDeadParticles=False
        SpawnOnlyInDirectionOfNormal=True
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        ScaleSizeYByVelocity=True
        ScaleSizeZByVelocity=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        Acceleration=(Z=-200.000000)
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.750000,Color=(B=96,G=160,R=255))
        ColorScale(3)=(RelativeTime=1.000000)
        FadeOutStartTime=1.000000
        MaxParticles=8
        Name="SpriteEmitter109"
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Max=5.000000)
        StartMassRange=(Min=11.000000,Max=11.000000)
        UseRotationFrom=PTRS_Normal
        SpinsPerSecondRange=(X=(Min=-0.300000,Max=0.300000))
        StartSpinRange=(X=(Min=-0.500000,Max=0.500000))
        SizeScale(0)=(RelativeSize=1.000000)
        SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.500000)
        StartSizeRange=(X=(Min=30.000000,Max=30.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=3.000000
        InitialParticlesPerSecond=500.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_b_diff'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.500000,Max=0.500000)
        StartVelocityRange=(X=(Min=-150.000000,Max=150.000000),Y=(Min=-150.000000,Max=150.000000),Z=(Min=100.000000,Max=100.000000))
    End Object
    Emitters(3)=SpriteEmitter'SpriteEmitter109'

    Begin Object Class=MeshEmitter Name=MeshEmitter26
        StaticMesh=StaticMesh'kf_gore_trip_sm.limbs.bloat_arm_resource'
        UseCollision=True
        RespawnDeadParticles=False
        SpinParticles=True
        DampRotation=True
        AutomaticInitialSpawning=False
        Acceleration=(Z=-1000.000000)
        DampingFactorRange=(X=(Min=0.200000,Max=0.500000),Y=(Min=0.200000,Max=0.500000),Z=(Min=0.200000,Max=0.500000))
        MaxCollisions=(Max=2.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        MaxParticles=1
        Name="MeshEmitter26"
        StartLocationRange=(X=(Min=-16.000000,Max=16.000000),Y=(Min=-16.000000,Max=16.000000),Z=(Min=12.000000,Max=64.000000))
        SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSpinRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSizeRange=(X=(Min=1.150000,Max=1.150000),Y=(Min=1.150000,Max=1.150000),Z=(Min=1.150000,Max=1.150000))
        InitialParticlesPerSecond=1000.000000
        LifetimeRange=(Min=10.000000,Max=10.000000)
        StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=250.000000,Max=500.000000))
    End Object
    Emitters(4)=MeshEmitter'MeshEmitter26'

    Begin Object Class=MeshEmitter Name=MeshEmitter27
        StaticMesh=StaticMesh'kf_gore_trip_sm.limbs.bloat_head'
        UseCollision=True
        RespawnDeadParticles=False
        SpinParticles=True
        DampRotation=True
        AutomaticInitialSpawning=False
        Acceleration=(Z=-1000.000000)
        DampingFactorRange=(X=(Min=0.200000,Max=0.500000),Y=(Min=0.200000,Max=0.500000),Z=(Min=0.200000,Max=0.500000))
        MaxCollisions=(Max=2.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        MaxParticles=1
        Name="MeshEmitter27"
        StartLocationRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=90.000000,Max=90.000000))
        SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSpinRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSizeRange=(X=(Min=1.150000,Max=1.150000),Y=(Min=1.150000,Max=1.150000),Z=(Min=1.150000,Max=1.150000))
        InitialParticlesPerSecond=1000.000000
        LifetimeRange=(Min=10.000000,Max=10.000000)
        StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=250.000000,Max=500.000000))
    End Object
    Emitters(5)=MeshEmitter'MeshEmitter27'

    Begin Object Class=MeshEmitter Name=MeshEmitter28
        StaticMesh=StaticMesh'kf_gore_trip_sm.gibbs.intestines'
        UseCollision=True
        RespawnDeadParticles=False
        SpinParticles=True
        DampRotation=True
        AutomaticInitialSpawning=False
        Acceleration=(Z=-1000.000000)
        DampingFactorRange=(X=(Min=0.200000,Max=0.500000),Y=(Min=0.200000,Max=0.500000),Z=(Min=0.200000,Max=0.500000))
        MaxCollisions=(Max=2.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        MaxParticles=1
        Name="MeshEmitter28"
        SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        StartSpinRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
        InitialParticlesPerSecond=1000.000000
        DrawStyle=PTDS_Regular
        StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=250.000000,Max=500.000000))
    End Object
    Emitters(6)=MeshEmitter'MeshEmitter28'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter113
        RespawnDeadParticles=False
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.750000,Color=(B=255,G=255,R=255))
        ColorScale(3)=(RelativeTime=1.000000)
        FadeOutStartTime=0.850000
        MaxParticles=30
        Name="SpriteEmitter113"
        AddLocationFromOtherEmitter=1
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Max=1.000000)
        SpinsPerSecondRange=(X=(Max=0.070000))
        StartSpinRange=(X=(Max=1.000000))
        SizeScale(0)=(RelativeTime=1.000000,RelativeSize=1.250000)
        StartSizeRange=(X=(Min=10.000000,Max=20.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=0.000000
        InitialParticlesPerSecond=30.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_e_diff'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        SecondsBeforeInactive=30.000000
        LifetimeRange=(Min=0.450000,Max=0.850000)
        StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=2.000000,Max=25.000000))
        MaxAbsVelocity=(X=100.000000,Y=100.000000,Z=100.000000)
    End Object
    Emitters(7)=SpriteEmitter'SpriteEmitter113'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter114
        RespawnDeadParticles=False
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.750000,Color=(B=255,G=255,R=255))
        ColorScale(3)=(RelativeTime=1.000000)
        FadeOutStartTime=0.850000
        MaxParticles=60
        Name="SpriteEmitter114"
        AddLocationFromOtherEmitter=2
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Max=1.000000)
        SpinsPerSecondRange=(X=(Max=0.070000))
        StartSpinRange=(X=(Max=1.000000))
        SizeScale(0)=(RelativeTime=1.000000,RelativeSize=1.250000)
        StartSizeRange=(X=(Min=10.000000,Max=20.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=0.000000
        InitialParticlesPerSecond=60.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_e_diff'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        SecondsBeforeInactive=30.000000
        LifetimeRange=(Min=0.450000,Max=0.850000)
        StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=2.000000,Max=25.000000))
        MaxAbsVelocity=(X=100.000000,Y=100.000000,Z=100.000000)
    End Object
    Emitters(8)=SpriteEmitter'SpriteEmitter114'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter115
        RespawnDeadParticles=False
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.750000,Color=(B=255,G=255,R=255))
        ColorScale(3)=(RelativeTime=1.000000)
        FadeOutStartTime=0.850000
        MaxParticles=30
        Name="SpriteEmitter115"
        AddLocationFromOtherEmitter=4
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Max=1.000000)
        SpinsPerSecondRange=(X=(Max=0.070000))
        StartSpinRange=(X=(Max=1.000000))
        SizeScale(0)=(RelativeTime=1.000000,RelativeSize=1.250000)
        StartSizeRange=(X=(Min=10.000000,Max=20.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=0.000000
        InitialParticlesPerSecond=30.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_e_diff'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        SecondsBeforeInactive=30.000000
        LifetimeRange=(Min=0.450000,Max=0.850000)
        StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=2.000000,Max=25.000000))
        MaxAbsVelocity=(X=100.000000,Y=100.000000,Z=100.000000)
    End Object
    Emitters(9)=SpriteEmitter'SpriteEmitter115'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter116
        RespawnDeadParticles=False
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        BlendBetweenSubdivisions=True
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.750000,Color=(B=255,G=255,R=255))
        ColorScale(3)=(RelativeTime=1.000000)
        FadeOutStartTime=0.850000
        MaxParticles=30
        Name="SpriteEmitter116"
        AddLocationFromOtherEmitter=5
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Max=1.000000)
        SpinsPerSecondRange=(X=(Max=0.070000))
        StartSpinRange=(X=(Max=1.000000))
        SizeScale(0)=(RelativeTime=1.000000,RelativeSize=1.250000)
        StartSizeRange=(X=(Min=10.000000,Max=20.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=0.000000
        InitialParticlesPerSecond=30.000000
        DrawStyle=PTDS_Modulated
        Texture=Texture'kf_fx_trip_t.Gore.kf_bloodspray_e_diff'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        SecondsBeforeInactive=30.000000
        LifetimeRange=(Min=0.450000,Max=0.850000)
        StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=2.000000,Max=25.000000))
        MaxAbsVelocity=(X=100.000000,Y=100.000000,Z=100.000000)
    End Object
    Emitters(10)=SpriteEmitter'SpriteEmitter116'

	AutoDestroy=False
//    Style=STY_Masked
    bUnlit=false
    bDirectional=True
    bNoDelete=false
    RemoteRole=ROLE_None
//    bNetTemporary=true
    LifeSpan = 10
}
