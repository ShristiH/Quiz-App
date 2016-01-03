//
//  QuestionViewController.m
//  
//
//  Created by Shristi Hingle on 21/11/15.
//
//

#import "QuestionViewController.h"
#import "Questions.h"
#import "PopViewController.h"

@interface QuestionViewController ()
{
    int page;
    NSMutableArray *questionData;
    NSArray *question1;
    NSArray *question2;
    NSArray *question3;
    NSArray *question4;
    NSArray *question5;
    int selectedOption;
    int answer;
}
@end

@implementation QuestionViewController
@synthesize NextBtn,View1,optionALabel,optionBLabel,optionCLabel,optionDLabel,ABtn,BBtn,CBtn,DBtn,questionLabel;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NextBtn.layer.cornerRadius = 10;
    
    page = 1;
    
    //question data for 1 to 5
    question1 = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],@"Do you like chocolates?", @"yes", @"no", @"may be",@"can't decide",[NSNumber numberWithInt:1],nil];
    question2 = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],@"Do you like going for a jog?", @"yes", @"no", @"may be",@"can't decide",[NSNumber numberWithInt:1], nil];
    question3 = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],@"Do you like indian food?", @"yes", @"no", @"may be",@"can't decide",[NSNumber numberWithInt:2], nil];
    question4 = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],@"Do you like whipped cream?", @"yes", @"no", @"may be",@"can't decide",[NSNumber numberWithInt:1], nil];
    question5 = [NSArray arrayWithObjects:[NSNumber numberWithInt:5],@"Do you like oreo?", @"yes", @"no", @"may be",@"can't decide",[NSNumber numberWithInt:1], nil];
    
    
    [self loadingData:question1];
    [self loadingData:question2];
    [self loadingData:question3];
    [self loadingData:question4];
    [self loadingData:question5];
    
    [self fetchData:page];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)BtnClick:(id)sender{
    
        PopViewController *popView = [self.storyboard instantiateViewControllerWithIdentifier:@"popID"];
        if (answer == selectedOption) {
            popView.correct = @"yes";
        }
        else
        {
            popView.correct = @"No";
        }
        
        [self presentViewController:popView animated:YES completion:nil];
        
        page++;
        [ABtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [BBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [CBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [DBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [self fetchData:page];
        [View1 setNeedsDisplay];
    
}

-(IBAction)optionClicked:(id)sender
{
    long i = [sender tag];
    if (i == 101) {
        
        selectedOption = 1;
        [ABtn setImage:[UIImage imageNamed:@"radioCheck.png"] forState:UIControlStateNormal];
        [BBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [CBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [DBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
    }
    else if (i == 102)
    {
        selectedOption = 2;
        [BBtn setImage:[UIImage imageNamed:@"radioCheck.png"] forState:UIControlStateNormal];
        [ABtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [CBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [DBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        
    }
    else if (i == 103)
    {
        selectedOption = 3;
        [CBtn setImage:[UIImage imageNamed:@"radioCheck.png"] forState:UIControlStateNormal];
        [ABtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [BBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [DBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        
    }
    else if (i == 104)
    {
        selectedOption = 4;
        [DBtn setImage:[UIImage imageNamed:@"radioCheck.png"] forState:UIControlStateNormal];
        [ABtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [BBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        [CBtn setImage:[UIImage imageNamed:@"radio.jpeg"] forState:UIControlStateNormal];
        
    }
    
    [View1 setNeedsDisplay];
}
-(void)loadingData:(NSArray *)question
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Questions" inManagedObjectContext:context];
    [newQuestion setValue:question[0] forKey:@"qid"];
    [newQuestion setValue:question[1] forKey:@"question"];
    [newQuestion setValue:question[2] forKey:@"optionA"];
    [newQuestion setValue:question[3] forKey:@"optionB"];
    [newQuestion setValue:question[4] forKey:@"optionC"];
    [newQuestion setValue:question[5] forKey:@"optionD"];
    [newQuestion setValue:question[6] forKey:@"answer"];
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
}

-(void)fetchData:(int)pageNumber
{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Questions"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"qid == %d",pageNumber];
    [fetchRequest setPredicate:predicate];
    questionData = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSManagedObject *question = [questionData objectAtIndex:0];
    NSLog(@"%@ %@", [question valueForKey:@"qid"], [question valueForKey:@"question"] );
    
    questionLabel.text =[question valueForKey:@"question"];
    optionALabel.text = [question valueForKey:@"optionA"];
    optionBLabel.text = [question valueForKey:@"optionB"];
    optionCLabel.text = [question valueForKey:@"optionC"];
    optionDLabel.text = [question valueForKey:@"optionD"];
    answer = [[question valueForKey:@"answer"]intValue];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
