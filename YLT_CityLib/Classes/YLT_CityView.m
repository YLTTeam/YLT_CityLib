//
//  YLT_CityView.m
//  Pods
//
//  Created by Alex on 2017/11/30.
//

#import "YLT_CityView.h"
#import <Masonry/Masonry.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "YLT_CityCell.h"
#import "YLT_CityModel.h"

@interface YLT_CityView()<UICollectionViewDelegate, UICollectionViewDataSource> {
}

@property (nonatomic, strong) SelectedAreaInfo *selectedInfo;

@property (nonatomic, strong) YLT_CityConfig *configure;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UICollectionView *topBar;

@property (nonatomic, strong) UICollectionView *showContentView;

@end


@implementation YLT_CityView

+ (YLT_CityView *)showWithConfig:(void(^)(YLT_CityConfig *config))config {
    YLT_CityView *result = [[YLT_CityView alloc] init];
    result.configure = [[YLT_CityConfig alloc] init];
    !config?:config(result.configure);
    
    [result show];
    return result;
}

- (void)show {
    if (self.configure.superView) {
        [self.configure.superView addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.configure.superView);
        }];
    }
    self.backgroundColor = [UIColor clearColor];
    [self.topBar reloadData];
    
    [self.showContentView reloadData];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = 1;
    if (self.selectedInfo.provinceIndex == -1) {
        count = 0;
    } else if (self.selectedInfo.cityIndex == -1) {
        count = 1;
    } else if (self.selectedInfo.districtIndex == -1) {
        count = 2;
    } else {
        count = 3;
    }
    if (self.topBar == collectionView) {
    } else {
        count += 1;
    }
    return MIN(count, 3);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.topBar == collectionView) {
        YLT_CityTopBarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YLT_CityTopBarCell" forIndexPath:indexPath];
        cell.nameLabel.text = @"";
        switch (indexPath.row) {
            case 0: {
                cell.nameLabel.text = self.selectedInfo.province.area;
            }
                break;
            case 1: {
                cell.nameLabel.text = self.selectedInfo.city.area;
            }
                break;
            case 2: {
                cell.nameLabel.text = self.selectedInfo.district.area;
            }
                break;
        }
        
        return cell;
    }
    YLT_CityContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YLT_CityContentCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0: {
            cell.list = self.configure.contents.area;
        }
            break;
        case 1: {
            cell.list = self.selectedInfo.province.next;
        }
            break;
        case 2: {
            cell.list = self.selectedInfo.city.next;
        }
            break;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.topBar == collectionView) {
        [self.showContentView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    
}


- (UICollectionView *)showContentView {
    if (!_showContentView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(YLT_SCREEN_WIDTH, self.configure.height-44);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _showContentView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _showContentView.backgroundColor = [UIColor clearColor];
        _showContentView.scrollEnabled = NO;
        [_showContentView registerClass:[YLT_CityContentCell class] forCellWithReuseIdentifier:@"YLT_CityContentCell"];
        _showContentView.delegate = self;
        _showContentView.dataSource = self;
        _showContentView.pagingEnabled = YES;
        [self.contentView addSubview:_showContentView];
        [_showContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.contentView);
            make.top.equalTo(self.topBar.mas_bottom);
        }];
    }
    return _showContentView;
}

- (SelectedAreaInfo *)selectedInfo {
    if (!_selectedInfo) {
        _selectedInfo = [[SelectedAreaInfo alloc] init];
    }
    return _selectedInfo;
}

- (UICollectionView *)topBar {
    if (!_topBar) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
        flowLayout.itemSize = CGSizeMake(72, 44);
        _topBar = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _topBar.backgroundColor = [UIColor clearColor];
        _topBar.delegate = self;
        _topBar.dataSource = self;
        [_topBar registerClass:[YLT_CityTopBarCell class] forCellWithReuseIdentifier:@"YLT_CityTopBarCell"];
        [self.contentView addSubview:_topBar];
        [_topBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            make.height.equalTo(@44);
        }];
        
        UIImageView *lineImageView = [[UIImageView alloc] init];
        lineImageView.backgroundColor = self.configure.normalColor;
        [self.contentView addSubview:lineImageView];
        [lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(_topBar.mas_bottom);
            make.height.equalTo(@0.5);
        }];
    }
    return _topBar;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = self.configure.bgColor;
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.equalTo(@(self.configure.height));
        }];
    }
    return _contentView;
}

@end
