Received: by 10.25.44.15 with SMTP id s15csp563601lfs;
        Fri, 14 Jul 2017 00:20:58 -0700 (PDT)
X-Received: by 10.55.75.210 with SMTP id y201mr10551163qka.80.1500016857727;
        Fri, 14 Jul 2017 00:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500016857; cv=none;
        d=google.com; s=arc-20160816;
        b=GTMYgGxe9PUkelW3aoAUS8zlzNBr+2o9d/2uWwAtbw9a2bQngo/RbtR5k2AHzoz5PB
         bG/el+6jLK8mnECL3NpbD4ZkFD6+gOncBKHCLLUDnxhAFheV/IaE6bE8xVY1g4B6A7qB
         bhAJRnWxBgmBUmqCmVAn9qIC+v232dOKQoULaF3RqN9Awdh0XTh2lRWdomo2LOTpfzP1
         5yUaFN2I45jZ9jBQPtjiNbzoEPwQEIgeyjjEo9ALx5mDoQxSv2jI1QuqYjakUJPRQkuv
         kvelV+w262V90vYctDJibQfDb1vd+zj6uBVl8rA7KSlrWxJwuNw65Uu2Rm/YbYUXUnW5
         aUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=2Q9SQ3oTfvngFb9FUcv02PMlTZ0n4rX4K5Yu0eJcN24=;
        b=M8eOjWtnvg+B3qiu0ZePR9E6Yrml/Fx2giV4/qNf/I+mhd9KbIR6VUqQzdl7CRuZHs
         PyZ0ycVQ4rIE3WpCEdI7f7Iu0gMMTDK/rxxmZa/YpfRB5TkuwmLPKvCpxQy7U1ILVqOv
         QXc7yvMY2xVIg3l+PxjO4Whl1HOYqEG4VxDeYkJRulkZ6+2jtQElcyrC8TvfppaDNEnI
         rbJUMiAS8bAj0dz8YtDexK5Ac9QuVahR26n//xeJ4Dg+yfNHvNflLbASVd8P04vbtn5m
         4TzCT86KtcfZw+INngvh2KNModhH3OhcZbEbVSfJbRCcOLGKDd+c411GDoTkH/c482bN
         XMjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 137si7239142qkf.66.2017.07.14.00.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 00:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVuuF-0000UJ-3h
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 03:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dVuuB-0000UE-KY
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 03:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dVuu8-00077d-GI
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 03:20:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:41506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dVuu8-00077O-5H; Fri, 14 Jul 2017 03:20:48 -0400
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 14 Jul 2017 00:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,357,1496127600"; d="scan'208";a="126586928"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2017 00:20:46 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 14 Jul 2017 00:20:46 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
	FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 14 Jul 2017 00:20:45 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX104.ccr.corp.intel.com ([10.239.4.70]) with mapi id
	14.03.0319.002; Fri, 14 Jul 2017 15:20:44 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Bharat Bhushan
	<bharat.bhushan@nxp.com>, Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCAACd4AIAZdvaw///X/4CAAzyV8IAAEiOAgAr79CA=
