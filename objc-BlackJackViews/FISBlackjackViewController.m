//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by John Richardson on 5/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()

@property (nonatomic) NSArray *houseCardLabels;
@property (nonatomic) NSArray *playerCardLabels;
- (IBAction)deal:(id)sender;
- (IBAction)hit:(id)sender;
- (IBAction)stay:(id)sender;

@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.winner setHidden:YES];
    self.houseScore.text = @"Score: 0";
    [self.houseStayed setHidden:YES];
    self.houseCardLabels = [NSArray arrayWithObjects:self.houseCard1, self.houseCard2, self.houseCard3, self.houseCard4, self.houseCard5, nil];
    for (UILabel *cardLabel in self.houseCardLabels) {
        [cardLabel setHidden:YES];
    }
    [self.houseBust setHidden:YES];
    [self.houseBlackjack setHidden:YES];
    self.playerScore.text = @"Score: 0";
    [self.playerStayed setHidden:YES];
    self.playerCardLabels = [NSArray arrayWithObjects:self.playerCard1, self.playerCard2, self.playerCard3, self.playerCard4, self.playerCard5, nil];
    for (UILabel *cardLabel in self.playerCardLabels) {
        [cardLabel setHidden:YES];
    }
    [self.playerBust setHidden:YES];
    [self.playerBlackjack setHidden:YES];
    self.game = [[FISBlackjackGame alloc] init];
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
    [self.game dealCardToPlayer];
    FISBlackjackPlayer *player = self.game.player;
    NSUInteger cardIndex = [player.cardsInHand count] - 1;
    UILabel *card = self.playerCardLabels[cardIndex];
    card.text = [player.cardsInHand[cardIndex] cardLabel];
    [card setHidden:NO];
    self.playerScore.text = [NSString stringWithFormat:@"Score: %lu", player.handscore];
}

- (IBAction)deal:(id)sender {
    FISBlackjackPlayer *player = self.game.player;
    FISBlackjackPlayer *house = self.game.house;
    [player resetForNewGame];
    [house resetForNewGame];
    for (UILabel *cardLabel in self.playerCardLabels) {
        [cardLabel setHidden:YES];
    }
    for (UILabel *cardLabel in self.houseCardLabels) {
        [cardLabel setHidden:YES];
    }
    [self.game.deck resetDeck];
    [self.game dealNewRound];

    self.playerCard1.text = [player.cardsInHand[0] cardLabel];
    [self.playerCard1 setHidden:NO];
    self.playerCard2.text = [player.cardsInHand[1] cardLabel];
    [self.playerCard2 setHidden:NO];
    self.playerScore.text = [NSString stringWithFormat:@"Score: %lu", player.handscore];

    self.houseCard1.text = [house.cardsInHand[0] cardLabel];
    [self.houseCard1 setHidden:NO];
    self.houseCard2.text = [house.cardsInHand[1] cardLabel];
    [self.houseCard2 setHidden:NO];
    self.houseScore.text = [NSString stringWithFormat:@"Score: %lu", house.handscore];

    if (player.handscore != 21 && house.handscore !=21) {
        [self.hitButton setEnabled:YES];
        [self.stayButton setEnabled:YES];
    }
}

- (IBAction)stay:(id)sender {
}
@end
