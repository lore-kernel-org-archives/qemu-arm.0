Received: by 10.25.27.66 with SMTP id b63csp349586lfb;
        Fri, 3 Jun 2016 09:46:00 -0700 (PDT)
X-Received: by 10.55.67.21 with SMTP id q21mr4311882qka.49.1464972360252;
        Fri, 03 Jun 2016 09:46:00 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j129si2853331qkd.267.2016.06.03.09.46.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 09:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8sER-0006wQ-My
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 12:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1b8sDN-0006LI-Am
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 12:44:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1b8sDI-0006uk-9z
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 12:44:52 -0400
Received: from mail-db3on0089.outbound.protection.outlook.com
	([157.55.234.89]:4384
	helo=emea01-db3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>)
	id 1b8sDH-0006tx-P0; Fri, 03 Jun 2016 12:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=09Ln8OaIl5DnWVnD7DYiSVGRuEThPdshTSq6OvGA574=;
	b=Y/4Rrgd43+OnU4ycPXcKKLWMnnkoHD9sm69UXJm70F67TK+WiVtp3+CZhUDB+1V7Hs9eTihdn1opZycqIMCbyx0z0nvEW7lmCBHScuZ/K5j//Ctra31PKMqmDqyd/q+JBDmNygSMxfrIH9daDFOtw3/BDsSS06herr0fZoxParM=
Received: from AM2PR04MB0739.eurprd04.prod.outlook.com (10.160.55.25) by
	HE1PR04MB1243.eurprd04.prod.outlook.com (10.162.249.156) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Fri, 3 Jun 2016 16:44:45 +0000
Received: from AM2PR04MB0739.eurprd04.prod.outlook.com ([10.160.55.25]) by
	AM2PR04MB0739.eurprd04.prod.outlook.com ([10.160.55.25]) with mapi id
	15.01.0511.008; Fri, 3 Jun 2016 16:44:45 +0000
From: Mihai Claudiu Caraman <mike.caraman@nxp.com>
To: Alexander Graf <agraf@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie controller node as
	dma-coherent
Thread-Index: AQHRvMs6EGSIKBfOdUWf0RWkl6tcEp/XyygwgAAGM4CAAABTMIAADSgAgAAR4cA=
Date: Fri, 3 Jun 2016 16:44:44 +0000
Message-ID: <AM2PR04MB073968FDB5D73E909939600E84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
	<CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
	<AM2PR04MB07394390024600CB1DD9918084590@AM2PR04MB0739.eurprd04.prod.outlook.com>
	<5751A180.8040407@suse.de>
In-Reply-To: <5751A180.8040407@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
	header.d=none;suse.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [188.26.180.105]
x-ms-office365-filtering-correlation-id: 7cd2394d-f152-46ba-0ada-08d38bce5e52
x-microsoft-exchange-diagnostics: 1; HE1PR04MB1243;
	5:mf0dKViqQd9/ju92DCXdg4iuurdCBb+1n2vukX7fEMRMWgdTVRGnq3Vhu0joI+pkN5JGJwb7DbnkIiR1PhmonaC7oO/kEVNw8LFQOaeVwZnBDe9Gm2LF1fq4ZZXGJIfrK2oa5p5rOxkj/HSSjaGrjw==;
	24:Ya71zO/hTGljrY3kePa/yesCYwW4S8o0QW+fMfLuXwKg2ONKTzAFQ5DcaXKUK9iVYBShE3igEXQ7vqORWqDpiHJkCZy3LUzSe6r/+jLj4sg=;
	7:jTjfeMrt8SYBCSX5cnJRQC3z5AO2+wsvnYxImdS+2Ii4WaPnJvlfv89ebAhiss3gUSTAj1v5TYqHqOWYppiKLIYa+dpsOMmN403S1pzKL1DxosyM9iUNMQsSD8zgfp8c+vPjjmD8DdNXJXJXm8yCQGVNtl2Eb2vfo+rM55CtQ2n6hSKhY9DhErOD9dhqHdsqAGZdpHAYkr18YxvapBgeSXp9w2j5FI8exbe/SE7Eeyg=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR04MB1243;
