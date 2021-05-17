#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    
    if (array.count == 0 || array.count == 1 ) {
        return 0;
    }
    for (int n = 0; n < (array.count - 1); n++) {
        NSInteger num = [[array objectAtIndex:n] intValue];
        for (int k = n + 1; k < (array.count); k++) {
            NSInteger num2 = [[array objectAtIndex: k] intValue];
            if (num + [number intValue] == num2 ) {
                count ++ ;
            }
        }
    }

    return count;
    
}

@end
