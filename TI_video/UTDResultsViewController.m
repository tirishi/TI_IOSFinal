//
//  UTDResultsViewController.m
//  TI_video
//
//  Created by Mito Are on 10/31/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import "UTDResultsViewController.h"

@interface UTDResultsViewController ()

@end

@implementation UTDResultsViewController

@synthesize UrlOutputLabel, ApiCallOutputLabel, XmlOutputLabel,forLabel,playlist;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.UrlOutputLabel.text = self.forLabel;
    [UrlOutputLabel  sizeToFit];
    self.ApiCallOutputLabel.text = self.outLabel;
    [ApiCallOutputLabel sizeToFit];
    self.XmlOutputLabel.text = self.xmlLabel;
    [XmlOutputLabel sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)resultbutton:(id)sender {
}
@end