x-microsoft-antispam-prvs: <HE1PR04MB124362171C1022C7883751D184590@HE1PR04MB1243.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:HE1PR04MB1243; BCL:0; PCL:0; RULEID:; SRVR:HE1PR04MB1243; 
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(13464003)(377454003)(24454002)(93886004)(19580405001)(2950100001)(2900100001)(189998001)(2906002)(74316001)(5001770100001)(586003)(81166006)(6116002)(102836003)(66066001)(3846002)(19580395003)(77096005)(3660700001)(11100500001)(106116001)(4326007)(76176999)(5004730100002)(5008740100001)(3280700002)(8936002)(87936001)(86362001)(8676002)(122556002)(5002640100001)(33656002)(76576001)(9686002)(92566002)(10400500002)(5003600100002)(50986999)(54356999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR04MB1243;
	H:AM2PR04MB0739.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2016 16:44:44.8830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB1243
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.55.234.89
Subject: Re: [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie controller node as
 dma-coherent
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CklhrWamRAyd

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBHcmFmIFttYWlsdG86
YWdyYWZAc3VzZS5kZV0gDQpTZW50OiBGcmlkYXksIEp1bmUgMDMsIDIwMTYgNjoyNiBQTQ0KVG86
IE1paGFpIENsYXVkaXUgQ2FyYW1hbiA8bWlrZS5jYXJhbWFuQG54cC5jb20+OyBQZXRlciBNYXlk
ZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IENjOiBCb2dkYW4gUHVyY2FyZWF0YSA8
Ym9nZGFuLnB1cmNhcmVhdGFAbnhwLmNvbT47IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBu
b25nbnUub3JnPjsgUGV0ZXIgQ3Jvc3Rod2FpdGUgPGNyb3N0aHdhaXRlLnBldGVyQGdtYWlsLmNv
bT47IHFlbXUtYXJtIDxxZW11LWFybUBub25nbnUub3JnPjsgRXJpYyBBdWdlciA8ZXJpYy5hdWdl
ckBsaW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCAyLzJdIGFy
bS92aXJ0OiBNYXJrIHBjaWUgY29udHJvbGxlciBub2RlIGFzIGRtYS1jb2hlcmVudA0KPiANCj4g
T24gMDYvMDMvMjAxNiAwNToxNiBQTSwgTWloYWkgQ2xhdWRpdSBDYXJhbWFuIHdyb3RlOg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQZXRlciBNYXlkZWxsIFtt
YWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiA+PiBTZW50OiBGcmlkYXksIEp1bmUg
MDMsIDIwMTYgNTozOCBQTQ0KPiA+PiBUbzogTWloYWkgQ2xhdWRpdSBDYXJhbWFuIDxtaWtlLmNh
cmFtYW5AbnhwLmNvbT4NCj4gPj4gQ2M6IEJvZ2RhbiBQdXJjYXJlYXRhIDxib2dkYW4ucHVyY2Fy
ZWF0YUBueHAuY29tPjsgUUVNVSBEZXZlbG9wZXJzIA0KPiA+PiA8cWVtdS1kZXZlbEBub25nbnUu
b3JnPjsgUGV0ZXIgQ3Jvc3Rod2FpdGUgDQo+ID4+IDxjcm9zdGh3YWl0ZS5wZXRlckBnbWFpbC5j
b20+OyBBbGV4YW5kZXIgR3JhZiA8YWdyYWZAc3VzZS5kZT47IA0KPiA+PiBxZW11LWFybSA8cWVt
dS1hcm1Abm9uZ251Lm9yZz47IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAbGluYXJvLm9yZz4NCj4g
Pj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUEFUQ0ggMi8yXSBhcm0vdmlydDogTWFyayBw
Y2llIGNvbnRyb2xsZXIgDQo+ID4+IG5vZGUgYXMgZG1hLWNvaGVyZW50DQo+ID4+DQo+ID4+IE9u
IDMgSnVuZSAyMDE2IGF0IDE1OjIyLCBNaWhhaSBDbGF1ZGl1IENhcmFtYW4gPG1pa2UuY2FyYW1h
bkBueHAuY29tPiB3cm90ZToNCj4gPj4+IEluIHBhcnRpY3VsYXIgZm9yIHZpcnR1YWwgYW5kIGVt
dWxhdGVkIGRldmljZXMgdGhlIGhvc3QgQ1BVIGJlaGF2ZXMgDQo+ID4+PiBhcyBhIERNQSBjb2hl
cmVudCAnZGV2aWNlJy4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIHN0YXRlZCBpbiBwYXRjaCANCj4g
Pj4+IGRlc2NyaXB0aW9uLg0KPiA+PiBXb3VsZG4ndCB0aGF0IGltcGx5IHRoYXQgd2Ugc2hvdWxk
IGp1c3QgYWx3YXlzIGhhdmUgdGhlICJkbWEtY29oZXJlbnQiDQo+ID4+IHByb3BlcnR5IHNldCwg
YW5kIHdlIGRvbid0IG5lZWQgdG8gZG8gYW55IG9mIHRoZSBtZXNzaW5nIGFyb3VuZCBsb29raW5n
IGF0IHRoZSBob3N0IHN5c2ZzID8NCj4gPj4NCj4gPj4gdGhhbmtzDQo+ID4+IC0tIFBNTQ0KPiA+
IFdlIGNhbiBhbHdheXMgc2V0ICJkbWEtY29oZXJlbnQiIGZvciB2aXJ0dWFsIGFuZCBlbXVsYXRl
ZCBkZXZpY2VzIGJ1dCBub3QgZm9yIHBhc3N0aHJvdWdoIGRldmljZXMuIFNvIHdlIGNhbid0IGhh
dmUgb25lIFBDSWUgY29udHJvbGxlciBmb3IgYWxsIGRldmljZXMgbWFya2VkIGFzICJkbWEtY29o
ZXJlbnQiLg0KPiANCj4gVGhlIG9yaWdpbmFsIHBhdGNoIGlzIGFib3V0IHRoZSBjYXNlIHdoZXJl
IFBDSSBpcyBhbHJlYWR5IGNhY2hlIGNvaGVyZW50IG9uIHRoZSBob3N0Lg0KPg0KPiBJIHRoaW5r
IGF0IHRoZSBlbmQgb2YgdGhlIGRheSB0aGlzIGlzIHNpbXBseSBvdXRzaWRlIG9mIFFFTVUncyBz
Y29wZSB0byBkZWNpZGUuIFdoYXQgd2UgY2FuIGRvIGlzIHNldCBkbWEtY29oZXJlbnQgcGVyIGRl
ZmF1bHQgKGlmIFdpbGwgYW5kIEFyZA0KPiBhZ3JlZSkgb24gdGhlIGRlZmF1bHQgUENJZSBidXMg
YW5kIGFkZCBjb2RlIHRoYXQgYWxsb3dzIHRvIHNwYXduIGEgc2Vjb25kYXJ5IFBDSWUgYnVzIHdo
aWNoIGNhbiB0aGVuIGhhdmUgZGlmZmVyZW50IGRtYS1jb2hlcmVudCBhdHRyaWJ1dGVzIGFuZCB0
aGF0IHlvdSBjYW4gdGhlbiBwbHVnIHlvdXIgbm9uLWNvaGVyZW50IHZmaW8gZGV2aWNlcyBpbnRv
LiANCg0KQSBkbWEtY29oZXJlbnQgZGVmYXVsdCBQQ0llIGJ1cyBsb29rcyBmaW5lLg0KDQpUaGFu
a3MsDQpNaWtlDQo=
