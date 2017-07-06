Received: by 10.25.44.15 with SMTP id s15csp2762003lfs;
        Thu, 6 Jul 2017 19:02:33 -0700 (PDT)
X-Received: by 10.237.44.7 with SMTP id f7mr69991981qtd.52.1499392953377;
        Thu, 06 Jul 2017 19:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499392953; cv=none;
        d=google.com; s=arc-20160816;
        b=R9BatmUmabU7gtz/JkN7M9Gm6Pl5Kw1+Z+o2Jc2MVmxQBQe+nT5vtAtAl4rN/gkBGk
         oPT/APCRF1zkHsg745ta/UF/i7Z83aECYx06b+KT3dozsNX4KeWH4zYEa/YhfQUsbQF2
         hi+WR2CgJMrrdNjKOVm4VYUKYw+ABqxVavaDX3jWuBGUOwauC+eqkVzt89C5/3o5+hDw
         kCYVqr9dKx1jT+F9mB20H0fS4fo2QB3UM2b0+45m3rdI4rUXxM2tFPx55rEtSs9PXI9I
         efP1lZRV5BOlPH9x/CTHBV++kPeMUDq2CDNezsuwN3mH6m2QO3IirX4L6bh+srLRfmGA
         Yeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=m+xDYLatSwWZYRUgT2mAqZbasaLfsttbUmqMeUd7LGA=;
        b=gozA/mBpcRcEnx0iSSEF4Ypo7L2i1NbEAL4RxbW0TZrPw+KkXw4bk29JU2KZ2lS78y
         T5qqSeS44zqmjGDD/CULvZna/XkwLepi4FWXhUEI5CleR6e4XCScyCgYO+EmzTw2Xe4q
         HMr/v7yOX3hcJ2Ujcjd541E7CNVKSWEFzLXVUCXWWYk5UO6+GhL+SlkymaHDUThuuxga
         xFPVaPMoWLsWp/RBRJdNSciJEw+o/OcLOLf/ZSaQfmSMluYyTyTzVpLiekIKA6dnf1pe
         /bhdZLlgCV7u22SpiTlRLqfqKuag0JKmnU1KCHC4D2vl7gBd+WsfpWguhz2pFBt+J6fT
         FUPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=GJ11n5kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b199si1801690qka.362.2017.07.06.19.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 19:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=GJ11n5kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTIbG-0003wP-GQ
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 22:02:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Ashish.Kalra@cavium.com>) id 1dTG7i-0003D2-13
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Ashish.Kalra@cavium.com>) id 1dTG7e-0000Nt-RX
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:23:50 -0400
Received: from mail-sn1nam02on0078.outbound.protection.outlook.com
	([104.47.36.78]:7920
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Ashish.Kalra@cavium.com>)
	id 1dTG7e-0000N0-6u; Thu, 06 Jul 2017 19:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=m+xDYLatSwWZYRUgT2mAqZbasaLfsttbUmqMeUd7LGA=;
	b=GJ11n5kj3GmHrrWLEKoIwErHRiHQpQ51wHAzTh1rvPW/IhG9DVmjpAWmFN7D6nJ//7dvnucbjOXW99jjD4GWuLm9eNYFsm7DTwM6S+OxHZixcdAGyuPp+ec9QqbAfyszDuf7WxZ6yd5QKkKQfaip90myQSshoomUp25V245w63Q=
