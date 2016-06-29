Received: by 10.25.21.96 with SMTP id l93csp2034011lfi;
        Wed, 29 Jun 2016 00:52:18 -0700 (PDT)
X-Received: by 10.55.104.70 with SMTP id d67mr8126267qkc.60.1467186738602;
        Wed, 29 Jun 2016 00:52:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si2098221qke.301.2016.06.29.00.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jun 2016 00:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:41965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIAIE-0008Pg-3Y
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 03:52:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1bIAIA-0008PP-9K
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 03:52:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1bIAI7-0003h9-Jq
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 03:52:14 -0400
Received: from mail-db3on0090.outbound.protection.outlook.com
	([157.55.234.90]:29184
	helo=emea01-db3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>)
	id 1bIAI6-0003gj-VQ; Wed, 29 Jun 2016 03:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=j+1lgCSrpANcoco0gsvyhaYYs/40ZlDIjbASFtfzNqs=;
	b=YuyDdpvJPXKwWFe9M5N0V4othBNVJJQKsZHuiPuZHTTT13Ojfe52n9uE9WitHqQl/y4rjw5bZsK9RG19nHIeG7PJHxc393VeuhB8iyWynz1MDKqm84hgo+oj+jPai1dE0N7e/Q4UPuan9u4DbvyhndCPRk3qwInQLH8VMAdjfA0=
Received: from DB5PR04MB1240.eurprd04.prod.outlook.com (10.162.156.142) by
	DB5PR04MB1239.eurprd04.prod.outlook.com (10.162.156.141) with Microsoft
	SMTP Server (TLS) id 15.1.528.16; Wed, 29 Jun 2016 07:52:03 +0000
Received: from DB5PR04MB1240.eurprd04.prod.outlook.com ([10.162.156.142]) by
	DB5PR04MB1240.eurprd04.prod.outlook.com ([10.162.156.142]) with mapi id
	15.01.0528.017; Wed, 29 Jun 2016 07:52:03 +0000
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: Peter Maydell <peter.maydell@linaro.org>, Ard Biesheuvel
	<ard.biesheuvel@linaro.org>
Thread-Topic: [PATCH 2/2] arm/virt: Mark pcie controller node as dma-coherent
Thread-Index: AQHRvMrmMhN/ux/RRUa3KZa8xu+uI5/WH52AgBYVMwCAEuDMgIABJwuA
Date: Wed, 29 Jun 2016 07:52:03 +0000
Message-ID: <18bc82a0-f985-566f-c7cf-b5baaa73857d@nxp.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
	<CAKv+Gu-1g4FYEaqUWnO25oZVnq9inX_jd7B2RjWd+uhs34CPpw@mail.gmail.com>
	<CAFEAcA-p9K+Xzp2KuqTKsP__ph9ZaXNG-pfGDGTyREJEBikDaQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-p9K+Xzp2KuqTKsP__ph9ZaXNG-pfGDGTyREJEBikDaQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bogdan.purcareata@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.88.146.1]
