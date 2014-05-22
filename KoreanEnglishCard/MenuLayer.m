//
//  MenuLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//
#import "MainMenuLayer.h"
#import "AppDelegate.h"
#import "MenuLayer.h"
#import "KoreanLayer.h"
#import "EnglishLayer.h"
#import "KSingLayer.h"
#import "ESingLayer.h"

@implementation MenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


- (id) init {
	if((self = [super init])) {
        
        AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
        
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
        
        if (delegate.menu_num == 1) {

            CCSprite *bgSprite = [CCSprite spriteWithFile:@"learn_menu_bg.png"];
            [bgSprite setAnchorPoint:CGPointZero];
            [bgSprite setPosition:CGPointZero];
            [self addChild:bgSprite z:0];

            
            CCMenuItem *learn1 = [CCMenuItemImage itemWithNormalImage:@"learn_menu1.png"
                                                        selectedImage:@"learn_menu1.png"
                                                               target:self
                                                             selector:@selector(conecter:)];
            CCMenuItem *learn2 = [CCMenuItemImage itemWithNormalImage:@"learn_menu2.png"
                                                         selectedImage:@"learn_menu2.png"
                                                                target:self
                                                              selector:@selector(conecter:)];
            CCMenu *menu = [CCMenu menuWithItems:learn1, learn2, nil];
            
            learn1.tag =1;
            learn2.tag =2;
            
            menu.position = CGPointMake(160, 275);
            [menu alignItemsHorizontally];
            

            [self addChild:menu z:1];
            
            
        } if (delegate.menu_num == 2) {
            
            fromdata = [ImageSetData sharedData];
            
            menuIs_1 = NO;
            menuIs_2 = NO;

            CCSprite *bgSprite = [CCSprite spriteWithFile:@"game_menu_bg.png"];
            [bgSprite setAnchorPoint:CGPointZero];
            [bgSprite setPosition:CGPointZero];
            [self addChild:bgSprite z:0];
            
            eng_1 = [CCMenuItemImage itemWithNormalImage:@"game_e.png" selectedImage:@"game_e.png" target:self selector:@selector(toGame:)];
            eMenu_1 = [CCMenu menuWithItems:eng_1, nil];
            eMenu_1.position = CGPointMake(25, 200);
            eMenu_1.scale = 0.7;
            [eMenu_1 alignItemsVertically];
            [self addChild:eMenu_1 z:1];
            eMenu_1.opacity = 0;
            
            kor_1 = [CCMenuItemImage itemWithNormalImage:@"game_k.png" selectedImage:@"game_1.png" target:self selector:@selector(toGame:)];
            kMenu_1 = [CCMenu menuWithItems:kor_1, nil];
            kMenu_1.position = CGPointMake(25, 200);
            kMenu_1.scale = 0.7;
            [kMenu_1 alignItemsVertically];
            [self addChild:kMenu_1 z:1];
            kMenu_1.opacity = 0;
            
            eng_2 = [CCMenuItemImage itemWithNormalImage:@"game_e.png" selectedImage:@"game_e.png" target:self selector:@selector(toGame:)];
            eMenu_2 = [CCMenu menuWithItems:eng_2, nil];
            eMenu_2.position = CGPointMake(185, 200);
            eMenu_2.scale = 0.7;
            [eMenu_2 alignItemsVertically];
            [self addChild:eMenu_2 z:1];
            eMenu_2.opacity = 0;
            
            kor_2 = [CCMenuItemImage itemWithNormalImage:@"game_k.png" selectedImage:@"game_k.png" target:self selector:@selector(toGame:)];
            kMenu_2 = [CCMenu menuWithItems:kor_2, nil];
            kMenu_2.position = CGPointMake(185, 200);
            kMenu_2.scale = 0.7;
            [kMenu_2 alignItemsVertically];
            [self addChild:kMenu_2 z:1];
            kMenu_2.opacity = 0;
            
            eng_1.tag = 110;
            kor_1.tag = 120;
            eng_2.tag = 210;
            kor_2.tag = 220;
            
            CCMenuItem *game1 = [CCMenuItemImage itemWithNormalImage:@"game_menu1.png"
                                                       selectedImage:@"game_menu1.png"
                                                              target:self
                                                            selector:@selector(game_1:)];
            CCMenuItem *game2 = [CCMenuItemImage itemWithNormalImage:@"game_menu2.png"
                                                       selectedImage:@"game_menu2.png"
                                                              target:self
                                                            selector:@selector(game_2:)];
            CCMenu *menu = [CCMenu menuWithItems:game1, game2, nil];
            
            menu.position = CGPointMake(160, 275);
            [menu alignItemsHorizontally];
            [self addChild:menu z:10];

            
            
        }if (delegate.menu_num == 3){

            CCSprite *bgSprite = [CCSprite spriteWithFile:@"sing_menu_bg.png"];
            [bgSprite setAnchorPoint:CGPointZero];
            [bgSprite setPosition:CGPointZero];
            [self addChild:bgSprite z:0];
            
            
            CCMenuItem *sing1 = [CCMenuItemImage itemWithNormalImage:@"sing_menu1.png"
                                                       selectedImage:@"sing_menu1.png"
                                                              target:self
                                                            selector:@selector(conecter:)];
            CCMenuItem *sing2 = [CCMenuItemImage itemWithNormalImage:@"sing_menu2.png"
                                                       selectedImage:@"sing_menu2.png"
                                                              target:self
                                                            selector:@selector(conecter:)];
            CCMenu *menu = [CCMenu menuWithItems:sing1, sing2, nil];
            
            sing1.tag = 5;
            sing2.tag = 6;
            
            menu.position = CGPointMake(160, 275);
            [menu alignItemsHorizontally];
            
            [self addChild:menu z:1];

            
        }

        
	}
	return self;
}


