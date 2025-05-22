Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1854444njc;
        Thu, 22 May 2025 06:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULMFEB/t61s3CaW6bUt9pwITrRf0wPwxR58GGeREBLZBfomTFHU45mGgg53qOMf+535MritHPVMVR82Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHEQx7Oi7Xkspk2hIsTkm8NpOPSlNSjSRk4Oyp8gNGvGBtwR4haRG+JjJXvyDDRZ4Ar+C1u
X-Received: by 2002:a05:6000:2585:b0:3a3:6c32:7806 with SMTP id ffacd0b85a97d-3a36c3279b1mr17141657f8f.49.1747920275223;
        Thu, 22 May 2025 06:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747920275; cv=none;
        d=google.com; s=arc-20240605;
        b=fl2a7GreK0XfMjfBRcDRL+aT+OzcTAom+msxlZ9+60p8ok9oOSHkkSULD/L2hleJjA
         OTVQmctJfI7aA54gxEB3uw8BhfPuOGZDtHJEErt8YVEsYqz7ughsZDRy8EAwsC4w0G/M
         +uYhCfnkCmljskzqhhpKUc8i5To+jvjDHhgg8Gk9VpQ+RoTkWtLOlPaJ805l+ErD4Hv2
         ymDoDmoBfh8Xx9uJ2mtdpHDLQlQQzG+nOVKbQ8m4t/ldKfAV5D0mDpk5X1CaJfg6oVwa
         6h8KurQzyKKfv5Uu7u8eOGOA5GjPZmSzTSqU+ySyhOvmPUkyzegSomHD1MEBCdw+SY9Q
         zpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=BEZy4ZI8NNflthcR4t2pZdkuPLc5MqHS548JPAZREtM=;
        fh=EBEB4lLIOos0e8dn5KZH1m/lkdhNcSlN2+Q33OUDhGU=;
        b=MhnSsiFmu9OvOjhVc8xpOdLbea+/zFw8VIPw7vNeFJE10Zx5sqs5W6G9kp8Gg1elZr
         5/z6suA8SBATPvNw2ywsdLhmA1s/n2UQHXS0v77I2wzx16s+Y+iY1LSG7UIucPAFczki
         pkYQwLhBppkz58UBODuhuA0hM/lMfk31AvHJxW4T27986HKH5OFA9psmKgUaRzEN7zrA
         SHMB0Lhf1B0g3iZHC27klbxkzQ26VLQ3N51Jc5oHnhxBp72Pxqu3NeYr9BpK0ODdMX6s
         1ARLSQUmwHlhTAu/iu+PhP6HOkLO/rl5VVSOq1hwo2X84d5CGBZMd324KgpNoYzuafSs
         Aexg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a35ca7f66dsi11527655f8f.346.2025.05.22.06.24.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 May 2025 06:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b385m5r9bz6M4gs;
	Thu, 22 May 2025 21:19:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BF8FF1402EE;
	Thu, 22 May 2025 21:24:33 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 May 2025 15:24:33 +0200
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Thu, 22 May 2025 15:24:33 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, Gustavo Romero <gustavo.romero@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Igor Mammedov <imammedo@redhat.com>, "Eric
 Auger" <eauger@redhat.com>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"peterx@redhat.com" <peterx@redhat.com>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH RFC V5 00/30] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Topic: [PATCH RFC V5 00/30] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Index: AQHbyeZ/exOrsEEeSkGHg/Tv58YKarPdDqmAgACTRACAAP7B4A==
Date: Thu, 22 May 2025 13:24:33 +0000
Message-ID: <67025b22e4864caaa5b3dd19eb6d95ac@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
	<b65590b1-8a6f-43e5-b367-732d6305c095@redhat.com>
	<429a8131-2b59-4800-891b-bcfbc6e44737@linaro.org>
 <0d1208fa-9fca-4b4b-bad0-8b596d5102fb@redhat.com>
