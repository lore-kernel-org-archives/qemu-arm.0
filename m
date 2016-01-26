Received: by 10.25.159.19 with SMTP id i19csp1645098lfe;
        Mon, 25 Jan 2016 22:23:49 -0800 (PST)
X-Received: by 10.140.248.198 with SMTP id t189mr27564005qhc.42.1453789429066;
        Mon, 25 Jan 2016 22:23:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h81si28916159qhd.73.2016.01.25.22.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 22:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:42122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNx2a-0001ri-I6
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 01:23:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aNx2Y-0001pR-Hi
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 01:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aNx2X-00021g-LW
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 01:23:46 -0500
Received: from mail-bn1bon0136.outbound.protection.outlook.com
	([157.56.111.136]:2880
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aNx2T-000217-76; Tue, 26 Jan 2016 01:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WsUDQSUgSqNiQx0/ygPJdfaXzyIdzFtVaABR5pmW1AI=;
	b=S5ugt5xxuif7pTPzAj2cpzhdEDzAOYDu62sfHgn7ersEaIwNtMr+68cvfIvfYrQyqWD7V1BSPoD0Mz5PN/VRXQ4V3DhHEOmHqw3KiMWXd8MJbyY+EMQE5n6vjTSmkfO1vfYta+V3EVB3zF7rYhD5CVHMTy9KXo8Y9amh9EPtEXQ=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Tue, 26 Jan 2016 06:23:39 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0390.013; Tue, 26 Jan 2016 06:23:39 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v4 4/8] bcm2835_peripherals: add rollup device for
	bcm2835 peripherals
Thread-Index: AQHRT/DDSa0Q9/bDa0ydsyPaRKMGkp8NYbWAgAABHxA=
Date: Tue, 26 Jan 2016 06:23:39 +0000
Message-ID: <BLUPR0301MB2034FAE99E63647A00D388E79ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=qp6vgfLPD+iai2-quyXD3ODPtNQgZLS1Kfwgn-ZCYMRw@mail.gmail.com>
In-Reply-To: <CAPokK=qp6vgfLPD+iai2-quyXD3ODPtNQgZLS1Kfwgn-ZCYMRw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [50.46.154.109]
x-ms-office365-filtering-correlation-id: b0ff60e6-6087-41ed-4033-08d326193b12
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:cylDX19MdO17ojjGk6XfSmuPCAt+A32cZ+VX0yXZgljyfTaR6OM9CZZko3U2tgoSOr6d3Eqd8PY5m4ny1Vsmz5h0WBticGVQbgEdpTPTGMviIH6m+XYBvciPOBM2qLd4NFbjuydNT0JRIImLXWfdFQ==;
	24:ZCFkPbi02GkAKPjZ9Qz5ISYdpyD8aTD/SoYpG8nBxewGhDs1Roxlj6OV7W0qhxNZe50cKVIP5BcT0OAngTvUkGUX55x7zOo2r/0llkBbhRU=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB20347A65CA63F1A23D1F81659ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(123027)(601004)(2401047)(520078)(8121501046)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(164054003)(377454003)(189002)(199003)(54356999)(5001960100002)(74316001)(2950100001)(3846002)(76576001)(1096002)(110136002)(1220700001)(102836003)(77096005)(2900100001)(11100500001)(10090500001)(50986999)(105586002)(106116001)(101416001)(76176999)(5008740100001)(5002640100001)(106356001)(586003)(5003600100002)(6116002)(33656002)(66066001)(99286002)(189998001)(19580395003)(2906002)(5005710100001)(122556002)(19580405001)(87936001)(97736004)(81156007)(10290500002)(10400500002)(4326007)(8990500004)(1411001)(5004730100002)(3280700002)(86612001)(40100003)(86362001)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2016 06:23:39.3960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.136
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 4/8] bcm2835_peripherals: add rollup
 device for bcm2835 peripherals
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
X-TUID: HRJLC9F2e4rh

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBNb25kYXksIDI1IEphbnVhcnkgMjAxNiAyMjoxNA0KPiANCj4gT24gRnJp
LCBKYW4gMTUsIDIwMTYgYXQgMzo1OCBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVt
YW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KWy4uLl0NCj4gPiArc3RhdGljIHZvaWQgYmNtMjgz
NV9wZXJpcGhlcmFsc19pbml0KE9iamVjdCAqb2JqKQ0KPiA+ICt7DQo+ID4gKyAgICBCQ00yODM1
UGVyaXBoZXJhbFN0YXRlICpzID0gQkNNMjgzNV9QRVJJUEhFUkFMUyhvYmopOw0KPiA+ICsNCj4g
PiArICAgIC8qIE1lbW9yeSByZWdpb24gZm9yIHBlcmlwaGVyYWwgZGV2aWNlcywgd2hpY2ggd2Ug
ZXhwb3J0IHRvIG91cg0KPiBwYXJlbnQgKi8NCj4gPiArICAgIG1lbW9yeV9yZWdpb25faW5pdF9p
bygmcy0+cGVyaV9tciwgb2JqLCBOVUxMLCBzLCAiYmNtMjgzNS0NCj4gcGVyaXBoZXJhbHMiLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MTAwMDAwMCk7DQo+IA0KPiBTaG91bGQg
dGhpcyBqdXN0IGJlIG5vcm1hbCBtZW1vcnlfcmVnaW9uX2luaXQ/DQoNCkkgdGhpbmsgc28gLS0g
aXQncyBqdXN0IGEgY29udGFpbmVyIHJlZ2lvbiwgYW5kIEkgcHJvYmFibHkgY29weSBhbmQgcGFz
dGVkIHRoZSBBUEkgaGVyZS4gVGhlIHR3byBNUiBpbml0IEFQSXMgc2VlbSBhbG1vc3QgYnV0IG5v
dC1xdWl0ZSBpZGVudGljYWwgd2hlbiBOVUxMIGNhbGxiYWNrcyBhcmUgdXNlZC4gQ2FuIHlvdSBi
cmllZmx5IGV4cGxhaW4gdGhlIGRpZmZlcmVuY2U/DQoNCj4gPiArICAgIG9iamVjdF9wcm9wZXJ0
eV9hZGRfY2hpbGQob2JqLCAicGVyaXBoZXJhbC1pbyIsIE9CSkVDVCgmcy0+cGVyaV9tciksDQo+
IE5VTEwpOw0KPiANCj4gVGhpcyBzZWVtcyBsaWtlIGEgd2VpcmQgcGFyZW50aW5nLCB0byBoYXZl
IHRoZSBTb0MgYXMgY2hpbGQgdG8gYW4NCj4gb2JqZWN0IGl0IGp1c3QgY3JlYXRlZC4gSXMgdGhl
IHByb2JsZW0geW91IG5lZWQgYSBwYXJlbnQgYmVmb3JlIG90aGVycw0KPiBjYW4gcGFyZW50IHRv
IHlvdT8NCg0KSSdtIGNvbmZ1c2VkIGJ5IHRoaXMgcXVlc3Rpb246IFVubGVzcyBJJ20gbWlzdGFr
ZW4sIHRoZSBwYXJlbnQgaGVyZSBpcyBCQ00yODM1UGVyaXBoZXJhbFN0YXRlLCB0aGUgY2hpbGQg
aXMgdGhlIG5ldyBtZW1vcnkgcmVnaW9uIHdlIGp1c3QgY2FsbGVkIGluaXQgb24uDQoNClRoYW5r
cywNCkFuZHJldw0K
