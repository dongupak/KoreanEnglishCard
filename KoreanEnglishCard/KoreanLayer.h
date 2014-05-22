//
//  KoreanLayer.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface KoreanLayer : CCLayer 
{

    
    SimpleAudioEngine *sae;
    NSArray *aNameArray;
	
	BOOL touchEnable;
    
}

+(CCScene *) scene;
@property (nonatomic, retain) NSArray *aNameArray;

@end
