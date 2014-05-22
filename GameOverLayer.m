//
//  GameOverLayer
//  KoreanEnglishCard
//
//  Created by  on 13. 5. 29..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "GameOverLayer.h"


@implementation GameOverLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOverLayer *layer = [GameOverLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init

{
    if( (self=[super init]) ) {
		
		winSize = [[CCDirector sharedDirector] winSize];
        
        fromdata = [ImageSetData sharedData];
        
        soundEffect = [SimpleAudioEngine sharedEngine];
        
        if (fromdata.gameOverIndex == 1){
        
            if (fromdata.game1_score < 4)
            {
                CCSprite *BG = [CCSprite spriteWithFile:@"score_3.png"];
                BG.position = ccp(winSize.width/2, winSize.height/2);
                [self addChild:BG];
            }
            else if (fromdata.game1_score < 8)
            {
                CCSprite *BG = [CCSprite spriteWithFile:@"score_2.png"];
                BG.position = ccp(winSize.width/2, winSize.height/2);
                [self addChild:BG];
            }
            else
            {
                CCSprite *BG = [CCSprite spriteWithFile:@"score_1.png"];
                BG.position = ccp(winSize.width/2, winSize.height/2);
                [self addChild:BG];
            }
        }
        else if (fromdata.gameOverIndex == 2){
            CCSprite *BG = [CCSprite spriteWithFile:@"score_1.png"];
            BG.position = ccp(winSize.width/2, winSize.height/2);
            [self addChild:BG];
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

-(void) gohome
{
    [soundEffect stopBackgroundMusic];
    [soundEffect playBackgroundMusic:@"bgm.mp3" loop:YES];
    
    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                         scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}
-(void) goback
{
    [soundEffect stopBackgroundMusic];
    [soundEffect playBackgroundMusic:@"bgm.mp3" loop:YES];
    CCScene *scene = [CCTransitionSlideInL transitionWithDuration:0.5
                                                            scene:[MenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}



@end
