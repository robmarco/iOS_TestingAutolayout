//
//  DeckTestCase.m
//  testUnit
//
//  Created by Roberto Marco on 07/05/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Deck.h"

@interface DeckTestCase : XCTestCase

@end

@implementation DeckTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testDrawCardFromEmptyDeckAnswersNoCard
{
    Deck *deck = [[Deck alloc] init];
    Card *cardDrawed = [deck drawRandomCard];
    XCTAssertNil(cardDrawed, @"Should not crash, just return nil" );
}

- (void) testDrawRandomCardFromDifferentDecks
{
    Deck *deck = [[Deck alloc] init];

    Card *card1 = [[Card alloc] init];
    card1.contents = @"one";
    
    Card *card2 = [[Card alloc] init];
    card2.contents = @"two";
    
    [deck addCard:card1];
    [deck addCard:card2];
    
    Card *drawedCard1 = [deck drawRandomCard];
    Card *drawedCard2 = [deck drawRandomCard];
    
    XCTAssertNotNil(drawedCard1, @"Should have found a card");
    XCTAssertNotNil(drawedCard2, @"Should have found a card too");
    
    XCTAssertNotEqualObjects(drawedCard1, drawedCard2, @"Cards should be different, because its random function");
}

- (void) testDeckWithMultipleCardsWillRandomlyDrawThemAll
{
    Deck *deck = [[Deck alloc] init];
    
    int numberOfCards = 16;  // arbitrary number > 1
    Card *card;
    
    for (int index = 0; index < numberOfCards; index++)
    {
        card = [[Card alloc] init];
        card.contents = [NSString stringWithFormat:@"%d", index];
        [deck addCard:card];
    }
    
    Card *randomlyDrawnCard;
    
    for (int index = 0; index < numberOfCards; index++)
    {
        randomlyDrawnCard = [deck drawRandomCard];
        XCTAssertNotNil(randomlyDrawnCard, @"Should have found a card.");
    }
    
    randomlyDrawnCard = [deck drawRandomCard];
    XCTAssertNil(randomlyDrawnCard, @"No more cards left.");
}



@end
