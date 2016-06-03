Received: by 10.25.27.66 with SMTP id b63csp354083lfb;
        Fri, 3 Jun 2016 09:56:58 -0700 (PDT)
X-Received: by 10.55.31.140 with SMTP id n12mr4419602qkh.4.1464973018537;
        Fri, 03 Jun 2016 09:56:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f145si2922950qke.2.2016.06.03.09.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 09:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8sP3-0003lA-Vv
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 12:56:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1b8sP0-0003h3-1S
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 12:56:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1b8sOy-0001E3-VG
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 12:56:54 -0400
Received: from mail-am1on0088.outbound.protection.outlook.com
	([157.56.112.88]:1536
	helo=emea01-am1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>)
	id 1b8sOt-0001BO-43; Fri, 03 Jun 2016 12:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/fI4bE+gUIs/pY6UzmcGH4+02isCgWpz3dVI4NIcrtA=;
	b=hb1m6X0dQ5dS2hGCDfkpw0QpBjYIkKhNp7ZhEAidxyZuWt/zBAQCEZMszZXd0qcHA3e05a2FXPMgkoALuaeohfvP5CbDwscCpbAHHAmgGKYCi/ItVuLHtJ0fnaJhnuqKmV67SbMgednIJRnIVe6wMAdL+SPRGg2DM/pKSZbKNPQ=
Received: from AM2PR04MB0739.eurprd04.prod.outlook.com (10.160.55.25) by
	AM2PR04MB0739.eurprd04.prod.outlook.com (10.160.55.25) with Microsoft
	SMTP Server (TLS) id 15.1.511.8; Fri, 3 Jun 2016 14:22:49 +0000
Received: from AM2PR04MB0739.eurprd04.prod.outlook.com ([10.160.55.25]) by
	AM2PR04MB0739.eurprd04.prod.outlook.com ([10.160.55.25]) with mapi id
	15.01.0511.008; Fri, 3 Jun 2016 14:22:48 +0000
From: Mihai Claudiu Caraman <mike.caraman@nxp.com>
To: Peter Maydell <peter.maydell@linaro.org>, Bogdan Purcareata
	<bogdan.purcareata@nxp.com>
Thread-Topic: [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie controller node as
	dma-coherent
Thread-Index: AQHRvMs6EGSIKBfOdUWf0RWkl6tcEp/Xyygw
Date: Fri, 3 Jun 2016 14:22:48 +0000
Message-ID: <AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
In-Reply-To: <CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.146.1]
x-ms-office365-filtering-correlation-id: ed6d296a-f5b8-4bf8-18f8-08d38bba8a40
x-microsoft-exchange-diagnostics: 1; AM2PR04MB0739;
	5:CQy/b3yQ8IfoD04hgAmpO8LvDagB5H/NvyRRAMmVskTX7Bf3Xbsc3ux7OAhbPJ885StZ7iUeBDuiVAfJnHnRjilKaweSrJ3UR1pb1h3P7MZy1sP+2qvwbPyqkIRfnr/ugEOaUg2+0I1OZFmPSfpX3Q==;
	24:8iNMzhnKhq/WwJWjnICkcwf8qTP7Kr6vbHXQuA59wJpY59UtJWKfBYR/IwYeI7dblICatUfP4LWIHxfTQvBjbHQ3puQwncjgGuEQM6FnMJ4=;
	7:1Qfe2dJUCqY68EGNouAUfJslUABNObmmIHQ3lxdmO7OV/iGyjNzLIo29ucbqFi2FRfPkCcwI0MQFkoe588xsb7464ECfPw3iRIw3PvKK/pH1fjQ/b3f8bDVcayR4YXkOwM41KQRSLUdNqhHZ6DX+X52rcCoegf+Rc0VQ/AiileMvjbN2O23eKH2jw4nIU5yR1MKpdrbCVwNVL+WWc8MSDVy/laVfyDEs7AEn0ic6rKI=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR04MB0739;
