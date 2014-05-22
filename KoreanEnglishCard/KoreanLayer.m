//
//  KoreanLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//
#import "MainMenuLayer.h"
#import "MenuLayer.h"
#import "KoreanLayer.h"
#import "KCardLayer.h"
#import "AppDelegate.h"

@implementation KoreanLayer
@synthesize aNameArray;


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	KoreanLayer *layer = [KoreanLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
	if((self = [super init])) {
		CCSprite *bgSprite = [CCSprite spriteWithFile:@"KorBg.png"];
		[bgSprite setAnchorPoint:CGPointZero];
		[bgSprite setPosition:CGPointZero];
		[self addChild:bgSprite z:0];

        touchEnable = YES;

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
        
        
        CCMenuItem *ga = [CCMenuItemImage itemWithNormalImage:@"가.png"
                                                    selectedImage:@"가.png"
                                                           target:self
                                                     selector:@selector(korean:)];
        ga.tag = 0;
        
        CCMenuItem *na = [CCMenuItemImage itemWithNormalImage:@"나.png"
                                               selectedImage:@"나.png"
                                                      target:self
                                                    selector:@selector(korean:)];
        na.tag = 1;
        
        CCMenuItem *da = [CCMenuItemImage itemWithNormalImage:@"다.png"
                                                selectedImage:@"다.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        da.tag = 2;
    
        CCMenuItem *ra = [CCMenuItemImage itemWithNormalImage:@"라.png"
                                                selectedImage:@"라.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        ra.tag = 3;
        
        CCMenuItem *ma = [CCMenuItemImage itemWithNormalImage:@"마.png"
                                                selectedImage:@"마.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        ma.tag = 4;
        
        CCMenuItem *ba = [CCMenuItemImage itemWithNormalImage:@"바.png"
                                                selectedImage:@"바.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        ba.tag = 5;
        
        
        
        CCMenuItem *sa = [CCMenuItemImage itemWithNormalImage:@"사.png"
                                                selectedImage:@"사.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        sa.tag = 6;
        
        CCMenuItem *a = [CCMenuItemImage itemWithNormalImage:@"아.png"
                                                selectedImage:@"아.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        a.tag = 7;
        
        CCMenuItem *ja = [CCMenuItemImage itemWithNormalImage:@"자.png"
                                                selectedImage:@"자.png"
                                                       target:self
                                                     selector:@selector(korean:)];
       ja.tag = 8;
        
        CCMenuItem *cha = [CCMenuItemImage itemWithNormalImage:@"차.png"
                                                selectedImage:@"차.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        cha.tag = 9;
        
        CCMenuItem *ca = [CCMenuItemImage itemWithNormalImage:@"카.png"
                                                selectedImage:@"카.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        ca.tag = 10;
        
        CCMenuItem *ta = [CCMenuItemImage itemWithNormalImage:@"타.png"
                                                selectedImage:@"타.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        ta.tag = 11;
        
        
        
        CCMenuItem *pa = [CCMenuItemImage itemWithNormalImage:@"파.png"
                                                selectedImage:@"파.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        pa.tag = 12;
        
        
        CCMenuItem *ha = [CCMenuItemImage itemWithNormalImage:@"하.png"
                                                selectedImage:@"하.png"
                                                       target:self
                                                     selector:@selector(korean:)];
        ha.tag = 13;
        
        
        
        
        CCMenu *menu = [CCMenu menuWithItems:ga, na, da, ra,nil];
        menu.position = ccp(160,400);
        [menu alignItemsHorizontally];
        [self addChild:menu z:2];
        
        CCMenu *menu1 = [CCMenu menuWithItems:ma, ba, sa, a,nil];
        menu1.position = ccp(160,350);
        [menu1 alignItemsHorizontally];
        [self addChild:menu1 z:2];
        
        CCMenu *menu2 = [CCMenu menuWithItems:ja, cha, ca, ta,nil];
        menu2.position = ccp(160,300);
        [menu2 alignItemsHorizontally];
        [self addChild:menu2 z:2];
        
        CCMenu *menu3 = [CCMenu menuWithItems:pa, ha, nil];
        menu3.position = ccp(160,250);
        [menu3 alignItemsHorizontally];
        [self addChild:menu3 z:2];
        
	}
	return self;
}




- (void)korean: (id) sender
{
	if (touchEnable) {
			touchEnable = NO;
	
    AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    
    CCMenuItem *item = (CCMenuItem *) sender;
    delegate.kor_num = item.tag;
    
    id scale = [CCScaleBy actionWithDuration:0.1 scale:1.2];
    id total = [CCSequence actions:scale, [scale reverse], nil];
    [item runAction:total];
        aNameArray = [NSArray arrayWithObjects:
                               @"가.mp3", @"나.mp3",
                               @"다.mp3", @"라.mp3",
                               @"마.mp3", @"바.mp3",
                               @"사.mp3", @"아.mp3",
                               @"자.mp3", @"차.mp3",
                               @"카.mp3", @"타.mp3",
                               @"파.mp3", @"하.mp3",nil];
    
        sae = [SimpleAudioEngine sharedEngine];
        [sae playEffect:aNameArray[item.tag]];
        
    [self performSelector:@selector(card) withObject:nil afterDelay:0.5f];
	}

}

-(void) card {
    CCScene *scene = [CCTransitionProgressRadialCCW transitionWithDuration:0.5
                                                                     scene:[KCardLayer scene]];
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
                                                                     scene:[MenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}







@end
