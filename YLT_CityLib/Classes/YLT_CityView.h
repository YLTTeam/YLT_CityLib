//
//  YLT_CityView.h
//  Pods
//
//  Created by Alex on 2017/11/30.
//

#import <UIKit/UIKit.h>
#import "YLT_CityConfig.h"

@interface YLT_CityView : UIView

+ (YLT_CityView *)showWithConfig:(void(^)(YLT_CityConfig *config))config;

@end
