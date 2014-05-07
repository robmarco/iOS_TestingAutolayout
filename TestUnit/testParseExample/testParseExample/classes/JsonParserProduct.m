//
//  JsonParserSport.m
//  JSONParserRM
//
//  Created by Roberto Marco on 31/03/14.
//  Copyright (c) 2014 Roberto Marco. All rights reserved.
//

#import "JsonParserProduct.h"

@implementation JsonParserProduct

#pragma mark - Public Methods

- (NSMutableArray *) parseRemoteJSON:(NSDictionary*)dic {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    
    if ([dic objectForKey:@"products"] != [NSNull null])
    {
        for (NSDictionary *dicHeadLines in [dic objectForKey:@"products"])
        {
            Product *product = [[Product alloc] init];
            
            if ([dicHeadLines objectForKey:@"_id"] != nil)
                [product setIdProduct:[dicHeadLines objectForKey:@"_id"]];
            
            if ([dicHeadLines objectForKey:@"model"] != nil)
                [product setTitle:[dicHeadLines objectForKey:@"model"]];
            
            if ([dicHeadLines objectForKey:@"description"] != nil)
                [product setDescription:[dicHeadLines objectForKey:@"description"]];
            
            if ([dicHeadLines objectForKey:@"category_id"] != nil)
                [product setCategoryId:[dicHeadLines objectForKey:@"category_id"]];
            
            if ([dicHeadLines objectForKey:@"subcategory_id"] != nil)
                [product setSubcategoryId:[dicHeadLines objectForKey:@"subcategory_id"]];
            
            if ([dicHeadLines objectForKey:@"price"] != nil)
                [product setPrice:[dicHeadLines objectForKey:@"price"]];
            
            if ([dicHeadLines objectForKey:@"images"] != nil)
            {
                NSMutableArray *arrayImagesParsed = [[NSMutableArray alloc] initWithCapacity:0];
                //NSMutableArray *arrayImagesParsed = [@[] mutableCopy];
                
                NSArray *arrayImages = [dicHeadLines objectForKey:@"images"];
                for (NSDictionary *image in arrayImages)
                {
                    [arrayImagesParsed addObject:image];
                }
                
                product.images = arrayImagesParsed;
            }
            
            if ([dicHeadLines objectForKey:@"colour"] != nil)
                [product setColour:[dicHeadLines objectForKey:@"colour"]];
            
            if ([dicHeadLines objectForKey:@"units"] != nil)
                [product setUnits:[dicHeadLines objectForKey:@"units"]];
            
            if ([dicHeadLines objectForKey:@"gender"] != nil)
                [product setGender:[dicHeadLines objectForKey:@"gender"]];
            
            if ([dicHeadLines objectForKey:@"size"] != nil)
                [product setSize:[dicHeadLines objectForKey:@"size"]];
            
            if ([dicHeadLines objectForKey:@"created_at"] != nil)
            {
                NSString *dateStr = [dicHeadLines objectForKey:@"created_at"];
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
                NSDate *date = [dateFormat dateFromString:dateStr];
                [product setCreatedAt:date];
            }
            
            if ([dicHeadLines objectForKey:@"updated_at"] != nil)
            {
                NSString *dateStr = [dicHeadLines objectForKey:@"updated_at"];
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
                NSDate *date = [dateFormat dateFromString:dateStr];
                [product setUpdatedAt:date];
            }
            
            [array addObject:product];
        }
    }
    
    return array;
}


@end
