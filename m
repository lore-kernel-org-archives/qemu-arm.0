Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2191883njc;
        Mon, 4 Nov 2024 07:26:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6lb150AbUYYQchjpGEn9Q8wnpZx0ouTX74szHh30I/EJD8LtXDsiWls7DwMf4KGqOUiIXRoh9bFYS6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEHvhce5n/fAi7YObTLAIoIpBm/2OBhGAdumVfvBHkyNo93iTUBFMShLsTY1iETgHxtiXsy
X-Received: by 2002:a05:6000:1884:b0:37d:4dd5:220f with SMTP id ffacd0b85a97d-381be7d62ecmr13390739f8f.26.1730733964678;
        Mon, 04 Nov 2024 07:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730733964; cv=none;
        d=google.com; s=arc-20240605;
        b=G4rscxBrE1Or+qdfVrxoZ+T7hvBbFJldVdHVNbVHvpmZJH4ZlZ5YvzrwVPEj1vGoOw
         KV/8mGXWr6WdZsf4LpnCnV9Ji/Yl8eNPVfVKpAcGLnpQlvVPpQAUD+xh5YF4x60S3/lE
         iL8+t1sNI0cA6aqcp/ZqEKYxL7cEkXpKrkCKaYcFxqcZTBXYbRObIq1vcDgoRjbmao4L
         cDQdEOTz3+p9a0CMIUEPlL8O/j7ceqPwnZjygYfVqep7VyZjgpcM6jX/pANIPf72X8Ju
         VMt0cn3N3ow/L2hMSNENKx46UeSn7UFBsXm+SgK8J5npfgWKCOYDpVTKr8aL3e8/JrMi
         +tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=wE2ZU7+VEoqfEqWiHkVtYIg8Y98WXElFDy8etYiyhRg=;
        fh=AdldtejB9+z8eQw909wrvtmcmvVWwxO8FsCycsPSpE8=;
        b=QRKYQ4N98Xoouzo5o7ZnCV1lPbX2oN6aqvUqn6B2Ftx70ZYMa93wnbE1TXzGGXw4Wm
         Jm4yjeB5gqnDAveem+ucOxEX20UsLGQLtJ2kH8vORwsnhDirg7ErJWJ7gP+Il84l9dyV
         QrkR34qi97+U37IJLgMez3Idq7oiPlrVmwyOuf/LqK4bhsIdR0iWna1d4yU7/l1wX2hK
         WdKWgZxLl2EamZb3421ONwQUlsZiIgrao7aQuIAbkUYwqSRlVyghcGx8rVaSowjeKou6
         PsgY3KsszfuLVEgJtd3pRh5sY5fk/rK7cERq5gZnFbhltekvFFf72r509BL2U7PiPkdJ
         bzWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c11b5918si6388365f8f.781.2024.11.04.07.26.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XhwGL3BLJz6K6Lg;
	Mon,  4 Nov 2024 23:23:22 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A4D9140CB9;
	Mon,  4 Nov 2024 23:26:03 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 16:26:03 +0100
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Mon, 4 Nov 2024 16:26:03 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Miguel Luis <miguel.luis@oracle.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, Marc Zyngier
	<maz@kernel.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Richard
 Henderson" <richard.henderson@linaro.org>, Igor Mammedov
	<imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>,
	=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
	"peterx@redhat.com" <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, Karl Heubaum <karl.heubaum@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>, "gustavo.romero@linaro.org"
	<gustavo.romero@linaro.org>
Subject: RE: [PATCH V3 0/5] Arch agnostic ACPI changes to support vCPU Hotplug
 (on Archs like ARM)
Thread-Topic: [PATCH V3 0/5] Arch agnostic ACPI changes to support vCPU
 Hotplug (on Archs like ARM)
Thread-Index: AQHbLdqy2GutVEAY2EeOYgePKrPLXrKnBQoAgAA584A=
Date: Mon, 4 Nov 2024 15:26:02 +0000
Message-ID: <7526caef11ad4e23963f6594b9777bdf@huawei.com>
References: <20241103102419.202225-1-salil.mehta@huawei.com>
 <C4FEC9E7-69DB-428A-A85F-30170F98814B@oracle.com>
In-Reply-To: <C4FEC9E7-69DB-428A-A85F-30170F98814B@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.170.66]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: rxn3IjGtlU4F

