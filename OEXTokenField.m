//
//  OEXTokenField.m
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

#import "OEXTokenField.h"
#import "OEXTokenFieldCell.h"
#import "OEXTokenAttachmentCell.h"

@implementation OEXTokenField

@dynamic delegate;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self == nil) return nil;
    
    // Changing the cell's class in the XIB is easy to forget
    // Let's make sure we have a OEXTokenFieldCell
    
    if (![self.cell isKindOfClass:[OEXTokenFieldCell class]]) {
        NSMutableData *data = [NSMutableData new];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [self.cell encodeWithCoder:archiver];
        [archiver finishEncoding];
        self.cell = [[OEXTokenFieldCell alloc] initWithCoder:[[NSKeyedUnarchiver alloc] initForReadingWithData:data]];
    }

    return self;
}

+ (Class)cellClass
{
    return [OEXTokenFieldCell class];
}

- (NSTextAttachmentCell *)tokenFieldCell:(OEXTokenFieldCell *)tokenFieldCell attachmentCellForRepresentedObject:(id)representedObject
{
    if ([self.delegate respondsToSelector:@selector(tokenField:attachmentCellForRepresentedObject:)])
        return [self.delegate tokenField:self attachmentCellForRepresentedObject:representedObject];
    
    return nil;
}

#pragma mark - NSTextViewDelegate

- (void)textView:(NSTextView *)aTextView clickedOnCell:(NSCell *)cell inRect:(NSRect)cellFrame atIndex:(NSUInteger)charIndex
{
    [aTextView setSelectedRange:NSMakeRange(charIndex, 1)];

    CGPoint popupPosition = CGPointMake(cellFrame.origin.x + cellFrame.size.width, cellFrame.origin.y);
    CGPoint position = [aTextView convertPoint:popupPosition toView:nil];

    NSEvent *event = [NSEvent mouseEventWithType:NSLeftMouseDown location:position modifierFlags:0 timestamp:[[NSProcessInfo processInfo] systemUptime] windowNumber:self.window.windowNumber context:nil eventNumber:0 clickCount:1 pressure:1];

    [NSMenu popUpContextMenu:[cell menu] withEvent:event forView:aTextView];
}

@end
