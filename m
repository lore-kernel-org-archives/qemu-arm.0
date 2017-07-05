Received: by 10.25.44.15 with SMTP id s15csp399794lfs;
        Wed, 5 Jul 2017 00:46:29 -0700 (PDT)
X-Received: by 10.55.131.129 with SMTP id f123mr32894240qkd.188.1499240789815;
        Wed, 05 Jul 2017 00:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499240789; cv=none;
        d=google.com; s=arc-20160816;
        b=iC2XbT8kbp8U2r7yUljzTtA4Mtox1XKqlSVzZKGZFDrObUaOgjg6slActiiRRd2mB8
         E06ErQFj3M7cCIKXxWK4rNf0VwOHsKfC5BaXY1OgIX88jfsCpU6HuGMsbwaeCaaBofQM
         VZ/3eEaEn8h3tDq0l0AbXn28pKEZlckchLWUyO2h94ikrQOkmT1xboG7fjw4FgjnNyzL
         W/pl5jM1lVpff/hwA7FUAVJxVszCiZ18zNqh9QbcvYBXzM+tX7kYJoIUEgnyOPqeqmTM
         1pzfRWqHvKzZKTHYC9+VcRQzMhCYbeaBOOY3ttQEdDt8/TKa+QdLQjI+CYAFVtlHoxDE
         yW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=W1imoJ9ZqA1B5eF5absD+x0feRi90PTIbxrEIiY4QLA=;
        b=GONitXUe5qMmtKMgyRB2obFFvJ5lasN3qnY1wtK8djmYxH0apw+3bJAgIc5Uuc66vl
         YP6/H6auXSPgoyj8gaJ2ctj/tXiv5TDF8NnwQU9LeM8lOjJZrpWeqKosgsNgdCinxKkr
         FROk7wX7il+H5FiVqNydphVF1qLNgkasHZ++w0iF1HkuokgaWuBiGA4ZoRLnLpgp+ZlO
         5X5qnr5TdnMwSOh3At7fTWAwXv4yVYF6pdb3G348ini7viLJMNeF4t+Y56QZI+z4a2D+
         ONa8DwzD21+2itEHfc0dL+Mo0hbkGxX9GAg1uxBIsDGqt13jzDvBXKwQ5MZnVWWH/teP
         Y4hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si20023622qkk.236.2017.07.05.00.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 00:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSf11-0000ZK-9g
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 03:46:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dSeh6-0006RC-M0
	for qemu-devel@nongnu.org; Wed, 05 Jul 2017 03:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dSeh1-0003lW-MX
	for qemu-devel@nongnu.org; Wed, 05 Jul 2017 03:25:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:25082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dSeh1-0003l5-BJ; Wed, 05 Jul 2017 03:25:47 -0400
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 00:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,310,1496127600"; d="scan'208";a="874883637"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jul 2017 00:25:45 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 5 Jul 2017 00:25:45 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX104.ccr.corp.intel.com ([10.239.4.70]) with mapi id
	14.03.0319.002; Wed, 5 Jul 2017 15:25:43 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Auger Eric
	<eric.auger@redhat.com>, Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCAACd4AIAK4J+AgACDrQCADhSKMA==
Date: Wed, 5 Jul 2017 07:25:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D25B77@SHSMSX101.ccr.corp.intel.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
	<d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
