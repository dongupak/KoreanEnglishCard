//
//  KCardLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 10..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//
#import "MainMenuLayer.h"
#import "AppDelegate.h"
#import "KoreanLayer.h"
#import "KCardLayer.h"


@implementation KCardLayer

@synthesize imageDataSet;
@synthesize card;
@synthesize img;
@synthesize imageData;
@synthesize cardData;
@synthesize move;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	KCardLayer *layer = [KCardLayer node];
	
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


- (id) init {
	if((self = [super init])) {
        
        
        self.isTouchEnabled = YES;
        doTouch = YES;
        
        AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
        imageDataSet = [ImageSetData sharedData];
      
        randNum = arc4random()%3;
        
        
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
        
        
        
        cardData = [imageDataSet.kCardSet objectAtIndex:randNum];
        imageBg = [CCSprite spriteWithSpriteFrame:[cardData objectAtIndex:delegate.kor_num]];
        [imageBg setAnchorPoint:CGPointZero];
        [imageBg setPosition:CGPointZero];
		[self addChild:imageBg z:0];
        
        imageData = [imageDataSet.kImageSet objectAtIndex:randNum];
        image = [CCSprite spriteWithSpriteFrame:[imageData objectAtIndex:delegate.kor_num]];
        image.position = ccp(160, 150);
        [self addChild:image z:1];
        
    }
    return self;
    
}


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ( doTouch ){
        doTouch = NO;
        
    CGPoint location = [touch locationInView:[touch view]]; 
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
        
    if(ccpDistance(image.position, convertedLocation) < image.contentSize.width /2) {
        
        AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
        kSoundDataSet = [ImageSetData sharedData];
        kSoundData = [kSoundDataSet.kSoundSet objectAtIndex:randNum];
        
        sae = [SimpleAudioEngine sharedEngine];
        [sae playEffect:kSoundData[delegate.kor_num]];

        
        move = [NSMutableArray arrayWithCapacity:10];
        
        int rand = arc4random() % 9;
        
        id scale = [CCScaleBy actionWithDuration:0.2 scale:2.2];
        id scaleT = [CCSequence actions: scale, [scale reverse], scale, [scale reverse], scale, [scale reverse],nil];
        
        id up = [CCMoveBy actionWithDuration:0.3 position:ccp(200,200)];
        id up1 = [CCMoveBy actionWithDuration:0.3 position:ccp(-400,0)];
        id up2 = [CCMoveBy actionWithDuration:0.3 position:ccp(400, -200)];
        id up3 = [CCMoveBy actionWithDuration:0.3 position:ccp(-400,0)];
        id up4 = [CCMoveTo actionWithDuration:0.3 position:ccp(160, 150)];
        id upT = [CCSequence actions:up, up1, up2, up3, up4, nil];
        
        id rotate2 = [CCRotateBy actionWithDuration:2 angle:360];
        
        id jump = [CCPlace actionWithPosition:ccp(330, 400)];
        id jump0 = [CCScaleTo actionWithDuration:0 scale:0.3];
        id jump1 = [CCSpawn actions:jump, jump0, nil];
        id jump2 = [CCScaleTo actionWithDuration:2 scale:1];
        id jump3 = [CCJumpTo actionWithDuration:2 position:ccp(160,150) height:200 jumps:2];
        id jump4 = [CCSpawn actions:jump2, jump3, nil];
        id jumpT = [CCSequence actions:jump1, jump4, nil];
        
        id rotate4_1 = [CCPlace actionWithPosition:ccp(-50,350)];
        id rotate4_2 = [CCScaleTo actionWithDuration:0 scale:0.3];
        id rotate4_22 = [CCSpawn actions:rotate4_1,rotate4_2, nil];
        
        id rotate4_3 = [CCRotateTo actionWithDuration:1.5 angle:360*2];
        id rotate4_4 = [CCMoveTo actionWithDuration:1.5 position:ccp(160,150)];
        id rotate4_41 = [CCScaleTo actionWithDuration:1.5 scale:1];
        id rotate4_44 = [CCSpawn actions:rotate4_41, rotate4_3, rotate4_4, nil];
        id rotate4 = [CCSequence actions:rotate4_22, rotate4_44, nil];
        
        
        id moveTo = [CCPlace actionWithPosition:ccp(160,350)];
        id moveTo1 = [CCScaleTo actionWithDuration:0 scale:0.3];
        id moveTo2 = [CCSpawn actions:moveTo,moveTo1, nil];
        id moveTo3 = [CCMoveTo actionWithDuration:2.5 position:ccp(160,150)];
        id moveTo4 = [CCScaleTo actionWithDuration:2.5 scale:1];
        id moveTo5 = [CCSpawn actions:moveTo3, moveTo4,nil];
        id moveToT = [CCSequence actions:moveTo2, moveTo5, nil];
        
        
        id position = [CCPlace actionWithPosition:ccp(160,350)];
        id position0 = [CCScaleBy actionWithDuration:0 scale:0.3];
        id position00 = [CCSpawn actions:position, position0, nil];
        
        id position1 = [CCMoveBy actionWithDuration:1 position:ccp(100,-100)];
        id position2 = [CCMoveBy actionWithDuration:1 position:ccp(-200,-100)];
        id position3 = [CCMoveTo actionWithDuration:0.5 position:ccp(160, 150)];
        id position4 = [CCSequence actions: position1, position2, position3, nil];
        
        id position5 = [CCScaleTo actionWithDuration:2.5 scale:1];
        id position6 = [CCSpawn actions:position4, position5, nil];
        
        id positionT = [CCSequence actions:position00, position6, nil];
        
        id blink = [CCBlink actionWithDuration:2 blinks:3];
        
        id tint = [CCTintBy actionWithDuration:0.4 red:255 green:0 blue:0];
        id tint1 = [CCTintBy actionWithDuration:0.4 red:0 green:255 blue:0];
        id tint2 = [CCTintBy actionWithDuration:0.4 red:0 green:0 blue:255];
        id tint3 = [CCTintBy actionWithDuration:0.4 red:255 green:255 blue:0];
        id tint4 = [CCTintBy actionWithDuration:0.4 red:0 green:255 blue:255];
        id tint5 = [CCTintBy actionWithDuration:0.4 red:255 green:0 blue:255];
        id tint6 = [CCTintBy actionWithDuration:0.1 red:0 green:0 blue:0];
        
        id tint7 = [CCSequence actions:tint, tint1, tint2, tint3, tint4, tint5, tint6, nil];
        
        id tintRot = [CCRotateTo actionWithDuration:1 angle:50];
        id tintRot1 = [CCRotateTo actionWithDuration:1 angle:-50];
        id tintRot2 = [CCRotateTo actionWithDuration:0.5 angle:0];
        id tintRot3 = [CCSequence actions:tintRot, tintRot1, tintRot2,nil];
        
        id tintT = [CCSpawn actions:tint7, tintRot3, nil];
        
        [self.move addObject:scaleT];
        [self.move addObject:upT];
        [self.move addObject:moveToT];
        [self.move addObject:rotate2];
        [self.move addObject:jumpT];
        [self.move addObject:rotate4];
        [self.move addObject:blink];
        [self.move addObject:tintT];
        [self.move addObject:positionT];

        [image runAction:[moveTo3 copy]];
        [image runAction:move[rand]];
        
    }
    [self performSelector:@selector(enableTouch) withObject:nil afterDelay:3.5];
    }
    return TRUE;
}

- (void) enableTouch
{
    doTouch = YES;
}

-(void) gohome
{
    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                                     scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}
-(void) goback
{
    CCScene *scene = [CCTransitionProgressRadialCW transitionWithDuration:0.5
                                                                     scene:[KoreanLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}



@end
