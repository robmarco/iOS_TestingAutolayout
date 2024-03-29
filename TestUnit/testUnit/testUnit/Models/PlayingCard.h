//
//  PlayingCard.h
//  testUnit
//
//  Created by Roberto Marco on 07/05/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
