//
//  data.m
//  ddokGame1
//
//  Created by apple03 on 13. 5. 16..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "ImageSetData.h"


@implementation ImageSetData

@synthesize isItKorean;

@synthesize eImageNum;
@synthesize kImageNum;
@synthesize cards_0;
@synthesize cards_1;
@synthesize cards_2;
@synthesize images_0;
@synthesize images_1;
@synthesize images_2;

@synthesize cardSet;
@synthesize imageSet;

@synthesize game1_stage;
@synthesize game1_score;
@synthesize game2_stage;
@synthesize game2_score;
@synthesize gameOverIndex;

@synthesize rand3Buf;
@synthesize rand10Buf;

@synthesize kCards_0;
@synthesize kCards_1;
@synthesize kCards_2;
@synthesize kImages_0;
@synthesize kImages_1;
@synthesize kImages_2;

@synthesize kCardSet;
@synthesize kImageSet;

@synthesize eSound_0;
@synthesize eSound_1;
@synthesize eSound_2;
@synthesize eSoundSet;

@synthesize kSound_0;
@synthesize kSound_1;
@synthesize kSound_2;
@synthesize kSoundSet;

@synthesize imageMove;

@synthesize xSound;


- (void) dealloc
{
	[super dealloc];
}

static ImageSetData *shareddata = nil;

