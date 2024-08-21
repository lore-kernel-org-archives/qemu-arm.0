Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp208370njb;
        Wed, 21 Aug 2024 03:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWBEnwtZoEgKyU6SbqsC7nVlMAWPpojpUT6Ojm83iyxh+j3D2RuCIN62HsJFn5HU8Vb5hIuoVDZyKZWw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZShuLuuKS8FoxZezAl466mFSBZAm+wr+VHXBixeGvSVKSNUImVB7AdMiJTW8ALQa7nNLd
X-Received: by 2002:a05:622a:418d:b0:44f:e591:a66b with SMTP id d75a77b69052e-454f21db697mr19782171cf.8.1724235818033;
        Wed, 21 Aug 2024 03:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724235818; cv=none;
        d=google.com; s=arc-20160816;
        b=xv7WPPdCjwVIW4SLR6taTvnEMUzA9ZCyNAOaoxkWNESUmY5gieasZCeT/tEclpHFpf
         p7agEuh1peY5uI/ssbQykcvemXZduhaziGQBu66upjdGpa8JlfDqhB+X6ocx7OjDQgDr
         rpDAbL8P3KOFrCxyoYPMZcAZb02DluDFyRBCp3CBg1d0SQH1Oq+OrxRZ9im2/RtkcNji
         jPS5Sz/eci9Qd+7XlIQ+HC3oIvyPFa8zpPiCDadONxfZKzU9jf+Vn6bAs3mHWSOuf46p
         Kq82/qIwRSo+sTl3Ww2INpyVgQMTK08nF4cJbbnvLOxfvH/4wmFuNJXPpZDX3IVpFbIA
         qIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=XhcTwjVKA78P7rB3YbdzLooSHAUcIEwK75qnpTyv1OU=;
        fh=IcghoZT+iwDwnUWe0/8u2lfgCRl3Js+UrcNMjs/i9hE=;
        b=NEUyvdknziT0xifNJq2XKbfQ0Y0z2bqOAchl2rxEl//6qkoSWIq8YxVvIoci0Lwxt6
         ugzbNrzAeqPXSztrq8oVAoWssYqPA3t+lT4fXABLOJqZSIsAyie7mniycoulMp5zGka7
         R2i2Y5zWqGdpMRgPPSJr8MgFZl4SO9Fe1P0Nc7+xZLv+qbhBF55OxjxsFnyZSCqVkAdK
         7NJvqEKL22ckT6xAXUy36xFD/wUarlU6BVDPlioB9KLrCloXHAKH5R4rhbqj08QKXgWG
         1dDSOqIYZEjmINEgylq52CgNNM5RhU7gnf8iXNPJ2VTd8IdQUcT6qL0hlxSlJPI2TrJd
         6zWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a00414bsi150104491cf.189.2024.08.21.03.23.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2024 03:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wpj4s3WLlz6FH2w;
	Wed, 21 Aug 2024 18:19:57 +0800 (CST)
Received: from lhrpeml100004.china.huawei.com (unknown [7.191.162.219])
	by mail.maildlp.com (Postfix) with ESMTPS id D58F51400DB;
	Wed, 21 Aug 2024 18:23:35 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 11:23:35 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Wed, 21 Aug 2024 11:23:35 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"shahuang@redhat.com" <shahuang@redhat.com>, "zhao1.liu@intel.com"
	<zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 17/29] arm/virt: Release objects for *disabled*
 possible vCPUs after init
Thread-Topic: [PATCH RFC V3 17/29] arm/virt: Release objects for *disabled*
 possible vCPUs after init
Thread-Index: AQHaveuckEaR/Tp4NUKcalC/yUyS9LIksGYAgAo1aXCAALcOgIABH0kAgADc+ICAAEc9cA==
Date: Wed, 21 Aug 2024 10:23:35 +0000
Message-ID: <1c31ab30bae6437fac7799227ca4bfd1@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<20240613233639.202896-18-salil.mehta@huawei.com>
	<51dc0813-7dc9-4927-a24b-bd718be54e46@redhat.com>
	<6b435c1f2b934867b8d82850d6d866c6@huawei.com>
	<9b7582f0-8149-4bf0-a1aa-4d4fe0d35e70@redhat.com>
	<1252c2d35b3e40ed84d5d5ae454878a7@huawei.com>
 <d2371011-e7a3-42fe-b1a3-a185fbf4a612@redhat.com>
