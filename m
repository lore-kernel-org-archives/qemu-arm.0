Received: by 10.25.44.15 with SMTP id s15csp388551lfs;
        Wed, 5 Jul 2017 00:33:13 -0700 (PDT)
X-Received: by 10.55.49.18 with SMTP id x18mr49819278qkx.248.1499239993666;
        Wed, 05 Jul 2017 00:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499239993; cv=none;
        d=google.com; s=arc-20160816;
        b=rrDj0VX0caLOuMoow2ZKqyPonpmniDdX1gyUdIPj8AO0V9Ol1CQhKqEtKcpHyacJFD
         PBlMHNwa/6/E9n4hFUQdptO6E7tOdDyacuZXqPCdG7/y5SyixT8xvtEm98f4dclvL6Wa
         xu1rOvvqa8bSRJJb1oXA/gngfrO57BwRhXnX8M4rq2ji49Gi3b70PfNryLwYto83+ylS
         /5pa+xqRLACFRBwK7A5PwHz6ycFxE5ohBL5o9qhd3x9+bo6s08q4WAszmrWHAcZiHlaV
         rLYg8kVWscknTSkqrtog5/LMu1V4eWd+TLfK5UXxceARbasVqZKufpl8Jy05ANPeLjG8
         bNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=amkXcWPODtdZD4hOLgwSJPxjOkG8aVYu0kwgKHDJLnk=;
        b=gS6aWLqiiJvRahxLrdQ49WRCtK4HzEEGtA5hehwb7kGXtOQqmhBbMVRGTgaOYumNyF
         B9p7WXC8GiPWzXN3MlZX5jGsy0hz0sMTl7Q+7rsXEW/5WZuMiWYNxUw6zStxo3vxG48e
         PHh6EFBuRqOOBXpg8fX0u5cykpBM+aZE1QxPf+9w9DeD+vJwaInTKCch3kfRi9ecZ/UL
         4Cce30Lvrp5xK9MpENFK/B+fQaRIUzPJMUwQxnTWXNwfpvdvt+5+uOEwNfhr7x+PyYaL
         JqmFC24H1Z+U/ujgh2dzGwJf9o+B95Y518wJ0CO3niEz+OfxKmDzLFgx8VxxboCj3lky
         /gDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=ArbBWYSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h63si18378732qkd.279.2017.07.05.00.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 00:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=ArbBWYSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:44567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSeoA-0004oQ-Tk
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 03:33:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSeX1-0004vW-V7
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 03:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSeWx-0007my-JV
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 03:15:27 -0400
Received: from mail-he1eur01on0087.outbound.protection.outlook.com
	([104.47.0.87]:39563
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dSeWw-0007lu-VS; Wed, 05 Jul 2017 03:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=amkXcWPODtdZD4hOLgwSJPxjOkG8aVYu0kwgKHDJLnk=;
	b=ArbBWYSZfvC4x6mDuQa4+iiGVMdmRY9rO6Mt/onSOwbldJnETT41g9zlzlbpPSN5qwkd0yaYewnVW9qmHxrmi6JXiGyyg9rTtoWQs3FIJOVSMYDaXXlXuaWUQFU2tmGr4WTJQPvWcfPgIRZTFXfdCbUJNGlJaflYlbA8tAzUnVo=
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com (10.168.148.10) by
	HE1PR0401MB2553.eurprd04.prod.outlook.com (10.168.148.7) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Wed, 5 Jul 2017 07:15:18 +0000
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88]) by
	HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88%18]) with mapi id 15.01.1220.018;
	Wed, 5 Jul 2017 07:15:18 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Auger Eric
	<eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CAACvOAIAY8azQ
