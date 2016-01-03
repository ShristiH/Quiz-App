//
//  Questions.h
//  
//
//  Created by Shristi Hingle on 21/11/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Questions : NSManagedObject

@property (nonatomic, retain) NSNumber * qid;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * optionA;
@property (nonatomic, retain) NSString * optionB;
@property (nonatomic, retain) NSString * optionC;
@property (nonatomic, retain) NSString * optionD;
@property (nonatomic, retain) NSNumber * answer;

@end
