//
//  PopViewController.h
//  
//
//  Created by Shristi Hingle on 22/11/15.
//
//

#import <UIKit/UIKit.h>

@interface PopViewController : UIViewController
@property(nonatomic,copy) NSString *correct;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
- (IBAction)closeModal:(id)sender;

@end