x-microsoft-antispam-prvs: <AM2PR04MB0739FEB3E8B220005923294284590@AM2PR04MB0739.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AM2PR04MB0739; BCL:0; PCL:0; RULEID:; SRVR:AM2PR04MB0739; 
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(13464003)(24454002)(86362001)(5003600100002)(33656002)(5002640100001)(92566002)(586003)(76576001)(6116002)(102836003)(3846002)(122556002)(5008740100001)(106116001)(5004730100002)(81166006)(8676002)(74316001)(189998001)(2906002)(10400500002)(4326007)(5001770100001)(76176999)(54356999)(66066001)(19580395003)(77096005)(19580405001)(2900100001)(2950100001)(87936001)(50986999)(9686002)(8936002)(3660700001)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM2PR04MB0739;
	H:AM2PR04MB0739.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2016 14:22:48.6350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR04MB0739
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.112.88
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie
 controller node as dma-coherent
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
Cc: Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q4Z8KRl69uUI

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRZW11LWRldmVsIFttYWlsdG86
cWVtdS1kZXZlbC1ib3VuY2VzK21paGFpLmNhcmFtYW49ZnJlZXNjYWxlLmNvbUBub25nbnUub3Jn
XSBPbiBCZWhhbGYgT2YgUGV0ZXIgTWF5ZGVsbA0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAwMiwg
MjAxNiAzOjMzIFBNDQo+IFRvOiBCb2dkYW4gUHVyY2FyZWF0YSA8Ym9nZGFuLnB1cmNhcmVhdGFA
bnhwLmNvbT4NCj4gQ2M6IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsg
UGV0ZXIgQ3Jvc3Rod2FpdGUgPGNyb3N0aHdhaXRlLnBldGVyQGdtYWlsLmNvbT47IEFsZXhhbmRl
ciBHcmFmIDxhZ3JhZkBzdXNlLmRlPjsgcWVtdS1hcm0gPHFlbXUtYXJtQG5vbmdudS5vcmc+OyBF
cmljIEF1Z2VyIDxlcmljLmF1Z2VyQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUWVtdS1k
ZXZlbF0gW1BBVENIIDIvMl0gYXJtL3ZpcnQ6IE1hcmsgcGNpZSBjb250cm9sbGVyIG5vZGUgYXMg
ZG1hLWNvaGVyZW50DQo+IA0KPiBPbiAyIEp1bmUgMjAxNiBhdCAxMzoyNiwgQm9nZGFuIFB1cmNh
cmVhdGEgPGJvZ2Rhbi5wdXJjYXJlYXRhQG54cC5jb20+IHdyb3RlOg0KPiA+IEEgUENJIGRldmlj
ZSBpcyBtYXJrZWQgZWl0aGVyIGFzIGNvaGVyZW50IG9yIG5vbi1jb2hlcmVudCBiYXNlZCBvbiB0
aGUgDQo+ID4gcGNpZSBjb250cm9sbGVyICJkbWEtY29oZXJlbnQiIHByb3BlcnR5LiBUaGlzIGlz
IGZ1cnRoZXIgdXNlZCB3aGVuIA0KPiA+IGNvbmZpZ3VyaW5nIHRoZSBJT01NVSBvcHMgZm9yIHRo
ZSBkZXZpY2UgRE1BIHJlc291cmNlcyAoZS5nLiBkZXNjcmlwdG9yIHJpbmdzLCBmb3IgZTEwMDBl
KS4NCj4gPg0KPiA+IFRoaXMgZG1hLWNvaGVyZW50IHByb3BlcnR5IG5lZWRzIHRvIGJlIGNvbmZp
Z3VyZWQgaW4gdGhlIGd1ZXN0IA0KPiA+IGVudmlyb25tZW50LCBpbiBjYXNlIHRoZXJlJ3MgYSBk
aXJlY3RseSBhc3NpZ25lZCBWRklPIFBDSSBkZXZpY2UuIA0KPiA+IFNpbmNlIHRoZSBndWVzdCBv
bmx5IHJlY2VpdmVzIG9uZSBlbXVsYXRlZCBwY2llIGNvbnRyb2xsZXIgYnVzIC0gDQo+ID4gcmVn
YXJkbGVzcyBvZiB0aGUgaG9zdCBjb25maWd1cmF0aW9uIC0gYWRkIHRoaXMgcHJvcGVydHkgaWYg
dGhlcmUncyBhdCANCj4gPiBsZWFzdCBvbmUgaG9zdCBwY2llIGhvc3QgY29udHJvbGxlciB0aGF0
IGlzIERNQSBjb2hlcmVudCAodGhpcyBpbXBsaWVzIA0KPiA+IHRoYXQgdGhlIGhvc3QgaW50ZXJj
b25uZWN0IGlzIGNvaGVyZW50IGFzIHdlbGwpLg0KPiANCj4gVGhpcyBwYXRjaCBzZWVtcyB0byBj
aGFuZ2UgdGhlIHByb3BlcnR5IG9mIHRoZSBlbXVsYXRlZCBQQ0llIGNvbnRyb2xsZXIgYmFzZWQg
b24gdGhlIGhvc3QgUENJZSBjb250cm9sbGVyIGV2ZW4gaWYgd2UncmUgbm90IGRvaW5nIGFueSBQ
Q0llIHBhc3N0aHJvdWdoIGF0IGFsbC4gVGhhdCBzZWVtcyBkZWZpbml0ZWx5IHdyb25nIHRvIG1l
Lg0KPiANCj4gKFNob3VsZCB0aGUgcHVyZWx5LWVtdWxhdGVkIGNhc2UgYmUgbWFya2VkIERNQS1j
b2hlcmVudCBhbnl3YXk/DQo+IEkgZm9yZ2V0IHRoZSBmaWRkbHkgZGV0YWlscy4uLikNCj4gDQo+
IHRoYW5rcw0KPiAtLSBQTU0NCg0KSW4gcGFydGljdWxhciBmb3IgdmlydHVhbCBhbmQgZW11bGF0
ZWQgZGV2aWNlcyB0aGUgaG9zdCBDUFUgYmVoYXZlcyBhcyBhIERNQSBjb2hlcmVudCAnZGV2aWNl
Jy4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIHN0YXRlZCBpbiBwYXRjaCBkZXNjcmlwdGlvbi4NCg0K
UmVnYXJkcywNCk1pa2UNCg==
