Received: by 10.25.208.211 with SMTP id h202csp2408242lfg;
        Wed, 24 Feb 2016 10:51:47 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr51018294qka.96.1456339907007;
        Wed, 24 Feb 2016 10:51:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r131si3977960qhb.111.2016.02.24.10.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 10:51:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYeXJ-0007Yt-Bf
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 13:51:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aYeXH-0007Yl-0P
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 13:51:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aYeXD-0008Mg-Pd
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 13:51:42 -0500
Received: from mail-bl2on0138.outbound.protection.outlook.com
	([65.55.169.138]:6944
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aYeXD-0008MQ-H2; Wed, 24 Feb 2016 13:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kkZ8OYci1vPVvRdxobCxSPcgrRFd66qPUBcG48j7rkY=;
	b=k0akMfqVPZs/eW+Fk4zqfaTaLqy19J5w3iU9gs/72Jl6utl3tnq4590Yo4I78ZdmRZvzzMnmvMEA/u8BUO5AHCsl1cPmJaTaufL2JFs5G4cFTDZSTyj5ZY//sfu1eKzW8VhgwKyk+DArNtSXP2rc85h/6lQh815kftDs7XNUNG8=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Wed, 24 Feb 2016 18:51:37 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0409.024; Wed, 24 Feb 2016 18:51:37 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Mats Malmberg <mats.malmberg@tritech.se>
Thread-Topic: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2
Thread-Index: AQHRbyuhTtcp6DFdR0aZb1Ld0rYnj587fCNggAAHpQCAAAYYoA==
Date: Wed, 24 Feb 2016 18:51:37 +0000
Message-ID: <BLUPR0301MB2034F3C40B01A1A3536A837C9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
	<BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<56CDF624.6050104@redhat.com>
In-Reply-To: <56CDF624.6050104@redhat.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:a::77f]
x-ms-office365-filtering-correlation-id: 55d1aff5-29a8-49fd-8554-08d33d4b8689
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:mdvMdl19WBdq1mZeG2XwsgLnEMShSwHjeURnQZJiY9azv3GRFJfhQVhZtB1uhZ2sCfTW2I9n/WUJaxQKEcetmZQr14+Nn8czAvLZeJYLIWgDRfWsSNsV5ZHmoDEURhAPdHmcmZ0/BFUTmEYxcy9TNA==;
	24:ap9mANImWb3MxzPG+dtEGILdxW7S99PHiv98Xnk1QEAPT4nI9DUL0M/Vc1UL6/EXW1nzyUsSO7lHWkIK4Fn28Hg3g2qPooEwUkCHHU7mSHY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034A650684E495400637B519EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(53754006)(479174004)(92566002)(74316001)(15975445007)(6116002)(3660700001)(40100003)(99286002)(3280700002)(19580395003)(77096005)(5001770100001)(19580405001)(8990500004)(10090500001)(10400500002)(2900100001)(2950100001)(33656002)(5005710100001)(122556002)(10290500002)(11100500001)(1096002)(54356999)(76176999)(189998001)(106116001)(5001960100002)(87936001)(50986999)(102836003)(4326007)(1220700001)(2906002)(5008740100001)(5004730100002)(586003)(5003600100002)(76576001)(93886004)(86362001)(5002640100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2016 18:51:37.6341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.138
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel]  help on how to emulate rasbperry pi 2
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
X-TUID: obFt+ZD7wGLU

