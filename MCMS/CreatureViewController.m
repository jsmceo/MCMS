//
//  CreatureViewController.m
//  MCMS
//
//  Created by John Malloy on 1/14/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"
#import "Accessory.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>
{
    
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UILabel *description;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextField *descriptionTextField;
    __weak IBOutlet UIButton *saveButton;
    __weak IBOutlet UILabel *nameTextFieldLabel;
    __weak IBOutlet UILabel *descriptionTextFieldLabel;
    __weak IBOutlet UIImageView *image;
    __weak IBOutlet UITableView *myAccessoryTableView;
    __weak IBOutlet UITextField *accessoryTextField;
    __weak IBOutlet UIButton *addAccessoryButton;
}

@end

@implementation CreatureViewController

@synthesize creature, accessories;

- (void)viewDidLoad
{
    [super viewDidLoad];
	name.text = creature.name;
    description.text = creature.description;
    image.image = creature.image;
    accessories = [NSMutableArray array];
    creature.accessories = [NSMutableArray array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return accessories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccessoryCellID"];
    Accessory *tempAccessory = [creature.accessories objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%i)", tempAccessory.name, tempAccessory.strength];
    return cell;
}
- (IBAction)onAddAccessoryButtonPressed:(id)sender {
    
    if (accessories.count < 2) {
        Accessory *tempAccessory = [[Accessory alloc] init];
        tempAccessory.name = accessoryTextField.text;
        tempAccessory.strength = (arc4random() % 10) + 1;
        [accessories addObject:tempAccessory];
        [creature.accessories addObject:tempAccessory];
        [myAccessoryTableView reloadData];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Accessory Limit Reached!" message:@"Only two accessories are permitted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    accessoryTextField.text = @"";
    [accessoryTextField resignFirstResponder];

}

- (IBAction)onEditButtonPressed:(id)sender
{
    name.alpha = 0;
    description.alpha = 0;
    nameTextField.alpha = 1;
    descriptionTextField.alpha = 1;
    saveButton.alpha = 1;
    nameTextFieldLabel.alpha = 1;
    descriptionTextFieldLabel.alpha = 1;
    myAccessoryTableView.alpha = 0;
    addAccessoryButton.alpha = 0;
    accessoryTextField.alpha = 0;
    nameTextField.text = creature.name;
    descriptionTextField.text = creature.description;

}

- (IBAction)onSaveButtonPressed:(id)sender
{
    creature.name = nameTextField.text;
    creature.description = descriptionTextField.text;
    name.text = creature.name;
    name.alpha = 1;
    nameTextField.alpha = 0;
    descriptionTextField.alpha = 0;
    nameTextFieldLabel = 0;
    descriptionTextFieldLabel = 0;
    saveButton.alpha = 0;
    myAccessoryTableView.alpha = 1;
    addAccessoryButton.alpha = 1;
    accessoryTextField.alpha = 1;
    [nameTextField resignFirstResponder];
}

- (UIViewController *)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
    ViewController *myViewController = fromViewController;
    NSIndexPath *indexPath = [myViewController.myTableView indexPathForCell:sender];
    [myViewController.creatures replaceObjectAtIndex:indexPath.row withObject:creature];
    
    return myViewController;
}

@end
