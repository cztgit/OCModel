//
//  ClassInfo.h
//  OCModel
//
//  Created by WangHao on 16/8/2.
//  Copyright © 2016年 Tuluobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassInfo : NSObject

/**
 *  类实例
 */
@property (nonatomic, assign) Class cls;

/**
 *  属性列表
 */
@property (nonatomic, strong) NSDictionary *propertyInfo; //@{"property name": "property obj"}


-(instancetype)initWithClass: (Class)cls;

-(void)setClassPropertyInfo;

@end
