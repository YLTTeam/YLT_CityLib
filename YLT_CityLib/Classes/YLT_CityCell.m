//
//  YLT_CityTopBarCell.m
//  AFNetworking
//
//  Created by Alex on 2017/11/30.
//

#import "YLT_CityCell.h"
#import <Masonry/Masonry.h>
#import "YLT_CityModel.h"

@implementation YLT_CityCell

@end

@implementation  YLT_CityTopBarCell

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-8);
        }];
    }
    return _nameLabel;
}

@end


@interface YLT_CityContentCell()<UITableViewDataSource, UITableViewDelegate> {
    
}
@end

@implementation  YLT_CityContentCell

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    AreaInfo *info = self.list[indexPath.row];
    cell.textLabel.text = info.area;
    return cell;
}

- (void)setList:(NSArray *)list {
    _list = list;
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _tableView;
}



@end
