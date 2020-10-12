//
//  CSCartManager.h
//  CSModule_Cart
//
//  Created by hcs on 2020/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSCartManager : NSObject
+ (instancetype)defaultManager;

- (NSUInteger)countForGoodsId:(NSString *)goodsId;
@end

NS_ASSUME_NONNULL_END
