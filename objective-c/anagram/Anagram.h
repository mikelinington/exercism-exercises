#import "Foundation/Foundation.h"

@interface Anagram : NSObject

@property NSString *input;
- (instancetype)initWithString:(NSString *)string;
- (NSArray *)match:(NSArray *)string;

@end
