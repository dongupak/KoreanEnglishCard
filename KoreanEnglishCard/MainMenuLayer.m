//
//  HelloWorldLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


// Import the interfaces
#import "MainMenuLayer.h"
#import "MenuLayer.h"
#import "CreditLayer.h"
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation MainMenuLayer
@synthesize card;
@synthesize aNameArray;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuLayer *layer = [MainMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
        
        fromdata = [ImageSetData sharedData];
        
        CCSprite *bgSprite = [CCSprite spriteWithFile:@"main_menu.png"];
		[bgSprite setAnchorPoint:CGPointZero];
		[bgSprite setPosition:CGPointZero];
		[self addChild:bgSprite z:0];
        
        CCMenuItem * info = [CCMenuItemImage itemWithNormalImage:@"info_light.png" selectedImage:@"info_light.png" target:self selector:@selector(credit)];
        info.position = ccp(285,445);
        
        CCMenu * menu_Tap = [CCMenu menuWithItems:info, nil];
        menu_Tap.position = ccp(0,0);
        [self addChild:menu_Tap];

        item1 = [CCMenuItemImage itemWithNormalImage:@"learn.png" selectedImage:@"learn.png" target:self selector:@selector(conecter:)];
        item2 = [CCMenuItemImage itemWithNormalImage:@"game.png" selectedImage:@"game.png" target:self selector:@selector(conecter:)];
        item3 = [CCMenuItemImage itemWithNormalImage:@"sing.png" selectedImage:@"sing.png" target:self selector:@selector(conecter:)];
        
        item1.tag = 100;
        item2.tag = 101;
        item3.tag = 102;
        
        item1.position = ccp(200,210);
        item2.position = ccp(230,140);
        item3.position = ccp(200,70);
        
        
        CCMenu *menu = [CCMenu menuWithItems:item1, item2, item3, nil];
        menu.position = ccp(0,0);
        id move = [CCMoveBy actionWithDuration:1.5 position:ccp(0,12)];
        id total = [CCSequence actions:move, [move reverse], nil];
        id repeat = [CCRepeatForever actionWithAction:total];
        [menu runAction:repeat];
        [self addChild:menu];
        
	}
	return self;
}



- (void)conecter: (id) sender {
    CCMenuItem *tmenu = (CCMenuItem *) sender;

    sae = [SimpleAudioEngine sharedEngine];
    [sae playEffect:@"btn_sound.mp3"];

    id rotate = [CCRotateBy actionWithDuration:0.1 angle:13];
    id total = [CCSequence actions:rotate, [rotate reverse], nil];

	if (tmenu.tag == 100){
        
        [tmenu runAction:total];
        [self performSelector:@selector(learn) withObject:nil afterDelay:0.5f];

    }    else if(tmenu.tag == 101){
        [tmenu runAction:total];
        [self performSelector:@selector(game) withObject:nil afterDelay:0.5f];

    } else{
        [tmenu runAction:total];
        [self performSelector:@selector(sing) withObject:nil afterDelay:0.5f];
    }
}

- (void) learn {
        AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    delegate.menu_num = 1;
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) game {
    AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    delegate.menu_num = 2;
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) sing {
    AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    delegate.menu_num = 3;
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) credit {
    
    CCScene *scene = [CCTransitionSlideInR transitionWithDuration:0.5
                                                            scene:[CreditLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}

// on "dealloc" you need to release all your retained objects
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
