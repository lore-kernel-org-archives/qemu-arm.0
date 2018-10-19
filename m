Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3463773wrt;
        Fri, 19 Oct 2018 01:03:12 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62hh+Co8FLdVZQJbsx8QbUZmed2s0NRdO9WrGXPmcQrm5Hgtzzz1RrTXn8W1R2hLgmLmlQ1
X-Received: by 2002:a37:e213:: with SMTP id g19-v6mr9593007qki.159.1539936191963;
        Fri, 19 Oct 2018 01:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539936191; cv=none;
        d=google.com; s=arc-20160816;
        b=DVnJl3jzJu/jVepfAiaZIMHyRtW4kHQuokhsoj/FwxYRv6dMuN9KZHofSC+xRpI3Wm
         FkNSpe8LFmLQfv83ZxhiUFD+Ytas4YR0+qLQE3upfjBq88Tq1mfF5F2E4C4xdEGiz5w1
         ftRQ9kSjRWRSR2vItrHrKXBg6S1xo12YqQZ/qeJ3LwZUbUpaAUslnbS+RhUtbqMQ3A3K
         PWAPkJrc/nFyG9ftQqoKC1NmRUOqWnBKm04uTXwXIjRG1lGIqMmqJzk1eX4+rWvbEkh9
         PbulvhBnNgkSinQZiKe5wnAipl8j+PKkln59sGH04SVmmjNVDw+QqAnXVfYMjPP5cUV3
         nGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=SlDHFlW0b53BwNYoWx37MT/P39k5ry+lvzBkabFhPOs=;
        b=NCzZTNTfw3rk5loa1sh93QMEhtRZ4o6q/ogizSejZEvCx96j+D1hIPrGFqWKfy3jow
         lCPJF44SxiXReEGH/LRWnHmt83sCl3trD8kqyi8IVpXOZQOAu54/zMJRr8O4UgCt3B94
         DwkpcAkG+y1aykxoZ5QSLSIdYZMURnG5h2YmuyA6zcBCyFq0zFQOIDwFjOJSilp71cVS
         p/x6XKr0HjH4a1m1tRasVBBEFVYTo+K3FLDEJ1UuQyRgJjtglMEiTbrQtVJNkBtFa/HZ
         R0vz//lyReXDLw/T1qKOmugsB8QGi3pfHtRHsogXx7PfQdW59iSup3EXTFyVKdvHtzwn
         LWHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r36-v6si3818381qtj.56.2018.10.19.01.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 01:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDPkV-0003hM-G5
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 04:03:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yi.l.liu@intel.com>) id 1gDPk9-0003dT-9o
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 04:02:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yi.l.liu@intel.com>) id 1gDPjz-0006Uw-Cy
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 04:02:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:41576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yi.l.liu@intel.com>)
	id 1gDPjb-0005PW-DU; Fri, 19 Oct 2018 04:02:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Oct 2018 01:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,399,1534834800"; d="scan'208";a="267021382"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by orsmga005.jf.intel.com with ESMTP; 19 Oct 2018 01:02:09 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 19 Oct 2018 01:02:08 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
	fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 19 Oct 2018 01:02:08 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.48]) by
	SHSMSX103.ccr.corp.intel.com ([169.254.4.245]) with mapi id
	14.03.0319.002; Fri, 19 Oct 2018 16:02:05 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage VFIO
	integration
Thread-Index: AQHUUYPG4Vn8CydKKEelflcsj1GMg6Uk8aPw///QSoCAAZwFQA==
Date: Fri, 19 Oct 2018 08:02:04 +0000
Message-ID: <A2975661238FB949B60364EF0F2C257439D33C4E@SHSMSX104.ccr.corp.intel.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
	<A2975661238FB949B60364EF0F2C257439D32CBE@SHSMSX104.ccr.corp.intel.com>
	<5624f123-27fd-8392-32cf-1792b52483b5@redhat.com>
In-Reply-To: <5624f123-27fd-8392-32cf-1792b52483b5@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDlmODg1MzctNzkwYy00Njk2LTk0ZDEtY2I3Y2EyMjRjZjIyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS3BSR3pPTk1CSStXd1FvV1Bnbnc1NWV5dVhveVYwXC8yb1BzWERMclhlQThVb1A0dkVUb1FHazhoTWJWaXVyNmkifQ==
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage
 VFIO integration
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "cdall@kernel.org" <cdall@kernel.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /H0uuGDDVZdS

