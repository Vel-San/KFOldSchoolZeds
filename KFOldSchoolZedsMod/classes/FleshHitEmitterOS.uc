class FleshHitEmitter extends KFHitEmitter;
     #exec OBJ LOAD FILE=KFWeaponSound.uax

defaultproperties
{
     ImpactSounds(0)=Sound'KFPawnDamageSound.MeleeDamageSounds.bathitflesh'
     ImpactSounds(1)=Sound'KFPawnDamageSound.MeleeDamageSounds.bathitflesh'
     ImpactSounds(2)=Sound'KFPawnDamageSound.MeleeDamageSounds.bathitflesh2'
     ImpactSounds(3)=Sound'KFPawnDamageSound.MeleeDamageSounds.bathitflesh3'


//       Begin Object Class=SpriteEmitter Name=SpriteEmitter0
//    FadeOut=True
//    SpawnOnlyInDirectionOfNormal=True
//    SpinParticles=True
//    UseSizeScale=True
//    UseRegularSizeScale=False
//    UniformSize=True
//    AutomaticInitialSpawning = false
//    InitialParticlesPerSecond = 100
//    RespawnDeadParticles = false
//    ScaleSizeYByVelocity=True
//    ScaleSizeZByVelocity=True
//    BlendBetweenSubdivisions=True
//    UseRandomSubdivision=True
//    Acceleration=(Z=-350.000000)
//    ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
//    ColorScale(2)=(RelativeTime=0.750000,Color=(B=96,G=160,R=255))
//    ColorScale(3)=(RelativeTime=1.000000)
//    ColorMultiplierRange=(Z=(Min=0.670000,Max=2.000000))
//    FadeOutStartTime=0.300000
//    Name="SpriteEmitter0"
//    StartLocationShape=PTLS_Sphere
//    SphereRadiusRange=(Max=5.000000)
//    StartMassRange=(Min=11.000000,Max=11.000000)
//    UseRotationFrom=PTRS_Normal
//    SpinsPerSecondRange=(X=(Min=0.100000,Max=0.120000))
//    SizeScale(0)=(RelativeTime=1.000000,RelativeSize=3.500000)
//    StartSizeRange=(X=(Min=8.000000,Max=12.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
//    ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
//    ScaleSizeByVelocityMax=3.000000
//    DrawStyle=PTDS_Modulated //PTDS_AlphaBlend
//    Texture=Texture'KFX.BloodySpray'
//    TextureUSubdivisions=4
//    TextureVSubdivisions=4
//    LifetimeRange=(Min=0.500000,Max=0.750000)
//    StartVelocityRange=(Z=(Min=120.000000,Max=150.000000))
//End Object

    Begin Object Class=SpriteEmitter Name=SpriteEmitter1
        FadeOut=True
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
        UseRandomSubdivision=True
        Acceleration=(Z=-200.000000)
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.750000,Color=(B=96,G=160,R=255))
        ColorScale(3)=(RelativeTime=1.000000)
        FadeOutStartTime=0.300000
        MaxParticles=1
        Name="SpriteEmitter1"
        StartLocationShape=PTLS_Sphere
        SphereRadiusRange=(Max=5.000000)
        StartMassRange=(Min=11.000000,Max=11.000000)
        UseRotationFrom=PTRS_Normal
        SpinsPerSecondRange=(X=(Min=-0.100000,Max=0.100000))
        StartSpinRange=(X=(Min=0.400000,Max=0.600000))
        SizeScale(0)=(RelativeSize=1.000000)
        SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.500000)
        StartSizeRange=(X=(Min=8.000000,Max=12.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=3.000000
        InitialParticlesPerSecond=500.000000
        DrawStyle=PTDS_Alpha
        Texture=Texture'kf_fx_trip_t.Gore.blood_hit_c'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        UseSubdivisionScale=True
        SubdivisionScale(0)=0.250000
        SubdivisionScale(1)=0.500000
        SubdivisionScale(2)=0.750000
        SubdivisionScale(3)=1.000000
        SubdivisionEnd=3
        LifetimeRange=(Min=0.500000,Max=1.000000)
        StartVelocityRange=(Z=(Min=100.000000,Max=100.000000))
    End Object
    Emitters(0)=SpriteEmitter'SpriteEmitter1'


//     Emitters(0)=SpriteEmitter'KFMod.FleshHitEmitter.SpriteEmitter0'
//     LifeSpan = 1.0

}
