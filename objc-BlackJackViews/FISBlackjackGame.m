//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by John Richardson on 5/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (void)playBlackjack {
    [self.player resetForNewGame];
    [self.house resetForNewGame];
    [self.deck resetDeck];
    [self dealNewRound];
    for (NSUInteger i = 0; i < 3; i++) {
        [self processPlayerTurn];
        if ([self.player busted]) {
            break;
        }
        [self processHouseTurn];
        if ([self.house busted]) {
            break;
        }
    }
    BOOL houseWins = [self houseWins];
    [self incrementWinsAndLossesForHouseWins:houseWins];
    NSLog(@"%@", self.player);
    NSLog(@"%@", self.house);
}

- (void)dealNewRound {
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
}

- (void)dealCardToPlayer {
    FISCard *card = self.deck.drawNextCard;
    [self.player acceptCard:card];
}

- (void)dealCardToHouse {
    FISCard *card = self.deck.drawNextCard;
    [self.house acceptCard:card];
}

- (void)processPlayerTurn {
    if ([self.player shouldHit] && ![self.player busted] && ![self.player stayed]){
        [self dealCardToPlayer];
    }
}

- (void)processHouseTurn {
    if ([self.house shouldHit] && ![self.house busted] && ![self.house stayed]){
        [self dealCardToHouse];
    }
}

- (BOOL)houseWins {
    if ([self.house busted]) {
        return NO;
    } else if ([self.player busted]) {
        return YES;
    } else if ([self.house blackjack] && [self.player blackjack]) {
        return NO;
    } else if ([self.player handscore] <= [self.house handscore]) {
        return YES;
    } else {
        return NO;
    }
}

- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
    FISBlackjackPlayer *house = self.house;
    FISBlackjackPlayer *player = self.player;
    if (houseWins) {
        house.wins = house.wins + 1;
        player.losses = player.losses + 1;
        NSLog(@"House wins!");
    } else {
        house.losses = house.losses + 1;
        player.wins = player.wins + 1;
        NSLog(@"Player wins!");
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _deck = [[FISCardDeck alloc] init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
    }
    return self;
}

@end
