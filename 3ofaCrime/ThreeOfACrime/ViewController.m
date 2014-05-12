//
//  ViewController.m
//  ThreeOfACrime
//
//  Created by Robert Payne on 10/29/13.
//  Copyright (c) 2013 Robert Payne. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import "TitleScreen.h"
@import AVFoundation;

@interface ViewController()
@property (nonatomic) AVAudioPlayer * backgroundMusicPlayer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    skView = (SKView *)self.view;
    // Create and configure the scene.
    SKScene * title = [TitleScreen sceneWithSize:skView.bounds.size];
    title.scaleMode = SKSceneScaleModeAspectFill;
    // Present the scene.
    NSError *error;
    NSURL * backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"Moon_Veil_-_06_-_Ivory" withExtension:@"mp3"];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    self.backgroundMusicPlayer.numberOfLoops = -1;
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    [skView presentScene:title];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end