In-Reply-To: <d2371011-e7a3-42fe-b1a3-a185fbf4a612@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.171.245]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: hAkluQX70w3Y

SGkgR2F2aW4sDQoNCj4gIEZyb206IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQo+ICBT
ZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyMSwgMjAyNCA3OjI1IEFNDQo+ICBUbzogU2FsaWwgTWVo
dGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+ICBx
ZW11LWFybUBub25nbnUub3JnOyBtc3RAcmVkaGF0LmNvbQ0KPiAgDQo+ICBIaSBTYWxpbCwNCj4g
IA0KPiAgT24gOC8yMS8yNCAyOjQwIEFNLCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gID4NCj4gID4g
SSBkb27igJl0IHVuZGVyc3RhbmQgdGhpcyBjbGVhcmx5LiBBcmUgIHlvdSBzdWdnZXN0aW5nIHRv
IHJldXNlIG9ubHkNCj4gID4gc2luZ2xlIHZDUFUgb2JqZWN0IHRvIGluaXRpYWxpemUgYWxsIEtW
TSB2Q1BVcyBub3QgeWV0IHBsdWdnZWQ/IElmDQo+ICA+IHllcywgdGhlbiBJJ20gbm90IHN1cmUg
d2hhdCBkbyB3ZSBnYWluIGhlcmUgYnkgYWRkaW5nIHRoaXMgY29tcGxleGl0eT8NCj4gID4gSXQg
ZG9lcyBub3QgY29uc3VtZSB0aW1lIG9yIHJlc291cmNlcyBiZWNhdXNlIHdlIGFyZSBub3QgcmVh
bGl6aW5nIGFueQ0KPiAgPiBvZiB0aGVzZSB2Q1BVIG9iamVjdCBpbiBhbnkgY2FzZS4NCj4gID4N
Cj4gIA0KPiAgRmlyc3Qgb2YgYWxsLCBpdCBzZWVtcyB3ZSBoYXZlIGRpZmZlcmVudCBuYW1lcyBh
bmQgdGVybXMgZm9yIHRob3NlIGNvbGQtDQo+ICBib290ZWQgdkNQVXMgYW5kIGhvdHBsdWdnYWJs
ZSB2Q1BVcy4gRm9yIGV4YW1wbGUsIHZDUFUtMCBhbmQgdkNQVS0xDQo+ICBhcmUgY29sZC1ib290
ZWQgdkNQVXMgd2hpbGUNCj4gIHZDUFUtMiBhbmQgdkNQVS0zIGFyZSBob3RwbHVnZ2FibGUgdkNQ
VXMgd2hlbiB3ZSBoYXZlICctc21wDQo+ICBtYXhjcHVzPTQsY3B1cz0yJy4gTGV0cyBzdGljayB0
byBjb252ZW50aW9uIGFuZCB0ZXJtcyBmb3IgZWFzaWVyIGRpc2N1c3Npb24uDQo+ICANCj4gIFRo
ZSBpZGVhIGlzIGF2b2lkIGluc3RhbnRpYXRpbmcgaG90cGx1Z2dhYmxlIHZDUFVzIGluIHZpcnRt
YWNoX2luaXQoKSBhbmQNCj4gIHJlbGVhc2VkIGluIHRoZSBzYW1lIGZ1bmN0aW9uIGZvciB0aG9z
ZSBob3RwbHVnZ2FibGUgdkNQVXMuIEFzIEkgY2FuDQo+ICB1bmRlcnN0YW5kLCB0aG9zZSBob3Rw
bHVnZ2FibGUgdkNQVSBpbnN0YW5jZXMgYXJlIHNlcnZpbmcgZm9yIHR3bw0KPiAgcHVycG9zZXM6
ICgxKSBSZWxheCB0aGUgY29uc3RyYWludCB0aGF0IGFsbCB2Q1BVJ3MgKGt2bSkgZmlsZSBkZXNj
cmlwdG9yIGhhdmUNCj4gIHRvIGJlIGNyZWF0ZWQgYW5kIHBvcHVsYXRlZDsgDQoNCg0KV2UgYXJl
IGRldmlzaW5nICp3b3JrYXJvdW5kcyogaW4gUWVtdSBmb3IgdGhlIEFSTSBDUFUgYXJjaGl0ZWN0
dXJhbCBjb25zdHJhaW50cw0KaW4gS1ZNIGFuZCBpbiBHdWVzdCBLZXJuZWwsICAqbm90IHJlbGF4
aW5nKiB0aGVtLiBXZSBhcmUgbm90IGFsbG93ZWQgdG8gbWVkZGxlIHdpdGgNCnRoZSBjb25zdHJh
aW50cy4gVGhhdCBpcyB0aGUgd2hvbGUgcG9pbnQuDQoNCk5vdCBoYXZpbmcgdG8gcmVzcGVjdCB0
aG9zZSBjb25zdHJhaW50cyBsZWQgdG8gcmVqZWN0aW9uIG9mIHRoZSBlYXJsaWVyIGF0dGVtcHRz
IHRvDQp1cHN0cmVhbSBWaXJ0dWFsIENQVSBIb3RwbHVnIGZvciBBUk0uDQoNCg0KKDIpIEhlbHAg
dG8gaW5zdGFudGlhdGUgYW5kIHJlYWxpemUNCj4gIEdJQ3YzIG9iamVjdC4NCj4gIA0KPiAgRm9y
ICgxKSwgSSBkb24ndCB0aGluayB3ZSBoYXZlIHRvIGluc3RhbnRpYXRlIHRob3NlIGhvdHBsdWdn
YWJsZSB2Q1BVcyBhdCBhbGwuDQo+ICBJbiB0aGUgYWJvdmUgZXhhbXBsZSB3aGVyZSB3ZSBoYXZl
IGNvbW1hbmQgbGluZSAnLXNtcA0KPiAgbWF4Y3B1cz00LGNwdXM9MicsIGl0J3MgdW5uZWNlc3Nh
cnkgdG8gaW5zdGFudGlhdGUNCj4gIHZDUFUtMyBhbmQgdkNQVS00IHRvIGNyZWF0ZSBhbmQgcG9w
dWxhdGUgdGhlaXIgS1ZNIGZpbGUgZGVzY3JpcHRvcnMuDQoNCg0KV2UgY2Fubm90IGRlZmVyIGNy
ZWF0ZSB2Q1BVIGluIEtWTSBhZnRlciBHSUMgaGFzIGJlZW4gaW5pdGlhbGl6ZWQgaW4gS1ZNLg0K
SXQgbmVlZHMgdG8ga25vdyBldmVyeSB2Q1BVIHRoYXQgd2lsbCBldmVyIGV4aXN0cyByaWdodCBh
dCB0aGUgdGltZSBpdCBpcyBnZXR0aW5nDQpJbml0aWFsaXplZC4gVGhpcyBpcyBhbiBBUk0gQ1BV
IEFyY2hpdGVjdHVyYWwgY29uc3RyYWludC4gDQoNCg0KIEENCj4gIHZDUFUncyBLVk0gZmlsZSBk
ZXNjcmlwdG9yIGlzIGNyZWF0ZSBhbmQgcG9wdWxhdGVkIGJ5IHRoZSBmb2xsb3dpbmcgaW9jdGxz
DQo+ICBhbmQgZnVuY3Rpb24gY2FsbHMuIFdoZW4gdGhlIGZpcnN0IHZDUFUgKHZDUFUtMCkgaXMg
cmVhbGl6ZWQsIHRoZSBwcm9wZXJ0eQ0KPiAgY29ycmVzcG9uZGluZyB0byAiJmluaXQiIGlzIGZp
eGVkIGZvciBhbGwgdkNQVXMuIEl0IG1lYW5zIGFsbCB2Q1BVcyBoYXZlIHNhbWUNCj4gIHByb3Bl
cnRpZXMgZXhjZXB0IHRoZSAidmNwdV9pbmRleCIuDQo+ICANCj4gICAgIGlvY3RsKHZtLWZkLCAg
IEtWTV9DUkVBVEVfVkNQVSwgICB2Y3B1X2luZGV4KTsNCj4gICAgIGlvY3RsKHZjcHUtZmQsIEtW
TV9BUk1fVkNQVV9JTklULCAmaW5pdCk7DQo+ICAgICBrdm1fcGFya192Y3B1KGNzKTsNCj4gIA0K
PiAgQSB2Q1BVJ3MgcHJvcGVydGllcyBhcmUgZGV0ZXJtaW5lZCBieSB0d28gc291cmNlcyBhbmQg
Ym90aCBhcmUgZ2xvYmFsLiBJdA0KPiAgbWVhbnMgYWxsIHZDUFVzIHNob3VsZCBoYXZlIHNhbWUg
cHJvcGVydGllczogKGEpIEZlYXR1cmUgcmVnaXN0ZXJzDQo+ICByZXR1cm5lZCBmcm9tIHRoZSBo
b3N0LiBUaGUgZnVuY3Rpb24NCj4gIGt2bV9hcm1fZ2V0X2hvc3RfY3B1X2ZlYXR1cmVzKCkgaXMg
Y2FsbGVkIGZvciBvbmNlLCBtZWFuaW5nIHRoaXMgc291cmNlDQo+ICBpcyBzYW1lIHRvIGFsbCB2
Q1BVczsNCg0KDQpTdXJlLCBidXQgd2hhdCBhcmUgeW91IHRyeWluZyB0byBzYXZlIGhlcmU/DQoN
Cg0KPiAgKGIpIFRoZSBwYXJhbWV0ZXJzIHByb3ZpZGVkIGJ5IHVzZXIgdGhyb3VnaCAnLWNwdSBo
b3N0LHN2ZT1vZmYnIGFyZQ0KPiAgdHJhbnNsYXRlZCB0byBnbG9iYWwgcHJvcGVydGllcyBhbmQg
YXBwbGllZCB0byBhbGwgdkNQVXMgd2hlbiB0aGV5J3JlDQo+ICBpbnN0YW50aWF0ZWQuDQoNCg0K
U3VyZS4gU2FtZSBpcyB0aGUgY2FzZSB3aXRoIFBNVSBhbmQgb3RoZXIgcGVyLXZDUFUgcGFyYW1l
dGVycy4NCldlIGRvIG5vdCBzdXBwb3J0IGhldGVyb2dlbm91cyBjb21wdXRpbmcgYW5kIHRoZXJl
Zm9yZSB3ZSBkbyBub3QNCmhhdmUgcGVyLXZDUFUgY29udHJvbCBvZiB0aGVzZSBmZWF0dXJlcyBh
cyBvZiBub3cuDQoNCg0KPiAgDQo+ICAgICAgICAgKGEpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoYikNCj4gIA0KPiAgICAgYWFyY2g2NF9ob3N0X2luaXRmbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgcWVtdV9pbml0DQo+ICAgICBrdm1fYXJtX3NldF9jcHVf
ZmVhdHVyZXNfZnJvbV9ob3N0ICAgICAgICAgICBwYXJzZV9jcHVfb3B0aW9uDQo+ICAgICAgIGt2
bV9hcm1fZ2V0X2hvc3RfY3B1X2ZlYXR1cmVzICAgICAgICAgICAgICBjcHVfY29tbW9uX3BhcnNl
X2ZlYXR1cmVzDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBxZGV2X3Byb3BfcmVnaXN0ZXJfZ2xvYmFsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDoNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV9wb3N0X2luaXQNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHFkZXZfcHJvcF9zZXRfZ2xvYmFs
cw0KDQoNClN1cmUsIEkgdW5kZXJzdGFuZCB0aGUgY29kZSBmbG93IGJ1dCB3aGF0IGFyZSB5b3Ug
dHJ5aW5nIHRvIHN1Z2dlc3QgaGVyZT8NCg0KDQo+ICBGb3IgKDIpLCBJJ20gc3RpbGwgbG9va2lu
ZyBpbnRvIHRoZSBHSUN2MyBjb2RlIGZvciBiZXR0ZXIgdW5kZXJzdGFuZGluZy4gDQoNCg0KT2gs
IEkgdGhvdWdodCB5b3Ugc2FpZCB5b3UndmUgZmluaXNoZWQgeW91ciByZXZpZXdzIPCfmIoNCg0K
UGxlYXNlIHRha2UgeW91ciB0aW1lLiBGb3IgeW91ciByZWZlcmVuY2UsIHlvdSBtaWdodCB3YW50
IHRvIGNoZWNrOg0KDQpLVk1Gb3J1bSAyMDIzOg0KaHR0cHM6Ly9rdm0tZm9ydW0ucWVtdS5vcmcv
MjAyMy9DaGFsbGVuZ2VzX1JldmlzaXRlZF9pbl9TdXBwb3J0aW5nX1ZpcnRfQ1BVX0hvdHBsdWdf
LV9faWkwaU5iMy5wZGYNCmh0dHBzOi8va3ZtLWZvcnVtLnFlbXUub3JnLzIwMjMvS1ZNLWZvcnVt
LWNwdS1ob3RwbHVnXzdPSjFZeUoucGRmDQoNCktWTUZvcnVtIDIwMjA6DQpodHRwczovL2t2bS1m
b3J1bS5xZW11Lm9yZy8yMDIwL09jdCUyMDI5X0NoYWxsZW5nZXMlMjBpbiUyMFN1cHBvcnRpbmcl
MjBWaXJ0dWFsJTIwQ1BVJTIwSG90cGx1ZyUyMGluJTIwU29DJTIwQmFzZWQlMjBTeXN0ZW1zJTIw
bGlrZSUyMEFSTTY0X1NhbGlsJTIwTWVodGEucGRmDQoNCg0KVW50aWwNCj4gIG5vdywgSSBkb24n
dCBzZWUgd2UgbmVlZCB0aGUgaW5zdGFudGlhdGVkIGhvdHBsdWdnYWJsZSB2Q1BVcyBlaXRoZXIu
DQoNCg0KSSB0aGluaywgSSd2ZSBhbHJlYWR5IGFuc3dlcmVkIHRoaXMgYWJvdmUgaXQgaXMgYmVj
YXVzZSBvZiBBUk0gQXJjaGl0ZWN0dXJhbCBjb25zdHJhaW50Lg0KDQoNCiBGb3INCj4gIGV4YW1w
bGUsIHRoZSByZWRpc3RyaWJ1dG9yIHJlZ2lvbnMgY2FuIGJlIGV4cG9zZWQgYmFzZWQgb24gJ21h
eGNwdXMnDQo+ICBpbnN0ZWFkIG9mICdjcHVzJy4gDQoNCllvdSBtZWFuIGR1cmluZyB0aGUgcmV2
aWV3IG9mIHRoZSBjb2RlIHlvdSBmb3VuZCB0aGF0IHdlIGFyZSBub3QgZG9pbmcgaXQ/DQoNCg0K
VGhlIElSUSBjb25uZWN0aW9uIGFuZCB0ZWFyZG93biBjYW4gYmUgZHluYW1pY2FsbHkNCj4gIGRv
bmUgYnkgY29ubmVjdGluZyB0aGUgYm9hcmQgd2l0aCBHSUN2MyB0aHJvdWdoIGNhbGxiYWNrcyBp
bg0KPiAgQVJNR0lDdjNDb21tb25DbGFzcy4NCj4gIFRoZSBjb25uZWN0aW9uIGJldHdlZW4gR0lD
djNDUFVTdGF0ZSBhbmQgQ1BVQVJNU3RhdGUgYWxzbyBjYW4gYmUNCj4gIGRvbmUgZHluYW1pY2Fs
bHkuDQoNCkFyZSB5b3Ugc3VnZ2VzdGluZyB0aGlzIGFmdGVyIHJldmlld2luZyB0aGUgY29kZSBv
ciB5b3UgaGF2ZSB0byByZXZpZXcgaXQgeWV0PyDwn5iJDQoNCg0KVGhhbmtzDQpTYWxpbC4NCg0K
DQo+ICANCj4gIFRoYW5rcywNCj4gIEdhdmluDQo+ICANCg0K
