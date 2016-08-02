//
//  UserModel.h
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, strong)NSString *username;
@property (nonatomic, assign)NSUInteger age;
@property (nonatomic, assign)BOOL boy;
@property (nonatomic, strong)NSArray *books;

@end
