//
//  ButtonMakerViewController.m
//  ButtonMaker
//
//  Created by Scott Little on 18/02/10. Little Known Software.
//	This software is licensed as BSD generally. Do what you like with it, don't blame me if it blows up in your face though.
//	http://www.littleknownsoftware.com
//

#import <QuartzCore/QuartzCore.h>
#import "ButtonMakerViewController.h"
#import "ButtonMakerAppDelegate.h"

@implementation ButtonMakerViewController

@synthesize savedView;
@synthesize useTextSwitch;
@synthesize button;
@synthesize alphaDesc;
@synthesize widthDesc;
@synthesize heightDesc;
@synthesize butTitle;
@synthesize butWidth;
@synthesize butHeight;
@synthesize butRed;
@synthesize butGreen;
@synthesize butBlue;
@synthesize butAlpha;
@synthesize displayView;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.displayView.backgroundColor = [UIColor clearColor];
	
	Class		theClass = NSClassFromString(@"UIGlassButton");
	UIButton	*theButton = [[theClass alloc] initWithFrame:CGRectMake(100, 28, 120, 44)];
	[theButton setValue:[UIColor colorWithRed:0.652 green:0.079 blue:0.118 alpha:1.000] forKey:@"tintColor"];
	[theButton setTitle:@"Button" forState:UIControlStateNormal];
	[self.displayView addSubview:theButton];
	self.button = theButton;
	[theButton release];
	
	CALayer	*savedLayer = self.savedView.layer;
	savedLayer.masksToBounds = YES;
	savedLayer.cornerRadius = 10.0;
	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.butTitle = nil;
	self.butWidth = nil;
	self.butHeight = nil;
	self.butRed = nil;
	self.butGreen = nil;
	self.butBlue = nil;
	self.butAlpha = nil;
	self.displayView = nil;

	self.alphaDesc = nil;
	self.widthDesc = nil;
	self.heightDesc = nil;

	self.button = nil;
	self.useTextSwitch = nil;

	self.savedView = nil;

    [super dealloc];
}


#pragma mark -
#pragma mark Actions

- (void)alphaChanged {
	self.alphaDesc.text = [NSString stringWithFormat:@"%3.2f", self.butAlpha.value];
	[self otherValueChanged:self.butAlpha];
}

- (void)widthChanged {
	self.widthDesc.text = [NSString stringWithFormat:@"%3.0f", self.butWidth.value];
	[self otherValueChanged:self.butWidth];
}

- (void)heightChanged {
	self.heightDesc.text = [NSString stringWithFormat:@"%3.0f", self.butHeight.value];
	[self otherValueChanged:self.butHeight];
}


- (void)otherValueChanged:(id)sender {

	CGFloat	containerWidth = self.displayView.frame.size.width;
	CGFloat	containerHeight = self.displayView.frame.size.height;
	CGFloat	newWidth = self.butWidth.value;
	CGFloat	newHeight = self.butHeight.value;

	CGFloat	redValue = [self.butRed.text floatValue];
	CGFloat	greenValue = [self.butGreen.text floatValue];
	CGFloat	blueValue = [self.butBlue.text floatValue];
	
	UIColor		*newColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:self.butAlpha.value];
	CGRect		newFrame = CGRectMake((containerWidth - newWidth) / 2, (containerHeight - newHeight) / 2, newWidth, newHeight);
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.1];
	
	//	Set the button's characteristics
	self.button.frame = newFrame;
	[self.button setTitle:self.butTitle.text forState:UIControlStateNormal];
	[self.button setValue:newColor forKey:@"tintColor"];
	
	[UIView commitAnimations];
}

- (void)saveButton {
	
	//	If the path is empty, then ask the user for that first
    NSArray		*paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString	*basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	NSString	*filePath = [basePath stringByAppendingPathComponent:@"button.png"];
	
	//	Get the list of reference data loaded from the defaults
	NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];
	BOOL			locationWarningGiven = [[defaults objectForKey:kLocationWarningGiven] boolValue];
	
	//	If the button to save with text is off, then hide the text
	if (self.useTextSwitch.on) {
		[self.button setTitle:@"" forState:UIControlStateNormal];
	}
	
	UIGraphicsBeginImageContext(self.button.frame.size);
	CGContextRef theContext = UIGraphicsGetCurrentContext();
	[self.button.layer renderInContext:theContext];
	
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	NSData *theData = UIImagePNGRepresentation(theImage);
	[theData writeToFile:filePath atomically:NO];
	
	UIGraphicsEndImageContext();

	//	Reset the text if necessary
	if (self.useTextSwitch.on) {
		[self.button setTitle:self.butTitle.text forState:UIControlStateNormal];
	}
	
	//	Give a message about the location if required
	if (!locationWarningGiven) {
		
		NSString	*theMessage = [NSString stringWithFormat:@"Button was saved to App’s Documents folder: %@", filePath];
		UIAlertView	*alert = [[UIAlertView alloc] initWithTitle:@"Button Saved" message:theMessage delegate:nil
											  cancelButtonTitle:@"Won’t Be Shown Again" otherButtonTitles:nil];
		
		//	Update the defaults to register the fact that this has been given
		[defaults setValue:[NSNumber numberWithBool:YES] forKey:kLocationWarningGiven];
		
		[alert show];
		
	}
	else {
		//	Show our saved view breifly
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationDuration:0.1];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
		
		self.savedView.alpha = 1.0;
		
		[UIView commitAnimations];

	}
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
	
	//	Then fade it out
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationDelay:0.9];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		self.savedView.alpha = 0.0;
		
		[UIView commitAnimations];
}

#pragma mark -
#pragma mark TextField Delegation

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	//	Always dismiss the keyboard
	[textField resignFirstResponder];
	
	return NO;
}



@end
