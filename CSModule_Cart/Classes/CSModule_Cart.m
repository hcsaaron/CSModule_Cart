//
//  CSModule_Cart.m
//  CSModule_Cart
//
//  Created by hcs on 2020/10/13.
//

#import "CSModule_Cart.h"
#import "CSCartManager.h"
#import "CSCartViewController.h"

@implementation CSModule_Cart
+ (void)load {
    [CSModuleManager registClass:self forProtocol:@protocol(CSCartProtocol)];
}

#pragma mark - CSCartProtocol
- (NSUInteger)countForGoodsId:(NSString *)goodsId {
    return [[CSCartManager defaultManager] countForGoodsId:goodsId];
}

- (UIViewController *)createCartViewController {
    return [[CSCartViewController alloc] init];
}
@end
