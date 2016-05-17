//
//  EnterInfoViewController.m
//  ToDo_
//
//  Created by Rosalyn Kingsmill on 2016-05-17.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "EnterInfoViewController.h"


@interface EnterInfoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *toDoItem;

@property (weak, nonatomic) IBOutlet UITextField *toDoDetail;

@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation EnterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setPriority:(id)sender {
    
    int stepper = (int)self.stepper.value;
    NSString *displayPriority = [NSString stringWithFormat:@"%i", stepper];
    self.priorityLabel.text = displayPriority;
    
}

- (IBAction)storeInfo:(id)sender {
    ToDo *toDo = [ToDo new];
    
    toDo.title = self.toDoItem.text;
    toDo.details = self.toDoDetail.text;
    
    toDo.priorityNumber = (int)self.stepper.value;
    
    [self.delegate setNewInfo:toDo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
