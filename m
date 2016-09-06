Received: by 10.25.87.130 with SMTP id l124csp534122lfb;
        Tue, 6 Sep 2016 04:19:01 -0700 (PDT)
X-Received: by 10.237.51.162 with SMTP id v31mr43034604qtd.1.1473160741842;
        Tue, 06 Sep 2016 04:19:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h72si8114797qke.312.2016.09.06.04.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Sep 2016 04:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhEP7-00084X-4S
	for alex.bennee@linaro.org; Tue, 06 Sep 2016 07:19:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bhEP1-00081h-U3
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 07:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bhEOz-0004sj-Oo
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 07:18:54 -0400
Received: from mail-db5eur01on0130.outbound.protection.outlook.com
	([104.47.2.130]:55601
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>)
	id 1bhEOs-0004qm-Ch; Tue, 06 Sep 2016 07:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7XQ2QModV/BXFscaL4CEcFzjumf191dBaDsBj3IzG5o=;
	b=pq+PAmyUnCTgIkdr95KjMhOCgPulZVpbEdomoeWRdxbwJS6eD/GW0dPF2gG55fePejEPXVuIUE/6+yPwltq3i4KMTyxdcIG6FR62x3RJsigOSP7LPYvz/mHsnka0nrYQaDPMKgS8u0+bx/k+V4626WTe1HRsYmaX6aYBhAKYqtY=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2131.eurprd07.prod.outlook.com (10.167.132.140) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.609.9; Tue, 6 Sep 2016 06:42:04 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0599.010; Tue, 6 Sep 2016 06:42:04 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis
	<alistair.francis@xilinx.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Thread-Topic: [Qemu-arm] [PATCH] block: m25p80c Fix vmstate structure name
Thread-Index: AQHR/J/Zu6dOcCCEwEqw5MYJw52QrKBsGZJQ
Date: Tue, 6 Sep 2016 06:42:03 +0000
Message-ID: <AM4PR0701MB21308A50282B0CF680BF2230FEF90@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-m6B_S7zYRE0iqbL+sR8ieJweeVDHqxgx1JB+mGywo3w@mail.gmail.com>
	<20160819141930.GE2004@work-vm>
	<CAKmqyKPPg7rfuhHNrRzZAjpx1JKFME-LUrEv2WMZyVpzQRVJ6g@mail.gmail.com>
	<95cd01e4-12e7-12fa-5f2a-f1d7de0b2e97@redhat.com>
