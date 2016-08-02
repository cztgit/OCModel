//
//  PropertyInfo.h
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface PropertyInfo : NSObject

/**
 *  属性名
 */
@property(nonatomic,strong) NSString *propertyName;
/**
 *  属性类型
 */
@property(nonatomic,assign) Class typeClass;
/**
 * property结构体
 */
@property(nonatomic,assign) objc_property_t property;

/**
 *  建立属性
 */
@property(nonatomic,assign) SEL setter;

/**
 *  获取属性值
 */
@property(nonatomic,assign) SEL getter;



-(instancetype)initWithProperty:(objc_property_t)property;

@end
