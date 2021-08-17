//
//  ViewController.m
//  CalculatorApp
//
//  Created by user196869 on 6/9/21.
//

#import "ViewController.h"
#import "Calculator_Brain.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Display;
@property(nonatomic) Calculator_Brain* calculator;
@property BOOL isNewNumber;

@end

@implementation ViewController
-(Calculator_Brain*)calculator{
    if(_calculator == nil)
    {
        _calculator = [[Calculator_Brain alloc]init];
    }
    return _calculator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNewNumber = YES;
    // Do any additional setup after loading the view.
}
- (IBAction)clearDis {
    self.Display.text = @"0";
    self.isNewNumber = true;
    
}

- (IBAction)DigitPressed:(UIButton *)sender {
    NSString *digitBtnTitle = sender.currentTitle;
    if(self.isNewNumber)
    {
    self.Display.text = digitBtnTitle;
    self.isNewNumber = NO;
    }
    else
    {
        self.Display.text = [NSString
                             stringWithFormat:@"%@%@",self.Display.text, digitBtnTitle];
    }
}
- (IBAction)Operator_pressed:(UIButton *)sender {
    NSString *oprBtnTitle = sender.currentTitle;
    self.Display.text = [NSString stringWithFormat:@"%.06f",[self.calculator calculate:oprBtnTitle]];
    self.isNewNumber = YES;
    
}

- (IBAction)Enter_pressed {
    NSString *displayValue = self.Display.text;
    [self.calculator pushItem:displayValue.doubleValue];
    self.isNewNumber = YES;
}

/*throws an error:
 Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[UIButton copyWithZone:]: unrecognized selector sent to instance 0x7fe7fc60ef30'
 
- (IBAction)DigitPressed:(id)sender {
    NSString *digitBtnTitle = sender;
    self.Display.text = digitBtnTitle;
}
- (IBAction)Operator_pressed:(id)sender {
}
- (IBAction)Enter_pressed:(id)sender {
}
*/

@end
