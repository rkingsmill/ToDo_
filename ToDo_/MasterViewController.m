//
//  MasterViewController.m
//  ToDo_
//
//  Created by Rosalyn Kingsmill on 2016-05-17.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "TableViewCell.h"
#import "EnterInfoViewController.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, EnterInfoViewControllerDelegate>

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    ToDo *toDo1 = [[ToDo alloc] init];
    ToDo *toDo2 = [[ToDo alloc]init];
    ToDo *toDo3 = [[ToDo alloc]init];
    ToDo *toDo4 = [[ToDo alloc]init];

    self.objects = [[NSMutableArray alloc] initWithObjects:toDo1, toDo2, toDo3, toDo4, nil];
    //self.objects = [NSMutableArray arrayWithObjects:toDo1, toDo2, toDo3, toDo4, nil]
    
    toDo1.title = @"Dog";
    toDo1.details = @"Drop off at cleaners and ksdhfkdsfhkds skdjfskdjfh aijksdfsdfkjsdfskjdf";
    toDo1.priorityNumber = 3;
    toDo1.completedIndicator = NO;
    
    toDo2.title = @"Lunch";
    toDo2.details = @"Meet at restaurant and ksdhfkdsfhkds skdjfskdjfh aijksdfsdfkjsdfskjdf jhjhdfhjsjfshfshjsfjhsfhj";
    toDo2.priorityNumber = 2;
    toDo2.completedIndicator = YES;
    
    toDo3.title = @"Meeting";
    toDo3.details = @"Do presentation and ksdhfkdsfhkds skdjfskdjfh aijksdfsdfkjsdfskjdf hjbfjdhs dueiwruw";
    toDo3.priorityNumber = 1;
    toDo3.completedIndicator = NO;
    
    toDo4.title = @"Birthday";
    toDo4.details = @"Buy gift and ksdhfkdsfhkds skdjfskdjfh aijksdfsdfkjsdfskjdf hdfhjsdf skdjfdskjf";
    toDo4.priorityNumber = 3;
    toDo4.completedIndicator = NO;

}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    //ToDo *toDo = [ToDo new];
//    [self.objects insertObject: toDo atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
     [self performSegueWithIdentifier: @"EnterInfo" sender: self];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
    
    if ([[segue identifier] isEqualToString:@"EnterInfo"]) {
        
        EnterInfoViewController *controller = (EnterInfoViewController *) [segue destinationViewController];
        controller.delegate = self;
    }
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ToDo *toDo = [self.objects objectAtIndex:indexPath.row];
    cell.textLabel.text = toDo.title;
    cell.detailTextLabel.text = toDo.details;
    
    
    if (toDo.completedIndicator == YES) {
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:toDo.title];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        
        NSMutableAttributedString *attributeString2 = [[NSMutableAttributedString alloc] initWithString:toDo.details];
        [attributeString2 addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString2 length])];
        
        cell.textLabel.attributedText = attributeString;
        cell.detailTextLabel.attributedText = attributeString2;
    }
    
    switch (toDo.priorityNumber) {
        case 1:
            cell.backgroundColor = [UIColor redColor];
            break;
            
        case 2:
            cell.backgroundColor = [UIColor yellowColor];
            break;
            
        case 3:
            cell.backgroundColor = [UIColor greenColor];
            
        default:
            break;
            
    }
    
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


-(void)setNewInfo:(ToDo*)toDo {
    
    [self.objects insertObject: toDo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self.tableView reloadData];
    
}

@end
