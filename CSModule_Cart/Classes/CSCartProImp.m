//
//  CSCartProImp.m
//  CSModule_Cart
//
//  Created by hcs on 2020/10/12.
//

#import "CSCartProImp.h"
#import "CSCartManager.h"
#import "CSCartViewController.h"

@implementation CSCartProImp
+ (void)load {
    [CSModuleManager registClass:self forProtocol:@protocol(CSCartProtocol)];
}

#pragma mark - CSCartProtocol
- (NSUInteger)countForGoodsId:(NSString *)goodsId {
    return [[CSCartManager defaultManager] countForGoodsId:goodsId];
}

- (UIViewController *)crateCartViewController {
    return [[CSCartViewController alloc] init];
}

@end
