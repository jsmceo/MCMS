//
//  CreatureViewController.m
//  MCMS
//
//  Created by John Malloy on 1/14/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"

@interface CreatureViewController ()
{
    
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UIButton *saveButton;
}

@end

@implementation CreatureViewController

@synthesize creature;

- (void)viewDidLoad
{
    [super viewDidLoad];
	name.text = creature.name;
}
- (IBAction)onEditButtonPressed:(id)sender
{
    name.alpha = 0;
    nameTextField.alpha = 1;
    saveButton.alpha = 1;
    nameTextField.text = creature.name;
}

- (IBAction)onSaveButtonPressed:(id)sender
{
    creature.name = nameTextField.text;
    name.text = creature.name;
    name.alpha = 1;
    nameTextField.alpha = 0;
    saveButton.alpha = 0;    
}

/* - (UIViewController *)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
    ViewController *myViewController = fromViewController;
    NSIndexPath *indexPath = [myViewController.myTableView indexPathForCell:sender];
    [myViewController.arrayOfCreatures replaceObjectAtIndex:indexPath.row withObject:creature];
    
    return myViewController;
} */

@end
