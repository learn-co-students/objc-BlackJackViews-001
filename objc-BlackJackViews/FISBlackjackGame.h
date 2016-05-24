//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by John Richardson on 5/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"

@interface FISBlackjackGame : NSObject

@property (nonatomic) FISCardDeck *deck;

@property (nonatomic) FISBlackjackPlayer *house;

@property (nonatomic) FISBlackjackPlayer *player;

- (void)playBlackjack;

- (void)dealNewRound;

- (void)dealCardToPlayer;

- (void)dealCardToHouse;

- (void)processPlayerTurn;

- (void)processHouseTurn;

- (BOOL)houseWins;

- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins;

- (instancetype)init;

@end
