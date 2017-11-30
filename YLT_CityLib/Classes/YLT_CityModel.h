//
//  YLT_CityModel.h
//  AFNetworking
//
//  Created by Alex on 2017/11/30.
//

#import <YLT_BaseLib/YLT_BaseLib.h>
#import <MJExtension/MJExtension.h>
@class Area;
@class AreaInfo;
@class SelectedAreaInfo;

@interface YLT_CityModel : YLT_BaseModel

@end

@interface Area : YLT_BaseModel {
}
/**
 
 */
@property (readwrite, nonatomic, strong) NSMutableArray<AreaInfo *> * area;

@end


@interface AreaInfo : YLT_BaseModel {
}
/**
 id
 */
@property (readwrite, nonatomic, assign) NSInteger aid;
/**
 上级id
 */
@property (readwrite, nonatomic, assign) NSInteger fid;
/**
 名称
 */
@property (readwrite, nonatomic, strong) NSString * area;
/**
 地址级别  1:省份 2:城市 3:地区
 */
@property (readwrite, nonatomic, assign) NSInteger type;
/**
 下级列表 type为3的时候  下级列表没有
 */
@property (readwrite, nonatomic, strong) NSMutableArray<AreaInfo *> * next;

@end


@interface SelectedAreaInfo : YLT_BaseModel {
}
/**
 选择省份的Index
 */
@property (readwrite, nonatomic, assign) NSInteger provinceIndex;
/**
 城市的index
 */
@property (readwrite, nonatomic, assign) NSInteger cityIndex;
/**
 
 */
@property (readwrite, nonatomic, assign) NSInteger districtIndex;
/**
 省份信息
 */
@property (readwrite, nonatomic, strong) AreaInfo *province;
/**
 城市信息
 */
@property (readwrite, nonatomic, strong) AreaInfo *city;
/**
 区域信息
 */
@property (readwrite, nonatomic, strong) AreaInfo *district;

@end
