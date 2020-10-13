//
//  CSCartViewController.m
//  CSModule_Cart
//
//  Created by hcs on 2020/10/12.
//

#import "CSCartViewController.h"
#import <CSModule/CSModule.h>
#import "CSCartManager.h"

@interface CSCartViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *goods;
@end

@implementation CSCartViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView;
    });
    
    _goods = @[
        @"1",
        @"2",
        @"3",
    ];
    
    [self.view addSubview:_tableView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    NSString *goodsId = self.goods[indexPath.row];
    
    // 调用"商品组件"获取商品名称
    id<CSGoodsProtocol> goodsApi = [CSModuleManager instanceForProtocol:@protocol(CSGoodsProtocol)];
    NSString *goodsName = goodsApi ? [goodsApi goodsNameForGoodsId:goodsId] : @"";
    
    NSUInteger goodsCount = goodsApi ? [[CSCartManager defaultManager] countForGoodsId:goodsId] : 0;
    
    cell.textLabel.text = goodsName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"数量: %ld", goodsCount];
    
    return cell;
}

#pragma mark -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *goodsId = self.goods[indexPath.row];
    
    // 调用"商品组件"获取商品详情页
    id<CSGoodsProtocol> goodsApi = [CSModuleManager instanceForProtocol:@protocol(CSGoodsProtocol)];
    if (goodsApi) {
        UIViewController *goodsVC = [goodsApi crateGoodsViewControllerWithGoodsId:goodsId];
        [self.navigationController pushViewController:goodsVC animated:YES];
    }
}
@end
