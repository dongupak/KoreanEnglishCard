//
//  MenuLayer.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SelectingGame.h"
#import "PuzzleGame.h"
#import "ImageSetData.h"
#import "SimpleAudioEngine.h"

@interface MenuLayer : CCLayer {

    SimpleAudioEngine *sae;

    CCMenuItem *eng_1;
    CCMenuItem *kor_1;
    CCMenuItem *eng_2;
    CCMenuItem *kor_2;
    
    CCMenu *eMenu_1;
    CCMenu *eMenu_2;
    CCMenu *kMenu_1;
    CCMenu *kMenu_2;
    
    BOOL menuIs_1;
    BOOL menuIs_2;
    BOOL gameNum;
    ImageSetData *fromdata;
    
    
}
+(CCScene *) scene;

@end
