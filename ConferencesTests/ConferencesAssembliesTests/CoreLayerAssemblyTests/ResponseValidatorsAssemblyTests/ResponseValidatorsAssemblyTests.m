// Copyright (c) 2015 RAMBLER&Co
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <XCTest/XCTest.h>
#import <RamblerTyphoonUtils/AssemblyTesting.h>

#import "ResponseValidatorsAssembly.h"
#import "ResponseValidatorsAssembly_Testable.h"
#import "ResponseValidatorsFactory.h"

#import "ParseResponseValidator.h"
#import "RamblerInitialAssemblyCollector+Activate.h"

@interface ResponseValidatorsAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) ResponseValidatorsAssembly *assembly;

@end

@implementation ResponseValidatorsAssemblyTests

- (void)setUp {
    [super setUp];
    
    Class class = [ResponseValidatorsAssembly class];
    self.assembly = [RamblerInitialAssemblyCollector rds_activateAssemblyWithClass:class];
}

- (void)tearDown {
    self.assembly = nil;
    
    [super tearDown];
}

- (void)testThatAssemblyCreatesParseResponseValidator {
    // given
    Class targetClass = [ParseResponseValidator class];
    
    // when
    id result = [self.assembly parseResponseValidator];
    
    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass];
    [self verifyTargetDependency:result withDescriptor:descriptor];
}

- (void)testThatAssemblyCreatesValidatorWithResponseValidationParseType {
    // given
    Class targetClass = [ParseResponseValidator class];
    
    // when
    id result = [self.assembly validatorWithType:@(ResponseValidationParseType)];
    
    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass];
    [self verifyTargetDependency:result withDescriptor:descriptor];
}

@end
