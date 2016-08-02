//
//  NSObject+Model.h
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

+(instancetype)modelWithDict:(NSDictionary *)dict;

-(NSDictionary *)dictWithModel:(NSObject *)object;

@end