Date: Fri, 14 Jul 2017 07:20:44 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D3834F@SHSMSX101.ccr.corp.intel.com>
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
In-Reply-To: <1c78deea-a1c9-2ef7-113a-f6be93888560@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzU4ZmY5NzUtNmQ5MS00Zjc2LWFkNTYtMWUyY2NlMTIzY2JkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlwveXBRYmVTQUVwbERzMVA0WlBFVmhJa3dYMDZUc2xybkpqV1NWOHQyaHdZPSJ9
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
X-TUID: xarhafLufF5h

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNr
ZXJAYXJtLmNvbV0NCj4gU2VudDogRnJpZGF5LCBKdWx5IDcsIDIwMTcgMTE6MTUgUE0NCj4gDQo+
IE9uIDA3LzA3LzE3IDA3OjIxLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPiBzb3JyeSBJIGRpZG4n
dCBxdWl0ZSBnZXQgdGhpcyBwYXJ0LCBhbmQgaGVyZSBpcyBteSB1bmRlcnN0YW5kaW5nOg0KPiA+
DQo+ID4gR3Vlc3QgcHJvZ3JhbXMgdklPTU1VIHRvIG1hcCBhIGdJT1ZBICh1c2VkIGJ5IE1TSSB0
byBhIEdQQQ0KPiA+IG9mIGRvb3JiZWxsIHJlZ2lzdGVyIG9mIHZpcnR1YWwgaXJxY2hpcC4gdklP
TU1VIHRoZW4NCj4gPiB0cmlnZ2VycyBWRklPIG1hcC91bm1hcCB0byB1cGRhdGUgcGh5c2ljYWwg
SU9NTVUgcGFnZQ0KPiA+IHRhYmxlIGZvciBnSU9WQSAtPiBIUEEgb2YgcmVhbCBkb29yYmVsbCBv
ZiBwaHlzaWNhbCBpcnFjaGlwDQo+IA0KPiBBdCB0aGUgbW9tZW50IChub24tU1ZNKSwgcGh5c2lj
YWwgYW5kIHZpcnR1YWwgTVNJIGRvb3JiZWxsIGFyZSBjb21wbGV0ZWx5DQo+IGRpc3NvY2lhdGVk
LiBWRklPIGl0c2VsZiBtYXBzIHRoZSBkb29yYmVsbCBHUEEtPkhQQSBkdXJpbmcgY29udGFpbmVy
DQo+IGluaXRpYWxpemF0aW9uLiBUaGUgR1BBLCBjaG9zZW4gYXJiaXRyYXJpbHkgYnkgdGhlIGhv
c3QsIGlzIHRoZW4gcmVtb3ZlZA0KPiBmcm9tIHRoZSBndWVzdCBHUEEgc3BhY2UuDQoNCmdvdCB5
b3UuIEkgYWxzbyBnb3Qgc29tZSBiYXNpYyB1bmRlcnN0YW5kaW5nIGZyb20gYmVsb3cgbGluay4g
Oi0pDQoNCmh0dHBzOi8vd3d3LmxpbmFyby5vcmcvYmxvZy9jb3JlLWR1bXAva3ZtLXBjaWVtc2kt
cGFzc3Rocm91Z2gtYXJtYXJtNjQvDQoNCj4gDQo+IFdoZW4gdGhlIGd1ZXN0IHByb2dyYW1zIHRo
ZSB2SU9NTVUgdG8gbWFwIGEgZ0lPVkEgdG8gdGhlIHZpcnR1YWwgaXJxY2hpcA0KPiBkb29yYmVs
bCwgSSBzdXBwb3NlIFFlbXUgd2lsbCBub3RpY2UgdGhhdCB0aGUgR1BBIGRvZXNuJ3QgY29ycmVz
cG9uZCB0bw0KPiBSQU0gYW5kIHdpbGwgd2l0aGhvbGQgc2VuZGluZyBhIFZGSU9fSU9NTVVfTUFQ
X0RNQSByZXF1ZXN0Lg0KPiANCj4gKEZvciBTVk0gSSBkb24ndCB3YW50IHRvIGdvIGludG8gdGhl
IGRldGFpbHMganVzdCBub3csIGJ1dCB3ZSB3aWxsDQo+IHByb2JhYmx5IG5lZWQgYSBzZXBhcmF0
ZSBWRklPIG1lY2hhbmlzbSB0byB1cGRhdGUgdGhlIHBoeXNpY2FsIE1TSS1YDQo+IHRhYmxlcyB3
aXRoIHdoYXRldmVyIGdJT1ZBIHRoZSBndWVzdCBtYXBwZWQgaW4gaXRzIHByaXZhdGUgc3RhZ2Ut
MSBwYWdlDQo+IHRhYmxlcy4pDQoNCkkgZ3Vlc3MgdGhlcmUgbWF5IGJlIGVpdGhlciBhIHRlcm1p
bm9sb2d5IGRpZmZlcmVuY2Ugb3IgYSBoYXJkd2FyZQ0KZGlmZmVyZW5jZSBoZXJlLCBzaW5jZSBJ
IG5vdGVkIHlvdSBtZW50aW9uZWQgSU9WQSB3aXRoIHN0YWdlLTENCm11bHRpcGxlIHRpbWVzLg0K
DQpGb3IgSW50ZWwgVlQtZDoNCg0KLSBzdGFnZS0xIGlzIG9ubHkgZm9yIFZBIHRyYW5zbGF0aW9u
LCB0YWdnZWQgd2l0aCBQQVNJRA0KLSBzdGFnZS0yIGNhbiBiZSB1c2VkIGZvciBJT1ZBIHRyYW5z
bGF0aW9uIG9uIGJhcmUgbWV0YWwgb3IgR1BBL2dJT1ZBDQp0cmFuc2xhdGlvbiBpbiB2aXJ0dWFs
aXphdGlvbiwgdy9vIFBBU0lEIHRhZ2dlZA0KDQpEb2VzIEFSTSBTTU1VIGFsbG93IHN0YWdlLTEg
dXNlZCBmb3IgYm90aCBWQSBhbmQgSU9WQT8gSUlSQw0KeW91IHNhaWQgUEFTSUQjMCByZXNlcnZl
ZCBmb3IgdHJhZmZpYyB3L28gUEFTSUQgaW4gc29tZSBtYWlsLi4uDQoNCj4gDQo+ID4gKGFzc3Vt
ZSB5b3VyIGlycWNoaXAgd2lsbCBwcm92aWRlIG11bHRpcGxlIGRvb3JiZWxscyBzbyBlYWNoDQo+
ID4gZGV2aWNlIGNhbiBoYXZlIGl0cyBvd24gY2hhbm5lbCkuDQo+IA0KPiBJbiBleGlzdGluZyBp
cnFjaGlwcyB0aGUgZG9vcmJlbGwgaXMgc2hhcmVkIGJ5IGVuZHBvaW50cywgd2hpY2ggYXJlDQo+
IGRpZmZlcmVudGlhdGVkIGJ5IHRoZWlyIGRldmljZSBJRCAoZ2VuZXJhbGx5IHRoZSBCREYpLiBJ
J20gbm90IHN1cmUgd2h5DQo+IHRoaXMgbWF0dGVycyBoZXJlPw0KDQpOb3QgbWF0dGVyIG5vdyB3
aXRoIGRldmljZSBJRA0KDQo+IA0KPiA+IHRoZW4gb25jZSB0aGlzIHVwZGF0ZSBpcw0KPiA+IGRv
bmUsIGxhdGVyIE1TSSBpbnRlcnJ1cHRzIGZyb20gYXNzaWduZWQgZGV2aWNlIHdpbGwgZ28NCj4g
PiB0aHJvdWdoIHBoeXNpY2FsIElPTU1VIChnSU9WQS0+SFBBKSB0aGVuIHJlYWNoIGlycWNoaXAN
Cj4gPiBmb3IgaXJxIHJlbWFwcGluZy4gdklPTU1VIGlzIGludm9sdmVkIG9ubHkgaW4gY29uZmln
dXJhdGlvbg0KPiA+IHBhdGggaW5zdGVhZCBvZiBhY3R1YWwgaW50ZXJydXB0IHBhdGguDQo+IA0K
PiBZZXMgdGhlIHZJT01NVSBpcyB1c2VkIHRvIGNvcnJlbGF0ZSB0aGUgSU9WQSB3cml0dGVuIGJ5
IHRoZSBndWVzdCBpbiBpdHMNCj4gdmlydHVhbCBNU0ktWCB0YWJsZSB3aXRoIHRoZSBNQVAgcmVx
dWVzdCByZWNlaXZlZCBieSB0aGUgdklPTU1VLiBUaGF0IGlzDQo+IHByb2JhYmx5IHVzZWQgdG8g
c2V0dXAgSVJRRkQgcm91dGVzIHdpdGggS1ZNLiBCdXQgdGhlIHZJT01NVSBpcyBub3QNCj4gaW52
b2x2ZWQgZnVydGhlciB0aGFuIHRoYXQgaW4gTVNJcy4NCj4gDQo+ID4gSWYgbXkgdW5kZXJzdGFu
ZGluZyBpcyBjb3JyZWN0LCBhYm92ZSB3aWxsIGJlIHRoZSBuYXR1cmFsIGZsb3cgdGhlbg0KPiA+
IHdoeSBpcyBhZGRpdGlvbmFsIHZpcnRpby1pb21tdSBjaGFuZ2UgcmVxdWlyZWQ/IDotKQ0KPiAN
Cj4gVGhlIGNoYW5nZSBpcyBub3QgKnJlcXVpcmVkKiBmb3IgQVJNIHN5c3RlbXMsIEkgb25seSBw
cm9wb3NlZCByZW1vdmluZyB0aGUNCj4gZG9vcmJlbGwgYWRkcmVzcyB0cmFuc2xhdGlvbiBzdGFn
ZSB0byBtYWtlIGhvc3QgaW1wbGVtZW50YXRpb24gc2ltcGxlcg0KPiAoYW5kIHNpbmNlIHZpcnRp
by1pb21tdSBvbiB4ODYgd29uJ3QgdHJhbnNsYXRlIHRoZSBkb29yYmVsbCBhbnl3YXksIHdlDQo+
IGhhdmUgdG8gYWRkIHN1cHBvcnQgZm9yIHRoaXMgdG8gdmlydGlvLWlvbW11KS4gQnV0IGZvciBR
ZW11LCBzaW5jZSB2U01NVQ0KPiBuZWVkcyB0byBpbXBsZW1lbnQgdGhlIG5hdHVyYWwgZmxvdyBh
bnl3YXksIGl0IG1pZ2h0IG5vdCBiZSBhIGxvdCBvZg0KPiBlZmZvcnQgdG8gYWxzbyBkbyBpdCBm
b3IgdmlydGlvLWlvbW11LiBPdGhlciBpbXBsZW1lbnRhdGlvbnMgKGUuZy4NCj4ga3ZtdG9vbCkg
bWlnaHQgcGlnZ3ktYmFjayBvbiB0aGUgeDg2IHdheSBhbmQgZGVjbGFyZSB0aGUgaXJxY2hpcCBk
b29yYmVsbA0KPiBhcyB1bnRyYW5zbGF0ZWQuDQo+IA0KPiBNeSBwcm9wb3NhbCBhbHNvIGJyZWFr
cyB3aGVuIGNvbmZyb250ZWQgdG8gdmlydHVhbCBTVk0gaW4gYSBwaHlzaWNhbCBBUk0NCj4gc3lz
dGVtLCB3aGVyZSB0aGUgZ3Vlc3Qgb3ducyBzdGFnZS0xIHBhZ2UgdGFibGVzIGFuZCAqaGFzKiB0
byBtYXAgdGhlDQo+IGRvb3JiZWxsIGlmIGl0IHdhbnRzIE1TSXMgdG8gd29yaywgc28geW91IGNh
biBkaXNyZWdhcmQgaXQgOikNCj4gDQoNCkl0IGlzIGEgZ29vZCBsZWFybmluZy4gdGhhbmtzLg0K
