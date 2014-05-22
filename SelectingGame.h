
//
//  SelectingGame.h
//  ddokGame1
//
//  Created by apple03 on 13. 5. 16..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "ImageSetData.h"
#import "MenuLayer.h"
#import "GameOverLayer.h"
#import "SimpleAudioEngine.h"

// SelectingGame
@interface SelectingGame : CCLayer 
{
    
    CCSprite *ansCard;
    CCSprite *ansImage;
    CCSprite *uncImage;
    
    int ans;
    int unc;
    int ansRand3Num;
    int uncRand3Num;
    
    BOOL *isItKorean;
    
    CCNode *itemGroup;
    
    ImageSetData *fromdata;
    
    BOOL doNotTouch;
    
    CGSize winSize;
    
    NSArray *soundSet;
    
    NSMutableArray *forxSound;
    SimpleAudioEngine *soundEffect;

}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end