In-Reply-To: <95cd01e4-12e7-12fa-5f2a-f1d7de0b2e97@redhat.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.32.184]
x-ms-office365-filtering-correlation-id: a8ceb23a-111d-461c-561f-08d3d620e9dc
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2131;
	6:n7uYF1IOohjmr3U8DKsg9BU4bAkODIyqkhb/Txu1/AdKV/D0nKq+zelhh9cDHGvwWz/i9oZTlWfy4nh4YnuezfPPgTJhkJCbVWdWbqcgDkIv3CIqkgfaZj4oaqzLRFmfpz9YiB3W6mGLAUTq41HCsQuagcW3YpqT0ukXdAmVdBFSMRGFEmL1tIYw2TScK6enxArhtT54n7WxZ+Q0d5Jmd6nE61RwSPDG7Z9qxTDkk53ROyHFq4cO7ruWBXrE7bOcqNrMKd6nT4fpYGRZDxvJ39wSH4sm6D+9P5DTI0Ge4MB7Wvnflu9Ycmtnc/xN0FFL5plI+LntXIOVUV3+7ovE9g==;
	5:cz8kocnJ4iY0zzETZoB4iIFL4HFz4bvAtLqc8qktyAgkuXDmvYHDGact+MjaM2EmVmhmM8sm2VExiMHSVYOTJWx3J/R5PTG/czA4Mi88L04aIiAMT7GNDgLuEdK7aLayMME8KrvMgIW380Hc7VJ/6g==;
	24:D5FEgcgNn+YVWA4qfRw7F8o6gifz49o1LF0jyT39ncScCAxVVTVle+nqG/30Np6ybVwsCphmCLO6YmLDeiwL6upLLpruXbLKlxWe0QaZOXk=;
	7:UdkpebteOLcrwel8q11GC15yM/GPKc8Sjaj8o/mCJ+K+3uAvtSzUZB1ovdoscpPLxv8Y5EYC6+idOVWXhe9fnMV2viDIk4P+/4F29KogtwQqrYhhFoiK99YZChFQzl4IguzCvoUw/XepZ6DyeMsRNWJxssEjsIICFbfkTjqSrzPDjoQ1ReBkvj9bMwVIdU+jWlIbnNYYE839MRyIYGGtzETbW0WUkP+hyJPp/7lLFhiShjYTOP3nEYVMAAE47l8q
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0701MB2131;
x-microsoft-antispam-prvs: <AM4PR0701MB21315B7F152DEB414AC2F0AEFEF90@AM4PR0701MB2131.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM4PR0701MB2131; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2131; 
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(13464003)(189002)(377454003)(199003)(24454002)(2906002)(7736002)(50986999)(97736004)(7696003)(2950100001)(101416001)(66066001)(77096005)(305945005)(122556002)(4001430100002)(33656002)(9686002)(4326007)(3660700001)(8936002)(92566002)(7846002)(5002640100001)(2900100001)(3280700002)(5001770100001)(68736007)(107886002)(189998001)(5660300001)(106116001)(105586002)(86362001)(10400500002)(76176999)(81156014)(76576001)(106356001)(11100500001)(87936001)(19580405001)(19580395003)(74316002)(54356999)(93886004)(8676002)(81166006)(102836003)(3846002)(6116002)(586003)(8666005)(7059030);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2131;
	H:AM4PR0701MB2130.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2016 06:42:03.8749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2131
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.130
Subject: Re: [Qemu-arm] [PATCH] block: m25p80c Fix vmstate structure name
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	"rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OnRdiFtlCx/J

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQm9uemluaSBb
bWFpbHRvOnBhb2xvLmJvbnppbmlAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgUGFvbG8NCj4gQm9u
emluaQ0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAyMiwgMjAxNiA4OjA2IFBNDQo+IFRvOiBBbGlz
dGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHhpbGlueC5jb20+OyBEci4gRGF2aWQgQWxh
biBHaWxiZXJ0DQo+IDxkZ2lsYmVydEByZWRoYXQuY29tPg0KPiBDYzogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgQW5kcmV3IEpvbmVzDQo+IDxkcmpvbmVzQHJlZGhh
dC5jb20+OyBKdWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRoYXQuY29tPjsgS3J6ZW1pbnNraSwN
Cj4gTWFyY2luIChOb2tpYSAtIFBML1dyb2NsYXcpIDxtYXJjaW4ua3J6ZW1pbnNraUBub2tpYS5j
b20+OyBRRU1VDQo+IERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IHFlbXUtYXJt
IDxxZW11LQ0KPiBhcm1Abm9uZ251Lm9yZz47IEFtaXQgU2hhaCA8YW1pdC5zaGFoQHJlZGhhdC5j
b20+OyByZnN3LQ0KPiBwYXRjaGVzQG1saXN0Lm5va2lhLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1Fl
bXUtYXJtXSBbUEFUQ0hdIGJsb2NrOiBtMjVwODBjIEZpeCB2bXN0YXRlIHN0cnVjdHVyZQ0KPiBu
YW1lDQo+IA0KPiANCj4gDQo+IE9uIDIwLzA4LzIwMTYgMDA6MjAsIEFsaXN0YWlyIEZyYW5jaXMg
d3JvdGU6DQo+ID4+Pj4gPj4gPiBDaGFuZ2Ugd3JvbmcgbmFtZSBvZiB0aGUgdm1zdGF0ZSBzdHJ1
Y3R1cmUuIFNpbmNlIHRoaXMgYnJlYWtzDQo+ID4+Pj4gPj4gPiBjb21wYXRpYmlsaXR5IHVwZGF0
ZSB2ZXJzaW9uIGFuZCBmaWVsZHMgdG8gMC4NCj4gPiBzL2FuZC9zZXQvZw0KPiA+DQo+IA0KPiBP
ciBtb3JlIGxpa2VseTogInVwZGF0ZSB0aGUgVk1TdGF0ZSB2ZXJzaW9uIHRvIDAgYW5kIG1ha2Ug
YWxsIGZpZWxkcw0KPiBpbmRlcGVuZGVudCBvZiB0aGUgVk1TdGF0ZSB2ZXJzaW9uIi4NCg0KWWVz
LCBJIHdpbGwgcmV3cml0ZSBjb21taXQgLGVzc2FnZSBhbmQgc2VuZCBWMi4NCg0KVGhhbmtzLA0K
TWFyY2luDQo+IA0KPiBQYW9sbw0K
