//
//  EnglishLayer.m
//  KoreanEnglishCard
//
//  Created by 김민지-01083384867 on 13. 5. 9..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//
#import "MainMenuLayer.h"
#import "AppDelegate.h"
#import "MenuLayer.h"
#import "EnglishLayer.h"
#import "ECardLayer.h"

@implementation EnglishLayer
@synthesize aNameArray;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	EnglishLayer *layer = [EnglishLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


- (id) init {
    if((self = [super init])) {
        
        AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
        delegate.eng_num = 0;
		
		touchEnable = YES;
        
        CCSprite *bgSprite = [CCSprite spriteWithFile:@"EngBg.png"];
        [bgSprite setAnchorPoint:CGPointZero];
        [bgSprite setPosition:CGPointZero];
        [self addChild:bgSprite z:0];
        
        
        
        CCMenuItem *home = [CCMenuItemImage itemWithNormalImage:@"home_light.png" selectedImage:@"home.png" target:self
                                                       selector:@selector(gohome)];
        
        CCMenuItem *back = [CCMenuItemImage itemWithNormalImage:@"back_light.png" selectedImage:@"back.png" target:self
                                                       selector:@selector(goback)];
        
        
        CCMenu *hMenu = [CCMenu menuWithItems:home, nil];
        hMenu.position =ccp(280,440);
        [self addChild:hMenu z:3];
        
        CCMenu *bMenu = [CCMenu menuWithItems:back, nil];
        bMenu.position =ccp(40,440);
        [self addChild:bMenu z:3];
        
        
        
        CCMenuItem *a = [CCMenuItemImage itemWithNormalImage:@"a.png"
                                               selectedImage:@"a.png"
                                                      target:self
                                                    selector:@selector(english:)];
        a.tag = 0;
        
        
        CCMenuItem *b = [CCMenuItemImage itemWithNormalImage:@"b.png"
                                               selectedImage:@"b.png"
                                                      target:self
                                                    selector:@selector(english:)];
        b.tag = 1;
        
        CCMenuItem *c = [CCMenuItemImage itemWithNormalImage:@"c.png"
                                               selectedImage:@"c.png"
                                                      target:self
                                                    selector:@selector(english:)];
        c.tag = 2;
        
        CCMenuItem *d = [CCMenuItemImage itemWithNormalImage:@"d.png"
                                               selectedImage:@"d.png"
                                                      target:self
                                                    selector:@selector(english:)];
        d.tag = 3;
        
        CCMenuItem *e = [CCMenuItemImage itemWithNormalImage:@"e.png"
                                               selectedImage:@"e.png"
                                                      target:self
                                                    selector:@selector(english:)];
        e.tag = 4;
        CCMenuItem *f = [CCMenuItemImage itemWithNormalImage:@"f.png"
                                               selectedImage:@"f.png"
                                                      target:self
                                                    selector:@selector(english:)];
        f.tag = 5;
        
        
        CCMenuItem *g = [CCMenuItemImage itemWithNormalImage:@"g.png"
                                               selectedImage:@"g.png"
                                                      target:self
                                                    selector:@selector(english:)];
        g.tag = 6;
        CCMenuItem *h = [CCMenuItemImage itemWithNormalImage:@"h.png"
                                               selectedImage:@"h.png"
                                                      target:self
                                                    selector:@selector(english:)];
        h.tag = 7;
        CCMenuItem *i = [CCMenuItemImage itemWithNormalImage:@"i.png"
                                               selectedImage:@"i.png"
                                                      target:self
                                                    selector:@selector(english:)];
        i.tag = 8;
        CCMenuItem *j = [CCMenuItemImage itemWithNormalImage:@"j.png"
                                               selectedImage:@"j.png"
                                                      target:self
                                                    selector:@selector(english:)];
        j.tag = 9;
        CCMenuItem *k = [CCMenuItemImage itemWithNormalImage:@"k.png"
                                               selectedImage:@"k.png"
                                                      target:self
                                                    selector:@selector(english:)];
        k.tag = 10;
        CCMenuItem *l = [CCMenuItemImage itemWithNormalImage:@"l.png"
                                               selectedImage:@"l.png"
                                                      target:self
                                                    selector:@selector(english:)];
        l.tag = 11;
        CCMenuItem *m = [CCMenuItemImage itemWithNormalImage:@"m.png"
                                               selectedImage:@"m.png"
                                                      target:self
                                                    selector:@selector(english:)];
        m.tag = 12;
        CCMenuItem *n = [CCMenuItemImage itemWithNormalImage:@"n.png"
                                               selectedImage:@"n.png"
                                                      target:self
                                                    selector:@selector(english:)];
        n.tag = 13;
        CCMenuItem *o = [CCMenuItemImage itemWithNormalImage:@"o.png"
                                               selectedImage:@"o.png"
                                                      target:self
                                                    selector:@selector(english:)];
        o.tag = 14;
        
        
        
        
        CCMenuItem *p = [CCMenuItemImage itemWithNormalImage:@"p.png"
                                               selectedImage:@"p.png"
                                                      target:self
                                                    selector:@selector(english:)];
        p.tag = 15;
        CCMenuItem *q = [CCMenuItemImage itemWithNormalImage:@"q.png"
                                               selectedImage:@"q.png"
                                                      target:self
                                                    selector:@selector(english:)];
        q.tag = 16;
        CCMenuItem *r = [CCMenuItemImage itemWithNormalImage:@"r.png"
                                               selectedImage:@"r.png"
                                                      target:self
                                                    selector:@selector(english:)];
        r.tag = 17;
        CCMenuItem *s = [CCMenuItemImage itemWithNormalImage:@"s.png"
                                               selectedImage:@"s.png"
                                                      target:self
                                                    selector:@selector(english:)];
        s.tag = 18;
        CCMenuItem *t = [CCMenuItemImage itemWithNormalImage:@"t.png"
                                               selectedImage:@"t.png"
                                                      target:self
                                                    selector:@selector(english:)];
        t.tag = 19;
        CCMenuItem *u = [CCMenuItemImage itemWithNormalImage:@"u.png"
                                               selectedImage:@"u.png"
                                                      target:self
                                                    selector:@selector(english:)];
        u.tag = 20;
        CCMenuItem *v = [CCMenuItemImage itemWithNormalImage:@"v.png"
                                               selectedImage:@"v.png"
                                                      target:self
                                                    selector:@selector(english:)];
        v.tag = 21;
        CCMenuItem *w = [CCMenuItemImage itemWithNormalImage:@"w.png"
                                               selectedImage:@"w.png"
                                                      target:self
                                                    selector:@selector(english:)];
        w.tag = 22;
        CCMenuItem *x = [CCMenuItemImage itemWithNormalImage:@"x.png"
                                               selectedImage:@"x.png"
                                                      target:self
                                                    selector:@selector(english:)];
        x.tag = 23;
        CCMenuItem *y = [CCMenuItemImage itemWithNormalImage:@"y.png"
                                               selectedImage:@"y.png"
                                                      target:self
                                                    selector:@selector(english:)];
        y.tag = 24;
        CCMenuItem *z = [CCMenuItemImage itemWithNormalImage:@"z.png"
                                               selectedImage:@"z.png"
                                                      target:self
                                                    selector:@selector(english:)];
        z.tag = 25;
        
        
        
        
        CCMenu *menu = [CCMenu menuWithItems:a, b, c, d,e,nil];
        menu.position = ccp(160,410);
        [menu alignItemsHorizontally];
        [self addChild:menu z:2];
        
        CCMenu *menu1 = [CCMenu menuWithItems:f,g,h,i,j,k,nil];
        menu1.position = ccp(160,360);
        [menu1 alignItemsHorizontally];
        [self addChild:menu1 z:2];
        
        CCMenu *menu2 = [CCMenu menuWithItems:l,m,n,o,p,q, nil];
        menu2.position = ccp(160,310);
        [menu2 alignItemsHorizontally];
        [self addChild:menu2 z:2];
        
        CCMenu *menu3 = [CCMenu menuWithItems:r,s,t,u,v,nil];
        menu3.position = ccp(160,265);
        [menu3 alignItemsHorizontally];
        [self addChild:menu3 z:2];
        
        CCMenu *menu4 = [CCMenu menuWithItems:w,x,y,z,nil];
        menu4.position = ccp(160,220);
        [menu4 alignItemsHorizontally];
        [self addChild:menu4 z:2];
        
        
        
        
        
    }
    
    return self;
}

- (void)english: (id) sender
{
	if (touchEnable) {
			touchEnable = NO;
	
    AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    
    CCMenuItem *item = (CCMenuItem *) sender;
    delegate.eng_num = item.tag;
    
    id scale = [CCScaleBy actionWithDuration:0.1 scale:1.2];
    id total = [CCSequence actions:scale, [scale reverse], nil];
    [item runAction:total];
    
    aNameArray = [NSArray arrayWithObjects:
                  @"A.mp3", @"B.mp3",
                  @"C.mp3", @"D.mp3",
                  @"E.mp3", @"F.mp3",
                  @"G.mp3", @"H.mp3",
                  @"I.mp3", @"J.mp3",
                  @"K.mp3", @"L.mp3",
                  @"M.mp3", @"N.mp3",
                  @"O.mp3", @"P.mp3",
                  @"Q.mp3", @"R.mp3",
                  @"S.mp3", @"T.mp3",
                  @"U.mp3", @"V.mp3",
                  @"W.mp3", @"X.mp3",
                  @"Y.mp3", @"Z.mp3",nil];
    
    sae = [SimpleAudioEngine sharedEngine];
    [sae playEffect:aNameArray[item.tag]];
        
    [self performSelector:@selector(card) withObject:nil afterDelay:0.5f];
	}
    
}

-(void) card {
    CCScene *scene = [CCTransitionProgressRadialCCW transitionWithDuration:0.5
                                                                     scene:[ECardLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
}


-(void) gohome
{
    CCScene *scene = [CCTransitionFlipX transitionWithDuration:0.5
                                                         scene:[MainMenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}
-(void) goback
{
    CCScene *scene = [CCTransitionSlideInL transitionWithDuration:0.5
                                                           scene:[MenuLayer scene]];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}





@end
