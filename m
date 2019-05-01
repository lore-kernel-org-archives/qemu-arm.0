Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6012209wrh;
        Wed, 1 May 2019 08:33:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6r5bvkLespduKkfuOw0F9C9Of6fmlARTZ088Wt78MDg7r7DrGASx8d3HDCCbyJpxnG5rU
X-Received: by 2002:a1c:3982:: with SMTP id g124mr7083819wma.25.1556724809456;
        Wed, 01 May 2019 08:33:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si1273756wrp.163.2019.05.01.08.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 May 2019 08:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLrEe-00086z-KH
	for alex.bennee@linaro.org; Wed, 01 May 2019 11:33:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLrEU-00086r-Fs
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLrER-0005HF-Bk
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:33:18 -0400
Resent-Date: Wed, 01 May 2019 11:33:18 -0400
Resent-Message-Id: <E1hLrER-0005HF-Bk@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLrER-0005GX-4G; Wed, 01 May 2019 11:33:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556724765; cv=none; d=zoho.com; s=zohoarc; 
	b=MtBjCmJuO9Lfhhc/tstR/uWiNQxLsLnYHZGVaLS8WsdqT8O5zZ2sciz1dkkdqoEocRTBnM1HCbSNK8zPRsS2GFOy5Yt9SQrUle3RwoIcQCAi8phNKpvmPro6jif+Xq/D8uwsBJn7jctmIQAqkVjjLeCrfc5dqxe45Nzs/BIqqjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556724765;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=OLhC+QuWVMlgwaxlCWWWTdTXAQv4mSAsd0fSKbWPVOg=; 
	b=dpfl3dnD63Wch5L0QOW29BXNESMHUduyGp5GcHwFvfNXNBJqVNhdXhg5hH8mErvHXRxl7pZ0vUvm+ZVUiCVK1UkT1+eyPh8VPYgwt7etwVq71t8kFm1EhxRoBID+RXWs+XBecUmlQHdIZOdAgQ0kvbSN/NBUTYlXBv7qLPOGnbs=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556724763128125.1298121105333;
	Wed, 1 May 2019 08:32:43 -0700 (PDT)
In-Reply-To: <20190501061827.23080-1-joel@jms.id.au>
Message-ID: <155672476199.10667.7459126449510053365@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: joel@jms.id.au
Date: Wed, 1 May 2019 08:32:43 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: aspeed: Set SDRAM size
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
Cc: fam@euphon.net, peter.maydell@linaro.org, andrew@aj.id.au,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YDyQFF5Kdsn1

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUwMTA2MTgyNy4yMzA4
MC0xLWpvZWxAam1zLmlkLmF1LwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxOTA1MDEwNjE4MjcuMjMwODAtMS1q
b2VsQGptcy5pZC5hdQpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIXSBhcm06IGFzcGVlZDog
U2V0IFNEUkFNIHNpemUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0
IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRh
dGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6
Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiB0IFt0YWcgdXBkYXRlXSAgICAgICAg
ICAgIHBhdGNoZXcvMjAxOTA1MDEwNjE4MjcuMjMwODAtMS1qb2VsQGptcy5pZC5hdSAtPiBwYXRj
aGV3LzIwMTkwNTAxMDYxODI3LjIzMDgwLTEtam9lbEBqbXMuaWQuYXUKU3dpdGNoZWQgdG8gYSBu
ZXcgYnJhbmNoICd0ZXN0JwplNWJjYzFlZjU1IGFybTogYXNwZWVkOiBTZXQgU0RSQU0gc2l6ZQoK
PT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBh
bGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojMjY6IEZJTEU6IGh3L2FybS9hc3BlZWQuYzozMzQ6
CisgICAgaWYgKGJvYXJkLT5yYW0pClsuLi5dCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3Ms
IDQzIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBlNWJjYzFlZjU1MWUgKGFybTogYXNwZWVkOiBTZXQg
U0RSQU0gc2l6ZSkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA1MDEwNjE4MjcuMjMwODAtMS1q
b2VsQGptcy5pZC5hdS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

