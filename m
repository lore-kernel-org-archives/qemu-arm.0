Received: by 10.182.158.201 with SMTP id ww9csp62574obb;
        Wed, 9 Dec 2015 13:38:26 -0800 (PST)
X-Received: by 10.55.77.203 with SMTP id a194mr10655453qkb.85.1449697106620;
        Wed, 09 Dec 2015 13:38:26 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x66si10920200qka.82.2015.12.09.13.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 13:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6mRO-0002Xj-AR
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 16:38:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6mQu-00026f-De
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 16:37:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6mQp-00056F-Et
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 16:37:56 -0500
Received: from mail-bn1on0112.outbound.protection.outlook.com
	([157.56.110.112]:33562
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a6mQp-00055z-90; Wed, 09 Dec 2015 16:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ofFxBPCHjt9dGI2dav4vo5mom2bAJa25gwsW7mtZH60=;
	b=SN9ruJTnnpyZlYKL1jk0XofoBw54jxIZfypPdzp2MBipGXKMbwC8xf2nFASqy4C4caQaVrF91u2O15a1xfRsorevCFH2PapkAHkHlcKxnnCKPs3v0mtUv3Nzl+cnSaRnxqo61Rv70jKNaEXD/wEcU1lLF3Sh7J9i6F8Pa4cMd5A=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Wed, 9 Dec 2015 21:37:49 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Wed, 9 Dec 2015 21:37:49 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD controller
Thread-Index: AQHRLll1HRRnDohiT0GC4gj9UCGaxJ69cGeAgARdtiCAAH7lAIAAnAgggAAgXgCAACNjgIAACUyw
Date: Wed, 9 Dec 2015 21:37:49 +0000
Message-ID: <BLUPR0301MB203459BE30BF401008BF6BEB9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
	<BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
	<CAFEAcA-=97eWfJ+gfxU+AjKb6h1dNgvam+BgD6VLXKd4+hs2LQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-=97eWfJ+gfxU+AjKb6h1dNgvam+BgD6VLXKd4+hs2LQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:e::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:0R9QUvgjM3P8A5O8y5t2SgtDLOxXVdkoooMGdvVkgxH5Cz2nvY7UaUlwEyi7JlZ02PLnlp23O0IK36tThG4uWU9UVBXTQMjxeLzQnqrIv3rhsVC4XFGXf8VRgT1s9QJeTczILTwf3mfS+LMWrcJYSw==;
	24:4qN/3z9nulzijF/95S5yO76NlvDI8+KeNqvn4MNgvxN/L495rQco3bm47j5Y4cRzmUbOobGlIq7Tqdt9LZ+VfR10uwWcLfCd1lACjAUFNWs=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB203440B35E62F199B9AAF25D9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0785459C39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(199003)(377454003)(189002)(189998001)(93886004)(19580395003)(77096005)(101416001)(11100500001)(5002640100001)(6116002)(76576001)(33656002)(2900100001)(5008740100001)(19580405001)(5003600100002)(586003)(122556002)(86612001)(40100003)(5005710100001)(105586002)(5004730100002)(1096002)(50986999)(102836003)(86362001)(87936001)(2950100001)(10400500002)(106116001)(99286002)(97736004)(5001770100001)(106356001)(92566002)(81156007)(8990500004)(10290500002)(1220700001)(74316001)(76176999)(10090500001)(54356999)(5001960100002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2015 21:37:49.4336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.112
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Stefan Weil <sw@weilnetz.de>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Kevin OConnor <kevin@koconnor.net>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yQhU4Ad0X6D4

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBXZWRuZXNkYXksIDkgRGVjZW1iZXIgMjAxNSAxMzowMQ0KPiBPbiA5IERlY2VtYmVy
IDIwMTUgYXQgMTg6NTQsIFBldGVyIENyb3N0aHdhaXRlDQo+IDxjcm9zdGh3YWl0ZXBldGVyQGdt
YWlsLmNvbT4gd3JvdGU6DQo+ID4gT24gV2VkLCBEZWMgOSwgMjAxNSBhdCAxMDoxNyBBTSwgQW5k
cmV3IEJhdW1hbm4NCj4gPiA8QW5kcmV3LkJhdW1hbm5AbWljcm9zb2Z0LmNvbT4gd3JvdGU6DQo+
ID4+PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21h
aWwuY29tXQ0KPiA+Pj4gSXMgdGhhdCBtb3JlIGxpa2VseSB0byBiZSBhbiBJUCBjb25uZWN0aXZp
dHkgcHJvYmxlbSAod2llcmQgaW5wdXQgdG8NCj4gPj4+IHRoZSBjYXJkLWRldGVjdCBwaW4gaW4g
dGhlIFNvQyk/DQo+ID4+DQo+ID4+IFRoYXQgbWlnaHQgYmUgaXQsIGJ1dCBpbiBhbnkgY2FzZSBJ
IHN0aWxsIG5lZWQgdG8gbW9kZWwgaXQgc29tZWhvdy4NCj4gPj4NCj4gPg0KPiA+IElkZWFsbHks
IHRoaXMgd291bGQgYmUgbWFuYWdlZCBvbiB0aGUgYm9hcmQgbGV2ZWwgYnV0IGl0IGlzIGtpbmRh
IGhhcmQNCj4gPiB0aGUgd2F5IHRvIGNvZGUgaXMgb3JnYW5pc2VkLiBDdXJyZW50bHkgU0RIQ0kg
aXMgbWFuYWdpbmcgdGhlIFNEIGNhcmQNCj4gPiBpbnN0YW50aWF0aW9uIGR1ZSB0byBhIGxhY2sg
b2YgUU9NaWZpY2F0aW9uLiBTbyBmb3IgdGhlIG1vbWVudCwgdGhpcw0KPiA+IHdvdWxkIGJlIHZh
bGlkIGFzIGEgYm9vbGVhbiBwcm9wZXJ0eSB3aGljaCBkaXNhYmxlcyB0aGUgY2FyZCBkZXRlY3QN
Cj4gPiBsb2dpYyBjb21wbGV0ZWx5LiBJZiB3ZSBnZXQgdGhlIFNEIFFPTWlmaWNhdGlvbiB0aG91
Z2gsIHRoZSBwb3dlciwNCj4gPiBjYXJkIGRldGVjdCBhbmQgc2QgaW50ZXJmYWNlIHByb3BlciBj
YW4gdGhlbiBiZSBtb3JlIGZpbmVseSBtYW5hZ2VkIG9uDQo+ID4gdGhlIGJvYXJkIGxldmVsIGZv
ciBhbGwgdGhlc2UgdmFyeWluZyBjb25uZWN0aXZpdHkgY29uZmlndXJhdGlvbnMuDQo+IA0KPiBD
YXJkIGRldGVjdCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIG9uIHRoZSBib2FyZCBsZXZl
bCB3aXRob3V0DQo+IHdhaXRpbmcgZm9yIFFPTWlmaWNhdGlvbiAtLSBpdCdzIGp1c3QgbW9kZWxs
ZWQgYXMgYSBRRU1VIGlycSBsaW5lDQo+ICh0aGUgdmV4cHJlc3MgYm9hcmQgY29ubmVjdHMgaXQg
dXAgdG8gYSByYW5kb20gcmVnaXN0ZXIsIG9yIHlvdSBjb3VsZA0KPiBub3QgY29ubmVjdCBpdCB0
byBhbnl0aGluZywgZXRjKS4NCg0KRm9yZ2l2ZSBtZSBpZiBJJ20gc2xvdywgYnV0IEkgZG9u4oCZ
dCBzZWUgaG93IHRoYXQgY291bGQgd29yayBmb3Igc2RoY2kuDQoNClZleHByZXNzIHVzZXMgcGwx
ODEsIHdoaWNoIGhhcyBHUElPIF9vdXRwdXRzXyBmb3IgY2FyZCBpbnNlcnRlZCBldGMuIHNkaGNp
IG11bHRpcGxleGVzIHRoZSBjYXJkIGluc2VydGVkIGludGVycnVwdCAod2hpY2ggb3JpZ2luYXRl
cyBpbiBzZC5jKSBhbG9uZyB3aXRoIG90aGVyIFNEIGV2ZW50cyBsaWtlIGNvbW1hbmQgY29tcGxl
dGlvbiBpbnRvIGEgc2luZ2xlIGludGVycnVwdCBsaW5lLg0KDQpJZiB0aGVyZSB3YXMgYSB3YXkg
dG8gaW50ZXJwb3NlIG9uIHRoZSBpcnEgYmV0d2VlbiBzZCBhbmQgc2RoY2ksIEkgdGhpbmsgSSBj
b3VsZCBkbyB3aGF0IEkgd2FudCwgYnV0IHJpZ2h0IG5vdyB0aGV5IGFyZSBhbGxvY2F0ZWQgYW5k
IHdpcmVkIHVwIGluIHNkaGNpJ3MgaW5pdCByb3V0aW5lLg0KDQpBbmRyZXcNCg==
