//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by John Richardson on 5/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck

- (FISCard *)drawNextCard {
    if ([self.remainingCards count] < 1) {
        NSLog(@"The deck is empty");
        return nil;
    } else {
        FISCard *card = [self.remainingCards objectAtIndex:0];
        [self.remainingCards removeObjectAtIndex:0];
        [self.dealtCards addObject:card];
        return card;
    }
}

- (void)resetDeck {
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

- (void)gatherDealtCards {
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}

- (void)shuffleRemainingCards {
    NSMutableArray *cardsArray = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    while([cardsArray count] > 0) {
        NSUInteger randomNumber = arc4random_uniform((uint32_t) [cardsArray count]);
        FISCard *card = [cardsArray objectAtIndex:randomNumber];
        [self.remainingCards addObject:card];
        [cardsArray removeObjectAtIndex:randomNumber];
    }
}

- (void)generateStandardDeck {
    NSArray *suits = [FISCard validSuits];
    NSArray *ranks = [FISCard validRanks];
    for(NSUInteger i = 0; i < [suits count]; i++){
        for(NSUInteger j = 0; j < [ranks count]; j++) {
            FISCard *card = [[FISCard alloc] initWithSuit:suits[i] rank:ranks[j]];
            [self.remainingCards addObject:card];
        }
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc] init];
        [self generateStandardDeck];
    }
    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"count: %lu\ncards: ", [self.remainingCards count]];
    NSArray *remaingCards = self.remainingCards;
    for (NSUInteger i=0; i < [remaingCards count]; i++) {
        FISCard *card = remaingCards[i];
        if(i > 0 && ![card.suit isEqualToString:[remaingCards[i-1] suit]]) {
            [description appendString: @"\n"];
        }
        [description appendString: card.cardLabel];
    }
    return description;
}

@end
