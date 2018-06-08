Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp774852wrq;
        Fri, 8 Jun 2018 04:46:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLeKRlS4WuLhy7q0UXKPEk16IPCTropULmrN0RJC/QICeQrHknvNwnLZtHJlCD2WatH+JqG
X-Received: by 2002:a37:997:: with SMTP id 145-v6mr5155689qkj.366.1528458404277;
        Fri, 08 Jun 2018 04:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528458404; cv=none;
        d=google.com; s=arc-20160816;
        b=K+X5GE8fFbjGfWuaRsDv1Z+oiZKWOiZsuRlDxI6V8BPa1Zz+jcA4a+SkOGhExfHmLu
         PEU6ggztDd2yYayxHn9NT5i7+Vr+qj2WGgpda88BeNFWP9mai7qbRdcVAl+EVJXfRAsx
         VxCm7lNjazYuIXBRo6KPQRUcbAUEhS3EKH0lrKRyUEpFv7H5CPrfnBxdGgSlLUIKOyiT
         bcCVo2q2YFKtHM+VVD41TV21x2RNQuiuYg4RiCV0q0dOt7E9wVkVMmdmY/7+nkGVhsRK
         00T5Kbm7tj2HOyvd2LR2ZryuhddGF09E35AtSXIPb9v7DmL4l2AGuhK6X8aO+l/o+we2
         usAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=OxbFw/iv/9W8FlPVjsudF1MVjm+6Q38cMyu680LHGyo=;
        b=XYMuc3BVqljNIXCTtdSGq3Fz1QLEVfCQpCEsqqIaEhwYc1tGy+TRjp3KPmUpQ+3qr8
         ZvyJ4zrebseBIKsy9QxpAQyGkc4HY5Xh/RsV7CUnEs3hs025wqI4OB/+Ds0H6ykMNAWw
         He5O0x95OqPcnybGs2GusFX3YugO9zCT0Oih32EqSXRp1KF7Xc8rtlii4hGK5fvM7TaW
         QIPbmo32IHWOX474WHi1UahnIKUG9JnbV7RQ8uKxcj/v5BN2hGr1U+dVY7tDzUWGdKp5
         0BVEyomu72UP8BHi5Y6wnFR/4ID3T+e7Idqq0hotY1nkR7Dcei+OxUf2Z6jc2gEG2FPx
         xRTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z54-v6si707101qtb.193.2018.06.08.04.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFqt-00016R-Rc
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fRFqh-00014Q-U8
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:46:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fRFqf-00036A-Lt
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:46:31 -0400
Resent-Date: Fri, 08 Jun 2018 07:46:31 -0400
Resent-Message-Id: <E1fRFqf-00036A-Lt@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fRFqf-00035l-GS
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:46:29 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 152845745050098.86865693280197;
	Fri, 8 Jun 2018 04:30:50 -0700 (PDT)
