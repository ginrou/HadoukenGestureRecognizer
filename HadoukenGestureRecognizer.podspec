Pod::Spec.new do |s|

  s.name         = "HadoukenGestureRecognizer"
  s.version      = "0.0.1"
  s.summary      = "Motion Recognizer for HadoukenGesture"

  s.description  = <<-DESC
Support Vector Machine based Motion Recognizer. 
Hold your iPhone and do 'Hadouken' action, known in Street Fighter.
                   DESC

  s.homepage     = "https://github.com/ginrou/HadoukenGestureRecognizer"

  s.license      = { :type => "BSD" , :text => <<-LICENSE 
Copyright (c) 2014, Yuichi Takeda All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR\ POSE ARE DISCLAIMED. IN NO EVENT SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PRO\ CUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING\ NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
LICENSE
}

  s.author       = { "ginrou" => "ginrou799@gmail.com" }
  s.social_media_url = "http://twitter.com/ginrou799"

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/ginrou/HadoukenGestureRecognizer.git", :commit => "f17154513ef1479dea21e53c7db116f0633de317" }

  s.source_files  = 'Classes', 'Classes/**/*.{h,m,c,cpp}',

  s.resource  = "HadoukenGestureRecognizer.bundle"

  s.framework  = 'CoreMotion'

  s.requires_arc = true

end
