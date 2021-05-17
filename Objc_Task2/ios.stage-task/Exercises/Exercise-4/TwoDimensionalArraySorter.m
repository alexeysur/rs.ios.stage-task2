#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
   
    if (array.count == 0 || array == nil || ![array[0] isKindOfClass:NSArray.class]) {
        return @[];
    }
    
    NSMutableArray *reverseArray = [NSMutableArray array];
    NSMutableArray *numbersArray = [NSMutableArray array];
    NSMutableArray *stringsArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i][0] isKindOfClass: NSNumber.class]) {
            [numbersArray addObjectsFromArray: array[i]];
        } else {
            [stringsArray addObjectsFromArray: array[i]];
        }
    }
    
    if (numbersArray.count > 0) {
        numbersArray = [[numbersArray sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
        if (stringsArray.count == 0) {
            return [numbersArray copy];
        }
    }
    
    if (stringsArray.count > 0) {
        stringsArray = [[stringsArray sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
        if (numbersArray.count == 0) {
            return [stringsArray copy];
        }
    }
    
    [reverseArray addObject:[numbersArray copy]];
    [reverseArray addObject:[[stringsArray reverseObjectEnumerator] allObjects]];
    
    return [reverseArray copy];
}

@end
