//
//  PopViewController.m
//  
//
//  Created by Shristi Hingle on 22/11/15.
//
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController
@synthesize correct,answerLabel,closeBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    closeBtn.layer.cornerRadius = 10;
    if ([correct isEqualToString:@"yes"]) {
        answerLabel.text = @"Right Answer!";
    }
    else
    {
         answerLabel.text = @"Wrong Answer!";
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
