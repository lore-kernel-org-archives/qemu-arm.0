Received: by 10.223.197.9 with SMTP id q9csp449475wrf;
        Fri, 13 Oct 2017 00:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QCFtXtAnN6Vs4Z/ReljxO3gyOLhGt6o6z9vot8QlbCGxFRGFAD+fN7f3kf8uej68b7escP
X-Received: by 10.200.37.230 with SMTP id f35mr674602qtf.335.1507878189300;
        Fri, 13 Oct 2017 00:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507878189; cv=none;
        d=google.com; s=arc-20160816;
        b=c6TEdxljMPykIjjDW2iVXx8TBkVq99MkEOZ59Y07gWuwXm59nhQ7vwmySlWg3XkPNZ
         DQ9OLMyVEVrcZ33Tf6Mra6e07u5tuuF63yhWfiacHICUtEkO7LtD1wABb5paw5E7BOyq
         McNYr1jY/z7ZSyQgXpa+iNOiOISmaMoJ8uCeB9VQ2MEdeJ877mr6M4oxhhTz9/vDk2vZ
         j/HiBjmbLXDH/+DlgzPhea8p4BfUFtlcI3wI/Q+W7yOuSAqbYITWj6815s1MjqXoLGUE
         mJwOAV1fkFVVnh/jsN0QVm+EJeD+c5HEDQEOiC27fbs/1hgiuBBaDUOCluBUK8jW/JH2
         NQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=OEFO5OuaYsMDElx8fy4WnbbmuKxkATQC5zee7yQWrvY=;
        b=l7w02tXMH9qeEoyWi2YoOzKrBmhO5frUUHPsLKRzVZYRvYOpi5dAOxTekOtp/UXa9e
         vbcy2uslx0aldD3idrfB9Ayq5kZlX470Jl6JO4tA/Cn6JkoKTwQmc/Q9ZkRlezhkjCd7
         nytT+Wm//Hr7GDliS0ff2Ib9becenL+rm9+fosuAQAlqTJ178Wy81XdO5g9G8d8O6Qnu
         vYomuUicsebmJ7nD6h9jT9Ft89QHRZI0JDbndSsKq717uhZuD9o93Uo0wLcivix6JEjU
         Bl8+uNUvyKuhufbCBkYyQSV5yjim7wt+jtjE73ZHw5HyGhxE8ahqTwneZPPKf008SQ7G
         s8ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si266585qta.328.2017.10.13.00.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 00:03:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2tzv-0005wU-33
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 03:03:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1e2tz1-0005d5-M5
	for qemu-devel@nongnu.org; Fri, 13 Oct 2017 03:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1e2tyv-00007B-Rt
	for qemu-devel@nongnu.org; Fri, 13 Oct 2017 03:02:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:54868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1e2tyv-00005O-Ey; Fri, 13 Oct 2017 03:02:05 -0400
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Oct 2017 00:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,369,1503385200"; d="scan'208";a="162203599"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2017 00:01:57 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 13 Oct 2017 00:01:57 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
	fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 13 Oct 2017 00:01:57 -0700
Received: from shsmsx151.ccr.corp.intel.com ([169.254.3.98]) by
	SHSMSX152.ccr.corp.intel.com ([169.254.6.93]) with mapi id
	14.03.0319.002; Fri, 13 Oct 2017 15:01:55 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
Thread-Index: AQHTMRuJE/W4h0K/h0uvPH/UZkcacKLeWg2AgAAUHACAASmvgIAABEMAgAHjfIA=
Date: Fri, 13 Oct 2017 07:01:54 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190E139B0@SHSMSX151.ccr.corp.intel.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
	<f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
	<CAFEAcA_2RaRsvm_=V4iDNk_vMOtiWUZs3-SdMh+DSYqGyPE0PQ@mail.gmail.com>
	<08ce288c-610c-4dea-927d-262e7b75051f@redhat.com>
In-Reply-To: <08ce288c-610c-4dea-927d-262e7b75051f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjE5NWVkNjgtMTk2My00MjNkLTk5YmQtZmY1NTA0Y2U0NDUzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik55bjJoTXpMcE0xMGJTSlBSeDJUd0oya0h2UnJ0ODZBbzNFQllKSWdKMmc9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, Will
	Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>, Alex
	Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKTFhZ4JKCHN

PiBGcm9tOiBBdWdlciBFcmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50
OiBUaHVyc2RheSwgT2N0b2JlciAxMiwgMjAxNyA2OjEwIFBNDQo+IA0KPiBIaSBQZXRlciwNCj4g
DQo+IE9uIDEyLzEwLzIwMTcgMTE6NTQsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+ID4gT24gMTEg
T2N0b2JlciAyMDE3IGF0IDE3OjA4LCBBdWdlciBFcmljIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+
IHdyb3RlOg0KPiA+PiBIaSBQZXRlciwNCj4gPj4NCj4gPj4gT24gMTEvMTAvMjAxNyAxNjo1Niwg
UGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gPj4+IE9uIDE5IFNlcHRlbWJlciAyMDE3IGF0IDA4OjQ2
LCBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IHdyb3RlOg0KPiA+Pj4+IFRo
aXMgc2VyaWVzIGltcGxlbWVudHMgdGhlIHZpcnRpby1pb21tdSBkZXZpY2UuDQo+ID4+Pj4NCj4g
Pj4+PiBUaGlzIHY0IGlzIGFuIHVwZ3JhZGUgdG8gdjAuNCBzcGVjIFsxXSBhbmQgYXBwbGllcyBv
biBRRU1VIHYyLjEwLjAuDQo+ID4+Pj4gLSBwcm9iZSByZXF1ZXN0IHN1cHBvcnQgYWx0aG91Z2gg
bm8gcmVzZXJ2ZWQgcmVnaW9uIGlzIHJldHVybmVkIGF0DQo+ID4+Pj4gICB0aGUgbW9tZW50DQo+
ID4+Pj4gLSB1bm1hcCBzZW1hbnRpY3MgbGVzcyBzdHJpY3QsIGFzIHNwZWNpZmllZCBpbiB2MC40
DQo+ID4+Pj4gLSBkZXZpY2UgcmVnaXN0cmF0aW9uLCBhdHRhY2gvZGV0YWNoIHJldmlzaXRlZA0K
PiA+Pj4+IC0gc3BsaXQgaW50byBzbWFsbGVyIHBhdGNoZXMgdG8gZWFzZSByZXZpZXcNCj4gPj4+
PiAtIHByb3Bvc2UgYSB3YXkgdG8gaW5mb3JtIHRoZSBJT01NVSBtciBhYm91dCB0aGUgcGFnZV9z
aXplX21hc2sNCj4gPj4+PiAgIG9mIHVuZGVybHlpbmcgSFcgSU9NTVUsIGlmIGFueQ0KPiA+Pj4+
IC0gcmVtb3ZlIHdhcm5pbmcgYXNzb2NpYXRlZCB3aXRoIHRoZSB0cmFuc2xhdGlvbiBvZiB0aGUg
TVNJIGRvb3JiZWxsDQo+ID4+Pj4NCj4gPj4+PiBUaGUgZGV2aWNlIGdldHMgaW5zdGFudGlhdGVk
IHVzaW5nIHRoZSAiLWRldmljZSB2aXJ0aW8taW9tbXUtZGV2aWNlIg0KPiA+Pj4+IG9wdGlvbi4g
SXQgY3VycmVudGx5IHdvcmtzIHdpdGggQVJNIHZpcnQgbWFjaGluZSBvbmx5LCBhcyB0aGUgbWFj
aGluZQ0KPiA+Pj4+IG11c3QgaGFuZGxlIHRoZSBkdCBiaW5kaW5nIGJldHdlZW4gdGhlIHZpcnRp
by1tbWlvICJpb21tdSIgbm9kZQ0KPiBhbmQNCj4gPj4+PiB0aGUgUENJIGhvc3QgYnJpZGdlIG5v
ZGUuDQo+ID4+Pg0KPiA+Pj4gQ291bGQgdGhpcyB3b3JrIG9uIHg4Niwgb3IgaXMgaXQgaW5oZXJl
bnRseSBhcm0tb25seT8NCj4gPj4NCj4gPj4gWWVzIHRoaXMgaXMgdGhlIGdvYWwuIEF0IHRoZSBt
b21lbnQgdGhlIEFDUEkgcHJvYmluZyBpcyBub3QgeWV0IHByb3Blcmx5DQo+ID4+IHNwZWNpZmll
ZCBidXQgYSBRMzUgcHJvdG90eXBlIHdhcyBkZXZlbG9wZWQgaW4gdGhlIFJlZCBIYXQgVmlydCB0
ZWFtLg0KPiA+PiBUaGlzIHdpbGwgYmUgcHJlc2VudGVkIGF0IHRoZSBLVk0gZm9ydW0uDQo+ID4N
Cj4gPiBTaW5jZSBJIGhhdmUgdmVyeSBsaXR0bGUgZmFtaWxpYXJpdHkgd2l0aCB2aXJ0aW8gb3Ig
aW9tbXUgY29kZSwNCj4gPiBJJ2QgYmUgbXVjaCBoYXBwaWVyIGlmIHRoaXMgd2FzIHJldmlld2Vk
IGFzIGEgZ2VuZXJpYyB2aXJ0aW8taW9tbXUNCj4gPiBieSB0aGUgeDg2L3ZpcnRpbyBkZXZzIGFu
ZCB0aGVuIHRoZSBhcm0gc3BlY2lmaWMgcGFydHMgZG9uZSBzZWNvbmQuLi4NCj4gDQo+IFVuZGVy
c3Rvb2QuIEkgd2FzIHJhdGhlciBleHBlY3RpbmcgeW91IHRvIHJldmlldyB0aGUgc21tdXYzIGVt
dWxhdGlvbg0KPiBjb2RlIHdoaWNoIHlvdSBkaWQsIGluIGEgY29tcHJlaGVuc2l2ZSBtYW5uZXIg
Oy0pLCBhbmQgbWFueSB0aGFua3MgZm9yDQo+IHRoYXQuDQo+IA0KPiBOb3RlIHN1cmUgdGhpcyBp
cyB0aW1lIHlldCB0byBnZXQgdGhpcyBSRkMgcmV2aWV3ZWQgYXMNCj4gLSB0aGUgdjAuNCB2aXJ0
aW8taW9tbXUgZHJpdmVyIGl0IHJlbGllcyBvbiB3YXMgbm90IG9mZmljaWFsbHkgc3VibWl0dGVk
LA0KPiAtIHRoZSB2aXJ0aW8taW9tbXUgc3BlY2lmaWNhdGlvbiByZXZpZXcgaGFzIG5vdCByZWFs
bHkgYmVlbiByZXZpZXdlZCwNCj4gLSB0aGUgQUNQSSBwcm9iaW5nIG1ldGhvZCBoYXMgbm90IGJl
ZW4gZGlzY3Vzc2VkIHlldC4NCj4gDQo+IEplYW4tUGhpbGlwcGUsIHBsZWFzZSBjb3JyZWN0IG1l
IGlmIEkgYW0gd3JvbmcuDQo+IA0KPiBTbyB0byBtZSwgdGhpcyBpcyBwdXJlIFJGQyBhdCB0aGUg
bW9tZW50Lg0KPiA+DQo+ID4gSSdtIGFsc28gbm90IGNsZWFyIG9uIHdoYXQgd2UncmUgZXhwZWN0
aW5nIHRoZSByZWNvbW1lbmRlZCBvciBub3JtYWwNCj4gPiB3YXkgdG8gZG8gZGV2aWNlIHBhc3N0
aHJvdWdoIGlzIGdvaW5nIHRvIGJlIC0tIHRoaXMgdmlydGlvLW1taW8sDQo+ID4gb3IgcHJlc2Vu
dGluZyB0aGUgZ3Vlc3Qgd2l0aCBhbiBTTU1VdjMgaW50ZXJmYWNlPyBEbyB3ZSByZWFsbHkNCj4g
PiBuZWVkIHRvIGltcGxlbWVudCBib3RoID8NCj4gDQo+IEkgdGhpbmsgdGhlIEtWTSBmb3J1bSBp
cyB0aGUgcmlnaHQgcGxhY2UgdG8gc3luYyBhcyBib3RoIGFwcHJvYWNoZXMgd2lsbA0KPiBiZSBw
cmVzZW50ZWQgYW5kIHNvbWUgcHJvcy9jb25zICsgcGVyZm9ybWFuY2UgZmlndXJlcyB3aWxsIGJl
IGdpdmVuLg0KPiANCj4gQXMgd2UgdGFsayBhYm91dCBjaG9vc2luZywgdGhlcmUgaXMgb25lIGFs
dGVybmF0aXZlIHRoYXQgd2FzIHN1Z2dlc3RlZA0KPiBvbiB0aGUgTUwgYnkgQWxleCAmIE1pY2hh
ZWwgYnV0IG5ldmVyIHJlYWxseSBnZXQgY29uc2lkZXJlZCB5ZXQgYW5kDQo+IG1heWJlIHNob3Vs
ZCBiZTogdXNpbmcgaW50ZWwgaW9tbXUgZW11bGF0aW9uIGNvZGUgZm9yIEFSTS4gSQ0KPiBha25v
d2xlZGdlDQo+IHRoaXMgZGVzZXJ2ZXMgYSB0aG9yb3VnaCBpbXBhY3Qgc3R1ZHkgb24ga2VybmVs
IGFuZCBGVyBzaWRlIGJ1dCBJIHdvdWxkDQo+IGJlIGhhcHB5IHRvIGdldCB5b3VyIG9waW5pb24g
YWJvdXQgdGhlIFFFTVUgc2lkZS4gV291bGQgeW91IGhhdmUgYSBieS0NCj4gcHJpbmNpcGxlIHJl
amVjdGlvbiBvZiB0aGlzIGlkZWEgdG8gaW5zdGFudGlhdGUgc3VjaCBhbiBJbnRlbCBkZXZpY2Ug
aW4NCj4gbWFjaCB2aXJ0IG9yIHdvdWxkIGl0IGJlIHNvbWV0aGluZyB5b3Ugd291bGQgYmUgcmVh
ZHkgdG8gY29uc2lkZXI/DQo+IA0KDQpiZWFyIHBvc3RpbmcgYSBsaW5rIHRvIEFsZXgvTWljaGFl
bCdzIGNvbW1lbnQ/IGludGVyZXN0aW5nIHRvIGtub3cNCnRoZSByYXRpb25hbGUuLi4NCg0KVGhh
bmtzDQpLZXZpbg0K