x-ms-office365-filtering-correlation-id: c63e86ff-b7bc-4638-d617-08d39ff24264
x-microsoft-exchange-diagnostics: 1; DB5PR04MB1239;
	6:6nqUEZ3tQY7s2wSwNR11t+JzSSlzvnYMMBvFIaFdW2R2Z3X3AuzTxD0k/7ELCrZGyoFOeiOdmhj6t1JHpLycWYxc0pkgTBN619UtZlgG1xD8dC7fhXlBhXqOKia/A2XbaVlnYuaP4cK0oAb7LZPyx+oVDngD2fSRaRBivgOlNS8cF1ajy5LCYwn2zfUmvDD2bemp5UNiRs1epTmdscNI2P/PdgZlKUEi9K2DtB5aPPCuhR1OkS59EJTMdVtL8ZQYDiyWa+1pQUlaagpUu2mrpP0poUe/BaAUHwuml2fU6iFsFLLX+uFEodcyWHVN+1Z76u/3X0qhOoemO+t+T3gmvw==;
	5:s7mDSxAcNnH9g2oNb4skdVeSIE8jI9PJtzN0st84QlvLIzmy4H3JW+n+EMrNzO09OEy68oqsggV5ApUDgPIijZCZaDDdb+LzZwXTU99YMdu9rsZmDTg9l51uGIDnYpiIGkkSzys/XCgJNkt8alcv0w==;
	24:erbOfvR6B0C43tJQ7tZo7sHzUg9HaQmyRdx1bAkMmg8Dv5DLd2QQfimJ4sL2xCLKo6B0EyEdwRnrUo7FjRla6Bd9WJSZ8ptRszH9jgpVRSo=;
	7:BQKepkIPV7A98cqRFU9UmpFYcfv6/+XmN0oYw2Hz8CWZ+kXZYuvW03D0Y8I3VH6CPpufH8q1CrxQzof3lgjgZ8FrpdJqirk7+VEEaMJ+71LfYbPUgNpXn653YKyxNHlCxlJpD191KnJrXan68dOyYMWms9miNiXuX0qICMrzE0EjLzBFdyrfvS/WNHq9wyh0qz4FOPfX/D0lX+DZapaH9MYMTHM1sd/U6w0k72BoYQcEjjoRItEw65wsIcFSA0PU
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR04MB1239;
x-microsoft-antispam-prvs: <DB5PR04MB1239C88E21C0AFAAD7F4114CEA230@DB5PR04MB1239.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(100405760836317);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB5PR04MB1239; BCL:0; PCL:0; RULEID:; SRVR:DB5PR04MB1239; 
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(189002)(24454002)(199003)(93886004)(305945005)(7736002)(2900100001)(2950100001)(19580405001)(3846002)(7846002)(11100500001)(586003)(19580395003)(3660700001)(77096005)(10400500002)(8936002)(92566002)(33646002)(105586002)(5002640100001)(68736007)(106116001)(106356001)(3280700002)(31696002)(6116002)(102836003)(122556002)(31686004)(36756003)(8676002)(50986999)(5001770100001)(54356999)(4326007)(76176999)(101416001)(86362001)(81156014)(81166006)(97736004)(2906002)(66066001)(87936001)(189998001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR04MB1239;
	H:DB5PR04MB1240.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C6D3DC2A7A4094CADC1C2D56688F2EE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2016 07:52:03.2647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB1239
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.55.234.90
Subject: Re: [Qemu-arm] [PATCH 2/2] arm/virt: Mark pcie controller node as
 dma-coherent
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
Cc: Eric Auger <eric.auger@linaro.org>, Will Deacon <will.deacon@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hTASRJq78kOf

T24gMjguMDYuMjAxNiAxNzoxNiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gMTYgSnVuZSAy
MDE2IGF0IDE0OjU4LCBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4g
d3JvdGU6DQo+PiBPbiAyIEp1bmUgMjAxNiBhdCAxNDo0NSwgQWxleGFuZGVyIEdyYWYgPGFncmFm
QHN1c2UuZGU+IHdyb3RlOg0KPj4+IE9uIDAyLjA2LjE2IDE0OjMyLCBQZXRlciBNYXlkZWxsIHdy
b3RlOg0KPj4+PiBUaGlzIHBhdGNoIHNlZW1zIHRvIGNoYW5nZSB0aGUgcHJvcGVydHkgb2YgdGhl
IGVtdWxhdGVkIFBDSWUgY29udHJvbGxlcg0KPj4+PiBiYXNlZCBvbiB0aGUgaG9zdCBQQ0llIGNv
bnRyb2xsZXIgZXZlbiBpZiB3ZSdyZSBub3QgZG9pbmcgYW55IFBDSWUNCj4+Pj4gcGFzc3Rocm91
Z2ggYXQgYWxsLiBUaGF0IHNlZW1zIGRlZmluaXRlbHkgd3JvbmcgdG8gbWUuDQo+Pj4+DQo+Pj4+
IChTaG91bGQgdGhlIHB1cmVseS1lbXVsYXRlZCBjYXNlIGJlIG1hcmtlZCBETUEtY29oZXJlbnQg
YW55d2F5Pw0KPj4+PiBJIGZvcmdldCB0aGUgZmlkZGx5IGRldGFpbHMuLi4pDQo+Pj4NCj4+PiBJ
IGRvIHRvbywgbGV0J3MgaW52b2x2ZSBhIGZldyBwZW9wbGUgd2hvIGtub3cgOikuIE5vdCBleHBv
c2luZyBpdCBhcw0KPj4+IGNvaGVyZW50IGlzIGRlZmluaXRlbHkgd3JvbmcsIGJ1dCB3aGV0aGVy
ICJkbWEtY29oZXJlbnQiIGlzIHRoZSByaWdodA0KPj4+IGNob2ljZSBJIGRvbid0IGtub3cuDQo+
DQo+PiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIGl0LCB0aGUgcHVyZWx5IGVtdWxhdGVkIGNhc2Ug
c2hvdWxkIGJlIG1hcmtlZA0KPj4gRE1BIGNvaGVyZW50LCBzaW5jZSBvdGhlcndpc2UsIGd1ZXN0
IGRyaXZlcnMgbWF5IHBlcmZvcm0gY2FjaGUNCj4+IG1haW50ZW5hbmNlIHRoYXQgdGhlIGhvc3Qg
aXMgbm90IGV4cGVjdGluZy4gVGhpcyBpcyBlc3BlY2lhbGx5IGhhcm1mdWwNCj4+IGlmIHRoZSBn
dWVzdCBpbnZhbGlkYXRlcyB0aGUgY2FjaGVzIGFmdGVyIGEgZGV2aWNlIHRvIG1lbW9yeSB0cmFu
c2ZlciwNCj4+IHdoaWNoIG1heSByZXN1bHQgaW4gZGF0YSBiZWluZyBsb3N0IGlmIHRoZSBkYXRh
IHdhcyBvbmx5IHByZXNlbnQgaW4NCj4+IHRoZSBjYWNoZXMgdG8gYmVnaW4gd2l0aCAod2hpY2gg
aXMgdGhlIGNhc2UgZm9yIGRldmljZXMgdGhhdCBhcmUNCj4+IGVtdWxhdGVkIGJ5IHRoZSBob3N0
KQ0KPg0KPiBTbyB0aGUgY29uc2Vuc3VzIHNlZW1zIHRvIGJlIHRoYXQ6DQo+ICAqIGVtdWxhdGVk
IFBDSSBkZXZpY2VzIGRlZmluaXRlbHkgbmVlZCBkbWEtY29oZXJlbnQNCj4gICogcGFzc3Rocm91
Z2ggZGV2aWNlcyB3aGVyZSB0aGUgaG9zdCBjb250cm9sbGVyIGlzIGRtYS1jb2hlcmVudA0KPiAg
ICBhbHNvIG5lZWQgZG1hLWNvaGVyZW50DQo+ICAqIHBhc3N0aHJvdWdoIGRldmljZXMgd2hlcmUg
dGhlIGhvc3QgY29udHJvbGxlciBpcyBub3QgZG1hLWNvaGVyZW50DQo+ICAgIGRvbid0IHdhbnQg
ZG1hLWNvaGVyZW50LCBidXQgd2UgaGF2ZSB0byBzZXQgdGhpbmdzIHBlci1QQ0ktY29udHJvbGxl
cg0KPg0KPiBXb3VsZCBzb21lYm9keSBsaWtlIHRvIHdyaXRlIGEgcGF0Y2ggd2hpY2gganVzdCB1
bmNvbmRpdGlvbmFsbHkNCj4gc2V0cyB0aGUgZG1hLWNvaGVyZW50IHByb3BlcnR5IG9uIG91ciBQ
Q0kgY29udHJvbGxlciBkdCBub2RlPw0KDQpJIHdpbGwgc2VuZCB0aGlzIHBhdGNoIGxhdGVyIHRv
ZGF5Lg0KDQpCZXN0IHJlZ2FyZHMsDQpCb2dkYW4gUC4NCg0KPiBUaGF0IHNlZW1zIGEgY2xlYXIg
aW1wcm92ZW1lbnQgb24gd2hhdCB3ZSBoYXZlIGF0IHRoZSBtb21lbnQuDQo+IFdlIGNhbiBsb29r
IGF0IHdoZXRoZXIgd2Ugd2FudCB0byBzdXBwb3J0IHBhc3N0aHJvdWdoIGZyb20gYQ0KPiBub24t
ZG1hLWNvaGVyZW50IGhvc3QgcGNpIGNvbnRyb2xsZXIgKHZpYSBhIDJuZCBndWVzdCBwY2kgY29u
dHJvbGxlcj8pDQo+IGxhdGVyLi4uDQo+DQo+IHRoYW5rcw0KPiAtLSBQTU0NCj4=
