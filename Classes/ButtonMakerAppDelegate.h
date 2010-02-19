//
//  ButtonMakerAppDelegate.h
//  ButtonMaker
//
//  Created by Scott Little on 18/02/10. Little Known Software.
//	This software is licensed as BSD generally. Do what you like with it, don't blame me if it blows up in your face though.
//	http://www.littleknownsoftware.com
//

#import <UIKit/UIKit.h>

#define	kLocationWarningGiven	@"save-location-warning-given"

@class ButtonMakerViewController;

@interface ButtonMakerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ButtonMakerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ButtonMakerViewController *viewController;

@end