Date: Wed, 5 Jul 2017 07:15:18 +0000
Message-ID: <HE1PR0401MB25566B2B6CC08476BE69AD6A9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
In-Reply-To: <589f1642-775c-4805-74ac-bf67eb504733@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
	header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB2553;
	7:pWT6tZWb6bfSaok27HjlrQXkZ+gtyBZsEynDJM9gXh0vXWaU1HcOKXhs35xt3WEBiYb78SOLEQbm/Xbhf/LdnONUcjJThYUT3/2lni5B6zXwdqx28bq9knZuDb0NAzeswd+nj69yyYCSTGsNymbVZC3QiJQ0RWAw2noLI0uj98hTKfVWJ2F1xxNsN6aRCTX6b1KPZ1HhzlXd5B/g7YcGjv6XJY0PMsO4B3uL0GxDUUdFJ7rttrsMGHt9ACp0EMDQ9Tne9OSXmOfxZCC5MwjkErYUTEu2W1YfDhHctZ/gPNWVmjEnYcFMrIWGk1t3RscejZwHM31AxJ220uUn91Q1h6O70suMzv5fvOIsjPLQWjianRqWuYpZuh9w0kQyrlbuDtoYRaX+NqytziLDKFx5059Qw6bWiFxgZdyQCVacAF8m9YmcXrj1tBmy9ddk4zuvdLOASkst6Phvnvul44mUIoUBXG6Ftw8rOJ7mJJPuhzB/PdDhptaW6ehz1uiM12fqLAVxuynBh4gT6oQDhdOad13T4mQ+nalN25FUvNHeRB+empw5kGZoSjXDzx3g/wrrm3Y6j9pdk8bmlu5Y5CKDJW64PAd6YKfi8A2BU682O0JuOrH0Ud144MdZ/kF1WcQlAiARJrTj9gJ6QmmXMIH+Udfe4R5t67YQJeR3l7umdYUNAACpNtE8ZsyxeMvdha1kLdpD9SCpalxgHVkglOgLx7Oo5uHjU3EXsGhOMka7a4r4H4yCRUyhuw4WNttZFxujBdX07fPvyxdSUrMbquJvv3BA0sPIqACQnr/G1t9dYCQ=
x-ms-office365-filtering-correlation-id: 3c3683b8-1e23-4c35-2f43-08d4c3759776
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0401MB2553; 
x-ms-traffictypediagnostic: HE1PR0401MB2553:
x-microsoft-antispam-prvs: <HE1PR0401MB2553A698F226B0979715BE469AD40@HE1PR0401MB2553.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0401MB2553; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0401MB2553; 
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39450400003)(39400400002)(39860400002)(39840400002)(39850400002)(377454003)(24454002)(13464003)(99286003)(2906002)(189998001)(66066001)(39060400002)(93886004)(6246003)(8936002)(14454004)(53936002)(9686003)(2950100002)(7696004)(2501003)(74316002)(55016002)(54906002)(25786009)(81166006)(5660300001)(54356999)(76176999)(6436002)(478600001)(6506006)(53546010)(50986999)(3846002)(7736002)(33656002)(86362001)(2900100001)(305945005)(3660700001)(102836003)(38730400002)(6116002)(7416002)(2201001)(5250100002)(8676002)(4326008)(229853002)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB2553;
	H:HE1PR0401MB2556.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2017 07:15:18.3495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2553
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.87
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
X-TUID: Yh6fTDQx7r1O

SGkgSmVhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKZWFuLVBo
aWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNrZXJAYXJtLmNvbV0NCj4g
U2VudDogTW9uZGF5LCBKdW5lIDE5LCAyMDE3IDM6NDUgUE0NCj4gVG86IEJoYXJhdCBCaHVzaGFu
IDxiaGFyYXQuYmh1c2hhbkBueHAuY29tPjsgQXVnZXIgRXJpYw0KPiA8ZXJpYy5hdWdlckByZWRo
YXQuY29tPjsgZXJpYy5hdWdlci5wcm9AZ21haWwuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmc7IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsNCj4gcWVt
dS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiB3ZWlAcmVkaGF0
LmNvbTsga2V2aW4udGlhbkBpbnRlbC5jb207IG1hcmMuenluZ2llckBhcm0uY29tOw0KPiB0bkBz
ZW1paGFsZi5jb207IHdpbGwuZGVhY29uQGFybS5jb207IGRyam9uZXNAcmVkaGF0LmNvbTsNCj4g
cm9iaW4ubXVycGh5QGFybS5jb207IGNocmlzdG9mZmVyLmRhbGxAbGluYXJvLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtSRkMgdjIgMC84XSBWSVJUSU8tSU9NTVUgZGV2aWNlDQo+
IA0KPiBPbiAxOS8wNi8xNyAwODo1NCwgQmhhcmF0IEJodXNoYW4gd3JvdGU6DQo+ID4gSGkgRXJp
YywNCj4gPg0KPiA+IEkgc3RhcnRlZCBhZGRlZCByZXBsYXkgaW4gdmlydGlvLWlvbW11IGFuZCBj
YW1lIGFjcm9zcyBob3cgTVNJIGludGVycnVwdHMNCj4gd2l0aCB3b3JrIHdpdGggVkZJTy4NCj4g
PiBJIHVuZGVyc3RhbmQgdGhhdCBvbiBpbnRlbCB0aGlzIHdvcmtzIGRpZmZlcmVudGx5IGJ1dCB2
c21tdSB3aWxsIGhhdmUgc2FtZQ0KPiByZXF1aXJlbWVudC4NCj4gPiBrdm0tbXNpLWlycS1yb3V0
ZSBhcmUgYWRkZWQgdXNpbmcgdGhlIG1zaS1hZGRyZXNzIHRvIGJlIHRyYW5zbGF0ZWQgYnkNCj4g
dmlvbW11IGFuZCBub3QgdGhlIGZpbmFsIHRyYW5zbGF0ZWQgYWRkcmVzcy4NCj4gPiBXaGlsZSBj
dXJyZW50bHkgdGhlIGlycWZkIGZyYW1ld29yayBkb2VzIG5vdCBrbm93IGFib3V0IGVtdWxhdGVk
DQo+IGlvbW11cyAodmlydGlvLWlvbW11LCB2c21tdXYzL3ZpbnRlbC1pb21tdSkuDQo+ID4gU28g
aW4gbXkgdmlldyB3ZSBoYXZlIGZvbGxvd2luZyBvcHRpb25zOg0KPiA+IC0gUHJvZ3JhbW1pbmcg
d2l0aCB0cmFuc2xhdGVkIGFkZHJlc3Mgd2hlbiBzZXR0aW5nIHVwDQo+ID4ga3ZtLW1zaS1pcnEt
cm91dGUNCj4gPiAtIFJvdXRlIHRoZSBpbnRlcnJ1cHRzIHZpYSBRRU1VLCB3aGljaCBpcyBiYWQg
ZnJvbSBwZXJmb3JtYW5jZQ0KPiA+IC0gdmhvc3QtdmlydGlvLWlvbW11IG1heSBzb2x2ZSB0aGUg
cHJvYmxlbSBpbiBsb25nIHRlcm0NCj4gPg0KPiA+IElzIHRoZXJlIGFueSBvdGhlciBiZXR0ZXIg
b3B0aW9uIEkgYW0gbWlzc2luZz8NCj4gDQo+IFNpbmNlIHdlJ3JlIG9uIHRoZSB0b3BpYyBvZiBN
U0lzLi4uIEknbSBjdXJyZW50bHkgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgaG93IHdlJ2xsDQo+IGhh
bmRsZSBNU0lzIGluIHRoZSBuZXN0ZWQgdHJhbnNsYXRpb24gbW9kZSwgd2hlcmUgdGhlIGd1ZXN0
IG1hbmFnZXMNCj4gUzEgcGFnZSB0YWJsZXMgYW5kIHRoZSBob3N0IGRvZXNuJ3Qga25vdyBhYm91
dCBHVkEtPkdQQSB0cmFuc2xhdGlvbi4NCj4gDQo+IEknbSBhbHNvIHdvbmRlcmluZyBhYm91dCB0
aGUgYmVuZWZpdHMgb2YgaGF2aW5nIFNXLW1hcHBlZCBNU0lzIGluIHRoZQ0KPiBndWVzdC4gSXQg
c2VlbXMgdW5hdm9pZGFibGUgZm9yIHZTTU1VIHNpbmNlIHRoYXQncyB3aGF0IGEgcGh5c2ljYWwg
c3lzdGVtDQo+IHdvdWxkIGRvLiBCdXQgaW4gYSBwYXJhdmlydHVhbGl6ZWQgc29sdXRpb24gdGhl
cmUgZG9lc24ndCBzZWVtIHRvIGJlIGFueQ0KPiBjb21wZWxsaW5nIHJlYXNvbiBmb3IgaGF2aW5n
IHRoZSBndWVzdCBtYXAgTVNJIGRvb3JiZWxscy4gVGhlc2UgYWRkcmVzc2VzDQo+IGFyZSBuZXZl
ciBhY2Nlc3NlZCBkaXJlY3RseSwgdGhleSBhcmUgb25seSB1c2VkIGZvciBzZXR0aW5nIHVwIElS
USByb3V0aW5nIChhdA0KPiBsZWFzdCBvbiBrdm10b29sKS4gU28gaGVyZSdzIHdoYXQgSSdkIGxp
a2UgdG8gaGF2ZS4gTm90ZSB0aGF0IEkgaGF2ZW4ndA0KPiBpbnZlc3RpZ2F0ZWQgdGhlIGZlYXNp
YmlsaXR5IGluIFFlbXUgeWV0LCBJIGRvbid0IGtub3cgaG93IGl0IGRlYWxzIHdpdGggTVNJcy4N
Cj4gDQo+ICgxKSBHdWVzdCB1c2VzIHRoZSBndWVzdC1waHlzaWNhbCBNU0kgZG9vcmJlbGwgd2hl
biBzZXR0aW5nIHVwIE1TSXMuIEZvcg0KPiBBUk0gd2l0aCBHSUN2MyB0aGlzIHdvdWxkIGJlIEdJ
VFNfVFJBTlNMQVRFUiwgZm9yIHg4NiBpdCB3b3VsZCBiZSB0aGUNCj4gZml4ZWQgTVNJIGRvb3Ji
ZWxsLiBUaGlzIHdheSB0aGUgaG9zdCB3b3VsZG4ndCBuZWVkIHRvIGluc3BlY3QgSU9NTVUNCj4g
bWFwcGluZ3Mgd2hlbiBoYW5kbGluZyB3cml0ZXMgdG8gUENJIE1TSS1YIHRhYmxlcy4NCg0KU29y
cnkgZm9yIGxhdGUgcmVwbHksIGRvZXMgdGhpcyBtZWFuIHRoYXQgd2UgY2FuIHVzZSBJT01NVV9S
RVNWX01TSSBmb3IgdmlydGlvLWlvbW11IGRyaXZlcj8gVGhpcyB3aWxsIG5vdCBjcmVhdGUgbWFw
cGluZyBpbiBJT01NVT8NCkkgdHJpZWQgdGhpcyBQQ0kgcGFzcy10aHJvdWdoIHVzaW5nIFFFTVUg
KGludGVncmF0ZWQgdmZpbyB3aXRoIHZpcnRpby1pb21tdSkgYW5kIE1TSSBpbnRlcnJ1cHRzIHdv
cmtzIHdpdGhvdXQgYW55IGNoYW5nZS4NCg0KVGhhbmtzDQotQmhhcmF0DQoNCj4gDQo+ICgyKSBJ
biBuZXN0ZWQgbW9kZSAod2l0aCBWRklPKSBvbiBBUk0sIHRoZSBwU01NVSB3aWxsIHN0aWxsIHRy
YW5zbGF0ZSBNU0lzDQo+IHZpYSBTMStTMi4gVGhlcmVmb3JlIHRoZSBob3N0IG5lZWRzIHRvIG1h
cCBNU0lzIGF0IHN0YWdlLTEsIGFuZCBJJ2QgbGlrZSB0bw0KPiB1c2UgdGhlIChjdXJyZW50bHkg
dW51c2VkKSBUVEIxIHRhYmxlcyBpbiB0aGF0IGNhc2UuIEluIGFkZGl0aW9uLCB1c2luZw0KPiBU
VEIxIHdvdWxkIGJlIHVzZWZ1bCBmb3IgU1ZNLCB3aGVuIGVuZHBvaW50cyB3cml0ZSBNU0lzIHdp
dGggUEFTSURzIGFuZA0KPiB3ZSBkb24ndCB3YW50IHRvIG1hcCB0aGVtIGluIHVzZXIgYWRkcmVz
cyBzcGFjZS4NCj4gDQo+IFRoaXMgbWVhbnMgdGhhdCB0aGUgaG9zdCBuZWVkcyB0byB1c2UgZGlm
ZmVyZW50IGRvb3JiZWxsIGFkZHJlc3NlcyBpbiBuZXN0ZWQNCj4gbW9kZSwgc2luY2UgaXQgd291
bGQgYmUgdW5hYmxlIHRvIG1hcCBhdCBTMSB0aGUgc2FtZSBJT1ZBIGFzIFMyDQo+IChUVEIxIG1h
bmFnZXMgbmVnYXRpdmUgYWRkcmVzc2VzIC0gMHhmZmZmLi4uLi4uLi4uLi4uLCB3aGljaCBhcmUg
bm90DQo+IHJlcHJlc2VudGFibGUgYXMgR1BBcy4pIEl0IGFsc28gcmVxdWlyZXMgdG8gdXNlIDMy
LWJpdCBwYWdlIHRhYmxlcyBmb3INCj4gZW5kcG9pbnRzIHRoYXQgYXJlIG5vdCBjYXBhYmxlIG9m
IHVzaW5nIDY0LWJpdCBNU0kgYWRkcmVzc2VzLg0KPiANCj4gTm93ICgyKSBpcyBlbnRpcmVseSBo
YW5kbGVkIGluIHRoZSBob3N0IGtlcm5lbCwgc28gaXQncyBtb3JlIGEgTGludXggcXVlc3Rpb24u
DQo+IEJ1dCBkb2VzICgxKSBzZWVtIGFjY2VwdGFibGUgZm9yIHZpcnRpby1pb21tdSBpbiBRZW11
Pw0KPiANCj4gVGhhbmtzLA0KPiBKZWFuDQo=
