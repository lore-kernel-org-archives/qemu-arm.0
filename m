Received: by 10.182.158.201 with SMTP id ww9csp11583953obb;
        Tue, 5 Jan 2016 22:07:13 -0800 (PST)
X-Received: by 10.140.38.73 with SMTP id s67mr118391064qgs.82.1452060433155;
        Tue, 05 Jan 2016 22:07:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184si41044290qhp.59.2016.01.05.22.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jan 2016 22:07:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGhFY-0005GN-H4
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 01:07:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aGhFW-0005Dt-Fe
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 01:07:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aGhFV-0000kB-JL
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 01:07:10 -0500
Received: from mail-by2on0114.outbound.protection.outlook.com
	([207.46.100.114]:7824
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aGhFQ-0000jp-UD; Wed, 06 Jan 2016 01:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OoCGhyvc7Svt5IKGJpq5RJ8G0EF7JL2PHOm41Mmau7A=;
	b=ev4Ukm6fZQ8CHRsPdDdzrhMqrbyuzykrloZ0Kb5+1Ow8drU4vgCErDSZh44CC2zRT0hHJUOEuosWNNb1065VYTdy7EsW/sX6IBpm7E4j6KHDuMebcffguxnMG8KGFNoX+N89o5xOOk0X3tMBYVCrvS/SWngj9rrdIuFnYtFXZRM=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Wed, 6 Jan 2016 06:07:01 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Wed, 6 Jan 2016 06:07:01 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Alistair Francis <alistair23@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH v3 4/7] bcm2835_peripherals: add rollup
	device for bcm2835 peripherals
Thread-Index: AQHRRCvPeCFnfW31kEWLA4I01DADXp7tx2AAgAA4KeA=
Date: Wed, 6 Jan 2016 06:07:01 +0000
Message-ID: <BLUPR0301MB2034F8C3EC30A73B8B5DD2B59EF40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAKmqyKNhzTUAvexC-N+mxekuWgcteEoujg6fQo2vL+tHsHw=Og@mail.gmail.com>
In-Reply-To: <CAKmqyKNhzTUAvexC-N+mxekuWgcteEoujg6fQo2vL+tHsHw=Og@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [50.46.154.109]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:TxiQJ6zUvyi7c2QrAtj+TsJzYADHyhGKUoTgYyZE06w/oi3mG7rVfmr8K9PYDnnpF4IhEgImj2c/Sn8mQCX3ZL7iSnxJAbfRmVfUjGnq4t98qqEOmBX+zklGYbwaGH95i88iUcnKPnczefitPF1S3A==;
	24:sEwR9e3Sge5/WB4Q0ejHuNLzkSaKIpxzgxkN3CplkJkxc6tb/5UENJTh6q+XweP9LNNIXGGdU1HsyRtfkpCLUCxDfgJZ+iAQ4Vj6VFT9YzQ=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB20364A7D758CE703F348E5F89EF40@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(520078)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0813C68E65
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(377454003)(199003)(24454002)(189002)(10290500002)(106116001)(92566002)(33656002)(5004730100002)(1411001)(2900100001)(2950100001)(5002640100001)(5003600100002)(86362001)(77096005)(189998001)(5005710100001)(19580405001)(5001960100002)(10090500001)(11100500001)(101416001)(10400500002)(8990500004)(106356001)(87936001)(74316001)(122556002)(54356999)(105586002)(86612001)(6116002)(5008740100001)(50986999)(76176999)(586003)(1220700001)(3846002)(76576001)(19580395003)(66066001)(110136002)(40100003)(1096002)(99286002)(102836003)(97736004)(4326007)(81156007)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2016 06:07:01.3042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.114
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/7] bcm2835_peripherals: add
 rollup device for bcm2835 peripherals
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
X-TUID: CPZ6nZA9xX3X

