//
// Game.m
// Created by Adam Arnold
//         and Robert Payne
//         (c) 2013
//

#include <stdlib.h>

#import "Game.h"

@implementation Game


@synthesize crim1;
@synthesize crim2;
@synthesize crim3;
@synthesize suspect1;
@synthesize suspect2;
@synthesize suspect3;
@synthesize numCrimsPresent;
@synthesize numCrimsSelected;

-(id)init {
    for(int i = 0; i < 7; i++){
        lineup[i] = NO;
    }
    
    do {
        crim1 = arc4random() % 7;
        crim2 = arc4random() % 7;
        crim3 = arc4random() % 7;
    }while (crim1== crim2 || crim2 == crim3 || crim1 == crim3);
    
    numCrimsSelected = 0;
    
    return self;
}


- (void)getNextLineup {
    do{
    numCrimsPresent = 0;
    
    do{
        suspect1 = arc4random() % 7;
    }while(lineup[suspect1] != NO);
    if(suspect1 == crim1 || suspect1 == crim2 || suspect1 == crim3)
        numCrimsPresent++;
    do{
        suspect2 = arc4random() % 7;
    }while(lineup[suspect2] != NO || suspect1 == suspect2);
    if(suspect2 == crim1 || suspect2 == crim2 || suspect2 == crim3)
        numCrimsPresent++;
    do{
        suspect3 = arc4random() %7;
    }while(lineup[suspect3] != NO || suspect1 == suspect3 || suspect2 == suspect3);
    if(suspect3 == crim1 || suspect3 == crim2 || suspect3 == crim3)
        numCrimsPresent++;
        
    }while(numCrimsPresent >= 3);
    NSLog(@"GNL Suspect1: %i",suspect1);
    NSLog(@"GNL Suspect1: %i",suspect2);
    NSLog(@"GNL Suspect1: %i",suspect3);
    NSLog(@"Crims present: %i", numCrimsPresent);

} // End of getNextLineup method


- (bool)isInLineup:(int)criminalSelected {
    if(criminalSelected == crim1){
        lineup[criminalSelected] = YES;
        numCrimsSelected++;
        return true;
    } else if(criminalSelected == crim2){
        lineup[criminalSelected] = YES;
        numCrimsSelected++;
        return true;
    } else if(criminalSelected == crim3){
        lineup[criminalSelected] = YES;
        numCrimsSelected++;
        return true;
    }
    return false;
}

- (void) printWin{
    NSLog (@"=========================");
    NSLog (@"|                        |");
    NSLog (@"|    %@      |", @"YOU WIN!!!");
    NSLog (@"|    %@      |", @"The Criminals Were:");
    NSLog (@"|    %i      |", crim1);
    NSLog (@"|    %i      |", crim2);
    NSLog (@"|    %i      |", crim3);
    NSLog (@"|                        |");
    NSLog (@"=========================");
}

- (void) printLose{
    NSLog (@"=========================");
    NSLog (@"|                        |");
    NSLog (@"|   %@       |", @"You lost..");
    NSLog (@"|   %@       |", @"The Criminals Were:");
    NSLog (@"|   %i       |", crim1);
    NSLog (@"|   %i       |", crim2);
    NSLog (@"|   %i       |", crim3);
    NSLog (@"|                        |");
    NSLog (@"=========================");
}
 
@end