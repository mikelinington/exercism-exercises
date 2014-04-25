//
//  Bob.h
//  Bob
//
//  Created by Mike Linington on 4/21/14.
//  Copyright (c) 2014 Mike Linington. All rights reserved.
//
#import "Foundation/Foundation.h"

#ifndef bob_bob_h
#define bob_bob_h

@interface Bob : NSObject


+ (BOOL)isEmptyStatement:(NSString *)input;
+ (BOOL)isQuestion:(NSString *)input;
+ (BOOL)isYell:(NSString *)input;

- (NSString *)hey:(NSString *)input;

@end


#endif

