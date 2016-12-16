Received: by 10.25.205.13 with SMTP id d13csp705891lfg;
        Fri, 16 Dec 2016 06:08:03 -0800 (PST)
X-Received: by 10.200.40.175 with SMTP id i44mr2659539qti.258.1481897283242;
        Fri, 16 Dec 2016 06:08:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si3246466qka.141.2016.12.16.06.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 06:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHtB2-00070b-KI
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 09:08:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cHtAE-0002Vn-BR
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:07:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cHtAB-00068f-2m
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:07:10 -0500
Resent-Date: Fri, 16 Dec 2016 09:07:10 -0500
Resent-Message-Id: <E1cHtAB-00068f-2m@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cHtAA-00068C-Pe; Fri, 16 Dec 2016 09:07:07 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1481897221134744.2869334577197;
	Fri, 16 Dec 2016 06:07:01 -0800 (PST)
In-Reply-To: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
Message-ID: <148189721994.31.4382817436141231579@790289a7ca88>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcin.krzeminski@nokia.com
Date: Fri, 16 Dec 2016 06:07:01 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/3] MultiCPU changes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, famz@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GXyx/WisrV1+

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzClN1
YmplY3Q6IFtRZW11LWRldmVsXSBbUkZDIDAvM10gTXVsdGlDUFUgY2hhbmdlcwpNZXNzYWdlLWlk
OiAxNDgxODk0NTU5LTEzOTc0LTEtZ2l0LXNlbmQtZW1haWwtbWFyY2luLmtyemVtaW5za2lAbm9r
aWEuY29tCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UK
bj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoK
IyBVc2VmdWwgZ2l0IG9wdGlvbnMKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxv
ZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwog
ICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1h
dD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3Jp
cHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAg
ICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8xNDgxODk0NTU5LTEzOTc0LTEtZ2l0LXNlbmQt
ZW1haWwtbWFyY2luLmtyemVtaW5za2lAbm9raWEuY29tIC0+IHBhdGNoZXcvMTQ4MTg5NDU1OS0x
Mzk3NC0xLWdpdC1zZW5kLWVtYWlsLW1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbQpTd2l0Y2hl
ZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmE0ODNkYTggZXhlYzogQWxsb3cgdG8gY2hhbmdlIEFk
ZHJlc3MgU3BhY2UgZnJvbSBib2FyZCBsZXZlbAoyODg5NTI4IEFSTTogYm9vdDogQWRkIG9wdGlv
biB0byBza2lwIEZEVCBtZW1vcnkgbm9kZSB1cGRhdGUKN2E0YWE1YSBudmljOiBBZGQgQ1BVIG51
bWViciBwcm9wZXJ0eQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0ggMS8zOiBu
dmljOiBBZGQgQ1BVIG51bWViciBwcm9wZXJ0eS4uLgpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxk
IG5ldmVyIHVzZSB0YWJzCiM4MjogRklMRTogaHcvaW50Yy9hcm12N21fbnZpYy5jOjQ3NzoKK15J
Vk1TVEFURV9VSU5UMzIoY3B1X2lkLCBudmljX3N0YXRlKSwkCgp0b3RhbDogMSBlcnJvcnMsIDAg
d2FybmluZ3MsIDg3IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDIvMzogQVJNOiBib290OiBBZGQgb3B0aW9uIHRvIHNr
aXAgRkRUIG1lbW9yeSBub2RlIHVwZGF0ZS4uLgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFj
dGVycwojNDQ6IEZJTEU6IGh3L2FybS9ib290LmM6NTAwOgorICAgICAgICAgICAgICAgIHFlbXVf
ZmR0X3NldHByb3Bfc3RyaW5nKGZkdCwgIi9tZW1vcnkiLCAiZGV2aWNlX3R5cGUiLCAibWVtb3J5
Iik7Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDQ4IGxpbmVzIGNoZWNrZWQKCllvdXIg
cGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KQ2hlY2tpbmcgUEFUQ0ggMy8zOiBleGVj
OiBBbGxvdyB0byBjaGFuZ2UgQWRkcmVzcyBTcGFjZSBmcm9tIGJvYXJkIGxldmVsLi4uCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMu
b3Jn

