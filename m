Received: by 10.25.44.15 with SMTP id s15csp4037217lfs;
        Sun, 16 Jul 2017 19:20:46 -0700 (PDT)
X-Received: by 10.55.100.67 with SMTP id y64mr24742226qkb.246.1500258046553;
        Sun, 16 Jul 2017 19:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500258046; cv=none;
        d=google.com; s=arc-20160816;
        b=uaGofxyAaAXHYiAVb0u6pheso0qcIP6cVtEECFhNZC56oshObQ3dy6ZEOkgzZVJfh1
         pcqJ5kp1jL3wZMZEaUq8L37q9wDpiVpp6VPbZ7UHIBnsMEjvpQ9GTEmHEGFclljLVhZN
         KCePeaPK7xtCw3Y2TCHDVqvDP55y0sFuJ9TGChDjiCdDmm3p8kkNALlnC1eQzCjwThXn
         7dYQ+B379t9wjlovsqfLuu7x+N2tJrh39X3PWK6az2q6PeilLOgRF7M8+IcoyZt92NfY
         gzmA/izZl+qMmGRuwdQNEWtKJkQ6MMgENLb4HsRI26WYwktaUs3aPT3S2BNpKGxUIqJK
         f0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=69wvULvZxz+RrIQWbx9bOLHp8h2AnpkHccz079Qo1NA=;
        b=z1l4hxUtrVEmeDDUeFXhiBa6ILc3qJoHdHRw2By1w36oJixCCrhyzoixCJ6NJhSBEP
         ejlVFNiRsZH0jqnIjh3jfBM/TUblwdzJi7iSlVVU5lPfGvXvl4UpF9v2ePF5QawNQi4y
         4eaoeMF/s8+NFcyYqZylF8FTQ3ftRYOUzeRtn0tDCcL724eApL5YxDtR3qJjoIWIwsDH
         JG0CSko+jmjuhXCR582WQXNuPjECEBIUN4Y0k26/q7CE/nMg/7ruTrEBdrcddmLsnp2t
         GCIQdtAV5BfFH8FocDOddcmKO8t1A/e7VHI2EecDdfsK4okOgGUlwIFqiTRG7BKXsCrA
         wFgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e193si5957439qka.103.2017.07.16.19.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWveN-0005lV-Rw
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:20:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dWveK-0005lI-Au
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dWveH-0003Mx-29
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:20:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:35652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dWveG-0003G1-NH; Sun, 16 Jul 2017 22:20:36 -0400
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 16 Jul 2017 19:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="127445938"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2017 19:20:31 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Sun, 16 Jul 2017 19:20:31 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Sun, 16 Jul 2017 19:20:31 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.94]) with mapi id
	14.03.0319.002; Mon, 17 Jul 2017 10:20:29 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Bharat Bhushan
	<bharat.bhushan@nxp.com>, Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCAACd4AIAZdvaw///X/4CAAzyV8IAAEiOAgAr79CD//8RBgIAEokQQ
Date: Mon, 17 Jul 2017 02:20:28 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D3A25B@SHSMSX101.ccr.corp.intel.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D25AEB@SHSMSX101.ccr.corp.intel.com>
	<19a85866-1e72-58b9-d120-8b5e5b809e90@arm.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D2B865@SHSMSX101.ccr.corp.intel.com>
	<1c78deea-a1c9-2ef7-113a-f6be93888560@arm.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D3834F@SHSMSX101.ccr.corp.intel.com>
	<bc006783-3667-07ec-995a-6a7e9000daaa@arm.com>
