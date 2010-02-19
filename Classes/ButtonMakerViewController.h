//
//  ButtonMakerViewController.h
//  ButtonMaker
//
//  Created by Scott Little on 18/02/10. Little Known Software.
//	This software is licensed as BSD generally. Do what you like with it, don't blame me if it blows up in your face though.
//	http://www.littleknownsoftware.com
//

#import <UIKit/UIKit.h>

@interface ButtonMakerViewController : UIViewController {
	
	UIView		*displayView;
	UIButton	*button;
	
	UITextField	*butTitle;
	UITextField	*butRed;
	UITextField	*butGreen;
	UITextField	*butBlue;

	UISlider	*butAlpha;
	UILabel		*alphaDesc;

	UISlider	*butWidth;
	UILabel		*widthDesc;
	UISlider	*butHeight;
	UILabel		*heightDesc;
	
	UISwitch	*useTextSwitch;
	
	UIView		*savedView;
}

@property (nonatomic, retain)	IBOutlet	UIView			*displayView;
@property (nonatomic, retain)	IBOutlet	UIButton		*button;

@property (nonatomic, retain)	IBOutlet	UITextField		*butTitle;
@property (nonatomic, retain)	IBOutlet	UITextField		*butRed;
@property (nonatomic, retain)	IBOutlet	UITextField		*butGreen;
@property (nonatomic, retain)	IBOutlet	UITextField		*butBlue;

@property (nonatomic, retain)	IBOutlet	UILabel			*alphaDesc;
@property (nonatomic, retain)	IBOutlet	UISlider		*butAlpha;

@property (nonatomic, retain)	IBOutlet	UISlider		*butWidth;
@property (nonatomic, retain)	IBOutlet	UILabel			*widthDesc;
@property (nonatomic, retain)	IBOutlet	UISlider		*butHeight;
@property (nonatomic, retain)	IBOutlet	UILabel			*heightDesc;

@property (nonatomic, retain)	IBOutlet	UISwitch		*useTextSwitch;

@property (nonatomic, retain)	IBOutlet	UIView			*savedView;

- (IBAction)alphaChanged;
- (IBAction)widthChanged;
- (IBAction)heightChanged;
- (IBAction)otherValueChanged:(id)sender;

- (IBAction)saveButton;

@end

