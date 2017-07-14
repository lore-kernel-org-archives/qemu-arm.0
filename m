Received: by 10.25.44.15 with SMTP id s15csp542388lfs;
        Thu, 13 Jul 2017 23:58:20 -0700 (PDT)
X-Received: by 10.237.54.225 with SMTP id f88mr9474103qtb.240.1500015500554;
        Thu, 13 Jul 2017 23:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500015500; cv=none;
        d=google.com; s=arc-20160816;
        b=t54xtbAO11pW2nL2XNspAstDATtGEkEZuIt2cIX/7nsIwT87ztQ9fEX5FXm6wpETR+
         RATQyRKxpefGLl1W0qODE/ZicLhtRNqWyDQpORYgUuQwoZjFyRDjasjp2q2GqGdoRzxt
         tu9leWgegYPtMEDgCMlShkRKvRjf21gH8n6uHLnZ16VDq25pWzRMMf09cFl3dlrlohBt
         XM7Q5qPDYv450M4O9bQWSsCN0a+DLB17lAW67buJmpduuRoV7piYHv9YrdI36AsR8Exv
         QVceolDAbMPcaEq2Qz9XSX8tIP/3wgnx+uYjibm9TTOoRKR0YrmW+kiw+kgQH79K0WIP
         51EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=Gj6U0WzJZW0xeirYH9sauSf4kPcYQ+Q+iXGg1e6G8pk=;
        b=GvIiLO8KYu24ucGdBGtcfl3TY0bVC0ENxeQCBPoE8Zeov1Emkv4vVDXnusxNavY1Jp
         rx391jy6n3v01w9x6T8SxLfKx/dZaz/RFXSQY/AEhF7XoGWM1JJ0VTQT94xne0h57i+j
         KToRXsaucaZU4Sgr8xCCjNRxYZNvLTIQZwXVG0ahLNhR1cyhlC6eayT47vmSd72sPFVY
         3+ebkOA40zG3ZdquaN8VB+PfijSQStTXN6MMYpGQvK25oMJIdOOrWaLpqPQ823MoCZbd
         ghGOKgQh71MzAqcm1TpDHOxMZswrPUoqG5+nf7kf5iGL1CLcECg7++GicJ0TNzn00lGG
         9toQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26si7355458qta.312.2017.07.13.23.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 23:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVuYL-0001HP-Sn
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 02:58:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dVuYH-0001H2-9F
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 02:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dVuYD-0005Lq-Ch
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 02:58:13 -0400
Received: from mga11.intel.com ([192.55.52.93]:52529)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dVuYD-0005L3-1w; Fri, 14 Jul 2017 02:58:09 -0400
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jul 2017 23:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,357,1496127600"; d="scan'208";a="111217914"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2017 23:58:06 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 13 Jul 2017 23:58:06 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
	FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 13 Jul 2017 23:58:05 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX104.ccr.corp.intel.com ([10.239.4.70]) with mapi id
	14.03.0319.002; Fri, 14 Jul 2017 14:58:03 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, "Kalra, Ashish"
	<Ashish.Kalra@cavium.com>, Auger Eric <eric.auger@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCACwBtgIAOLRaAgAAFuwCAAAGSgIABpsiAgAAWqYCAAKWXgIAAI3yAgACHM5CAAIJ6gIAK+oaA
Date: Fri, 14 Jul 2017 06:58:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D38304@SHSMSX101.ccr.corp.intel.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
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
	<BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D28807@SHSMSX101.ccr.corp.intel.com>
	<67cb3a84-9aa7-2b4f-43b6-be6dea15b66f@arm.com>