- (void)conecter: (id) sender {
    CCMenuItem *tmenu = (CCMenuItem *) sender;
    
    sae = [SimpleAudioEngine sharedEngine];
    [sae playEffect:@"btn_sound.mp3"];
    
    id rotate = [CCRotateTo actionWithDuration:0.1 angle:13];
    id rotate1 = [CCRotateTo actionWithDuration:0.1 angle:0];
    
    id total = [CCSequence actions:rotate, rotate1, nil];
    
	if (tmenu.tag == 1 || tmenu.tag == 2){
        [tmenu runAction:total];
        if (tmenu.tag == 1) {
            [self performSelector:@selector(learn1) withObject:nil afterDelay:0.5f];

        } else {
            [self performSelector:@selector(learn2) withObject:nil afterDelay:0.5f];
        }
    }
    else if (tmenu.tag == 5 || tmenu.tag == 6){
        [tmenu runAction:total];
        if (tmenu.tag ==5) {
            [self performSelector:@selector(sing1) withObject:nil afterDelay:0.5f];
        }else {
            [self performSelector:@selector(sing2) withObject:nil afterDelay:0.5f];
      
        }
        
    }
}


- (void) learn1
{
  
        CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                               scene:[KoreanLayer scene]];
        [[CCDirector sharedDirector] replaceScene:scene];
        
}

