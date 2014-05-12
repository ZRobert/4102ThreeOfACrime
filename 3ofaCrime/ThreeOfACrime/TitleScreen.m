//
//  MyScene.m
//  ThreeOfACrime
//
//  Created by Robert Payne on 10/29/13.
//  Copyright (c) 2013 Robert Payne. All rights reserved.
//

#import "TitleScreen.h"
#import "MyScene.h"

@implementation TitleScreen



-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        timer = 0;
        // .15 .15 .3
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        myLabel.text = [NSString stringWithFormat: @"Three of a Crime"];
        myLabel.fontSize = 12;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       300);
        fadeIn = [SKAction fadeAlphaTo:1.0f  duration:3];
        fadeOut = [SKAction fadeAlphaTo:0.0f duration:.7f];
        fastFadeIn = [SKAction fadeAlphaTo:1.0f  duration:.3f];
        fastFadeOut = [SKAction fadeAlphaTo:0.0f duration:.3f];
        
        touch = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        touch.text = [NSString stringWithFormat: @"Touch to start!"];
        touch.fontSize = 10;
        touch.position = CGPointMake(CGRectGetMidX(self.frame),
                                       175);
        
        credits = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        credits.text = [NSString stringWithFormat: @"By: Robert Payne, Adam Arnold, Bobbi Johnson"];
        credits.fontSize = 8;
        credits.position = CGPointMake(CGRectGetMidX(self.frame),
                                       140);
      
        suspect1 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect1"];
        suspect1.size = CGSizeMake(45, 50);
        suspect2 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect2"];
        suspect2.size = CGSizeMake(45, 50);
        suspect3 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect3"];
        suspect3.size = CGSizeMake(45, 50);
        suspect4 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect4"];
        suspect4.size = CGSizeMake(45, 50);
        suspect5 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect5"];
        suspect5.size = CGSizeMake(45, 50);
        suspect6 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect6"];
        suspect6.size = CGSizeMake(45, 50);
        suspect7 = [SKSpriteNode spriteNodeWithImageNamed:@"Suspect7"];
        suspect7.size = CGSizeMake(45, 50);
        
        suspects = [[NSMutableArray alloc] init];
        [suspects addObject: suspect1];
        [suspects addObject: suspect2];
        [suspects addObject: suspect3];
        [suspects addObject: suspect4];
        [suspects addObject: suspect5];
        [suspects addObject: suspect6];
        [suspects addObject: suspect7];
        
        //init game and set up the current line up on the screen
        int i = -45;
        for(SKSpriteNode *suspect in suspects){
            suspect.position = CGPointMake(i, 230);
            i -= 55;
        
            [self addChild:suspect];
            [suspect runAction:fastFadeOut];
        }
        
        [self addChild:myLabel];
        [self addChild:credits];
        [self addChild:touch];

        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:2.0];
        MyScene *game = [[MyScene alloc] initWithSize:CGSizeMake(360,500)];
        game.scaleMode = SKSceneScaleModeAspectFill;

        [self.scene.view presentScene: game transition:reveal];


    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    //Loop to scroll the suspect images across the screen
    for(SKSpriteNode *suspect in suspects){
        if( suspect.position.x > 5 && suspect.position.x < 10){
            [suspect runAction:fadeIn];

        }else if(suspect.position.x > 340){
            suspect.position = CGPointMake(-45, suspect.position.y);
        
        } else if(suspect.position.x > 180){
            [suspect runAction:fadeOut];
        }
        suspect.position = CGPointMake(suspect.position.x + 1, suspect.position.y);
        
    }
    timer += currentTime - lastTime;
    lastTime = currentTime;
    if(timer > 3)
        credits.text = [NSString stringWithFormat:@"Music: Moon Veil"];
    if(timer >6){
        credits.text = @"Art: Guess Who";

    }if(timer > 9){
        credits.text = [NSString stringWithFormat: @"By: Robert Payne, Adam Arnold, Bobbi Johnson"];

        timer = 0;
    }
    
    
}

@end
