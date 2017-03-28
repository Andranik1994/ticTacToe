//
//  ViewController.m
//  TicTacToe
//
//  Created by Andranik on 7/26/16.
//  Copyright © 2016 Andranik. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>



@interface ViewController ()


@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) IBOutlet UIButton *button7;
@property (strong, nonatomic) IBOutlet UIButton *button8;
@property (strong, nonatomic) IBOutlet UIButton *button9;

@property (strong, nonatomic) IBOutlet UILabel *winerSuit;
@property (strong, nonatomic) IBOutlet UILabel *winerLabel;

@property (strong, nonatomic) IBOutlet UIButton *vsP;
@property (strong, nonatomic) IBOutlet UIButton *vsPC;


@property (nonatomic) NSArray *buttonArray;
@property (nonatomic,strong) NSNumber *count;

@property (nonatomic) BOOL gameVsPC;

@property (nonatomic,strong) NSNumber *x;
@property (nonatomic,strong) NSMutableArray *numbers;

@property (nonatomic) BOOL stop;
@property (nonatomic) BOOL firstGame;


- (void)checkWiner;

- (void)turnOffButtons;
//- (NSInteger)randomValueBetween:(NSInteger)min and:(NSInteger)max;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.player = 1;
    
    self.button1.titleLabel.text = @"";
    self.button2.titleLabel.text = @"";
    self.button3.titleLabel.text = @"";
    self.button4.titleLabel.text = @"";
    self.button5.titleLabel.text = @"";
    self.button6.titleLabel.text = @"";
    self.button7.titleLabel.text = @"";
    self.button8.titleLabel.text = @"";
    self.button9.titleLabel.text = @"";
    
    self.buttonArray = [NSArray array];
    self.buttonArray = [[NSArray alloc] initWithObjects:self.button1, self.button2, self.button3, self.button4,self.button5,self.button6,self.button7,self.button8,self.button9,nil];
    
    self.count = [[NSNumber alloc]initWithInt:0];
    
    self.gameVsPC = NO;
    [self turnOffButtons];
    
    self.numbers = [[NSMutableArray alloc]initWithObjects:@(0),@(1),@(2),@(3),@(4),@(5),@(6),@(7),@(8), nil];
    
    self.stop = NO;
    self.firstGame = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeBColor:(UISlider *)sender {
    CGFloat value = sender.value;
    UIColor *color = [UIColor colorWithRed:1.0 green:value blue:1-value alpha:0.5];
    [self.view setBackgroundColor:color];
    
}

- (void)turnOffButtons{
    for(UIButton *button in self.buttonArray)
    {
        if ([button.titleLabel.text isEqualToString:@""])
            [button setEnabled:NO];
    }
    [self.vsP setBackgroundColor:[UIColor lightGrayColor]];
    [self.vsPC setBackgroundColor:[UIColor lightGrayColor]];
}

