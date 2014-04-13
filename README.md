HadoukenGestureRecognizer
=========================

Hold your iPhone and do action of "Hadouken", then your action is recognized.

**Notice**
"Hadouken" action meens physical action, moving your body with your iPhone, and does not meen to enter "↓➘→ + P" :)


### How to use

##### Installation
Using CocoaPods is recommended.
Add 'HadoukenGestureRecognizer' to your Podfile
```
pod 'HadoukenGestureRecognizer', :git => 'git@github.com:ginrou/HadoukenGestureRecognizer.git'
```

##### Implementation
It is very simple to use TKDHadoukenGesutureRecognizer, the way to use is very similar to using UIGestureRecognizer.

First, implement handler method which is called when Hadouken gesture is recognized. The method requires a argument which type is TKDHadoukenGesutureRecognizer

```
- (void)hadoukenRecognized:(id)sender {
    NSLog(@"hadouken recognzied");
}
```

Then, create instance of gesture recognizer
```
self.hadoukenRecognzier = [[TKDHadoukenGesutureRecognizer alloc] initWithTarget:self action:@selector(hadoukenRecognized:)];
```

Since TKDHadoukenGesutureRecognizer does not have ownership of action target and not attached to any view, the target is responsible to own created gesture recognizer. 
```
@property (nonatomic, strong) TKDHadoukenGesutureRecognizer *hadoukenRecognzier;
```

There is most simple sample under Demo directory of this repo.

### Dependencies
This library use CoreMotion.framework, and [libsvm](http://www.csie.ntu.edu.tw/~cjlin/libsvm/).


### LICENSE
Copyright (c) 2014, Yuichi Takeda
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR\
POSE ARE DISCLAIMED. IN NO EVENT SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PRO\
CUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING\
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
### LICENSE of libsvm
Copyright (c) 2000-2013 Chih-Chung Chang and Chih-Jen Lin
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

3. Neither name of copyright holders nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.


THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
