//
//  EnterInfoViewController.h
//  ToDo_
//
//  Created by Rosalyn Kingsmill on 2016-05-17.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class EnterInfoViewController;

@protocol EnterInfoViewControllerDelegate <NSObject>

-(void)setNewInfo:(ToDo*)toDo;

@end

@interface EnterInfoViewController : UIViewController

@property (nonatomic, weak) id <EnterInfoViewControllerDelegate> delegate;

@end
