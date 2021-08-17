//
//  Calculator_Brain.m
//  Calculator
//
//  Created by user196869 on 6/2/21.
//

#import "Calculator_Brain.h"

@interface Calculator_Brain()
    @property (nonatomic)NSMutableArray *numbers;
@end



@implementation Calculator_Brain

-(NSMutableArray*)numbers
{
    if(_numbers == nil)
    {
        _numbers = [[NSMutableArray alloc]init];
    }
    return _numbers;
}

-(void)pushItem:(double)number
{
    NSNumber *numObj = [NSNumber numberWithDouble:number];
    [self.numbers addObject:numObj];
}

-(double) popItem
{
    //remove and return last item of array
    double lastNum = [[self.numbers lastObject] doubleValue];
    [self.numbers removeLastObject];
    return lastNum;
}

-(double)calculate:(NSString*)operation
{
    @try
    {
        double num1 = [self popItem];
        double num2 = [self popItem];
        if ([operation isEqualToString:@"+"])
        {
            return num1 + num2;
        }
        else if ([operation isEqualToString:@"-"])
        {
            return num1 - num2;
        }
        else if ([operation isEqualToString:@"/"])
        {
            return num1 / num2;
        }
        else if ([operation isEqualToString:@"*"])
        {
            return num1 * num2;
        }
        else if ([operation isEqualToString:@"square"])
        {
            return num1 * num1;
        }
        else if ([operation isEqualToString:@"cube"])
        {
            return num1 * num1 * num1;
        }
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"An error occured");
    }
    @finally
    {
    
    }
}

@end
