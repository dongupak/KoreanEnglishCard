//
//  data.h
//  ddokGame1
//
//  Created by apple03 on 13. 5. 16..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//
#import <GameKit/GameKit.h>
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface ImageSetData : NSObject{
    
//    SimpleAudioEngine *sae;
    
    BOOL isItKorean;

    int eimageNum;
    int kimageNum;
    
    NSMutableArray *cards_0;
    NSMutableArray *cards_1;
    NSMutableArray *cards_2;
    
    NSMutableArray *images_0;
    NSMutableArray *images_1;
    NSMutableArray *images_2;
    
    NSMutableArray *cardSet;
    NSMutableArray *imageSet;
    
    int game1_stage;
    int game2_stage;
    int game1_score;
    int game2_score;
    int gameOverIndex;
    
    NSMutableArray *rand3Buf;
    NSMutableArray *rand10buf;
    
   //5/25수정코드
    NSMutableArray *kCards_0;
    NSMutableArray *kCards_1;
    NSMutableArray *kCards_2;
    
    NSMutableArray *kImages_0;
    NSMutableArray *kImages_1;
    NSMutableArray *kImages_2;
    
    NSMutableArray *kCardSet;
    NSMutableArray *kImageSet;
    
    //5/25수정코드
    NSMutableArray *eSound_0;
    NSMutableArray *eSound_1;
    NSMutableArray *eSound_2;
    NSMutableArray *eSoundSet;
    
    NSMutableArray *kSound_0;
    NSMutableArray *kSound_1;
    NSMutableArray *kSound_2;
    NSMutableArray *kSoundSet;
    
    NSMutableArray *imageMove;
    
    NSMutableArray *xSound;
    
}

@property (readwrite) BOOL isItKorean;

@property (readwrite) int eImageNum;
@property (readwrite) int kImageNum;

@property (nonatomic, retain) NSMutableArray *cards_0;
@property (nonatomic, retain) NSMutableArray *cards_1;
@property (nonatomic, retain) NSMutableArray *cards_2;
@property (nonatomic, retain) NSMutableArray *images_0;
@property (nonatomic, retain) NSMutableArray *images_1;
@property (nonatomic, retain) NSMutableArray *images_2;

@property (nonatomic, retain) NSMutableArray *cardSet;
@property (nonatomic, retain) NSMutableArray *imageSet;

@property (readwrite) int game1_stage;
@property (readwrite) int game2_stage;
@property (readwrite) int game1_score;
@property (readwrite) int game2_score;
@property (readwrite) int gameOverIndex;

@property (nonatomic, retain) NSMutableArray *rand3Buf;
@property (nonatomic, retain) NSMutableArray *rand10Buf;

@property (nonatomic, retain) NSMutableArray *kCards_0;
@property (nonatomic, retain) NSMutableArray *kCards_1;
@property (nonatomic, retain) NSMutableArray *kCards_2;
@property (nonatomic, retain) NSMutableArray *kImages_0;
@property (nonatomic, retain) NSMutableArray *kImages_1;
@property (nonatomic, retain) NSMutableArray *kImages_2;

@property (nonatomic, retain) NSMutableArray *kCardSet;
@property (nonatomic, retain) NSMutableArray *kImageSet;

@property (nonatomic, retain) NSMutableArray *eSound_0;
@property (nonatomic, retain) NSMutableArray *eSound_1;
@property (nonatomic, retain) NSMutableArray *eSound_2;
@property (nonatomic, retain) NSMutableArray *eSoundSet;


@property (nonatomic, retain) NSMutableArray *kSound_0;
@property (nonatomic, retain) NSMutableArray *kSound_1;
@property (nonatomic, retain) NSMutableArray *kSound_2;
@property (nonatomic, retain) NSMutableArray *kSoundSet;

@property (nonatomic, retain) NSMutableArray *imageMove;

@property (nonatomic, retain) NSMutableArray *xSound;

//@property (nonatomic, retain) SimpleAudioEngine *sae;

+ (ImageSetData *) sharedData;

@end

