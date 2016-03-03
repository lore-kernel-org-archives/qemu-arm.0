Received: by 10.25.208.211 with SMTP id h202csp2803869lfg;
        Thu, 3 Mar 2016 09:10:05 -0800 (PST)
X-Received: by 10.140.170.70 with SMTP id q67mr4830895qhq.8.1457025005233;
        Thu, 03 Mar 2016 09:10:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o31si31319895qko.59.2016.03.03.09.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 09:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abWlI-00008m-MB
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 12:10:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abWks-0008Ht-Vm
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 12:09:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abWkp-0004CI-Mz
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 12:09:38 -0500
Received: from mail-by2on0122.outbound.protection.outlook.com
	([207.46.100.122]:56730
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abWkp-0004Bq-88; Thu, 03 Mar 2016 12:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cuBYN8pCUvAsHInqkHjwsQ26Af1yGe/vUd2qKwlSbQ0=;
	b=N0ipyfKiAJ+KChByKd3W1NJdkp1PpQn7i0TxkHdwPrLSWnW77nAp4ltTOWX7GKOCg5wOx5/jkqZYRO6sus+f+u/ryWRh+3oDytICy9N3xRTD+I6jeJCJZFaaMZMm3jyMpaCu13w1tQpn6y3ukUcYornGLkIGioF+wEFNbBqkGfQ=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Thu, 3 Mar 2016 17:09:33 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0415.024; Thu, 3 Mar 2016 17:09:33 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH RFC] bcm2835_dma: add emulation of Raspberry
	Pi DMA controller
Thread-Index: AQHRc0aO1xiIlEBZ/kyHYTgkrbyXRJ9HylWAgAAfGgCAAAGXgIAAC7Hw
Date: Thu, 3 Mar 2016 17:09:33 +0000
Message-ID: <BLUPR0301MB203489910518E01A55BB8C8E9EBD0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
	<1457021768.3574.58.camel@redhat.com>
	<CAFEAcA83d79ta+-40_M_mXYs9E=eSQMH9jL7kw-UpPLxK-8Kyw@mail.gmail.com>
