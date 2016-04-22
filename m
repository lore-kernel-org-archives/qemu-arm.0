Received: by 10.25.208.194 with SMTP id h185csp714595lfg;
        Fri, 22 Apr 2016 04:44:49 -0700 (PDT)
X-Received: by 10.55.90.130 with SMTP id o124mr4291414qkb.178.1461325489388;
        Fri, 22 Apr 2016 04:44:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m63si3216703qkf.280.2016.04.22.04.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 04:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:59905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atZVw-0006Qb-ST
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 07:44:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZVt-0006L6-5d
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZVr-0002JW-Ms
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:44:45 -0400
Received: from mail-bl2on0132.outbound.protection.outlook.com
	([65.55.169.132]:17409
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1atZVm-0002IX-Oo; Fri, 22 Apr 2016 07:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/4iZ7er8nMmAOXj5bei/bQo9Moqzv1ff9J3yz2eYT+M=;
	b=j0xi03iwL+OqwKSv18Pno/qIU2zkLcTefrQ9XjNLL8T+7qdnwVG7sviCgzJiLodTtn/obnZlAQxUgqvFZnaZKKrw43VtzF/lFRXro2BG4jhefHX2NXZtvsS8RxQcaqFPlWHnxITZ2jMoqQVTZQojJKxnaWT4OcD6MKdjwK45/sw=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.466.19; Fri, 22 Apr 2016 11:44:36 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0466.023; Fri, 22 Apr 2016 11:44:36 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Stephen Warren
	<swarren@wwwdotorg.org>
Thread-Topic: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
	querying framebuffer
Thread-Index: AQHRm8u+qM+NdH2KakOQE6S3pLfMN5+UYRwAgAABQYCAAAW/gIAAB6kAgAAG0QCAACFSgIAA/qeAgABEuZA=
Date: Fri, 22 Apr 2016 11:44:36 +0000
Message-ID: <BLUPR0301MB2034E26C749A161446AAB1389E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
	<CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
In-Reply-To: <CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [82.50.189.71]
x-ms-office365-filtering-correlation-id: 55eaa26a-3148-4fd0-d71d-08d36aa37b37
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:NQh1+iasy7Fk29vD0fHhfB76CZwWu48fVgYEbuqg22cKZ5jnnziQlsRXkb+2Ymh8IrGRPqrST4S9QVwoc05rrgALla81K2pFjTrzVIZTpE1c6t+4J7JOmmhIqm7hBUIvExwPiJDzku62LSshoh4/mLV4NUlEDAwl799uYHZhSTLA6+Chl45SSXswVRYD+P7r;
	24:DU2Ct2dS47TRBJRPzYPYIxFr0Tfzn4Us5zIrCGeAHdbXbpIPrFvBtDGXjWyRw2wDFli1bGz1JJWhFBcQokV5UnfJr6iRvNzFqEBfYpBzcsU=;
	7:+iNfqwVsUtHu2JG7hDZFzVp578Su1xeMhUXVHIR1itYW8gavioNkn/gs9pCt558KFcKe3RmbZtA0WZ2jvlgqbwkk6/qJ0wTXLkfp+NBCgMO745gdctDprEYMHi1yH2018/QCbS5nE4awHJoL5YRGWhYLsj69oIOXRunNhXjyPBZT5qwvXxlkZ6fnqdHW5Ml2L+8/rfI2Fl/lTAgX1t9nbkl1Mt0BAKtLoit/yG9pGTpjd176EiChQAoM2HokhYLr
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB203422E46EBAB74426B574029E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101521026)(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(53754006)(24454002)(377454003)(4326007)(5002640100001)(81166005)(77096005)(87936001)(189998001)(5001770100001)(1220700001)(74316001)(1096002)(5003600100002)(93886004)(5004730100002)(122556002)(50986999)(86362001)(86612001)(10400500002)(11100500001)(92566002)(3280700002)(3660700001)(10290500002)(5005710100001)(2900100001)(2950100001)(10090500001)(76176999)(54356999)(33656002)(66066001)(5008740100001)(9686002)(106116001)(3846002)(2906002)(19580395003)(586003)(19580405001)(6116002)(102836003)(15760500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2016 11:44:36.7436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.132
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, QEMU
	Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>, Paolo
	Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GhIIc04Cuv6r

SGkgYWxsLA0KDQo+IEZyb206IFBldGVyIENyb3N0aHdhaXRlIFttYWlsdG86Y3Jvc3Rod2FpdGVw
ZXRlckBnbWFpbC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgMjIgQXByaWwgMjAxNiAwOToxOA0KPiAN
Cj4gT24gVGh1LCBBcHIgMjEsIDIwMTYgYXQgOTowNiBBTSwgU3RlcGhlbiBXYXJyZW4NCj4gPHN3
YXJyZW5Ad3d3ZG90b3JnLm9yZz4gd3JvdGU6DQo+ID4gT24gMDQvMjEvMjAxNiAwODowNyBBTSwg
U3lsdmFpbiBHYXJyaWd1ZXMgd3JvdGU6DQo+ID4+DQo+ID4+IExlIDIxIGF2ci4gMjAxNiDDoCAx
NTo0MiwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiBhDQo+ID4+IMOp
Y3JpdA0KPiA+PiA6DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IFRoZXJlIG1heSBiZSBzb21ldGhpbmcg
d2UgY2FuIGRvIGhlcmUgdG8gbWFrZSBGcmVlQlNEJ3MgbGlmZSBlYXNpZXIsDQo+ID4+PiBidXQg
d2UgZGVmaW5pdGVseSBjYW4ndCBkbyBpdCBvbiB0aGUgZXZlIG9mIGEgcmVsZWFzZS4NCj4gPj4N
Cj4gPj4NCj4gPj4gSSBkaWRu4oCZdCBrbm93IGl0IHdhcyByZWxlYXNlIGRheSwgbXkgdGltaW5n
IGlzIG5vdCBwZXJmZWN0IHRoZW4sDQo+ID4+IHNvcnJ5IGFib3V0IHRoYXQsIEkgZGlkbuKAmXQg
aW50ZW5kIHRvIHB1dCBzdHJlc3Mgb24geW91IGd1eXMgdG9kYXkuDQo+ID4+IExpa2UgeW91IG1l
bnRpb25lZCwgdGhlIExpbnV4IGJvb3QgcHJvdG9jb2wgZG9lc27igJl0IG1hbmRhdGUgYW55DQo+
ID4+IGxvYWRpbmcgYWRkcmVzcywgaGVuY2UgdGhlIHBvc3NpYmlsaXR5IHRvIHNldCBpdCBvbiB0
aGUgY29tbWFuZCBsaW5lLg0KPiA+PiBJdCB3b3VsZCBiZW5lZml0IG5vdCBvbmx5IHRvIEZyZWVC
U0QgKHdoaWNoIGlzIHN0cmljdGx5IExpbnV4IGJvb3QNCj4gPj4gQUJJIGNvbXBsaWFudCBCVFcg
LSB0aGF0IGlzIGhvdyBJIGZvdW5kIHRoZSBxZW11IGJvb3Rsb2FkZXIgYnVnIGFuZA0KPiA+PiBm
aXhlZCBpdCBpbg0KPiA+PiBiNDg1MGU1KSBidXQgYWxsIG90aGVyIE9TLg0KPiA+PiBPbiB0aGUg
cmVhbCBoYXJkd2FyZSBSYXNwYmVycnkgUGksIHRoZXJlIGlzIHRoZSBrZXJuZWxfYWRkcmVzcw0K
PiA+PiBmaXJtd2FyZSBmZWF0dXJlIHdoaWNoIGVuYWJsZSB0byBzZXQgdGhlIGtlcm5lbCBsb2Fk
IGFkZHJlc3MuIFdvdWxkDQo+ID4+IGJlIG5lYXQgdG8gaGF2ZSBpdCAqc29tZWRheSogaW4gcWVt
dSBmb3IgYW55IGJvYXJkIGlmIGl0IGlzIG5vdCB0b28gaGFyZCB0bw0KPiBpbXBsZW1lbnQuDQo+
ID4NCj4gPg0KPiA+IEl0IHdvdWxkIGluZGVlZCBiZSBuaWNlIGlmIHFlbXUgZm9yIHRoZSBQaSBp
bXBsZW1lbnRlZCB0aGUgZXhhY3Qgc2FtZQ0KPiA+IGJvb3Rsb2FkZXIgc2V0dXAgYXMgcmVhbCBI
VyBkb2VzLiBUaGF0IGlzLCBsb2FkaW5nIGJvb3QgaW1hZ2VzIGZyb20NCj4gPiB0aGUgRkFUIHBh
cnRpdGlvbiBvbiB0aGUgU0QgY2FyZCwgcGFyc2luZyBjb25maWcudHh0LCBldGMuDQo+ID4NCj4g
PiBJZGVhbGx5IGFzIHdhcyBtZW50aW9uZWQgZWFybGllciB0aGlzIHdvdWxkIGJlIGRvbmUgYnkg
c2ltcGx5DQo+ID4gZXhlY3V0aW5nIHRoZSBleGlzdGluZyBib290bG9hZGVyIHVuZGVyIGVtdWxh
dGlvbiwgcmF0aGVyIHRoYW4NCj4gPiBidWlsZGluZyBhbGwgdGhhdCBjb2RlIGludG8gcWVtdS4g
SG93ZXZlciwgaW4gdGhlIFBpIGNhc2UsIHRoZQ0KPiA+IGJvb3Rsb2FkZXIgcnVucyBvbiB0aGUg
VmlkZW9Db3JlIChhIHNlcGFyYXRlIG5vbi1BUk0gQ1BVKSwgc28gaXNuJ3QNCj4gPiAoYW5kIGxp
a2VseSB3b24ndCBiZSBzaW5jZSBJSVVDIGl0IGlzbid0IGZ1bGx5IGRvY3VtZW50ZWQpIGVtdWxh
dGVkIGJ5DQo+ID4gcWVtdS4gYnkgdGhlIHRpbWUgdGhlIEFSTSBDUFUgcnVucywgZXZlcnl0aGlu
ZyAoa2VybmVsLCBEVEIvQVRBR1MsIEFSTQ0KPiA+IGJvb3Qgc3R1YiwgLi4uKSBpcyBhbHJlYWR5
IGxvYWRlZCBpbnRvIFJBTSwgdGhlIGRpc3BsYXkgaXMgYWxyZWFkeQ0KPiA+IHByb2JlZCBvdmVy
IEhETUkgYW5kIHRoZSBjb250cm9sbGVyIHNjYW5uaW5nIG91dCBhIGR1bW15IGltYWdlLCBldGMu
DQo+ID4NCj4gPiBTbyBJIHRoaW5rIGlmIHRoYXQgd2VyZSB0byBiZSBzdXBwb3J0ZWQsIGl0J2Qg
aGF2ZSB0byBiZSBjb2RlZCBpbnRvDQo+ID4gcWVtdS4gSXMgdGhhdCBzb21ldGhpbmcgdGhhdCBj
b3VsZCBoYXBwZW4sIG9yIHdvdWxkIHN1Y2ggcGF0Y2hlcyBub3QNCj4gPiBmaXQgcWVtdSdzIG1v
ZGVsIHdlbGw/DQo+IA0KPiBJIG1hZGUgaGFsZiBhIHN0YXJ0IG9uIHRoaXMgcHJvamVjdCBidXQg
aGFkIHRvIHNoZWx2ZSBpdC4NCj4gDQo+IFRoZSBoYXJkIHBhcnQgaXMgdGhlIEZBVCBmaWxlc3lz
dGVtLiBUaGUgYmFzaWMgYXBwcm9hY2ggSSBzdGFydGVkIG9uIHdhcyB0byBsaW5rDQo+IGluIHRo
ZSByZWxldmFudCBiaXRzIG9mIHRoZSBHTlUgbXRvb2xzIHNvIFFFTVUgY2FuIHBva2UgYXJvdW5k
IGluIGEgRkFUDQo+IGZpbGVzeXN0ZW0gaG9zdGVkIG9uIGEgYmxvY2sgZGV2aWNlLiBUaGVuIGp1
c3QgbW91bnQgdGhlIFNEIGNhcmQgYW5kIGVtdWxhdGUNCj4gdGhlIGJvb3QgbG9naWMgb2YgdGhl
IFZpZGVvQ29yZSBib290bG9hZGVyLg0KPiBUaGlzIGFtb3VudCBvZiBuZXcgY29kZSBzaG91bGQg
YWN0dWFsbHkgYmUgcHJldHR5IHNtYWxsLCBhcyB0aGUgRlMgZHJpdmVyIGlzDQo+IGhhbmRsZWQg
YnkgbXRvb2xzIGFuZCB0aGUgU0RIQ0kgY2FuIGJlIHNob3J0ZWQgYnkganVzdCBoYXZpbmcgdGhp
cyBhbHRlcm5hdGUNCj4gYm9vdGxvYWRlciBnbyBkaXJlY3QgdG8gdGhlIGJsb2NrIGRldmljZSAo
ZmlzaCB0aGUgYmxvY2tkZXYgb3V0IGZyb20gdGhlIFNEDQo+IGNhcmQpLg0KDQpZb3UgZ290IGZ1
cnRoZXIgb24gdGhpcyB0aGFuIEkgZGlkLiBJIGNvbnNpZGVyZWQgYSBjb3VwbGUgb2Ygb3B0aW9u
cywgb2YgdmFyeWluZyBjb21wbGV4aXR5L2NvbXBhdGliaWxpdHk6DQoNCiAwLiBUaGUgc3RhdHVz
IHF1bzogd2Ugc3VwcG9ydCAta2VybmVsIChmb3IgTGludXggaW1hZ2VzKSBhbmQgLWJpb3MgKGUu
Zy4gV2luZG93cyksIGJ1dCBvdGhlcndpc2UgYWxsIHRoZSBvcHRpb25zIHRoYXQgY2FuIGJlIHNl
dCBpbiBjb25maWcudHh0IGFyZSB0cmVhdGVkIGFzIHRoZSBkZWZhdWx0cy4gRm9yIGV4YW1wbGUs
IC1iaW9zIGltYWdlcyBhcmUgYWx3YXlzIGxvYWRlZCBhdCAweDgwMDAuIEFkZGl0aW9uYWxseSwg
ZnJhbWVidWZmZXIgcGFyYW1ldGVycyBjYW4gYmUgc2V0IGRpcmVjdGx5IGZyb20gdGhlIGNvbW1h
bmQgbGluZSAoZS5nLiBXaW5kb3dzIHdhbnRzIC1nbG9iYWwgYmNtMjgzNS1mYi5waXhvPTApLg0K
IDEuIE1vcmUgcGktc3BlY2lmaWMgcGFyYW1ldGVycyBpbiB0aGUgbGluZSBvZiB0aGUgZnJhbWVi
dWZmZXIgcGFyYW1ldGVycyBhYm92ZSwgdG8gY29udHJvbCB0aGluZ3MgbGlrZSB0aGUgaW1hZ2Ug
bG9hZCBhZGRyZXNzLCBhbmQgbWF5YmUgdG8gZW5hYmxlIHRydXN0em9uZSBib290IGFraW4gdG8g
Y29uZmlnLnR4dCdzIGtlcm5lbC1vbGQ9MS4NCiAyLiBDb2RlIHRvIHBhcnNlIGNvbmZpZy50eHQg
YW5kIHNldCB0aGUgcGFyYW1ldGVycyBhYm92ZS4NCiAzLiBDb2RlIHRvIGVtdWxhdGUgdGhlIGJv
b3Rsb2FkZXIgZW50aXJlbHksIHB1bGxpbmcgY29uZmlnLnR4dCBhbmQgYWxsIHRoZSByZWxldmFu
dCBib290IGJpdHMgb3V0IG9mIGFuIFNEIGltYWdlICh0aGlzIGlzIHdoYXQgUGV0ZXIgZGVzY3Jp
YmVzIGFib3ZlKS4NCiA0LiBBbiBBUk0tYmFzZWQgcmVpbXBsZW1lbnRhdGlvbiBvZiB0aGUgYm9v
dGxvYWRlciwgcnVubmluZyB1bmRlciBlbXVsYXRpb24uDQoNCkkgZGlzY2FyZGVkIGV2ZW4gY29u
c2lkZXJpbmcgb3B0aW9uIDMgYmVjYXVzZSBJIGFzc3VtZWQgeW91IHdvdWxkbid0IHdhbnQgYSBG
QVQgaW1wbGVtZW50YXRpb24gbGlua2VkIGludG8gcWVtdS4gQW5kIEknbSBub3QgaW5jbGluZWQg
dG8gYWRkIGluaS1wYXJzaW5nIGNvZGUsIHNvIG15IGd1dCBmZWVsaW5nIHdhcyB0byBnbyBhIGxp
dHRsZSBmdXJ0aGVyIG9uIG9wdGlvbiAxIGFuZCBhZGQgcGFyYW1ldGVycyB0byB0aGUgcmFzcGkg
bWFjaGluZXMgKEkgYXNzdW1lIHRoaXMgaXMgcG9zc2libGU/KSBmb3IgYmFzaWMgdGhpbmdzIGxp
a2UgdGhlIGxvYWQgYWRkcmVzcywgYW5kIHJlbHkgb24gdXNlcnMgdG8gdHJhbnNsYXRlIGNvbmZp
Zy50eHQgc2V0dGluZ3MgaW50byBjb21tYW5kLWxpbmUgcGFyYW1ldGVycy4NCg0KQW5kcmV3DQo=
