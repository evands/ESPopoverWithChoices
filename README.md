ESPopoverWithChoices
====================

Relatively simple helper class depending on WEPopover to display a popover with choices. Simply include the classes within this repository and within the WEPopover submodule (as well as the associated resources) in your own project.

```
- (void)displayChoices:(UIBarButtonItem *)sender
{
	ESPopoverChoicesSelectionController *contentViewController = [[ESPopoverChoicesSelectionController alloc] initWithStyle:UITableViewStylePlain];
	contentViewController.delegate = self;
	contentViewController.choices = [NSArray arrayWithObjects:
					[ESPopoverChoice popoverChoiceWithName:@"Choice One" value:[NSNumber numberWithInteger:EnumValueForChoiceOne]],
					[ESPopoverChoice popoverChoiceWithName:@""Choice Two" value:[NSNumber numberWithInteger:EnumValueForChoiceTwo]],
					[ESPopoverChoice popoverChoiceWithName:@""Choice Three" "value:[NSNumber numberWithInteger:EnumValueForChoiceThree]],
									 nil];

	self.popoverController = [[[WEPopoverController alloc] initWithContentViewController:contentViewController] autorelease];
	[self.popoverController presentPopoverFromBarButtonItem:sender 
								   permittedArrowDirections:UIPopoverArrowDirectionUp
												   animated:YES];
	[contentViewController release];
}
```
with a simple delegate handler method of:

```
- (void)popoverChoicesSelectionController:(ESPopoverChoicesSelectionController *)controller didSelectChoice:(ESPopoverChoice *)choice
{
	if (choice) {
		NSInteger theChoiceEnumValue = [choice.value intValue];
	
		. . .
	}
				
	[self.popoverController dismissPopoverAnimated:YES];
	self.popoverController = nil;
}
```
