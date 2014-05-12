//
//  MyScene.h
//  ThreeOfACrime
//

//  Copyright (c) 2013 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@class Game;

@interface MyScene : SKScene {
    CGSize viewSize;
    Game *myGame;
    SKLabelNode         *myLabel;
    CGPoint             positionA;
    CGPoint             positionB;
    CGPoint             positionC;
    SKSpriteNode        *pos1;
    SKSpriteNode        *pos2;
    SKSpriteNode        *pos3;
    SKSpriteNode        *passButton;
    SKSpriteNode        *suspect1;
    SKSpriteNode        *suspect2;
    SKSpriteNode        *suspect3;
    SKSpriteNode        *suspect4;
    SKSpriteNode        *suspect5;
    SKSpriteNode        *suspect6;
    SKSpriteNode        *suspect7;
    NSMutableArray      *suspects;
    SKAction            *action;
    SKAction            *action2;
    SKAction            *action3;
    SKAction            *fastFadeIn;
    SKAction            *fastFadeOut;
    int                 suspectPosA;
    int                 suspectPosB;
    int                 suspectPosC;
    bool                win;
    bool                lose;

}

@end
