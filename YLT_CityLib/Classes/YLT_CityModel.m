//
//  YLT_CityModel.m
//  AFNetworking
//
//  Created by Alex on 2017/11/30.
//

#import "YLT_CityModel.h"

@implementation YLT_CityModel

@end

@implementation Area

@synthesize area;

- (id)init {
    self = [super init];
    if (self) {
        self.area = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSDictionary *)ph_keyMapper {
    return @{
             };
}
+ (NSDictionary *)ph_classInArray {
    return @{
             @"area":@"AreaInfo",
             };
}

@end


@implementation AreaInfo

@synthesize aid;
@synthesize fid;
@synthesize area;
@synthesize type;
@synthesize next;

- (id)init {
    self = [super init];
    if (self) {
        self.aid = 0;
        self.fid = 0;
        self.area = @"";
        self.type = 0;
        self.next = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSDictionary *)ph_keyMapper {
    return @{
             };
}
+ (NSDictionary *)ph_classInArray {
    return @{
             @"next":@"AreaInfo",
             };
}

@end


@implementation SelectedAreaInfo

@synthesize provinceIndex;
@synthesize cityIndex;
@synthesize districtIndex;
@synthesize province;
@synthesize city;
@synthesize district;

- (id)init {
    self = [super init];
    if (self) {
        self.provinceIndex = -1;
        self.cityIndex = -1;
        self.districtIndex = -1;
        self.province = [[AreaInfo alloc] init];
        self.city = [[AreaInfo alloc] init];
        self.district = [[AreaInfo alloc] init];
    }
    return self;
}

+ (NSDictionary *)ph_keyMapper {
    return @{
             };
}
+ (NSDictionary *)ph_classInArray {
    return @{
             };
}

@end