-(void) learn2 {
    
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[EnglishLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) toGame : (id)sender
{
    CCMenuItem *tmenu = (CCMenuItem *) sender;
    id scale = [CCScaleBy actionWithDuration:0.1 scale:1.2];
    id total = [CCSequence actions:scale, [scale reverse], nil];
    [tmenu runAction:total];
    sae = [SimpleAudioEngine sharedEngine];
    [sae playEffect:@"btn_sound.mp3"];
    
    switch (tmenu.tag) {
        case 110:
            fromdata.isItKorean = NO;
            [self performSelector:@selector(transToGame1) withObject:nil afterDelay:0.5f];
            break;
        case 120:
            fromdata.isItKorean = YES;
            [self performSelector:@selector(transToGame1) withObject:nil afterDelay:0.5f];
            break;
        case 210:
            fromdata.isItKorean = NO;
            [self performSelector:@selector(transToGame2) withObject:nil afterDelay:0.5f];
            break;
        case 220:
            fromdata.isItKorean = YES;
            [self performSelector:@selector(transToGame2) withObject:nil afterDelay:0.5f];
            break;
            
        default:
            break;
    }
}
- (void) transToGame1
{
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[SelectingGame scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}
- (void) transToGame2
{
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[PuzzleGame scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) game_1 : (id)sender
{
    CCMenuItem *item = (CCMenuItem *) sender;
    sae = [SimpleAudioEngine sharedEngine];
    [sae playEffect:@"btn_sound.mp3"];
    
    id rotate = [CCRotateTo actionWithDuration:0.1 angle:13];
    id rotate1 = [CCRotateTo actionWithDuration:0.1 angle:0];

    id total = [CCSequence actions:rotate, rotate1, nil];

    [item runAction:total];
        id eMove = [CCMoveBy actionWithDuration:0.5f position:ccp(0, -110)];
        id kMove = [CCMoveBy actionWithDuration:0.5f position:ccp(0, -60)];
        id fade = [CCFadeIn actionWithDuration:0.5f];
        id eSpawn = [CCSpawn actions:eMove, fade, nil];
        id kSpawn = [CCSpawn actions:kMove, [fade copy], nil];
        
        if (menuIs_1) {
            [eMenu_1 runAction:[CCMoveTo  actionWithDuration:0.5f position:ccp(40, 200)]];
            [kMenu_1 runAction:[CCMoveTo  actionWithDuration:0.5f position:ccp(40, 200)]];
            menuIs_1 = NO;
        }
        else {
            eMenu_1.position = ccp(40, 200);
            kMenu_1.position = ccp(40, 200);
            [eMenu_1 runAction:eSpawn];
            [kMenu_1 runAction:kSpawn];
            menuIs_1 = YES;
        }
}
- (void) game_2 : (id)sender
{
    CCMenuItem *item = (CCMenuItem *) sender;
    sae = [SimpleAudioEngine sharedEngine];
    [sae playEffect:@"btn_sound.mp3"];
    
    id rotate = [CCRotateTo actionWithDuration:0.1 angle:13];
    id rotate1 = [CCRotateTo actionWithDuration:0.1 angle:0];
    
    id total = [CCSequence actions:rotate, rotate1, nil];
    
    [item runAction:total];
        id eMove = [CCMoveBy actionWithDuration:0.5f position:ccp(0, -110)];
        id kMove = [CCMoveBy actionWithDuration:0.5f position:ccp(0, -60)];
        id fade = [CCFadeIn actionWithDuration:0.5f];
        id eSpawn = [CCSpawn actions:eMove, fade, nil];
        id kSpawn = [CCSpawn actions:kMove, [fade copy], nil];
        
        if (menuIs_2) {
            [eMenu_2 runAction:[CCMoveTo  actionWithDuration:0.5f position:ccp(185, 200)]];
            [kMenu_2 runAction:[CCMoveTo  actionWithDuration:0.5f position:ccp(185, 200)]];
            menuIs_2 = NO;
        }
        else {
            eMenu_2.position = ccp(190, 200);
            kMenu_2.position = ccp(190, 200);
            [eMenu_2 runAction:eSpawn];
            [kMenu_2 runAction:kSpawn];
            menuIs_2 = YES;
        }
}


- (void) sing1
{
   
        CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                               scene:[KSingLayer scene]];
        [[CCDirector sharedDirector] replaceScene:scene];
 
}
-(void) sing2 {
    
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[ESingLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}



-(void) gohome
{
    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                                     scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];

}
-(void) goback
{
    CCScene *scene = [CCTransitionSlideInL transitionWithDuration:0.5
                                                                     scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}

@end
