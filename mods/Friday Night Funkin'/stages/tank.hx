
var tankAngle:Float = FlxG.random.int(-90, 45);
var tankSpeed:Float = FlxG.random.float(5, 7);
var tankRolling:FlxSprite = null;

function createAfterChars() {
    PlayState.boyfriend.x += 40;
    PlayState.dad.y += 60;
    PlayState.dad.x -= 80;
    //gf.x -= 30 + Std.int(gf.width / 4);
    //gf.y += 10;
    if (PlayState.gf.curCharacter == "pico-speakers") {
        PlayState.gf.x -= 30;
        PlayState.gf.y -= 200;
    } else {
        PlayState.gf.x -= 170;
        PlayState.gf.y -= 75;
    }
}

function create() {
    if (PlayState_.SONG.song == "stress") {
        gfVersion = "pico-speakers";
    } else {
        gfVersion = "gf-tankmen";
    }
    PlayState.defaultCamZoom = 0.90;

    var tankBg:FlxSprite = new FlxSprite(-500, 0).loadGraphic(Paths.image('tank/tankBg'));
    tankBg.scrollFactor.set(0,0);
    tankBg.setGraphicSize(2560, 1920);
    tankBg.updateHitbox();
    //tankBg.antialiasing = true;
    PlayState.add(tankBg);

    var tankSky:FlxSprite = new FlxSprite(-400, -600).loadGraphic(Paths.image('tank/tankSky'));
    tankSky.scrollFactor.set(0,0);
    tankSky.antialiasing = true;
    PlayState.add(tankSky);

    var tankClouds:FlxSprite = new FlxSprite(FlxG.random.int(-700, -100), FlxG.random.int(-20, 20)).loadGraphic(Paths.image('tank/tankClouds'));
    tankClouds.scrollFactor.set(0.1,0.1);
    tankClouds.antialiasing = true;
    tankClouds.velocity.x = FlxG.random.float(5, 15);
    PlayState.add(tankClouds);

    var tankMountains:FlxSprite = new FlxSprite(-300, -20).loadGraphic(Paths.image('tank/tankMountains'));
    tankMountains.setGraphicSize(Std.int(tankMountains.width * 1.2));
    tankMountains.scrollFactor.set(0.2,0.2);
    tankMountains.updateHitbox();
    tankMountains.antialiasing = true;
    PlayState.add(tankMountains);

    var tankBuildings:FlxSprite = new FlxSprite(-300, -20).loadGraphic(Paths.image('tank/tankBuildings'));
    tankBuildings.setGraphicSize(Std.int(tankBuildings.width * 1.1));
    tankBuildings.scrollFactor.set(0.3,0.3);
    tankBuildings.updateHitbox();
    tankBuildings.antialiasing = true;
    PlayState.add(tankBuildings);

    var tankRuins:FlxSprite = new FlxSprite(-200, 0).loadGraphic(Paths.image('tank/tankRuins'));
    tankRuins.setGraphicSize(Std.int(tankRuins.width * 1.1));
    tankRuins.scrollFactor.set(0.35,0.35);
    tankRuins.updateHitbox();
    tankRuins.antialiasing = true;
    PlayState.add(tankRuins);

    var smokeLeftTex = Paths.getSparrowAtlas('tank/smokeLeft');
    var smokeLeft = new FlxSprite(-200, -100);
    smokeLeft.scrollFactor.set(0.4,0.4);
    smokeLeft.frames = smokeLeftTex;
    smokeLeft.animation.addByPrefix('SmokeBlurLeft', "SmokeBlurLeft", 24);
    smokeLeft.animation.play('SmokeBlurLeft');
    smokeLeft.antialiasing = true;
    PlayState.add(smokeLeft);

    var smokeRightTex = Paths.getSparrowAtlas('tank/smokeRight');
    var smokeRight = new FlxSprite(1100, -100);
    smokeRight.scrollFactor.set(0.4,0.4);
    smokeRight.frames = smokeRightTex;
    smokeRight.animation.addByPrefix('SmokeRight', "SmokeRight", 24);
    smokeRight.animation.play('SmokeRight');
    smokeRight.antialiasing = true;
    PlayState.add(smokeRight);

    var tankWatchtowerTex = Paths.getSparrowAtlas('tank/tankWatchtower');
    var tankWatchtower = new FlxSprite(100, 50);
    tankWatchtower.scrollFactor.set(0.5,0.5);
    tankWatchtower.frames = tankWatchtowerTex;
    tankWatchtower.animation.addByPrefix('watchtower gradient color', "watchtower gradient color", 24);
    tankWatchtower.animation.play('watchtower gradient color');
    tankWatchtower.antialiasing = true;
    PlayState.add(tankWatchtower);

    var tankRollingTex = Paths.getSparrowAtlas('tank/tankRolling');
    tankRolling = new FlxSprite(300, 300);
    tankRolling.scrollFactor.set(0.5,0.5);
    tankRolling.frames = tankRollingTex;
    tankRolling.animation.addByPrefix('BG tank w lighting instance 1', "BG tank w lighting instance 1", 24);
    tankRolling.animation.play('BG tank w lighting instance 1');
    tankRolling.antialiasing = true;
    #if debug
    FlxG.watch.PlayState.add(tankRolling, 'x');
    FlxG.watch.PlayState.add(tankRolling, 'y');
    FlxG.watch.PlayState.add(this, 'tankAngle');
    FlxG.watch.PlayState.add(this, 'tankSpeed');
    #end
    PlayState.add(tankRolling);

    // if (SONG.song.toLowerCase() == "stress") {
    //     tankmanRun = new FlxTypedGroup<FlxSprite>();
    //     for(i in 0...10) {
    //         var direction:Bool = (i % 2 == 0);
    //         var johnShotNumber = FlxG.random.int(1, 2);
    //         var tankmanThatIsRunning:FlxSprite = new FlxSprite(400 + (!direction ? -750 : 750), 170);
    //         tankmanThatIsRunning.frames = Paths.getSparrowAtlas('tank/tankmanKilled1');
    //         tankmanThatIsRunning.animation.addByPrefix("run", "tankman running", 24);
    //         tankmanThatIsRunning.animation.addByPrefix("shot", "John Shot " + johnShotNumber, 24, false);
    //         tankmanThatIsRunning.setGraphicSize(Std.int(tankmanThatIsRunning.width * 0.8));
    //         tankmanThatIsRunning.scrollFactor.set(0.95, 0.95);
    //         tankmanThatIsRunning.antialiasing = true;
    //         //tankmanThatIsRunning.velocity.x = !direction ? 400 : -400;
    //         tankmanThatIsRunning.flipX = !direction;
    //         tankmanThatIsRunning.alpha = 0;
            
    //         tankmanThatIsRunning.animation.play("run");
    //     }
    //     PlayState.add(tankmanRun);
    // }

    var tankGround:FlxSprite = new FlxSprite(-420, -150).loadGraphic(Paths.image('tank/tankGround'));
    //tankRuins.scrollFactor.set(,0.35);
    tankGround.setGraphicSize(Std.int(tankGround.width * 1.15));
    tankGround.updateHitbox();
    tankGround.antialiasing = true;
    PlayState.add(tankGround);
}

