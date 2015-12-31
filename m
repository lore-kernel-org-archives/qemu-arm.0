Received: by 10.182.158.201 with SMTP id ww9csp8667912obb;
        Thu, 31 Dec 2015 10:06:53 -0800 (PST)
X-Received: by 10.140.137.199 with SMTP id 190mr97804901qhj.91.1451585213037;
        Thu, 31 Dec 2015 10:06:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si2627110qgn.37.2015.12.31.10.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 10:06:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:56453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEhci-0004mK-Jr
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 13:06:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEhcg-0004lJ-LR
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 13:06:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEhcf-0007Bo-Pq
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 13:06:50 -0500
Received: from mail-by2on0111.outbound.protection.outlook.com
	([207.46.100.111]:34720
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEhcb-0007BR-4Z; Thu, 31 Dec 2015 13:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UQbHG8G0siJgKA7JnlPSabMpHjKO/rcmLOiM/Bsnpr4=;
	b=W2UgcQblNNxBvPyuizWJpOB0MUHen53VfsvxrSUv3Ov9ICHikwNqPFwVWzXmnSYOej68w1oCaGUiDzcduAet4cgm72FfGJrb+XZqhnOY5DM4MnUGvojr5otCEKngVKBctBCry2wY5Mbe/TmQsg6E1Sku6DCaZSN2hzB3iKo4xgA=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 31 Dec 2015 18:06:42 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Thu, 31 Dec 2015 18:06:42 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v2 1/7] bcm2835_mbox: add BCM2835 mailboxes
Thread-Index: AQHRPeGjW0Qi16J6sE6/ekH+J384lJ7kRDiAgAEpRuA=
Date: Thu, 31 Dec 2015 18:06:42 +0000
Message-ID: <BLUPR0301MB20347A3B91AAC3BB799CAC329EFE0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-2-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=q+G=MsgZG0J-H_72VFjPiSbt91ViDd4S-mi_3CLCi_WA@mail.gmail.com>
In-Reply-To: <CAPokK=q+G=MsgZG0J-H_72VFjPiSbt91ViDd4S-mi_3CLCi_WA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:5::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:uW4UtcnhReIQfDsX33bUdRKmXqpeB5l2NvotGBlRf94oYV2Wu7d0JUt8Ky5yZXuvVs2fgUq2Vkt1wgsTB00RzusNJdpk+unWy2YUHzxVkr30cmz8g6XF1nLAOt4GRz9LHf3zybXF2FOvf51mfBaCHQ==;
	24:FFvDmCuIzYhr9e6uu0rYBBf9gsmITLJaij+X/8kyHEIFYxr5Ev3Qd1q1N0TdLcbHci287AXCQWgcbs7wXWfk+/1j3Xm0L0PtX9CkVPq28tE=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB2033FF56C060A365B73D39AE9EFE0@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 08076ABC99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(377454003)(24454002)(106116001)(99286002)(106356001)(5004730100002)(2900100001)(86362001)(33656002)(76576001)(54356999)(105586002)(2950100001)(1411001)(10090500001)(77096005)(101416001)(6116002)(74316001)(11100500001)(92566002)(1220700001)(5003600100002)(5002640100001)(97736004)(40100003)(50986999)(81156007)(1096002)(102836003)(8990500004)(19580405001)(87936001)(10400500002)(5005710100001)(122556002)(110136002)(86612001)(19580395003)(189998001)(5001960100002)(4326007)(5008740100001)(76176999)(586003)(10290500002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2015 18:06:42.5336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.111
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/7] bcm2835_mbox: add BCM2835 mailboxes
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
X-TUID: zNmOIXKUvsga

