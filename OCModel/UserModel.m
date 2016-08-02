//
//  UserModel.m
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(NSString *)description {
    NSString *str = [NSString stringWithFormat:@"%@--%ld--%d--%@", _username, _age, _boy, _books];
    return str;
}

@end
