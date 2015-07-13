//
//  OEXTokenTextStorage.h
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

@class OEXTokenTextStorage;

@protocol OEXTokenTextStorageDelegate <NSTextStorageDelegate>

@optional
- (void)tokenTextStorage:(OEXTokenTextStorage *)textStorage updateTokenAttachment:(NSTextAttachment *)attachment forRange:(NSRange)range;

@end

#pragma mark -

/*- OEXTokenTextStorage is used internally by OEXTokenFieldCell to perform attachment cell replacement as the tokens are inserted in the editor text view.
 */
@interface OEXTokenTextStorage : NSTextStorage

@property (weak) id <OEXTokenTextStorageDelegate> delegate;

- (id)initWithAttributedString:(NSAttributedString *)attrStr;

@end


