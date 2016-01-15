Received: by 10.25.159.19 with SMTP id i19csp146895lfe;
        Thu, 14 Jan 2016 16:44:26 -0800 (PST)
X-Received: by 10.141.28.149 with SMTP id f143mr10223758qhe.66.1452818666766;
        Thu, 14 Jan 2016 16:44:26 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si10206666qkg.60.2016.01.14.16.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 16:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:45002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJsV8-0007Jp-AT
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 19:44:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJsUn-00071z-QG
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 19:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJsUj-0006xh-O4
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 19:44:05 -0500
Received: from mail-by2on0135.outbound.protection.outlook.com
	([207.46.100.135]:13232
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aJsUj-0006xc-46; Thu, 14 Jan 2016 19:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Dm+0pOBvP8EXLL1xLLDV75K2mtjOiV3Aq8pxbyrTkp0=;
	b=EQxCxdWwJIOyQTVYWvIjwpo/FvP04ggqt9BHGKafwwXf+XUhGaavyDG6xlBSRT9l62fPKSmM+tWSoISQdvMUTp9ZRAJEStrjrb6+VOMp42N1YXCUe8XgZuhnEqXaI4Kxr40RuCoOL2fkLAhO5DlCBq1EnlPDCj5yDv3ZVhRFm04=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 00:43:58 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0365.023; Fri, 15 Jan 2016 00:43:59 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [PATCH v3 7/7] raspi: add raspberry pi 2 machine
Thread-Index: AQHRRCvQrdqc5QRVI0SWrS1zLOHRB573UnuAgAFA88CAABsYgIADB7pAgAAJtgCAABHmgA==
Date: Fri, 15 Jan 2016 00:43:58 +0000
Message-ID: <BLUPR0301MB2034E184E428D6EA2A2ED9BF9ECD0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
	<BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
	<BLUPR0301MB20344588F72A1870A14A673A9ECC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=p44X=0Dymr3BhbKTTf3Gx00tPGJO=B2mCki2TPCh0ZHA@mail.gmail.com>
In-Reply-To: <CAPokK=p44X=0Dymr3BhbKTTf3Gx00tPGJO=B2mCki2TPCh0ZHA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7::494]
x-ms-office365-filtering-correlation-id: 5cfc7587-6d9e-4d43-7d3e-08d31d44f4ca
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:xhHji7NcZXV/MU+dj1At9Qp6DB4CkTAVAAPJEPLlylOQdiHhQ/SFfvZfEX4Kb2iWDKA1Jr9rBydTBs7jUcsdiCwrTAVcrfdpK1fLD6qw46i3R9+eQfdKgQd0se0QOAVyNMQE5F/PpyhzzoMNoOtEHg==;
	24:kfjxd7qtb+IF/DBq0mT5dlyqC7KMcMdXiSI312KwjHhP/3bmrcxm3s95r4bGXNqO7BN6tVMe9hP9SuveYxo9wOmQahNMqPpIAZhP+SUoqEY=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB203610057FC071C81A5383909ECD0@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 08220FA8D6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(199003)(189002)(97736004)(76176999)(586003)(99286002)(93886004)(74316001)(106356001)(50986999)(86362001)(54356999)(87936001)(101416001)(105586002)(19580395003)(19580405001)(86612001)(33656002)(106116001)(76576001)(10400500002)(8990500004)(6116002)(5003600100002)(1220700001)(2950100001)(2900100001)(5002640100001)(92566002)(10290500002)(5008740100001)(1096002)(5004730100002)(189998001)(10090500001)(122556002)(102836003)(77096005)(5001770100001)(5001960100002)(40100003)(4326007)(2906002)(5005710100001)(81156007)(3826002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2016 00:43:58.7983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.135
Cc: Stefan Weil <sw@weilnetz.de>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: YRPokZMkbCmA

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUaHVyc2RheSwgMTQgSmFudWFyeSAyMDE2IDE1OjM1DQo+IA0KPiBPbiBU
aHUsIEphbiAxNCwgMjAxNiBhdCAzOjA0IFBNLCBBbmRyZXcgQmF1bWFubg0KPiA8QW5kcmV3LkJh
dW1hbm5AbWljcm9zb2Z0LmNvbT4gd3JvdGU6DQo+ID4gSGkgUGV0ZXIsDQo+ID4NCj4gPj4gRnJv
bTogUGV0ZXIgQ3Jvc3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0N
Cj4gPj4gU2VudDogVHVlc2RheSwgMTIgSmFudWFyeSAyMDE2IDE2OjQ0DQo+ID4+IE9uIFR1ZSwg
SmFuIDEyLCAyMDE2IGF0IDM6NTMgUE0sIEFuZHJldyBCYXVtYW5uDQo+ID4+IDxBbmRyZXcuQmF1
bWFubkBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPj4gPj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2Fp
dGUgW21haWx0bzpjcm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0NCj4gPj4gPj4gU2VudDogTW9u
ZGF5LCAxMSBKYW51YXJ5IDIwMTYgMTk6NTgNCj4gPj4gPj4gPiArICAgIC8qIEFsbG9jYXRlIGFu
ZCBtYXAgUkFNICovDQo+ID4+ID4+ID4gKyAgICBtZW1vcnlfcmVnaW9uX2FsbG9jYXRlX3N5c3Rl
bV9tZW1vcnkoJnMtPnJhbSwNCj4gPj4gPj4gT0JKRUNUKG1hY2hpbmUpLCAicmFtIiwNCj4gPj4g
Pj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWNoaW5lLT5y
YW1fc2l6ZSk7DQo+ID4+ID4+ID4gKw0KPiBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb25fb3Zl
cmxhcChnZXRfc3lzdGVtX21lbW9yeSgpLCAwLA0KPiA+PiA+PiAmcy0+cmFtLCAwKTsNCj4gPj4g
Pj4NCj4gPj4gPj4gSSB0aG91Z2h0IHRoZSBTb0MgaGFuZGxlZCB0aGlzIG5vdz8gV2h5IGRvIHlv
dSBuZWVkIHRvIGFkZCB0bw0KPiA+PiA+PiBzeXN0ZW1fbWVtb3J5Pw0KPiA+PiA+DQo+ID4+ID4g
SWYgSSBkb24ndCBtYXAgaXQgaGVyZSwgaG93IGRvIFJBTSBhY2Nlc3NlcyBmcm9tIHRoZSBDUFVz
IHdvcms/DQo+ID4+ID4NCj4gPj4NCj4gPj4gRG8gdGhlIENQVXMgbm90IGhhdmUgdGhlaXIgQVMn
ZXMgY29ubmVjdGVkIHRvIHlvdXIgY3VzdG9tIEFTZXMgYnkgdGhlDQo+IFNvQw0KPiA+PiBsYXll
cj8NCj4gPj4NCj4gPj4gPiBPciBhcmUgeW91IHNheWluZyB0aGF0IEkgc2hvdWxkIHN0aWxsIGRv
IHRoaXMsIGJ1dCBkbyBpdCBpbiB0aGUgU29DIG5vdCB0aGUNCj4gPj4gYm9hcmQgbGV2ZWw/DQo+
ID4+ID4NCj4gPj4NCj4gPj4gSSB3YXMgaG9waW5nIHdlIGNvdWxkIGdldCBhd2F5IHdpdGggMCB1
c2Ugb2Ygc3lzdGVtX21lbW9yeS4NCj4gPg0KPiA+IE9uIGZ1cnRoZXIgaW52ZXN0aWdhdGlvbiwg
SSBkb24ndCB0aGluayBpdCdzIHBvc3NpYmxlIHRvIHdpcmUgdXAgQ1BVIEFTZXMNCj4gZXhwbGlj
aXRseS4gVGhlcmUncyBubyBvYnZpb3VzIHByb3BlcnR5IHRvIHNldC4gRWFjaCBjcHUtPmFzIGlz
IGluaXRpYWxpc2VkIHRvDQo+IHBvaW50IHRvIGFkZHJlc3Nfc3BhY2VfbWVtb3J5IGF0IHRoZSB0
b3Agb2YgY3B1X2V4ZWNfaW5pdCgpLCBhbmQgdGhlcmUgaXMNCj4gbm8gd2F5IEkgY291bGQgc2Vl
IHRvIG92ZXJyaWRlIHRoYXQuDQo+ID4NCj4gPiBJIHRoaW5rIHdoYXQgSSBoYXZlIG5vdyBpcyBw
cmV0dHkgY2xlYW4sIGJ1dCBpZiB5b3UnZCBwcmVmZXIgdG8gZG8gdGhlDQo+IG1hcHBpbmcgYXQg
aW50byB0aGUgZ2xvYmFsIEFTIGF0IFNvQyBsZXZlbCB0aGF0J3MgZmluZSB3aXRoIG1lIHRvby4N
Cj4gPg0KPiANCj4gSWYgaXQgY2FudCBiZSBkb25lIHlldCwgd2hhdCBpcyBoZXJlIGlzIGEgcHJl
ZmVyYWJsZSBhcHByb2FjaC4gUE1NIGhhcw0KPiBzb21lIHdvcmsgb24gbGlzdCBmb3IgQ1BVIEFT
ZXMgdGhhdCBtYXkgYmUgcmVhbHRlZCwgbW9yZXNvIGZvciB0aGUNCj4gc2VjdXJlIGF0dHJpYnV0
ZXMgdGhvdWdoIEkgdGhpbmsuDQoNCk9rLiBJdCBsb29rcyBsaWtlIHRoZSBwYXRjaCB5b3UgQ0Nl
ZCBtZSBvbiB3b3VsZCBlbmFibGUgdGhpcy4gQnV0IEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gd2Fp
dCBmb3IgdGhhdCB3aXRoIFBpLCBhbmQgaG9uZXN0bHkgSSBkb24ndCB0aGluayB0aGlzIGlzIHRv
byBiYWQgLS0gdGhlcmUgYXJlIG9ubHkgYSBoYW5kZnVsIG9mIHRoaW5ncyBpbiB0aGUgc3lzdGVt
X21lbW9yeSBzcGFjZSAodGhlIFJBTSwgdGhlIHBlcmlwaGVyYWxzIGJsb2IsIGFuZCB0aGUgMjgz
NiBtdWx0aS1jb3JlIGNvbnRyb2xsZXIgb24gcGkyKSwgYW5kIGl0IHNlZW1zIHVubGlrZWx5IHRv
IGJlIG9mIGdyZWF0IGJlbmVmaXQgdW5sZXNzIHNvbWUgZnV0dXJlIG1hZG1hbiBzdGFydHMgYnVp
bGRpbmcgbXVsdGktcGkgYm9hcmRzIHdpdGggYml6YXJyZSBtYXBwaW5nIHNjaGVtZXMuIExldCdz
IGhvcGUgbm90IDopDQoNCkFuZHJldw0K
