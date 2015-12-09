Received: by 10.182.158.201 with SMTP id ww9csp444123obb;
        Tue, 8 Dec 2015 22:25:28 -0800 (PST)
X-Received: by 10.55.76.76 with SMTP id z73mr5079243qka.90.1449642328398;
        Tue, 08 Dec 2015 22:25:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si7489804qhi.75.2015.12.08.22.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Dec 2015 22:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:34788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6YBr-0001Rl-VJ
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 01:25:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6YBp-0001Qt-VZ
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 01:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6YBo-0004vO-Js
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 01:25:25 -0500
Received: from mail-bl2on0135.outbound.protection.outlook.com
	([65.55.169.135]:18152
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a6YBi-0004sQ-Js; Wed, 09 Dec 2015 01:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PhjdpyKosYmpDLlNIi6ZoFvgioNd/2mXTczGrlw7vpo=;
	b=i/5b/JqtmKTXWe+c32Mf9lnqp95zgPJEp2qsOF9UnDv7bWh6Bqwr5quCuSjUjo/gPCWJCrVBFtLtOKrChewzifICwMZ6hrcNtPEoB84laCYGJtb0J9OUAf092nqumMjfR0VQyqGp8cEN6nQPo/M3GQAimwKEN+iqZAN9INeOd5U=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Wed, 9 Dec 2015 06:25:17 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Wed, 9 Dec 2015 06:25:17 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH 3/8] bcm2835_ic: add bcm2835 interrupt controller
Thread-Index: AQHRLll0uMZbjuF4WUet1isF0xgj1J69brIAgATIPPA=
Date: Wed, 9 Dec 2015 06:25:16 +0000
Message-ID: <BLUPR0301MB20345FF0F97E96EA66FE26D99EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-3-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=r_c4yK3C8yp7mmqAsBKUrnA-3fLgKyp2eHKJyWy9HC9w@mail.gmail.com>
In-Reply-To: <CAPokK=r_c4yK3C8yp7mmqAsBKUrnA-3fLgKyp2eHKJyWy9HC9w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [50.46.154.109]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:+9WgYjPpWNAvhgAOKPw2xMGji/wxg2Mmo95KPZdvE7+P9APQ3bLCSEcVJi4dPGvT+0GRvoRhjDp4nnFxnrVaBn69uk4XaH+XCrdMYjG/tIEVKY0X5k4dp5nN0r5shkyZWzuSf5ZSCmZr0OnENweksg==;
	24:g/A5E8dKYm0LeOl6/pIvLfoqPXVDMY8jakiE4bBcKOt8RQxljZF8xetjhjOiDLaCQuEYTo8pdx1Xj9oM4UNm7npx5sENTQr1Ua868LSOvdQ=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB20350FA41B9CFBF385DE70529EE80@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(520078)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 0785459C39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(377454003)(24454002)(51914003)(86362001)(50986999)(5004730100002)(74316001)(66066001)(5002640100001)(8990500004)(19580405001)(77096005)(1096002)(10090500001)(189998001)(106356001)(105586002)(92566002)(99286002)(6116002)(10290500002)(1220700001)(3846002)(102836003)(33656002)(106116001)(5003600100002)(86612001)(101416001)(11100500001)(81156007)(40100003)(110136002)(122556002)(5008740100001)(76576001)(2900100001)(76176999)(5005710100001)(10400500002)(93886004)(2950100001)(87936001)(586003)(54356999)(97736004)(1411001)(19580395003)(5001960100002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2015 06:25:16.9084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.135
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 3/8] bcm2835_ic: add bcm2835 interrupt
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
X-TUID: kAGOXQ2P7cfJ

UGV0ZXIsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIG9uIHRoaXMgcGF0Y2guIEkgYWdyZWUg
d2l0aCBhbGwgb2YgaXQsIGJ1dCBJIGRvIGhhdmUgb25lIG1pbm9yIHF1aWJibGUuLi4NCg0KPiBG
cm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29t
XQ0KPiBTZW50OiBTYXR1cmRheSwgNSBEZWNlbWJlciAyMDE1IDIxOjIwDQo+IE9uIFRodSwgRGVj
IDMsIDIwMTUgYXQgMTA6MDEgUE0sIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFubkBt
aWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPiAtLS0gYS9ody9pbnRjL01ha2VmaWxlLm9ianMNCj4g
PiArKysgYi9ody9pbnRjL01ha2VmaWxlLm9ianMNCj4gPiBAQCAtMjQsNiArMjQsNyBAQCBvYmot
JChDT05GSUdfR1JMSUIpICs9IGdybGliX2lycW1wLm8NCj4gPiAgb2JqLSQoQ09ORklHX0lPQVBJ
QykgKz0gaW9hcGljLm8NCj4gPiAgb2JqLSQoQ09ORklHX09NQVApICs9IG9tYXBfaW50Yy5vDQo+
ID4gIG9iai0kKENPTkZJR19PUEVOUElDX0tWTSkgKz0gb3BlbnBpY19rdm0ubw0KPiA+ICtvYmot
JChDT05GSUdfUkFTUEkpICs9IGJjbTI4MzVfaWMubw0KPiANCj4gV2UgYXJlIHRyeWluZyB0byBl
bmNvdXJhZ2UgLSdzIGZvciB0aGUgc2VwYXJhdG9ycyBpbiBuZXcgZmlsZSBuYW1lcywNCj4gYWx0
aG91Z2ggYWRtaXR0ZWRseSBpcyBkb2VzIHNlZW0gdGhhdCBpbnRjLyBpcyBsYWdnaW5nIGhlcmUu
DQoNClNpZ2guIEkgY2FuIHJlbmFtZSBhbGwgdGhlIG5ldyBmaWxlcyBpZiB5b3UgaW5zaXN0LCBi
dXQgd2hhdCdzIHRoZSByYXRpb25hbGUgZm9yIHRoaXM/DQoNCkp1c3QgZm9yIHRoZSByZWNvcmQ6
DQolIGZpbmQgcWVtdSAtaW5hbWUgKi5bY2hdIHwgZ3JlcCAtYyAtDQoxNzI4DQolIGZpbmQgcWVt
dSAtaW5hbWUgKi5bY2hdIHwgZ3JlcCAtYyBfDQoxMTY2DQoNCkFuZHJldw0K
