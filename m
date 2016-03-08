Received: by 10.25.208.211 with SMTP id h202csp1740182lfg;
        Mon, 7 Mar 2016 21:23:41 -0800 (PST)
X-Received: by 10.140.98.163 with SMTP id o32mr29963047qge.46.1457414621566;
        Mon, 07 Mar 2016 21:23:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si1395545qkp.31.2016.03.07.21.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 21:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:60414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adA7R-00077b-2S
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 00:23:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adA7O-00074h-41
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adA7N-0002rc-5d
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:23:38 -0500
Received: from mail-bn1bon0144.outbound.protection.outlook.com
	([157.56.111.144]:12009
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adA7G-0002qX-V5; Tue, 08 Mar 2016 00:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4U6rBocYwq1r/mQ9qhC0PUKYdijPJD4UMUvXDWZc1zw=;
	b=T3aLYup0MgWlaXTM7ya9+ojYkPJgRpp/6taN2v+/mIB+ce2XcqBrSiPuIpo28S2PLgOB2QbLiOcAeg+6OoDeAecoOWI5Qg7fo05jVkCDaeRIux+tLyKEMYDMuL4bbs+DLvcNayH10m7o0DlWpfEeR+7PQmnyHXGjQdB/ZClCi3A=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 05:23:29 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0427.019; Tue, 8 Mar 2016 05:23:29 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v2 5/5] bcm2835_dma: add emulation of Raspberry Pi DMA
	controller
