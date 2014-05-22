//
//  KSingLayer.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 29..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "SimpleAudioEngine.h"
#import <AVFoundation/AVFoundation.h>

#import "cocos2d.h"
#import "IntroLayer.h"

@interface KSingLayer : CCLayer{

    AVAudioPlayer *player;
    CCSprite *train;
    CCSprite *train_1;
    CCMenuItem *replay;
    CCMenu *rMenu;
    
    SimpleAudioEngine *sae;
}
+(CCScene *) scene;

@end
