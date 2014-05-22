
//
//  PuzzleGame.h
//  ddokGame2
//
//  Created by apple03 on 13. 5. 16..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>
#import <Foundation/Foundation.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "ImageSetData.h"
#import "MenuLayer.h"
#import "SimpleAudioEngine.h"

// PuzzleGame
@interface PuzzleGame : CCLayer 
{
    
    CCSprite *ansCard;
    CCSprite *ansImage;
    CCSprite *wall_;
    
    CCNode *wallGroup;
    
    ImageSetData *fromdata;
    
    BOOL doNotTouch;
    BOOL isItKorean;
    
    int ansRand3Num;
    int ans;
    
    CGSize winSize;
    
    NSInteger touchedNum;
    
    SimpleAudioEngine *soundEffect;
    NSArray *soundSet;
    CCParticleSystem *particle;

}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end