// ===================================================================================================
//                           _  __     _ _
//                          | |/ /__ _| | |_ _  _ _ _ __ _
//                          | ' </ _` | |  _| || | '_/ _` |
//                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
//
// This file is part of the Kaltura Collaborative Media Suite which allows users
// to do with audio, video, and animation what Wiki platfroms allow them to do with
// text.
//
// Copyright (C) 2006-2011  Kaltura Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// @ignore
// ===================================================================================================
// @package External
// @subpackage Kaltura
#import "../KalturaClient.h"
#import "KalturaEventNotificationClientPlugin.h"

///////////////////////// enums /////////////////////////
// @package External
// @subpackage Kaltura
@interface KalturaEmailNotificationTemplatePriority : NSObject
+ (int)HIGH;
+ (int)NORMAL;
+ (int)LOW;
@end

// @package External
// @subpackage Kaltura
@interface KalturaEmailNotificationTemplateOrderBy : NSObject
+ (NSString*)ID_ASC;
+ (NSString*)ID_DESC;
+ (NSString*)CREATED_AT_ASC;
+ (NSString*)CREATED_AT_DESC;
+ (NSString*)UPDATED_AT_ASC;
+ (NSString*)UPDATED_AT_DESC;
@end

///////////////////////// classes /////////////////////////
// @package External
// @subpackage Kaltura
@interface KalturaEmailNotificationDispatchJobData : KalturaEventNotificationDispatchJobData
// Define the email sender email
@property (nonatomic,copy) NSString* fromEmail;
// Define the email sender name
@property (nonatomic,copy) NSString* fromName;
// Email recipient emails and names, key is mail address and value is the name
@property (nonatomic,retain) NSMutableArray* to;	// of KalturaKeyValue elements
// Email cc emails and names, key is mail address and value is the name
@property (nonatomic,retain) NSMutableArray* cc;	// of KalturaKeyValue elements
// Email bcc emails and names, key is mail address and value is the name
@property (nonatomic,retain) NSMutableArray* bcc;	// of KalturaKeyValue elements
// Email addresses that a replies should be sent to, key is mail address and value is the name
@property (nonatomic,retain) NSMutableArray* replyTo;	// of KalturaKeyValue elements
// Define the email priority
@property (nonatomic,assign) int priority;	// enum KalturaEmailNotificationTemplatePriority
// Email address that a reading confirmation will be sent to
@property (nonatomic,copy) NSString* confirmReadingTo;
// Hostname to use in Message-Id and Received headers and as default HELO string. 
// 	 If empty, the value returned by SERVER_NAME is used or 'localhost.localdomain'.
@property (nonatomic,copy) NSString* hostname;
// Sets the message ID to be used in the Message-Id header.
// 	 If empty, a unique id will be generated.
@property (nonatomic,copy) NSString* messageID;
// Adds a e-mail custom header
@property (nonatomic,retain) NSMutableArray* customHeaders;	// of KalturaKeyValue elements
// Define the content dynamic parameters
@property (nonatomic,retain) NSMutableArray* contentParameters;	// of KalturaKeyValue elements
- (KalturaFieldType)getTypeOfFromEmail;
- (KalturaFieldType)getTypeOfFromName;
- (KalturaFieldType)getTypeOfTo;
- (NSString*)getObjectTypeOfTo;
- (KalturaFieldType)getTypeOfCc;
- (NSString*)getObjectTypeOfCc;
- (KalturaFieldType)getTypeOfBcc;
- (NSString*)getObjectTypeOfBcc;
- (KalturaFieldType)getTypeOfReplyTo;
- (NSString*)getObjectTypeOfReplyTo;
- (KalturaFieldType)getTypeOfPriority;
- (KalturaFieldType)getTypeOfConfirmReadingTo;
- (KalturaFieldType)getTypeOfHostname;
- (KalturaFieldType)getTypeOfMessageID;
- (KalturaFieldType)getTypeOfCustomHeaders;
- (NSString*)getObjectTypeOfCustomHeaders;
- (KalturaFieldType)getTypeOfContentParameters;
- (NSString*)getObjectTypeOfContentParameters;
- (void)setPriorityFromString:(NSString*)aPropVal;
@end

// @package External
// @subpackage Kaltura
@interface KalturaEmailNotificationTemplateBaseFilter : KalturaEventNotificationTemplateFilter
@end

// @package External
// @subpackage Kaltura
@interface KalturaEmailNotificationTemplateFilter : KalturaEmailNotificationTemplateBaseFilter
@end

///////////////////////// services /////////////////////////
