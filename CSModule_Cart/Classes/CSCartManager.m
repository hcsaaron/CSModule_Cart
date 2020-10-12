//
//  CSCartManager.m
//  CSModule_Cart
//
//  Created by hcs on 2020/10/12.
//

#import "CSCartManager.h"

@implementation CSCartManager
+ (instancetype)defaultManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSUInteger)countForGoodsId:(NSString *)goodsId {
    return 1 + [goodsId integerValue] % 5;
}
@end
