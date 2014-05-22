//
//  SelectingGame.m
//  ddokGame1
//
//  Created by apple03 on 13. 5. 16..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


// Import the interfaces
#import "SelectingGame.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

enum {
    kTagNote = 9000,
    kTagAnswer,
    kTagUncorrect,
    kTagItemGroup,
};

#pragma mark - SelectingGame

// SelectingGame implementation
@implementation SelectingGame


// Helper class method that creates a Scene with the SelectingGame as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SelectingGame *layer = [SelectingGame node];
	
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
        
        winSize= [[CCDirector sharedDirector] winSize];
        
        self.isTouchEnabled = YES;
        
        fromdata = [ImageSetData sharedData];
        
        soundEffect = [SimpleAudioEngine sharedEngine];
        if (fromdata.game1_stage == 1){
            [soundEffect playBackgroundMusic:@"gameBGM.mp3" loop:YES];
            [soundEffect setBackgroundMusicVolume:0.2f];
        }
        doNotTouch = YES;
        
        itemGroup = [CCNode node];
        [self addChild:itemGroup z:kTagItemGroup tag:kTagItemGroup];
        
        ansRand3Num = arc4random() % 3;
        uncRand3Num = arc4random() % 3;
        isItKorean = fromdata.isItKorean;
        if (isItKorean) {
            ans = arc4random() % fromdata.kImageNum;
            unc = arc4random() % fromdata.kImageNum;
            for ( BOOL index = 0; index == 1; ) {
                unc = arc4random() % fromdata.kImageNum;
                if ( ans != unc ) { index = 1; }
            }
        }
        else {
            ans = arc4random() % fromdata.eImageNum;
            unc = arc4random() % fromdata.eImageNum;
            for ( BOOL index = 0; index == 1; ) {
                unc = arc4random() % fromdata.eImageNum;
                if ( ans != unc ) { index = 1; }
            }
        }
        [self repeatImageCheck];
        
        NSMutableArray *tmpCards = [NSMutableArray array];
        NSMutableArray *tmpImages = [NSMutableArray array];
        if (isItKorean) {
            tmpCards = [fromdata.kCardSet objectAtIndex:ansRand3Num];
            tmpImages = [fromdata.kImageSet objectAtIndex:ansRand3Num];
            soundSet = [fromdata.kSoundSet objectAtIndex:ansRand3Num];
        }
        else {
            tmpCards = [fromdata.cardSet objectAtIndex:ansRand3Num];
            tmpImages = [fromdata.imageSet objectAtIndex:ansRand3Num];
            soundSet = [fromdata.eSoundSet objectAtIndex:ansRand3Num];
        }
        
        
        ansCard = [CCSprite spriteWithSpriteFrame:[tmpCards objectAtIndex:ans]];
        ansImage = [CCSprite spriteWithSpriteFrame:[tmpImages objectAtIndex:ans]];
        
        [ansImage setScale:0.5f];
        
        tmpImages = [fromdata.imageSet objectAtIndex:uncRand3Num];
        uncImage = [CCSprite spriteWithSpriteFrame:[tmpImages objectAtIndex:unc]];
        [uncImage setScale:0.5f];
        [self addChild:ansCard];
        [itemGroup addChild:ansImage z:kTagAnswer tag:kTagAnswer];
        [itemGroup addChild:uncImage z:kTagUncorrect tag:kTagUncorrect];
        
        ansCard.position = ccp(winSize.width/2, winSize.height/2);
        
        CCSprite *note1 = [CCSprite spriteWithFile:@"note.png"];
        [self addChild:note1 z:kTagNote];
        [note1 setScale:0.65f];
        [note1 setRotation:2];
        CCSprite *note2 = [CCSprite spriteWithFile:@"note.png"];
        [self addChild:note2 z:kTagNote];
        [note2 setScale:0.65f];
        [note2 setRotation:-3];
        
        NSInteger randOfPosition = arc4random() % 2;
        if (randOfPosition == 1) {
            ansImage.position = ccp(winSize.width/2 + 65, winSize.height/2 - 50);
            [note1 setPosition:ansImage.position];
            uncImage.position = ccp(winSize.width/2 - 65, winSize.height/2 - 50);
            [note2 setPosition:uncImage.position];
        }
        else {
            ansImage.position = ccp(winSize.width/2 - 65, winSize.height/2 - 50);
            [note1 setPosition:ansImage.position];
            uncImage.position = ccp(winSize.width/2 + 65, winSize.height/2 - 50);
            [note2 setPosition:uncImage.position];
        }
        
        float startOfX = winSize.width / 5.7;
        int jndex = 1;
        for ( ; jndex < fromdata.game1_stage; jndex ++) {
            CCSprite *star = [CCSprite spriteWithFile:@"star_1.png"];
            [star setPosition:ccp(startOfX, winSize.height / 8)];
            [self addChild:star];
            startOfX = startOfX + winSize.width / 14;
        }
        CCSprite *star = [CCSprite spriteWithFile:@"star_0.png"];
        [star setPosition:ccp(startOfX, winSize.height / 8)];
        [self addChild:star];
        startOfX = startOfX + winSize.width / 14;
        jndex ++;
        for ( ; jndex < 11; jndex ++) {
            CCSprite *star = [CCSprite spriteWithFile:@"star_2.png"];
            [star setPosition:ccp(startOfX, winSize.height / 8)];
            [self addChild:star];
            startOfX = startOfX + winSize.width / 14;
        }
        
        CCMenuItem *home = [CCMenuItemImage itemWithNormalImage:@"home_light.png" selectedImage:@"home.png" target:self
                                                       selector:@selector(gohome)];
        
        CCMenuItem *back = [CCMenuItemImage itemWithNormalImage:@"back_light.png" selectedImage:@"back.png" target:self
                                                       selector:@selector(goback)];
        
        
        CCMenu *hMenu = [CCMenu menuWithItems:home, nil];
        hMenu.position =ccp(280,440);
        [self addChild:hMenu z:3];
        
        CCMenu *bMenu = [CCMenu menuWithItems:back, nil];
        bMenu.position =ccp(40,440);
        [self addChild:bMenu z:3];
        
    }
    
    return self;
}


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:[touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    if ( doNotTouch ){
        for (CCSprite *tmpItem in [itemGroup children]) {
            NSInteger TouchOK_X_R = 0;
            NSInteger TouchOK_X_L = 0;
            if ( tmpItem.position.x < winSize.width / 2){
                TouchOK_X_R = winSize.width / 2 - 20;
                TouchOK_X_L = 0;
            }
            else {
                TouchOK_X_R = winSize.width ;
                TouchOK_X_L = winSize.width / 2 + 20;
            }
            NSInteger TouchOK_Y_A = tmpItem.position.y + tmpItem.contentSize.height / 2 - 10;
            NSInteger TouchOK_Y_B = tmpItem.position.y - tmpItem.contentSize.height / 2 - 10;
            if (convertedLocation.x < TouchOK_X_R && convertedLocation.x > TouchOK_X_L && convertedLocation.y < TouchOK_Y_A && convertedLocation.y > TouchOK_Y_B ){
                [self isItAnswer:tmpItem];
                
                doNotTouch = NO;
            }
        }
    }
    return TRUE;
}

