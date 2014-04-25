//
//  Bob.m
//  Bob
//
//  Created by Mike Linington on 4/21/14.
//  Copyright (c) 2014 Mike Linington. All rights reserved.
//
#import "bob.h"


@implementation Bob

- (NSString *)hey:(NSString *)input {
    NSString *response = @"Fine, be that way.";

    if (![Bob isEmptyStatement:input]) {
        if ([Bob isYell:input]) {
            response = @"Woah, chill out!";
        } else if ([Bob isQuestion:input]) {
            response = @"Sure.";
        } else {
            response = @"Whatever.";
        }
    }

    return response;
}

+ (BOOL) isEmptyStatement:(NSString *)input {
    NSString *trimmed = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return [trimmed length] == 0;
}

+ (BOOL)isQuestion:(NSString *)input {
    return [input characterAtIndex:[input length]-1] == '?';
}

+ (BOOL)isYell:(NSString *)input {
    // check to see if there are any non-digit/punctuation characters
    if ([input rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].length == 0) {
        return false;
    }
    NSString *caps = [input uppercaseString];
    return [caps isEqualToString:input];
}

@end
