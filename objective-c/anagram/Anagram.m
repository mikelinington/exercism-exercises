#import "Anagram.h"

@implementation NSString (Anagram)

- (BOOL)isAnagramOf:(NSString *)string {
    NSString *lowercaseSelf = [self lowercaseString];
    NSString *lowercaseString = [string lowercaseString];

    if (self.length != string.length || [lowercaseSelf isEqualToString:lowercaseString]) {
        return false;
    }

    NSArray *(^arrayOfLetters)(NSString *) = ^NSArray *(NSString *stringToChange) {
        NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[stringToChange length]];
        for (int i=0; i < [stringToChange length]; i++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [stringToChange characterAtIndex:i]];
            [characters addObject:ichar];
        }
        return characters;
    };
    NSMutableArray *sorted1 = [arrayOfLetters(lowercaseSelf)
        sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *sorted2 = [arrayOfLetters(lowercaseString)
        sortedArrayUsingSelector:@selector(compare:)];
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
