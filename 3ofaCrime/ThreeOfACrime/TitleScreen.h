//
//  MyScene.h
//  ThreeOfACrime
//

//  Copyright (c) 2013 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TitleScreen : SKScene {
    CGSize              viewSize;
    SKLabelNode         *myLabel;
    SKLabelNode         *touch;
    SKLabelNode         *credits;
    NSMutableArray      *suspects;
    SKSpriteNode        *suspect1;
    SKSpriteNode        *suspect2;
    SKSpriteNode        *suspect3;
    SKSpriteNode        *suspect4;
    SKSpriteNode        *suspect5;
    SKSpriteNode        *suspect6;
    SKSpriteNode        *suspect7;
    SKAction            *fadeIn;
    SKAction            *fadeOut;
    SKAction            *fastFadeIn;
    SKAction            *fastFadeOut;
    double              timer;
    double              lastTime;
}

@end
