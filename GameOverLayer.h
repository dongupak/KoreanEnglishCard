//
//  GameOverLayer.h
//  KoreanEnglishCard
//
//  Created by  on 13. 5. 29..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ImageSetData.h"
#import "MainMenuLayer.h"
#import "MenuLayer.h"
#import "SimpleAudioEngine.h"

@interface GameOverLayer : CCLayer {
    
	CGSize winSize;
    
    ImageSetData *fromdata;
    SimpleAudioEngine *soundEffect;


}

+(CCScene *) scene;

@end
