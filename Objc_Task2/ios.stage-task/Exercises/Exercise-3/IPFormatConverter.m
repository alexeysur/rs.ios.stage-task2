#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
   
       int sum = 0;
       
       for(NSNumber *value in numbersArray) {
           if ([value intValue] < 0) {
               return @"Negative numbers are not valid for input.";
           }
           
           if ([value intValue] > 255) {
               return @"The numbers in the input array can be in the range from 0 to 255.";
           }
           sum = sum + [value intValue];
       }
    
       if ((numbersArray.count == 0) || (sum == 0)) {
           return @"";
       }
       
       NSMutableArray *mutableArray = [NSMutableArray arrayWithArray: numbersArray];
       
       while(mutableArray.count < 4) {
           [mutableArray addObject:[NSNumber numberWithInt: 0]];
       }
    
       NSString *result = [NSString stringWithFormat:@"%@.%@.%@.%@",mutableArray[0], mutableArray[1], mutableArray[2], mutableArray[3]];
       return result;
}

@end
