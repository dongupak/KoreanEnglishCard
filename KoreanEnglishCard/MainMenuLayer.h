//
//  HelloWorldLayer.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "ImageSetData.h"

// HelloWorldLayer
@interface MainMenuLayer : CCLayer
{
    SimpleAudioEngine *sae;
    
    CCMenuItem *item1;
    CCMenuItem *item2;
    CCMenuItem *item3;
    
    NSArray *aNameArray;
    
    ImageSetData *fromdata;


}
@property (nonatomic, retain) NSMutableArray *card;
@property (nonatomic, retain) NSArray *aNameArray;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@end
