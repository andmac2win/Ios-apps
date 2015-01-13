//
//  ViewController.m
//  TicTacToe
//
//  Created by andrew Mcdonald on 1/12/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height  

//  HOMEWORK
// center squares on View
// Score Label on top that keeps track of wins for each player "two global instance variable that keeps score"
// make buttons change colors instead of title (reset colors when play again)
// Button at bottom that resets game scores.

@interface ViewController () <UIAlertViewDelegate>


@end

@implementation ViewController
{
    int playerTurn;
    
    NSMutableArray * squares;
    
    NSMutableArray * buttons;
    
    int player1Score;
    int player2Score;
    
    UILabel * scorelabel;
    UILabel * score2label;
    
    UIButton * resetButton;
    NSArray * playerColors;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    playerColors = @[
                     [UIColor lightGrayColor],
                     [UIColor magentaColor],
                     [UIColor cyanColor],
                     ];
                     
    buttons = [@[] mutableCopy]; ///////// example of 2 diff alloc and inits. this is literals...
    playerTurn =1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0,
                 ] mutableCopy];     // [] is the mutable array, changing the values inside makes it mutable
    
    int rowCount = 3;
    int colCount = 3;
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGFloat padding = -20; //padding to center see below as well
    // below is a method to center squares
    CGFloat fullWidth = (colCount * width) + (rowCount -1) * padding;
    CGFloat fullHeight = (rowCount * height) + (rowCount -1) * padding;
    int buttonCount = 0;
    
   
    
    
    

    
    
    for (int r = 0; r < rowCount; r++) {
    //loop per row
        
        for (int c =0; c < colCount; c++) {
        //loop per column
            
            CGFloat x = c * (width + padding) + (SCREEN_WIDTH- fullWidth) / 2;
            
            CGFloat y = r * (height + padding) +(SCREEN_HEIGHT- fullHeight) / 2;
            
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor =playerColors[0];
            
            //[button setTitle:[NSString stringWithFormat:@"%d",buttonCount]forState:UIControlStateNormal];
            button.tag =buttonCount;
            
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside]; //added listener when button is touched.
            
            button.layer.cornerRadius = height / 2;////////////circle button method
            button.alpha = 0.6; //////      transparent method
            
            [self.view addSubview:button];
            [buttons addObject:button];
            
            buttonCount++;
            // WHERE LABEL IS MADE FOR PLAYER 1 AND PLAYER2
            
           // score2label.backgroundColor = [UIColor redColor];
            
//            self.player1Score = 0;
//            self.player2Score = 0;
            
            

        }
       
        
    }
    
    player1Score = 0;
    player2Score =0;
    
    scorelabel = [[UILabel alloc] initWithFrame:CGRectMake(20,20,SCREEN_WIDTH-40,40)];
    scorelabel.text = [NSString stringWithFormat:@"Player 1:%d", player1Score];
    [self.view addSubview:scorelabel];
    //scorelabel.backgroundColor = [UIColor greenColor];
    
    score2label = [[UILabel alloc] initWithFrame:CGRectMake(20,20,SCREEN_WIDTH-40,40)];
    score2label.text = [NSString stringWithFormat:@"Player 2:%d", player2Score];
    score2label.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:score2label];
    // THIS IS THE RESET BUTTON
    resetButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) / 2, SCREEN_HEIGHT - 50, 100, 40)];

    resetButton.backgroundColor =[UIColor yellowColor];

    [self.view addSubview:resetButton];
    [resetButton addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];

    
    NSLog(@"subviews %@",self.view.subviews);
    
} // viewdidload close

-(void)squareTapped:(UIButton *)button {
    
    if ([squares[button.tag] intValue] != 0){ return; }   //if clicked button, you can't click button again ex: button stays as a 1.
    
    squares[button.tag] = @(playerTurn);
    
    //[button setTitle:[NSString stringWithFormat:@"%d",playerTurn] forState:UIControlStateNormal];
    button.backgroundColor =playerColors[playerTurn];
    playerTurn = (playerTurn == 2) ? 1 : 2;
    
//    if (playerTurn ==1){
//        button.backgroundColor = [UIColor redColor];}
//    else {
//        button.backgroundColor = [UIColor greenColor];
//        
    
    [self checkForWin];
    }
    

    

    //  NSLog(@"button tapped %d",(int)button.tag);     //can run without the (int)  add that to change class of button.tag)



-(void)checkForWin{
    
    NSArray * possibilities = @[  //rows
                                @[@0,@1,@2],
                                @[@3,@4,@5],
                                @[@6,@7,@8],
                                // columns
                                @[@0,@3,@6],
                                @[@1,@4,@7],
                                @[@2,@5,@8],
                                //diagnols
                                @[@0,@4,@8],
                                @[@2,@4,@6],
                                ];
    for (NSArray * possibility in possibilities) {
        
        [self checkPossibility:possibility witPlayer:1];
        [self checkPossibility:possibility witPlayer:2];
     
            
        }
    }
    


-(void)checkPossibility:(NSArray *) possibility witPlayer:(int)player{
    
    BOOL playerInSquare1 = ([squares[[possibility[0] intValue]] intValue] == player);
    BOOL playerInSquare2 = ([squares[[possibility[1] intValue]] intValue] == player);
    BOOL playerInSquare3 = ([squares[[possibility[2] intValue]] intValue] == player);
    
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        //switch rather than if else method can only pass int in switch method.
      //  switch (player) {
        //    case 1:
          //      self.player1Score++;
            //    break;
                
            //case 2:
              //  self.player2Score++;
                //break;
//        }
        
        //player 1 won
        NSLog(@"Player %d Won",player);
        
        NSString * message = [NSString stringWithFormat:@"Player %d Won",player];
        
        UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"Winner" message:message delegate:self cancelButtonTitle:@"Play Again Now!" otherButtonTitles:nil];
        
        [alertview show];
        
        if (player == 1)  {
            player1Score++;
        }else if (player ==2){
            player2Score++;
        }
      
        scorelabel.text = [NSString stringWithFormat:@"Player 1:%d", player1Score];

        score2label.text = [NSString stringWithFormat:@"Player 2:%d", player2Score];

    
        }
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    //square titles
    //playerTurn = 1
    
    for (UIButton * button in buttons) {
        
        button.backgroundColor = [UIColor blueColor];
    }
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0,
                 ] mutableCopy];
    
  NSLog(@"Play Again");
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
