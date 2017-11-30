//
//  YLT_CityConfig.m
//  Pods-YLT_CityLib_Example
//
//  Created by Alex on 2017/11/30.
//

#import "YLT_CityConfig.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@implementation YLT_CityConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.height = YLT_SCREEN_HEIGHT*2./3.;
        self.bgColor = [UIColor whiteColor];
        self.normalColor = YLT_HEXCOLOR(0x666666);
        self.tintColor = YLT_HEXCOLOR(0x669966);
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[YLT_CityLibBundle pathForResource:@"area" ofType:@"json"]] options:NSJSONReadingAllowFragments error:nil];
        self.contents = [Area mj_objectWithKeyValues:data];
        for (AreaInfo *info in self.contents.area) {
            YLT_Log(@"%@", info.area);
        }
    }
    return self;
}



@end
