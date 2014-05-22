//
//  IntroLayer.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import <AVFoundation/AVFoundation.h>
#import "SimpleAudioEngine.h"

@interface IntroLayer : CCLayer 
{
 //   AVAudioPlayer *player;
    SimpleAudioEngine *bg;


}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
