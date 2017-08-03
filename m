Received: by 10.25.221.202 with SMTP id w71csp455025lfi;
        Thu, 3 Aug 2017 03:48:33 -0700 (PDT)
X-Received: by 10.233.222.69 with SMTP id s66mr1819714qkf.30.1501757313090;
        Thu, 03 Aug 2017 03:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501757313; cv=none;
        d=google.com; s=arc-20160816;
        b=LeA9n6hkrAZYOz781GWWcHNuFv+NSYXyiHvUI5nOFvFuZnF9zTvT4drLA0K5yAqJ/P
         /VuixrfExpMIDnN5ja05HUw3DMjtXbQiEpcTlwNSs7j6tTrsHyl6+mqxq8K9Vvtuuozw
         nvzKxc2v6zt0trdGOROfDTXTt7le3uJrnmpcz9oKBfk/zl2j+crw0NGRBGcfBZgFkpBH
         gaqUJB1x/x6NhZmjofw+AoGFuxj7MxpB+Sf6ZdG2YzUWze+MATm8Z2rzkeTp7ECZcUxG
         3PQJvWYKX4b1Zf+AjQh+RK7Js67wAYHSefyPp02Tob76FvyDw4s2yMDFCHj8Fuvn/AT5
         /6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=mHKPSM0YJa0Gmhd6F7XwN2eC6qFh81jxPrRqIC2w31A=;
        b=UMPpE0A7uo3B+J88azFPwlNR9c6zrSP/NfEP2dvm4QtsyQebVOWMhOJhZV8m0tHwta
         9txmJJSX/Qy055v0AsQEQ6eN6fQMl9aZ1ucRXsY8/doUTGxom2x5thZENaQ4jRNQWLsL
         cypLdj9jba/mtlfSJwkHznPJ2VIOeQ+oXKCUxBQkB2TTzcE+XB32wqKLmsdvE/gw+YuV
         x8ufzgDQsbzqYXlDVJBWus/M8Ctzvk+9X43i+4Orm+J3UPLZ+Fj2x2HRgXGTUWsKfKJA
         QvISGwq5bcDmHVrQTRYecPgZHWDIUB9EDHtvmQwS0KYAA49/v9dHqJFvs392d/JWl6h0
         Qd2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=r9G9Fh9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si26884344qkj.390.2017.08.03.03.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 03:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=r9G9Fh9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:57038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddDg6-0002de-2E
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 06:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1ddDg1-0002bi-5x
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 06:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1ddDfz-0001OH-P1
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 06:48:25 -0400
Received: from mail-ve1eur01on0050.outbound.protection.outlook.com
	([104.47.1.50]:46262
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1ddDfu-0001IX-SZ; Thu, 03 Aug 2017 06:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=mHKPSM0YJa0Gmhd6F7XwN2eC6qFh81jxPrRqIC2w31A=;
	b=r9G9Fh9fZHCD+8tSMxrz1ohzVuMUFAYHRuQzahpZ+dcDqJ6WF13V/tNl+40pcL6IOgr7j8lhAxrDxEWvozWihbM+3GIDuNVvs0LPCrDvEp0hjpUYLfMQcHesrMj5vg+AY061vKjk3lQBf99UnWG9ob1vX64UTSmItoyFjPxHwkM=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2547.eurprd04.prod.outlook.com (10.169.245.10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Thu, 3 Aug 2017 10:48:16 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::dc43:4720:e703:7cfa]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::dc43:4720:e703:7cfa%18]) with mapi id 15.01.1304.023;
	Thu, 3 Aug 2017 10:48:15 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement the
	translation and commands
Thread-Index: AQHS36dzyqTTC2TPF0WQrxpllPATmKJSz2WAgABIinCABGCngIAWxEsAgAQ/RQA=
Date: Thu, 3 Aug 2017 10:48:15 +0000
Message-ID: <AM5PR0401MB254523A43EB292B478C729279AB10@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<20170714021733.GA27284@pxdev.xzpeter.org>
	<AM5PR0401MB2545B52A31CCA827DB3EE5A79AAD0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<20170717012809.GO27284@pxdev.xzpeter.org>
	<45e202fa-2b6b-bc17-9200-b0eaa1879c78@redhat.com>
