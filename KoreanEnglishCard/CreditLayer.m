//
//  CreditLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 31..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "CreditLayer.h"
#import "MainMenuLayer.h"

@implementation CreditLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CreditLayer *layer = [CreditLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
        
        CCSprite *bgSprite = [CCSprite spriteWithFile:@"info_bg.png"];
		[bgSprite setAnchorPoint:CGPointZero];
		[bgSprite setPosition:CGPointZero];
		[self addChild:bgSprite z:0];
        
        
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
