//------------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//------------------------------------------------------------------------------

#import "MSALInteractiveTokenParameters.h"
#import "MSALTokenParameters+Internal.h"
#import "MSALGlobalConfig.h"
#import "MSALWebviewConfig.h"

@implementation MSALInteractiveTokenParameters

@synthesize telemetryApiId;

- (instancetype)initWithScopes:(NSArray<NSString *> *)scopes
                 webviewConfig:(MSALWebviewConfig *)webviewConfig
{
    self = [super initWithScopes:scopes];
    if (self)
    {
        self.telemetryApiId = MSALTelemetryApiIdAcquireWithTokenParameters;
        _promptType = MSALPromptTypeDefault;
        _webviewConfig = [webviewConfig copy];
    }
    return self;
}

- (instancetype)initWithScopes:(NSArray<NSString *> *)scopes
{
    return [self initWithScopes:scopes
                  webviewConfig:[MSALWebviewConfig new]];
}

#if TARGET_OS_IPHONE

- (void)setParentViewController:(UIViewController *)parentViewController
{
    self.webviewConfig.parentViewController = parentViewController;
}

- (UIViewController *)parentViewController
{
    return self.webviewConfig.parentViewController;
}

- (void)setPresentationStyle:(UIModalPresentationStyle)presentationStyle
{
    self.webviewConfig.presentationStyle = presentationStyle;
}

- (UIModalPresentationStyle)presentationStyle
{
    return self.webviewConfig.presentationStyle;
}

#endif

- (void)setWebviewType:(MSALWebviewType)webviewType
{
    self.webviewConfig.webviewType = webviewType;
}

- (MSALWebviewType)webviewType
{
    return self.webviewConfig.webviewType;
}

- (void)setCustomWebview:(WKWebView *)customWebview
{
    self.webviewConfig.customWebview = customWebview;
}

- (WKWebView *)customWebview
{
    return self.webviewConfig.customWebview;
}

@end
