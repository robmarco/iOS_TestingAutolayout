//
//  JsonParserProductsTestCase.m
//  testParseExample
//
//  Created by Roberto Marco on 07/05/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JsonParserProduct.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"


@interface JsonParserProductsTestCase : XCTestCase
@end

@implementation JsonParserProductsTestCase
{
    Product *_product;
    NSMutableArray *_arrayWithProducts;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // Create RequestConnection withe GET method, because it wont receive parameters

    NSURL *url = [NSURL URLWithString:@"http://api-clickchic.herokuapp.com/api/v1/products"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *err = [request error];
    if (!err) {
        JSONDecoder *jsonDecoder = [[JSONDecoder alloc] initWithParseOptions:JKParseOptionValidFlags];
        NSDictionary *dic = [jsonDecoder objectWithData:[request responseData]];
        
        JsonParserProduct *jsonParser = [[JsonParserProduct alloc] init];
        _arrayWithProducts = [jsonParser parseRemoteJSON:dic];
        _product = _arrayWithProducts[0];
        NSLog(@"%@", _product.idProduct);
    }    
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testProductValidValuesAfterParse
{
    XCTAssertEqualObjects(_product.title, @"Cojín de la felicidad", @"Should have this title");
    XCTAssertEqualObjects(_product.description, @"Con este cojín siempre tendrás una sonrisa en la boca.", @"Should have this description");
    XCTAssertEqualObjects(_product.categoryId, @"535a402c8b7fae0211000001", @"Should have this categoryId");
    XCTAssertEqualObjects(_product.price, @45, @"Should have this price");
    XCTAssertEqualObjects(_product.units, @3, @"Should have those units");
    XCTAssertEqualObjects(_product.images[0], @"https://api-clickchic-img.s3.amazonaws.com/prod_1398621005282_home_deco.jpg", @"Should have this image");
}

- (void) testProductNotValidValuesAfterParse
{
    XCTAssertNotEqualObjects(_product.title, @"title", @"Should have this title");
    XCTAssertNotEqualObjects(_product.description, @"description", @"Should have this description");
    XCTAssertNotEqualObjects(_product.categoryId, @"categoryId", @"Should have this categoryId");
    XCTAssertNotEqualObjects(_product.price, @0, @"Should have this price");
    XCTAssertNotEqualObjects(_product.units, @0, @"Should have those units");
    XCTAssertNotEqualObjects(_product.images[0], @"image.url", @"Should have this image");
}
@end
