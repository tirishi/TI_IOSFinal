//
//  UTDResultsViewController.h
//  TI_video
//
//  Created by Mito Are on 10/31/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTDWebServicesViewController.h"
#import "KalturaClient.h"

@interface UTDResultsViewController : UIViewController
{
    UILabel *UrlOutputLabel;
    UILabel *ApiCallOutputLabel;
    UILabel *XmlOutputLabel;
    NSString *forLabel;
    UIButton *playlist;
    KalturaMediaListResponse *result;
}

@property(retain,nonatomic) IBOutlet UILabel *UrlOutputLabel;
@property(retain,nonatomic) IBOutlet UILabel *ApiCallOutputLabel;
@property(retain,nonatomic) IBOutlet UILabel *XmlOutputLabel;
@property(retain,nonatomic) NSString *forLabel;
@property(retain,nonatomic) NSString *outLabel;
@property(retain,nonatomic) NSString *xmlLabel;
@property (strong, nonatomic) IBOutlet UIButton *playlist;
@property(retain,nonatomic) KalturaMediaListResponse *result;



@end