In-Reply-To: <0d1208fa-9fca-4b4b-bad0-8b596d5102fb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.47.75.110]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: +m67rDilzyeM

SEkgR2F2aW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2F2aW4g
U2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1heSAyMiwgMjAyNSAx
Mjo1NCBBTQ0KPiBUbzogR3VzdGF2byBSb21lcm8gPGd1c3Rhdm8ucm9tZXJvQGxpbmFyby5vcmc+
OyBTYWxpbCBNZWh0YQ0KPiA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZzsgcWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7IG1zdEByZWRoYXQuY29tOyBKb25hdGhh
biBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBJZ29yIE1hbW1lZG92
DQo+IDxpbWFtbWVkb0ByZWRoYXQuY29tPjsgRXJpYyBBdWdlciA8ZWF1Z2VyQHJlZGhhdC5jb20+
DQoNClsuLl0NCg0KPiANCj4gSGkgR3VzdGF2byBhbmQgU2FsaWwsDQo+IA0KPiBPbiA1LzIyLzI1
IDE6MDYgQU0sIEd1c3Rhdm8gUm9tZXJvIHdyb3RlOg0KPiA+IEhpIFNhbGlsLCBHYXZpbiwgYW5k
IGZvbGtzLA0KPiA+DQo+ID4gT24gNS8yMC8yNSAyMToyMiwgR2F2aW4gU2hhbiB3cm90ZToNCj4g
Pj4gSGkgU2FsaWwsDQo+ID4+DQo+ID4+IEEga2luZGx5IHBpbmcuIHZDUFUgaG90cGx1ZyBpcyBh
biBpbXBvcnRhbnQgZmVhdHVyZSBhbmQgWW91IGhhcyBwdXQNCj4gPj4gc28gbXVjaCBlbmVyZ2ll
cyBhbmQgYW1hemluZyBlZmZvcnRzIHRvIGVuYWJsZSB0aGUgZmVhdHVyZSBmcm9tIFFFTVUNCj4g
Pj4gc2lkZSwgYnV0IGl0IHNlZW1zIGl0IGhhcyBiZWVuIHN0dWNrIHJlY2VudGx5LiBJIHJlY2Vp
dmVkIG1hbnkNCj4gPj4gbWVzc2FnZXMgZnJvbSBSZWRoYXQgaW50ZXJuYWwgYW5kIGV4dGVybmFs
IHRvIGFzayBpZiB2Q1BVIGhvdHBsdWcgaGFzDQo+ID4+IGJlZW4gc3VwcG9ydGVkIG9uIGFhcmNo
NjQgaW4gdGhlIHBhc3QuIFNvIEknbSBoZWFkaW5nIHVwIHRvIGNoZWNrIGlmDQo+ID4+IHlvdSBo
YXZlIGJhbmR3aWR0aCB0byBjb250aW51ZSB0aGUgZWZmb3J0LCBhbnkga2luZHMgb2YgaGVscHMg
YXJlDQo+IG5lZWRlZCwgZXNwZWNpYWxseSBmcm9tIG1lLg0KPiA+DQo+ID4gWW91IGNhbiBjb3Vu
dCBvbiBtZSBhcyB3ZWxsLCBTYWxpbC4gSSdtIGRlZmluaXRlbHkgaW4gYSBiZXR0ZXINCj4gPiBw
b3NpdGlvbiBub3cgdG8gaGVscCB5b3Ugd2l0aCB0aGUgdGVjaG5pY2FsIHJldmlldyBvZiB0aGUg
c2VyaWVzLCBhbmQNCj4gPiBJIGNhbiBhbHNvIHdlaWdoIGluIHRvIGhlbHAgcmVzb2x2ZSBhbnkg
cmVtYWluaW5nIGlzc3VlcyBzbyB3ZSBjYW4NCj4gPiBmaW5hbGx5IGdldCBpdCBtZXJnZWQuIERv
bid0IGdpdmUgdXAhIDopDQo+ID4NCj4gPiBNeSBzdWdnZXN0aW9uOiBnbyBhaGVhZCBhbmQgcG9z
dCB3aGF0IHlvdSBoYXZlIG5vdy4gSnVzdCBoaWdobGlnaHQgdGhlDQo+ID4gbWFpbiBwb2ludHMg
b2Ygb2JqZWN0aW9uIHJhaXNlZCBpbiB0aGUgbGFzdCByZXZpZXcgdGhhdCBzdGlsbCBuZWVkIHRv
IGJlDQo+IGFkZHJlc3NlZC4NCj4gPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlIGFu
ZCB0byBvZmZlciBoZWxwcy4gQW5vdGhlciBzdWdnZXN0aW9uIEkgaGF2ZSBpbg0KPiBtaW5kOg0K
PiBpZiB0aGVyZSBpcyB1bmNlcnRhaW50eSByZWdhcmRpbmcgdGhlIGRlc2lnbiwgaXQgd291bGQg
YmUgbmljZSB0byBwb3N0IGEgc3BlY2lmaWMNCj4gdGhyZWFkIGZvciBkaXNjdXNzaW9uIHVudGls
IGl0J3MgY2xlYXJlZCBwcmlvciB0byBkaXZpbmcgaW50byBjb2RlLiBBZnRlciB0aGUNCj4gZGVz
aWduIGlzIGFja25vd2xlZGdlZCBieSBtYWludGFpbmVycywgb3VyIGxpZmUgd2lsbCBiZSBtdWNo
IGVhc2llci4gVGhlDQo+IHBvaW50IGlzIHRvIGdldCBlbm91Z2ggYXR0ZW50aW9ucyBhbmQgZmVl
ZGJhY2tzIGZyb20gdGhlIG1haW50YWluZXJzIHVudGlsDQo+IGl0J3MgYWNrbm93bGVkZ2VkLg0K
DQoNClRoZSBjaGFuZ2VzIHdlcmUgbWFpbmx5IHRvIGFkZHJlc3MgSWdvcidzIGNvbmNlcm4gd2hp
Y2ggaGF2ZSB0byBiZSByZXNwZWN0ZWQNCmFzIGhlIGlzIGEgbWFpbnRhaW5lciBvZiB2Q1BVIGhv
dHBsdWcgb24geDg2LiBBbmQgdG8gZW5zdXJlIHRoYXQgaGlzIHRpbWUgaXMNCnV0aWxpemVkIGJl
c3QgYXMgaGUgaXMgdW5kZXJzdGFuZGFibHkgYSBidXN5IHBlcnNvbiwgd2UgYWxsIHRob3VnaHQg
dG8gc2hhcmUgdGhlDQp1cGRhdGVkIGNvZGUgdG8gaGltLg0KDQpUaGVyZSBhcmUgZGVzaWduIGNo
YW5nZXMgYnV0IHRoZXNlIGFyZSBub3Qgd2hpY2ggbWFrZXMgdGhlIGRlc2lnbiBjb21wbGV0ZWx5
DQpkaWZmZXJlbnQgYXMgd2UgaGF2ZSB0byByZXNwZWN0IHRoZSBpbnRlcmZhY2VzIHdoaWNoIGhh
dmUgYmVlbiBmcm96ZW4gd2l0aCB0aGUNCmtlcm5lbCBhbmQgaGVuY2UgdGhlIGhhbmRzaGFrZXMg
aWRlYWxseSBzaG91bGQgcmVtYWluIHNhbWUuIEFsc28sIGFzIHBhcnQgb2YNCnRoZSByZXZpZXcs
IEkndmUgaGFkIHNvbWUgaW50ZXJuYWwgZGlzY3Vzc2lvbnMgcmVsYXRlZCB0byB0aGVzZSBjaGFu
Z2VzIGluIEh1YXdlaQ0Kd2l0aCBKb25hdGhhbiBhbmQgaGUgd2FzIGluIGFncmVlbWVudCB3aXRo
IHRoZSBhcHByb2FjaC4gQnV0IG9mIGNvdXJzZSwgZW5kDQphY2tub3dsZWRnZW1lbnQgaGFzIHRv
IGNvbWUgZnJvbSBJZ29yLiDwn5iKDQoNCiANCj4gPj4gQmVzaWRlcywgSSdtIHJlbHVjdGFudGx5
IHRvIGFzayBpZiB5b3UncmUgZmluZSBmb3Igc29tZSBib2R5IGVsc2UgdG8NCj4gPj4gcGljayB0
aGlzIHVwIGFuZCBjb250aW51ZSB0aGUgZWZmb3J0LiBUaGUgY3JlZGl0cyBmb3IgYWxsIHRoZQ0K
PiA+PiBjb250cmlidXRvcnMgKEtlcWlhbiBaaHUsIEplYW4gUGhpbGlwcGUsIE1pZ3VlbCBMdWlz
IGFuZCB5b3UpIHdpbGwgYmUga2VwdC4NCj4gPg0KPiA+IEkgZG9u4oCZdCB3YW50IHRvIHNwZWFr
IGZvciBvdGhlcnMsIGJ1dCBpbiBteSB2aWV3LCBTYWxpbCBzaG91bGQgaWRlYWxseQ0KPiA+IGJl
IHRoZSBvbmUgdG8gY29tcGxldGUgdGhpcyB3b3JrIOKAlCBhcyB5b3Ugc2FpZCwgaGXigJlzIGFs
cmVhZHkgaW52ZXN0ZWQNCj4gPiBhIGdyZWF0IGRlYWwgb2YgdGltZSBhbmQgZW5lcmd5IGludG8g
aXQuDQo+ID4NCj4gPiBJdCB3b3VsZCBiZSB0cmVtZW5kb3VzbHkgaGVscGZ1bCBpZiBtYWludGFp
bmVycyBjb3VsZCBzdXBwb3J0IFNhbGlsIGluDQo+ID4gYnJpbmdpbmcgdGhpcyB0byBjb21wbGV0
aW9uLCBraW5kbHkgZ3VpZGluZyBoaW0gdG93YXJkIHRoZSBwYXRoIHRvIGdldCBpdA0KPiBmaW5h
bGl6ZWQuDQo+ID4NCj4gDQo+IEFic29sdXRlbHksIFNhbGlsIGtub3dzIGFsbCB0aGUgZGV0YWls
cywgZXNwZWNpYWxseSB0aGUgaGlzdG9yaWMgc3RlcHMgaG93IHZDUFUNCj4gaG90cGx1ZyBoYXMg
YmVlbiBldm9sdmluZy4gSSB0cnVseSBob3BlIFNhbGlsIGlzIGFibGUgdG8gY29udGludWUgdGhl
IGVmZm9ydHMNCj4gdW50aWwgdGhlIGZlYXR1cmUgbGFuZHMgdXBzdHJlYW0hDQoNCg0KU29ycnks
IGZvciBhbnkgaGFzc2xlIGNhdXNlZCBkdWUgdG8gbXkgYWJzZW5jZXMuIFllcywgSSdtIGJhY2sg
dG8gd29yayBhbmQgd2lsbA0KdHJ5IHRvIGV4cGVkaXRlIHRoZSBjaGFuZ2VzIGFuZCBwaW5nIHlv
dSBzb29uIGZvciB5b3VyIGhlbHAuDQoNClRoYW5rcyBmb3IgdW5kZXJzdGFuZGluZy4NCg0KQmVz
dCByZWdhcmRzDQpTYWxpbC4NCg0KDQo+IA0KPiBUaGFua3MsDQo+IEdhdmluDQo+IA0KDQo=
