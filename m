Received: by 10.25.44.15 with SMTP id s15csp613988lfs;
        Wed, 12 Jul 2017 03:27:52 -0700 (PDT)
X-Received: by 10.55.215.26 with SMTP id m26mr5066994qki.95.1499855272367;
        Wed, 12 Jul 2017 03:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499855272; cv=none;
        d=google.com; s=arc-20160816;
        b=x0rpxWpbFuL6tp3OhK2Cmmvf8qNOuKso9p8CqnrKh2utiEruLQ8oPSejEdSuhoSUl2
         CJDwLFRx6Q6pCvWzMzqFn9abRwgA/C3GCJmKBW5ir8qGsy5NJ6VWKk0hS4rSH/BmQcQN
         MVtwbN9X7PbuFYWtXX9JO8aEE/OfEyC2NqP4T0kbKDqXkcIGJZcAys18+3oZdFy3tvoV
         dhP6KHHlzc1679bDwWCa9UOUl+mXebvWBc+tefBsfeHw/4e7esbJbOlMG4VnWCY2KEDS
         bpts+3u7Rc3LlEBgTpQFrq3ogCSbxWvv5MHmbeqdlQdi2moWC6UbW8fhdfRpsC2pfQ0/
         J5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=8+RQzYTlid3NZuOS65HZDcFbXPgAXMSFLmgENkb4V0g=;
        b=bY+mXUb0Bxw+DF5G4TgR7jOOnBGHNzqbxdKy/ducqWK8dwpWMrEo4BPmWdKmU1ax6n
         j2rd7oW2Vrl0eXc2zqbRoqa16MO5jEK1LL1+cN6XxJLZWOL1pytj53z6JBUILxHAiqgB
         kLlXTWTJYWYCY+o2svUB/kGWmGAKjqw7QwkdVF+Z4qjIV1BpRUnJCN1oZI4RmputJ8W/
         OtQ28bkJavbKyjTDVuhZ1ITtBPJ0kcoAXX5glQF9QFdF0kyleIYB1H2VZaDL8iFK2v6z
         IKsPhfTDYH/aALa+rf5getI2tjRIN+lqnC9/OY7A+LjVR0kgfbT2Ty2uHyUckxVodKDj
         G3HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=P5IYFkq8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p10si1928537qke.174.2017.07.12.03.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 03:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=P5IYFkq8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:51572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVEs1-0008TZ-Ew
	for alex.bennee@linaro.org; Wed, 12 Jul 2017 06:27:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dVErv-0008TQ-2T
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 06:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dVErq-00056M-OD
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 06:27:43 -0400
Received: from mail-he1eur01on0085.outbound.protection.outlook.com
	([104.47.0.85]:19168
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dVErp-00053o-Dx; Wed, 12 Jul 2017 06:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8+RQzYTlid3NZuOS65HZDcFbXPgAXMSFLmgENkb4V0g=;
	b=P5IYFkq8bPhxDgPFkClavuoX341aDH92GFCnXg399qrhmrl2JMhz4Xb1CE0okGVoZ6U5WRWNYvO7kS1fi8syBSFKCWYnkzP8EFiXCduMDX+KE9n8y6YybeJmuVhlZbO1Pw/nDkq+3NuDACYT4foNuH/ku6fLISFQohCoQhVYw+A=
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com (10.168.148.10) by
	HE1PR0401MB2554.eurprd04.prod.outlook.com (10.168.148.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Wed, 12 Jul 2017 10:27:31 +0000
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88]) by
	HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88%18]) with mapi id 15.01.1240.018;
	Wed, 12 Jul 2017 10:27:31 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Auger Eric
	<eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuAgAAYhwCAAABHwIABqBOAgAAO8rCAAK1NgIAAlZ9ggAAUmACAAEJWMIAAQhWAgAWiB3CAAH22AIAA+W8QgABuLgCAAAA+4A==
Date: Wed, 12 Jul 2017 10:27:31 +0000
Message-ID: <HE1PR0401MB25560018AA040A0B6A97BF599AAF0@HE1PR0401MB2556.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
	<AM5PR0401MB2545C23F66D6D0E096DCB0369AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<a67cb139-e1b6-02fc-d451-4001bcbfceb3@redhat.com>
	<AM5PR0401MB2545A78764598CD87827B14F9AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<615e22ce-80b3-b000-360f-7272a867cdf9@arm.com>
	<AM5PR0401MB2545F60CA898D23D5E2F1E6D9AAE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9cdd8947-2c8a-4106-1a1a-56c2238843d6@arm.com>
	<AM5PR0401MB25457988FA1531A684FF0DC09AAF0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<659fc660-9f3b-7ef4-a041-8ba6d49e8345@arm.com>
