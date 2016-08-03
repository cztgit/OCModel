//
//  NSObject+Model.m
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import "NSObject+Model.h"
#import "ClassInfo.h"
#import "PropertyInfo.h"
#import <objc/message.h>

@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    // 获取类
    Class cls = [self class];
    // 对象实例
    NSObject *modelObject = [cls new];
    
    // 设置属性
    ClassInfo *clsInfo = [[ClassInfo alloc] initWithClass:cls];
    id key, value;
    NSArray *keys = [dict allKeys];
    NSUInteger count = [keys count];
    for (NSInteger i=0; i<count; i++) {
        key = [keys objectAtIndex:i];
        value = [dict objectForKey:key];
        
        if (clsInfo.propertyInfo[key]) {
            [modelObject modelSetPropertyWithValue:value propertyInfo:clsInfo.propertyInfo[key]];
        }
    }
    
    return modelObject;
}

- (NSDictionary *)dict {
    Class cls = [self class];
    
    unsigned int countProperty = 0;
    objc_property_t *propertys = class_copyPropertyList(cls, &countProperty);
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    for (unsigned int i = 0; i<countProperty; i++) {
        PropertyInfo *propertyInfo = [[PropertyInfo alloc] initWithProperty:propertys[i]];
        if (propertyInfo.propertyName!=nil) {
            // 通过 getter 方法来获取Value
            dic[propertyInfo.propertyName] = [self modelGetValueWithProperty:propertyInfo];
        }
    }
    return dic;
}

// 通过setter getter设置Value和获取Value
-(void)modelSetPropertyWithValue:(id)value propertyInfo:(PropertyInfo *)propertyInfo {
    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)self, propertyInfo.setter, value);
}

-(id)modelGetValueWithProperty:(PropertyInfo *)propertyInfo {
    id value = ((id (*)(id, SEL))(void *) objc_msgSend)((id)self, propertyInfo.getter);
    return value;
}

@end
