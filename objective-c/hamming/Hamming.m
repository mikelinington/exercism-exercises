#import "Hamming.h"

@implementation Hamming

+ (NSUInteger)compute:(NSString *)original against:(NSString *)mutation
{
    NSUInteger hammingDistance = 0;
    NSUInteger length = MIN(original.length, mutation.length);

    for (int i = 0; i < length; i++)
    {
        char originalChar = [original characterAtIndex:i];
        char mutationChar = [mutation characterAtIndex:i];
        if (originalChar != mutationChar)
        {
            hammingDistance++;
        }
    }

    return hammingDistance;
}

@end
