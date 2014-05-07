//
//  Product.h
//  testParseExample
//
//  Created by Roberto Marco on 07/05/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

//@property (nonatomic, assign) NSInteger idProduct; -- Only needed if SQLite store

@property (nonatomic, strong) NSString  *idProduct;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *description;
@property (nonatomic, strong) NSString  *categoryId;
@property (nonatomic, strong) NSString  *subcategoryId;
@property (nonatomic, strong) NSNumber  *price;
@property (nonatomic, strong) NSArray   *images;
@property (nonatomic, strong) NSString  *colour;
@property (nonatomic, strong) NSNumber  *units;
@property (nonatomic, strong) NSString  *gender;
@property (nonatomic, strong) NSString  *size;
@property (nonatomic, strong) NSDate    *createdAt;
@property (nonatomic, strong) NSDate    *updatedAt;

@end