In-Reply-To: <d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTljMGM2ZDQtM2E2Ni00Y2FhLWI2NDctMmI1MjZjZDAyNDZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImZQYiswc0pDdmN3c2tMOUFKNE5pVmRRTmhQZzVPUTdVQ3ZuQVhSeG9Lb0E9In0=
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
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
X-TUID: AFnoyIm+7STX

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgW21haWx0bzpqZWFuLXBoaWxpcHBlLmJydWNr
ZXJAYXJtLmNvbV0NCj4gU2VudDogVHVlc2RheSwgSnVuZSAyNywgMjAxNyAxMjoxMyBBTQ0KPiAN
Cj4gT24gMjYvMDYvMTcgMDk6MjIsIEF1Z2VyIEVyaWMgd3JvdGU6DQo+ID4gSGkgSmVhbi1QaGls
aXBwZSwNCj4gPg0KPiA+IE9uIDE5LzA2LzIwMTcgMTI6MTUsIEplYW4tUGhpbGlwcGUgQnJ1Y2tl
ciB3cm90ZToNCj4gPj4gT24gMTkvMDYvMTcgMDg6NTQsIEJoYXJhdCBCaHVzaGFuIHdyb3RlOg0K
PiA+Pj4gSGkgRXJpYywNCj4gPj4+DQo+ID4+PiBJIHN0YXJ0ZWQgYWRkZWQgcmVwbGF5IGluIHZp
cnRpby1pb21tdSBhbmQgY2FtZSBhY3Jvc3MgaG93IE1TSQ0KPiBpbnRlcnJ1cHRzIHdpdGggd29y
ayB3aXRoIFZGSU8uDQo+ID4+PiBJIHVuZGVyc3RhbmQgdGhhdCBvbiBpbnRlbCB0aGlzIHdvcmtz
IGRpZmZlcmVudGx5IGJ1dCB2c21tdSB3aWxsIGhhdmUNCj4gc2FtZSByZXF1aXJlbWVudC4NCj4g
Pj4+IGt2bS1tc2ktaXJxLXJvdXRlIGFyZSBhZGRlZCB1c2luZyB0aGUgbXNpLWFkZHJlc3MgdG8g
YmUgdHJhbnNsYXRlZCBieQ0KPiB2aW9tbXUgYW5kIG5vdCB0aGUgZmluYWwgdHJhbnNsYXRlZCBh
ZGRyZXNzLg0KPiA+Pj4gV2hpbGUgY3VycmVudGx5IHRoZSBpcnFmZCBmcmFtZXdvcmsgZG9lcyBu
b3Qga25vdyBhYm91dCBlbXVsYXRlZA0KPiBpb21tdXMgKHZpcnRpby1pb21tdSwgdnNtbXV2My92
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
IHRyYW5zbGF0aW9uLg0KPiA+DQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhlICJuZXN0
ZWQgdHJhbnNsYXRpb24gbW9kZSIgdGVybWlub2xvZ3kuIERvDQo+ID4geW91IG1lYW4gaW4gdGhh
dCBjYXNlIHlvdSB1c2Ugc3RhZ2UgMSArIHN0YWdlIDIgb2YgdGhlIHBoeXNpY2FsIElPTU1VDQo+
ID4gKHdoaWNoIHRoZSBBUk0gc3BlYyBub3JtYWxseSBhZHZpc2VzIG9yIHdhcyBtZWFudCBmb3Ip
IG9yIGRvIHlvdSBtZWFuDQo+ID4gc3RhZ2UgMSBpbXBsZW1lbnRlZCBpbiB2SU9NTVUgYW5kIHN0
YWdlIDIgaW1wbGVtZW50ZWQgaW4gcElPTU1VLiBBdA0KPiB0aGUNCj4gPiBtb21lbnQgbXkgdW5k
ZXJzdGFuZGluZyBpcyBmb3IgVkZJTyBpbnRlZ3JhdGlvbiB0aGUgcElPTU1VIHVzZXMgYQ0KPiBz
aW5nbGUNCj4gPiBzdGFnZSBjb21iaW5pbmcgYm90aCB0aGUgc3RhZ2UgMSBhbmQgc3RhZ2UyIG1h
cHBpbmdzIGJ1dCB0aGUgaG9zdCBpcyBub3QNCj4gPiBhd2FyZSBvZiB0aG9zZSAyIHN0YWdlcy4N
Cj4gDQo+IFllcyBhdCB0aGUgbW9tZW50IHRoZSBWTU0gbWVyZ2VzIHN0YWdlLTEgKEdWQS0+R1BB
KSBmcm9tIHRoZSBndWVzdCB3aXRoDQo+IGl0cyBzdGFnZS0yIG1hcHBpbmdzIChHUEEtPkhQQSkg
YW5kIGNyZWF0ZXMgYSBzdGFnZS0yIG1hcHBpbmcgKEdWQS0+SFBBKQ0KPiBpbiB0aGUgcElPTU1V
IHZpYSBWRklPX0lPTU1VX01BUF9ETUEuIHN0YWdlLTEgaXMgZGlzYWJsZWQgaW4gdGhlDQo+IHBJ
T01NVS4NCj4gDQoNCkN1cmlvdXMgd2hldGhlciB5b3UgYXJlIGRlc2NyaWJpbmcgY3VycmVudCBz
bW11IHN0YXR1cyBvciBnZW5lcmFsDQp2SU9NTVUgc3RhdHVzIGFsc28gYXBwbHlpbmcgdG8gb3Ro
ZXIgdmVuZG9ycy4uLg0KDQp0aGUgdXNhZ2Ugd2hhdCB5b3UgZGVzY3JpYmVkIGlzIGFib3V0IHN2
bSwgd2hpbGUgc3ZtIHJlcXVpcmVzIFBBU0lELg0KQXQgbGVhc3QgUEFTSUQgaXMgdGllZCB0byBz
dGFnZS0xIG9uIEludGVsIFZULWQuIE9ubHkgRE1BIHcvbyBQQVNJRA0Kb3IgbmVzdGVkIHRyYW5z
bGF0aW9uIGZyb20gc3RhZ2UtMSB3aWxsIGdvIHRocm91Z2ggc3RhZ2UtMi4gVW5sZXNzDQpBUk0g
c21tdSBoYXMgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiwgSSdtIG5vdCBz
dXJlDQpob3cgc3ZtIGNhbiBiZSB2aXJ0dWFsaXplZCB3LyBzdGFnZS0xIHRyYW5zbGF0aW9uIGRp
c2FibGVkLiBUaGVyZQ0KYXJlIG11bHRpcGxlIHN0YWdlLTEgcGFnZSB0YWJsZXMgd2hpbGUgb25s
eSBvbmUgc3RhZ2UtMiBwYWdlIHRhYmxlIHBlcg0KZGV2aWNlLiBDb3VsZCBtZXJnaW5nIGFjdHVh
bGx5IHdvcmsgaGVyZT8NCg0KVGhlIG9ubHkgY2FzZSB3aXRoIG1lcmdpbmcgaGFwcGVuIHRvZGF5
IGlzIGZvciBndWVzdCBzdGFnZS0yIHVzYWdlDQpvciBzby1jYWxsZWQgR0lPVkEgdXNhZ2UuIEd1
ZXN0IHByb2dyYW1zIEdJT1ZBLT5HUEEgdG8gdklPTU1VIA0Kc3RhZ2UtMi4gVGhlbiB2SU9NTVUg
aW52b2tlcyB2ZmlvIG1hcC91bm1hcCBBUElzIHRvIHRyYW5zbGF0ZS8NCm1lcmdlIHRvIEdJT1ZB
LT5IUEEgdG8gcElPTU1VIHN0YWdlLTIuIE1heWJlIHdoYXQgeW91DQphY3R1YWxseSBtZWFudCBp
cyB0aGlzIG9uZT8NCg0KVGhhbmtzDQpLZXZpbg0K
