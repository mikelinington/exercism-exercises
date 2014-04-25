#import <Foundation/Foundation.h>

@interface WordCount : NSObject

@property NSString *words;
- (WordCount *)initWithString:(NSString * )words;
- (NSDictionary *)count;

@end
