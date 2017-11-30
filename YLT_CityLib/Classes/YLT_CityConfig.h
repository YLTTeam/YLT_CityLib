//
//  YLT_CityConfig.h
//  Pods-YLT_CityLib_Example
//
//  Created by Alex on 2017/11/30.
//

#import <Foundation/Foundation.h>
#import "YLT_CityModel.h"

#define YLT_CityLibBundle [NSBundle bundleWithURL:[[NSBundle bundleForClass:[self class]] URLForResource:@"YLT_CityLib" withExtension:@"bundle"]]

@interface YLT_CityConfig : NSObject


/**
 数据内容
 */
@property (nonatomic, strong) Area *contents;
/**
 父视图
 */
@property (nonatomic, strong) UIView *superView;
/**
 背景色
 */
@property (nonatomic, strong) UIColor *bgColor;
/**
 普通颜色
 */
@property (nonatomic, strong) UIColor *normalColor;
/**
 选中的颜色
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 级别数量  省市区 即为3个
 */
@property (nonatomic, assign) NSUInteger levelCount;

/**
 视图的高度 默认为屏幕的2/3
 */
@property (nonatomic, assign) CGFloat height;


@end
