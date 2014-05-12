//
//  Game.h
//  Created by Arnold, Adam
//          and Robert Payne
//          (c) 2013
//

@interface Game : NSObject {
    int         crim1;
    int         crim2;      //Have to use explicit int rather than an array
    int         crim3;      //due to restriction of making the primative array
    int         suspect1;   //not accessable from outside
    int         suspect2;
    int         suspect3;
    int         numCrimsPresent;
    int         numCrimsSelected;
    bool        lineup[7];
}

@property (nonatomic, assign) int crim1;
@property (nonatomic, assign) int crim2;
@property (nonatomic, assign) int crim3;
@property (nonatomic, assign) int suspect1;
@property (nonatomic, assign) int suspect2;
@property (nonatomic, assign) int suspect3;
@property (nonatomic, assign) int numCrimsPresent;
@property (nonatomic, assign) int numCrimsSelected;

- (void) getNextLineup;
- (bool) isInLineup:(int)criminalSelected;
- (void) printWin;
- (void) printLose;

@end