function update(elapsed) {
    //updates the background tank
    tankAngle += elapsed * tankSpeed;
    tankRolling.angle = tankAngle - 90 + 15;
    tankRolling.x = 400 + (1000 * Math.cos(Math.PI / 180 * (1 * tankAngle + 180)));
    tankRolling.y = 700 + (500 * Math.sin(Math.PI / 180 * (1 * tankAngle + 180)));
}
function createInFront() {
    var tank0Tex = Paths.getSparrowAtlas('tank/tank0');
    var tank0 = new FlxSprite(-500, 650);
    tank0.scrollFactor.set(1.7,1.5);
    tank0.frames = tank0Tex;
    tank0.animation.addByPrefix('fg', "fg", 24);
    tank0.animation.play('fg');
    tank0.antialiasing = true;
    PlayState.add(tank0);

    var tank1Tex = Paths.getSparrowAtlas('tank/tank1');
    var tank1 = new FlxSprite(-300, 750);
    tank1.scrollFactor.set(2,0.2);
    tank1.frames = tank1Tex;
    tank1.animation.addByPrefix('fg', "fg", 24);
    tank1.animation.play('fg');
    tank1.antialiasing = true;
    PlayState.add(tank1);

    var tank2Tex = Paths.getSparrowAtlas('tank/tank2');
    var tank2 = new FlxSprite(450, 940);
    tank2.scrollFactor.set(1.5,1.5);
    tank2.frames = tank2Tex;
    tank2.animation.addByPrefix('foreground', "foreground", 24);
    tank2.animation.play('foreground');
    tank2.antialiasing = true;
    PlayState.add(tank2);

    var tank4Tex = Paths.getSparrowAtlas('tank/tank4');
    var tank4 = new FlxSprite(1300, 900);
    tank4.scrollFactor.set(1.5,1.5);
    tank4.frames = tank4Tex;
    tank4.animation.addByPrefix('fg', "fg", 24);
    tank4.animation.play('fg');
    tank4.antialiasing = true;
    PlayState.add(tank4);

    var tank5Tex = Paths.getSparrowAtlas('tank/tank5');
    var tank5 = new FlxSprite(1620, 700);
    tank5.scrollFactor.set(1.5,1.5);
    tank5.frames = tank5Tex;
    tank5.animation.addByPrefix('fg', "fg", 24);
    tank5.animation.play('fg');
    tank5.antialiasing = true;
    PlayState.add(tank5);

    var tank3Tex = Paths.getSparrowAtlas('tank/tank3');
    var tank3 = new FlxSprite(1300, 1200);
    tank3.scrollFactor.set(3.5,2.5);
    tank3.frames = tank3Tex;
    tank3.animation.addByPrefix('fg', "fg", 24);
    tank3.animation.play('fg');
    tank3.antialiasing = true;
    PlayState.add(tank3);
}