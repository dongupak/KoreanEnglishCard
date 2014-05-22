//
//  PuzzleGame.m
//  KoreanEnglishCard
//
//  Created by apple03 on 13. 5. 29..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "PuzzleGame.h"
#import "AppDelegate.h"
#import "GameOverLayer.h"

enum {
    kTagCard = 9000,
    kTagMenu,
    kTagWallBG,
    kTagImage,
    kTagWall1,
    kTagWall2,
    kTagWall3,
    kTagWall4,
    kTagWallGroup,
    kTagStar,
    kTagParticle
};

@implementation PuzzleGame
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PuzzleGame *layer = [PuzzleGame node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                              priority:0
                                                       swallowsTouches:YES];
    [super onEnter];
}

-(id) init

{
    if( (self=[super init]) ) {
        winSize = [[CCDirector sharedDirector] winSize];
        fromdata = [ImageSetData sharedData];
        
        self.isTouchEnabled = YES;
        
        touchedNum = 0;
        
        wallGroup = [CCNode node];
        [self addChild:wallGroup z:kTagWallGroup];
        doNotTouch = YES;
        
        [self settingWall];
        
        ansRand3Num = arc4random() % 3;
        isItKorean = fromdata.isItKorean;
        if (isItKorean) {
            ans = arc4random() % fromdata.kImageNum;
        }
        else {
            ans = arc4random() % fromdata.eImageNum;
        }
        
        [self repeatImageCheck];
        
        NSMutableArray *tmpCards = [NSMutableArray array];
        NSMutableArray *tmpImages = [NSMutableArray array];
        if (isItKorean) {
            tmpCards = [fromdata.kCardSet objectAtIndex:ansRand3Num];
            tmpImages = [fromdata.kImageSet objectAtIndex:ansRand3Num];
        }
        else{
            tmpCards = [fromdata.cardSet objectAtIndex:ansRand3Num];
            tmpImages = [fromdata.imageSet objectAtIndex:ansRand3Num];
        }
        
        
        ansCard = [CCSprite spriteWithSpriteFrame:[tmpCards objectAtIndex:ans]];
        [self addChild:ansCard z:kTagCard];
        ansCard.position = ccp(winSize.width/2, winSize.height/2);
        ansImage = [CCSprite spriteWithSpriteFrame:[tmpImages objectAtIndex:ans]];
        [ansImage setScale:0.8f];
        [self addChild:ansImage z:kTagImage];
        ansImage.position = ccp(winSize.width/2, winSize.height/2.2);
        
        float startOfX = winSize.width / 5.7;
        int jndex = 1;
        for ( ; jndex < fromdata.game2_stage; jndex ++) {
            CCSprite *star = [CCSprite spriteWithFile:@"star_1.png"];
            [star setPosition:ccp(startOfX, winSize.height / 8)];
            [self addChild:star z:kTagStar];
            startOfX = startOfX + winSize.width / 14;
        }
        CCSprite *star = [CCSprite spriteWithFile:@"star_0.png"];
        [star setPosition:ccp(startOfX, winSize.height / 8)];
        [self addChild:star z:kTagStar];
        startOfX = startOfX + winSize.width / 14;
        jndex ++;
        for ( ; jndex < 11; jndex ++) {
            CCSprite *star = [CCSprite spriteWithFile:@"star_2.png"];
            [star setPosition:ccp(startOfX, winSize.height / 8)];
            [self addChild:star z:kTagStar];
            startOfX = startOfX + winSize.width / 14;
        }
        
        
        CCMenuItem *home = [CCMenuItemImage itemWithNormalImage:@"home_light.png" selectedImage:@"home.png" target:self
                                                       selector:@selector(gohome)];
        
        CCMenuItem *back = [CCMenuItemImage itemWithNormalImage:@"back_light.png" selectedImage:@"back.png" target:self
                                                       selector:@selector(goback)];
        
        
        CCMenu *hMenu = [CCMenu menuWithItems:home, nil];
        hMenu.position =ccp(280,440);
        [self addChild:hMenu z:kTagMenu];
        
        CCMenu *bMenu = [CCMenu menuWithItems:back, nil];
        bMenu.position =ccp(40,440);
        [self addChild:bMenu z:kTagMenu];
        soundEffect = [SimpleAudioEngine sharedEngine];
        if ( fromdata.game2_stage == 1) {
            [soundEffect playBackgroundMusic:@"gameBGM.mp3" loop:YES];
            
            [soundEffect setBackgroundMusicVolume:0.2f];
        }
        
        
        
    }
    return self;
}


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:[touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    if ( doNotTouch ){
        int tmptag = 0;
        if (convertedLocation.x > 0 - wall_.contentSize.width /2 &&
            convertedLocation.x < winSize.width /2 + wall_.contentSize.width /2 &&
            convertedLocation.y > 0 - wall_.contentSize.height /2 &&
            convertedLocation.y < winSize.height /2 + wall_.contentSize.height /2)
        {
            if ( convertedLocation.x < winSize.width /2){
                if ( convertedLocation.y > winSize.height/2.2) {
                    tmptag = kTagWall3;
                }
                else if (convertedLocation.y < winSize.height/2.2){
                    particle.position = ccp(wall_.contentSize.width / 4 * 3, wall_.contentSize.height / 4 * 3);
                    tmptag = kTagWall1;
                }
            }
            else if (convertedLocation.x > winSize.width /2){
                if (convertedLocation.y > winSize.height/2.2) {
                    particle.position = ccp(wall_.contentSize.width / 4 , wall_.contentSize.height / 4);
                    tmptag = kTagWall4;
                }
                else if (convertedLocation.y < winSize.height/2.2){
                    particle.position = ccp(wall_.contentSize.width / 4 * 3, wall_.contentSize.height / 4);
                    tmptag = kTagWall2;
                }
            }
        }
        for (CCSprite *tmpWall in [wallGroup children]) {
            if ( tmpWall.tag == tmptag){
                [tmpWall runAction:[CCFadeOut actionWithDuration:0.5f]];
                doNotTouch = NO;
                [self performSelector:@selector(doParticle:) withObject:tmpWall.tag];
                [self performSelector:@selector(touchedWall:) withObject:tmpWall afterDelay:1];
            }
        }
    }
    return TRUE;
}
- (void) doParticle : (int) posi
{
    particle = [CCParticleFire node];
    particle.texture = [[CCTextureCache sharedTextureCache] addImage:@"stars-grayscale.png"];
    particle.scale = 1.0f;
    particle.duration = 0.1f;
    [self addChild:particle z:kTagParticle tag:kTagParticle];
    [soundEffect playEffect:@"BBB.mp3"];
    
    switch (posi) {
        case kTagWall3:
            
            particle.position = ccp(wall_.position.x - wall_.contentSize.width / 4, wall_.position.y + wall_.contentSize.height / 4);
            break;
        case kTagWall4:
            particle.position = ccp(wall_.position.x + wall_.contentSize.width / 4, wall_.position.y + wall_.contentSize.height / 4);
            break;
        case kTagWall1:
            particle.position = ccp(wall_.position.x - wall_.contentSize.width / 4, wall_.position.y - wall_.contentSize.height / 4);
            break;
        case kTagWall2:
            particle.position = ccp(wall_.position.x + wall_.contentSize.width / 4, wall_.position.y - wall_.contentSize.height / 4);
            break;
            
        default:
            break;
    }
    
}

