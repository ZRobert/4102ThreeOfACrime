//
//  MyScene.m
//  ThreeOfACrime
//
//  Created by Robert Payne on 10/29/13.
//  Copyright (c) 2013 Robert Payne. All rights reserved.
//

#import "MyScene.h"
#import "Game.h"
#import "TitleScreen.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        viewSize = size;
        win = NO;
        lose = NO;
        myGame = [[Game alloc]init];
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        //setting up animations for the suspects when they are touched
        action = [SKAction rotateByAngle:-100 duration:4];
        action2 = [SKAction fadeAlphaTo:0.01 duration:4];
        action3 = [SKAction scaleBy:4 duration:4];
        fastFadeIn = [SKAction fadeAlphaTo:1.0f  duration:.3f];
        fastFadeOut = [SKAction fadeAlphaTo:0.0f duration:.3f];
        
        //setting up the text that displays at the top saying how many criminals are present
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        myLabel.fontSize = 12;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),300);
        
        //setting up the positions that the suspects will be set to on the display
        positionA = CGPointMake(70,239);
        positionB = CGPointMake(175,239);
        positionC = CGPointMake(280,239);
        
        //setting up the pass button which is used to get a new line up
        passButton = [SKSpriteNode spriteNodeWithImageNamed:@"passbutton"];
        passButton.size = CGSizeMake(240, 40);
        passButton.position = CGPointMake(175, 154);
        
        //setting up the suspects and the size of the sprite
        suspect1 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect1"];
        suspect1.size = CGSizeMake(90, 100);
        suspect2 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect2"];
        suspect2.size = CGSizeMake(90, 100);
        suspect3 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect3"];
        suspect3.size = CGSizeMake(90, 100);
        suspect4 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect4"];
        suspect4.size = CGSizeMake(90, 100);
        suspect5 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect5"];
        suspect5.size = CGSizeMake(90, 100);
        suspect6 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect6"];
        suspect6.size = CGSizeMake(90, 100);
        suspect7 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect7"];
        suspect7.size = CGSizeMake(90, 100);
        
        //initializing the array to hold the suspects and adding them in
        suspects = [[NSMutableArray alloc] init];
        [suspects addObject: suspect1];
        [suspects addObject: suspect2];
        [suspects addObject: suspect3];
        [suspects addObject: suspect4];
        [suspects addObject: suspect5];
        [suspects addObject: suspect6];
        [suspects addObject: suspect7];

        
        //init game and set up the current line up on the screen
        for(SKSpriteNode *suspect in suspects){//need to push the suspects we don't want
                                                //on display to offscreen location
            suspect.position = CGPointMake(10000,10000);
        }
        [self newLineUp];
        
        //adding all the suspect sprites to the scene as well as the pass button and the label
        for(SKSpriteNode *suspect in suspects) {
            [self addChild:suspect];
        }
        [self addChild:passButton];
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];

        if([suspect1 containsPoint:location]){  //when suspect 1 is touched
            [self checkSelection:suspect1 withNumber:0];
        }
        else if([suspect2 containsPoint:location]){ //when suspect 2 is touched
            [self checkSelection:suspect2 withNumber:1];
        }
        else if([suspect3 containsPoint:location]){ //when suspect 3 is touched
            [self checkSelection:suspect3 withNumber:2];
        }
        else if([suspect4 containsPoint:location]){ //when suspect 4 is touched
            [self checkSelection:suspect4 withNumber:3];
        }
        else if([suspect5 containsPoint:location]){ //when suspect 5 is touched
            [self checkSelection:suspect5 withNumber:4];
        }
        else if([suspect6 containsPoint:location]){ //when suspect 6 is touched
            [self checkSelection:suspect6 withNumber:5];
        }
        else if([suspect7 containsPoint:location]){ //when suspect 7 is touched
            [self checkSelection:suspect7 withNumber:6];
        }
        else if([passButton containsPoint:location]){ //when pass is touched
            [self newLineUp];
        }
    }
    if(win){    //change the message to a congratulatory one and go to title screen
        myLabel.text = @"YOU WIN :D";
        [self transitionToTitle];
    }
    if(lose){  //display obligatory sadface and escort the user back to the title screen sans
                //ego
        myLabel.text = @"YOU LOSE ):";
        [self transitionToTitle];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
}

-(void)checkSelection:(SKSpriteNode*)selection withNumber:(int) number{
    if([myGame isInLineup:number]){
        [selection runAction: action];
        [selection runAction:action2];
        [selection runAction:action3];
        if(myGame.numCrimsSelected == 3){
            win = YES;
        }
    } else{
        lose = YES;
    }
    if(!lose){  //no need to get a new lineup if they lost
        [self newLineUp];
        [selection runAction:[SKAction moveToY:500 duration:8]];
        [selection runAction:[SKAction moveTo:CGPointMake(300, 300) duration:.01]];

    }
}

-(void)newLineUp{
    //pushing the suspects to a location off display and getting a new lineup
    for(SKSpriteNode *suspect in suspects){
        [suspect runAction:fastFadeOut];
        suspect.position = CGPointMake(10000,10000);
    }
    [myGame getNextLineup];
    if(myGame.numCrimsPresent == 0)
            myLabel.text = [NSString stringWithFormat: @"There are no criminals present..."];
    if(myGame.numCrimsPresent == 1)
        myLabel.text = [NSString stringWithFormat: @"There is a criminal present..."];
    if(myGame.numCrimsPresent > 1)
        myLabel.text = [NSString stringWithFormat: @"There are %i criminals present...", [myGame numCrimsPresent]];
    
    suspectPosA = myGame.suspect1;
    suspectPosB = myGame.suspect2;
    suspectPosC = myGame.suspect3;
    //putting the new suspects on screen
    pos1 = [suspects objectAtIndex:suspectPosA];
    pos1.position = positionA;
    [pos1 runAction:fastFadeIn];
    pos2 = [suspects objectAtIndex:suspectPosB];
    pos2.position = positionB;
    [pos2 runAction:fastFadeIn];
    pos3 = [suspects objectAtIndex:suspectPosC];
    pos3.position = positionC;
    [pos3 runAction:fastFadeIn];
}

-(void)transitionToTitle{
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:2.0];
    TitleScreen *title = [[TitleScreen alloc] initWithSize:CGSizeMake(360,500)];
    title.scaleMode = SKSceneScaleModeAspectFill;
    [self.scene.view presentScene: title transition:reveal];
}

@end
