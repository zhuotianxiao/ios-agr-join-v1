//
//  Singleton.m
//  agr-join-v1
//
//  Created by findview on 15/11/29.
//  Copyright © 2015年 cn.findview. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static id _instance;

/**
 *  该方法是在调用alloc 方法的时候调用的
 *
 *  @param zone <#zone description#>
 *
 *  @return <#return value description#>
 */
+(instancetype) allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

/**
 *  单例类对外提供的接口,在程序中获取单例对象的时候都是通过这个接口进行获取的,share是oc 中单例类 对外接口的默认前缀
 *  dispatch_once 是gcd 提供的,确保代码块中德代码只执行一次
 *  @return 返回单例对象
 */
+(id) shareSingleton{
    
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        
        _instance = [[self alloc] init];
    });
    return _instance;
}

/**
 *  避免在copy 的时候 创建新的对象
 *
 *  @param zone <#zone description#>
 *
 *  @return <#return value description#>
 */
-(id)copyWithZone:(NSZone*)zone {

    
    return _instance;
}
@end
