//
//  CardTestCase.m
//  testUnit
//
//  Created by Roberto Marco on 07/05/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Card.h"
#import "PlayingCard.h"

@interface CardTestCase : XCTestCase

@end

@implementation CardTestCase

- (void)setUp
{
    [super setUp];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super tearDown];
}

- (void) testMatchesDifferentCardWithSameContents
{
    Card *card1 = [[Card alloc] init];
    card1.contents = @"one";
    Card *card2 = [[Card alloc] init];
    card2.contents = @"one";
    
    NSArray *handOfCards = @[card2];
    
    int matchCount = [card1 match:handOfCards];
    
    XCTAssertEqual(matchCount, 1, @"Should have matched");
}

- (void) testDoesNotMatchesDifferentCard
{
    Card *card1 = [[Card alloc] init];
    card1.contents = @"one";
    Card *card2 = [[Card alloc] init];
    card2.contents = @"two";
    
    NSArray *handOfCards = @[card2];
    
    int matchCount = [card1 match:handOfCards];
    
    XCTAssertEqual(matchCount, 0, @"Not Equals? Right?");
}

- (void) testMatchesForAtLeastOneCard
{
    
    NSLog(@"Working - %s", __PRETTY_FUNCTION__);
    Card *card1 = [[Card alloc] init];
    card1.contents = @"one";
    Card *card2 = [[Card alloc] init];
    card2.contents = @"two";
    Card *card3 = [[Card alloc] init];
    card3.contents = @"one";
    
    NSArray *handOfCards = @[card2, card3];
    
    int matchesCount = [card1 match:handOfCards];
    
    XCTAssertEqual(matchesCount, 1, @"Should have match at least 1");
}

- (void) testTheValidSuits
{
    NSArray *theSuits = [PlayingCard validSuits];
    int howMany = [theSuits count];
    
    XCTAssertEqual(howMany, 4, @"Should be only 4");
    
    XCTAssertTrue([theSuits containsObject:@"♥"], "@Must have a heart");
    XCTAssertTrue([theSuits containsObject:@"♦"], "@Must have a diamond");
    XCTAssertTrue([theSuits containsObject:@"♠"], "@Must have a spade");
    XCTAssertTrue([theSuits containsObject:@"♣"], "@Must have a club");
}

- (void) testSetSuitAnyValidAccepted
{
    PlayingCard *card = [[PlayingCard alloc] init];
    
    [card setSuit:@"♥"];
    XCTAssertEqualObjects(card.suit, @"♥", "Should be an Heart");
    
    [card setSuit:@"♦"];
    XCTAssertEqualObjects(card.suit, @"♦", "Should be a Diamond");
    
    [card setSuit:@"♠"];
    XCTAssertEqualObjects(card.suit, @"♠", "Should be a Spade");
    
    [card setSuit:@"♣"];
    XCTAssertEqualObjects(card.suit, @"♣", "Should be a Club");
}

//  Negative inputs test
//  Special Setter Check. If suit isnt equal to 4 allowed, "?" will be set as suit
- (void) testSetSuitInvalidRejected
{
    PlayingCard *card = [[PlayingCard alloc] init];
    [card setSuit:@"A"];
    
    XCTAssertEqualObjects(card.suit, @"?", @"Should not have been recognized");
    
    XCTAssertNotEqualObjects(card.suit, @"A", @"Should not have matched");
}





@end