-(id) init
{
    self = [super init];
    if (self) {
        
        self.rand10Buf = [NSMutableArray arrayWithCapacity:10];
        self.rand3Buf = [NSMutableArray arrayWithCapacity:10];
        
        self.game1_stage = 1;
        self.game2_stage = 1;
        self.game2_score = 0;
        self.game1_score = 0;

        self.imageSet = [NSMutableArray arrayWithCapacity:3];
        self.cardSet = [NSMutableArray arrayWithCapacity:3];
        
        self.kImageSet = [NSMutableArray arrayWithCapacity:3];
        self.kCardSet = [NSMutableArray arrayWithCapacity:3];
        self.eSoundSet = [NSMutableArray arrayWithCapacity:3];
        self.kSoundSet = [NSMutableArray arrayWithCapacity:3];
        
        
        cards_0 = [NSMutableArray array];
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"E_Card.plist"];
        for (int i = 0; i < 26; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"e_card_%02d_0.png",i]];
            [cards_0 addObject:tmpFrame];
        }
        
        cards_1 = [NSMutableArray array];
        for (int i = 0; i < 26; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"e_card_%02d_1.png",i]];
            [cards_1 addObject:tmpFrame];
        }
        
        cards_2 = [NSMutableArray array];
        for (int i = 0; i < 26; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"e_card_%02d_2.png",i]];
            [cards_2 addObject:tmpFrame];
        }
        
        [self.cardSet addObject:cards_0];
        [self.cardSet addObject:cards_1];
        [self.cardSet addObject:cards_2];
        
        images_0 = [NSMutableArray array];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"E_Image.plist"];
        for (int i = 0; i < 26; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"e_im_%02d_0.png",i]];
            [images_0 addObject:tmpFrame];
        }
        
        images_1 = [NSMutableArray array];
        for (int i = 0; i < 26; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"e_im_%02d_1.png",i]];
            [images_1 addObject:tmpFrame];
        }
        
        images_2 = [NSMutableArray array];
        for (int i = 0; i < 26; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"e_im_%02d_2.png",i]];
            [images_2 addObject:tmpFrame];
        }

        [self.imageSet addObject:images_0];
        [self.imageSet addObject:images_1];
        [self.imageSet addObject:images_2];
        
        self.eImageNum = images_0.count;

        kCards_0 = [NSMutableArray array];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"K_Card.plist"];
        for (int i = 0; i < 14; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"k_card_%02d_0.png",i]];
            [kCards_0 addObject:tmpFrame];
        }
        
        kCards_1 = [NSMutableArray array];
        for (int i = 0; i < 14; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"k_card_%02d_1.png",i]];
            [kCards_1 addObject:tmpFrame];
        }
        kCards_2 = [NSMutableArray array];
        for (int i = 0; i < 14; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"k_card_%02d_2.png",i]];
            [kCards_2 addObject:tmpFrame];
        }
        [self.kCardSet addObject:kCards_0];
        [self.kCardSet addObject:kCards_1];
        [self.kCardSet addObject:kCards_2];

        
        kImages_0 = [NSMutableArray array];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"K_Image.plist"];
        for (int i = 0; i < 14; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"k_im_%02d_0.png",i]];
            [kImages_0 addObject:tmpFrame];
        }
        kImages_1 = [NSMutableArray array];
        for (int i = 0; i < 14; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"k_im_%02d_1.png",i]];
            [kImages_1 addObject:tmpFrame];
        }
        kImages_2 = [NSMutableArray array];
        for (int i = 0; i < 14; i ++) {
            CCSpriteFrame *tmpFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"k_im_%02d_2.png",i]];
            [kImages_2 addObject:tmpFrame];
        }
        
        [self.kImageSet addObject:kImages_0];
        [self.kImageSet addObject:kImages_1];
        [self.kImageSet addObject:kImages_2];
        
        kImageNum = kImages_0.count;

        eSound_0 = [NSMutableArray array];
        for (int i=0; i<26; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"e_sound_%02d_0.mp3",i]];
            [eSound_0 addObject:tmpArray];
        }
    
        eSound_1 = [NSMutableArray array];
        for (int i=0; i<26; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"e_sound_%02d_1.mp3",i]];
            [eSound_1 addObject:tmpArray];
        }
        eSound_2 = [NSMutableArray array];
        for (int i=0; i<26; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"e_sound_%02d_2.mp3",i]];
            [eSound_2 addObject:tmpArray];
        }
        
        [self.eSoundSet addObject:eSound_0];
        [self.eSoundSet addObject:eSound_1];
        [self.eSoundSet addObject:eSound_2];

        kSound_0 = [NSMutableArray array];
        for (int i=0; i<14; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"k_sound_%02d_0.mp3",i]];
            [kSound_0 addObject:tmpArray];
        }
        
        kSound_1 = [NSMutableArray array];
        for (int i=0; i<14; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"k_sound_%02d_1.mp3",i]];
            [kSound_1 addObject:tmpArray];
        }
        
        kSound_2 = [NSMutableArray array];
        for (int i=0; i<14; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"k_sound_%02d_2.mp3",i]];
            [kSound_2 addObject:tmpArray];
        }
        
        [self.kSoundSet addObject:kSound_0];
        [self.kSoundSet addObject:kSound_1];
        [self.kSoundSet addObject:kSound_2];
        
        
        
        self.xSound = [NSMutableArray array];
        for (int i=1; i<4; i++) {
            NSString *tmpArray = [NSString stringWithString:[NSString stringWithFormat:@"ddeng%d.mp3",i]];
            [xSound addObject:tmpArray];
        }
        
        
        
        self.imageMove = [NSMutableArray array];
        
        CGSize winSize = CGSizeMake(320, 480);
        
        id scale = [CCScaleBy actionWithDuration:0.2 scale:2.2];
        id scaleT = [CCSequence actions: scale, [scale reverse], scale, [scale reverse], scale, [scale reverse],nil];
        
        id up = [CCMoveBy actionWithDuration:0.3 position:ccp(200,200)];
        id up1 = [CCMoveBy actionWithDuration:0.3 position:ccp(-400,0)];
        id up2 = [CCMoveBy actionWithDuration:0.3 position:ccp(400, -200)];
        id up3 = [CCMoveBy actionWithDuration:0.3 position:ccp(-400,0)];
        id up4 = [CCMoveTo actionWithDuration:0.3 position:ccp(winSize.width/2, winSize.height/2.2)];
        id upT = [CCSequence actions:up, up1, up2, up3, up4, nil];
        
        id rotate2 = [CCRotateBy actionWithDuration:2 angle:360];
        
        id rotate4_1 = [CCPlace actionWithPosition:ccp(-50,350)];
        id rotate4_2 = [CCScaleTo actionWithDuration:0 scale:0.3];
        id rotate4_22 = [CCSequence actions:rotate4_1,rotate4_2, nil];
        
        id rotate4_3 = [CCRotateTo actionWithDuration:2.5 angle:360*5];
        id rotate4_4 = [CCMoveTo actionWithDuration:2.5 position:ccp(winSize.width/2, winSize.height/2.2)];
        id rotate4_41 = [CCScaleTo actionWithDuration:2.5 scale:1];
        id rotate4_44 = [CCSpawn actions:rotate4_41, rotate4_3, rotate4_4, nil];
        id rotate4 = [CCSequence actions:rotate4_22, rotate4_44, nil];
        
        id blink = [CCBlink actionWithDuration:2 blinks:3];
        
        id tint = [CCTintBy actionWithDuration:0.4 red:255 green:0 blue:0];
        id tint1 = [CCTintBy actionWithDuration:0.4 red:0 green:255 blue:0];
        id tint2 = [CCTintBy actionWithDuration:0.4 red:0 green:0 blue:255];
        id tint3 = [CCTintBy actionWithDuration:0.4 red:255 green:255 blue:0];
        id tint4 = [CCTintBy actionWithDuration:0.4 red:0 green:255 blue:255];
        id tint5 = [CCTintBy actionWithDuration:0.4 red:255 green:0 blue:255];
        id tint6 = [CCTintBy actionWithDuration:0.1 red:0 green:0 blue:0];
        
        id tint7 = [CCSequence actions:tint, tint1, tint2, tint3, tint4, tint5, tint6, nil];
        
        id tintRot = [CCRotateTo actionWithDuration:1 angle:50];
        id tintRot1 = [CCRotateTo actionWithDuration:1 angle:-50];
        id tintRot2 = [CCRotateTo actionWithDuration:0.5 angle:0];
        id tintRot3 = [CCSequence actions:tintRot, tintRot1, tintRot2,nil];
        
        id tintT = [CCSpawn actions:tint7, tintRot3, nil];
        
        [self.imageMove addObject:scaleT];
        [self.imageMove addObject:upT];
        [self.imageMove addObject:rotate2];
        [self.imageMove addObject:rotate4];
        [self.imageMove addObject:blink];
        [self.imageMove addObject:tintT];

    }
    
    return self;
}

+ (ImageSetData *) sharedData
{
    @synchronized(self)
	{
        if (shareddata == nil)
		{
            [[[self alloc] init] autorelease];
        }
    }
	
    return shareddata;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
	{
        if(shareddata == nil)
		{
            shareddata = [super allocWithZone:zone];
            return shareddata;
        }
    }
	
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{	
    return self;
}

- (id) retain
{
    return self;
}

- (unsigned) retainCount
{
    return UINT_MAX;
}

- (id) autorelease
{
    return self;
}

@end