- (IBAction)pushButton:(id)sender {
    if(self.gameVsPC == NO)
    {
        UIButton *pressedPart = (UIButton *) sender;
        [pressedPart setEnabled:NO];
        
        switch (self.player)
        {
            case 1 : {[pressedPart setTitle:@"✚" forState:UIControlStateNormal]; self.player = 2; [self checkWiner]; break;}
            case 2 : {[pressedPart setTitle:@"◉" forState:UIControlStateNormal]; self.player = 1; [self checkWiner]; break;}
            default: exit (0);
        }
    }
    else
    {
        int value = 0;
        UIButton *pressedPart = (UIButton *) sender;
        [pressedPart setEnabled:NO];
        [pressedPart setTitle:@"✚" forState:UIControlStateNormal];[self checkWiner];
        value +=1;
        //        for(UIButton *button in self.buttonArray)
        //        {
        //            if([pressedPart isEqual:button])
        //            {
        //                [self.numbers removeObjectIdenticalTo:@(value)];//(Za***t exa !!!!)sax es toxi patcharov:
        //                break;
        //            }
        //            value +=1;
        //        }
       
        while(self.stop == NO)
        {
           
#pragma mark - First  move
            
            if([self.button9.titleLabel.text isEqual:@""])
            {
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            if([self.button9.titleLabel.text isEqual:@"✚"] && self.firstGame == YES)
            {
                int r = arc4random_uniform(3);
                NSLog(@"r=%d",r);
                switch (r) {
                    case 0:
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                        value +=1;
                        [self checkWiner];
                        self.firstGame = NO;
                        break;
                    case 1:
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                        value +=1;
                        [self checkWiner];
                        self.firstGame = NO;
                        break;
                    case 2:
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                        value +=1;
                        [self checkWiner];
                        self.firstGame = NO;
                        break;
                    case 3:
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                        [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                        value +=1;
                        [self checkWiner];
                        self.firstGame = NO;
                        break;
                    default:
                        break;
                }
                break;
            }
            
#pragma mark - Os win position
            
            /*110*/
            /*000*/
            /*000*/
            if(self.button1.titleLabel.text == self.button2.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*101*/
            /*000*/
            /*000*/
            if(self.button1.titleLabel.text == self.button3.titleLabel.text && [self.button2.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*011*/
            /*000*/
            /*000*/
            if(self.button2.titleLabel.text == self.button3.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*000*/
            /*110*/
            /*000*/
            if(self.button8.titleLabel.text == self.button9.titleLabel.text && [self.button4.titleLabel.text  isEqual: @""] && [self.button8.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*101*/
            /*000*/
            if(self.button8.titleLabel.text == self.button4.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button8.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*011*/
            /*000*/
            if(self.button9.titleLabel.text == self.button4.titleLabel.text && [self.button8.titleLabel.text  isEqual: @""] && [self.button9.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }

            /*000*/
            /*000*/
            /*110*/
            if(self.button7.titleLabel.text == self.button6.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button7.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*000*/
            /*101*/
            if(self.button7.titleLabel.text == self.button5.titleLabel.text && [self.button6.titleLabel.text  isEqual: @""] && [self.button7.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*000*/
            /*011*/
            if(self.button5.titleLabel.text == self.button6.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button5.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*100*/
            /*100*/
            /*000*/
            if(self.button1.titleLabel.text == self.button8.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*100*/
            /*100*/
            if(self.button7.titleLabel.text == self.button8.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button7.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*100*/
            /*000*/
            /*100*/
            if(self.button1.titleLabel.text == self.button7.titleLabel.text && [self.button8.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*010*/
            /*010*/
            /*000*/
            if(self.button2.titleLabel.text == self.button9.titleLabel.text && [self.button6.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*010*/
            /*010*/
            if(self.button6.titleLabel.text == self.button9.titleLabel.text && [self.button2.titleLabel.text  isEqual: @""] && [self.button6.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*010*/
            /*000*/
            /*010*/
            if(self.button2.titleLabel.text == self.button6.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*001*/
            /*001*/
            /*000*/
            if(self.button3.titleLabel.text == self.button4.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*001*/
            /*001*/
            if(self.button4.titleLabel.text == self.button5.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button4.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*001*/
            /*000*/
            /*001*/
            if(self.button3.titleLabel.text == self.button5.titleLabel.text && [self.button4.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*100*/
            /*010*/
            /*000*/
            if(self.button1.titleLabel.text == self.button9.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*010*/
            /*001*/
            if(self.button9.titleLabel.text == self.button5.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button9.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*100*/
            /*000*/
            /*001*/
            if(self.button1.titleLabel.text == self.button5.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*001*/
            /*010*/
            /*000*/
            if(self.button3.titleLabel.text == self.button9.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*010*/
            /*100*/
            if(self.button9.titleLabel.text == self.button7.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button9.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*001*/
            /*000*/
            /*100*/
            if(self.button3.titleLabel.text == self.button7.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"◉"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
#pragma mark - Xs win position
            
            /*110*/
            /*000*/
            /*000*/
            if(self.button1.titleLabel.text == self.button2.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*101*/
            /*000*/
            /*000*/
            if(self.button1.titleLabel.text == self.button3.titleLabel.text && [self.button2.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*011*/
            /*000*/
            /*000*/
            if(self.button2.titleLabel.text == self.button3.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*000*/
            /*110*/
            /*000*/
            if(self.button8.titleLabel.text == self.button9.titleLabel.text && [self.button4.titleLabel.text  isEqual: @""] && [self.button8.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*101*/
            /*000*/
            if(self.button8.titleLabel.text == self.button4.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button8.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*011*/
            /*000*/
            if(self.button9.titleLabel.text == self.button4.titleLabel.text && [self.button8.titleLabel.text  isEqual: @""] && [self.button9.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*000*/
            /*000*/
            /*110*/
            if(self.button7.titleLabel.text == self.button6.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button7.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*000*/
            /*101*/
            if(self.button7.titleLabel.text == self.button5.titleLabel.text && [self.button6.titleLabel.text  isEqual: @""] && [self.button7.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*000*/
            /*011*/
            if(self.button5.titleLabel.text == self.button6.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button5.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*100*/
            /*100*/
            /*000*/
            if(self.button1.titleLabel.text == self.button8.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*100*/
            /*100*/
            if(self.button7.titleLabel.text == self.button8.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button7.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*100*/
            /*000*/
            /*100*/
            if(self.button1.titleLabel.text == self.button7.titleLabel.text && [self.button8.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:7] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*010*/
            /*010*/
            /*000*/
            if(self.button2.titleLabel.text == self.button9.titleLabel.text && [self.button6.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*010*/
            /*010*/
            if(self.button6.titleLabel.text == self.button9.titleLabel.text && [self.button2.titleLabel.text  isEqual: @""] && [self.button6.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*010*/
            /*000*/
            /*010*/
            if(self.button2.titleLabel.text == self.button6.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*001*/
            /*001*/
            /*000*/
            if(self.button3.titleLabel.text == self.button4.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*001*/
            /*001*/
            if(self.button4.titleLabel.text == self.button5.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button4.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*001*/
            /*000*/
            /*001*/
            if(self.button3.titleLabel.text == self.button5.titleLabel.text && [self.button4.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:3] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*100*/
            /*010*/
            /*000*/
            if(self.button1.titleLabel.text == self.button9.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*010*/
            /*001*/
            if(self.button9.titleLabel.text == self.button5.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button9.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*100*/
            /*000*/
            /*001*/
            if(self.button1.titleLabel.text == self.button5.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*001*/
            /*010*/
            /*000*/
            if(self.button3.titleLabel.text == self.button9.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*000*/
            /*010*/
            /*100*/
            if(self.button9.titleLabel.text == self.button7.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button9.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            /*001*/
            /*000*/
            /*100*/
            if(self.button3.titleLabel.text == self.button7.titleLabel.text && [self.button9.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:8] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
#pragma mark - Xs Not good position
            
            /*100*/
            /*001*/
            /*000*/
            if(self.button1.titleLabel.text == self.button4.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }

            /*100*/
            /*000*/
            /*010*/
            if(self.button1.titleLabel.text == self.button6.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*010*/
            /*100*/
            /*000*/
            if(self.button2.titleLabel.text == self.button8.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*010*/
            /*001*/
            /*000*/
            if(self.button2.titleLabel.text == self.button4.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }

            /*010*/
            /*000*/
            /*100*/
            if(self.button2.titleLabel.text == self.button7.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*010*/
            /*000*/
            /*001*/
            if(self.button2.titleLabel.text == self.button5.titleLabel.text && [self.button3.titleLabel.text  isEqual: @""] && [self.button2.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:2] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*001*/
            /*100*/
            /*000*/
            if(self.button3.titleLabel.text == self.button8.titleLabel.text && [self.button1.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:0] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*001*/
            /*000*/
            /*010*/
            if(self.button3.titleLabel.text == self.button6.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*000*/
            /*100*/
            /*010*/
            if(self.button8.titleLabel.text == self.button6.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button8.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*000*/
            /*100*/
            /*001*/
            if(self.button8.titleLabel.text == self.button5.titleLabel.text && [self.button7.titleLabel.text  isEqual: @""] && [self.button8.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:6] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*000*/
            /*001*/
            /*100*/
            if(self.button4.titleLabel.text == self.button7.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button4.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }

            /*000*/
            /*001*/
            /*010*/
            if(self.button4.titleLabel.text == self.button6.titleLabel.text && [self.button5.titleLabel.text  isEqual: @""] && [self.button4.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:4] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }

#pragma mark - Strange posotions
            
            /*✚00*/
            /*0◉0*/
            /*00✚*/
            if(self.button1.titleLabel.text == self.button5.titleLabel.text && [self.button2.titleLabel.text  isEqual: @""] && [self.button1.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:1] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            /*00✚*/
            /*0◉0*/
            /*✚00*/
            if(self.button3.titleLabel.text == self.button7.titleLabel.text && [self.button6.titleLabel.text  isEqual: @""] && [self.button3.titleLabel.text isEqual:@"✚"])
            {
                
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]] setEnabled:NO];
                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:5] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
                value +=1;
                [self checkWiner];
                break;
            }
            
            
            
            //int r = arc4random_uniform((unsigned)[self.numbers count]);
            
            //            if([[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:r] integerValue]] isEnabled ])
            //            {
            //                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:r] integerValue]] setEnabled:NO];
            //                [[self.buttonArray objectAtIndex:[[self.numbers objectAtIndex:r] integerValue]]  setTitle:@"◉" forState:UIControlStateNormal];
            //                [self.numbers removeObjectAtIndex:r];
            //                [self checkWiner];
            //                break;
            //            }
            NSLog(@"aaaaaa");
        }
    }
}

- (void)checkWiner {
    
    self.count=0;
    for(UIButton *button in self.buttonArray)
    {
        int value = [self.count intValue];
        if(![button.titleLabel.text isEqualToString:@""])
        {
            self.count = [NSNumber numberWithInt:value + 1];
        }
        if ([self.count isEqualToNumber:@(9)])
        {
            self.winerLabel.text = @"DRAW";
            [self turnOffButtons];
            self.stop = YES;
        }
    }
    
    if (![self.button1.titleLabel.text  isEqual: @""])
    {
        if (self.button1.titleLabel.text == self.button2.titleLabel.text && self.button2.titleLabel.text == self.button3.titleLabel.text)
        {
            self.winerSuit.text = self.button1.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
        if (self.button1.titleLabel.text == self.button9.titleLabel.text && self.button9.titleLabel.text == self.button5.titleLabel.text)
        {
            self.winerSuit.text = self.button1.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
        if (self.button1.titleLabel.text == self.button8.titleLabel.text && self.button8.titleLabel.text == self.button7.titleLabel.text)
        {
            self.winerSuit.text = self.button1.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
    }
    if (![self.button5.titleLabel.text  isEqual: @""])
    {
        if (self.button5.titleLabel.text == self.button4.titleLabel.text && self.button4.titleLabel.text == self.button3.titleLabel.text)
        {
            self.winerSuit.text = self.button5.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
        if (self.button5.titleLabel.text == self.button6.titleLabel.text && self.button6.titleLabel.text == self.button7.titleLabel.text)
        {
            self.winerSuit.text = self.button5.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
    }
    if (![self.button9.titleLabel.text  isEqual: @""])
    {
        if (self.button9.titleLabel.text == self.button3.titleLabel.text && self.button3.titleLabel.text == self.button7.titleLabel.text)
        {
            self.winerSuit.text = self.button9.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
        if (self.button9.titleLabel.text == self.button2.titleLabel.text && self.button2.titleLabel.text == self.button6.titleLabel.text)
        {
            self.winerSuit.text = self.button9.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
        if (self.button9.titleLabel.text == self.button8.titleLabel.text && self.button8.titleLabel.text == self.button4.titleLabel.text)
        {
            self.winerSuit.text = self.button9.titleLabel.text;
            self.winerLabel.text = @"is WIN";
            [self turnOffButtons];
            self.stop = YES;
        }
    }
}

- (IBAction)newGameButton:(id)sender {
    for(UIButton *button in self.buttonArray)
    {
        [button setTitle:nil forState:UIControlStateNormal];
        button.titleLabel.text = @"";
        [button setEnabled:YES];
    }
    self.player = 1;
    self.winerLabel.text = nil;
    self.winerSuit.text = nil;
    self.gameVsPC = NO;
    [self.vsP setBackgroundColor:[UIColor darkGrayColor]];
    [self.vsPC setBackgroundColor:[UIColor lightGrayColor]];
    
}

- (IBAction)newGameButtonVSPC:(id)sender {
    for(UIButton *button in self.buttonArray)
    {
        [button setTitle:nil forState:UIControlStateNormal];
        button.titleLabel.text = @"";
        [button setEnabled:YES];
    }
    self.player = 1;
    self.winerLabel.text = nil;
    self.winerSuit.text = nil;
    self.gameVsPC = YES;
    [self.vsP setBackgroundColor:[UIColor lightGrayColor]];
    [self.vsPC setBackgroundColor:[UIColor darkGrayColor]];
    self.stop = NO;
    self.numbers = [[NSMutableArray alloc]initWithObjects:@(0),@(1),@(2),@(3),@(4),@(5),@(6),@(7),@(8), nil];
    self.firstGame = YES;
}

@end
