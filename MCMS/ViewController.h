//
//  ViewController.h
//  MCMS
//
//  Created by John Malloy on 1/14/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
