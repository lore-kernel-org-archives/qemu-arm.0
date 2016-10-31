Received: by 10.80.166.35 with SMTP id d32csp330172edc;
        Mon, 31 Oct 2016 13:33:01 -0700 (PDT)
X-Received: by 10.55.89.197 with SMTP id n188mr14814116qkb.306.1477945981487;
        Mon, 31 Oct 2016 13:33:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l124si13024222qkc.192.2016.10.31.13.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 13:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:38473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1JGO-0007Y7-6i
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 16:33:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1c1JGK-0007Wr-5y
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 16:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1c1JGJ-0006lG-88
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 16:32:56 -0400
Received: from mail-he1eur01on0118.outbound.protection.outlook.com
	([104.47.0.118]:2512
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1c1JGE-0006fi-78; Mon, 31 Oct 2016 16:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=S8QKKOvzmVvF30wACZ6HA/osiMTKblAe4we/zrYsaOc=;
	b=RojrPZbVw1pVL9DE8zckE4cPq7rfaHV9iwvamdxteGkqeLvGU0U9209OyGaKMjvJy39h6b1xcnfabtpV0uaAwwXakWf86dj4LlXpCJAPxzFd228E9TDHlqfMSciNWzr3Z+EuBOz3YfhK2TooQRcc2XRimutMMHHnwsUJ8nSUGNg=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2129.eurprd07.prod.outlook.com (10.167.132.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.707.1;
	Mon, 31 Oct 2016 11:56:55 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0707.000; Mon, 31 Oct 2016 11:56:55 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [v2] nvic: set pending status for not active interrupts
Thread-Index: AQHSKQcPMca6KGcJQEyYkNkKFinBj6C3w7AAgAqWSGCAABM/gIAAGyoA
Date: Mon, 31 Oct 2016 11:56:55 +0000
Message-ID: <AM4PR0701MB21305EDB089D08768B7575EAFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-QTUvqJvHwd11-UhGGiatH4PKkupthGh9Xzw3C1vHRGw@mail.gmail.com>
	<AM4PR0701MB213042F89412D6561736F11FFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
	<CAFEAcA-KpYEiw3uCMh8gKMyP=OxX2Q35pQ8PCEHRFXkadcXYwQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-KpYEiw3uCMh8gKMyP=OxX2Q35pQ8PCEHRFXkadcXYwQ@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.2.7]
x-ms-office365-filtering-correlation-id: b70900a1-6e86-458d-be13-08d4018502de
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2129;
	7:LiEu4Lm5mcMPFwDD9gyZcAEfwq7bCV0zNvnzuKvXXMatoeqnKi847E6EJZr1x+Nv/wigLNzF0ueyMrKiRm+aWnPLnNgp6i9YRZ+5fWaEvpNcWjzPFbcIDVTfn8ATRYFcsTwLX1f/ShBdDYI5dqoH7CJrF5g8OJeQQV4Xf6m3q5x1Ij2NtOug6cPGjYphCgM/XizNTpC2seUBBnhxAqgZdxF+Z5uiTHrPKBlYRnpsymxFeKczyyDfi2FcuHwPedEZJT+Sn4cZRBFiYdlXh5yeFx542xktibA59YnvdJg3r7IJyzvHqT4Hc3vZj0FkckX8U/ujQp8iJ2tzK3XPNkyzCTIJmo/hIii2ebG8/1FSwU8=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0701MB2129;
x-microsoft-antispam-prvs: <AM4PR0701MB212935D64C58B3A11A93292EFEAE0@AM4PR0701MB2129.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AM4PR0701MB2129; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2129; 
x-forefront-prvs: 01128BA907
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(199003)(189002)(377454003)(24454002)(13464003)(7736002)(8936002)(106116001)(7846002)(8676002)(50986999)(10400500002)(76176999)(305945005)(92566002)(54356999)(19580395003)(68736007)(7696004)(5660300001)(74316002)(106356001)(105586002)(2950100002)(81156014)(19580405001)(9686002)(87936001)(6916009)(81166006)(97736004)(3846002)(6116002)(101416001)(102836003)(76576001)(189998001)(86362001)(586003)(4001430100002)(107886002)(110136003)(93886004)(3660700001)(2906002)(2900100001)(77096005)(4326007)(11100500001)(3280700002)(33656002)(66066001)(5002640100001)(122556002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2129;
	H:AM4PR0701MB2130.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2016 11:56:55.4200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2129
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.118
Subject: Re: [Qemu-arm] [v2] nvic: set pending status for not active
 interrupts
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
Cc: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fj3EaHO0E6l4

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCBb
bWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVy
IDMxLCAyMDE2IDExOjE1IEFNDQo+IFRvOiBLcnplbWluc2tpLCBNYXJjaW4gKE5va2lhIC0gUEwv
V3JvY2xhdykNCj4gPG1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbT4NCj4gQ2M6IFFFTVUgRGV2
ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgcWVtdS1hcm0gPHFlbXUtDQo+IGFybUBu
b25nbnUub3JnPjsgcmZzdy1wYXRjaGVzQG1saXN0Lm5va2lhLmNvbQ0KPiBTdWJqZWN0OiBSZTog
W3YyXSBudmljOiBzZXQgcGVuZGluZyBzdGF0dXMgZm9yIG5vdCBhY3RpdmUgaW50ZXJydXB0cw0K
PiANCj4gT24gMzEgT2N0b2JlciAyMDE2IGF0IDA5OjExLCBLcnplbWluc2tpLCBNYXJjaW4gKE5v
a2lhIC0gUEwvV3JvY2xhdykNCj4gPG1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbT4gd3JvdGU6
DQo+ID4gUGV0ZXIsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogUGV0ZXIgTWF5ZGVsbCBbbWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4g
Pj4gPiArc3RhdGljIHZvaWQgZ2ljX3NldF9pcnFfbnZpYyhHSUNTdGF0ZSAqcywgaW50IGlycSwg
aW50IGxldmVsLA0KPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
Y20sIGludCB0YXJnZXQpIHsNCj4gPj4gPiArICAgIGlmIChsZXZlbCkgew0KPiA+PiA+ICsgICAg
ICAgIEdJQ19TRVRfTEVWRUwoaXJxLCBjbSk7DQo+ID4+ID4gKyAgICAgICAgaWYgKEdJQ19URVNU
X0VER0VfVFJJR0dFUihpcnEpIHx8IEdJQ19URVNUX0VOQUJMRUQoaXJxLCBjbSkNCj4gPj4gPiAr
ICAgICAgICAgICAgICAgIHx8ICFHSUNfVEVTVF9BQ1RJVkUoaXJxLCBjbSkpIHsNCj4gPj4gPiAr
ICAgICAgICAgICAgRFBSSU5URigiU2V0ICVkIHBlbmRpbmcgbWFzayAleFxuIiwgaXJxLCB0YXJn
ZXQpOw0KPiA+PiA+ICsgICAgICAgICAgICBHSUNfU0VUX1BFTkRJTkcoaXJxLCB0YXJnZXQpOw0K
PiA+PiA+ICsgICAgICAgIH0NCj4gPj4NCj4gPj4gV2h5IGlzIEdJQ19URVNUX0VOQUJMRUQoKSBp
biB0aGlzIGNvbmRpdGlvbiwgd2hlbiB0aGUgaWRlYSBpcyB0aGF0IHdlDQo+ID4+IGRvbid0IGNh
cmUgYWJvdXQgdGhlIGVuYWJsZWQgc3RhdHVzIGZvciB3aGV0aGVyIHdlIGNhbiBwZW5kIHRoZQ0K
PiBpbnRlcnJ1cHQ/DQo+ID4+DQo+ID4+IEkgdGhpbmsgdGhpcyBzaG91bGQgYWN0dWFsbHkganVz
dCBhbHdheXMgZG8NCj4gPj4gICAgR0lDX1NFVF9QRU5ESU5HKGlycSwgdGFyZ2V0KQ0KPiA+PiB3
aGVuZXZlciBsZXZlbCBpcyBoaWdoDQo+ID4+DQo+ID4+IGJlY2F1c2U6DQo+ID4+ICAoMSkgcGVu
ZGluZyBzdGF0dXMgY2FuIGJlIHNldCBmb3IgZGlzYWJsZWQgaW50ZXJydXB0cw0KPiA+PiAgKDIp
IGVkZ2UtdHJpZ2dlcmVkIElSUXMgZGVmaW5pdGVseSBhbHdheXMgcmUtcGVuZCBvbiByaXNpbmcg
ZWRnZQ0KPiA+PiAgKDMpIEkgdGhpbmsgbGV2ZWwtdHJpZ2dlcmVkIElSUXMgZG8gdG9vIChpdCdz
IGEgYml0DQo+ID4+ICAgICAgbGVzcyBjbGVhciBpbiB0aGUgZG9jcywgYnV0IERVSTA1NTJBIDQu
Mi45IHNheXMgd2UgcGVuZCBvbg0KPiA+PiAgICAgIGEgcmlzaW5nIGVkZ2UgYW5kIGRvZXNuJ3Qg
c2F5IHRoYXQgYXBwbGllcyBvbmx5IHRvIGVkZ2UNCj4gPj4gICAgICB0cmlnZ2VyZWQgSVJRcykN
Cj4gPj4NCj4gPj4gSSBkb24ndCBoYXZlIGFueSByZWFsIGhhcmR3YXJlIHRvIGhhbmQgdG8gdGVz
dCBhZ2FpbnN0LCB0aG91Z2guDQo+ID4+DQo+ID4gWWVzLCBpdCB3b3JrcyBleGFjdGx5IGFzIHlv
dSdyZSBzYXlpbmcgKGNoZWNrZWQgb24gSFcpLCBpZiBsZXZlbCBpcw0KPiA+IHN0aWxsIGhpZ2gg
YWZ0ZXIgZXhpdCBpbnRlcnJ1cHQgaGFuZGxlciwgaW50ZXJydXB0IGlzIHJlLXBlbmQuDQo+IA0K
PiAiYWZ0ZXIgZXhpdGluZyBpbnRlcnJ1cHQgaGFuZGxlciIgaXMgdGhlIHdyb25nIGNvbmRpdGlv
biB0byBjaGVjay4NCj4gWW91IG5lZWQgdG86DQo+ICAqIGNhdXNlIHRoZSBpbnRlcnJ1cHQgbGlu
ZSB0byBiZSBzZXQNCj4gICogZW50ZXIgdGhlIGludGVycnVwdCBoYW5kbGVyIGFzIGEgcmVzdWx0
IChpbnQgYmVjb21lcyBhY3RpdmUpDQo+ICAqIGNhdXNlIHRoZSBpbnRlcnJ1cHQgbGluZSB0byBi
ZSBsb3dlcmVkICh3aGlsZSBpbiB0aGUgaGFuZGxlcikNCj4gICogY2F1c2UgdGhlIGludGVycnVw
dCBsaW5lIHRvIGJlIHNldCBhZ2FpbiAoc3RpbGwgaW4gdGhlIGhhbmRsZXIpDQo+ICAqIGNoZWNr
IHRoZSBpbnRlcnJ1cHQgcGVuZGluZyBzdGF0ZSAoc3RpbGwgaW4gdGhlIGhhbmRsZXIpDQo+DQpJ
IHBlcmZvcm1lZCB0aGlzIHRlc3QsIGFuZCB3aGVuIHdlIGFyZSBpbiBpbnRlcnJ1cHQgaGFuZGxl
ciAoY29uc3RhbnRseQ0KcG9vbGluZyBwZW5kaW5nIGJpdCkgaW50ZXJydXB0IGlzIHJlLXBlbmQg
anVzdCBhZnRlciBsaW5lIGlzIHNldCBhZ2Fpbi4NClYzIGJlaGF2ZXMgaW4gdGhlIHNhbWUgd2F5
Lg0KDQpUaGFua3MsDQpNYXJjaW4NCg0KPiBJZiB5b3Ugb25seSBjaGVjayB0aGUgcGVuZGluZyBz
dGF0ZSBhZnRlciBleGl0aW5nIHRoZSBoYW5kbGVyLCB0aGVuIHlvdSBjYW4ndA0KPiB0ZWxsIHdo
ZXRoZXIgaXQgd2FzIHBlbmRlZCBvbiB0aGUgcmlzaW5nIGVkZ2Ugd2hpbGUgYWN0aXZlLCBvciBm
b3IgdGhlICJyZS0NCj4gcGVuZCBpZiBoaWdoIHdoZW4gd2UgbGVhdmUgdGhlIGludGVycnVwdCBo
YW5kbGVyIi4gV2Uga25vdyB0aGUgaGFyZHdhcmUNCj4gZG9lcyB0aGUgbGF0dGVyLCBpdCdzIHRo
ZSBmb3JtZXIgd2UncmUgdW5zdXJlIGFib3V0Lg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K
