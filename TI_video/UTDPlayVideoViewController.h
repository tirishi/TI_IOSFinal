//
//  UTDPlayVideoViewController.h
//  TI_video
//
//  Created by Mito Are on 11/19/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "KalturaClient.h"

@interface UTDPlayVideoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *movieView;
@property (nonatomic, retain) KalturaMediaEntry *mediaEntry;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end