In-Reply-To: <67cb3a84-9aa7-2b4f-43b6-be6dea15b66f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDM4NDE3YmEtZThkOS00ZDQzLTkxODItMzU0NzFhYTMxYWNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImlKbHE5N0lPMzJlZzRlXC85QXdKTjhwSlFudTA2UjZNSEdVdW40YUt2ZVowPSJ9
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
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
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +EZ/BYUKArMN

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNr
ZXJAYXJtLmNvbV0NCj4gU2VudDogRnJpZGF5LCBKdWx5IDcsIDIwMTcgMTE6MTUgUE0NCj4gDQo+
IEhpIEFzaGlzaCwNCj4gDQo+IE9uIDA3LzA3LzE3IDAwOjMzLCBUaWFuLCBLZXZpbiB3cm90ZToN
Cj4gPj4gRnJvbTogS2FscmEsIEFzaGlzaCBbbWFpbHRvOkFzaGlzaC5LYWxyYUBjYXZpdW0uY29t
XQ0KPiA+PiBTZW50OiBGcmlkYXksIEp1bHkgNywgMjAxNyA3OjI0IEFNDQo+ID4+DQo+ID4+IEkg
aGF2ZSBhIGdlbmVyaWMgcXVlc3Rpb24gb24gdklPTU1VIHN1cHBvcnQsIGlzIHRoZXJlIGFueSBw
cm9wb3NhbC9wbGFuDQo+IHRvDQo+ID4+IGFkZCBBVFMvUFJJIGV4dGVuc2lvbiBzdXBwb3J0IHRv
IHZJT01NVXMgYW5kIGFsbG93DQo+ID4+IGhhbmRsaW5nIGZvciBlbmQgdG8gZW5kICh2KUlPTU1V
IFBhZ2UgZmF1bHRzICh3L3QgdGhlIGRldmljZSBzaWRlDQo+ID4+IGltcGxlbWVudGF0aW9uIG9u
IFZob3N0KSA/DQo+ID4+DQo+ID4+IEFnYWluLCB0aGUgbW90aXZhdGlvbiB3aWxsIGJlIHRvIGRv
IERNQSBvbiBwYWdlZCBndWVzdCBtZW1vcnkgYW5kDQo+ID4+IHBvdGVudGlhbGx5IGF2b2lkaW5n
IHRoZSByZXF1aXJlbWVudCBvZiBwaW5uZWQvbG9ja2VkDQo+ID4+IGd1ZXN0IHBoeXNpY2FsIG1l
bW9yeSBmb3IgRE1BLg0KPiA+DQo+ID4geWVzLCB0aGF0J3MgYSBuZWNlc3NhcnkgcGFydCB0byBz
dXBwb3J0IFNWTSBpbiBib3RoIHZpcnRpby1pb21tdQ0KPiA+IGFwcHJvYWNoIGFuZCBmdWxseSBl
bXVsYXRlZCBhcHByb2FjaCAoZS5nLiBmb3IgSW50ZWwgVlRkKS4gVGhlcmUNCj4gPiBhcmUgYWxy
ZWFkeSBwYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBpbiBvdGhlciB0aHJlYWQgYWJvdXQgaG93IHRv
DQo+ID4gcHJvcGFnYXRlIElPTU1VIHBhZ2UgZmF1bHQgdG8gdklPTU1VLiBUaGVuIGFmdGVyIGl0
IGlzIGRvbmUNCj4gPiB2SU9NTVUgcGFnZSBmYXVsdCBlbXVsYXRpb24gd2lsbCBiZSBmdXJ0aGVy
IGFkZGVkLg0KPiA+DQo+ID4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTcvNi8yNy85NjQNCj4g
DQo+IEZvciB2aXJ0aW8taW9tbXUsIEknZCBsaWtlIHRvIGFkZCBhbiBldmVudCB2aXJ0cXVldWUg
Zm9yIHRoZSBkZXZpY2UgdG8NCj4gc2VuZCBwYWdlIGZhdWx0cyB0byB0aGUgZHJpdmVyLCBpbiBh
IGZvcm1hdCBzaW1pbGFyIHRvIGEgUFJJIFBhZ2UgUmVxdWVzdC4NCj4gVGhlIGRyaXZlciB3b3Vs
ZCB0aGVuIHNlbmQgYSByZXBseSB2aWEgdGhlIHJlcXVlc3QgdmlydHF1ZXVlIGluIGEgZm9ybWF0
DQo+IHNpbWlsYXIgdG8gYSBQUkcgUmVzcG9uc2UuDQo+IA0KPiBJbiBRZW11IHRoZSBkZXZpY2Ug
aW1wbGVtZW50YXRpb24gd291bGQgaG9wZWZ1bGx5IGJlIGJhc2VkIG9uIHRoZSBzYW1lDQo+IG1l
Y2hhbmlzbSBhcyBWVGQuIFRoZSB2aG9zdCBpbXBsZW1lbnRhdGlvbiB3b3VsZCByZWNlaXZlIElP
IFBhZ2UgRmF1bHRzDQo+IGZyb20gVkZJTyBhbmQgZm9yd2FyZCB0aGVtIG9uIHRoZSBldmVudCB2
aXJ0cXVldWUgc2ltaWxhcmx5IHRvIHRoZQ0KPiB1c2Vyc3BhY2UgaW1wbGVtZW50YXRpb24uDQo+
IA0KDQpBZ3JlZS4gSSBleHBlY3QgdGhlIHBhdGggYmV0d2VlbiBRZW11IGFuZCBWRklPIGFyZSBn
ZW5lcmFsIGVub3VnaA0KZm9yIGJvdGggZW11bGF0ZWQgSU9NTVUgYW5kIHZpcnRpby1JT01NVS4g
RGlmZmVyZW5jZSBpcyBvbiB0aGUgDQpwcm9wYWdhdGlvbiBwYXRoIHRvIGd1ZXN0IGJhc2VkIG9u
IHRoZSBkZWZpbml0aW9uIG9mIGRpZmZlcmVudCB2aXJ0dWFsIA0KaW50ZXJmYWNlcy4NCg0KVGhh
bmtzDQpLZXZpbg0K