SGkgRXJpYywNCg0KPiBGcm9tOiBBdWdlciBFcmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQu
Y29tXQ0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxOCwgMjAxOCAxMToxNiBQTQ0KPiANCj4g
SGkgWWksDQo+IA0KPiBPbiAxMC8xOC8xOCAxMjozMCBQTSwgTGl1LCBZaSBMIHdyb3RlOg0KPiA+
IEhpIEVyaWMsDQo+ID4NCj4gPj4gRnJvbTogRXJpYyBBdWdlciBbbWFpbHRvOmVyaWMuYXVnZXJA
cmVkaGF0LmNvbV0NCj4gPj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjEsIDIwMTggNDoxOCBQ
TQ0KPiA+PiBTdWJqZWN0OiBbUkZDIHYyIDAwLzI4XSB2U01NVXYzL3BTTU1VdjMgMiBzdGFnZSBW
RklPIGludGVncmF0aW9uDQo+ID4+DQo+ID4+IFVwIHRvIG5vdyB2U01NVXYzIGhhcyBub3QgYmVl
biBpbnRlZ3JhdGVkIHdpdGggVkZJTy4gVkZJTyBpbnRlZ3JhdGlvbg0KPiA+PiByZXF1aXJlcyB0
byBwcm9ncmFtIHRoZSBwaHlzaWNhbCBJT01NVSBjb25zaXN0ZW50bHkgd2l0aCB0aGUgZ3Vlc3QN
Cj4gPj4gbWFwcGluZ3MuIEhvd2V2ZXIsIGFzIG9wcG9zZWQgdG8gVlRELCBTTU1VdjMgaGFzIG5v
ICJDYWNoaW5nIE1vZGUiDQo+ID4+IHdoaWNoIGFsbG93cyBlYXN5IHRyYXBwaW5nIG9mIGd1ZXN0
IG1hcHBpbmdzLg0KPiA+PiBUaGlzIG1lYW5zIHRoZSB2U01NVVYzIGNhbm5vdCB1c2UgdGhlIHNh
bWUgVkZJTyBpbnRlZ3JhdGlvbiBhcyBWVEQuDQo+ID4+DQo+ID4+IEhvd2V2ZXIgU01NVXYzIGhh
cyAyIHRyYW5zbGF0aW9uIHN0YWdlcy4gVGhpcyB3YXMgZGV2aXNlZCB3aXRoDQo+ID4+IHZpcnR1
YWxpemF0aW9uIHVzZSBjYXNlIGluIG1pbmQgd2hlcmUgc3RhZ2UgMSBpcyAib3duZWQiIGJ5IHRo
ZSBndWVzdA0KPiA+PiB3aGVyZWFzIHRoZSBob3N0IHVzZXMgc3RhZ2UgMiBmb3IgVk0gaXNvbGF0
aW9uLg0KPiA+Pg0KPiA+PiBUaGlzIHNlcmllcyBzZXRzIHVwIHRoaXMgbmVzdGVkIHRyYW5zbGF0
aW9uIHN0YWdlLiBJdCBvbmx5IHdvcmtzIGlmDQo+ID4+IHRoZXJlIGlzIG9uZSBwaHlzaWNhbCBT
TU1VdjMgdXNlZCBhbG9uZyB3aXRoIFFFTVUgdlNNTVV2MyAoaW4gb3RoZXINCj4gPj4gd29yZHMs
IGl0IGRvZXMgbm90IHdvcmsgaWYgdGhlcmUgaXMgYSBwaHlzaWNhbCBTTU1VdjIpLg0KPiA+Pg0K
PiA+PiBUaGUgc2VyaWVzIHVzZXMgYSBuZXcga2VybmVsIHVzZXIgQVBJIFsxXSwgc3RpbGwgdW5k
ZXIgZGVmaW5pdGlvbi4NCj4gPj4NCj4gPj4gLSBXZSBmb3JjZSB0aGUgaG9zdCB0byB1c2Ugc3Rh
Z2UgMiBpbnN0ZWFkIG9mIHN0YWdlIDEsIHdoZW4gd2UNCj4gPj4gICBkZXRlY3QgYSB2U01NVVYz
IGlzIGJlaGluZCBhIFZGSU8gZGV2aWNlLiBGb3IgYSBWRklPIGRldmljZQ0KPiA+PiAgIHdpdGhv
dXQgYW55IHZpcnR1YWwgSU9NTVUsIHdlIHN0aWxsIHVzZSBzdGFnZSAxIGFzIG1hbnkgZXhpc3Rp
bmcNCj4gPj4gICBTTU1VcyBleHBlY3QgdGhpcyBiZWhhdmlvci4NCj4gPj4gLSBXZSBpbnRyb2R1
Y2UgbmV3IElPVExCICJjb25maWciIG5vdGlmaWVycywgcmVxdWVzdGVkIHRvIG5vdGlmeQ0KPiA+
PiAgIGNoYW5nZXMgaW4gdGhlIGNvbmZpZyBvZiBhIGdpdmVuIGlvbW11IG1lbW9yeSByZWdpb24u
IFNvIG5vdw0KPiA+PiAgIHdlIGhhdmUgbm90aWZpZXJzIGZvciBJT1RMQiBjaGFuZ2VzIGFuZCBj
b25maWcgY2hhbmdlcy4NCj4gPj4gLSB2U01NVXYzIGNhbGxzIGNvbmZpZyBub3RpZmllcnMgd2hl
biBTVEUgKFN0cmVhbSBUYWJsZSBFbnRyaWVzKQ0KPiA+PiAgIGFyZSB1cGRhdGVkIGJ5IHRoZSBn
dWVzdC4NCj4gPj4gLSBXZSBpbXBsZW1lbnQgYSBzcGVjaWZpYyBVTk1BUCBub3RpZmllciB0aGF0
IGNvbnZleXMgZ3Vlc3QNCj4gPj4gICBJT1RMQiBpbnZhbGlkYXRpb25zIHRvIHRoZSBob3N0DQo+
ID4+IC0gV2UgaW1wbGVtZW50IGEgbmV3IE1BUCBub3RpZmllcnMgb25seSB1c2VkIGZvciBNU0kg
SU9WQXMgc28NCj4gPj4gICB0aGF0IHRoZSBob3N0IGNhbiBidWlsZCBhIG5lc3RlZCBzdGFnZSB0
cmFuc2xhdGlvbiBmb3IgTVNJIElPVkFzDQo+ID4+IC0gQXMgdGhlIGxlZ2FjeSBNQVAgbm90aWZp
ZXIgaXMgbm90IGNhbGxlZCBhbnltb3JlLCB3ZSBtdXN0IG1ha2UNCj4gPj4gICBzdXJlIHN0YWdl
IDIgbWFwcGluZ3MgYXJlIHNldC4gVGhpcyBpcyBhY2hpZXZlZCB0aHJvdWdoIGFub3RoZXINCj4g
Pj4gICBtZW1vcnkgbGlzdGVuZXIuDQo+ID4+IC0gUGh5c2ljYWwgU01NVXMgZmF1bHRzIGFyZSBy
ZXBvcnRlZCB0byB0aGUgZ3Vlc3QgdmlhIGVuIGV2ZW50ZmQNCj4gPj4gICBtZWNoYW5pc20gYW5k
IHJlaW5qZWN0ZWQgaW50byB0aGlzIGxhdHRlci4NCj4gPj4NCj4gPj4gTm90ZTogc29tZSBpb21t
dSBtZW1vcnkgbm90aWZpZXIgcmV3b3JrIHJlbGF0ZWQgcGF0Y2hlcyBhcmUgY2xvc2UgdG8NCj4g
Pj4gdGhvc2UgcHJldmlvdXNseSBwdWJsaXNoZWQgYnkgUGV0ZXIgYW5kIExpdS4gSSB3aWxsIGJl
IHBsZWFzZWQgdG8gYWRkDQo+ID4+IHRoZWlyIFNpZ25lZC1vZmYtYnkgaWYgdGhleSBhZ3JlZS93
aXNoLg0KPiA+DQo+ID4gWWVhaCwgZmVlbCBmcmVlIHRvIGFkZCBtaW5lIGlmIGl0J3Mgb3JpZ2lu
YXRlZCBmcm9tIG91ciBwcmV2aW91cyB3b3JrLg0KPiBPSw0KPiA+DQo+ID4gQlRXLiBDdXJpb3Vz
bHksIGFyZSB5b3UgcGxhbm5pbmcgdG8gaW1wbGVtZW50IGFsbCB2SU9NTVUgcmVsYXRlZA0KPiA+
IG9wZXJhdGlvbnMgdGhyb3VnaCBNZW1vcnlSZWdpb24gbm90aWZpZXJzPyBIb25lc3RseSwgSSBk
aWQgaXQgaW4gc3VjaA0KPiA+IHdheSBpbiBlYXJseSBSRkMgZm9yIHZTVkEgd29yay4gSG93ZXZl
ciwgd2UgZW5jb3VudGVyZWQgdHdvIGlzc3VlcyBhdA0KPiA+IHRoYXQgdGltZS4gRmlyc3QsIGhv
dyB0byBjaGVjayB3aGV0aGVyIHRoZSBub3RpZmllciBzaG91bGQgYmUgcmVnaXN0ZXJlZC4NCj4g
T24gbXkgc2lkZSBJIHRoaW5rIEkgcmVzb2x2ZWQgdGhpcyBieSBxdWVyeWluZyB0aGUgaW9tbXUg
bXIgYWJvdXQgdGhlIG5ldw0KPiBJT01NVV9BVFRSX1ZGSU9fTkVTVEVEIElPTU1VIGF0dHJpYnV0
ZSAgaW4gdmZpb19jb25uZWN0X2NvbnRhaW5lcg0KDQpTbyBpdCdzIHRvIGRldGVjdCBpdCBieSBj
aGVja2luZyBpb21tdSBtcj8gSSB0aGluayBpdCBpcyBhbHNvIHNpbWlsYXIgdG8gbXkgZWFybHkN
ClJGQy4NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTcwMTAwMy8NCg0KKyAg
ICAvKiBDaGVjayBpZiB2SU9NTVUgZXhpc3RzICovDQorICAgIFFUQUlMUV9GT1JFQUNIKHN1YnJl
Z2lvbiwgJmFzLT5yb290LT5zdWJyZWdpb25zLCBzdWJyZWdpb25zX2xpbmspIHsNCisgICAgICAg
IGlmIChtZW1vcnlfcmVnaW9uX2lzX2lvbW11KHN1YnJlZ2lvbikpIHsNCisgICAgICAgICAgICBJ
T01NVU5vdGlmaWVyIG4xOw0KKw0KKyAgICAgICAgICAgIC8qDQorICAgICAgICAgICAgIEZJWE1F
OiBjdXJyZW50IGlvbW11IG5vdGlmaWVyIGlzIGFjdHVhbGx5IGRlc2lnbmVkIGZvcg0KKyAgICAg
ICAgICAgICBJT01NVVRMQiBNQVAvVU5NQVAuIEhvd2V2ZXIsIHZJT01NVSBlbXVsYXRvciBtYXkg
bmVlZA0KKyAgICAgICAgICAgICBub3RpZmllcnMgb3RoZXIgdGhhbiBNQVAvVU5NQVAsIHNvIGl0
J2xsIGJlIGJldHRlciB0bw0KKyAgICAgICAgICAgICBzcGxpdCB0aGUgbm9uLUlPTU1VVExCIG5v
dGlmaWVyIGZyb20gdGhlIGN1cnJlbnQgSU9NTVVUTEINCisgICAgICAgICAgICAgbm90aWZpZXIg
ZnJhbWV3cm9rLg0KKyAgICAgICAgICAgICAqLw0KKyAgICAgICAgICAgIGlvbW11X25vdGlmaWVy
X2luaXQoJm4xLCB2ZmlvX2lvbW11X2JpbmRfcGFzaWRfdGJsX25vdGlmeSwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIElPTU1VX05PVElGSUVSX1NWTV9QQVNJRFRfQklORCwNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAwKTsNCisgICAgICAgICAgICB2ZmlvX3JlZ2lzdGVyX25vdGlmaWVyKGdyb3Vw
LT5jb250YWluZXIsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJyZWdp
b24sDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJm4xKTsNCisgICAgICAgIH0NCisgICAgfQ0KDQpGb3Ig
VlQtZCwgd2Ugb25seSBoYXZlIDEgaW9tbXUgbXIuIEJ1dCBJIHdhcyB0b2xkIHRoZXIgbWF5IGJl
IG11bHRpcGxlIGlvbW11IG1yDQpvbiBvdGhlciBwbGF0Zm9ybS4gU28gSSBzd2l0Y2hlZCB0byB1
c2UgUENJU1ZBT3BzLiBUaG91Z2h0cz8NCg0KPiBTZWUgcGF0Y2hlcyA1IGFuZCA2LCA4DQo+IA0K
PiBUaGlzIHRlbGxzIG1lIHdoZXRoZXIgdGhlIG5lc3RlZCBtb2RlIG11c3QgYmUgc2V0dXAgYW5k
IGNob29zZSB0aGUgcmlnaHQNCj4gY29udGFpbmVyLT5pb21tdV90eXBlIHdoaWNoIGlzIHRoZW4g
dXNlZCBpbiB2ZmlvX2xpc3RlbmVyX3JlZ2lvbl9hZGQoKQ0KPiB0byBkZWNpZGUgd2hldGhlciB0
aGUgc3BlY2lmaWMgbm90aWZpZXJzIG11c3RkIHRvIGJlIHJlZ2lzdGVyZWQuDQo+IA0KPiA+IFNl
Y29uZCwgdGhlcmUgYXJlIGNhc2VzIGluIHdoaWNoIHRoZSB2ZmlvX2xpc3RlbmVyX3JlZ2lvbl9h
ZGQgaXMgbm90DQo+ID4gdHJpZ2dlcmVkIGJ1dCB2SU9NTVUgZXhpc3RzLiBEZXRhaWxzIGNhbiBi
ZSBnb3QgYnkgdGhlIGxpbmsgYmVsb3c6DQo+ID4gKGh0dHA6Ly9saXN0cy5nbnUub3JnL2FyY2hp
dmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMDMvbXNnMDAwNzguaHRtbCkNCj4gDQo+IFllcyBJIHJl
bWVtYmVyIHRoaXMsIGR1ZSB0byB0aGUgUFQ9MSBjYXNlLiBPbiBBUk0gd2UgZG9uJ3QgaGF2ZSB0
aGlzIHNwZWNpZmljaXR5DQo+IGhlbmNlIHRoaXMgaW50ZWdyYXRpb24uDQo+ID4NCj4gPiBBcyB0
aHVzLCB3ZSBoYWQgc29tZSBkaXNjdXNzaW9ucyBpbiBjb21tdW5pdHkuIExhc3QgdGltZSwgUENJ
UEFTSURPcHMNCj4gPiB3YXMgcHJvcG9zZWQuIEl0IGlzIHRvIGFkZCBjYWxsYmFja3MgaW4gUENJ
RGV2aWNlLiBWRklPIHdvdWxkIHJlZ2lzdGVyDQo+ID4gaXRzIGltcGxlbWVudGF0aW9ucyBpbiB2
ZmlvX3JlYWxpemUoKS4gU3VwcG9zZWRseSwgcGFzaWRfdGFibGVfYmluZCwNCj4gPiBwYWdlX3Rh
YmxlX2JpbmQsIHN2YV90bGJfaW52YWxpZGF0aW9uX3Bhc3Nkb3duIGFuZCBvdGhlciB2SU9NTVUN
Cj4gPiByZWxhdGVkIG9wZXJhdGlvbnMgY2FuIGJlIGRvbmUgaW4gc3VjaCB3YXkuIFRoZSBzYW1w
bGUgcGF0Y2ggYmVsb3cgbWF5DQo+ID4gc2hvdyBob3cgaXQgbG9va3MgbGlrZS4gKHRoZSBmdWxs
IHBhdGNoIGlzIGluIG15IHNhbmRib3gsIHBsYW5uZWQgdG8NCj4gPiBzZW5kIG91dCB3aXRoIFNj
YWxhYmxlIE1vZGUgZW11bGF0aW9uIHBhdGNoKS4NCj4gDQo+IFRvIGJlIGhvbmVzdCwgSSBsb3N0
IHRyYWNrIG9mIHRoZSBzZXJpZXMgYW5kIGRpZCBub3Qgc2VlIHRoaXMgUENJUEFTSURPcHMgcHJv
cG9zYWwuIEkNCj4gd2lsbCBzdHVkeSB3aGV0aGVyIHRoaXMgY2FuIGZpdCBteSBuZWVkcy4NCg0K
SXQncyBwcm9wb3NlZCBpbiBiZWxvdyBsaW5rLiBUaGUgbmFtZSBhdCB0aGF0IHRpbWUgaXMgUENJ
U1ZBT3BzLiBJIG1hZGUgaXQgdG8gYmUNClBDSVBBU0lET3BzIHRvIGJlIG1vcmUgZ2VuZXJpYy4N
Cg0KaHR0cDovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAxOC0wMy9t
c2cwMDA4MS5odG1sDQoNClJlZ2FyZHMsDQpZaSBMaXUNCg==
