//
//  UTDWebServicesViewController.h
//  TI_video
//
//  Created by Mito Are on 10/31/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
@class UTDWebServicesViewController;

@protocol WebServiceDelegate <NSObject>
- (void) changeLabelFromWebService:(UTDWebServicesViewController *)webServiceInstance newString:(NSString *)input;
@end
*/

@interface UTDWebServicesViewController : UIViewController

//@property (nonatomic, weak) id <WebServiceDelegate> delegate;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end


