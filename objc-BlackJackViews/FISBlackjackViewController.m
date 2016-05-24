//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by John Richardson on 5/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()

- (IBAction)deal:(id)sender;
- (IBAction)hit:(id)sender;
- (IBAction)stay:(id)sender;

@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.winner setHidden:YES];
    [self.houseScore setHidden:YES];
    [self.houseStayed setHidden:YES];
    [self.houseCard1 setHidden:YES];
    [self.houseCard2 setHidden:YES];
    [self.houseCard3 setHidden:YES];
    [self.houseCard4 setHidden:YES];
    [self.houseCard5 setHidden:YES];
    [self.houseBust setHidden:YES];
    [self.houseBlackjack setHidden:YES];
    self.playerScore.text = @"Score: 0";
    [self.playerStayed setHidden:YES];
    [self.playerCard1 setHidden:YES];
    [self.playerCard2 setHidden:YES];
    [self.playerCard3 setHidden:YES];
    [self.playerCard4 setHidden:YES];
    [self.playerCard5 setHidden:YES];
    [self.playerBust setHidden:YES];
    [self.playerBlackjack setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)hit:(id)sender {
}

- (IBAction)deal:(id)sender {
    [self.game dealNewRound];
}

- (IBAction)stay:(id)sender {
}
@end