PiBGcm9tOiBBbGlzdGFpciBGcmFuY2lzIFttYWlsdG86YWxpc3RhaXIyM0BnbWFpbC5jb21dDQo+
IFNlbnQ6IFR1ZXNkYXksIDUgSmFudWFyeSAyMDE2IDE4OjE0DQo+IE9uIFRodSwgRGVjIDMxLCAy
MDE1IGF0IDQ6MzEgUE0sIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFubkBtaWNyb3Nv
ZnQuY29tPiB3cm90ZToNCj4gPiBUaGlzIGRldmljZSBtYWludGFpbnMgYWxsIHRoZSBub24tQ1BV
IHBlcmlwaGVyYWxzIG9uIGJjbTI4MzUgKFBpMSkNCj4gPiB3aGljaCBhcmUgYWxzbyBwcmVzZW50
IG9uIGJjbTI4MzYgKFBpMikuIEl0IGFsc28gaW1wbGVtZW50cyB0aGUNCj4gPiBwcml2YXRlIGFk
ZHJlc3Mgc3BhY2VzIHVzZWQgZm9yIERNQSBhbmQgbWFpbGJveGVzLg0KWy4uLl0NCj4gPiArICAg
IG9iaiA9IG9iamVjdF9wcm9wZXJ0eV9nZXRfbGluayhPQkpFQ1QoZGV2KSwgInJhbSIsICZlcnIp
Ow0KPiA+ICsgICAgaWYgKG9iaiA9PSBOVUxMKSB7DQo+ID4gKyAgICAgICAgZXJyb3Jfc2V0Zyhl
cnJwLCAiJXM6IHJlcXVpcmVkIHJhbSBsaW5rIG5vdCBmb3VuZDogJXMiLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgX19mdW5jX18sIGVycm9yX2dldF9wcmV0dHkoZXJyKSk7DQo+ID4gKyAgICAg
ICAgcmV0dXJuOw0KPiA+ICsgICAgfQ0KPiANCj4gSSBvbmx5IGhhZCBhIHF1aWNrIHJlYWQgb2Yg
dGhpcyBwYXRjaCwgYnV0IHRoaXMgUkFNIGxpbmtpbmcgbG9va3MgZmluZQ0KPiB0byBtZS4gT3V0
IG9mIGN1cmlvc2l0eSBpcyB0aGVyZSBhIHJlYXNvbiB5b3UgdXNlDQo+IG9iamVjdF9wcm9wZXJ0
eV9nZXRfbGluaygpIGluc3RlYWQgb2Ygb2JqZWN0X3Byb3BlcnR5X2FkZF9saW5rKCkgaW4NCj4g
dGhlIGluaXQ/DQoNCkknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgeW91ciBxdWVzdGlvbi4uLiBp
dCB3b3VsZG4ndCB3b3JrIHRoZSBvdGhlciB3YXkuIEkgYWxsb2NhdGUgdGhlIHJhbSBhbmQgYWRk
IHRoZSBsaW5rIHVzaW5nIG9iamVjdF9wcm9wZXJ0eV9hZGRfY29uc3RfbGluaygpIGluIGh3L2Fy
bS9yYXNwaS5jLiBUaGlzIGZpbGUgbmVlZHMgdG8gY29uc3VtZSB0aGUgcmFtIHRvIHNldHVwIGFs
aWFzIG1hcHBpbmdzLCBzbyBpdCBpcyB1c2luZyBnZXRfbGluaygpLiAoTm90ZSB0aGVyZSdzIGFs
c28gbGV2ZWwgb2YgaW5kaXJlY3Rpb247IHJhc3BpIGNyZWF0ZXMgYmNtMjgzNiwgd2hpY2ggZG9l
cyBub3RoaW5nIGJ1dCBnZXQgdGhlIGxpbmsgc2V0IGJ5IGl0cyBwYXJlbnQgYW5kIGFkZCBpdCB0
byBpdHMgYmNtMjgzNV9wZXJpcGhlcmFscyBjaGlsZC4pDQoNCkkgc3VwcG9zZSBJIGNvdWxkIGRv
IGl0IHRoZSBvdGhlciB3YXkgYXJvdW5kIChhbGxvY2F0ZSBhbmQgc2V0IGxpbmsgaW4gYmNtMjgz
NV9wZXJpcGhlcmFscywgYmFzZWQgb24gYSBzaXplIHBhc3NlZCBmcm9tIHRoZSBib2FyZCksIGJ1
dCBpdCBzZWVtZWQgbW9yZSBsb2dpY2FsIHRvIHRyZWF0IHRoZSBSQU0gYXMgY3JlYXRlZC9vd25l
ZCBvZiB0aGUgYm9hcmQgcmF0aGVyIHRoYW4gdGhlIFNvQy4NCg0KQ2hlZXJzLA0KQW5kcmV3DQo=
