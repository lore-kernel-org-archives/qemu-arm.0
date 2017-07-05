Received: by 10.25.44.15 with SMTP id s15csp373688lfs;
        Wed, 5 Jul 2017 00:16:02 -0700 (PDT)
X-Received: by 10.200.35.21 with SMTP id a21mr22807975qta.56.1499238962490;
        Wed, 05 Jul 2017 00:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499238962; cv=none;
        d=google.com; s=arc-20160816;
        b=S8CHToBg8UVIMSNPzO63UCRlRt2o08AiPPGdWJq/b0w7KW0KVsAZ99Ul27XPhM2h8s
         j/s6/+/lk/IHNdhDBmSrCECmaqmKBxwqCATogAvEE7f/6yFBRULKpjDo5obTaYWEea6l
         1MeznYFTx+1ILMtneTe/9esJjvt/AvLG6jJ1COkz7eOWfS759SivQHcIW+uIg16w5Lde
         B3hI1KfWhlYIijZ3FN2KhqhM55laKqVAkKd4Cm5uWoPh2ANUog/Rpiw81GVyvA6SOOvX
         jphw9YbXRcjpmzoQmW0r/DBw/D7rsDi9tbdv4pi3LB+RC0nm1nKxFKnBPR3deXVkGq0K
         0dVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=LtKqKqb5+vsf9JgOrlcuXiiyZHvjUPUlNo+9agEI3ww=;
        b=IUFjfsNQAmJ1z/mw52gDHdAGpniDyPkhItbI8I0t2zYeMmbAMR6ky/OFzE4S9p6Pnj
         KCb3NZgI4dS9isHoGJ16H9OIryvpEuhA/OQxSfAilh6eyHQUJZvaJ5mehuRZYCPCDwXk
         QHYbv1Xcd9/eWxAQBh+OA3F2uhiEaBRrLJm9U0aMQ+wW1aQBoeKLtSZk0e1ZZOZB4Hng
         iEn4EazyXz6JKUkzHEz1CQQEE6aMJqMxRQjFB+nmwiTCeUNnpIstczvUa4NqQ2AW2HBE
         92Lu1DnXAPJYRPCCwAM+kcnfWLr7HSYAOZ3fxjbjqKr4QFVn2Zrj6QAb2tKWfBKH/cXd
         JK/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10si19465435qtn.149.2017.07.05.00.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 00:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSeXX-0004vY-Sq
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 03:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dSeW8-00048J-BB
	for qemu-devel@nongnu.org; Wed, 05 Jul 2017 03:14:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dSeW3-0007DW-B9
	for qemu-devel@nongnu.org; Wed, 05 Jul 2017 03:14:32 -0400
Received: from mga09.intel.com ([134.134.136.24]:1089)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dSeW2-0007Ck-IZ; Wed, 05 Jul 2017 03:14:27 -0400
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 00:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,310,1496127600"; d="scan'208";a="120961988"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by orsmga005.jf.intel.com with ESMTP; 05 Jul 2017 00:14:23 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 5 Jul 2017 00:14:22 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX152.ccr.corp.intel.com ([169.254.6.122]) with mapi id
	14.03.0319.002; Wed, 5 Jul 2017 15:14:21 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Bharat Bhushan
	<bharat.bhushan@nxp.com>, Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCAACd4AIAZdvaw
