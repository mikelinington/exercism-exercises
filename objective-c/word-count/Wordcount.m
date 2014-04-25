#import "WordCount.h"

@implementation WordCount
- (WordCount *)initWithString:(NSString * )words {
    self.words = words;
    return self;
}

- (NSString *)cleanInput {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\w\\s]+"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    return [regex stringByReplacingMatchesInString:[self.words lowercaseString] options:0 range:NSMakeRange(0, [self.words length]) withTemplate:@""];
}

- (NSDictionary *)count {
    NSMutableDictionary *wordCounts = [NSMutableDictionary dictionary];
    NSString *cleanedWords = [self cleanInput];
    NSArray *words = [cleanedWords
        componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (NSString *currentWord in words) {
        NSNumber *currentWordCount = wordCounts[currentWord] ?: @0;
        currentWordCount = @(currentWordCount.intValue + 1);
        wordCounts[currentWord] = currentWordCount;
    }
    return wordCounts;
}

@end
