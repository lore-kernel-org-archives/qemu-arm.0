Received: by 10.25.44.15 with SMTP id s15csp2952215lfs;
        Thu, 6 Jul 2017 23:22:07 -0700 (PDT)
X-Received: by 10.200.41.238 with SMTP id 43mr63556170qtt.168.1499408527540;
        Thu, 06 Jul 2017 23:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499408527; cv=none;
        d=google.com; s=arc-20160816;
        b=I3fZuU/VKY4uga94ius7hYpbJmo1+br86gjmlPl4Uz3LN8c4CfMSPHhX8lKgjB3Hk8
         q8/7mwkdyfkeKVNhSbT7mXlFhQDhWVmAccTeAfGF3+iHHMfi2Qp6cs3ldhNefS2a9pNq
         9ICmT0QNCihOWnbVx1SCFjCOW9+NIDtrZpY41B9mNFWCX6I6YqfnpOg1tuvoOPjnTJob
         OXLPQ0dLJu0EE0ctyseSL0xq+qmlZ3qcskQTwqOY2Rv0Uz/RFzjrIzFEj34VMO7bA8K0
         LJeo2aYlTY17aWVY9og5wUtFLhQwunn+i8/GyCyKTZ5QQtECo10T6MpUMQ+fTKVHiYp3
         ItoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=TtGCL6AoWI92JTrEHL0O9cphMPDQTLn46Jsnu3VUeTc=;
        b=SpiZILqYu1jj1lc7rytcBBrFaLfE7BTSaKS1ge24lh7Z4kU1JNheeQSYBtlq11hPEa
         t1/GQab9XDH8MsJbeDlYTF7wzGXynzmPItHLs1t/uwcw2MZn1DgbMSKKrOKY/a4AbCiT
         YiLQ+ze+mair5HTGAGH6L/CH0txe4gjndDypCbtvgx2WJZpvNVwwlOoefIT1nrmQk5iH
         STYT8UZQ3j0mnQGDvlnrXQovwmrMjyhdSUEI/UzDKNWdzXJDteHgaMI8Q2+D44+cJNI6
         yia3Q/Kps+uQskdE1NfkRyTx2gDCbV+vLXiSWntwTIqEH8ix7LaOt2hGXaJ7TtDX7V4/
         Z72w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14si2429736qti.116.2017.07.06.23.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 23:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTMeS-0000dQ-Uy
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 02:22:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dTMeH-0000bT-Fm
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 02:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dTMeG-0000IA-Cg
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 02:21:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:30498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dTMeA-0000Fl-Fg; Fri, 07 Jul 2017 02:21:46 -0400
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 23:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,320,1496127600"; d="scan'208";a="122220678"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by orsmga005.jf.intel.com with ESMTP; 06 Jul 2017 23:21:44 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 6 Jul 2017 23:21:44 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX152.ccr.corp.intel.com ([169.254.6.122]) with mapi id
	14.03.0319.002; Fri, 7 Jul 2017 14:21:42 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Bharat Bhushan
	<bharat.bhushan@nxp.com>, Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCAACd4AIAZdvaw///X/4CAAzyV8A==
Date: Fri, 7 Jul 2017 06:21:41 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D2B865@SHSMSX101.ccr.corp.intel.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D25AEB@SHSMSX101.ccr.corp.intel.com>
	<19a85866-1e72-58b9-d120-8b5e5b809e90@arm.com>