In-Reply-To: <659fc660-9f3b-7ef4-a041-8ba6d49e8345@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
	header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB2554;
	7:h3Qpjj8vhxqf4/CpgqETClF2uISzO3Wyv5gVC83Y9/hRx4UwhjoH3VMLwiN+emGsgkK32BPYgQDENaXpc0n9yQA7XmlLFUFCZ6g39407Hkf3XA6i1AfPtD/BYHI92tEgQm2q4KfQWfgXszRBrQ3YUH3gEBdmfeRB7RgVZ6HGvUOCZrZlvZOaDq35S300hpV+gEziO1ThueFyiF+UJzCwZQqP8szMVbMy9GAzYlZXcmqCHSrURWmAZkyBgaM6EgIEk9P2Pm5G5bxLWnHJXzzQRea6bXI90IB1c3O/vlNirz4t/Zhc6gj7AFMPlVofMola4f7SG2vqKNPr++5/KeQD3r35zCZvC/6stkUl1hDinXFMXoVmbssijeDz7WBrLjXRc+W2FfKaV+TGFMR9ZFU/CWRm+zJcnPKiu2T/cBbKCawhB16kgwGipVvrvowU0uxLczkwcKEu2Zjz03sWNiLR6tBNAZA5g+KgmV7Vz/EWTuecZmKDux9r7eyBgXSzO8IG+GFDQgr35RXUDviBgWShllaRcqX2E5LRFN3oomQ12U+mfEflLzXeN7SOu/Gwew6eq+WA4NOUhdO4Frah+spGm8ZCBesDx0f3YVXQziIuvNg8Qky7M4kurS42I8qzVzMGS3+0/zAsXWnmgj3pFLJp7u3h8KXmzP5NQn1D5iOYA7chBbJfnS+1YKkemPBjjwd3w0nYZsbvLv4HnTDS73m9WBNFNbcIxxL56AlzO//dMo+X7q+2AOWuR2aeUDnK9iaGOgROqjGfNVC9c4SzkIzMFfgmFyzNQaXxHSRNmrFWdmQ=
