Received: by 10.80.166.35 with SMTP id d32csp667699edc;
        Mon, 17 Oct 2016 14:08:19 -0700 (PDT)
X-Received: by 10.200.44.162 with SMTP id 31mr27554953qtw.1.1476738499783;
        Mon, 17 Oct 2016 14:08:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si18951505qte.97.2016.10.17.14.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 14:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:35989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwF8t-0002mm-4D
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 17:08:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bwF8m-0002l8-OR
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 17:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bwF8l-0007d5-ST
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 17:08:12 -0400
Received: from mail-db5eur01on0110.outbound.protection.outlook.com
	([104.47.2.110]:18986
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1bwF8h-0007X8-3e; Mon, 17 Oct 2016 17:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=He/Hf+Zwp4SzKGpgayJbmYzts//rvMD7B1tRHhr0jKI=;
	b=j7+NDqYWKbxfeTVDnjGTZD1Nt2klwoQlCeR70NAhLW+TnBbZOfej355FQIwjJMmJkWkNdHEbmKHQ4rvhPMKLqsTdR+3ZuH2yHB7CybLYkm/B9Os3FD3xKTt8Oaenx3em4WEWggH6vKc/fDeYxA1QCrMTIO1W1z8b5Z1bGzMFGaI=
Received: from DB6PR0701MB2136.eurprd07.prod.outlook.com (10.168.58.15) by
	DB6PR0701MB2135.eurprd07.prod.outlook.com (10.168.58.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.669.5; Mon, 17 Oct 2016 14:33:14 +0000
Received: from DB6PR0701MB2136.eurprd07.prod.outlook.com ([10.168.58.15]) by
	DB6PR0701MB2136.eurprd07.prod.outlook.com ([10.168.58.15]) with mapi id
	15.01.0669.018; Mon, 17 Oct 2016 14:33:14 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH] nvic: allow to set pending status for not active
	interrupts
Thread-Index: AQHSIH9JFBl2oGAp3U6S1C3H2Q9B3qCmpToAgAYeQoA=
Date: Mon, 17 Oct 2016 14:33:14 +0000
Message-ID: <DB6PR0701MB213692C890EF8FF9F5AB938AFED00@DB6PR0701MB2136.eurprd07.prod.outlook.com>
References: <1475833331-26882-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA92+He9Fir_FeJEtx+Emd-HqjtHGimUbCgUn7X6gjnk5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA92+He9Fir_FeJEtx+Emd-HqjtHGimUbCgUn7X6gjnk5Q@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.2.16]
x-ms-office365-filtering-correlation-id: ab0397d9-282c-4406-2595-08d3f69a874f
x-microsoft-exchange-diagnostics: 1; DB6PR0701MB2135;
	7:ChwNDWOM/KQxbuR+7xZ5bjj8K/QeJTwP3qUeMvR6042ZBkrqaY/8PeIA5yz02mptBeJVR9Nb83T8mxp1NVbyzHfAEnwxkg8rBf5CUSzR8Ff6b9xW6F7Dz3z/cJklqB0kz8Ntb7pLf3U29uLmY1CpJwNTkkkmcjtmLcTbOUUZyl/QyxdJzgv2S/CBy7W2cYF23iB7tE6egvxk8UQYTEaeV9RYlQqrNdhkHMvYS4lHobGY5ds3b8p2JHpVuEBttQrtJSuiKvuimjkzNd8LTWi7dF8cDjCLuiDHXbDqYpyfCdiKH4ulYcFtuIJJoEJCQErZA1gJC9C+hXQDQJWRTjMEC+B2UGMq05xXmHGuypTvdNY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB6PR0701MB2135;
