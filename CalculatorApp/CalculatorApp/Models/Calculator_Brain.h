//
//  Calculator_Brain.h
//  Calculator
//
//  Created by user196869 on 6/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator_Brain : NSObject
-(void)pushItem:(double)number;
-(double)calculate:(NSString*)operation;
@end

NS_ASSUME_NONNULL_END
