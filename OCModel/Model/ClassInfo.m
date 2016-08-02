//
//  ClassInfo.m
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import "ClassInfo.h"
#import "PropertyInfo.h"
#import <objc/runtime.h>

@implementation ClassInfo

-(instancetype)initWithClass: (Class)cls {
    self.cls = cls;
    [self setClassPropertyInfo];
    
    return self;
}

-(void)setClassPropertyInfo {
    // 类对象
    Class cls = self.cls;
    // 属性列表
    unsigned int countProperty = 0;
    objc_property_t *propertys = class_copyPropertyList(cls, &countProperty);
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (unsigned i=0; i<countProperty; i++) {
        PropertyInfo *propertyInfo = [[PropertyInfo alloc] initWithProperty:propertys[i]];
        if (propertyInfo.propertyName != nil) {
            [dict setObject:propertyInfo forKey:propertyInfo.propertyName];
        }
    }
    
    _propertyInfo = dict;
    
    free(propertys);
}

@end
