//
//  QuestionViewController.h
//  
//
//  Created by Shristi Hingle on 21/11/15.
//
//

#import <UIKit/UIKit.h>
@interface QuestionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *NextBtn;
@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *ABtn;
@property (weak, nonatomic) IBOutlet UIButton *BBtn;
@property (weak, nonatomic) IBOutlet UIButton *CBtn;
@property (weak, nonatomic) IBOutlet UIButton *DBtn;
@property (weak, nonatomic) IBOutlet UILabel *optionALabel;
@property (weak, nonatomic) IBOutlet UILabel *optionBLabel;
@property (weak, nonatomic) IBOutlet UILabel *optionCLabel;
@property (weak, nonatomic) IBOutlet UILabel *optionDLabel;


@end
