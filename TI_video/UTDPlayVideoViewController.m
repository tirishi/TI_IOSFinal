//
//  UTDPlayVideoViewController.m
//  TI_video
//
//  Created by Mito Are on 11/19/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import "UTDPlayVideoViewController.h"

@interface UTDPlayVideoViewController ()

@end

@implementation UTDPlayVideoViewController

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
}

- (void)viewDidAppear:(BOOL)animated
{
    //largest bitrate tested, so far, is 922 and only for mp4 format
    NSURL *url = [NSURL URLWithString:
                  @"http://cdnbakmi.kaltura.com/p/182002/sp/18200200/playManifest/entryId/0_qha5pgwa/flavorIds/0_gadrpbdj/format/applehttp/protocol/http/a.ismv"];
                  //@"http://cdnbakmi.kaltura.com/p/182002/sp/18200200/playManifest/entryId/0_y3yfbfm7/flavorIds/0_r7xjzfp0/format/applehttp/protocol/http/a.mp4"];
    
    self.moviePlayer =  [[MPMoviePlayerController alloc]
                     initWithContentURL:url];
    
    self.movieView.autoresizesSubviews = YES;
    self.moviePlayer.view.frame = self.movieView.bounds;
    
    [self.movieView addSubview:self.moviePlayer.view];
    [self.moviePlayer prepareToPlay];
    
    self.moviePlayer.shouldAutoplay = YES;
    self.moviePlayer.controlStyle = MPMovieControlStyleDefault;

    //[self.moviePlayer setFullscreen:YES animated:YES];
    
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayer];
     */
}
/*
// Removes the movie from the view once done
- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerViewController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    [moviePlayerController.view removeFromSuperview];
}

*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