- (void) touchedWall : (CCSprite *) tmpWall
{
    doNotTouch = YES;
    [wallGroup removeChild:tmpWall cleanup:YES];
    touchedNum ++ ;
    if (touchedNum == 4) {
        if (isItKorean) {
            soundSet = [fromdata.kSoundSet objectAtIndex:ansRand3Num];
        }
        else{
            soundSet = [fromdata.eSoundSet objectAtIndex:ansRand3Num];
        }
        
        [soundEffect playEffect:[soundSet objectAtIndex:ans]];
        
        int randNum = arc4random() % fromdata.imageMove.count;
        
        [ansImage runAction:[fromdata.imageMove objectAtIndex:randNum]];
        
        [self scheduleOnce:@selector(reCallLayer) delay:3];
    }
}

- (void) reCallLayer
{
    
    if (fromdata.game2_stage == 10) {
        fromdata.gameOverIndex = 2;
        fromdata.game2_stage = 1;
        CCScene *tmpScene = [CCTransitionFade transitionWithDuration:0.5f scene:[GameOverLayer scene] withColor:ccWHITE];
        [[CCDirector sharedDirector] replaceScene:tmpScene];
    }
    else {
        fromdata.game2_stage ++;
        CCScene *tmpScene = [CCTransitionFade transitionWithDuration:0.5f scene:[PuzzleGame scene] withColor:ccWHITE];
        [[CCDirector sharedDirector] replaceScene:tmpScene];
    }
    
}