- (void) isItAnswer:(CCSprite *) touchedImage
{
    id bigger = [CCScaleBy actionWithDuration:0.5f scale:1.5f];
    id smaller = [CCScaleBy actionWithDuration:0.5f scale:0.7f];
    id bigger2 = [CCScaleBy actionWithDuration:0.5f scale:1.2f];
    id smaller2 = [CCScaleBy actionWithDuration:0.5f scale:0.9f];
    id bigger3 = [CCScaleBy actionWithDuration:0.5f scale:1.1f];
    id smaller3 = [CCScaleBy actionWithDuration:0.5f scale:1.0f];
    id seq = [CCSequence actions:bigger, smaller, bigger2, smaller2, bigger3, smaller3, nil];
    if (touchedImage.tag == kTagAnswer) {
        fromdata.game1_score ++;
        [soundEffect playEffect:[soundSet objectAtIndex:ans]];
        if (fromdata.game1_stage < 11){
            fromdata.game1_stage ++;
            [touchedImage runAction:seq];
            [self scheduleOnce:@selector(reCallOfLayer) delay:3];
        }
    }
    else if (touchedImage.tag == kTagUncorrect){
        if (fromdata.game1_stage < 11){
            fromdata.game1_stage ++;
            [soundEffect playEffect:@"ddeng2.mp3"];
            [soundEffect playEffect:[soundSet objectAtIndex:ans]];
            
            
            id spin = [CCRotateBy actionWithDuration:1.5f angle:1300];
            id smaller = [CCScaleBy actionWithDuration:1.5f scale:0];
            id spawn = [CCSpawn actions:spin, smaller, nil];
            CCSprite *anotherImage;
            for (CCSprite *tmpImage in [itemGroup children]) {
                if (tmpImage != touchedImage){
                    anotherImage = tmpImage;
                }
            }
            [anotherImage runAction:[seq copy]];
            [touchedImage runAction:spawn];
            [self scheduleOnce:@selector(reCallOfLayer) delay:3];
        }
        
    }
}

- (void) reCallOfLayer
{
    if (fromdata.game1_stage == 11) {
        fromdata.game1_stage = 1;
        fromdata.game2_score = 0;
        fromdata.gameOverIndex = 1;
        CCScene *tmpScene = [CCTransitionFade transitionWithDuration:0.5f scene:[GameOverLayer scene] withColor:ccWHITE];
        [[CCDirector sharedDirector] replaceScene:tmpScene];
    }
    else {
        CCScene *tmpScene = [CCTransitionFade transitionWithDuration:0.5f scene:[SelectingGame scene] withColor:ccWHITE];
        [[CCDirector sharedDirector] replaceScene:tmpScene];
    }
}

-(void) gohome
{
    fromdata.game1_stage = 1;
    fromdata.game2_score = 0;
    [soundEffect stopBackgroundMusic];
    [soundEffect playBackgroundMusic:@"bgm.mp3" loop:YES];
    [self removeChildByTag:kTagItemGroup cleanup:NO];
    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                         scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}
-(void) goback
{
    fromdata.game1_stage = 1;
    fromdata.game2_score = 0;
    [soundEffect stopBackgroundMusic];
    [soundEffect playBackgroundMusic:@"bgm.mp3" loop:YES];
    [self removeChildByTag:kTagItemGroup cleanup:NO];
    CCScene *scene = [CCTransitionSlideInL transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}

- (void) repeatImageCheck
{
    if ( fromdata.game1_stage == 1) {
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
                unc = arc4random() % fromdata.kImageNum;
                for ( BOOL index = 0; index == 1; ) {
                    unc = arc4random() % fromdata.kImageNum;
                    if ( ans != unc ) { index = 1; }
                }
            }
            else {
                ans = arc4random() % fromdata.eImageNum;
                unc = arc4random() % fromdata.eImageNum;
                for ( BOOL index = 0; index == 1; ) {
                    unc = arc4random() % fromdata.eImageNum;
                    if ( ans != unc ) { index = 1; }
                }
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

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