SGkgUGV0ZXIsDQoNCj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0
ZXBldGVyQGdtYWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCAzMCBEZWNlbWJlciAyMDE1IDE2
OjEzDQo+IE9uIFdlZCwgRGVjIDIzLCAyMDE1IGF0IDQ6MjUgUE0sIEFuZHJldyBCYXVtYW5uDQo+
IDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPiBUaGlzIGFkZHMgdGhl
IHN5c3RlbSBtYWlsYm94ZXMgd2hpY2ggYXJlIHVzZWQgdG8gY29tbXVuaWNhdGUgd2l0aCBhDQo+
ID4gbnVtYmVyIG9mIEdQVSBwZXJpcGhlcmFscyBvbiBQaS9QaTIuDQpbLi4uXQ0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9ody9taXNjL2JjbTI4MzVfbWJveC5jDQo+ID4gQEAgLTAsMCAr
MSwzMjMgQEANCj4gPiArLyoNCj4gPiArICogUmFzcGJlcnJ5IFBpIGVtdWxhdGlvbiAoYykgMjAx
MiBHcmVnb3J5IEVzdHJhZGUNCj4gDQo+IFNob3VsZCB3ZSBjaGFuZ2UgdGhpcyB0byAiQnJvYWRj
b20gU29DIGVtdWxhdGlvbiI/DQoNClVudGlsIHdlIHN1cHBvcnQgbW9yZSB0aGFuIG9uZSBCcm9h
ZGNvbSBTb0MsIHByb2JhYmx5IG5vdCAtLSB0aGlzIGlzIGFsbCBiYXNlZCBvbiB0aGUgUGkgZG9j
dW1lbnRhdGlvbiwgYW5kIEkgaGF2ZSBubyBpZGVhIGhvdyBtdWNoIGNvbW1vbmFsaXR5IHRoZXJl
IGlzIHRvIG90aGVyIHBhcnRzLg0KDQpbLi4uXQ0KPiA+ICtzdGF0aWMgdm9pZCBtYm94X3B1c2go
QkNNMjgzNU1ib3ggKm1iLCB1aW50MzJfdCB2YWwpDQo+ID4gK3sNCj4gPiArICAgIGFzc2VydCht
Yi0+Y291bnQgPCBNQk9YX1NJWkUpOw0KPiANCj4gbWJveF91cGRhdGUgY2FuIGNhbGwgbWJveF9w
dXNoIHdpdGggdmFsID09IGEgRE1BIHZhbHVlLCB3aGljaCB1c3VhbGx5DQo+IHN1Z2dlc3RzIHRo
YXQgdGhpcyBtYXkgYmUgYSBndWVzdCBjb250cm9sbGFibGUgKGFuZCBhIGd1ZXN0IGVycm9yDQo+
IHJhdGhlciB0aGFuIGFuIGFzc2VydCkuIElzIHRoZSBtYm94IEFTIGd1ZXN0IGFjY2Vzc2libGU/
IChJIGhhZCBhIGxvb2sNCj4gYXQgdGhlIGxhdGVyIHBhdGNoZXMsIGFuZCB0aGUgTUJveCBBUyBz
ZWVtcyBwcml2YXRlIGJ1dCBjYW4gdmFsdWVzIGJlDQo+IHNldCB2aWEgdGhlIGd1ZXN0IGluZGly
ZWN0bHk/KS4NCg0KVGhlc2UgY29tZSBmcm9tIGNoaWxkIGRldmljZXMgKGJjbTI4MzVfcHJvcGVy
dHkgaW4gdGhlIHByZXNlbnQgc2VyaWVzKS4gVGhlIG90aGVyIGNhc2Ugd2hlcmUgdGhpcyBhcmlz
ZXMgaXMgYSBwdXNoIGluIG1ib3ggMSwgYnV0IHRoYXQgaXMgYWxyZWFkeSBjaGVja2VkIGluIGJj
bTI4MzVfbWJveF93cml0ZSwgc28gSSB0aGluayBhbiBhc3NlcnQgaXMgYXBwcm9wcmlhdGUuDQoN
ClsuLi5dDQo+ID4gK3N0YXRpYyB2b2lkIGJjbTI4MzVfbWJveF9zZXRfaXJxKHZvaWQgKm9wYXF1
ZSwgaW50IGlycSwgaW50IGxldmVsKQ0KPiA+ICt7DQo+ID4gKyAgICBCQ00yODM1TWJveFN0YXRl
ICpzID0gb3BhcXVlOw0KPiA+ICsNCj4gPiArICAgIHMtPmF2YWlsYWJsZVtpcnFdID0gbGV2ZWw7
DQo+ID4gKw0KPiA+ICsgICAgLyogYXZvaWQgcmVjdXJzaXZlbHkgY2FsbGluZyBiY20yODM1X21i
b3hfdXBkYXRlIHdoZW4gdGhlIGludGVycnVwdA0KPiA+ICsgICAgICogc3RhdHVzIGNoYW5nZXMg
ZHVlIHRvIHRoZSBsZGxfcGh5cyBjYWxsIHdpdGhpbiB0aGF0IGZ1bmN0aW9uICovDQo+IA0KPiBT
cGFjZSBiZWZvcmUgKi8NCg0KSHVoPyBZb3UgbWVhbiBuZXdsaW5lPyAoVGhlcmUncyBhbHJlYWR5
IGEgc3BhY2UuKQ0KDQpBbmRyZXcNCg==
