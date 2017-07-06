Received: by 10.25.44.15 with SMTP id s15csp2650272lfs;
        Thu, 6 Jul 2017 16:34:17 -0700 (PDT)
X-Received: by 10.200.4.7 with SMTP id v7mr60253894qtg.166.1499384057315;
        Thu, 06 Jul 2017 16:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499384057; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1AeFUtT+FeifunVqk04mhDvLXlXeIdAkTcIuEkQd3gQu7Ok0vpuru/bIHeuL53cud
         RF0I5a9vWFHNdPcqzX3blJEegXuPCpyZXhbvveuS3vn/tqv0giBWALqfkX7aGLcNN0Ih
         qiW44JAZR28LkrYJ6IyMplStHk3Dsq2Ut3nsCO6zZFlSueW9/hnsmVjFqHQnTcblPs4s
         D7BZ3EESaqewMdPqhUWgQfcRnv/7vwS6qwz7sDoSW6HHdzxKQbpvwRiKDd6JaN/Z+TBT
         INVMhtCMjGs1ZLQP46lPvadoLiJJfDiRIoYQZ/lK8FWvFWQxxHnQ9TSgyJVhkOHbF3L0
         s6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:arc-authentication-results;
        bh=apQVH0R9HJaxq+Est8ZHKJYWGO1qewXbZK6/5ZPQWZc=;
        b=t7TMSO+HgFg/AnOutuRZ3I5QkLS28IdAwKD78X7baqga2cPDbkeb18EQrpwKLNoy1r
         c5vhAp6uK1Ww1KNOSep0Qb6RUndHOfE9CNWuNvv3DTrewNKh+vapD5D8+6fG7G6qdKIJ
         AcEnMHIpzSVSuiLYdx58a+LXWFlaCRQzHGN1WTqNB1AygDQV25qdrnHwInPdasWi0pJd
         fwL++P4CphAb85k88Q8kHul/8ZozqMrVD294FYx79Yge/exmccZFVX/MGAvOmXQzQrsy
         UjdkRgOUo4c1DkH2qFlichlRjH8RP5qMT34/0xxGTHIIolvDHEkd7u8juI0RW+cFAblv
         vMlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e125si1471455qkc.352.2017.07.06.16.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 16:34:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTGHm-0006UC-OL
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 19:34:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dTGHh-0006TL-0F
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.tian@intel.com>) id 1dTGHd-00062M-TQ
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:34:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:2270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kevin.tian@intel.com>)
	id 1dTGHd-0005zq-JZ; Thu, 06 Jul 2017 19:34:05 -0400
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 06 Jul 2017 16:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,319,1496127600"; d="scan'208";a="108174283"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2017 16:33:55 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 6 Jul 2017 16:33:10 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
	FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 6 Jul 2017 16:33:10 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.197]) by
	SHSMSX103.ccr.corp.intel.com ([169.254.4.116]) with mapi id
	14.03.0319.002; Fri, 7 Jul 2017 07:33:08 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Kalra, Ashish" <Ashish.Kalra@cavium.com>, Auger Eric
	<eric.auger@redhat.com>, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36do183zMA3/M0Kso3taEJsBQaIbilEAgAAHrwCAAFArAIAABoaAgA90XgCACwBtgIAOLRaAgAAFuwCAAAGSgIABpsiAgAAWqYCAAKWXgIAAI3yAgACHM5A=
Date: Thu, 6 Jul 2017 23:33:07 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190D28807@SHSMSX101.ccr.corp.intel.com>
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
	<BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
In-Reply-To: <BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmFhOTlhNzUtYjEyZC00ZjVjLWFjNmQtMzc5NWU4ZDIxMTUxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjI2NER4Qm01cDNDbkNXV3k0bmJVWCtITmFUK3dIOVdPMVJUVGMwZWo1OTg9In0=
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
X-TUID: 9/ObJcGmbcli

PiBGcm9tOiBLYWxyYSwgQXNoaXNoIFttYWlsdG86QXNoaXNoLkthbHJhQGNhdml1bS5jb21dDQo+
IFNlbnQ6IEZyaWRheSwgSnVseSA3LCAyMDE3IDc6MjQgQU0NCj4gDQo+IEkgaGF2ZSBhIGdlbmVy
aWMgcXVlc3Rpb24gb24gdklPTU1VIHN1cHBvcnQsIGlzIHRoZXJlIGFueSBwcm9wb3NhbC9wbGFu
IHRvDQo+IGFkZCBBVFMvUFJJIGV4dGVuc2lvbiBzdXBwb3J0IHRvIHZJT01NVXMgYW5kIGFsbG93
DQo+IGhhbmRsaW5nIGZvciBlbmQgdG8gZW5kICh2KUlPTU1VIFBhZ2UgZmF1bHRzICh3L3QgdGhl
IGRldmljZSBzaWRlDQo+IGltcGxlbWVudGF0aW9uIG9uIFZob3N0KSA/DQo+IA0KPiBBZ2Fpbiwg
dGhlIG1vdGl2YXRpb24gd2lsbCBiZSB0byBkbyBETUEgb24gcGFnZWQgZ3Vlc3QgbWVtb3J5IGFu
ZA0KPiBwb3RlbnRpYWxseSBhdm9pZGluZyB0aGUgcmVxdWlyZW1lbnQgb2YgcGlubmVkL2xvY2tl
ZA0KPiBndWVzdCBwaHlzaWNhbCBtZW1vcnkgZm9yIERNQS4NCg0KeWVzLCB0aGF0J3MgYSBuZWNl
c3NhcnkgcGFydCB0byBzdXBwb3J0IFNWTSBpbiBib3RoIHZpcnRpby1pb21tdSANCmFwcHJvYWNo
IGFuZCBmdWxseSBlbXVsYXRlZCBhcHByb2FjaCAoZS5nLiBmb3IgSW50ZWwgVlRkKS4gVGhlcmUN
CmFyZSBhbHJlYWR5IHBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGluIG90aGVyIHRocmVhZCBhYm91
dCBob3cgdG8NCnByb3BhZ2F0ZSBJT01NVSBwYWdlIGZhdWx0IHRvIHZJT01NVS4gVGhlbiBhZnRl
ciBpdCBpcyBkb25lDQp2SU9NTVUgcGFnZSBmYXVsdCBlbXVsYXRpb24gd2lsbCBiZSBmdXJ0aGVy
IGFkZGVkLg0KDQpodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNy82LzI3Lzk2NA0KDQpUaGFua3MN
CktldmluDQo=
