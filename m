Received: by 10.25.27.66 with SMTP id b63csp333025lfb;
        Fri, 3 Jun 2016 09:10:11 -0700 (PDT)
X-Received: by 10.55.167.133 with SMTP id q127mr4046318qke.95.1464970211362;
        Fri, 03 Jun 2016 09:10:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 100si2790814qky.98.2016.06.03.09.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 09:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8rfm-0001tK-QQ
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 12:10:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1b8rMl-0000td-Gz
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 11:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1b8rMj-0008PI-KH
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 11:50:30 -0400
Received: from mail-db5eur01on0070.outbound.protection.outlook.com
	([104.47.2.70]:55744
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>)
	id 1b8rMe-0008Nm-NN; Fri, 03 Jun 2016 11:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=N+10xlKrKAHIXw4hxiNyRWVHNE6tB44pvE7jpiGJA9E=;
	b=QKi8VxKo8jzPpE1N0t3VCf1fbKGoY/nsY0lX2zyVbdLSRvvp1uTnno+VqPrCgYTWOFRTGyjnRVFNhawoNVqvqMx+oL36Hg1DjAjafFFZ9Av4VMytJk5gd7CPeHru38l8p2XVdohMGSbE/A7Nd3p0XJmrfXcZDq6bIsCRieoOIE4=
Received: from AM2PR04MB0739.eurprd04.prod.outlook.com (10.160.55.25) by
	AM2PR04MB0737.eurprd04.prod.outlook.com (10.160.55.23) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Fri, 3 Jun 2016 15:16:09 +0000
Received: from AM2PR04MB0739.eurprd04.prod.outlook.com ([10.160.55.25]) by
	AM2PR04MB0739.eurprd04.prod.outlook.com ([10.160.55.25]) with mapi id
	15.01.0511.008; Fri, 3 Jun 2016 15:16:07 +0000
From: Mihai Claudiu Caraman <mike.caraman@nxp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie controller node as
	dma-coherent
Thread-Index: AQHRvMs6EGSIKBfOdUWf0RWkl6tcEp/XyygwgAAGM4CAAABTMA==
Date: Fri, 3 Jun 2016 15:16:07 +0000
Message-ID: <AM2PR04MB07394390024600CB1DD9918084590@AM2PR04MB0739.eurprd04.prod.outlook.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
	<CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
In-Reply-To: <CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.146.1]
x-ms-office365-filtering-correlation-id: 5b3f95fe-4c8d-403a-c1aa-08d38bc1fcbf
x-microsoft-exchange-diagnostics: 1; AM2PR04MB0737;
	5:7W6fB2MScPjO3KRHADd73ckmieo4CkoaUzPBolfnwnqZ9YR+/guQMmGCntM3PbDUln65NNhbmOxuZ+wkrpIzWTVYSPLKAK6Axu6jhvKpA1Xwe1CPy//diRO3Ypc3diX6I3kR/0d+fiDZl/0m2gF2wg==;
	24:ab+AyUyiuSrtPPHyioFSRvru/k0bu5fYgwscYaAxDh4cBx82OdJWgtEQL9oWSPrUr8c3E0EXBwA9pUc3QXKpw7iyOzL+h6T7U6N6jr+J/+A=;
	7:qKA69rDeMPzVkIx7zkH0KQPME+O8FXVpIT2cbNqSbKLlvGGNeMkLVJ51uvvyShN6Gowr7xsd/GGgB5eK5Zx/NCgH6I8sibv+MyXuO0Ni/Bj1ObPErCOW5XiufJ9UXKZQ7i7B+u0N5Q1IGS+Vv/3Us1ji53xSHsCriMXn2A5S0X7d18b6bOWquZm5FGtn4QeuI/7aRzyoil/+Y87cwiCX+NAZxUo+XCxRHNLN0AjxBNQ=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR04MB0737;
