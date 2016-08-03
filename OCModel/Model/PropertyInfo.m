//
//  PropertyInfo.m
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import "PropertyInfo.h"

@implementation PropertyInfo


-(instancetype)initWithProperty:(objc_property_t)property {
    _property = property;
    // 名称
    const char *propertyName = property_getName(property);
    if (propertyName) {
        _propertyName = [NSString stringWithUTF8String:propertyName];
    }
    // 类型
    unsigned int attrCount;
    objc_property_attribute_t *attrs = property_copyAttributeList(property, &attrCount);
    for (unsigned i=0; i<attrCount; i++) {
        NSLog(@"attr.name = %s", attrs[i].name);
        if (attrs[i].name[0] == 'T') {
            size_t len = strlen(attrs[i].value);
            if (len>3) {
                char name[len-2];
                name[len-3] = '\0';
                memcpy(name, attrs[i].value+2, len-3);
                _typeClass = objc_getClass(name);
            }
        }
    }
    //getter setter
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", [_propertyName substringToIndex:1].uppercaseString, [_propertyName substringFromIndex:1]];
    _setter = NSSelectorFromString(setter);
    _getter = NSSelectorFromString(_propertyName);
    
    return self;
}

@end