In-Reply-To: <45e202fa-2b6b-bc17-9200-b0eaa1879c78@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2547;
	6:/3ICuuUUdIgCES/xrTW0yunnxR58z1sfCYk5pmVeVMzouioSy6b87s4YrsSEA++REEX+wtPj5lRlmIXa2i1L3MRCKwHb7dFHg7ZzPAtWHd0AcXoTgedH2czfwq7etGZawagcf61ctr93xtD6DDpWJndXQGNYQo7LkgC80X/DmJoEnR6vjZAgRU0/rNzwSVPV/jmecPthc0y/nOM9D3Q0bFARk3K+E3mZj71T9Rf0NPgskEIPt4HX2/9JuJdSrZBZFn3vkXJBG5ToCKFiT1jJ32GTXpxlqfm7VliIPnpKQIVIPWtcAoKasGwsoZrBn8KFiA0nE79yv0R+T3tuJN0+fA==;
	5:XcYW3Sp/S7DDK/ZkGM/nckIK4M6Vjg5iFlVhE0kKJ4IzxnJa7KHVQO2uuhOeR4J/iaNgjWXeBmBNwVk21xQV1Sc1NkiZ3ETDasR8tC++BtJS3afiVMppOWsSbhw69fO9r6ko9uNkcnDUjVQCfBj5Tg==;
	24:w6W2Istl7G65WuZTp8VzpLQaCcphY9FgAE1lE1N0LoaXnMVMpQVX4hQZrS11UFHkoWjcbqm9fU7EdcarNkAp670qYhmULYz/9be2W6V0EtM=;
	7:KCwRRHJ+3xPWj3R63PMyS14JZvulWTNKZB7gFMkWHTdi3h+p/14NsEwWM3HoN/OfPupqF68g0m+Q9ziY8LNqiiKcL49OYLPAjZ9I5BxewH5Uy6p9YZqUNaeoaU53ijuj1iehIOvaNhQMyyO2Fh1bs79gnylhJQnZJlqPFdaUv0AhYGHqsaHZDfvRjMUX8E+yf2k/duIOYguSH6vIYPcWx4Gbj/8YX3nnAsXt2cUDdWc=
