Received: by 10.182.158.201 with SMTP id ww9csp441859obb;
        Tue, 8 Dec 2015 22:19:53 -0800 (PST)
X-Received: by 10.140.98.183 with SMTP id o52mr4705612qge.1.1449641993832;
        Tue, 08 Dec 2015 22:19:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 106si7489545qgk.88.2015.12.08.22.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Dec 2015 22:19:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:34764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6Y6T-0008Oc-EN
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 01:19:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6Y6Q-0008Lh-Vm
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 01:19:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6Y6P-0003P1-Sg
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 01:19:50 -0500
Received: from mail-bl2on0108.outbound.protection.outlook.com
	([65.55.169.108]:21094
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a6Y6L-0003Nx-Bf; Wed, 09 Dec 2015 01:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uPgzGPlOJR737urIxJn/Jm/Wk/z6FpTJuFKoSY6Ow04=;
	b=SeoIDTdyDcJMRLEhWPePXfBX289/2FhmfL0GrSaRbUozg+QnynbHGrBGj7SClkVXy1ukfeLtWs+gtCEvrbRKYt9EdGr2DPBCh7fw82oR0OWSFZ6gTkWdMspKf5iP9TYfcAFLdX4DGlHJrBuZzCV75rcbMZnqyUcnL68aAT/WYZ4=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Wed, 9 Dec 2015 06:19:43 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Wed, 9 Dec 2015 06:19:43 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD controller
Thread-Index: AQHRLll1HRRnDohiT0GC4gj9UCGaxJ69cGeAgARdtiA=
Date: Wed, 9 Dec 2015 06:19:42 +0000
Message-ID: <BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
In-Reply-To: <CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [50.46.154.109]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:1DKZPh0cK0oK/yvYNz5KFQEN2k8oKS7bDJ75WaiaAo+i0uOUpMI3Y1pjE9Lllzo0kk3TSSD0t226fg5Q6R5N1971zCn4eF7omMsixS5CEzxAv7QGqfAZmSAxuEq0QapEOMu21LO8NIBYCvbwy+SswA==;
	24:OHQHmwhHZDLYsqx9CV7UpWx1EFHH9omGiNolo42ABf2CGofW1T/w6up2Dt6qhVS5zg6SWdr1vyaRU412HjFa+wFOQzzNEvP6kERgNdZvRyo=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB2035127A84DAD02038E46B069EE80@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(520078)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 0785459C39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(164054003)(86362001)(50986999)(5004730100002)(74316001)(66066001)(5002640100001)(8990500004)(19580405001)(77096005)(1096002)(10090500001)(189998001)(106356001)(105586002)(92566002)(99286002)(6116002)(10290500002)(1220700001)(3846002)(102836003)(33656002)(106116001)(5003600100002)(86612001)(101416001)(11100500001)(81156007)(40100003)(110136002)(122556002)(5008740100001)(76576001)(2900100001)(76176999)(5005710100001)(10400500002)(93886004)(2950100001)(87936001)(586003)(54356999)(97736004)(1411001)(19580395003)(5001960100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2015 06:19:42.9879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.108
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: raDhU0HswjEw

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBTYXR1cmRheSwgNSBEZWNlbWJlciAyMDE1IDIxOjI2DQo+IElzIHRoaXMg
SVAganVzdCBTREhDST8gV2UgYWxyZWFkeSBtb2RlbCBTREhDSSBpbiBRRU1VLCBzZWUNCj4gaHcv
c2Qvc2RoY2kuYy4gSWYgdGhlcmUgYXJlIFJQaSBzcGVjaWZpYyBmZWF0dXJlcyB0byB0aGUgU0RI
Q0kNCj4gaW1wbGVtZW50YXRpb24gdGhleSBzaG91bGQgYmUgYWRkZWQgYXMgb3B0aW9uYWwgZXh0
ZW5zaW9ucyAocHJvYmFiYWJseQ0KPiB2aWEgc3ViY2xhc3NpbmcpIHRvIHRoZSBleGlzdGluZyBT
REhDSSBtb2RlbC4NCg0KU28geWVzLCBpdCB0dXJucyBvdXQgdGhpcyBpcyBmYWlybHkgc2ltaWxh
ciB0byBTREhDSSAoLT4gbG90cyBvZiB3YXN0ZWQgd29yayBieSBHcmVnb3J5IGFuZCBtZSwgc2ln
aCksIGFuZCBpbmRlZWQgTGludXggYm9vdHMgd2l0aCB0aGUgZXhpc3Rpbmcgc2RoY2kgZW11bGF0
aW9uLiBIb3dldmVyLCB0aGVyZSBhcmUgc29tZSBxdWlya3MsIGFuZCBVRUZJL1dpbmRvd3MgZGVw
ZW5kIG9uIHRoZW0uIE5hbWVseToNCiAqIFRoZSBob3N0IGNvbnRyb2wgcmVnaXN0ZXJzIChvZmZz
ZXQgMHgyOCBhbmQgYWJvdmUpIHNlZW0gdG8gZGlmZmVyIHNpZ25pZmljYW50bHkuIE1heWJlIHRo
aXMgaXMgZHVlIHRvIHRoZSBTREhDIHZlcnNpb24gLS0gYWNjb3JkaW5nIHRvIHRoZSBCQ00yODM1
IHBlcmlwaGVyYWxzIHNwZWMsIHRoZSBjb250cm9sbGVyIGltcGxlbWVudHMgIlZlcnNpb24gMy4w
IERyYWZ0IDEuMCIgb2YgdGhlIFNESEMgc3BlYywgYnV0IG9mIGNvdXJzZSBJIGNhbid0IGZpbmQg
dGhhdCBzcGVjIG9ubGluZSBhbnl3aGVyZS4gTHVja2lseSBub3RoaW5nIHNlZW1zIHRvIGRlcGVu
ZCBvbiB0aGlzLCBiZXNpZGVzIGEgZmV3IHNwdXJpb3VzIHdhcm5pbmdzIGFib3V0IGludmFsaWQg
d3JpdGVzLg0KICogUG93ZXIgaXMgYXNzdW1lZCB0byBiZSBhbHdheXMgb24gLS0gdGhlIHNkaGNp
IG1vZGVsIHJlcXVpcmVzIHRoZSBndWVzdCB0byB0dXJuIGl0IG9uIGJ5IGEgd3JpdGUgYXQgb2Zm
c2V0IDB4MjkgYmVmb3JlIGlzc3VpbmcgYW55IGNvbW1hbmRzLCBidXQgb24gcGkgdGhpcyBiaXQg
aXMgbWFya2VkIHJlc2VydmVkLCBhbmQgY29tbWFuZHMgYXJlIGlzc3VlZCBpbW1lZGlhdGVseSBh
ZnRlciByZXNldC4NCiAqIFRoZSBjYXJkIGluc2VydGVkIGludGVycnVwdCBpcyByYXRoZXIgYnJv
a2VuIG9uIHBpOiBpdCBpcyBzZXQgYXQgdGhlIHN0YXJ0IG9mIGRheSwgYnV0IGEgcmVzZXQgY29t
bWFuZCBjbGVhcnMgaXQgYW5kIGl0IHN0YXlzIGNsZWFyIHRoZXJlYWZ0ZXIgKGFuZCBuZXZlciBn
ZW5lcmF0ZXMgaW50ZXJydXB0cykuDQoNClRoZXJlJ3MgYW4gaW5jb25zaXN0ZW5jeSB3aXRoIHJl
c3BvbnNlIGhhbmRsaW5nLCB0b28sIGFsdGhvdWdoIEknbSBub3Qgc3VyZSBpZiBpdCdzIGEgcXVp
cmsgb2YgdGhlIFBpIG9yIGEgZ2VuZXJhbCBidWcgaW4gc2RoY2kuIFBpIFVFRkkgc2VuZHMgYSBD
TUQyMyB3aXRob3V0IHNldHRpbmcgYW55IG9mIHRoZSByZXNwb25zZSBiaXRzLCBidXQgdGhpcyBj
b21tYW5kIGRvZXMgaW4gZmFjdCBnZW5lcmF0ZSBhIDQtYnl0ZSBSMSByZXNwb25zZS4gVGhlIHF1
ZXN0aW9uIGlzIHdoZXRoZXIgdGhpcyBzaG91bGQgYmUgdHJlYXRlZCBhcyBhbiBlcnJvciwgb3Ig
d2hldGhlciBpdCBzaW1wbHkgbWVhbnMgdGhhdCB0aGUgaG9zdCB3YW50cyB0byBpZ25vcmUgdGhl
IHJlc3BvbnNlLiBJbiBzZGhjaSwgdGhlIGZvbGxvd2luZyBjb2RlIHBhdGggKGFyb3VuZCBsaW5l
IDI0NikgcmFpc2VzIGEgImNvbW1hbmQgaW5kZXgiIGVycm9yIGluIHRoZSBjYXNlIHRoYXQgYSBu
b24temVybyByZXNwb25zZSBpcyByZXR1cm5lZCBidXQgbm8gcmVzcG9uc2UgYml0cyB3ZXJlIHNl
dCBpbiB0aGUgY29tbWFuZCByZWdpc3RlcjoNCg0KICAgIH0gZWxzZSBpZiAocmxlbiAhPSAwICYm
IChzLT5lcnJpbnRzdHNlbiAmIFNESENfRUlTRU5fQ01ESURYKSkgew0KICAgICAgICBzLT5lcnJp
bnRzdHMgfD0gU0RIQ19FSVNfQ01ESURYOw0KICAgICAgICBzLT5ub3JpbnRzdHMgfD0gU0RIQ19O
SVNfRVJSOw0KICAgIH0NCg0KSSBkbyBub3Qgb2JzZXJ2ZSB0aGlzIGJlaGF2aW91ciBvbiB0aGUg
cmVhbCBQaTIgKGFuZCBpdCBicmVha3MgVUVGSSkuIFRoZSBoYXJkd2FyZSBzZW1hbnRpY3MgYXBw
ZWFyIHRvIGJlICJpZiB0aGUgY29tbWFuZCBnZW5lcmF0ZXMgYSByZXNwb25zZSwgYnV0IHlvdSBk
aWRuJ3Qgd2FudCB0byBzZWUgaXQsIHdlJ2xsIHN1Y2Nlc3NmdWxseSBjb21wbGV0ZSB0aGUgY29t
bWFuZCBhbmQgaWdub3JlIHRoZSByZXNwb25zZSIsIHdoZXJlYXMgdGhlIHNkaGNpIGltcGxlbWVu
dGF0aW9uIHJhaXNlcyBhbiBlcnJvciBmb3IgdGhpcyBhcyB3ZWxsIGFzIHNpZ25hbGxpbmcgY29t
cGxldGlvbi4gSSBoYXZlIHJlYWQgdGhlICJTRCBTcGVjaWZpY2F0aW9ucyBQYXJ0IEEyIFNEIEhv
c3QgQ29udHJvbGxlciBTaW1wbGlmaWVkIFNwZWNpZmljYXRpb24gVmVyc2lvbiAyLjAwIiwgYnV0
IGRpZCBub3QgZmluZCBhbnl0aGluZyBkZXNjcmliaW5nIHRoaXMgY2FzZSwgc28gaXQgY291bGQg
YmUgdGhhdCB0aGlzIGlzIG9wZW4gdG8gaW50ZXJwcmV0YXRpb24uIChJdCBjb3VsZCBhbHNvIGJl
IHNwZWNpZmllZCBpbiBTREhDIHYzLikgVGhlIHNwZWNpZmljIGVycm9yIGFsc28gc2VlbXMgb2Rk
IC0tIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBhICJjb21tYW5kIGluZGV4IiBlcnJvciBtZWFu
cyB0aGF0IHRoZSBpbmRleCBpbiB0aGUgcmVzcG9uc2UgZGlkbid0IG1hdGNoIHRoZSBpbmRleCBv
ZiB0aGUgaXNzdWVkIGNvbW1hbmQsIGJ1dCB0aGF0J3MgaGFyZGx5IHdoYXQgaXMgaGFwcGVuaW5n
IGhlcmUuDQoNCkFzc3VtaW5nIHRoaXMgbGF0dGVyIGJ1ZyBjYW4gYmUgZml4ZWQgZ2VuZXJpY2Fs
bHksIGhvdyBkbyB5b3UgcHJvcG9zZSBoYW5kbGluZyB0aGUgUGkgcXVpcmtzPyBJIGNvdWxkIGFk
ZCBhIGJvb2wgcHJvcGVydHkgZm9yICJiY20yODM1LXF1aXJrcyIgb3Igc2ltaWxhciBhbmQganVz
dCBzcGVjaWFsLWNhc2UgdGhlIHJlbGV2YW50IGNvZGUgKG15IHByZWZlcnJlZCBhcHByb2FjaCku
IEknbSBhbHNvIG9wZW4gdG8gc3ViY2xhc3NpbmcsIGJ1dCBubyBpZGVhIGhvdyB0aGF0IHdvdWxk
IHdvcmsgaW4gcHJhY3RpY2UsIHNvIHdvdWxkIG5lZWQgc29tZSBwb2ludGVycy4NCg0KVGhhbmtz
LA0KQW5kcmV3DQo=
