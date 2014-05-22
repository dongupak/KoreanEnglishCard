//
//  AppDelegate.h
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SimpleAudioEngine.h"

#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
 //   AVAudioPlayer *player;
    SimpleAudioEngine *bg;

    
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
    NSInteger menu_num;
    
    NSInteger eng_num;
    NSInteger kor_num;
    
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (readwrite) NSInteger menu_num;
@property (readwrite) NSInteger eng_num;
@property (readwrite) NSInteger kor_num;
@end
