//
//  ESingLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 29..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "ESingLayer.h"
#import "MainMenuLayer.h"
#import "MenuLayer.h"

@implementation ESingLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ESingLayer *layer = [ESingLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init
{
	if( (self=[super init]) ) {
        
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
        
        
        
        
        
		CCSprite *background = [CCSprite spriteWithFile:@"train_bg.png"];
        [background setAnchorPoint:CGPointZero];
        [background setPosition:CGPointZero];
        [self addChild:background z:0];
        
        
        CCSprite *sun = [CCSprite spriteWithFile:@"sun.png"];
        sun.position = ccp(190, 410);
        [self addChild:sun z:3];
        id rotate = [CCRotateBy actionWithDuration:20 angle:360];
        id repeat = [CCRepeatForever actionWithAction:rotate];
        [sun runAction:repeat];
        
        CCSprite *flower = [CCSprite spriteWithFile:@"flower.png"];
        flower.position = ccp(160, 50);
        [self addChild:flower z:3];
        
    
         [self sing];
        
	}
	return self;
}


-(void) sing
{
    sae = [SimpleAudioEngine sharedEngine];
    
    if (sae != nil) {
        [sae preloadBackgroundMusic:@"e_sing_new.mp3"];
    }
    
    [sae playBackgroundMusic:@"e_sing_new.mp3" loop:NO];
    
    
    
    train = [CCSprite spriteWithFile:@"e_sing_train_1.png"];
    CCParallaxNode *voidNode = [CCParallaxNode node];
    [voidNode addChild:train z:2 parallaxRatio:ccp(2.0, 0.0)
        positionOffset: ccp(1900,170)];
    
    CCLayer *gameLayer = [CCLayer node];
    
    [gameLayer addChild:voidNode z:2];
    
    id delay = [CCDelayTime actionWithDuration:2];
    id go = [CCMoveBy actionWithDuration:34 position:ccp(-3143, 0)];
    id total = [CCSequence actions:delay, go, nil];
    
    [gameLayer runAction:[CCRepeatForever actionWithAction:total]];
    [self addChild:gameLayer];
    
    train_1 = [CCSprite spriteWithFile:@"e_sing_train_2.png"];
    CCParallaxNode *voidNode_1 = [CCParallaxNode node];
    [voidNode_1 addChild:train_1 z:2 parallaxRatio:ccp(2.0, 0.0)
          positionOffset: ccp(1900,200)];
    
    CCLayer *gameLayer1 = [CCLayer node];
    [gameLayer1 addChild:voidNode_1 z:2];
    id delay_1 = [CCDelayTime actionWithDuration:32];
    id go_1 = [CCMoveBy actionWithDuration:35 position:ccp(-3143, 0)];
    id total_1 = [CCSequence actions:delay_1, go_1, nil];
    
    [gameLayer1 runAction:[CCRepeatForever actionWithAction:total_1]];
    [self addChild:gameLayer1];
    
    
    
    
    
    
    CCSprite *a = [CCSprite spriteWithFile:@"e_sing0.png"];
    a.position = ccp(600, 240);
    [self addChild:a z:3];
    
    id delay1 = [CCDelayTime actionWithDuration:21];
    id place1 = [CCPlace actionWithPosition:ccp(160,340)];
    id scale1 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin1 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink1 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action1 = [CCSequence actions:scale1, origin1, shrink1, origin1, nil];
    id repeat1 = [CCRepeat actionWithAction:action1 times:1];
    id term1 = [CCDelayTime actionWithDuration:8];
    id remove1 = [CCPlace actionWithPosition:ccp(600,240)];
    
    id total1 = [CCSequence actions:delay1, place1, repeat1,term1, remove1, nil];
    
    [a runAction:total1];
    
    
    id delay1_1 = [CCDelayTime actionWithDuration:52];
    id place1_1 = [CCPlace actionWithPosition:ccp(160,340)];
    id scale1_1 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin1_1 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink1_1 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action1_1 = [CCSequence actions:scale1_1, origin1_1, shrink1_1, origin1_1, nil];
    id repeat1_1 = [CCRepeat actionWithAction:action1_1 times:1];
    id term1_1 = [CCDelayTime actionWithDuration:8];
    id remove1_1 = [CCPlace actionWithPosition:ccp(600,240)];
    
    id total1_1 = [CCSequence actions:delay1_1, place1_1, repeat1_1,term1_1, remove1_1, nil];
    
    [a runAction:total1_1];
    
    
    
    
    
    
    CCSprite *b = [CCSprite spriteWithFile:@"e_sing1.png"];
    b.position = ccp(600, 240);
    [self addChild:b z:3];
    
    id delay2 = [CCDelayTime actionWithDuration:23];
    id place2 = [CCPlace actionWithPosition:ccp(160,260)];
    id scale2 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin2 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink2 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action2 = [CCSequence actions:scale2, origin2, shrink2, origin2, nil];
    id repeat2 = [CCRepeat actionWithAction:action2 times:1];
    id term2 = [CCDelayTime actionWithDuration:6];
    id remove2 = [CCPlace actionWithPosition:ccp(600,240)];
    
    id total2 = [CCSequence actions:delay2, place2, repeat2,term2, remove2, nil];
    
    [b runAction:total2];
    
    
    
    id delay2_1 = [CCDelayTime actionWithDuration:54];
    id place2_1 = [CCPlace actionWithPosition:ccp(160,260)];
    id scale2_1 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin2_1 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink2_1 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action2_1 = [CCSequence actions:scale2_1, origin2_1, shrink2_1, origin2_1, nil];
    id repeat2_1 = [CCRepeat actionWithAction:action2_1 times:1];
    id term2_1 = [CCDelayTime actionWithDuration:6];
    id remove2_1 = [CCPlace actionWithPosition:ccp(600,240)];
    
    id total2_1 = [CCSequence actions:delay2_1, place2_1, repeat2_1,term2_1, remove2_1, nil];
    
    [b runAction:total2_1];
    
    
    
    
    
    CCSprite *c = [CCSprite spriteWithFile:@"e_sing2.png"];
    c.position = ccp(600, 240);
    [self addChild:c z:3];
    
    id delay3 = [CCDelayTime actionWithDuration:25];
    id place3 = [CCPlace actionWithPosition:ccp(160,180)];
    id scale3 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin3 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink3 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action3 = [CCSequence actions:scale3, origin3, shrink3, origin3, nil];
    id repeat3 = [CCRepeat actionWithAction:action3 times:1];
    id term3 = [CCDelayTime actionWithDuration:4];
    id remove3 = [CCPlace actionWithPosition:ccp(600,240)];
    
    id total3 = [CCSequence actions:delay3, place3, repeat3,term3, remove3, nil];
    
    [c runAction:total3];
    
    id delay3_1 = [CCDelayTime actionWithDuration:56];
    id place3_1 = [CCPlace actionWithPosition:ccp(160,180)];
    id scale3_1 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin3_1 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink3_1 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action3_1 = [CCSequence actions:scale3_1, origin3_1, shrink3_1, origin3_1, nil];
    id repeat3_1 = [CCRepeat actionWithAction:action3_1 times:1];
    id term3_1 = [CCDelayTime actionWithDuration:4];
    id remove3_1 = [CCPlace actionWithPosition:ccp(600,240)];
    
    id total3_1 = [CCSequence actions:delay3_1, place3_1, repeat3_1,term3_1, remove3_1, nil];
    
    [c runAction:total3_1];
    
    
    
    
    CCSprite *d = [CCSprite spriteWithFile:@"e_sing3.png"];
    d.position = ccp(600, 240);
    [self addChild:d z:3];
    
    id delay4 = [CCDelayTime actionWithDuration:27];
    id place4 = [CCPlace actionWithPosition:ccp(160,100)];
    id scale4 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin4 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink4 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action4 = [CCSequence actions:scale4, origin4, shrink4, origin4, nil];
    id repeat4 = [CCRepeat actionWithAction:action4 times:1];
    id term4 = [CCDelayTime actionWithDuration:2];
    id remove4 = [CCPlace actionWithPosition:ccp(600,240)];
    id total4 = [CCSequence actions:delay4, place4, repeat4,term4, remove4, nil];
    
    [d runAction:total4];
    
    id delay4_1 = [CCDelayTime actionWithDuration:58];
    id place4_1 = [CCPlace actionWithPosition:ccp(160,100)];
    id scale4_1 = [CCScaleTo actionWithDuration:0.5 scale:1.1];
    id origin4_1 = [CCScaleTo actionWithDuration:0.5 scale:1];
    id shrink4_1 = [CCScaleTo actionWithDuration:0.5 scale:0.9];
    id action4_1 = [CCSequence actions:scale4_1, origin4_1, shrink4_1, origin4_1, nil];
    id repeat4_1 = [CCRepeat actionWithAction:action4_1 times:1];
    id term4_1 = [CCDelayTime actionWithDuration:2];
    id remove4_1 = [CCPlace actionWithPosition:ccp(600,240)];
    id total4_1 = [CCSequence actions:delay4_1, place4_1, repeat4_1,term4_1, remove4_1, nil];
    
    [d runAction:total4_1];

    
    replay = [CCMenuItemImage itemWithNormalImage:@"replay.png" selectedImage:@"replay.png" target:self
                                         selector:@selector(replay)];
    
    rMenu = [CCMenu menuWithItems:replay, nil];
    [self addChild:rMenu z:4];
    rMenu.position = ccp(460,240);
    id delay5_1 = [CCDelayTime actionWithDuration:63];
    id place5_1 = [CCPlace actionWithPosition:ccp(160,240)];
    id total5_1 = [CCSequence actions:delay5_1, place5_1, nil];
    [rMenu runAction:total5_1];
    
}

-(void) replay {
    
    rMenu.position = ccp(460,240);
    [self sing];
    
}

-(void) gohome
{
    train.opacity = 0;
    train_1.opacity = 0;
    
    [self removeAllChildrenWithCleanup:NO];
    
    CCSprite *background = [CCSprite spriteWithFile:@"train_bg.png"];
    [background setAnchorPoint:CGPointZero];
    [background setPosition:CGPointZero];
    [self addChild:background z:0];
    
    CCSprite *flower = [CCSprite spriteWithFile:@"flower.png"];
    flower.position = ccp(160, 50);
    [self addChild:flower z:3];
    
    
    [sae stopBackgroundMusic];
    [sae playBackgroundMusic:@"bgm.mp3"];

    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                         scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}
-(void) goback
{
    train.opacity = 0;
    train_1.opacity = 0;
    
    [sae stopBackgroundMusic];
    [sae playBackgroundMusic:@"bgm.mp3"];

    CCScene *scene = [CCTransitionSlideInL transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}

@end