In-Reply-To: <bc006783-3667-07ec-995a-6a7e9000daaa@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDdmNDMzY2UtYWQzYy00YWM5LTlmOGQtYjc0ZWY0ZDFkYzI1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IktZRzlUcFZSWk1wQUlrMlVSOVhDUVc4dE8xazEyNElrc01KN1F3MFlHVTQ9In0=
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
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
X-TUID: SWTboI4gJqA0

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNr
ZXJAYXJtLmNvbV0NCj4gU2VudDogRnJpZGF5LCBKdWx5IDE0LCAyMDE3IDc6MjYgUE0NCj4gDQo+
IE9uIDE0LzA3LzE3IDA4OjIwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPj4gRnJvbTogSmVhbi1Q
aGlsaXBwZSBCcnVja2VyIFttYWlsdG86amVhbi1waGlsaXBwZS5icnVja2VyQGFybS5jb21dDQo+
ID4+IFNlbnQ6IEZyaWRheSwgSnVseSA3LCAyMDE3IDExOjE1IFBNDQo+ID4+DQo+ID4+IE9uIDA3
LzA3LzE3IDA3OjIxLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPj4+IHNvcnJ5IEkgZGlkbid0IHF1
aXRlIGdldCB0aGlzIHBhcnQsIGFuZCBoZXJlIGlzIG15IHVuZGVyc3RhbmRpbmc6DQo+ID4+Pg0K
PiA+Pj4gR3Vlc3QgcHJvZ3JhbXMgdklPTU1VIHRvIG1hcCBhIGdJT1ZBICh1c2VkIGJ5IE1TSSB0
byBhIEdQQQ0KPiA+Pj4gb2YgZG9vcmJlbGwgcmVnaXN0ZXIgb2YgdmlydHVhbCBpcnFjaGlwLiB2
SU9NTVUgdGhlbg0KPiA+Pj4gdHJpZ2dlcnMgVkZJTyBtYXAvdW5tYXAgdG8gdXBkYXRlIHBoeXNp
Y2FsIElPTU1VIHBhZ2UNCj4gPj4+IHRhYmxlIGZvciBnSU9WQSAtPiBIUEEgb2YgcmVhbCBkb29y
YmVsbCBvZiBwaHlzaWNhbCBpcnFjaGlwDQo+ID4+DQo+ID4+IEF0IHRoZSBtb21lbnQgKG5vbi1T
Vk0pLCBwaHlzaWNhbCBhbmQgdmlydHVhbCBNU0kgZG9vcmJlbGwgYXJlDQo+IGNvbXBsZXRlbHkN
Cj4gPj4gZGlzc29jaWF0ZWQuIFZGSU8gaXRzZWxmIG1hcHMgdGhlIGRvb3JiZWxsIEdQQS0+SFBB
IGR1cmluZyBjb250YWluZXINCj4gPj4gaW5pdGlhbGl6YXRpb24uIFRoZSBHUEEsIGNob3NlbiBh
cmJpdHJhcmlseSBieSB0aGUgaG9zdCwgaXMgdGhlbiByZW1vdmVkDQo+ID4+IGZyb20gdGhlIGd1
ZXN0IEdQQSBzcGFjZS4NCj4gPg0KPiA+IGdvdCB5b3UuIEkgYWxzbyBnb3Qgc29tZSBiYXNpYyB1
bmRlcnN0YW5kaW5nIGZyb20gYmVsb3cgbGluay4gOi0pDQo+ID4NCj4gPiBodHRwczovL3d3dy5s
aW5hcm8ub3JnL2Jsb2cvY29yZS1kdW1wL2t2bS1wY2llbXNpLXBhc3N0aHJvdWdoLQ0KPiBhcm1h
cm02NC8NCj4gPg0KPiA+Pg0KPiA+PiBXaGVuIHRoZSBndWVzdCBwcm9ncmFtcyB0aGUgdklPTU1V
IHRvIG1hcCBhIGdJT1ZBIHRvIHRoZSB2aXJ0dWFsDQo+IGlycWNoaXANCj4gPj4gZG9vcmJlbGws
IEkgc3VwcG9zZSBRZW11IHdpbGwgbm90aWNlIHRoYXQgdGhlIEdQQSBkb2Vzbid0IGNvcnJlc3Bv
bmQgdG8NCj4gPj4gUkFNIGFuZCB3aWxsIHdpdGhob2xkIHNlbmRpbmcgYSBWRklPX0lPTU1VX01B
UF9ETUEgcmVxdWVzdC4NCj4gPj4NCj4gPj4gKEZvciBTVk0gSSBkb24ndCB3YW50IHRvIGdvIGlu
dG8gdGhlIGRldGFpbHMganVzdCBub3csIGJ1dCB3ZSB3aWxsDQo+ID4+IHByb2JhYmx5IG5lZWQg
YSBzZXBhcmF0ZSBWRklPIG1lY2hhbmlzbSB0byB1cGRhdGUgdGhlIHBoeXNpY2FsIE1TSS1YDQo+
ID4+IHRhYmxlcyB3aXRoIHdoYXRldmVyIGdJT1ZBIHRoZSBndWVzdCBtYXBwZWQgaW4gaXRzIHBy
aXZhdGUgc3RhZ2UtMSBwYWdlDQo+ID4+IHRhYmxlcy4pDQo+ID4NCj4gPiBJIGd1ZXNzIHRoZXJl
IG1heSBiZSBlaXRoZXIgYSB0ZXJtaW5vbG9neSBkaWZmZXJlbmNlIG9yIGEgaGFyZHdhcmUNCj4g
PiBkaWZmZXJlbmNlIGhlcmUsIHNpbmNlIEkgbm90ZWQgeW91IG1lbnRpb25lZCBJT1ZBIHdpdGgg
c3RhZ2UtMQ0KPiA+IG11bHRpcGxlIHRpbWVzLg0KPiA+DQo+ID4gRm9yIEludGVsIFZULWQ6DQo+
ID4NCj4gPiAtIHN0YWdlLTEgaXMgb25seSBmb3IgVkEgdHJhbnNsYXRpb24sIHRhZ2dlZCB3aXRo
IFBBU0lEDQo+ID4gLSBzdGFnZS0yIGNhbiBiZSB1c2VkIGZvciBJT1ZBIHRyYW5zbGF0aW9uIG9u
IGJhcmUgbWV0YWwgb3IgR1BBL2dJT1ZBDQo+ID4gdHJhbnNsYXRpb24gaW4gdmlydHVhbGl6YXRp
b24sIHcvbyBQQVNJRCB0YWdnZWQNCj4gDQo+IFRoZSB0ZXJtaW5vbG9neSBpcyBpbmRlZWQgYSBi
aXQgY29uZnVzaW5nLCBhbmQgdGhlIGhhcmR3YXJlIHNsaWdodGx5DQo+IGRpZmZlcmVudC4gRm9y
IG1lIElPVkEgaXMgdGhlIGFkZHJlc3MgdXNlZCBhcyBpbnB1dCBvZiB0aGUgcElPTU1VLCBQQSBp
cw0KPiB0aGUgb3V0cHV0IGFkZHJlc3MsIGFuZCBHUEEgb25seSBleGlzdHMgaWYgdGhlcmUgaXMg
c3RhZ2UtMSArIHN0YWdlLTIuIFNvDQo+IEkgdGhpbmsgd2hhdCBJIG1lYW50IGJ5IGdJT1ZBIGFi
b3ZlIHdhcyBWQSBpbiB5b3VyIGRlc2NyaXB0aW9uLg0KDQpJbiBMaW51eCBrZXJuZWwgSU9WQSBz
cGVjaWZpY2FsbHkgcmVmZXJzIHRvIGEgcHNldWRvIGFkZHJlc3Mgc3BhY2UNCnJlbWFwcGVkIHRv
IFBBIChlLmcuIGZyb20gcGNpX21hcCkgd2hpbGUgVkEgaXMgZm9yIHJlYWwgQ1BVIHZpcnR1YWwg
DQphZGRyZXNzIChzby1jYWxsZWQgU1ZNKS4gZWl0aGVyIElPVkEgb3IgVkEgY2FuIGJlIGlucHV0
IHRvIHBJT01NVQ0KYmFzZWQgb24gZGlmZmVyZW50IHVzYWdlcy4gV2hlbiBydW5uaW5nIGluc2lk
ZSBhIFZNLCB0aGVuIGlucHV0DQphZGRyZXNzZXMgYmVjb21lIGdJT1ZBIG9yIEdWQS4gV2hhdCBh
Ym91dCBmb2xsb3dpbmcgdGhpcyBjb252ZW50aW9uDQpoZXJlIGFuZCBpbiBmdXR1cmUgZGlzY3Vz
c2lvbnMsIHRob3VnaCBJIGFncmVlIGNvbmNlcHR1YWxseSBJT1ZBIGNhbiANCnJlcHJlc2VudCBh
bnkgaW5wdXQgb2YgcElPTU1VPyA6LSkNCg0KPiANCj4gSSB1bmRlcnN0YW5kIHlvdXIgInN0YWdl
LTEiIGFuZCAic3RhZ2UtMiIgYXJlIG5hbWVkICJmaXJzdC1sZXZlbCIgYW5kDQo+ICJzZWNvbmQg
bGV2ZWwiIGluIHRoZSBWVC1kIHNwZWM/DQoNCnllcywgVlQtZCB1c2VzIGZpcnN0L3NlY29uZCBs
ZXZlbC4NCg0KPiANCj4gSWYgSSByZWFkIHRoZSBWVC1kIHNwZWMgY29ycmVjdGx5LCBJIHRoaW5r
IHRoZSBtYWluIGRpZmZlcmVuY2Ugb24gQVJNIFNNTVUNCj4gaXMgdGhhdCBzdGFnZS0yIGFsd2F5
cyBmb2xsb3dzIHN0YWdlLTEgdHJhbnNsYXRpb24sIGJ1dCBlaXRoZXIgc3RhZ2UgbWF5DQo+IGJl
IGRpc2FibGVkIChvciBib3RoLCBmb3IgYnlwYXNzIG1vZGUpLiBUaGVyZSBpcyBubyBtb2RlIGxp
a2UgaW4gVlQtZCwNCj4gd2hlcmUgbm9uLVBBU0lEIHRyYW5zYWN0aW9ucyBnbyBvbmx5IHRocm91
Z2ggc3RhZ2UtMiBhbmQgUEFTSUQNCj4gdHJhbnNhY3Rpb25zIGdvIG9ubHkgdGhyb3VnaCBzdGFn
ZS0xLiBJIGJlbGlldmUgdGhpcyBpcyAoTkVTVEU9MCwNCj4gVD0wMDBiLzAwMWIpIGluIHRoZSBF
eHRlbmRlZC1Db250ZXh0LUVudHJ5Lg0KPiANCj4gU29tZXRoaW5nIGVxdWl2YWxlbnQgaW4gU01N
VSBpcyBkaXNhYmxpbmcgc3RhZ2UtMiBhbmQgdXNpbmcgdGhlIGVudHJ5IDAgaW4NCj4gdGhlIFBB
U0lEIHRhYmxlIGZvciBub24tUEFTSUQgdHJhZmZpYy4gSW4gdGhpcyBtb2RlLCB0cmFmZmljIHRo
YXQgdXNlcw0KPiBQQVNJRCMwIHdvdWxkIGJlIGFib3J0ZWQuIFNvIHVzaW5nIHlvdXIgdGVybXMs
IHRoZSBTTU1VIGNhbiBoYXZlIFZBcw0KPiBhbmQNCj4gSU9WQXMgYmUgdHJhbnNsYXRlZCBieSBz
dGFnZS0xIGFuZCB0aGVuLCBpZiBlbmFibGVkLCBiZSB0cmFuc2xhdGVkIGJ5DQo+IHN0YWdlLTIg
YXMgd2VsbC4NCj4gDQoNCkNsZWFyIHRvIG1lLiBUaGFua3MgZm9yIGV4cGxhbmF0aW9uLg0KDQpL
ZXZpbg0K