x-ms-office365-filtering-correlation-id: 46882590-3cd2-4e87-25e8-08d4da5d2545
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2547; 
x-ms-traffictypediagnostic: AM5PR0401MB2547:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB2547BBC17A974B70707898839AB10@AM5PR0401MB2547.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6055026)(6041248)(20161123558100)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2547; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2547; 
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(39400400002)(39850400002)(39410400002)(39450400003)(39840400002)(57704003)(199003)(13464003)(24454002)(189002)(377454003)(4326008)(105586002)(53546010)(14454004)(53936002)(25786009)(74316002)(6506006)(106356001)(189998001)(7696004)(6436002)(2906002)(39060400002)(33656002)(97736004)(7416002)(5890100001)(5250100002)(3660700001)(9686003)(7736002)(305945005)(2950100002)(81166006)(50986999)(8676002)(102836003)(8936002)(2900100001)(81156014)(76176999)(54356999)(38730400002)(101416001)(3280700002)(6116002)(54906002)(6246003)(478600001)(99286003)(55016002)(68736007)(229853002)(86362001)(5660300001)(66066001)(3846002)(93886004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2547;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2017 10:48:15.6778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2547
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.50
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement
 the translation and commands
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hCvd5nX1QtQu

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiBNb25kYXksIEp1bHkg
MzEsIDIwMTcgNjozOCBQTQ0KPiBUbzogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPjsgQmhh
cmF0IEJodXNoYW4NCj4gPGJoYXJhdC5iaHVzaGFuQG54cC5jb20+DQo+IENjOiB3ZWlAcmVkaGF0
LmNvbTsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBrZXZpbi50aWFuQGludGVsLmNvbTsNCj4g
ZHJqb25lc0ByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsgamVhbi1waGlsaXBwZS5icnVja2Vy
QGFybS5jb207DQo+IHRuQHNlbWloYWxmLmNvbTsgd2lsbC5kZWFjb25AYXJtLmNvbTsgcWVtdS1k
ZXZlbEBub25nbnUub3JnOw0KPiBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsgcWVtdS1hcm1A
bm9uZ251Lm9yZzsNCj4gbWFyYy56eW5naWVyQGFybS5jb207IHJvYmluLm11cnBoeUBhcm0uY29t
Ow0KPiBjaHJpc3RvZmZlci5kYWxsQGxpbmFyby5vcmc7IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNv
bQ0KPiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtSRkMgdjIgNi84XSB2aXJ0aW8taW9tbXU6
IEltcGxlbWVudCB0aGUNCj4gdHJhbnNsYXRpb24gYW5kIGNvbW1hbmRzDQo+IA0KPiBIaSBQZXRl
ciwgQmhhcmF0LA0KPiANCj4gT24gMTcvMDcvMjAxNyAwMzoyOCwgUGV0ZXIgWHUgd3JvdGU6DQo+
ID4gT24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgMDY6NDA6MzRBTSArMDAwMCwgQmhhcmF0IEJodXNo
YW4gd3JvdGU6DQo+ID4+IEhpIFBldGVyLA0KPiA+Pg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4+IEZyb206IFBldGVyIFh1IFttYWlsdG86cGV0ZXJ4QHJlZGhhdC5jb21d
DQo+ID4+PiBTZW50OiBGcmlkYXksIEp1bHkgMTQsIDIwMTcgNzo0OCBBTQ0KPiA+Pj4gVG86IEVy
aWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4gPj4+IENjOiBlcmljLmF1Z2VyLnBy
b0BnbWFpbC5jb207IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4gPj4+IGFsZXgud2lsbGlh
bXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsgcWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7
DQo+ID4+PiBxZW11LWRldmVsQG5vbmdudS5vcmc7IGplYW4tcGhpbGlwcGUuYnJ1Y2tlckBhcm0u
Y29tOw0KPiA+Pj4gd2VpQHJlZGhhdC5jb207IGtldmluLnRpYW5AaW50ZWwuY29tOyBCaGFyYXQg
Qmh1c2hhbg0KPiA+Pj4gPGJoYXJhdC5iaHVzaGFuQG54cC5jb20+OyBtYXJjLnp5bmdpZXJAYXJt
LmNvbTsNCj4gdG5Ac2VtaWhhbGYuY29tOw0KPiA+Pj4gd2lsbC5kZWFjb25AYXJtLmNvbTsgZHJq
b25lc0ByZWRoYXQuY29tOyByb2Jpbi5tdXJwaHlAYXJtLmNvbTsNCj4gPj4+IGNocmlzdG9mZmVy
LmRhbGxAbGluYXJvLm9yZw0KPiA+Pj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUkZDIHYy
IDYvOF0gdmlydGlvLWlvbW11OiBJbXBsZW1lbnQgdGhlDQo+ID4+PiB0cmFuc2xhdGlvbiBhbmQg
Y29tbWFuZHMNCj4gPj4+DQo+ID4+PiBPbiBXZWQsIEp1biAwNywgMjAxNyBhdCAwNjowMToyNVBN
ICswMjAwLCBFcmljIEF1Z2VyIHdyb3RlOg0KPiA+Pj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgYWN0
dWFsIGltcGxlbWVudGF0aW9uIGZvciB0aGUgdHJhbnNsYXRpb24NCj4gPj4+PiByb3V0aW5lIGFu
ZCB0aGUgdmlydGlvLWlvbW11IGNvbW1hbmRzLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1i
eTogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+Pj4NCj4gPj4+IFsuLi5d
DQo+ID4+Pg0KPiA+Pj4+ICBzdGF0aWMgaW50IHZpcnRpb19pb21tdV9hdHRhY2goVmlydElPSU9N
TVUgKnMsDQo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdmly
dGlvX2lvbW11X3JlcV9hdHRhY2gNCj4gPj4+PiAqcmVxKSBAQCAtOTUsMTAgKzEzNSwzNCBAQCBz
dGF0aWMgaW50DQo+IHZpcnRpb19pb21tdV9hdHRhY2goVmlydElPSU9NTVUgKnMsDQo+ID4+Pj4g
ICAgICB1aW50MzJfdCBhc2lkID0gbGUzMl90b19jcHUocmVxLT5hZGRyZXNzX3NwYWNlKTsNCj4g
Pj4+PiAgICAgIHVpbnQzMl90IGRldmlkID0gbGUzMl90b19jcHUocmVxLT5kZXZpY2UpOw0KPiA+
Pj4+ICAgICAgdWludDMyX3QgcmVzZXJ2ZWQgPSBsZTMyX3RvX2NwdShyZXEtPnJlc2VydmVkKTsN
Cj4gPj4+PiArICAgIHZpb21tdV9hcyAqYXM7DQo+ID4+Pj4gKyAgICB2aW9tbXVfZGV2ICpkZXY7
DQo+ID4+Pj4NCj4gPj4+PiAgICAgIHRyYWNlX3ZpcnRpb19pb21tdV9hdHRhY2goYXNpZCwgZGV2
aWQsIHJlc2VydmVkKTsNCj4gPj4+Pg0KPiA+Pj4+IC0gICAgcmV0dXJuIFZJUlRJT19JT01NVV9T
X1VOU1VQUDsNCj4gPj4+PiArICAgIGRldiA9IGdfdHJlZV9sb29rdXAocy0+ZGV2aWNlcywgR1VJ
TlRfVE9fUE9JTlRFUihkZXZpZCkpOw0KPiA+Pj4+ICsgICAgaWYgKGRldikgew0KPiA+Pj4+ICsg
ICAgICAgIHJldHVybiAtMTsNCj4gPj4+PiArICAgIH0NCj4gPj4+PiArDQo+ID4+Pj4gKyAgICBh
cyA9IGdfdHJlZV9sb29rdXAocy0+YWRkcmVzc19zcGFjZXMsDQo+IEdVSU5UX1RPX1BPSU5URVIo
YXNpZCkpOw0KPiA+Pj4+ICsgICAgaWYgKCFhcykgew0KPiA+Pj4+ICsgICAgICAgIGFzID0gZ19t
YWxsb2MwKHNpemVvZigqYXMpKTsNCj4gPj4+PiArICAgICAgICBhcy0+aWQgPSBhc2lkOw0KPiA+
Pj4+ICsgICAgICAgIGFzLT5tYXBwaW5ncyA9DQo+IGdfdHJlZV9uZXdfZnVsbCgoR0NvbXBhcmVE
YXRhRnVuYylpbnRlcnZhbF9jbXAsDQo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCwgTlVMTCwgKEdEZXN0cm95Tm90aWZ5KWdfZnJlZSk7DQo+ID4+
Pj4gKyAgICAgICAgZ190cmVlX2luc2VydChzLT5hZGRyZXNzX3NwYWNlcywgR1VJTlRfVE9fUE9J
TlRFUihhc2lkKSwgYXMpOw0KPiA+Pj4+ICsgICAgICAgIHRyYWNlX3ZpcnRpb19pb21tdV9uZXdf
YXNpZChhc2lkKTsNCj4gPj4+PiArICAgIH0NCj4gPj4+PiArDQo+ID4+Pj4gKyAgICBkZXYgPSBn
X21hbGxvYzAoc2l6ZW9mKCpkZXYpKTsNCj4gPj4+PiArICAgIGRldi0+YXMgPSBhczsNCj4gPj4+
PiArICAgIGRldi0+aWQgPSBkZXZpZDsNCj4gPj4+PiArICAgIGFzLT5ucl9kZXZpY2VzKys7DQo+
ID4+Pj4gKyAgICB0cmFjZV92aXJ0aW9faW9tbXVfbmV3X2RldmlkKGRldmlkKTsNCj4gPj4+PiAr
ICAgIGdfdHJlZV9pbnNlcnQocy0+ZGV2aWNlcywgR1VJTlRfVE9fUE9JTlRFUihkZXZpZCksIGRl
dik7DQo+ID4+Pg0KPiA+Pj4gSGVyZSBkbyB3ZSBuZWVkIHRvIHJlY29yZCBzb21ldGhpbmcgbGlr
ZSBhIHJlZmNvdW50IGZvciBhZGRyZXNzIHNwYWNlPw0KPiA+Pj4gU2luY2UuLi4NCj4gPj4NCj4g
Pj4gV2UgYXJlIHVzaW5nICJucl9kZXZpY2VzIiBhcyBudW1iZXIgb2YgZGV2aWNlcyBhdHRhY2hl
ZCB0byBhbg0KPiA+PiBhZGRyZXNzLXNwYWNlDQo+ID4+DQo+ID4+Pg0KPiA+Pj4+ICsNCj4gPj4+
PiArICAgIHJldHVybiBWSVJUSU9fSU9NTVVfU19PSzsNCj4gPj4+PiAgfQ0KPiA+Pj4+DQo+ID4+
Pj4gIHN0YXRpYyBpbnQgdmlydGlvX2lvbW11X2RldGFjaChWaXJ0SU9JT01NVSAqcywgQEAgLTEw
NiwxMCArMTcwLDEzDQo+ID4+Pj4gQEAgc3RhdGljIGludCB2aXJ0aW9faW9tbXVfZGV0YWNoKFZp
cnRJT0lPTU1VICpzLCAgew0KPiA+Pj4+ICAgICAgdWludDMyX3QgZGV2aWQgPSBsZTMyX3RvX2Nw
dShyZXEtPmRldmljZSk7DQo+ID4+Pj4gICAgICB1aW50MzJfdCByZXNlcnZlZCA9IGxlMzJfdG9f
Y3B1KHJlcS0+cmVzZXJ2ZWQpOw0KPiA+Pj4+ICsgICAgaW50IHJldDsNCj4gPj4+Pg0KPiA+Pj4+
ICAgICAgdHJhY2VfdmlydGlvX2lvbW11X2RldGFjaChkZXZpZCwgcmVzZXJ2ZWQpOw0KPiA+Pj4+
DQo+ID4+Pj4gLSAgICByZXR1cm4gVklSVElPX0lPTU1VX1NfVU5TVVBQOw0KPiA+Pj4+ICsgICAg
cmV0ID0gZ190cmVlX3JlbW92ZShzLT5kZXZpY2VzLCBHVUlOVF9UT19QT0lOVEVSKGRldmlkKSk7
DQo+ID4+Pg0KPiA+Pj4gLi4uIGhlcmUgd2hlbiBkZXRhY2gsIGltaG8gd2Ugc2hvdWxkIGNoZWNr
IHRoZSByZWZjb3VudDogaWYgdGhlcmUgaXMNCj4gPj4+IG5vIGRldmljZSB1c2luZyBzcGVjaWZp
YyBhZGRyZXNzIHNwYWNlLCB3ZSBzaG91bGQgcmVsZWFzZSB0aGUNCj4gPj4+IGFkZHJlc3Mgc3Bh
Y2UgYXMgd2VsbC4NCj4gPj4+DQo+ID4+PiBPdGhlcndpc2UgdGhlcmUgd291bGQgaGF2ZSBubyB3
YXkgdG8gZGVzdHJveSBhbiBhZGRyZXNzIHNwYWNlPw0KPiA+Pg0KPiA+Pg0KPiA+PiBIZXJlIGlm
IG5yX2RldmljZXMgPT0gMCB0aGVuIHJlbGVhc2UgdGhlIGFkZHJlc3Mgc3BhY2UsIGlzIHRoYXQg
b2s/DQo+ID4+DQo+ID4+IFRoaXMgaXMgaG93IEkgaW1wbGVtZW50ZWQgYXMgcGFydCBvZiBWRklP
IGludGVncmF0aW9uIG92ZXIgdGhpcyBwYXRjaA0KPiBzZXJpZXMuDQo+ID4+IAkiW1JGQyBQQVRD
SCAyLzJdIHZpcnRpby1pb21tdTogdmZpbyBpbnRlZ3JhdGlvbiB3aXRoIHZpcnRpby1pb21tdSIN
Cj4gDQo+IGdsaWIgcHJvdmlkZXMgZ190cmVlX3JlZi9nX3RyZWVfdW5yZWYuIEkgdGhpbmsgdGhl
IG1vc3QgZWxlZ2FudCBpcyB0byB1c2UNCj4gZ190cmVlX3JlZiB3aGVuIGFkZGluZyBhIGRldmlj
ZSBhbmQgZGVjcmVtZW50aW5nIHdoZW4gcmVtb3ZpbmcgYQ0KPiBkZXZpY2UsIGFzIHN1Z2dlc3Rl
ZCBieSBQZXRlci4NCj4gDQo+ICJpZiB0aGUgcmVmZXJlbmNlIGNvdW50IGRyb3BzIHRvIDAsIGFs
bCBrZXlzIGFuZCB2YWx1ZXMgd2lsbCBiZSBkZXN0cm95ZWQgKGlmDQo+IGRlc3Ryb3kgZnVuY3Rp
b25zIHdlcmUgc3BlY2lmaWVkKSBhbmQgYWxsIG1lbW9yeSBhbGxvY2F0ZWQgYnkgdHJlZSB3aWxs
IGJlDQo+IHJlbGVhc2VkLiINCj4gDQo+IFRoYXQgd2F5IHdlIHNob3VsZCBiZSBhYmxlIHRvIHJl
bW92ZSBucl9kZXZpY2VzIGZyb20gdmlvbW11X2FzDQo+IA0KPiBCaGFyYXQsIGlmIHRoaXMgYnJl
YWtzIHlvdXIgaW1wbGVtZW50YXRpb24gSSB3aWxsIGxldCB5b3UgcmUtaW50cm9kdWNlDQo+IG5y
X2RldmljZXMgYXMgcGFydCBvZiB0aGUgVkZJTyBwYXRjaC4NCg0KV2UgbmVlZCB0byB1bm1hcCgp
IGV2ZXJ5dGhpbmcgaW4gcGh5c2ljYWwtaW9tbXUgd2hlbiBsYXN0IGRldmljZSBpcyBkZXRhY2hl
ZCwgc2VlbXMgbGlrZSBnX3RyZWVfcmVmL3VucmVmKCkgZG9lcyBub3QgZ2l2ZSBhbnkgaGFuZGxl
IGZvciB0aGlzLiBJIHdpbGwgZ28gYWhlYWQgd2l0aCBhZGRpbmcgbnJfZGV2aWNlcyB3aXRoIFZG
SU8gaW50ZWdyYXRpb24gcGF0Y2hlcy4NCg0KVGhhbmtzDQotQmhhcmF0DQoNCj4gDQo+IFRoYW5r
cw0KPiANCj4gRXJpYw0KPiA+DQo+ID4gU29ycnkgSSBkaWRuJ3QgcmVhZCB0aGF0IHdoZW4gcG9z
dGluZy4gSXQgaXMgd2hhdCBJIG1lYW4uICBUaGFua3MsDQo+ID4NCg==
