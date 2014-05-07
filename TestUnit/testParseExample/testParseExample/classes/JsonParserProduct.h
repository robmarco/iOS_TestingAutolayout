//
//  JsonParserSport.h
//  JSONParserRM
//
//  Created by Roberto Marco on 31/03/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "JSONKit.h"

@interface JsonParserProduct : NSObject

- (NSMutableArray *) parseRemoteJSON:(NSDictionary*)dic;

@end
