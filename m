Received: by 10.25.21.96 with SMTP id l93csp1529963lfi;
        Mon, 4 Jul 2016 06:48:40 -0700 (PDT)
X-Received: by 10.200.49.50 with SMTP id g47mr18745473qtb.76.1467640120419;
        Mon, 04 Jul 2016 06:48:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si2086828qkw.39.2016.07.04.06.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 06:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:47701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK4Ep-0002OW-Pb
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 09:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bK3Rr-0005KY-94
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bK3Rn-0003Ji-52
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:58:02 -0400
Received: from mail-db5eur01on0098.outbound.protection.outlook.com
	([104.47.2.98]:56889
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bK3Rm-0003Jc-Mo
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZRpjpbuJp5NuLIo77lrdqhTnfdj1J7F4VZheHFlWftg=;
	b=QzbDavbheEk2zvSW2vzVXrcbDPsKXkJi16fssUathmZityBuhpgdPx5YGT3mcxrn9ZeX9+2VkJx81KkssE9XRFnyWc5QDu4ieBfsVoOTcr3dNe8Krd0UMWK5iPCiYO+mos/L1sF3qcMTen/YnNcMGB3f6wha1RS5gmJaIYti6Xw=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.528.16; Mon, 4 Jul 2016 12:57:56 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0528.022; Mon, 4 Jul 2016 12:57:56 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
Thread-Index: AQHR1e6c9tCcxjdIJk6LyVPiRPgd/KAIN91A
Date: Mon, 4 Jul 2016 12:57:56 +0000
Message-ID: <AM4PR0701MB2130DB6B6A3116443D7A1B7CFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-3-git-send-email-clg@kaod.org>
In-Reply-To: <1467634738-28642-3-git-send-email-clg@kaod.org>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.2.10]
x-ms-office365-filtering-correlation-id: bcfc601f-dae9-4893-0f3e-08d3a40ad19d
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2130;
	6:jL2jDw1yzodZn/4WYaK6mdZtIc4LjaHx07l1+R9QQmpxo3VL/BNIoyagVSnOxPDDSZcTFb0OT1Qoi4bFunDL+tU2tRnKtS03GVUsKXZgcnZSiZHTCYiGb9WUS+rsEn0MvytX8ZXDiEjo4HX6gRUMAUXmv/iyaY6oEidUx3nkWJDKc3SEpHi5BT+dk6Sy2DYosZMCD6VsMIr/7k4f8zNI96Yq6aT8p1NPsCZbU3IGtLPYxGy4oWUSssvYN7kQZrhFkDhT14qANPyFkYHoNeOKUxo4Iene4YEusAXAQ9awpd8=;
	5:4ak7OVXqta9BuH4FTHroseSKzELQrK7mTBEzbx8EaVoqhnBnHU84s4j0ZlxEJdIfk0NCeX4jrSuJIRoe4cPVk8Q0kEBL9Hpbv6fw2l0CTqolYK2eAKtk4+3QoMx+ewaeYPdLhY9MFcrB37RtehT3FA==;
	24:Bf9EoEpqlhLfDyH/tNVOX1zfgFGktgllRkCfz3pBD+4PyW+oasQGdQijalCPFIdqQnpiAGKGn06iC7tkph/GT37a210blRAKvwIEmIFQvJU=;
	7:IzHwJYp9X2x/qav5oHdXKxKqqoLdykz/dgDKufi8DF14HZrrOtVU2DantIbNiyeEWVqwy4h8RPI9M7U+9OlAsLYe/lvwkJMdFfVM8cJPENi7sJobZmEMwvy+cHi0U8f3fzY8mfvFAq3d8ruZ8mFWGW/zzCibeVLxMA/Q/O911OYzNlMPAYMP67GzQx+TXLLr01xbUMmKPAhljKhZRYqmdgwxhcYK4afCOW5wvZbDDpd3ZrQ9aS/azrT24tkzmYs0
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0701MB2130;
x-microsoft-antispam-prvs: <AM4PR0701MB21300A9ED5DDA26B1756C16AFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:AM4PR0701MB2130; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2130; 
x-forefront-prvs: 0993689CD1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(199003)(13464003)(377454003)(189002)(87936001)(101416001)(54356999)(33656002)(86362001)(76176999)(305945005)(5003600100003)(7736002)(7846002)(7696003)(3280700002)(66066001)(50986999)(122556002)(3660700001)(19580405001)(11100500001)(19580395003)(5002640100001)(9686002)(10400500002)(2900100001)(8936002)(2950100001)(74316002)(68736007)(92566002)(81166006)(6116002)(8676002)(3846002)(81156014)(586003)(102836003)(4326007)(76576001)(106116001)(106356001)(2906002)(5001770100001)(97736004)(77096005)(189998001)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2130;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2016 12:57:56.1730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2130
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.98
Subject: Re: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"mar.krzeminski@gmail.com" <mar.krzeminski@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZFkpUQCE+meB

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUWVtdS1kZXZlbCBbbWFp
bHRvOnFlbXUtZGV2ZWwtDQo+IGJvdW5jZXMrbWFyY2luLmtyemVtaW5za2k9bm9raWEuY29tQG5v
bmdudS5vcmddIE9uIEJlaGFsZiBPZiBDw6lkcmljIExlDQo+IEdvYXRlcg0KPiBTZW50OiBNb25k
YXksIEp1bHkgMDQsIDIwMTYgMjoxOSBQTQ0KPiBUbzogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5
ZGVsbEBsaW5hcm8ub3JnPjsgUGV0ZXIgQ3Jvc3Rod2FpdGUNCj4gPGNyb3N0aHdhaXRlLnBldGVy
QGdtYWlsLmNvbT4NCj4gQ2M6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBxZW11
LWFybUBub25nbnUub3JnOyBxZW11LQ0KPiBkZXZlbEBub25nbnUub3JnOyBtYXIua3J6ZW1pbnNr
aUBnbWFpbC5jb207IEPDqWRyaWMgTGUgR29hdGVyDQo+IDxjbGdAa2FvZC5vcmc+DQo+IFN1Ympl
Y3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMi83XSBtMjVwODA6IGFkZCBteDI1bDI1NjM1ZiBjaGlw
DQo+IA0KPiBUaGUgTWFjcm9uaXggY2hpcCBteDI1bDI1NjM1ZiB1c2VkIG9uIHNvbWUgT3BlblBv
d2VyIGJveGVzIGlzIHZlcnkNCj4gc2ltaWxhciB0byB0aGUgbXgyNWwyNTYzNWUuIFRoZXkgc2hh
cmUgdGhlIHNhbWUgSkVERUMgaWRlbnRpZmllciBidXQgdGhlDQo+IFdSU1IgaW5zdHJ1Y3Rpb24g
cmVxdWlyZXMgMiBieXRlcyBpbiB0aGUgbXgyNWwyNTYzNWYgY2FzZS4NCj4gDQo+IFRvIHByZXZl
bnQgc29tZSB3YXJuaW5ncyBvbiBndWVzdHMsIGxldCdzIGludHJvZHVjZSBhIG5ldyBjaGlwIGlk
ZW50aWZ5aW5nDQo+IEpFREVDIDB4YzIyMDE5IGFzIGEgTVgyNUwyNTYzNUYgY2hpcC4NCj4gDQpI
ZWxsbywNCg0KQWRkaW5nIGZha2UgSkVERUMgaWQgaXMgbm90IGdvb2QgaWRlYSBhdCBhbGwsIHdl
IHNob3VsZCBzb21laG93IGhhbmRsZSB0aGlzIGluIHRoZSBjb2RlLg0KDQo+IFNpZ25lZC1vZmYt
Ynk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+IC0tLQ0KPiAgaHcvYmxvY2sv
bTI1cDgwLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9ody9ibG9jay9tMjVwODAuYyBiL2h3L2Jsb2NrL20yNXA4MC5jIGlu
ZGV4DQo+IGQ5YjI3OTM5ZGRlNi4uYWE5NjQyODBiZWFiIDEwMDY0NA0KPiAtLS0gYS9ody9ibG9j
ay9tMjVwODAuYw0KPiArKysgYi9ody9ibG9jay9tMjVwODAuYw0KPiBAQCAtMTk5LDYgKzE5OSw3
IEBAIHN0YXRpYyBjb25zdCBGbGFzaFBhcnRJbmZvIGtub3duX2RldmljZXNbXSA9IHsNCj4gICAg
ICB7IElORk8oIm14MjVsMTI4MDVkIiwgMHhjMjIwMTgsICAgICAgMCwgIDY0IDw8IDEwLCAyNTYs
IDApIH0sDQo+ICAgICAgeyBJTkZPKCJteDI1bDEyODU1ZSIsIDB4YzIyNjE4LCAgICAgIDAsICA2
NCA8PCAxMCwgMjU2LCAwKSB9LA0KPiAgICAgIHsgSU5GTygibXgyNWwyNTYzNWUiLCAweGMyMjAx
OSwgICAgICAwLCAgNjQgPDwgMTAsIDUxMiwgMCkgfSwNCj4gKyAgICB7IElORk8oIm14MjVsMjU2
MzVmIiwgMHhjMjIwMTksICAgICAgMCwgIDY0IDw8IDEwLCA1MTIsIDApIH0sDQo+ICAgICAgeyBJ
TkZPKCJteDI1bDI1NjU1ZSIsIDB4YzIyNjE5LCAgICAgIDAsICA2NCA8PCAxMCwgNTEyLCAwKSB9
LA0KPiAgICAgIHsgSU5GTygibXg2NnU1MTIzNWYiLCAweGMyMjUzYSwgICAgICAwLCAgNjQgPDwg
MTAsIDEwMjQsIEVSXzRLIHwgRVJfMzJLKSB9LA0KPiAgICAgIHsgSU5GTygibXg2NnUxZzQ1ZyIs
ICAweGMyMjUzYiwgICAgICAwLCAgNjQgPDwgMTAsIDIwNDgsIEVSXzRLIHwgRVJfMzJLKSB9LA0K
PiBAQCAtOTkxLDYgKzk5Miw5IEBAIHN0YXRpYyB2b2lkIGRlY29kZV9uZXdfY21kKEZsYXNoICpz
LCB1aW50MzJfdA0KPiB2YWx1ZSkNCj4gICAgICAgICAgICAgIHMtPnBvcyA9IDA7DQo+ICAgICAg
ICAgICAgICBzLT5sZW4gPSAwOw0KPiAgICAgICAgICAgICAgcy0+c3RhdGUgPSBTVEFURV9DT0xM
RUNUSU5HX0RBVEE7DQo+ICsgICAgICAgICAgICBpZiAoIXN0cmNtcChzLT5waS0+cGFydF9uYW1l
LCAibXgyNWwyNTYzNWYiKSkgew0KPiArICAgICAgICAgICAgICAgIHMtPm5lZWRlZF9ieXRlcyA9
IDI7DQo+ICsgICAgICAgICAgICB9DQo+ICAgICAgICAgIH0NCj4gICAgICAgICAgYnJlYWs7DQpJ
cyBpdCBiYXNlZCBvbiBjdXJyZW50IG1hc3Rlcj8NCkluIG15IGxhc3Qgc2VyaWVzIChhbmQgY3Vy
cmVudCBtYXN0ZXIpIHRoaXMgY2FzZSBzaG91bGQgYmUgaGFuZGxlZCBieSB0aGlzIGNvZGU6DQog
ICAgICAgICAgICBjYXNlIE1BTl9NQUNST05JWDoNCiAgICAgICAgICAgICAgICBzLT5uZWVkZWRf
Ynl0ZXMgPSAyOw0KICAgICAgICAgICAgICAgIHMtPnN0YXRlID0gU1RBVEVfQ09MTEVDVElOR19W
QVJfTEVOX0RBVEE7DQogICAgICAgICAgICAgICAgYnJlYWs7DQpJIGRvIG5vdCBrbm93IHdoYXQg
cXVlc3QgeW91IGFyZSB1c2luZywgYnV0IGxpbnV4IG1haW5saW5lIChhdCBsZWFzdCA0LjQuMCkg
aXMgc2VuZGluZyBvbmx5IG9uZSBieXRlLA0KaW4gV1JTUiBzbyB0aGlzIHdpbGwgbm90IHdvcmsu
DQpDb3VsZCB5b3UgcmViYXNlIHRvIG1hc3RlciBhbmQgY2hlY2sgaWYgaXQgd2lsbCBib290IHdp
dGhvdXQgeW91ciB0aGlzIGNoYW5nZT8NCg0KVGhhbmtzLA0KTWFyY2luDQoNCj4gICAgICBjYXNl
IFJOVkNSOg0KPiAtLQ0KPiAyLjEuNA0KPiANCg0K