In-Reply-To: <20180608112001.14729-1-kraxel@redhat.com>
Message-ID: <152845744972.456.1789810180257987315@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Fri, 8 Jun 2018 04:30:50 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/6] ramfb: simple boot
 framebuffer, no legacy vga
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
Cc: peter.maydell@linaro.org, famz@redhat.com, ehabkost@redhat.com,
	mst@redhat.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	kraxel@redhat.com, pbonzini@redhat.com, lersek@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3dS+5F3aPsS

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNjA4MTEyMDAxLjE0NzI5LTEta3JheGVsQHJlZGhhdC5jb20KU3ViamVj
dDogW1FlbXUtZGV2ZWxdIFtQQVRDSCB2MyAwLzZdIHJhbWZiOiBzaW1wbGUgYm9vdCBmcmFtZWJ1
ZmZlciwgbm8gbGVnYWN5IHZnYQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFz
aAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAt
bCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFs
Z29yaXRobSBoaXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVy
c2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFU
Q0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAh
IGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1t
YWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAg
bj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVw
ZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICAgYTY3NGRhMGFiNy4uYmFjNWJh
M2RjNSAgbWFzdGVyICAgICAtPiBtYXN0ZXIKICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0
Y2hldy8yMDE4MDYwODExMjAwMS4xNDcyOS0xLWtyYXhlbEByZWRoYXQuY29tIC0+IHBhdGNoZXcv
MjAxODA2MDgxMTIwMDEuMTQ3MjktMS1rcmF4ZWxAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCmIzYjc2OGJkY2YgYm9jaHMtZGlzcGxheTogZW5hYmxlIHZnYWJpb3MK
YmUwOGVkMTRiZSByYW1mYjogZW5hYmxlIHZnYWJpb3MKZjJmMjA2OTYyNSBody92ZmlvL2Rpc3Bs
YXk6IGFkZCByYW1mYiBzdXBwb3J0CjcxN2VkYjJmNGQgaHcvZGlzcGxheTogYWRkIHZpcnRpby1y
YW1mYiBkZXZpY2UKY2ZiODdjOWIzYiBody9kaXNwbGF5OiBhZGQgc3RhbmRhbG9uZSByYW1mYiBk
ZXZpY2UKYWRkMzljZTUxOCBody9kaXNwbGF5OiBhZGQgcmFtZmIsIGEgc2ltcGxlIGJvb3QgZnJh
bWVidWZmZXIgbGl2aW5nIGluIGd1ZXN0IHJhbQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tp
bmcgUEFUQ0ggMS82OiBody9kaXNwbGF5OiBhZGQgcmFtZmIsIGEgc2ltcGxlIGJvb3QgZnJhbWVi
dWZmZXIgbGl2aW5nIGluIGd1ZXN0IHJhbS4uLgpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVs
ZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiM0MTogCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDEwOSBsaW5lcyBj
aGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElm
IGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0
aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCkNoZWNraW5nIFBB
VENIIDIvNjogaHcvZGlzcGxheTogYWRkIHN0YW5kYWxvbmUgcmFtZmIgZGV2aWNlLi4uCldBUk5J
Tkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVl
ZCB1cGRhdGluZz8KIzcxOiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCnRvdGFsOiAwIGVycm9ycywg
MSB3YXJuaW5ncywgMTQxIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2Js
ZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9z
aXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBN
QUlOVEFJTkVSUy4KQ2hlY2tpbmcgUEFUQ0ggMy82OiBody9kaXNwbGF5OiBhZGQgdmlydGlvLXJh
bWZiIGRldmljZS4uLgpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBk
b2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMzMjogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDE1NyBsaW5lcyBjaGVja2VkCgpZb3VyIHBh
dGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCkNoZWNraW5nIFBBVENIIDQvNjogaHcvdmZp
by9kaXNwbGF5OiBhZGQgcmFtZmIgc3VwcG9ydC4uLgpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNl
c3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiMzMTogRklMRTogaHcvdmZpby9k
aXNwbGF5LmM6MTg3OgorICAgIGlmIChzdHJjbXAob2JqZWN0X2dldF90eXBlbmFtZShPQkpFQ1Qo
dmRldikpLCAidmZpby1wY2ktcmFtZmIiKSA9PSAwKQpbLi4uXQoKRVJST1I6IGJyYWNlcyB7fSBh
cmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojNTA6IEZJTEU6IGh3
L3ZmaW8vZGlzcGxheS5jOjMxMToKKyAgICBpZiAoc3RyY21wKG9iamVjdF9nZXRfdHlwZW5hbWUo
T0JKRUNUKHZkZXYpKSwgInZmaW8tcGNpLXJhbWZiIikgPT0gMCkKWy4uLl0KCnRvdGFsOiAyIGVy
cm9ycywgMCB3YXJuaW5ncywgNzIgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggNS82OiByYW1mYjogZW5hYmxlIHZnYWJp
b3MuLi4KQ2hlY2tpbmcgUEFUQ0ggNi82OiBib2Nocy1kaXNwbGF5OiBlbmFibGUgdmdhYmlvcy4u
Lgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoK
LS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRj
aGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVk
aGF0LmNvbQ==

