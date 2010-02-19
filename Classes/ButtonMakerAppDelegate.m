//
//  ButtonMakerAppDelegate.m
//  ButtonMaker
//
//  Created by Scott Little on 18/02/10. Little Known Software.
//	This software is licensed as BSD generally. Do what you like with it, don't blame me if it blows up in your face though.
//	http://www.littleknownsoftware.com
//

#import "ButtonMakerAppDelegate.h"
#import "ButtonMakerViewController.h"

@implementation ButtonMakerAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	//	Initialize the defaults system
	NSDictionary	*defaultDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], kLocationWarningGiven, nil];
	NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];
	[defaults registerDefaults:defaultDict];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}




@end
