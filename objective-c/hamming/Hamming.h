#import <Foundation/Foundation.h>

#ifndef hamming_h
#define hamming_h

@interface Hamming : NSObject

+ (NSUInteger)compute:(NSString *)original against:(NSString *)mutated;

@end

#endif