x-ms-office365-filtering-correlation-id: 5ef20af3-1b35-40df-5427-08d4c9109a9e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0401MB2554; 
x-ms-traffictypediagnostic: HE1PR0401MB2554:
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(148574349560750)(228905959029699)(247924648384137);
x-microsoft-antispam-prvs: <HE1PR0401MB25547E5DDD769871064FC6099AAF0@HE1PR0401MB2554.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0401MB2554; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0401MB2554; 
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(39850400002)(39410400002)(39840400002)(39400400002)(39450400003)(39860400002)(13464003)(24454002)(377454003)(38730400002)(74316002)(2950100002)(189998001)(478600001)(50986999)(6116002)(54356999)(76176999)(6246003)(6506006)(7736002)(551934003)(7696004)(39060400002)(53936002)(33656002)(5660300001)(55016002)(3846002)(14454004)(54906002)(99286003)(2906002)(66066001)(102836003)(7416002)(4326008)(3280700002)(229853002)(5250100002)(8936002)(9686003)(8676002)(2900100001)(25786009)(305945005)(5890100001)(93886004)(86362001)(575784001)(3660700001)(6436002)(81166006)(2201001)(2501003)(53546010)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB2554;
	H:HE1PR0401MB2556.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2017 10:27:31.4465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2554
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.85
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BYGzlKi6Fuyd

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVhbi1QaGlsaXBwZSBC
cnVja2VyIFttYWlsdG86amVhbi1waGlsaXBwZS5icnVja2VyQGFybS5jb21dDQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAxMiwgMjAxNyAzOjQ4IFBNDQo+IFRvOiBCaGFyYXQgQmh1c2hhbiA8Ymhh
cmF0LmJodXNoYW5AbnhwLmNvbT47IEF1Z2VyIEVyaWMNCj4gPGVyaWMuYXVnZXJAcmVkaGF0LmNv
bT47IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNvbTsNCj4gcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
OyBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207DQo+IHFlbXUtYXJt
QG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogd2VpQHJlZGhhdC5jb207
IGtldmluLnRpYW5AaW50ZWwuY29tOyBtYXJjLnp5bmdpZXJAYXJtLmNvbTsNCj4gdG5Ac2VtaWhh
bGYuY29tOyB3aWxsLmRlYWNvbkBhcm0uY29tOyBkcmpvbmVzQHJlZGhhdC5jb207DQo+IHJvYmlu
Lm11cnBoeUBhcm0uY29tOyBjaHJpc3RvZmZlci5kYWxsQGxpbmFyby5vcmcNCj4gU3ViamVjdDog
UmU6IFtRZW11LWRldmVsXSBbUkZDIHYyIDAvOF0gVklSVElPLUlPTU1VIGRldmljZQ0KPiANCj4g
T24gMTIvMDcvMTcgMDQ6NTAsIEJoYXJhdCBCaHVzaGFuIHdyb3RlOg0KPiBbLi4uXQ0KPiA+PiBU
aGUgc2l6ZSBvZiB0aGUgdmlydGlvX2lvbW11X3JlcV9wcm9iZSBzdHJ1Y3R1cmUgaXMgdmFyaWFi
bGUsIGFuZA0KPiBkZXBlbmRzDQo+ID4+IHdoYXQgZmllbGRzIHRoZSBkZXZpY2UgaW1wbGVtZW50
cy4gU28gdGhlIGRldmljZSBpbml0aWFsbHkgY29tcHV0ZXMgdGhlDQo+IHNpemUgaXQNCj4gPj4g
bmVlZHMgdG8gZmlsbCB2aXJ0aW9faW9tbXVfcmVxX3Byb2JlLCBkZXNjcmliZXMgaXQgaW4gcHJv
YmVfc2l6ZSwgYW5kIHRoZQ0KPiA+PiBkcml2ZXIgYWxsb2NhdGVzIHRoYXQgbWFueSBieXRlcyBm
b3IgdmlydGlvX2lvbW11X3JlcV9wcm9iZS5jb250ZW50W10NCj4gPj4NCj4gPj4+PiAqIFdoZW4g
ZGV2aWNlIG9mZmVycyBWSVJUSU9fSU9NTVVfRl9QUk9CRSwgdGhlIGRyaXZlciBzaG91bGQNCj4g
c2VuZA0KPiA+PiBhbg0KPiA+Pj4+IFZJUlRJT19JT01NVV9UX1BST0JFIHJlcXVlc3QgZm9yIGVh
Y2ggbmV3IGVuZHBvaW50Lg0KPiA+Pj4+ICogVGhlIGRyaXZlciBhbGxvY2F0ZXMgYSBkZXZpY2Ut
d3JpdGVhYmxlIGJ1ZmZlciBvZiBwcm9iZV9zaXplIChwbHVzDQo+ID4+Pj4gZnJhbWluZykgYW5k
IHNlbmRzIGl0IGFzIGEgVklSVElPX0lPTU1VX1RfUFJPQkUgcmVxdWVzdC4NCj4gPj4+PiAqIFRo
ZSBkZXZpY2UgZmlsbHMgdGhlIGJ1ZmZlciB3aXRoIHZhcmlvdXMgaW5mb3JtYXRpb24uDQo+ID4+
Pj4NCj4gPj4+PiBzdHJ1Y3QgdmlydGlvX2lvbW11X3JlcV9wcm9iZSB7DQo+ID4+Pj4gCS8qIGRl
dmljZS1yZWFkYWJsZSAqLw0KPiA+Pj4+IAlzdHJ1Y3QgdmlydGlvX2lvbW11X3JlcV9oZWFkIGhl
YWQ7DQo+ID4+Pj4gCWxlMzIgZGV2aWNlOw0KPiA+Pj4+IAlsZTMyIGZsYWdzOw0KPiA+Pj4+DQo+
ID4+Pj4gCS8qIG1heWJlIGFsc28gbGUzMiBjb250ZW50X3NpemUsIGJ1dCBpdCBtdXN0IGJlIGVx
dWFsIHRvDQo+ID4+Pj4gCSAgIHByb2JlX3NpemUgKi8NCj4gPj4+DQo+ID4+PiBDYW4geW91IHBs
ZWFzZSBkZXNjcmliZSB3aHkgd2UgbmVlZCB0byBwYXNzIHNpemUgb2YgInByb2JlX3NpemUiIGlu
DQo+IHByb2JlDQo+ID4+IHJlcXVlc3Q/DQo+ID4+DQo+ID4+IFdlIGRvbid0LiBJIGRvbid0IHRo
aW5rIHdlIHNob3VsZCBhZGQgdGhpcyAnY29udGVudF9zaXplJyBmaWVsZCB1bmxlc3MgdGhlcmUN
Cj4gaXMNCj4gPj4gYSBjb21wZWxsaW5nIHJlYXNvbiB0byBkbyBzby4NCj4gPj4NCj4gPj4+Pg0K
PiA+Pj4+IAkvKiBkZXZpY2Utd3JpdGVhYmxlICovDQo+ID4+Pj4gCXU4IGNvbnRlbnRbXTsNCj4g
Pj4+DQo+ID4+PiBJIGFzc3VtZSBjb250ZW50X3NpemUgYWJvdmUgaXMgdGhlIHNpemUgb2YgYXJy
YXkgImNvbnRlbnRbXSIgYW5kIG1heA0KPiB2YWx1ZQ0KPiA+PiBjYW4gYmUgZXF1YWwgdG8gcHJv
YmVfc2l6ZSBhZHZlcnRpc2VkIGJ5IGRldmljZT8NCj4gPj4NCj4gPj4gcHJvYmVfc2l6ZSBpcyBl
eGFjdGx5IHRoZSBzaXplIG9mIGFycmF5IGNvbnRlbnRbXS4gVGhlIGRyaXZlciBtdXN0IGFsbG9j
YXRlIGENCj4gPj4gYnVmZmVyIG9mIHRoaXMgc2l6ZSAocGx1cyB0aGUgc3BhY2UgbmVlZGVkIGZv
ciBoZWFkLCBkZXZpY2UsIGZsYWdzIGFuZCB0YWlsKS4NCj4gPj4NCj4gPj4gVGhlbiB0aGUgZGV2
aWNlIGlzIGZyZWUgdG8gbGVhdmUgcGFydHMgb2YgY29udGVudFtdIGVtcHR5LiBGaWVsZCAndHlw
ZScgMCB3aWxsDQo+IGJlDQo+ID4+IHJlc2VydmVkIGFuZCBtYXJrIHRoZSBlbmQgb2YgdGhlIGFy
cmF5Lg0KPiA+Pg0KPiA+Pj4+IAlzdHJ1Y3QgdmlydGlvX2lvbW11X3JlcV90YWlsIHRhaWw7DQo+
ID4+Pj4gfTsNCj4gPj4+Pg0KPiA+Pj4+IEknbSBzdGlsbCBzdHJ1Z2dsaW5nIHdpdGggdGhlIGNv
bnRlbnQgYW5kIGxheW91dCBvZiB0aGUgcHJvYmUNCj4gPj4+PiByZXF1ZXN0LCBhbmQgd291bGQg
YXBwcmVjaWF0ZSBhbnkgZmVlZGJhY2suIFRvIGJlIGVhc2lseSBleHRlbmRlZCwgSQ0KPiA+Pj4+
IHRoaW5rIGl0IHNob3VsZCBjb250YWluIGEgbGlzdCBvZiBmaWVsZHMgb2YgdmFyaWFibGUgc2l6
ZToNCj4gPj4+Pg0KPiA+Pj4+IAl8MCAgICAgICAgICAgMTV8MTYgICAgICAgICAgIDMxfDMyICAg
ICAgICAgICAgICAgTnwNCj4gPj4+PiAJfCAgICAgdHlwZSAgICAgfCAgICBsZW5ndGggICAgIHwg
ICAgICB2YWx1ZXMgICAgICB8DQo+ID4+Pj4NCj4gPj4+PiAnbGVuZ3RoJyBtaWdodCBiZSBtYWRl
IG9wdGlvbmFsIGlmIGl0IGNhbiBiZSBkZWR1Y2VkIGZyb20gdHlwZSwgYnV0DQo+ID4+Pj4gbWln
aHQgbWFrZSBkcml2ZXItc2lkZSBwYXJzaW5nIG1vcmUgcm9idXN0Lg0KPiA+Pj4+DQo+ID4+Pj4g
VGhlIHByb2JlIGNvdWxkIGVpdGhlciBiZSBkb25lIGZvciBlYWNoIGVuZHBvaW50LCBvciBmb3Ig
ZWFjaCBhZGRyZXNzDQo+ID4+Pj4gc3BhY2UuIEkgbXVjaCBwcmVmZXIgZW5kcG9pbnQgYmVjYXVz
ZSBpdCBpcyB0aGUgc21hbGxlc3QgZ3JhbnVsYXJpdHkuDQo+ID4+Pj4gVGhlIGRyaXZlciBjYW4g
dGhlbiBkZWNpZGUgd2hhdCBlbmRwb2ludHMgdG8gcHV0IHRvZ2V0aGVyIGluIHRoZSBzYW1lDQo+
ID4+Pj4gYWRkcmVzcyBzcGFjZSBiYXNlZCBvbiB0aGVpciBpbmRpdmlkdWFsIGNhcGFiaWxpdGll
cy4gVGhlDQo+ID4+Pj4gc3BlY2lmaWNhdGlvbiB3b3VsZCBkZXNjcmliZWQgaG93IGVhY2ggZW5k
cG9pbnQgcHJvcGVydHkgaXMgY29tYmluZWQNCj4gPj4+PiB3aGVuIGVuZHBvaW50cyBhcmUgcHV0
IGluIHRoZSBzYW1lIGFkZHJlc3Mgc3BhY2UuIEZvciBleGFtcGxlLCB0YWtlDQo+ID4+Pj4gdGhl
IG1pbmltdW0gb2YgYWxsIFBBU0lEIHNpemUsIHRoZSBtYXhpbXVtIG9mIGFsbCBwYWdlIGdyYW51
bGFyaXRpZXMsDQo+ID4+Pj4gY29tYmluZSBkb29yYmVsbCBhZGRyZXNzZXMsIGV0Yy4NCj4gPj4+
Pg0KPiA+Pj4+IElmIHdlIGRpZCB0aGUgcHJvYmUgb24gYWRkcmVzcyBzcGFjZXMgaW5zdGVhZCwg
dGhlIGRyaXZlciB3b3VsZCBoYXZlDQo+ID4+Pj4gdG8gcmUtc2VuZCBhIHByb2JlIHJlcXVlc3Qg
ZWFjaCB0aW1lIGEgbmV3IGVuZHBvaW50IGlzIGF0dGFjaGVkIHRvIGFuDQo+ID4+Pj4gZXhpc3Rp
bmcgYWRkcmVzcyBzcGFjZSwgdG8gc2VlIGlmIGl0IGlzIHN0aWxsIGNhcGFibGUgb2YgcGFnZSB0
YWJsZQ0KPiA+Pj4+IGhhbmRvdmVyIG9yIGlmIHRoZSBkcml2ZXIganVzdCBjb21iaW5lZCBhIFZG
SU8gYW5kIGFuIGVtdWxhdGVkDQo+ID4+Pj4gZW5kcG9pbnQgYnkgYWNjaWRlbnQuDQo+ID4+Pj4N
Cj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqKioNCj4gPj4+Pg0KPiA+
Pj4+IFVzaW5nIHRoaXMgZnJhbWV3b3JrLCB0aGUgZGV2aWNlIGNhbiBkZWNsYXJlIGRvb3JiZWxs
IHJlZ2lvbnMgYnkNCj4gPj4+PiBhZGRpbmcgb25lIG9yIG1vcmUgUkVTViBmaWVsZHMgaW50byB0
aGUgcHJvYmUgYnVmZmVyOg0KPiA+Pj4+DQo+ID4+Pj4gLyogJ3R5cGUnICovDQo+ID4+Pj4gI2Rl
ZmluZSBWSVJUSU9fSU9NTVVfUFJPQkVfVF9SRVNWIAkweDENCj4gPj4+Pg0KPiA+Pj4+IC8qICd2
YWx1ZXMnLiAnbGVuZ3RoJyBpcyBzaXplb2Yoc3RydWN0IHZpcnRpb19pb21tdV9wcm9iZV9yZXN2
KSAqLw0KPiA+Pj4+IHN0cnVjdCB2aXJ0aW9faW9tbXVfcHJvYmVfcmVzdiB7DQo+ID4+Pj4gCWxl
NjQgZ3BhOw0KPiA+Pj4+IAlsZTY0IHNpemU7DQo+ID4+Pj4NCj4gPj4+PiAjZGVmaW5lIFZJUlRJ
T19JT01NVV9QUk9CRV9SRVNWX01TSQkweDENCj4gPj4+PiAJdTggdHlwZTsNCj4gPg0KPiA+IFRv
IGJlIHN1cmUgSSBhbSB1bmRlcnN0YW5kaW5nIGl0IGNvcnJlY3RseSwgSXMgdGhpcyAidHlwZSIg
aW4gc3RydWN0DQo+IHZpcnRpb19pb21tdV9yZXFfaGVhZD8NCj4gDQo+IE5vLCB2aXJ0aW9faW9t
bXVfcmVxX2hlYWQ6OnR5cGUgaXMgdGhlIHJlcXVlc3QgdHlwZQ0KPiAoQVRUQUNIL0RFVEFDSC9N
QVAvVU5NQVAvUFJPQkUpLg0KPiANCj4gVGhlbiB2aXJ0aW9faW9tbXVfcHJvYmVfcHJvcGVydHk6
OnR5cGUgaXMgdGhlIHByb3BlcnR5IHR5cGUgKG9ubHkgUkVTVg0KPiBmb3INCj4gdGhlIG1vbWVu
dCkuDQo+IA0KPiBBbmQgdGhpcyBpcyB2aXJ0aW9faW9tbXVfcHJvYmVfcmVzdjo6dHlwZSwgd2hp
Y2ggaXMgdGhlIHR5cGUgb2YgdGhlIHJlc3YNCj4gcmVnaW9uIChNU0kpLiBJIHJlbmFtZWQgaXQg
dG8gJ3N1YnR5cGUnIGJlbG93LCBidXQgSSB0aGluayBpdCBzdGlsbCBpcw0KPiBwcmV0dHkgY29u
ZnVzaW5nLg0KPiANCj4gDQo+IEkgZGlkIGEgbnVtYmVyIG9mIGNoYW5nZXMgdG8gc3RydWN0dXJl
cyBhbmQgbmFtaW5nIHdoZW4gdHJ5aW5nIHRvDQo+IGludGVncmF0ZSBpdCB0byB0aGUgc3BlY2lm
aWNhdGlvbjoNCj4gDQo+ICogQWRkZWQgNjQgYnl0ZXMgb2YgcGFkZGluZyBpbiB2aXJ0aW9faW9t
bXVfcmVxX3Byb2JlLCBzbyB0aGF0IGZ1dHVyZQ0KPiBleHRlbnNpb25zIGNhbiBhZGQgZmllbGRz
IGluIHRoZSBkZXZpY2UtcmVhZGFibGUgcGFydC4NCj4gKiByZW5hbWVkICJSRVNWIiB0byAiUkVT
Vl9NRU0iLg0KPiAqIFRoZSByZXN2X21lbSBwcm9wZXJ0eSBub3cgbG9va3MgbGlrZSB0aGlzOg0K
PiAgIHN0cnVjdCB2aXJ0aW9faW9tbXVfcHJvYmVfcmVzdl9tZW0gew0KPiAgICAgICAgIHU4ICAg
ICAgc3VidHlwZTsNCj4gICAgICAgICB1OCAgICAgIHBhZGRpbmdbM107DQo+ICAgICAgICAgbGUz
MiAgICBmbGFnczsNCj4gICAgICAgICBsZTY0ICAgIGFkZHI7DQo+ICAgICAgICAgbGU2NCAgICBz
aXplOw0KPiAgIH07DQo+ICogc3VidHlwZSBmb3IgTVNJIGRvb3JiZWxscyBpcyBub3cNCj4gVklS
VElPX0lPTU1VX1BST0JFX1JFU1ZfTUVNX1RfQllQQVNTDQo+IChiZWNhdXNlIHRyYW5zYWN0aW9u
cyB0byB0aGlzIHJlZ2lvbiBieXBhc3MgdGhlIElPTU1VKS4gJ2ZsYWdzJyBjb250YWluIGENCj4g
aGludCBWSVJUSU9fSU9NTVVfUFJPQkVfUkVTVl9NRU1fRl9NU0ksIHRlbGxpbmcgdGhlIGRyaXZl
ciB0aGF0IHRoaXMNCj4gcmVnaW9uIGlzIHVzZWQgZm9yIE1TSXMuDQo+IA0KPiBIZXJlIGlzIGFu
IGV4YW1wbGUgb2YgYSBwcm9iZSByZXF1ZXN0IHJldHVybmluZyBhbiBNU0kgZG9vcmJlbGwgcHJv
cGVydHkuDQo+IA0KPiAgICAgIDMxICAgICAgICAgICAgICAgICAgICAgICA3ICAgICAgMA0KPiAg
ICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gICAgIHwgICAgICAgICAg
IDAgICAgICAgICAgICB8ICB0eXBlICB8IDwtIHJlcXVlc3QgdHlwZSA9IFBST0JFICg1KQ0KPiAg
ICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gICAgIHwgICAgICAgICAg
ICAgZGV2aWNlICAgICAgICAgICAgICB8DQo+ICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKw0KPiAgICAgOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDoNCj4g
ICAgIDogICAgICAgICAgKDY0QiBwYWRkaW5nKSAgICAgICAgICA6DQo+ICAgICA6ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOg0KPiAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsNCj4gICBeIHwgIGxlbmd0aCA9IDI0ICAgfCAgICB0eXBlID0gMSAgICB8IDwt
IHByb3BlcnR5IHR5cGUgPSBSRVNWX01FTSAoMSkNCj4gICB8ICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rDQo+ICAgfCB8ICAgICAgICAgICAwICAgICAgICAgICAgfHN1YnR5cGUg
fCA8LSBSRVNWX01FTSBzdWJ0eXBlID0gQllQQVNTICgxKQ0KPiAgcHwgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gIHJ8IHwgICAgICAgICAgIGZsYWdzID0gTVNJICAgICAg
ICAgICB8DQo+ICBvfCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiAgYnwg
fCAgICAgICAgIGFkZHIgPSAweGZlZTAwMDAwICAgICAgIHwNCj4gIGV8IHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8DQo+ICBffCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKw0KPiAgc3wgfCAgICAgICAgIHNpemUgPSAweDAwMTAwMDAwICAgICAgIHwNCj4gIGl8
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICB6fCArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiAgZXwgfCAgICBsZW5ndGggICAgICB8ICAgICAgdHlw
ZSAgICAgIHwgPC0gYW5vdGhlciBwcm9wZXJ0eSBtYXkgc3RhcnQNCj4gICB8IDogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA6ICAgIGhlcmUNCj4gICB2IDogICAgICAgICAgICAgICAu
Li4gICAgICAgICAgICAgICA6DQo+ICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKw0KPiAgICAgfCAgICAgICAgICAgMCAgICAgICAgICAgIHwgc3RhdHVzIHwgPC0gcmVxdWVz
dCB0YWlsDQo+ICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KDQpTbyB3
ZSB3YW50IGEgc2luZ2xlIHByb2JlIHdpbGwgcmV0dXJuIGluZm8gb2YgYWxsICJ0eXBlcyIgYW5k
IGVhY2ggInN1YnR5cGUiIG9mIGdpdmVuICJ0eXBlIj8gSSB3YXMgb2YgaW1wcmVzc2lvbiB0aGF0
IGJhc2VkIG9uIGZsYWdzIHRoZXJlIHdpbGwgYmUgc2VwYXJhdGUgcHJvYmUgcmVxdWVzdCBmb3Ig
YSB0eXBlLg0KDQpUaGFua3MNCi1CaGFyYXQNCg0KPiANCj4gDQo+IEknbGwgdHJ5IHRvIHNlbmQg
dGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgc3BlYyBvdXQgYXMgc29vbiBhcyBwb3NzaWJsZS4NCj4g
DQo+IFRoYW5rcywNCj4gSmVhbg0KPiANCj4gDQo+ID4gVGhhbmtzDQo+ID4gLUJoYXJhdA0KPiA+
DQo+ID4+Pg0KPiA+Pj4gdHlwZSBpcyAxNiBiaXQgYWJvdmU/DQo+ID4+DQo+ID4+IEFoLCB0aGUg
bmFtaW5nIGlzbid0IGdyZWF0LiBUaGlzIGlzIG5vdCB0aGUgc2FtZSBhcyBhYm92ZSwgYW5kIGNv
dWxkIGJlDQo+IGNhbGxlZA0KPiA+PiAnc3VidHlwZScgdG8gYXZvaWQgY29uZnVzaW9uLiBUaGUg
YWJvdmUgMTYtYml0IHR5cGUgZGVzY3JpYmVzIHRoZSBmaWVsZA0KPiB0eXBlLA0KPiA+PiBlLmcu
IHN0cnVjdCB2aXJ0aW9faW9tbXVfcHJvYmVfcmVzdi4gSSBwcm9wb3NlZCAxNi1iaXQgYmVjYXVz
ZSBpdCBzZWVtcw0KPiA+PiBlYXN5IHRvIHJlYWNoIG1vcmUgdGhhbiAyNTUga2luZHMgb2YgZW5k
cG9pbnQgcHJvcGVydGllcywgYnV0DQo+ID4+IDY1NTM1IHNob3VsZCBkby4NCj4gPj4NCj4gPj4g
VGhpcyBzdWJ0eXBlIGRlc2NyaWJlcyB3aGljaCBraW5kIG9mIHJlc3YgcmVnaW9uIGlzIGRlc2Ny
aWJlZCBpbiB0aGUNCj4gc3RydWN0dXJlLg0KPiA+PiBGb3IgdGhlIG1vbWVudCB0aGVyZSBvbmx5
IGlzIFZJUlRJT19JT01NVV9QUk9CRV9SRVNWX01TSSwgYnV0IHdlDQo+ID4+IGNvdWxkIGZvciBl
eGFtcGxlIGFkZCByZXN2IHJlZ2lvbnMgdGhhdCB0aGUgZHJpdmVyIHNob3VsZCBuZXZlciB1c2Ug
b3INCj4gdGhhdCBpdA0KPiA+PiBzaG91bGQgaWRlbnRpdHktbWFwIChlcXVpdmFsZW50IHRvIElP
TU1VX1JFU1ZfUkVTRVJWRUQvRElSRUNUIGluDQo+ID4+IExpbnV4KS4gSSB0aGluayA4IGJpdHMg
c2hvdWxkIGJlIGVub3VnaCB0byBjb250YWluIGFueSBmdXR1cmUgdHlwZXMsIHVubGVzcw0KPiB3
ZQ0KPiA+PiBtYWtlIHRoaXMgYSBiaXRmaWVsZC4gRm9yIGlkZW50aXR5LW1hcCwgdGhlcmUgbWF5
IGJlIGFuIGFkZGl0aW9uYWwgZmxhZ3MNCj4gZmllbGQNCj4gPj4gZGVzY3JpYmluZyB0aGUgcHJv
dGVjdGlvbi4NCj4gPj4NCj4gPj4+PiB9Ow0KPiA+Pj4+DQo+ID4+Pj4gU3VjaCBhIHJlZ2lvbiB3
b3VsZCBiZSBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgcnVsZXM6DQo+ID4+Pj4NCj4gPj4+PiAq
IERyaXZlciBzaG91bGQgbm90IHVzZSBhbnkgSU9WQSBkZWNsYXJlZCBhcyBSRVNWX01TSSBpbiBh
IG1hcHBpbmcuDQo+ID4+Pj4gKiBEZXZpY2Ugc2hvdWxkIGxlYXZlIGFueSB0cmFuc2FjdGlvbiBt
YXRjaGluZyBhIFJFU1ZfTVNJIHJlZ2lvbiBwYXNzDQo+ID4+Pj4gdGhyb3VnaCB1bnRyYW5zbGF0
ZWQuDQo+ID4+Pj4gKiBJZiB0aGUgZGV2aWNlIGRvZXMgbm90IGFkdmVydGlzZSBhbnkgUkVTViBy
ZWdpb24sIHRoZW4gdGhlIGRyaXZlcg0KPiA+Pj4+IHNob3VsZCBhc3N1bWUgdGhhdCBNU0kgZG9v
cmJlbGxzLCBsaWtlIGFueSBvdGhlciBHUEEsIG11c3QgYmUNCj4gbWFwcGVkDQo+ID4+Pj4gd2l0
aCBhbiBhcmJpdHJhcnkgSU9WQSBpbiBvcmRlciBmb3IgdGhlIGVuZHBvaW50IHRvIGFjY2VzcyB0
aGVtLg0KPiA+Pj4+ICogR2l2ZW4gdGhhdCB0aGUgZHJpdmVyICpzaG91bGQqIHBlcmZvcm0gYSBw
cm9iZSByZXF1ZXN0IGlmDQo+ID4+Pj4gYXZhaWxhYmxlLCBhbmQgaXQgKnNob3VsZCogdW5kZXJz
dGFuZCB0aGUNCj4gPj4gVklSVElPX0lPTU1VX1BST0JFX1RfUkVTVg0KPiA+Pj4+IGZpZWxkLCB0
aGVuIHRoaXMgZmllbGQgdGVsbHMgdGhlIGd1ZXN0IGhvdyBpdCBzaG91bGQgaGFuZGxlIE1TSQ0K
PiA+Pj4+IGRvb3JiZWxscywgYW5kIHdoZXRoZXIgaXQgc2hvdWxkIG1hcCB0aGUgYWRkcmVzcyB2
aWEgTUFQIHJlcXVlc3RzIG9yDQo+ID4+IG5vdC4NCj4gPj4+Pg0KPiA+Pj4+IERvZXMgdGhpcyBt
YWtlIHNlbnNlIGFuZCBkaWQgSSBvdmVybG9vayBzb21ldGhpbmc/DQo+ID4+Pg0KPiA+Pj4gT3Zl
cmFsbCBpdCBsb29rcyBnb29kIHRvIG1lLiBEbyB5b3UgaGF2ZSBwbGFucyB0byBpbXBsZW1lbnRz
IHRoaXMgaW4NCj4gdmlydGlvLQ0KPiA+PiBpb21tdSBkcml2ZXIgYW5kIGt2bXRvb2w/DQo+ID4+
DQo+ID4+IFllcywgaWYgdGhlcmUgaXMgbm8gb2JqZWN0aW9uIEknbGwgdHJ5IHRvIGZvcm1hbGl6
ZSBpdCBhbmQgaW1wbGVtZW50IGl0IHJpZ2h0DQo+IGF3YXkuDQo+ID4+DQo+ID4+IFRoYW5rcywN
Cj4gPj4gSmVhbg0KDQo=
