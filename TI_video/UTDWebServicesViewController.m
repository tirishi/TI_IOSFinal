//
//  UTDWebServicesViewController.m
//  TI_video
//
//  Created by Mito Are on 10/31/13.
//  Copyright (c) 2013 Mito Are. All rights reserved.
//

#import "UTDWebServicesViewController.h"
#import "UTDResultsViewController.h"
#import "KalturaClient.h"

#define DEFAULT_SERVICE_URL     @"http://www.kaltura.com"



@interface UTDWebServicesViewController ()

@property(retain,nonatomic) IBOutlet UITextField *product_family;
@property(retain,nonatomic) IBOutlet UIButton *product_button;
@property(retain,nonatomic) IBOutlet UITextField *part;
@property(retain,nonatomic) IBOutlet UIButton *part_button;
@property(retain,nonatomic) IBOutlet UITextField *tool;
@property(retain,nonatomic) IBOutlet UIButton *tool_button;
@property(retain,nonatomic) IBOutlet UITextField *application;
@property(retain,nonatomic) IBOutlet UIButton *application_button;
@property(retain,nonatomic) IBOutlet UITextField *keyword;
@property(retain,nonatomic) IBOutlet UIButton *keyword_button;

@end

@implementation UTDWebServicesViewController

//@synthesize delegate;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)processInput:(id)sender
{
    UTDResultsViewController *ResultsView = [self.storyboard instantiateViewControllerWithIdentifier:@"utdResultsViewController"];
    ResultsView.UrlOutputLabel.text = @"Sample";
    [self.navigationController pushViewController:ResultsView animated:YES];

    //[delegate changeLabelFromWebService:self newString:@"Sample"];
    //NSString *fromTextField = self.product_family.text;
    //NSString *kaltura1 = @"http://www.kaltura.com/api_v3/?service=";
    //NSString *kaltura2 = @"&action=";
    //self.web.text = [NSString stringWithFormat: @"%@%@", kaltura1, kaltura2];
    self.web.text = self.product_family.text;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    KalturaClientConfiguration* config = [[KalturaClientConfiguration alloc] init];
    KalturaNSLogger* logger = [[KalturaNSLogger alloc] init];
    config.logger = logger;         // retained on config
    config.serviceUrl = DEFAULT_SERVICE_URL;
    KalturaClient* client = [[KalturaClient alloc]initWithConfig:config];
    
    KalturaUserService *service = [[KalturaUserService alloc] init];
    service.client = client;
    
    NSString *userEmail = [NSString stringWithFormat:@"im_video_admin@list.ti.com"];
    NSString *userPassword = [NSString stringWithFormat:@"Opensam8*"];
    
    NSString* ks = [service loginByLoginIdWithLoginId:userEmail withPassword:userPassword];
    
    
    KalturaUserListResponse *response = [client.user list];
    
    int partnerId;
    for (KalturaUser *user in [response objects]) {
        partnerId = user.partnerId;
    }
    
    NSLog(@"%@", ks);
    
    
    UTDResultsViewController *ResultsView = [segue destinationViewController];
    
    NSString *userIn;
    
    if ([[segue identifier] isEqualToString:@"prodFam"])
    {
        userIn = self.product_family.text;
        //[self.product_family resignFirstResponder];
        //[[self view] endEditing:YES];
        
    }
    if ([[segue identifier] isEqualToString:@"gpn"])
    {
        userIn = self.part.text;
    }
    if ([[segue identifier] isEqualToString:@"tool"])
    {
         userIn = self.tool.text;
    }
    if ([[segue identifier] isEqualToString:@"app"])
    {
        userIn = self.application.text;
    }
    if ([[segue identifier] isEqualToString:@"keywords"])
    {
        userIn = self.keyword.text;
    }
    KalturaMediaEntryFilter* filter= [[KalturaMediaEntryFilter alloc] init];
    filter.tagsLike = userIn;
    KalturaMediaService* service1 = [[KalturaMediaService alloc] init];
    service1.client = client;
    service1.client.ks = ks;
    
    KalturaMediaListResponse* call = [service1 listWithFilter:filter];
    
    KalturaMediaListResponse* response1 = [client.media list];
    
    
    NSString *http = @"http://www.kaltura.com/api_v3/?service=playlist&action=list&filter:tagsLike=";
    ResultsView.forLabel = [http stringByAppendingString:userIn];
        
    http =[http stringByAppendingString:userIn];
        
    ResultsView.outLabel = http;
    http = @" ";
    
        
    NSLog(@"%@",response1);
    
    for (KalturaMediaEntry *entry in [response1 objects]){
        NSString* temp = [NSString stringWithFormat:@" EntryID: %@",entry.id];
        http = [http stringByAppendingString:(temp)];
    }
    ResultsView.xmlLabel = http;
    ResultsView.result = response1;
    
    NSLog(@"%@",http);
    
    
        
     
    
/**
    if ([[segue identifier] isEqualToString:@"gpn"])
    {
        NSString *userIn = self.part.text;
        NSString *http = @"GPN";//@"http://www.kaltura.com/api_v3/?service=playlist&action=list&filter:tagsLike="";
        ResultsView.forLabel = [http stringByAppendingString:userIn];
        
    }
    if ([[segue identifier] isEqualToString:@"tool"])
    {
        NSString *userIn = self.tool.text;
        NSString *http = @"TOOL";//@"http://www.kaltura.com/api_v3/?service=playlist&action=list&filter:tagsLike="";
        ResultsView.forLabel = [http stringByAppendingString:userIn];
        
    }if ([[segue identifier] isEqualToString:@"app"])
    {
        NSString *userIn = self.application.text;
        NSString *http = @"APP";//@"http://www.kaltura.com/api_v3/?service=playlist&action=list&filter:tagsLike="";
        ResultsView.forLabel = [http stringByAppendingString:userIn];
        
    }if ([[segue identifier] isEqualToString:@"keywords"])
    {
        NSString *userIn = self.keyword.text;
        NSString *http = @"KEYS";//@"http://www.kaltura.com/api_v3/?service=playlist&action=list&filter:tagsLike="";
        ResultsView.forLabel = [http stringByAppendingString:userIn];
        
    }
*/
}

@end
