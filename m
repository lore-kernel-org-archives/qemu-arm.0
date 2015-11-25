Received: by 10.182.158.201 with SMTP id ww9csp124649obb;
        Wed, 25 Nov 2015 10:04:30 -0800 (PST)
X-Received: by 10.140.201.13 with SMTP id w13mr32099190qha.15.1448474670219;
        Wed, 25 Nov 2015 10:04:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si7464081qge.59.2015.11.25.10.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 10:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:46993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1eQg-0002rp-0V
	for alex.bennee@linaro.org; Wed, 25 Nov 2015 13:04:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1ePI-00013O-Mv
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 13:03:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1ePE-0002ld-P2
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 13:03:04 -0500
Received: from mail-bn1bn0105.outbound.protection.outlook.com
	([157.56.110.105]:16533
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1ePE-0002lY-GR
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 13:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7LccH1JRTmnwASrnbeOd5tZuq6ftgnRGjStyJ+YkUrg=;
	b=HxgjHNuyOMC36KJKUxbILNYaxgDJNVZEHDZbs81CFcWh/54mLiwPuclz3smQ9/PtlLZXGAn7uRw4KHdLKyULZvSpn0dpatCA8LkV2kTTCwlzCfSdF6TNRslu/PKF9KsvLYyhtUXJeFzJM9UyFIYQU3mHJmF8nXNg2Y8cl/2+Ewc=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Wed, 25 Nov 2015 18:02:58 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0331.023; Wed, 25 Nov 2015 18:02:59 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
Thread-Index: AdEem9sZHjs9/bX/Q4+JMP7QmdOAYQDOg3SAABS0aqAAA+N6AAEDWg8QAEBZ1YAAGM3ngA==
Date: Wed, 25 Nov 2015 18:02:58 +0000
Message-ID: <BLUPR0301MB2034AC952465CA2EE0B3B05D9E050@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
	<BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
	<CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
In-Reply-To: <CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:b::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:KAz2EV3ATECXemmqqPUo+D2uAw0q/8OMGQCXY7tTJzP6+TPjBxI6ZBv0OZ3vaTKPy5uIWh7YLRRxe+x0VbSO1jItP1wKbpTwaYzFkBRQsXe0L4rSB/6BE1TEHt4+X7dvkEWNRCSAxvF6IR87aV6KuQ==;
	24:ZTaUWEQz+2OFN7xGXBCTxWoVGnSBGENjMb7Y2b8mcmnpfKYSj+qgNJWReWivLvUXQ6VXHeW/D9HUvV3ukRQTER3Aaj5a1Xsvz8qzFD0JuAI=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB2036EC3D43FC5502444FD8569E050@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(108003899814671);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425024)(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046)(61426024)(61427024);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0771670921
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(199003)(189002)(377454003)(99286002)(230783001)(105586002)(19580395003)(110136002)(86362001)(77096005)(106356001)(189998001)(93886004)(1411001)(2900100001)(1220700001)(86612001)(2950100001)(5003600100002)(5001960100002)(8990500004)(5008740100001)(92566002)(40100003)(10400500002)(5005710100001)(10290500002)(87936001)(10090500001)(33656002)(50986999)(122556002)(19580405001)(101416001)(54356999)(76176999)(102836003)(586003)(5001920100001)(76576001)(81156007)(97736004)(74316001)(6116002)(5002640100001)(5004730100002)(5007970100001)(7059030)(3826002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2015 18:02:58.8886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.105
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>, Sai Pavan
	Boddu <saipava@xilinx.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
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
X-TUID: a69oB7JbDY/V

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUdWVzZGF5LCAyNCBOb3ZlbWJlciAyMDE1IDIyOjA0DQo+IE9uIFR1ZSwg
Tm92IDI0LCAyMDE1IGF0IDQ6MDAgUE0sIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFu
bkBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPiBJIGFtIHdvcmtpbmcgb24gcmVmYWN0b3Jpbmcg
dGhlIFBpIHN1cHBvcnQgY29kZSBhcyB5b3Ugc3VnZ2VzdGVkLiBJIGhhdmUNCj4gc3BsaXQgdGhl
IFBpIFNPQ3MgaW50byBzZXBhcmF0ZSBvYmplY3RzIChiY20yODM1IGFuZCBiY20yODM2KSB3aGlj
aCBib3RoDQo+IGluc3RhbnRpYXRlIGEgdGhpcmQgY29tbW9uIGJjbTI4MzVfcGVyaXBoZXJhbHMg
ZGV2aWNlIHRoYXQgaW4gdHVybiBjb250YWlucw0KPiBhbGwgdGhlIGNvbW1vbiBkZXZpY2VzLiBJ
IGhhdmUgYWxzbyBzd2l0Y2hlZCB0aGUgY29kZSB0byB1c2Ugb2JqZWN0DQo+IHByb3BlcnRpZXMg
cmF0aGVyIHRoYW4gZ2xvYmFsIHZhcmlhYmxlcyB0byBjb21tdW5pY2F0ZSBzdGF0ZSB3aGVyZSBk
ZXZpY2VzDQo+IGludGVyYWN0IHdpdGggZWFjaCBvdGhlci4NCj4gPg0KPiANCj4gU2hvdWxkIHRo
aXMgYmUgYW4gaW5oZXJpdGFuY2Ugb2YgYSBjb21tb24gU29DIHJhdGhlciB0aGFuIGFuDQo+IGlu
c3RhbnRpYXRpb24gb2YgYSBjb21tb24gY29udGFpbmVyPw0KDQpJIGNvbnNpZGVyZWQgdGhhdCwg
YnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBidXkgbXVjaC4gVG8gYXZvaWQgbG90cyBvZiBjb25kaXRp
b25hbCBjb2RlIGluIHRoZSBjb21tb24gc29jLCBJIHdvdWxkIHN0aWxsIG5lZWQgdGhyZWUgY2xh
c3NlczogdGhlIGNvbW1vbiBzdHVmZiwgYmNtMjgzNSAod2hpY2ggaW5oZXJpdHMgZnJvbSB0aGUg
Y29tbW9uIHN0dWZmIGFuZCBhZGRzIHRoZSBhcm0xMTc2IGNwdSksIGFuZCBiY20yODM2ICh3aGlj
aCBhbHNvIGluaGVyaXRzIHRoZSBjb21tb24gc3R1ZmYsIGJ1dCBhZGRzIHVwIHRvIGZvdXIgYTcg
Y29yZXMsIGFuZCBhIG5ldyBpbnRlcnJ1cHQgY29udHJvbGxlciB3aXRoIGEgbW9yZSBjb21wbGV4
IHJvdXRpbmcpLiBJJ2QgaGF2ZSB0byBvdmVybG9hZCByZWFsaXplIGluIGJvdGggb2YgdGhvc2Ug
c3ViY2xhc3Nlcy4gQW5kIGFzaWRlIGZyb20gdGhlIGlzc3VlIG9mIHByb3BlcnRpZXMgKHdoaWNo
IGFsaWFzZXMgc2VlbSB0byBzb2x2ZSAtLSB0aGFua3MhKSB0aGUgY29kZSB3b3VsZCBiZSBhYm91
dCB0aGUgc2FtZSBjb21wbGV4aXR5IG92ZXJhbGwsIHdpdGggdGhlIGRvd25zaWRlIHRoYXQgdGhl
IGludGVyZmFjZSBiZXR3ZWVuIHRoZSBjb21tb24gc3R1ZmYgYW5kIHRoZSBwYXJlbnQgc29jIGRl
dmljZSBpcyBub3cgbXVjaCB3aWRlciB0aHJvdWdoIGluaGVyaXRhbmNlIG9mIGFsbCBpdHMgaW50
ZXJuYWwgc3R1ZmYgKGxpa2UgdGhlIHByaXZhdGUgSU8gYnVzKSB0aGF0IHRoZSBwYXJlbnQgZG9l
c24ndCBuZWVkIHRvIHNlZS4NCg0KQW5kcmV3DQo=