x-microsoft-antispam-prvs: <DB6PR0701MB21356F90FAFBE429FFE5D6CEFED00@DB6PR0701MB2135.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:DB6PR0701MB2135; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0701MB2135; 
x-forefront-prvs: 0098BA6C6C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(189002)(24454002)(377454003)(13464003)(199003)(107886002)(86362001)(189998001)(4326007)(77096005)(9686002)(10400500002)(2906002)(8936002)(87936001)(11100500001)(19580395003)(19580405001)(122556002)(92566002)(3660700001)(3280700002)(2950100002)(105586002)(68736007)(6916009)(7736002)(7846002)(110136003)(101416001)(7696004)(106356001)(106116001)(74316002)(6116002)(586003)(305945005)(81156014)(4001430100002)(5002640100001)(102836003)(66066001)(3846002)(33656002)(81166006)(5660300001)(97736004)(76576001)(50986999)(8676002)(2900100001)(54356999)(76176999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0701MB2135;
	H:DB6PR0701MB2136.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2016 14:33:14.3318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2135
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.110
Subject: Re: [Qemu-arm] [PATCH] nvic: allow to set pending status for not
 active interrupts
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
X-TUID: IGW03haKsbLJ

SGkgUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBN
YXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAxMywgMjAxNiA2OjU5IFBNDQo+IFRvOiBLcnplbWluc2tpLCBNYXJjaW4gKE5v
a2lhIC0gUEwvV3JvY2xhdykNCj4gPG1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbT4NCj4gQ2M6
IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgcWVtdS1hcm0gPHFlbXUt
DQo+IGFybUBub25nbnUub3JnPjsgcmZzdy1wYXRjaGVzQG1saXN0Lm5va2lhLmNvbQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBudmljOiBhbGxvdyB0byBzZXQgcGVuZGluZyBzdGF0dXMgZm9yIG5v
dCBhY3RpdmUNCj4gaW50ZXJydXB0cw0KPiANCj4gT24gNyBPY3RvYmVyIDIwMTYgYXQgMTA6NDIs
ICA8bWFyY2luLmtyemVtaW5za2lAbm9raWEuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBNYXJjaW4g
S3J6ZW1pbnNraSA8bWFyY2luLmtyemVtaW5za2lAbm9raWEuY29tPg0KPiA+DQo+ID4gQWNjb3Jk
aW5nIHRvIEFSTSBEVUkgMDU1MkEgNC4yLjEwLiBOVklDIHNldCBwZW5kaW5nIHN0YXR1cyBhbHNv
IGZvcg0KPiA+IGRpc2FibGVkIGludGVycnVwdHMuIFRoaXMgcGF0Y2ggYWRkcyBwb3NzaWJpbGl0
eSB0byBlbXVsYXRlIHRoaXMgaW4NCj4gPiBRZW11Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TWFyY2luIEtyemVtaW5za2kgPG1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgaHcvaW50Yy9hcm1fZ2ljLmMgfCAzICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaHcvaW50
Yy9hcm1fZ2ljLmMgYi9ody9pbnRjL2FybV9naWMuYyBpbmRleA0KPiA+IGIzMGNjOTEuLjg1YmU2
ZTQgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvaW50Yy9hcm1fZ2ljLmMNCj4gPiArKysgYi9ody9pbnRj
L2FybV9naWMuYw0KPiA+IEBAIC0xNDcsNyArMTQ3LDggQEAgc3RhdGljIHZvaWQgZ2ljX3NldF9p
cnFfMTFtcGNvcmUoR0lDU3RhdGUgKnMsIGludA0KPiA+IGlycSwgaW50IGxldmVsLCAgew0KPiA+
ICAgICAgaWYgKGxldmVsKSB7DQo+ID4gICAgICAgICAgR0lDX1NFVF9MRVZFTChpcnEsIGNtKTsN
Cj4gPiAtICAgICAgICBpZiAoR0lDX1RFU1RfRURHRV9UUklHR0VSKGlycSkgfHwgR0lDX1RFU1Rf
RU5BQkxFRChpcnEsIGNtKSkgew0KPiA+ICsgICAgICAgIGlmIChHSUNfVEVTVF9FREdFX1RSSUdH
RVIoaXJxKSB8fCBHSUNfVEVTVF9FTkFCTEVEKGlycSwgY20pDQo+ID4gKyAgICAgICAgICAgICAg
ICB8fCAoIUdJQ19URVNUX0FDVElWRShpcnEsIGNtKSAmJiAgcy0+cmV2aXNpb24gPT0NCj4gPiAr
IFJFVl9OVklDKSkgew0KPiA+ICAgICAgICAgICAgICBEUFJJTlRGKCJTZXQgJWQgcGVuZGluZyBt
YXNrICV4XG4iLCBpcnEsIHRhcmdldCk7DQo+ID4gICAgICAgICAgICAgIEdJQ19TRVRfUEVORElO
RyhpcnEsIHRhcmdldCk7DQo+ID4gICAgICAgICAgfQ0KPiA+IC0tDQo+IA0KPiBUaGFua3MgZm9y
IHRoaXMgcGF0Y2guIEkgYWdyZWUgdGhhdCB0aGUgY3VycmVudCBiZWhhdmlvdXIgaXNuJ3QgY29y
cmVjdC4NCj4gDQo+IEkgdGhpbmsgaXQgd291bGQgYmUgY2xlYW5lciB0byBkZWZpbmUgYSBuZXcg
Z2ljX3NldF9pcnFfbnZpYygpIHdoaWNoIGhhcyB0aGUNCj4gTlZJQyBzcGVjaWZpYyBiZWhhdmlv
dXIsIHJhdGhlciB0aGFuIHN0aWNraW5nIGFuICJpZiB0aGlzIGlzIHJlYWxseSBhbiBOVklDIg0K
PiBjaGVjayBpbnRvIHRoaXMgZnVuY3Rpb24uDQo+DQpTdXJlLg0KDQo+IFlvdSBwcm9iYWJseSBh
bHNvIHdhbnQgdG8gY2hlY2sgd2hldGhlciB0aGUgbG9naWMgZm9yIHJlLXBlbmRpbmcgbGV2ZWwN
Cj4gdHJpZ2dlcmVkIGludGVycnVwdHMgaW4gZ2ljX2NvbXBsZXRlX2lycSgpIGFsc28gbmVlZHMg
YSBzaW1pbGFyIGNoYW5nZToNCj4gDQo+ICAgICBpZiAocy0+cmV2aXNpb24gPT0gUkVWXzExTVBD
T1JFIHx8IHMtPnJldmlzaW9uID09IFJFVl9OVklDKSB7DQo+ICAgICAgICAgLyogTWFyayBsZXZl
bCB0cmlnZ2VyZWQgaW50ZXJydXB0cyBhcyBwZW5kaW5nIGlmIHRoZXkgYXJlIHN0aWxsDQo+ICAg
ICAgICAgICAgcmFpc2VkLiAgKi8NCj4gICAgICAgICBpZiAoIUdJQ19URVNUX0VER0VfVFJJR0dF
UihpcnEpICYmIEdJQ19URVNUX0VOQUJMRUQoaXJxLCBjbSkNCj4gICAgICAgICAgICAgJiYgR0lD
X1RFU1RfTEVWRUwoaXJxLCBjbSkgJiYgKEdJQ19UQVJHRVQoaXJxKSAmIGNtKSAhPSAwKSB7DQo+
ICAgICAgICAgICAgIERQUklOVEYoIlNldCAlZCBwZW5kaW5nIG1hc2sgJXhcbiIsIGlycSwgY20p
Ow0KPiAgICAgICAgICAgICBHSUNfU0VUX1BFTkRJTkcoaXJxLCBjbSk7DQo+ICAgICAgICAgfQ0K
PiAgICAgfQ0KSXQgc2VlbSB0aGV0IGxldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHQgY291bGQgYmUg
cmVtb3ZlZCBmcm9tIGZpIGZvciBOVklDLg0KSSBkbyBub3QgaGF2ZSBndWVzdCB0byBtb2RlbCB0
aGF0LCBidXQgSSB3aWxsIGF0IGxlYXN0IGNoZWNrIGlmIHRoaXMNCmRvIG5vdCBicmFrZSBhbnl0
aGluZy4NCg0KVGhhbmtzLA0KTWFyY2luIA0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K
