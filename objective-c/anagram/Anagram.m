#import "Anagram.h"

@implementation NSString (Anagram)

- (NSArray *)arrayOfLetters {
    // from: http://www.idev101.com/code/Objective-C/Strings/split.html
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[self length]];
    for (int i=0; i < [self length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
        [characters addObject:ichar];
    }
    return characters;    
}

- (BOOL)isAnagramOf:(NSString *)string {
    NSString *lowercaseSelf = [self lowercaseString];
    NSString *lowercaseString = [string lowercaseString];

    if (self.length != string.length || [lowercaseSelf isEqualToString:lowercaseString]) {
        return false;
    }

    NSMutableArray *sorted1 = [lowercaseSelf arrayOfLetters];
    NSMutableArray *sorted2 = [lowercaseString arrayOfLetters];

    sorted1 = [sorted1 sortedArrayUsingSelector:@selector(compare:)];
    sorted2 = [sorted2 sortedArrayUsingSelector:@selector(compare:)];

    return [sorted1 isEqualToArray:sorted2];
}
@end

@implementation Anagram

- (Anagram *)initWithString:(NSString *)string {
    self.input = string;
    return self;
}

- (NSArray *)match:(NSArray *)strings {
    NSMutableArray *matches = [NSMutableArray array];
    for(NSString *string in strings) {
        if ([self.input isAnagramOf:string]) {
            [matches addObject:string];
        }
    }
    return matches;
}

@end
