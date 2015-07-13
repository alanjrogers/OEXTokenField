//
//  OEXTokenField.h
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

#import "OEXTokenFieldCell.h"

@class OEXTokenField;

/** The `OEXTokenFieldDelegate` protocol defines the optional methods implemented by delegates of `<OEXTokenField>` objects.
 */
@protocol OEXTokenFieldDelegate <NSTokenFieldDelegate>

@optional

/** @name Displaying Tokenized Attachment Cells */

/** Allows the delegate to provide an attachment cell to be displayed for the given represented object.
 @param tokenField The token field that sent the message.
 @param representedObject A represented object of the token field.
 @return The attachment cell to be displayed for `representedObject`. If you return `nil` or do not implement this method, then a standard token is displayed.
 */
- (NSTextAttachmentCell *)tokenField:(OEXTokenField *)tokenField attachmentCellForRepresentedObject:(id)representedObject;

@end

#pragma mark -

/** `OEXTokenField` is a subclass of `NSTokenField` that allows token customization.
 
 `OEXTokenField` uses an `<OEXTokenFieldCell>` to implement much of the control's functionality.
 */
@interface OEXTokenField : NSTokenField <OEXTokenFieldCellDelegate>

/** @name Accessing the Delegate */

/** The token field's delegate.
 @discussion The delegate must adopt the `<OEXTokenFieldDelegate>` protocol.
 */
@property (weak) id <OEXTokenFieldDelegate> delegate;

@end