Received: from BN4PR07MB2161.namprd07.prod.outlook.com (10.164.63.19) by
	BN4PR07MB2164.namprd07.prod.outlook.com (10.164.63.22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Thu, 6 Jul 2017 23:23:42 +0000
Received: from BN4PR07MB2161.namprd07.prod.outlook.com ([10.164.63.19]) by
	BN4PR07MB2161.namprd07.prod.outlook.com ([10.164.63.19]) with mapi id
	15.01.1240.013; Thu, 6 Jul 2017 23:23:42 +0000
From: "Kalra, Ashish" <Ashish.Kalra@cavium.com>
To: Auger Eric <eric.auger@redhat.com>, Bharat Bhushan
	<bharat.bhushan@nxp.com>, Jean-Philippe Brucker
	<jean-philippe.brucker@arm.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS9kpnllgG3hXvJ0aw38iXyZSHIaJHTb2AgAAgLXA=
Date: Thu, 6 Jul 2017 23:23:41 +0000
Message-ID: <BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
In-Reply-To: <15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com; dmarc=none action=none header.from=cavium.com;
x-originating-ip: [122.161.121.246]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN4PR07MB2164;
	7:MjlGcxrENEB47zpKzPlPd4j02M9vjwO7TZCNNFWkQAnCUUfQoYQPvJbdaCY37JvRFySiQhGu4BGb9gySSac5srDK+UiJGbs3AVQkAofXYeHRSITaTY0b4p0cPt8ZJaI9Gs/NRDRI9Cq+fethF6uf7fnfQ/a3DH/2I7McW0aDcJ+GX/b2Irfg+bs5zN9+6NGKltA7hks1tz3bqrcGumDuFttgOWG3SDajKS+dIP0/Gg7pwK1F5KaQGblCe7fNrxTN8Ij2JYtnFek60mgG4Kh3Znw5LvnlXXtYvSoUOPl+I0TEh7sPdmZ/BO09KYIxFkHJQnM32ovDiSqdXCGqZGlgiplmAMPkgWsJ5iK8WBRlAdqwvaB0Z/xEbr2fNd/UnZ/KEy66WNgF3Rrahzymw/osvW+CJ12EgSPdMdLQO93e4rf35x//igaiRBYc6EpC4PukosxtDO2/3OIB78VRS6LRmDKuQewb5XW1Ax0XX924FZEB5h5uQECdx7rUGFNoxh3W/K8eicwMBEkoxTvHnmfg7qsLVZA7YVfbwWwWuXgZTL8Yjf7ptud2UpZHmuiGDelNQaUCQrCqaUrYDg98QEgYPMcytlmdsrGawU7rwGgyDYALXSb4huEfuhPUIOeMPjxSsfROE2r/wt9Hl84aGL9G0jAfPAKN22cOILLfOnvC9JagUG3XMP1uYv83wIp5Sy0v9AEgcGWaIt2XwZp6nuccnSNPmyI2MV6kOhxTQZyhXJtV10kLnFUadLpM/o8Q9XKuz/n45ApyFt744INXhmHw1cFcmDKJLIS4qaqqUA1wKRU=
x-ms-office365-filtering-correlation-id: 94548e6c-8e03-4e7a-6414-08d4c4c60a4a
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN4PR07MB2164; 
x-ms-traffictypediagnostic: BN4PR07MB2164:
x-microsoft-antispam-prvs: <BN4PR07MB2164E14554EED082FD9DE96DE3D50@BN4PR07MB2164.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(133145235818549)(236129657087228)(185117386973197)(48057245064654)(148574349560750)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6041248)(20161123560025)(20161123558100)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN4PR07MB2164; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN4PR07MB2164; 
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39850400002)(39400400002)(39410400002)(39450400003)(39840400002)(13464003)(24454002)(377454003)(33656002)(2501003)(7736002)(3660700001)(3280700002)(72206003)(25786009)(50986999)(478600001)(189998001)(81166006)(4326008)(54356999)(76176999)(8676002)(561944003)(551934003)(86362001)(93886004)(2906002)(2950100002)(55016002)(99286003)(8936002)(8656002)(77096006)(6436002)(66066001)(53936002)(6246003)(305945005)(9686003)(6506006)(5660300001)(74316002)(54906002)(7416002)(2201001)(38730400002)(53546010)(2900100001)(7696004)(39060400002)(229853002)(6116002)(3846002)(14454004)(102836003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN4PR07MB2164;
	H:BN4PR07MB2161.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2017 23:23:41.7392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4PR07MB2164
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.78
X-Mailman-Approved-At: Thu, 06 Jul 2017 22:01:39 -0400
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
X-TUID: YbZ6W/h/vyX0

SSBoYXZlIGEgZ2VuZXJpYyBxdWVzdGlvbiBvbiB2SU9NTVUgc3VwcG9ydCwgaXMgdGhlcmUgYW55
IHByb3Bvc2FsL3BsYW4gdG8gYWRkIEFUUy9QUkkgZXh0ZW5zaW9uIHN1cHBvcnQgdG8gdklPTU1V
cyBhbmQgYWxsb3cNCmhhbmRsaW5nIGZvciBlbmQgdG8gZW5kICh2KUlPTU1VIFBhZ2UgZmF1bHRz
ICh3L3QgdGhlIGRldmljZSBzaWRlIGltcGxlbWVudGF0aW9uIG9uIFZob3N0KSA/DQoNCkFnYWlu
LCB0aGUgbW90aXZhdGlvbiB3aWxsIGJlIHRvIGRvIERNQSBvbiBwYWdlZCBndWVzdCBtZW1vcnkg
YW5kIHBvdGVudGlhbGx5IGF2b2lkaW5nIHRoZSByZXF1aXJlbWVudCBvZiBwaW5uZWQvbG9ja2Vk
DQpndWVzdCBwaHlzaWNhbCBtZW1vcnkgZm9yIERNQS4NCg0KVGhhbmtzLA0KQXNoaXNoDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBRZW11LWFybSBbbWFpbHRvOnFlbXUtYXJt
LWJvdW5jZXMrYXNoaXNoLmthbHJhPWNhdml1bS5jb21Abm9uZ251Lm9yZ10gT24gQmVoYWxmIE9m
IEF1Z2VyIEVyaWMNClNlbnQ6IEZyaWRheSwgSnVseSAwNywgMjAxNyAyOjQ3IEFNDQpUbzogQmhh
cmF0IEJodXNoYW47IEplYW4tUGhpbGlwcGUgQnJ1Y2tlcjsgZXJpYy5hdWdlci5wcm9AZ21haWwu
Y29tOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29t
OyBtc3RAcmVkaGF0LmNvbTsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUu
b3JnDQpDYzoga2V2aW4udGlhbkBpbnRlbC5jb207IG1hcmMuenluZ2llckBhcm0uY29tOyB0bkBz
ZW1paGFsZi5jb207IHdpbGwuZGVhY29uQGFybS5jb207IGRyam9uZXNAcmVkaGF0LmNvbTsgcm9i
aW4ubXVycGh5QGFybS5jb207IGNocmlzdG9mZmVyLmRhbGxAbGluYXJvLm9yZw0KU3ViamVjdDog
UmU6IFtRZW11LWFybV0gW1FlbXUtZGV2ZWxdIFtSRkMgdjIgMC84XSBWSVJUSU8tSU9NTVUgZGV2
aWNlDQoNCkhpIEJoYXJhdCwNCg0KT24gMDYvMDcvMjAxNyAxMzoyNCwgQmhhcmF0IEJodXNoYW4g
d3JvdGU6DQo+IA0KPiANCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBK
ZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNrZXJAYXJtLmNv
bV0NCj4+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDA2LCAyMDE3IDM6MzMgUE0NCj4+IFRvOiBCaGFy
YXQgQmh1c2hhbiA8YmhhcmF0LmJodXNoYW5AbnhwLmNvbT47IEF1Z2VyIEVyaWMgDQo+PiA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPjsgZXJpYy5hdWdlci5wcm9AZ21haWwuY29tOyANCj4+IHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZzsgYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IG1zdEByZWRo
YXQuY29tOyANCj4+IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0K
Pj4gQ2M6IHdlaUByZWRoYXQuY29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgbWFyYy56eW5naWVy
QGFybS5jb207IA0KPj4gdG5Ac2VtaWhhbGYuY29tOyB3aWxsLmRlYWNvbkBhcm0uY29tOyBkcmpv
bmVzQHJlZGhhdC5jb207IA0KPj4gcm9iaW4ubXVycGh5QGFybS5jb207IGNocmlzdG9mZmVyLmRh
bGxAbGluYXJvLm9yZw0KPj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUkZDIHYyIDAvOF0g
VklSVElPLUlPTU1VIGRldmljZQ0KPj4NCj4+IE9uIDA1LzA3LzE3IDA5OjQ5LCBCaGFyYXQgQmh1
c2hhbiB3cm90ZTo+Pj4gQWxzbyB3aGVuIHNldHVwIG1zaS1yb3V0ZQ0KPj4ga3ZtX2lycWNoaXBf
YWRkX21zaV9yb3V0ZSgpIHdlIG5lZWRlZCB0bw0KPj4+PiBwcm92aWRlIHRoZSB0cmFuc2xhdGVk
IGFkZHJlc3MuDQo+Pj4+PiBBY2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGluZyB0aGlzIGlzIHJl
cXVpcmVkIGJlY2F1c2Uga2VybmVsIGRvZXMgDQo+Pj4+PiBubyBnbw0KPj4+PiB0aHJvdWdoIHZp
b21tdSB0cmFuc2xhdGlvbiB3aGVuIGdlbmVyYXRpbmcgaW50ZXJydXB0LCBubz8NCj4+Pj4NCj4+
Pj4geWVzIHRoaXMgaXMgbmVlZGVkIHdoZW4gS1ZNIE1TSSByb3V0ZXMgYXJlIHNldCB1cCwgaWUu
IGFsb25nIHdpdGggDQo+Pj4+IEdJQ1YzDQo+PiBJVFMuDQo+Pj4+IFdpdGggR0lDdjJNLCBxZW11
IGRpcmVjdCBnc2kgbWFwcGluZyBpcyB1c2VkIGFuZCB0aGlzIGlzIG5vdCBuZWVkZWQuDQo+Pj4+
DQo+Pj4+IFNvIEkgZG8gbm90IHVuZGVyc3RhbmQgeW91ciBwcmV2aW91cyBzZW50ZW5jZSBzYXlp
bmcgIk1TSSANCj4+Pj4gaW50ZXJydXB0cyB3b3JrcyB3aXRob3V0IGFueSBjaGFuZ2UiLg0KPj4+
DQo+Pj4gSSBoYXZlIGFsbW9zdCBjb21wbGV0ZWQgdmZpbyBpbnRlZ3JhdGlvbiB3aXRoIHZpcnRp
by1pb21tdSBhbmQgbm93IA0KPj4+IHRlc3RpbmcgdGhlIGNoYW5nZXMgYnkgYXNzaWduaW5nIGUx
MDAwIGRldmljZSB0byBWTS4gRm9yIHRoaXMgSSBoYXZlIA0KPj4+IGNoYW5nZWQgdmlydGlvLWlv
bW11IGRyaXZlciB0byB1c2UgSU9NTVVfUkVTVl9NU0kgcmF0aGVyIHRoYW4gc3ctbXNpIA0KPj4+
IGFuZCB0aGlzIGRvZXMgbm90IG5lZWQgY2hhbmdlZCBpbiB2ZmlvX2dldF9hZGRyKCkgIGFuZA0K
Pj4+IGt2bV9pcnFjaGlwX2FkZF9tc2lfcm91dGUoKQ0KPj4NCj4+IEkgdW5kZXJzdGFuZCB5b3Un
cmUgcmVzZXJ2aW5nIHJlZ2lvbiAweDA4MDAwMDAwLTB4MDgxMDAwMDAgYXMgDQo+PiBJT01NVV9S
RVNWX01TSSBpbnN0ZWFkIG9mIElPTU1VX1JFU1ZfU1dfTVNJPyBJIHRoaW5rIHRoaXMgb25seSB3
b3JrcyANCj4+IGJlY2F1c2UgUWVtdSBwbGFjZXMgdGhlIHZnaWMgaW4gdGhhdCBhcmVhIGFzIHdl
bGwgKGluIGh3L2FybS92aXJ0LmMpLg0KPj4gSXQncyBub3QgYSBjb2luY2lkZW5jZSBpZiB0aGUg
YWRkcmVzc2VzIGFyZSB0aGUgc2FtZSwgYmVjYXVzZSBFcmljIA0KPj4gY2hvc2UgdGhlbSBmb3Ig
dGhlIExpbnV4IFNNTVUgZHJpdmVycyBhbmQgSSBjb3BpZWQgdGhlbS4NCj4+DQo+PiBXZSBjYW4n
dCByZWx5IG9uIHRoYXQgYmVoYXZpb3IsIHRob3VnaCwgaXQgd2lsbCBicmVhayBNU0lzIGluIA0K
Pj4gZW11bGF0ZWQgZGV2aWNlcy4gQW5kIGlmIFFlbXUgaGFwcGVucyB0byBtb3ZlIHRoZSBNU0kg
ZG9vcmJlbGwgaW4gDQo+PiBmdXR1cmUgbWFjaGluZSByZXZpc2lvbnMsIHRoZW4gaXQgd291bGQg
YWxzbyBicmVhayBWRklPLg0KPiANCj4gWWVzLCBtYWtlIHNlbnNlIHRvIG1lDQo+IA0KPj4NCj4+
IEp1c3QgZm9yIG15IG93biB1bmRlcnN0YW5kaW5nIC0tIHdoYXQgaGFwcGVucywgSSB0aGluaywg
aXMgdGhhdCBpbiANCj4+IExpbnV4IGlvdmFfcmVzZXJ2ZV9pb21tdV9yZWdpb25zIGluaXRpYWxs
eSByZXNlcnZlcyB0aGUgDQo+PiBndWVzdC1waHlzaWNhbCBkb29yYmVsbCAweDA4MDAwMDAwLTB4
MDgxMDAwMDAuIFRoZW4gbXVjaCBsYXRlciwgd2hlbiANCj4+IHRoZSBkZXZpY2UgZHJpdmVyIHJl
cXVlc3RzIGFuIE1TSSwgdGhlIGlycWNoaXAgZHJpdmVyIGNhbGxzIA0KPj4gaW9tbXVfZG1hX21h
cF9tc2lfbXNnIHdpdGggdGhlIGd1ZXN0LSBwaHlzaWNhbCBnaWN2Mm0gYWRkcmVzcyANCj4+IDB4
MDgwMjAwMDAuIFRoZSBmdW5jdGlvbiBmaW5kcyB0aGUgcmlnaHQgcGFnZSBpbiBtc2lfcGFnZV9s
aXN0LCB3aGljaCANCj4+IHdhcyBhZGRlZCBieSBjb29raWVfaW5pdF9od19tc2lfcmVnaW9uLCB0
aGVyZWZvcmUgYnlwYXNzaW5nIHRoZSB2aW9tbXUgYW5kIHRoZSBHUEEgZ2V0cyB3cml0dGVuIGlu
IHRoZSBNU0ktWCB0YWJsZS4NCj4gDQo+IFRoaXMgbWVhbnMgaW4gY2FzZSB0b21vcnJvdyB3aGVu
IHFlbXUgY2hhbmdlcyB2aXJ0IG1hY2hpbmUgYWRkcmVzcyBtYXAgYW5kIHZnaWMtaXRzIChpdHMt
dHJhbnNsYXRvciByZWdpc3RlciBhZGRyZXNzKSBhZGRyZXNzIHJhbmdlIGRvZXMgbm90IGZhbGwg
aW4gdGhlIG1zaV9wYWdlX2xpc3QgdGhlbiBpdCB3aWxsIGFsbG9jYXRlIGEgbmV3IGlvdmEsIGNy
ZWF0ZSBtYXBwaW5nIGluIGlvbW11LiBTbyB0aGlzIHdpbGwgbm8gbG9uZ2VyIGJlIGlkZW50aXR5
IG1hcHBlZCBhbmQgZmFpbCB0byB3b3JrIHdpdGggbmV3IHFlbXU/DQo+IA0KWWVzIHRoYXQncyBj
b3JyZWN0Lg0KPj4NCj4+IElmIGFuIGVtdWxhdGVkIGRldmljZSBzdWNoIGFzIHZpcnRpby1uZXQt
cGNpIHdlcmUgdG8gZ2VuZXJhdGUgYW4gTVNJLCANCj4+IHRoZW4gUWVtdSB3b3VsZCBhdHRlbXB0
IHRvIGFjY2VzcyB0aGUgZG9vcmJlbGwgd3JpdHRlbiBieSBMaW51eCBpbnRvIA0KPj4gdGhlIE1T
SS1YIHRhYmxlLCAweDA4MDIwMDAwLCBhbmQgZmF1bHQgYmVjYXVzZSB0aGF0IGFkZHJlc3Mgd2Fz
bid0IA0KPj4gbWFwcGVkIGluIHRoZSB2aW9tbXUuDQo+Pg0KPj4gU28gZm9yIFZGSU8sIHlvdSBl
aXRoZXIgbmVlZCB0byB0cmFuc2xhdGUgdGhlIE1TSS1YIGVudHJ5IHVzaW5nIHRoZSANCj4+IHZp
b21tdSwgb3IganVzdCBhc3N1bWUgdGhhdCB0aGUgdmFkZHIgY29ycmVzcG9uZHMgdG8gdGhlIG9u
bHkgTVNJIA0KPj4gZG9vcmJlbGwgYWNjZXNzaWJsZSBieSB0aGlzIGRldmljZSAoYmVjYXVzZSBo
b3cgY2FuIHdlIGJlIGNlcnRhaW4gDQo+PiB0aGF0IHRoZSBndWVzdCBhbHJlYWR5IG1hcHBlZCB0
aGUgZG9vcmJlbGwgYmVmb3JlIHdyaXRpbmcgdGhlIGVudHJ5PykNCj4+DQo+PiBGb3IgQVJNIG1h
Y2hpbmVzIGl0J3MgcHJvYmFibHkgYmVzdCB0byBzdGljayB3aXRoIElPTU1VX1JFU1ZfU1dfTVNJ
Lg0KPj4gSG93ZXZlciwgYSBuaWNlIHdheSB0byB1c2UgSU9NTVVfUkVTVl9NU0kgd291bGQgYmUg
Zm9yIHRoZSB2aXJ0aW8tIA0KPj4gaW9tbXUgZGV2aWNlIHRvIGFkdmVydGlzZSBpZGVudGl0eS1t
YXBwZWQvcmVzZXJ2ZWQgcmVnaW9ucywgYW5kIA0KPj4gYnlwYXNzIHRyYW5zbGF0aW9uIG9uIHRo
ZXNlIHJlZ2lvbnMuIFRoZW4gdGhlIGRyaXZlciBjb3VsZCByZXNlcnZlIA0KPj4gdGhvc2Ugd2l0
aCBJT01NVV9SRVNWX01TSS4NCj4gDQo+IENvcnJlY3QgbWUgaWYgSSBkaWQgbm90IHVuZGVyc3Rv
b2QgeW91IGNvcnJlY3RseSwgdG9kYXkgaW9tbXUtZHJpdmVyIGRlY2lkZXMgbXNpLXJlc2VydmVk
IHJlZ2lvbiwgd2hhdCBpZiB3ZSBjaGFuZ2UgdGhpcyBhbmQgdmlydGlvLWlvbW11IGRldmljZSB3
aWxsIHByb3ZpZGUgdGhlIHJlc2VydmVkIG1zaSByZWdpb24gYXMgcGVyIHRoZSBlbXVsYXRlZCBt
YWNoaW5lICh2aXJ0L2ludGVsKS4gU28gdmlydGlvLWlvbW11IGRyaXZlciB3aWxsIHVzZSB0aGUg
YWRkcmVzcyBhZHZlcnRpc2VkIGJ5IHZpcnRpby1pb21tdSBkZXZpY2UgYXMgSU9NTVVfUkVTVl9N
U0kuIEluIHRoaXMgY2FzZSBtc2ktcGFnZS1saXN0IHdpbGwgYWx3YXlzIGhhdmUgdGhlIHJlc2Vy
dmVkIHJlZ2lvbiBmb3IgTVNJLg0KPiBPbiBxZW11IHNpZGUsIGZvciBlbXVsYXRlZCBkZXZpY2Vz
IHdlIHdpbGwgbGV0IHZpcnRpby1pb21tdSByZXR1cm4gc2FtZSBhZGRyZXNzIGFzIHRyYW5zbGF0
ZWQgYWRkcmVzcyBhcyBpdCBmYWxscyBpbiBNU0ktcmVzZXJ2ZWQgcGFnZSBhbHJlYWR5IGtub3du
IHRvIGl0Lg0KDQpJIHRoaW5rIHdoYXQgeW91J3JlIHByb3Bvc2luZyBoZXJlIGNvcnJlc3BvbmRz
IHRvIHRoZSAxc3QgYXBwcm9hY2ggdGhhdCB3YXMgZm9sbG93ZWQgZm9yIFBDSWUgcGFzc3Rocm91
Z2gvTVNJIG9uIEFSTSwgaWUuIHRoZSB1c2Vyc3BhY2Ugd2FzIHByb3ZpZGluZyB0aGUgcmVzZXJ2
ZWQgcmVnaW9uIGJhc2UgYWRkcmVzcyAmIHNpemUuIFRoaXMgd2FzIHJ1bGVkIG91dCBhbmQgbm93
IHRoaXMgcmVnaW9uIGlzIGFyYml0cmFyaWx5IHNldCBieSB0aGUgc21tdS1kcml2ZXIuIEF0IHRo
ZSBtb21lbnQgdGhpcyBtZWFucyB0aGlzIHJlZ2lvbiBjYW5ub3QgY29udGFpbiBndWVzdCBSQU0u
DQoNCj4gDQo+IA0KPj4gRm9yIHg4NiB3ZSB3aWxsIG5lZWQgc3VjaCBhIHN5c3RlbSwgd2l0aCBh
biBhZGRlZCBJUlEgcmVtYXBwaW5nIA0KPj4gZmVhdHVyZS4NCj4gDQo+IEkgZG8gbm90IHVuZGVy
c3RhbmQgeDg2IE1TSSBpbnRlcnJ1cHQgZ2VuZXJhdGlvbiwgYnV0IElmIGFib3ZlIHVuZGVyc3Rh
bmQgaXMgY29ycmVjdCwgdGhlbiB3aHkgd2UgbmVlZCBJUlEgcmVtYXBwaW5nIGZvciB4ODY/DQpU
byBtZSB4ODYgSVIgY29ycmVzcG9uZHMgc2ltcGx5IGNvcnJlc3BvbmRzIHRvIHRoZSBJVFMgTVNJ
IGNvbnRyb2xsZXIgbW9kYWxpdHkgb24gQVJNLiBTbyBhcyB5b3Ugc3RpbGwgbmVlZCB2SVRTIGFs
b25nIHdpdGggdmlydGlvLWlvbW11IG9uIEFSTSwgeW91IG5lZWQgdklSUSBhbG9uZ3Mgd2l0aCB2
aXJ0aW8taW9tbXUgb24gSW50ZWwuIERvZXMgdGhhdCBtYWtlIHNlbnNlPw0KDQpTbyBpbiBhbnkg
Y2FzZSB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUgZ3Vlc3QgdXNlcyBhIHZJVFMgb3IgdklSIHRv
IG1ha2Ugc3VyZSBNU0lzIGFyZSBjb3JyZWN0bHkgaXNvbGF0ZWQuDQoNCg0KPiBXaWxsIHRoZSB4
ODYgbWFjaGluZSBlbXVsYXRlZCBpbiBRRU1VIHByb3ZpZGVzIGEgYmlnIGFkZHJlc3MgcmFuZ2Ug
Zm9yIE1TSXMgYW5kIHdoZW4gYWN0dWFsbHkgZ2VuZXJhdGluZyBNU0kgaXQgbmVlZGVkIHNvbWUg
ZXh0cmEgcHJvY2Vzc2luZyAoSVJRLXJlbWFwcGluZyBwcm9jZXNzaW5nKSBiZWZvcmUgYWN0dWFs
bHkgZ2VuZXJhdGluZyB3cml0ZSB0cmFuc2FjdGlvbiBmb3IgTVNJIGludGVycnVwdCA/IA0KTXkg
dW5kZXJzdGFuZGluZyBpcyBvbiB4ODYsIHRoZSBNU0kgd2luZG93IGlzIGZpeGVkIGFuZCBtYXRj
aGVzIFtGRUUwXzAwMDBoIOKAkyBGRUYwXzAwMGhdLiBNU0lzIGFyZSBjb252ZXllZCBvbiBhIHNl
cGFyYXRlIGFkZHJlc3Mgc3BhY2UgdGhhbiB1c3VhbCBETUEgYWNjZXNzZXMuIEFuZCB5ZXMgdGhl
eSBlbmQgdXAgaW4gSVIgaWYgc3VwcG9ydGVkIGluIHRoZSBIVy4NCg0KVGhhbmtzDQoNCkVyaWMN
Cj4gDQo+IFRoYW5rcw0KPiAtQmhhcmF0DQo+IA0KPj4NCj4+IFRoYW5rcywNCj4+IEplYW4NCg0K