In-Reply-To: <19a85866-1e72-58b9-d120-8b5e5b809e90@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzk0ZDdmYTUtY2IwNi00OWM3LWFmZTEtMzkxMWMzMDFjZWQ5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkM3YkFlYjdRWFV5VERSTGRNd090bnJ6Q29YSGxwTjVrUlU1WEduQkV2VnM9In0=
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
X-TUID: Z9G7UXFm7g6N

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNr
ZXJAYXJtLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDUsIDIwMTcgODo0NSBQTQ0KPiAN
Cj4gT24gMDUvMDcvMTcgMDg6MTQsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+PiBGcm9tOiBKZWFu
LVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNrZXJAYXJtLmNvbV0N
Cj4gPj4gU2VudDogTW9uZGF5LCBKdW5lIDE5LCAyMDE3IDY6MTUgUE0NCj4gPj4NCj4gPj4gT24g
MTkvMDYvMTcgMDg6NTQsIEJoYXJhdCBCaHVzaGFuIHdyb3RlOg0KPiA+Pj4gSGkgRXJpYywNCj4g
Pj4+DQo+ID4+PiBJIHN0YXJ0ZWQgYWRkZWQgcmVwbGF5IGluIHZpcnRpby1pb21tdSBhbmQgY2Ft
ZSBhY3Jvc3MgaG93IE1TSQ0KPiBpbnRlcnJ1cHRzDQo+ID4+IHdpdGggd29yayB3aXRoIFZGSU8u
DQo+ID4+PiBJIHVuZGVyc3RhbmQgdGhhdCBvbiBpbnRlbCB0aGlzIHdvcmtzIGRpZmZlcmVudGx5
IGJ1dCB2c21tdSB3aWxsIGhhdmUNCj4gc2FtZQ0KPiA+PiByZXF1aXJlbWVudC4NCj4gPj4+IGt2
bS1tc2ktaXJxLXJvdXRlIGFyZSBhZGRlZCB1c2luZyB0aGUgbXNpLWFkZHJlc3MgdG8gYmUgdHJh
bnNsYXRlZCBieQ0KPiA+PiB2aW9tbXUgYW5kIG5vdCB0aGUgZmluYWwgdHJhbnNsYXRlZCBhZGRy
ZXNzLg0KPiA+Pj4gV2hpbGUgY3VycmVudGx5IHRoZSBpcnFmZCBmcmFtZXdvcmsgZG9lcyBub3Qg
a25vdyBhYm91dCBlbXVsYXRlZA0KPiA+PiBpb21tdXMgKHZpcnRpby1pb21tdSwgdnNtbXV2My92
aW50ZWwtaW9tbXUpLg0KPiA+Pj4gU28gaW4gbXkgdmlldyB3ZSBoYXZlIGZvbGxvd2luZyBvcHRp
b25zOg0KPiA+Pj4gLSBQcm9ncmFtbWluZyB3aXRoIHRyYW5zbGF0ZWQgYWRkcmVzcyB3aGVuIHNl
dHRpbmcgdXAga3ZtLW1zaS1pcnEtDQo+IHJvdXRlDQo+ID4+PiAtIFJvdXRlIHRoZSBpbnRlcnJ1
cHRzIHZpYSBRRU1VLCB3aGljaCBpcyBiYWQgZnJvbSBwZXJmb3JtYW5jZQ0KPiA+Pj4gLSB2aG9z
dC12aXJ0aW8taW9tbXUgbWF5IHNvbHZlIHRoZSBwcm9ibGVtIGluIGxvbmcgdGVybQ0KPiA+Pj4N
Cj4gPj4+IElzIHRoZXJlIGFueSBvdGhlciBiZXR0ZXIgb3B0aW9uIEkgYW0gbWlzc2luZz8NCj4g
Pj4NCj4gPj4gU2luY2Ugd2UncmUgb24gdGhlIHRvcGljIG9mIE1TSXMuLi4gSSdtIGN1cnJlbnRs
eSB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cNCj4gPj4gd2UnbGwgaGFuZGxlIE1TSXMgaW4gdGhl
IG5lc3RlZCB0cmFuc2xhdGlvbiBtb2RlLCB3aGVyZSB0aGUgZ3Vlc3QNCj4gbWFuYWdlcw0KPiA+
PiBTMSBwYWdlIHRhYmxlcyBhbmQgdGhlIGhvc3QgZG9lc24ndCBrbm93IGFib3V0IEdWQS0+R1BB
IHRyYW5zbGF0aW9uLg0KPiA+Pg0KPiA+PiBJJ20gYWxzbyB3b25kZXJpbmcgYWJvdXQgdGhlIGJl
bmVmaXRzIG9mIGhhdmluZyBTVy1tYXBwZWQgTVNJcyBpbiB0aGUNCj4gPj4gZ3Vlc3QuIEl0IHNl
ZW1zIHVuYXZvaWRhYmxlIGZvciB2U01NVSBzaW5jZSB0aGF0J3Mgd2hhdCBhIHBoeXNpY2FsDQo+
IHN5c3RlbQ0KPiA+PiB3b3VsZCBkby4gQnV0IGluIGEgcGFyYXZpcnR1YWxpemVkIHNvbHV0aW9u
IHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhbnkNCj4gPj4gY29tcGVsbGluZyByZWFzb24gZm9y
IGhhdmluZyB0aGUgZ3Vlc3QgbWFwIE1TSSBkb29yYmVsbHMuIFRoZXNlDQo+IGFkZHJlc3Nlcw0K
PiA+PiBhcmUgbmV2ZXIgYWNjZXNzZWQgZGlyZWN0bHksIHRoZXkgYXJlIG9ubHkgdXNlZCBmb3Ig
c2V0dGluZyB1cCBJUlEgcm91dGluZw0KPiA+PiAoYXQgbGVhc3Qgb24ga3ZtdG9vbCkuIFNvIGhl
cmUncyB3aGF0IEknZCBsaWtlIHRvIGhhdmUuIE5vdGUgdGhhdCBJDQo+ID4+IGhhdmVuJ3QgaW52
ZXN0aWdhdGVkIHRoZSBmZWFzaWJpbGl0eSBpbiBRZW11IHlldCwgSSBkb24ndCBrbm93IGhvdyBp
dA0KPiA+PiBkZWFscyB3aXRoIE1TSXMuDQo+ID4+DQo+ID4+ICgxKSBHdWVzdCB1c2VzIHRoZSBn
dWVzdC1waHlzaWNhbCBNU0kgZG9vcmJlbGwgd2hlbiBzZXR0aW5nIHVwIE1TSXMuIEZvcg0KPiA+
PiBBUk0gd2l0aCBHSUN2MyB0aGlzIHdvdWxkIGJlIEdJVFNfVFJBTlNMQVRFUiwgZm9yIHg4NiBp
dCB3b3VsZCBiZSB0aGUNCj4gPj4gZml4ZWQgTVNJIGRvb3JiZWxsLiBUaGlzIHdheSB0aGUgaG9z
dCB3b3VsZG4ndCBuZWVkIHRvIGluc3BlY3QgSU9NTVUNCj4gPj4gbWFwcGluZ3Mgd2hlbiBoYW5k
bGluZyB3cml0ZXMgdG8gUENJIE1TSS1YIHRhYmxlcy4NCj4gPj4NCj4gPg0KPiA+IFdoYXQgZG8g
eW91IG1lYW4gYnkgImZpeGVkIE1TSSBkb29yYmVsbCI/IFBDSSBNU0ktWCB0YWJsZSBpcyBwYXJ0
IG9mDQo+ID4gUENJIE1NSU8gYmFyLiBBY2Nlc3NpbmcgdG8gaXQgaXMganVzdCBhIG1lbW9yeSB2
aXJ0dWFsaXphdGlvbiBpc3N1ZSAoZS5nLg0KPiA+IHRyYXAgYnkgS1ZNIGFuZCB0aGVuIGVtdWxh
dGVkIGluIFFlbXUpIG9uIHg4Ni4gSXQncyBub3QgYSBJT01NVQ0KPiA+IHByb2JsZW0uIEkgZ3Vl
c3MgeW91IG1heSBtZWFuIHNhbWUgdGhpbmcgYnV0IHdhbnQgdG8gZG91YmxlIGNvbmZpcm0NCj4g
PiBoZXJlIGdpdmVuIHRoZSB0ZXJtaW5vbG9neSBjb25mdXNpb24uIE9yIGRvIHlvdSBtZWFuIHRo
ZSBpbnRlcnJ1cHQNCj4gPiB0cmlnZ2VyZWQgYnkgSU9NTVUgaXRzZWxmPw0KPiANCj4gWWVzIEkg
ZGlkbid0IG1lYW4gYWNjZXNzIHRvIHRoZSBNU0ktWCB0YWJsZSwgYnV0IGhvdyB3ZSBpbnRlcnBy
ZXQgdGhlDQo+IGFkZHJlc3MgaW4gdGhlIE1TSSBtZXNzYWdlLiBJbiBrdm10b29sIEkgY3JlYXRl
IE1TSSByb3V0ZXMgZm9yIFZGSU8NCj4gZGV2aWNlcyB3aGVuIHRoZSBndWVzdCBhY2Nlc3NlcyB0
aGUgTVNJLVggdGFibGVzLiBBbmQgb24gQVJNIHRoZSB0YWJsZXMNCj4gY29udGFpbnMgYW4gSU9W
QSB0aGF0IG5lZWRzIHRvIGJlIHRyYW5zbGF0ZWQgaW50byBhIFBBLCBzbyBoYW5kbGluZyBhDQo+
IHdyaXRlIHRvIGFuIE1TSS1YIGVudHJ5IG1pZ2h0IG1lYW4gZG9pbmcgdGhlIElPVkEtPlBBIHRy
YW5zbGF0aW9uIG9mIHRoZQ0KPiBkb29yYmVsbC4NCj4gDQo+IE9uIHg4NiB0aGUgTVNJIGFkZHJl
c3MgaXMgMHhmZWUuLi4uLCB3aGV0aGVyIHRoZXJlIGlzIGFuIElPTU1VIG9yIG5vdC4NCj4gVGhh
dCdzIHdoYXQgSSBtZWFudCBieSBmaXhlZC4gQW5kIGl0IGlzIHRoZSBJT01NVSB0aGF0IHBlcmZv
cm1zIElSUQ0KPiByZW1hcHBpbmcuDQo+IA0KPiBPbiBwaHlzaWNhbCBBUk0gc3lzdGVtcywgdGhl
IFNNTVUgZG9lc24ndCB0cmVhdCBhbnkgc3BlY2lhbCBhZGRyZXNzIHJhbmdlDQo+IGFzICJNU0kg
d2luZG93Ii4gRm9yIHRoZSBTTU1VLCBhbiBNU0kgaXMgc2ltcGx5IGEgbWVtb3J5IHRyYW5zYWN0
aW9uLg0KPiBNU0kNCj4gYWRkcmVzc2VzIGFyZSBhcmJpdHJhcnkgSU9WQXMgdGhhdCBnZXQgdHJh
bnNsYXRlZCBpbnRvIFBBcyBieSB0aGUgU01NVS4NCj4gVGhlIFNNTVUgZG9lc24ndCBwZXJmb3Jt
IGFueSBJUlEgcmVtYXBwaW5nLCBvbmx5IGFkZHJlc3MgdHJhbnNsYXRpb24uDQo+IFRoaXMNCj4g
UEEgaXMgYSBkb29yYmVsbCByZWdpc3RlciBpbiB0aGUgaXJxY2hpcCwgd2hpY2ggcGVyZm9ybXMg
SVJRIHJlbWFwcGluZyBhbmQNCj4gdHJpZ2dlcnMgYW4gaW50ZXJydXB0Lg0KDQpUaGFua3MgZm9y
IGV4cGxhbmF0aW9uLiBJIHNlZSB0aGUgYmFja2dyb3VuZCBub3cuDQoNCj4gDQo+IFRoZXJlZm9y
ZSBpbiBhbiBlbXVsYXRlZCBBUk0gc3lzdGVtLCB3aGVuIHRoZSBndWVzdCB3cml0ZXMgdGhlIE1T
SS1YDQo+IHRhYmxlLCBpdCB3cml0ZXMgYW4gSU9WQS4gSW4gYSBzdHJpY3QgZW11bGF0aW9uIHRo
ZSBNU0kgd291bGQgaGF2ZSB0bw0KPiBmaXJzdCBnbyB0aHJvdWdoIHRoZSB2SU9NTVUsIGFuZCB0
aGVuIGludG8gdGhlIGlycWNoaXAuIEkgd2FzIHdvbmRlcmluZyBpZg0KPiB3aXRoIHZpcnRpby1p
b21tdSB3ZSBjb3VsZCBza2lwIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBnbyB0byB0aGUg
TVNJDQo+IHJlbWFwcGluZyBjb21wb25lbnQgaW1tZWRpYXRlbHksIGVmZmVjdGl2ZWx5IGltcGxl
bWVudGluZyBhICJoYXJkd2FyZQ0KPiBNU0kNCj4gd2luZG93Ii4gVGhpcyBpcyB3aGF0IHg4NiBk
b2VzLCB0aGUgZGlmZmVyZW5jZSBiZWluZyB0aGF0IE1TSSByZW1hcHBpbmcgaXMNCj4gZG9uZSBi
eSB0aGUgSU9NTVUgb24geDg2LCBhbmQgYnkgdGhlIGlycWNoaXAgb24gQVJNLg0KDQpzb3JyeSBJ
IGRpZG4ndCBxdWl0ZSBnZXQgdGhpcyBwYXJ0LCBhbmQgaGVyZSBpcyBteSB1bmRlcnN0YW5kaW5n
Og0KDQpHdWVzdCBwcm9ncmFtcyB2SU9NTVUgdG8gbWFwIGEgZ0lPVkEgKHVzZWQgYnkgTVNJIHRv
IGEgR1BBIA0Kb2YgZG9vcmJlbGwgcmVnaXN0ZXIgb2YgdmlydHVhbCBpcnFjaGlwLiB2SU9NTVUg
dGhlbiANCnRyaWdnZXJzIFZGSU8gbWFwL3VubWFwIHRvIHVwZGF0ZSBwaHlzaWNhbCBJT01NVSBw
YWdlDQp0YWJsZSBmb3IgZ0lPVkEgLT4gSFBBIG9mIHJlYWwgZG9vcmJlbGwgb2YgcGh5c2ljYWwg
aXJxY2hpcA0KKGFzc3VtZSB5b3VyIGlycWNoaXAgd2lsbCBwcm92aWRlIG11bHRpcGxlIGRvb3Ji
ZWxscyBzbyBlYWNoDQpkZXZpY2UgY2FuIGhhdmUgaXRzIG93biBjaGFubmVsKS4gdGhlbiBvbmNl
IHRoaXMgdXBkYXRlIGlzDQpkb25lLCBsYXRlciBNU0kgaW50ZXJydXB0cyBmcm9tIGFzc2lnbmVk
IGRldmljZSB3aWxsIGdvIA0KdGhyb3VnaCBwaHlzaWNhbCBJT01NVSAoZ0lPVkEtPkhQQSkgdGhl
biByZWFjaCBpcnFjaGlwIA0KZm9yIGlycSByZW1hcHBpbmcuIHZJT01NVSBpcyBpbnZvbHZlZCBv
bmx5IGluIGNvbmZpZ3VyYXRpb24NCnBhdGggaW5zdGVhZCBvZiBhY3R1YWwgaW50ZXJydXB0IHBh
dGguDQoNCklmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgYWJvdmUgd2lsbCBiZSB0aGUg
bmF0dXJhbCBmbG93IHRoZW4NCndoeSBpcyBhZGRpdGlvbmFsIHZpcnRpby1pb21tdSBjaGFuZ2Ug
cmVxdWlyZWQ/IDotKQ0KDQo+IA0KPiBNeSBjdXJyZW50IHRha2UgaXMgdGhhdCB3ZSBzaG91bGQg
a2VlcCB0aGUgY3VycmVudCBiZWhhdmlvciwgYnV0IEkgd2lsbA0KPiB0cnkgdG8gc29ydCBvdXQg
dGhlIGRpZmZlcmVudCB3YXlzIG9mIGltcGxlbWVudGluZyBNU0lzIHdpdGggdmlydGlvLWlvbW11
DQo+IGluIHRoZSBuZXh0IHNwZWNpZmljYXRpb24gZHJhZnQuDQo+IA0KPiBUaGFua3MsDQo+IEpl
YW4NCg==
