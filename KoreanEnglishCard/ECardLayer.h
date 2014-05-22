//
//  ECardLayer.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 16..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ImageSetData.h"
#import "SimpleAudioEngine.h"

@interface ECardLayer : CCLayer{
    NSMutableArray *card;
    NSMutableArray *img;
    
    NSInteger randNum;
    ImageSetData *imageDataSet;
    
    NSArray *cardData;
    NSArray *imageData;
    
    CCSprite *imageBg;
    CCSprite *image;

    ImageSetData *eSoundDataSet;
    NSArray *eSoundData;
    
    
    NSMutableArray *move;
    
    SimpleAudioEngine *sae;
    
    BOOL doTouch;

}

+(CCScene *) scene;

@property (nonatomic, retain) ImageSetData *imageDataSet;
@property (nonatomic, retain) NSMutableArray *card;
@property (nonatomic, retain) NSMutableArray *img;
@property (nonatomic, retain) NSArray *cardData;
@property (nonatomic, retain) NSArray *imageData;
@property (nonatomic, retain) NSMutableArray *move;

@end
