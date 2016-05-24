//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by John Richardson on 5/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

- (instancetype)init {
    self = [self initWithName: @""];
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc] init];
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
        _handscore = 0;
        _wins = 0;
        _losses = 0;
    }
    return self;
}

- (void)resetForNewGame {
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    self.aceInHand = NO;
    self.stayed = NO;
    self.blackjack = NO;
    self.busted = NO;
}

- (void)acceptCard:(FISCard *)card {
    [self.cardsInHand addObject:card];
    self.handscore = self.handscore + card.cardValue;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"rank CONTAINS %@", @"A"];
    NSArray *aces = [self.cardsInHand filteredArrayUsingPredicate:predicate];
    if ([aces count] > 0) {
        self.aceInHand = YES;
    }
    if ([aces count] == 1 && self.handscore < 12) {
        self.handscore = self.handscore + 10;
    }
    if (self.handscore > 21) {
        self.busted = YES;
    }
    if (self.handscore == 21 && [self.cardsInHand count] == 2) {
        self.blackjack = YES;
    }
}

- (BOOL)shouldHit {
    if (self.handscore < 17) {
        return YES;
    } else {
        self.stayed = YES;
        return NO;
    }
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@" name: %@\n cards:", self.name];
    for (FISCard *card in self.cardsInHand) {
        [description appendString: card.cardLabel];
    }
    [description appendString:[NSString stringWithFormat:@"\n handscore: %lu\n", self.handscore]];
    [description appendString:[NSString stringWithFormat:@" ace in hand: %d\n", self.aceInHand]];
    [description appendString:[NSString stringWithFormat:@" stayed: %d\n", self.stayed]];
    [description appendString:[NSString stringWithFormat:@" blackjack: %d\n", self.blackjack]];
    [description appendString:[NSString stringWithFormat:@" busted: %d\n", self.busted]];
    [description appendString:[NSString stringWithFormat:@" wins: %lu\n", self.wins]];
    [description appendString:[NSString stringWithFormat:@" losses: %lu\n", self.losses]];
    return description;
}

@end