In-Reply-To: <CAFEAcA83d79ta+-40_M_mXYs9E=eSQMH9jL7kw-UpPLxK-8Kyw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:4::724]
x-ms-office365-filtering-correlation-id: 285e6582-a8fb-4e42-369a-08d343869769
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:PJMxokry5IwuvcAOkerfxWGosC56LQjanPw/uBr7OdGAzpVcXy4TInlKzsq+AzQUWP/BuBDOsJ/ZIw2SpMco5WRdPrKbeZQ47X1KZ5YPsqtTkqoFzQl6E91YaLMXX8KDbOlZxQ6bP5hxyTx3q3sWXw==;
	24:WWk9//sgwVLaM3yI+FjWz7El/yXoLbjFvtMZZaRx7B1vBqTRs668A6Oc0cV7LfDMMdnziPH7wY2V4TqnZ/27EBSrMmWfmZ1Hdqp6JQzAPng=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034DF5C7F6B907DF3327AEA9EBD0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0870212862
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(51914003)(24454002)(2906002)(586003)(50986999)(5008740100001)(5005710100001)(1220700001)(102836003)(86612001)(5003600100002)(10290500002)(1096002)(6116002)(11100500001)(10400500002)(76176999)(5002640100001)(54356999)(40100003)(189998001)(5001770100001)(33656002)(10090500001)(4326007)(76576001)(86362001)(74316001)(3280700002)(77096005)(92566002)(2950100001)(19580405001)(8990500004)(122556002)(5004730100002)(99286002)(3660700001)(2900100001)(19580395003)(106116001)(81166005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2016 17:09:33.2274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.122
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, Stefan
	Weil <sw@weilnetz.de>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH RFC] bcm2835_dma: add emulation of
 Raspberry Pi DMA controller
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
X-TUID: xCHtYE408F5A

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBUaHVyc2RheSwgMyBNYXJjaCAyMDE2IDg6MjIgQU0NCj4gDQo+IE9uIDMgTWFyY2gg
MjAxNiBhdCAxNjoxNiwgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOg0K
PiA+IHVzYiBlbXVsYXRpb24gaGFzIHRoaXMgcHJvYmxlbSB0b28uDQo+ID4NCj4gPiB1aGNpIHF1
ZXVlIGhlYWRzIGNhbiBnbyBpbiBjaXJjbGVzLiAgVGhlIGVtdWxhdGlvbiBjb2RlIGtlZXBzIGEg
bGlua2VkDQo+ID4gbGlzdCBvZiBhY3RpdmUgcXVldWUgaGVhZHMsIHdoaWNoIGlzIChhbW9uZyBv
dGhlciBib29ra2VlcGluZyB0aGluZ3MpDQo+ID4gdXNlZCB0byBkZXRlY3Qgd2hlbiB3ZSBydW4g
aW4gY2lyY2xlcy4gIEl0J3MgYSBsZWdhbCB0aGluZyB0byBkbyBmb3IgYQ0KPiA+IGd1ZXN0IGJ0
dywgc28geW91IGNhbiBzZWUgdGhhdCBoYXBwZW5pbmcgaW4gcHJhY3RpY2UuDQo+ID4NCj4gPiB1
bnRpbCByZWNlbnRseSBlaGNpIGNvdWxkIGJlIHRyaWNrZWQgaW50byBydW5uaW5nIGluIGxvb3Bz
IHRvbywgYnkNCj4gPiBjcmVhdGluZyBhIGNpcmN1bGFyIGNoYWluIG9mIElEVHMuICBXaGljaCBp
cyBub3QgbGVnYWwgYWNjb3JkaW5nIHRvDQo+ID4gc3BlY3MsIHNvIHRoaXMgd2VudCB1bm5vdGlj
ZWQgZm9yIGEgd2hpbGUuICBCdXQgYSBtYWxpY2lvdXMgZ3Vlc3QgY2FuIGRvDQo+ID4gaXQgbmV2
ZXJ0aGVsZXNzLiAgVGhhdCBvbmUgd2FzIGZpeGVkIGJ5IHN0b3BwaW5nIElEVCBwcm9jZXNzaW5n
IGluIGNhc2UNCj4gPiBubyBkYXRhIHdhcyB0cmFuc2ZlcmVkLiAgVGhpcyBpcyBwb3NzaWJsZSBi
ZWNhdXNlIHRoZSBlaGNpIGNvbnRyb2xsZXINCj4gPiB3cml0ZXMgYmFjayB0aGUgc3RhdHVzIHRv
IHRoZSBJRFQsIHNvIHdlIGNhbiBmaWd1cmUgdGhlcmUgaXMgbm90aGluZyB0bw0KPiA+IGRvIChi
ZWNhdXNlIHdlIGFscmVhZHkgcHJvY2Vzc2VkIHRoYXQgSURUKSB3aXRob3V0IGFkZGl0aW9uYWwN
Cj4gPiBib29ra2VlcGluZywgYnkgc2ltcGx5IGNoZWNraW5nIHRoZSBzdGF0dXMuDQo+ID4NCj4g
PiBGcm9tIGEgYnJpZWYgbG9vayBhdCB0aGUgcGF0Y2ggaXQgc2VlbXMgeW91IGNhbiBub3QgdXNl
IHRoZSBsYXRlciBmb3INCj4gPiB0aGUgYmNtMjgzNSBkbWEgY29udHJvbGxlciwgSSBjYW4ndCBz
cG90IGEgcGxhY2Ugd2hlcmUgdGhlIHNvbWUgc3RhdHVzDQo+ID4gaXMgd3JpdHRlbiBiYWNrIHRv
IHRoZSBkbWEgY29udG9sIGJsb2NrIC4uLg0KPiANCj4gSSBndWVzcyBhIG1vcmUgZ2VuZXJhbCBh
cHByb2FjaCB0byB0aGUgcHJvYmxlbSB3b3VsZCBiZSB0byBoYXZlDQo+IGEgKGhvcGVmdWxseSBl
YXN5KSB3YXkgdG8gc2F5ICJpZiB0aGlzIGhhcyBiZWVuIGdvaW5nIG9uIGZvciB0b28NCj4gbG9u
ZyB0aGVuIGFycmFuZ2UgdG8gZGVmZXIgY29udGludWVkIHByb2Nlc3Npbmcgb2YgaXQgdGlsIGxh
dGVyLA0KPiBhbmQgZm9yIG5vdyByZXN1bWUgdGhlIGd1ZXN0Ii4gVGhhdCdzIHRvbyBiaWcgYSBj
YW4gb2Ygd29ybXMgZm9yDQo+IHRoaXMgcGF0Y2gsIHRob3VnaC4gKEFuZCBmb3Igc29tZXRoaW5n
IHRoYXQncyBvbmx5IHVzZWQgaW4gVENHDQo+IGVtdWxhdGlvbiB3ZSBjYXJlIG11Y2ggbGVzcyBh
Ym91dCBtYWxpY2lvdXMgZ3Vlc3RzIHRoYW4gZm9yIGRldmljZXMNCj4gdGhhdCBjYW4gYmUgdXNl
ZCB3aXRoIEtWTS4pDQoNCkl0IHNlZW1zIGxpa2UgdGhlIHVsdGltYXRlIHNvbHV0aW9uIGhlcmUg
aXMgdG8gbW9kZWwgdGhlIGNvbmN1cnJlbmN5IG9mIERNQS4gUnVuIGVhY2ggRE1BIGVuZ2luZSBh
cyBpdHMgb3duIHRocmVhZCwgaW5jbHVkaW5nIG1vZGVsbGluZyB0aGUgYWJpbGl0eSB0byBwYXVz
ZS9hYm9ydCB0cmFuc2ZlcnMsIGFuZCBwcm92aWRlIHNvbWUgc3VpdGFibGUgc2NoZWR1bGluZy9y
ZXNvdXJjZSBhcmJpdHJhdGlvbiBtZWNoYW5pc20sIGFuZCB0aGVuIHlvdSBkb27igJl0IG5lZWQg
dG8gd29ycnkgYWJvdXQgd2hldGhlciBhIGd1ZXN0IGNhbiB0aWUgdXAgb25lIG9mIHRob3NlIHRo
cmVhZHMgaW4gYSBsb29wLCBiZWNhdXNlIGl0IGNhbid0IGh1cnQgYW55b25lIGVsc2UuIE9mIGNv
dXJzZSwgdGhpcyBpcyBtdWNoIG1vcmUgY29tcGxleCB0byBpbXBsZW1lbnQuDQoNCkJ1dCBpbiB0
aGlzIHBhcnRpY3VsYXIgY2FzZSwgSSBfcmVhbGx5XyBob3BlIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0
byB3b3JyeSBhYm91dCB2aXJ0dWFsIHJhc3BiZXJyeSBwaSdzIGluIG11bHRpLXRlbmFudCBob3N0
aW5nISA6KQ0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywNCkFuZHJldw0K
