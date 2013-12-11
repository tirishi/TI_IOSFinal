//
//  UTDVideoListViewController.h
//  TI_video
//
//  Created by Mito Are on 11/19/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTDResultsViewController.h"
#import "KalturaClient.h"

@interface UTDVideoListViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableViewCell *entry;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *vidtitle;
@property (strong, nonatomic) IBOutlet UILabel *desc;

@end