Thread-Index: AQHRdXn8ZNB2dNQM5EGpXDDOTsh8h59O/TiAgAAIkDA=
Date: Tue, 8 Mar 2016 05:23:29 +0000
Message-ID: <BLUPR0301MB20341C3A71E6E599BFBF133D9EB20@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1457029479-11312-6-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA_PVUJwc0t3a68wt2HC9xs6SVt5qN4uCTXPz6yzXi9E1w@mail.gmail.com>
In-Reply-To: <CAFEAcA_PVUJwc0t3a68wt2HC9xs6SVt5qN4uCTXPz6yzXi9E1w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [50.46.154.109]
x-ms-office365-filtering-correlation-id: b0cc4d2d-e002-4d7e-4068-08d34711c8a3
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:Dhlne9ISYctI+xULhHvHBht5zSuGuPfJp9ty1psAKjRw0f2JnU4IMAJL8X6bIgNQ4GUYXjhMAtTw00qlf1NlV0k2sieMJLUj5J/lvMVsQ+83fpX40F8RbTMXuGRKie/C2g4D8mmdeFR1GjckswrGdA==;
	24:ETmnoZ+8+6nIvfEYweAwtle8GqiYSyKGGMZsk4U7IqZelHi2R0Q7GDMaHwgKfkhftnI3TSuAVvxbNx3ZgZJabaqDVNbhtTxLz3S8qkcI+BU=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB2033D5BBDBB97B35E04E5F239EB20@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 08756AC3C8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(164054003)(5002640100001)(110136002)(87936001)(77096005)(76576001)(106116001)(11100500001)(5003600100002)(40100003)(189998001)(5008740100001)(5004730100002)(86362001)(19580395003)(74316001)(122556002)(66066001)(92566002)(19580405001)(3660700001)(76176999)(3280700002)(81166005)(2906002)(5005710100001)(2900100001)(10290500002)(2950100001)(50986999)(10400500002)(4326007)(54356999)(586003)(86612001)(33656002)(1220700001)(1096002)(102836003)(6116002)(3846002)(10090500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2016 05:23:29.3967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.144
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 5/5] bcm2835_dma: add emulation of
 Raspberry Pi DMA controller
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
X-TUID: FW32ExBcoRsE

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBNb25kYXksIDcgTWFyY2ggMjAxNiA4OjM3IFBNDQo+IA0KPiBPbiA0IE1hcmNoIDIw
MTYgYXQgMDE6MjQsIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQu
Y29tPiB3cm90ZToNCj4gPiBBdCBwcmVzZW50LCBhbGwgRE1BIHRyYW5zZmVycyBjb21wbGV0ZSBp
bmxpbmUgKHNvIGEgbG9vcGluZyBkZXNjcmlwdG9yDQo+ID4gcXVldWUgd2lsbCBsb2NrIHVwIHRo
ZSBkZXZpY2UpLiBXZSBhbHNvIGRvIG5vdCBtb2RlbCBwYXVzZS9hYm9ydCwNCj4gPiBhcmJpdHJh
cmlvbi9wcmlvcml0eSwgb3IgZGVidWcgZmVhdHVyZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQmF1bWFubiA8QW5kcmV3LkJhdW1hbm5AbWljcm9zb2Z0LmNvbT4NCj4gPiAtLS0N
Cj4gDQo+IFJldmlld2VkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc+DQo+IA0KPiBDYW4geW91IGFkZCBHcmVnb3J5J3MgU2lnbmVkLW9mZi1ieSAoYW5kIGF1dGhv
cnNoaXAgZnJvbT8pIHRvIHdoaWNoZXZlcg0KPiBwYXRjaGVzIGFyZSBhcHByb3ByaWF0ZSB3aGVu
IHlvdSByZXNlbmQgKGFzIHBlciBkaXNjdXNzaW9uIG9uIHRoZQ0KPiBlYXJsaWVyIHZlcnNpb24g
b2YgdGhpcyBwYXRjaCk/DQoNClllcywgaGFwcGlseS4gQnV0IHdoYXQncyB0aGUgYmVzdCB3YXkg
dG8gY2FwdHVyZSB0aGlzIHdoZW4gdGhlIGNvZGUgd2UncmUgY29tbWl0dGluZyBpcyBhIG1peHR1
cmUgb2YgY29kZSBmcm9tIEdyZWdvcnkgYW5kIFN0ZWZhbiAodmlhIGEgbWFudWFsIHBhdGNoIGlu
dG8gU3RlZmFuJ3MgYXI3IHJlcG8sIHNvIG11Y2ggb2YgdGhhdCBoaXN0b3J5IGlzIGxvc3QgdG8g
bWUpIHRoYXQgSSd2ZSB0aGVuIGV4dGVuZGVkIGFuZCByZWZhY3RvcmVkPyBJIGtub3cgd2hhdCBJ
IGFkZGVkIChlLmcuIGF1eCksIGJ1dCBmb3IgdGhlIGZpbGVzIHdpdGggam9pbnQgYXV0aG9yc2hp
cCAoZmIsIGRtYSkgc2hvdWxkIHdlIGp1c3QgcHV0IEdyZWdvcnkgYXMgdGhlIGF1dGhvciBvbiB0
aG9zZSBwYXRjaGVzIHdpdGggYSBzaWduZWQtb2ZmLWJ5IGZyb20gbWU/IENhbiBJIGFsc28gYWRk
IGEgc2lnbmVkLW9mZi1ieSBvbiBiZWhhbGYgb2YgR3JlZ29yeSwgb3IgZG9lcyBoZSBuZWVkIHRv
IGRvIGl0Pw0KDQpGb3JnaXZlIHRoZSBuZXdiaWUgcXVlc3Rpb25zLCBidXQgSSdtIG5ldyB0byB0
aGlzIHByb2Nlc3MgYW5kIHdhbnQgdG8gZ2V0IGl0IHJpZ2h0IDopDQoNCk5vdGUgdGhhdCB3ZSBk
aWRuJ3QgZG8gdGhpcyBmb3IgdGhlIHByZXZpb3VzIHBhdGNoIHNlcmllcy4gTWVhIGN1bHBhLiBJ
ZiB0aGVyZSdzIGEgZ29vZCB3YXkgdG8gZ28gYmFjayBhbmQgY29ycmVjdCBoaXN0b3J5LCBJJ20g
aGFwcHkgdG8gaGVscC4NCg0KVGhhbmtzLA0KQW5kcmV3DQo=