PiBGcm9tOiBKb2huIFNub3cgW21haWx0bzpqc25vd0ByZWRoYXQuY29tXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIDI0IEZlYnJ1YXJ5IDIwMTYgMTA6MjggQU0NCj4gT24gMDIvMjQvMjAxNiAwMTowNCBQ
TSwgQW5kcmV3IEJhdW1hbm4gd3JvdGU6DQo+ID4+IEZyb206IFBldGVyIE1heWRlbGwgW21haWx0
bzpwZXRlci5tYXlkZWxsQGxpbmFyby5vcmddDQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgMjQgRmVi
cnVhcnkgMjAxNiA5OjQ5IEFNDQo+ID4+DQo+ID4+IE9uIDI0IEZlYnJ1YXJ5IDIwMTYgYXQgMTU6
NDAsIE1hdHMgTWFsbWJlcmcNCj4gPG1hdHMubWFsbWJlcmdAdHJpdGVjaC5zZT4NCj4gPj4gd3Jv
dGU6DQo+ID4+Pg0KPiA+Pj4gSGVsbG8gYWxsIQ0KPiA+Pj4NCj4gPj4+IFRMO0RSIDogSXMgdGhl
IHJhc3BpMiBtYWNoaW5lIHJlYWR5IHRvIHVzZT8gSWYgeWVzLCBob3cgZG8gSSB1c2UgaXQgd2l0
aA0KPiA+Pj4gb3JkaW5hcnkgcnBpIGRpc3Ryb3M/IElmIG5vdCwgd2hhdCBpcyB0aGUgYmVzdCB3
YXkgdG8gZW11bGF0ZSByYXNwYmVycnkNCj4gPj4+IHBpIDIgdmlhIFFlbXU/DQo+ID4+DQo+ID4+
IEhpOyBJJ3ZlIGNjJ2QgdGhlIG1haW4gcWVtdS1kZXZlbCBsaXN0IGFuZCBBbmRyZXcgQmF1bWFu
biB3aG8NCj4gY29udHJpYnV0ZWQNCj4gPj4gdGhlIHJwaTIgc3VwcG9ydC4gSSBrbm93IHRoZXJl
IGFyZSBzdGlsbCBzb21lIG1pc3NpbmcgcGllY2VzIHRvIGJlDQo+ID4+IGFkZGVkIGxhdGVyIGJ1
dCBJIGZvcmdldCB0aGUgZGV0YWlscy4NCj4gPg0KPiA+IFRoZXJlIGFyZSBzdGlsbCBhIG51bWJl
ciBvZiBtaXNzaW5nIHBpZWNlcyAoaW5jbHVkaW5nIGRpc3BsYXkgYW5kIFVTQikgd2hpY2gNCj4g
SSBob3BlIHRvIHN1Ym1pdCBzb29uLCBidXQgeW91IHNob3VsZCBiZSBhYmxlIHRvIGJvb3QgTGlu
dXggd2l0aCBhIHNlcmlhbA0KPiBjb25zb2xlLiBCcmllZiBpbnN0cnVjdGlvbnMgYXJlIGF0IHRo
ZSBlbmQgb2YgdGhpcyBwYWdlOg0KPiBodHRwczovL2dpdGh1Yi5jb20vMHhhYnUvcWVtdS93aWtp
DQo+ID4NCj4gPiBCVFcsIGluc3RlYWQgb2YgLWhkYSB5b3UgbmVlZCB0byBwYXNzIC1zZCBmb3Ig
dGhlIGltYWdlIGZpbGUuDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gQW5kcmV3DQo+ID4NCj4gDQo+
IElzIGl0IHdvcnRoIGNoYW5naW5nIHRoZSBkZWZhdWx0IGludGVyZmFjZSBmb3IgdGhlICJyYXNw
aTIiIGJvYXJkIHRvIGJlDQo+IFNEIHNvIHRoYXQgIi1oZGEgeHh4eHgiIG1vdW50cyBhbiBTRCBj
YXJkPw0KPiANCj4gT3IgZG8gd2Ugc3VwcG9ydCB1c2luZyB0aGF0IGZvciBhbiBpbWFnaW5lZCBT
L0FUQSBpbnRlcmZhY2U/IChCQ00yODM2DQo+IGRvZXNuJ3QgaGF2ZSBTQVRBLCByaWdodD8pDQoN
Ck9oLCBpbiBmYWN0IEkgYW0gYWxyZWFkeSBzZXR0aW5nIHRoYXQsIHNvIHBlcmhhcHMgLWhkYSBk
b2VzIGFscmVhZHkgd29yay4gTWF0cycgcHJvYmxlbSBpcyBtb3N0IGxpa2VseSBqdXN0IHRoYXQg
aGUncyBub3Qgc2VlaW5nL2VuYWJsaW5nIHRoZSBzZXJpYWwgY29uc29sZS4NCg0KQW5kcmV3DQo=
