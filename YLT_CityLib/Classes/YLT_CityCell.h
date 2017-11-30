//
//  YLT_CityTopBarCell.h
//  AFNetworking
//
//  Created by Alex on 2017/11/30.
//

#import <UIKit/UIKit.h>

@interface YLT_CityCell : UICollectionViewCell

@end


@interface YLT_CityTopBarCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *nameLabel;

@end


@interface YLT_CityContentCell : UICollectionViewCell

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) UITableView *tableView;

@end
