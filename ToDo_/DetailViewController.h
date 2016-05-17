//
//  DetailViewController.h
//  ToDo_
//
//  Created by Rosalyn Kingsmill on 2016-05-17.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