- (void) settingWall
{
    wall_ = [CCSprite spriteWithFile:@"puzz.png"];
    wall_.position = ccp(winSize.width/2+1, winSize.height/2.2 - 6);
    [self addChild:wall_ z:kTagWallBG];
    wall_.scale = 1;
    
    CCSprite *wall1 = [CCSprite spriteWithFile:@"puzz2_g.png"];
    wall1.scale = 1;
    [wallGroup addChild:wall1 z:kTagWall1 tag:kTagWall2];
    wall1.position = ccp(winSize.width/2+2, winSize.height/2.2 - 6);
    
    CCSprite *wall2 = [CCSprite spriteWithFile:@"puzz4_y.png"];
    wall2.scale = 1;
    [wallGroup addChild:wall2 z:kTagWall2 tag:kTagWall1];
    wall2.position = ccp(winSize.width/2+2, winSize.height/2.2 - 6);
    
    CCSprite *wall3 = [CCSprite spriteWithFile:@"puzz1_p.png"];
    wall3.scale = 1;
    [wallGroup addChild:wall3 z:kTagWall3 tag:kTagWall3];
    wall3.position = ccp(winSize.width/2+2, winSize.height/2.2 - 6);
    
    CCSprite *wall4 = [CCSprite spriteWithFile:@"puzz3_b.png"];
    wall4.scale = 1;
    [wallGroup addChild:wall4 z:kTagWall4 tag:kTagWall4];
    wall4.position = ccp(winSize.width/2+2, winSize.height/2.2 - 6);
}

-(void) gohome
{
    fromdata.game2_stage = 1;
    [soundEffect stopBackgroundMusic];
    [soundEffect playBackgroundMusic:@"bgm.mp3" loop:YES];
    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                         scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}
-(void) goback
{
    fromdata.game2_stage = 1;
    [soundEffect stopBackgroundMusic];
    [soundEffect playBackgroundMusic:@"bgm.mp3" loop:YES];
    CCScene *scene = [CCTransitionSlideInL transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}
- (void) repeatImageCheck
{
    if ( fromdata.game2_stage == 1) {
        [fromdata.rand3Buf removeAllObjects];
        [fromdata.rand10Buf removeAllObjects];
    }
    
    int until10 = fromdata.rand10Buf.count;
    
    for (int i = 0; i < until10; i ++ ) {
        NSNumber *tmp3 = [fromdata.rand3Buf objectAtIndex:i];
        NSNumber *tmp10 = [fromdata.rand10Buf objectAtIndex:i];
        int tmp3Int = [tmp3 integerValue];
        int tmp10Int = [tmp10 integerValue];
        if (tmp3Int == ansRand3Num && tmp10Int == ans) {
            ansRand3Num = arc4random() % 3;
            isItKorean = fromdata.isItKorean;
            if (isItKorean) {
                ans = arc4random() % fromdata.kImageNum;
            }
            else {
                ans = arc4random() % fromdata.eImageNum;
            }
            i = 0;
        }
    }
    NSNumber *fixedNumber3 = [NSNumber numberWithInt:ansRand3Num];
    NSNumber *ficedNumber10 = [NSNumber numberWithInt:ans];
    [fromdata.rand3Buf addObject:fixedNumber3];
    [fromdata.rand10Buf addObject:ficedNumber10];
    
}



- (void) dealloc
{
	[super dealloc];
}

@end
