//
//  Singleton.h
//  agr-join-v1
//
//  Created by findview on 15/11/29.
//  Copyright © 2015年 cn.findview. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  单例类
 */
@interface Singleton : NSObject

+(Singleton*) shareSingleton;
@end
