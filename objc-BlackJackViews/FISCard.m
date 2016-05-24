//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by John Richardson on 5/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard ()

@property (nonatomic, readwrite) NSString *suit;

@property (nonatomic, readwrite) NSString *rank;

@property (nonatomic, readwrite) NSString *cardLabel;

@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

+ (NSArray *)validSuits {
    NSArray *validSuits = @[@"♠", @"♥", @"♣", @"♦"];
    return validSuits;
}

+ (NSArray *)validRanks {
    NSArray *validRanks = @[@"A", @"2", @"3", @"4",
                            @"5", @"6", @"7", @"8", @"9",
                            @"10", @"J", @"Q", @"K"];
    return validRanks;
}

- (instancetype)init {
    self = [self initWithSuit:@"!"
                         rank:@"N"];
    return self;
}

- (instancetype)initWithSuit:(NSString *)suit
                        rank:(NSString *)rank {
    self = [super init];
    if (self) {
        _suit = suit;
        _rank = rank;
        _cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
        NSUInteger indexOfRank = [[FISCard validRanks] indexOfObject:rank];
        _cardValue = indexOfRank >= 10 ? 10 : indexOfRank + 1;
    }
    return self;
}

- (NSString *)description {
    return self.cardLabel;
}

@end