x-microsoft-antispam-prvs: <AM2PR04MB0737C68E6EFC3CAC056B600F84590@AM2PR04MB0737.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AM2PR04MB0737; BCL:0; PCL:0; RULEID:; SRVR:AM2PR04MB0737; 
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(13464003)(24454002)(93886004)(2950100001)(2900100001)(8676002)(81166006)(50986999)(8936002)(76176999)(9686002)(86362001)(87936001)(92566002)(77096005)(76576001)(19580405001)(5008740100001)(19580395003)(54356999)(33656002)(189998001)(110136002)(66066001)(6116002)(122556002)(3660700001)(5003600100002)(106116001)(5002640100001)(74316001)(10400500002)(586003)(5004730100002)(2906002)(102836003)(4326007)(3846002)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM2PR04MB0737;
	H:AM2PR04MB0739.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2016 15:16:07.2715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR04MB0737
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.70
X-Mailman-Approved-At: Fri, 03 Jun 2016 12:10:08 -0400
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
Cc: Eric Auger <eric.auger@linaro.org>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DB7OwYUao5O6

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXSANCj4gU2VudDogRnJpZGF5LCBKdW5lIDAzLCAy
MDE2IDU6MzggUE0NCj4gVG86IE1paGFpIENsYXVkaXUgQ2FyYW1hbiA8bWlrZS5jYXJhbWFuQG54
cC5jb20+DQo+IENjOiBCb2dkYW4gUHVyY2FyZWF0YSA8Ym9nZGFuLnB1cmNhcmVhdGFAbnhwLmNv
bT47IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgUGV0ZXIgQ3Jvc3Ro
d2FpdGUgPGNyb3N0aHdhaXRlLnBldGVyQGdtYWlsLmNvbT47IEFsZXhhbmRlciBHcmFmIDxhZ3Jh
ZkBzdXNlLmRlPjsgcWVtdS1hcm0gPHFlbXUtYXJtQG5vbmdudS5vcmc+OyBFcmljIEF1Z2VyIDxl
cmljLmF1Z2VyQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUWVtdS1kZXZlbF0gW1BBVENI
IDIvMl0gYXJtL3ZpcnQ6IE1hcmsgcGNpZSBjb250cm9sbGVyIG5vZGUgYXMgZG1hLWNvaGVyZW50
DQo+IA0KPiBPbiAzIEp1bmUgMjAxNiBhdCAxNToyMiwgTWloYWkgQ2xhdWRpdSBDYXJhbWFuIDxt
aWtlLmNhcmFtYW5AbnhwLmNvbT4gd3JvdGU6DQo+ID4gSW4gcGFydGljdWxhciBmb3IgdmlydHVh
bCBhbmQgZW11bGF0ZWQgZGV2aWNlcyB0aGUgaG9zdCBDUFUgYmVoYXZlcyBhcyANCj4gPiBhIERN
QSBjb2hlcmVudCAnZGV2aWNlJy4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIHN0YXRlZCBpbiBwYXRj
aCANCj4gPiBkZXNjcmlwdGlvbi4NCj4gDQo+IFdvdWxkbid0IHRoYXQgaW1wbHkgdGhhdCB3ZSBz
aG91bGQganVzdCBhbHdheXMgaGF2ZSB0aGUgImRtYS1jb2hlcmVudCINCj4gcHJvcGVydHkgc2V0
LCBhbmQgd2UgZG9uJ3QgbmVlZCB0byBkbyBhbnkgb2YgdGhlIG1lc3NpbmcgYXJvdW5kIGxvb2tp
bmcgYXQgdGhlIGhvc3Qgc3lzZnMgPw0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0KDQpXZSBjYW4g
YWx3YXlzIHNldCAiZG1hLWNvaGVyZW50IiBmb3IgdmlydHVhbCBhbmQgZW11bGF0ZWQgZGV2aWNl
cyBidXQgbm90IGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzLiBTbyB3ZSBjYW4ndCBoYXZlIG9uZSBQ
Q0llIGNvbnRyb2xsZXIgZm9yIGFsbCBkZXZpY2VzIG1hcmtlZCBhcyAiZG1hLWNvaGVyZW50Ii4N
Cg0KUmVnYXJkcywNCk1pa2UNCg==