SEkgTWlndWVsLA0KDQo+ICBGcm9tOiBNaWd1ZWwgTHVpcyA8bWlndWVsLmx1aXNAb3JhY2xlLmNv
bT4NCj4gIFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgNCwgMjAyNCAxMjo1NSBQTQ0KPiAgVG86IFNh
bGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiAgDQo+ICBIaSBTYWxpbCwNCj4g
IA0KPiAgPiBPbiAzIE5vdiAyMDI0LCBhdCAwOToyNCwgU2FsaWwgTWVodGEgdmlhIDxxZW11LWRl
dmVsQG5vbmdudS5vcmc+DQo+ICB3cm90ZToNCj4gID4NCj4gID4gQ2hhbmdlIExvZw0KPiAgPiA9
PT09PT09PT09DQo+ICA+DQo+ICA+IFBhdGNoIFYyIC0+IFYzOg0KPiAgPiAxLiBBZGRyZXNzZWQg
bGVmdCBvdmVyIGlzc3VlcyBvZiB4ODYgc3VnZ2VzdGVkIGJ5IElnb3IgTWFtbWVkb3YNCj4gIChS
ZWRoYXQpOg0KPiAgPiAgIC0gUmVtb3ZlZCB0aGUgYEFDUElDUFVzdGF0dXM6OmlzX2VuYWJsZWRg
IFN0YXRlIGFzIHdlbGwgYXMgaXQgd2FzDQo+ICA+ICAgICBicmVha2luZyB0aGUgeDg2IG1pZ3Jh
dGlvbg0KPiAgPiAgIC0gQWJvdmUgaXMgaW4gYWRkaXRpb24gdG8gYGlzX3ByZXNlbnRgIHN0YXRl
IHdoaWNoIHdhcyByZW1vdmVkIGluIFYyDQo+ICA+ICAgLSBEcm9wcGVkIFtQQVRDSCAxLzZdIG9m
IFYyIHBhdGNoLXNldA0KPiAgPiAgIC0gSW50cm9kdWNlZCBob29rcyBgQ1BVQ2xhc3M6OmNwdV97
cGVyc2lzdGVuY2UsZW5hYmxlZH1fc3RhdHVzKClgDQo+ICA+IDIuIEZpeGVkIHRoZSBhY2NpZGVu
dGFsIENQVXMgQU1MIGJyZWFrIG9mIHg4NiBpbiBWMiAoc29ycnkgZm9yIHRoaXMhKS4NCj4gID4N
Cj4gID4gUGF0Y2ggVjEgLT4gVjI6DQo+ICA+IDEuIEFkZHJlc3NlZCBJZ29yIE1hbW1lZG92J3Mg
KFJlZGhhdCkgcmFpc2VkIGlzc3VlczoNCj4gID4gICAtIFJlbW92ZWQgYEFDUElDUFVzdGF0dXM6
OmlzX3ByZXNlbnRgIFN0YXRlIGFuZCBpdHMgaGFuZGxpbmcgaW4gdGhlDQo+ICA+ICAgICBBQ1BJ
IEFQVXMgQU1MIGNvZGUgYW5kIG5vdyBhbGwgUU9NIHZDUFVzIGFyZSBwcmVzZW50Lg0KPiAgPiAg
IC0gRHJvcHBlZCB0aGUgY29uY2VwdCBvZiBgYWNwaV9wZXJzaXN0ZW50YCBiZWNhdXNlIG5vdyBR
T00gdkNQVXMNCj4gID4gICAgIHN0YXRlcyBhbmQgdGhlIEFDUEkgdkNQVSBzdGF0ZXMgYXJlIGNv
bnNpc3RlbnQuDQo+ICA+ICAgLSBRT00gdkNQVSBvYmplY3RzIGFyZSBhbHdheXMgcHJlc2VudCBu
b3cgKGFjY29tcGFueWluZyBSRkMgVjYpDQo+ICA+ICAgLSBBZGRlZCAubmVlZGVkKCkgaG9vayB0
byB0aGUgR0VEIFZNU0QgdG9jb25kaXRpb25hbGx5IG1pZ3JhdGUgdGhlDQo+ICA+ICAgICBBQ1BJ
IENQVSBob3RwbHVnIHN0YXRlIGF0IHRoZSBzb3VyY2UgVk0uDQo+ICA+IDIuIEFkZHJlc3NlZCBa
aGFvIExpdSdzIChJbnRlbCkgcmVwb3J0ZWQgeDg2IERTRFQgVGFibGUgYmlvcy1hY3BpLXRlc3QN
Cj4gID4gZmFpbHVyZSAzLiBJbmNvcnBvcmF0ZWQgR3VzdGF2byBSb21lcm8ncyBjb21tZW50cyBh
bmQgYWRkZWQgaGlzIFRhZyB0bw0KPiAgPiBbUGF0Y2hlcyAxLDIsNF0gNC4gQWRkcmVzc2VkIEdh
dmluIFNoYW4ncyBjb21tZW50IHRvIHJlZHVjZSB0aGUgaW5saW5lDQo+ICBjb2RlIGNvbW1lbnRz
DQo+ICA+ICAgd2hlcmV2ZXIgcG9zc2libGUuDQo+ICA+DQo+ICA+DQo+ICA+IEJyaWVmIFJlY2Fs
bA0KPiAgPiA9PT09PT09PT09PT0NCj4gID4gV2l0aCB0aGUgYWR2ZW50IG9mIG11bHRpLWNvcmUg
U29DcywgdGhlIGNvbmNlcHQgb2YgQ1BVLWxldmVsDQo+ICA+IGhvdHBsdWdnaW5nIGhhcyBiZWNv
bWUgbGVzcyBkaXN0aW5jdCwgb2Z0ZW4gZnVuY3Rpb25pbmcgYXMgYSBwb3dlcg0KPiAgPiBvbi9v
ZmYgZXZlbnQgcmF0aGVyIHRoYW4gYSBmdWxsIGhvdHBsdWcgb3BlcmF0aW9uLiBIb3dldmVyLCBo
b3RwbHVnDQo+ICA+IHN1cHBvcnQgYXQgdGhlIGRpZS9OVU1BL3NvY2tldCBsZXZlbCByZW1haW5z
IG1lYW5pbmdmdWwgYW5kIGlzDQo+ICBhcmNoaXRlY3R1cmUtc3BlY2lmaWMuDQo+ICA+IFZpcnR1
YWwgQ1BVIGhvdHBsdWcgY2FuIGJlIHN1cHBvcnRlZCByZWdhcmRsZXNzIG9mIGFyY2hpdGVjdHVy
YWwNCj4gID4gc3VwcG9ydCBmb3IgcGh5c2ljYWwgQ1BVIGhvdHBsdWcsIGFzIGl0IHNlcnZlcyBy
ZXNvdXJjZSBtYW5hZ2VtZW50DQo+ICA+IG5lZWRz4oCUc3VjaCBhcyBkeW5hbWljYWxseSBzY2Fs
aW5nIFZNIGNvbXB1dGUgY2FwYWNpdHkgYmFzZWQgb24NCj4gIGRlbWFuZA0KPiAgPiBvciBTTEFz
LCBvcHRpbWl6aW5nIGJvb3QgdGltZXMsIG9yIHJlZHVjaW5nIG1lbW9yeSBmb290cHJpbnQuDQo+
ICA+IEFsdGhvdWdoLCBpdHMgZGVzaW5nIG11c3QgYmUgc2NhbGFibGUgYW5kIG11c3QgY28tZXhp
c3Qgd2l0aCBmdXR1cmUNCj4gID4gZGllL05VTUEvc29ja2V0IGxldmVsIGhvdHBsdWcgZmVhdHVy
ZXMuDQo+ICA+DQo+ICA+DQo+ICA+IE1vdGl2YXRpb24gZm9yIHRoaXMgcGF0Y2gtc2V0DQo+ICA+
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICA+IEluIGFyY2hpdGVjdHVyZXMgdGhh
dCBzdXBwb3J0IHZDUFUgaG90cGx1ZywgZmlybXdhcmUgb3IgdGhlIFZNTS9RRU1VDQo+ICA+IHR5
cGljYWxseSByZWZsZWN0cyB2Q1BVIHN0YXR1cyBjaGFuZ2VzIHRvIHRoZSBPUyB2aWEgdGhlIEFD
UEkNCj4gID4gYF9TVEEuUHJlc2VudGAgYml0LiBIb3dldmVyLCBjZXJ0YWluIENQVSBhcmNoaXRl
Y3R1cmVzIHByb2hpYml0IFsxXQ0KPiAgPiBtb2RpZmljYXRpb25zIHRvIENQVSBwcmVzZW5jZSBh
ZnRlciBrZXJuZWwgYm9vdC4gVGhpcyByZXN0cmljdGlvbg0KPiAgPiBbMl1bM10gY291bGQgYmUg
ZHVlIHRvIGNsb3NlbHkgaW50ZWdyYXRlZCBwZXItQ1BVIGNvbXBvbmVudHPigJRsaWtlDQo+ICA+
IGludGVycnVwdCBjb250cm9sbGVycyBvciBvdGhlciBmZWF0dXJlc+KAlCB0aGF0IG1heSBub3Qg
c3VwcG9ydA0KPiAgPiByZWNvbmZpZ3VyYXRpb24gcG9zdC1ib290IGFuZCBhcmUgb2Z0ZW4gaW4g
YW4gYGFsd2F5cy1vbmAgcG93ZXINCj4gID4gZG9tYWluLiBDb25zZXF1ZW50bHksIHNwZWNpZmlj
YXRpb25zIGZvciB0aGVzZSBhcmNoaXRlY3R1cmVzIHJlcXVpcmUNCj4gID4gYWxsIENQVXMgdG8g
cmVtYWluIHByZXNlbnQgaS5lLmBfU1RBLlByZXNlbnQ9VHJ1ZWAsIG9uY2UgdGhlIHN5c3RlbSBp
cw0KPiAgaW5pdGlhbGl6ZWQuDQo+ICA+DQo+ICA+IFRvIGJlIGFibGUgdG8gc3VwcG9ydCB2Q1BV
IEhvdHBsdWcgZmVhdHVyZSwgYXMgYSB3b3JrYXJvdW5kIHRvIHRoZQ0KPiAgPiBhYm92ZSBsaW1p
dGF0aW9uLCAgQUNQSSBtZXRob2QgYF9TVEEuRW5hYmxlZGAgQml0IGNvdWxkIGJlIHVzZWQgdG8N
Cj4gID4gcmVmbGVjdCB0aGUgcGx1Z2dlZCBhbmQgdW5wbHVnZ2VkIHN0YXRlcyBvZiB0aGUgUU9N
IHZDUFVzLg0KPiAgPg0KPiAgPiBUaGlzIHBhdGNoIHNldCBpbnRyb2R1Y2VzIHRoZSBmb2xsb3dp
bmcgY2hhbmdlczoNCj4gID4NCj4gID4gMS4gSW50cm9kdWNlc2BDUFVDbGFzczo6Y3B1X3twZXJz
aXN0ZW5jZSxlbmFibGVkfV9zdGF0dXNgIGhvb2tzOiBUbw0KPiAgPiAgIGNoZWNrIGlmIHRoZSBD
UFUgc2hvdWxkIGFsd2F5cyByZW1haW4gcHJlc2VudCBldmVuIGFmdGVyIHVucGx1Zw0KPiAgPiAg
IG9wZXJhdGlvbiBhbmQgdG8gZmV0Y2ggdGhlIHZDUFUgYGVuYWJsZWRgIHN0YXR1cyBpbiBjYXNl
IGl0IGlzDQo+ICA+ICAgcHJlc2VudC4gTGF0ZXIgaXMgdXNlZCBpbiBjb250ZXh0IHdoZW4gR3Vl
c3QgS2VybmVsIGV2YWx1YXRlcw0KPiAgPiAgIEFDUEkgYF9TVEFgIG1ldGhvZCBhbmQgdGhlIHN0
YXR1cyBpcyByZWFkIGZyb20gdGhlIGZsYWdzIHN0b3JlZA0KPiAgPiAgIGluIHRoZSBRZW11IEFD
UEkgY29kZS4NCj4gID4NCj4gID4gMi4gU3VwcG9ydCBmb3IgTWlncmF0aW5nIEFDUEkgQ1BVIEhv
dHBsdWcgU3RhdGU6IEZhY2lsaXRhdGVzIHRoZQ0KPiAgPiAgIG1pZ3JhdGlvbiBvZiB0aGUgQUNQ
SSBDUFUgaG90cGx1ZyBzdGF0ZSBpbiBWTVNEIGJ5IGNvbmRpdG9uYWxseQ0KPiAgPiAgIG1ha2lu
ZyBpdCBwYXJ0IG9mIHRoZSBHRUQgVk1TRC4NCj4gID4NCj4gID4gMy4gVXBkYXRlcyB0aGUgUXRl
c3QgYmlvcy1hY3BpLXRhYmxlcy9EU0RUIGJpbmFyaWVzIGZvciB4ODYve3BjLHEzNX0NCj4gID4N
Cj4gID4gVGhpcyBwYXRjaCBzZXQgaXMgZGVzaWduZWQgdG8gd29yayBpbmRlcGVuZGVudGx5IGFu
ZCBpcyBtZWFudCB0bw0KPiAgPiBlbnN1cmUgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIGhv
dHBsdWcgc3VwcG9ydCBhY3Jvc3MgZGlmZmVyZW50DQo+ICA+IGFyY2hpdGVjdHVyZXMuIFRoaXMg
cGF0Y2gtc2V0IGhhcyBiZWVuIHRlc3RlZCBhbG9uZ3NpZGUgQVJNLXNwZWNpZmljDQo+ICA+IHZD
UFUgaG90cGx1ZyBjaGFuZ2VzIChpbmNsdWRlZCBpbiB0aGUgdXBjb21pbmcgUkZDIFY2IFs0XSks
IGFuZA0KPiAgPiBob3QodW4pcGx1ZyBmdW5jdGlvbmFsaXRpZXMgcGVyZm9ybWVkIGFzIGV4cGVj
dGVkIHdoaWNoIGNvbmNlcm5zIHRoaXMNCj4gID4gcGF0Y2gtc2V0LiBQbGVhc2UgaGF2ZSBhIGxv
b2suDQo+ICA+DQo+ICANCj4gIEZvciBhcm02NDoNCj4gIEnigJl2ZSByYW4gbWFrZSBjaGVjayBh
bmQgYmlvcy10YWJsZXMtdGVzdCBwYXNzZWQgc3VjY2Vzc2Z1bGx5IGFuZCBnb3QgMCBmYWlsZWQN
Cj4gIHRlc3RzLg0KPiAgQWZ0ZXIgYm9vdCB0aGUgbnVtYmVyIG9mIHZjcHVzIG1hdGNoZWQgd2hh
dCB3YXMgaW5pdGlhbGx5IHJlcXVlc3RlZCB2aWEgLQ0KPiAgc21wIGNwdXMuDQo+ICBJ4oCZdmUg
YWxzbyB0ZXN0ZWQgdGhpcyBwYXRjaHNldCBhbG9uZ3NpZGUgdGhlIHVwY29taW5nIFJGQyBWNi1y
YzUgYW5kDQo+ICBib290aW5nLCBiYXNpYyBob3QtcGx1Z2dpbmcvdW5wbHVnZ2luZyBvZiB2Q1BV
cyBhbmQgbGl2ZSBtaWdyYXRpb24gd2l0aCBhbg0KPiAgYXN5bW1ldHJpY2FsIG51bWJlciBvZiBo
b3RwbHVnZ2VkIHZDUFVzIGxvb2tlZCBnb29kIHRvIG1lLg0KPiAgDQo+ICBQbGVhc2UsIGZlZWwg
ZnJlZSB0byBhZGQ6DQo+ICBUZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFj
bGUuY29tPg0KDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIGNvbnRpbnVvdXMgZWZmb3J0cyBhbmQg
Y29uZmlybWluZyB0aGlzLiBJIHJlYWxseSBhcHByZWNpYXRlIHRoaXMuDQoNCkkgd291bGQgbGVh
dmUgYXBwbGljYXRpb24gb2YgdGhpcyBUYWcgdG8gTWljaGFlbCBhcyBwYXRjaC1zZXQgaXMgaW4g
aGlzIHF1ZXVlIG5vdy4g8J+Yig0KDQpNYW55IHRoYW5rcyENCg0KQmVzdCByZWdhcmRzDQpTYWxp
bC4NCg0KDQo+ICANCj4gIFRoYW5rIHlvdS4NCj4gIE1pZ3VlbA0KPiAgDQo+ICA+IFRoYW5rIHlv
dSENCj4gID4NCg==