Date: Wed, 5 Jul 2017 07:14:20 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D25AEB@SHSMSX101.ccr.corp.intel.com>
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
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzkzMjc0YzktNzc1Yy00MWVhLWIzZmUtZDdjMzVlOTk3MDE5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6InVaUTJWa0hJeTVsNEdlTWdrS1ZoODFuMnVrRFJUblJDaWFUR2R3eE1SaXM9In0=
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "wei@redhat.com" <wei@redhat.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qeXGcFbTp+K1

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNr
ZXJAYXJtLmNvbV0NCj4gU2VudDogTW9uZGF5LCBKdW5lIDE5LCAyMDE3IDY6MTUgUE0NCj4gDQo+
IE9uIDE5LzA2LzE3IDA4OjU0LCBCaGFyYXQgQmh1c2hhbiB3cm90ZToNCj4gPiBIaSBFcmljLA0K
PiA+DQo+ID4gSSBzdGFydGVkIGFkZGVkIHJlcGxheSBpbiB2aXJ0aW8taW9tbXUgYW5kIGNhbWUg
YWNyb3NzIGhvdyBNU0kgaW50ZXJydXB0cw0KPiB3aXRoIHdvcmsgd2l0aCBWRklPLg0KPiA+IEkg
dW5kZXJzdGFuZCB0aGF0IG9uIGludGVsIHRoaXMgd29ya3MgZGlmZmVyZW50bHkgYnV0IHZzbW11
IHdpbGwgaGF2ZSBzYW1lDQo+IHJlcXVpcmVtZW50Lg0KPiA+IGt2bS1tc2ktaXJxLXJvdXRlIGFy
ZSBhZGRlZCB1c2luZyB0aGUgbXNpLWFkZHJlc3MgdG8gYmUgdHJhbnNsYXRlZCBieQ0KPiB2aW9t
bXUgYW5kIG5vdCB0aGUgZmluYWwgdHJhbnNsYXRlZCBhZGRyZXNzLg0KPiA+IFdoaWxlIGN1cnJl
bnRseSB0aGUgaXJxZmQgZnJhbWV3b3JrIGRvZXMgbm90IGtub3cgYWJvdXQgZW11bGF0ZWQNCj4g
aW9tbXVzICh2aXJ0aW8taW9tbXUsIHZzbW11djMvdmludGVsLWlvbW11KS4NCj4gPiBTbyBpbiBt
eSB2aWV3IHdlIGhhdmUgZm9sbG93aW5nIG9wdGlvbnM6DQo+ID4gLSBQcm9ncmFtbWluZyB3aXRo
IHRyYW5zbGF0ZWQgYWRkcmVzcyB3aGVuIHNldHRpbmcgdXAga3ZtLW1zaS1pcnEtcm91dGUNCj4g
PiAtIFJvdXRlIHRoZSBpbnRlcnJ1cHRzIHZpYSBRRU1VLCB3aGljaCBpcyBiYWQgZnJvbSBwZXJm
b3JtYW5jZQ0KPiA+IC0gdmhvc3QtdmlydGlvLWlvbW11IG1heSBzb2x2ZSB0aGUgcHJvYmxlbSBp
biBsb25nIHRlcm0NCj4gPg0KPiA+IElzIHRoZXJlIGFueSBvdGhlciBiZXR0ZXIgb3B0aW9uIEkg
YW0gbWlzc2luZz8NCj4gDQo+IFNpbmNlIHdlJ3JlIG9uIHRoZSB0b3BpYyBvZiBNU0lzLi4uIEkn
bSBjdXJyZW50bHkgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgaG93DQo+IHdlJ2xsIGhhbmRsZSBNU0lz
IGluIHRoZSBuZXN0ZWQgdHJhbnNsYXRpb24gbW9kZSwgd2hlcmUgdGhlIGd1ZXN0IG1hbmFnZXMN
Cj4gUzEgcGFnZSB0YWJsZXMgYW5kIHRoZSBob3N0IGRvZXNuJ3Qga25vdyBhYm91dCBHVkEtPkdQ
QSB0cmFuc2xhdGlvbi4NCj4gDQo+IEknbSBhbHNvIHdvbmRlcmluZyBhYm91dCB0aGUgYmVuZWZp
dHMgb2YgaGF2aW5nIFNXLW1hcHBlZCBNU0lzIGluIHRoZQ0KPiBndWVzdC4gSXQgc2VlbXMgdW5h
dm9pZGFibGUgZm9yIHZTTU1VIHNpbmNlIHRoYXQncyB3aGF0IGEgcGh5c2ljYWwgc3lzdGVtDQo+
IHdvdWxkIGRvLiBCdXQgaW4gYSBwYXJhdmlydHVhbGl6ZWQgc29sdXRpb24gdGhlcmUgZG9lc24n
dCBzZWVtIHRvIGJlIGFueQ0KPiBjb21wZWxsaW5nIHJlYXNvbiBmb3IgaGF2aW5nIHRoZSBndWVz
dCBtYXAgTVNJIGRvb3JiZWxscy4gVGhlc2UgYWRkcmVzc2VzDQo+IGFyZSBuZXZlciBhY2Nlc3Nl
ZCBkaXJlY3RseSwgdGhleSBhcmUgb25seSB1c2VkIGZvciBzZXR0aW5nIHVwIElSUSByb3V0aW5n
DQo+IChhdCBsZWFzdCBvbiBrdm10b29sKS4gU28gaGVyZSdzIHdoYXQgSSdkIGxpa2UgdG8gaGF2
ZS4gTm90ZSB0aGF0IEkNCj4gaGF2ZW4ndCBpbnZlc3RpZ2F0ZWQgdGhlIGZlYXNpYmlsaXR5IGlu
IFFlbXUgeWV0LCBJIGRvbid0IGtub3cgaG93IGl0DQo+IGRlYWxzIHdpdGggTVNJcy4NCj4gDQo+
ICgxKSBHdWVzdCB1c2VzIHRoZSBndWVzdC1waHlzaWNhbCBNU0kgZG9vcmJlbGwgd2hlbiBzZXR0
aW5nIHVwIE1TSXMuIEZvcg0KPiBBUk0gd2l0aCBHSUN2MyB0aGlzIHdvdWxkIGJlIEdJVFNfVFJB
TlNMQVRFUiwgZm9yIHg4NiBpdCB3b3VsZCBiZSB0aGUNCj4gZml4ZWQgTVNJIGRvb3JiZWxsLiBU
aGlzIHdheSB0aGUgaG9zdCB3b3VsZG4ndCBuZWVkIHRvIGluc3BlY3QgSU9NTVUNCj4gbWFwcGlu
Z3Mgd2hlbiBoYW5kbGluZyB3cml0ZXMgdG8gUENJIE1TSS1YIHRhYmxlcy4NCj4gDQoNCldoYXQg
ZG8geW91IG1lYW4gYnkgImZpeGVkIE1TSSBkb29yYmVsbCI/IFBDSSBNU0ktWCB0YWJsZSBpcyBw
YXJ0IG9mDQpQQ0kgTU1JTyBiYXIuIEFjY2Vzc2luZyB0byBpdCBpcyBqdXN0IGEgbWVtb3J5IHZp
cnR1YWxpemF0aW9uIGlzc3VlIChlLmcuDQp0cmFwIGJ5IEtWTSBhbmQgdGhlbiBlbXVsYXRlZCBp
biBRZW11KSBvbiB4ODYuIEl0J3Mgbm90IGEgSU9NTVUNCnByb2JsZW0uIEkgZ3Vlc3MgeW91IG1h
eSBtZWFuIHNhbWUgdGhpbmcgYnV0IHdhbnQgdG8gZG91YmxlIGNvbmZpcm0NCmhlcmUgZ2l2ZW4g
dGhlIHRlcm1pbm9sb2d5IGNvbmZ1c2lvbi4gT3IgZG8geW91IG1lYW4gdGhlIGludGVycnVwdA0K
dHJpZ2dlcmVkIGJ5IElPTU1VIGl0c2VsZj8NCg0KVGhhbmtzDQpLZXZpbg0K
