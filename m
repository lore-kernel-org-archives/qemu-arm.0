Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp3570834dlb;
        Thu, 4 Jul 2024 05:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVk3Zbt/x6Yx2QxY3ghfhbUAYrK0fqDqXzWxrp2H0KnRCyaCMmfTCIYEjhOFu1+WMFEsRRTMKK3R7I1ZLxFrdgfldgnSLJg
X-Google-Smtp-Source: AGHT+IFbT9HP+So4voqRv3E42WzuSWavTWYXLTgvv4+cK7/1cQlYagedGeBGETl66vgqkJyOIdnV
X-Received: by 2002:a05:600c:4ba5:b0:425:61be:c911 with SMTP id 5b1f17b1804b1-4264a3e7c1dmr11490055e9.21.1720096041999;
        Thu, 04 Jul 2024 05:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720096041; cv=none;
        d=google.com; s=arc-20160816;
        b=0Y2+R18oXZ6mK3idHMAUtqj5Ed5S0auHG+fo4kXQV2Z7/o2L9KwU5a4j4eLhwC5WRi
         3e/b2CVr6vj+o27F9XxTWiLQeVltwPluK8018fTPVmgtO/sTTPj3Fh5MB3YNq9HPKlVK
         GsBfkP+niR8MsJEH0WKXufUJt5QNybYQa1j9545jWVQOAPG2vstZkylr46oUb3bL/W/d
         i02UlAh/ae/AbOn7l474KCqHtd4H1bdbW2UJB1GGeVUBaLVG0S28LptYPyAnPEVDi2Ed
         V+QxBA6tUvDcHPAw2UVy5EAQoU0wQWXi6cluFMJCptgX9wmGWBcwM77IodHQYN/QyLL2
         46WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=H6dDJLOF4OpR9bcXXutYm+C5CVIB2feZlv8xXRINr/k=;
        fh=ro2Z1QvFTCOZ/3CZexdUh8ZVhuyhWiUVYHwaONZqRmg=;
        b=aF8OY/9SC/EuiSNg3Pn4hnG9Kk4BCNkZr0bjo2ZE8sUxNWna0MOKgYi6aLtL0XG5Ak
         2H//Uu1MSZl1WyO7WNUXVBB0V0pw42hD1K4Do4h/fbCP93xifxZPfRh3zwk31gKxP8uo
         B79feZoWA9BU4VG0DdgAIzrbbiUK/70whej49cXVuTBmZ1kG+OGjl3EzTWzblBCyMxMF
         /0geQ9UeF1wDMtzQRW2dlDKqA8NH/kO3BpwvbIwIIG4ITNbFHCnBzB+mERr7Fr5bPJXI
         B1E4oIR9AQbOji0ZCmqUErxDdaU2oIhF5c/6piLtMMjpOB5gdx1C2WHdmzJDeWtBkpn3
         l9Tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4264a2fed4dsi7639765e9.197.2024.07.04.05.27.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2024 05:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WFG9C2G4gz6JB5N;
	Thu,  4 Jul 2024 20:26:39 +0800 (CST)
Received: from lhrpeml100006.china.huawei.com (unknown [7.191.160.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 13A3B140736;
	Thu,  4 Jul 2024 20:27:21 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 13:27:20 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Thu, 4 Jul 2024 13:27:20 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Nicholas Piggin <npiggin@gmail.com>, "qemu-devel@nongnu.org"
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
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
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
Subject: RE: [PATCH RFC V3 25/29] target/arm/kvm: Write CPU state back to KVM
 on reset
Thread-Topic: [PATCH RFC V3 25/29] target/arm/kvm: Write CPU state back to KVM
 on reset
Thread-Index: AQHavewIBjwTl+QVTkWSZMJOrzp7nbHl96KAgACklnA=
Date: Thu, 4 Jul 2024 12:27:20 +0000
Message-ID: <a4329bdf36d74e29b6c2a00329fb9e97@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-26-salil.mehta@huawei.com>
 <D2GFOGQC3HYO.2LKOV306JIU98@gmail.com>
In-Reply-To: <D2GFOGQC3HYO.2LKOV306JIU98@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.159.88]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: 7tymd675XoS4

SGkgTmljaywNCg0KPiAgRnJvbTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4N
Cj4gIFNlbnQ6IFRodXJzZGF5LCBKdWx5IDQsIDIwMjQgNDoyOCBBTQ0KPiAgVG86IFNhbGlsIE1l
aHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiAg
cWVtdS1hcm1Abm9uZ251Lm9yZzsgbXN0QHJlZGhhdC5jb20NCj4gIA0KPiAgT24gRnJpIEp1biAx
NCwgMjAyNCBhdCA5OjM2IEFNIEFFU1QsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPiBGcm9tOiBK
ZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gID4NCj4g
ID4gV2hlbiBhIEtWTSB2Q1BVIGlzIHJlc2V0IGZvbGxvd2luZyBhIFBTQ0kgQ1BVX09OIGNhbGws
IGl0cyBwb3dlciBzdGF0ZQ0KPiAgPiBpcyBub3Qgc3luY2hyb25pemVkIHdpdGggS1ZNIGF0IHRo
ZSBtb21lbnQuIEJlY2F1c2UgdGhlIHZDUFUgaXMgbm90DQo+ICA+IG1hcmtlZCBkaXJ0eSwgd2Ug
bWlzcyB0aGUgY2FsbCB0byBrdm1fYXJjaF9wdXRfcmVnaXN0ZXJzKCkgdGhhdCB3cml0ZXMNCj4g
ID4gdG8gS1ZNJ3MgTVBfU1RBVEUuIEZvcmNlIG1wX3N0YXRlIHN5bmNocm9uaXphdGlvbi4NCj4g
IA0KPiAgSG1tLiBJcyB0aGlzIGEgYnVnIGZpeCBmb3IgdXBzdHJlYW0/IGFybSBkb2VzIHJlc3Bv
bmQgdG8gQ1BVX09OIGNhbGxzIGJ5DQo+ICB0aGUgbG9vaywgYnV0IG1heWJlIGl0J3Mgbm90IGRv
aW5nIEtWTSBwYXJraW5nIHVudGlsIHlvdXIgc2VyaWVzPw0KDQoNClllcywgdGhpcyBpcyByZXF1
aXJlZCB3ZSBub3cgcGFyayBhbmQgdW4tcGFyayB0aGUgdkNQVXMuIFdlIG11c3QgZW5zdXJlIHRo
ZQ0KS1ZNIHJlc2V0cyB0aGUgS1ZNIFZDUFUgc3RhdGUgYXMgd2VsbC4gSGVuY2UsIG5vdCBhIGZp
eCBidXQgYSBjaGFuZ2Ugd2hpY2gNCmlzIHJlcXVpcmVkIGluIGNvbnRleHQgdG8gdGhpcyBwYXRj
aC1zZXQuDQoNCg0KPiAgTWF5YmUganVzdCBhIHNsaWdodCBjaGFuZ2UgdG8gc2F5ICJXaGVuIEtW
TSBwYXJraW5nIGlzIGltcGxlbWVudGVkIGZvcg0KPiAgQVJNLi4uIiBpZiBzby4NCg0KU3VyZS4N
Cg0KPiAgDQo+ICA+DQo+ICA+IFNpZ25lZC1vZmYtYnk6IEplYW4tUGhpbGlwcGUgQnJ1Y2tlciA8
amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPg0KPiAgPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0
YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4gID4gLS0tDQo+ICA+ICB0YXJnZXQvYXJtL2t2
bS5jIHwgNyArKysrKysrDQo+ICA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+
ICA+DQo+ICA+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2t2bS5jIGIvdGFyZ2V0L2FybS9rdm0u
YyBpbmRleA0KPiAgPiAxMTIxNzcxYzRhLi43YWNkODNjZTY0IDEwMDY0NA0KPiAgPiAtLS0gYS90
YXJnZXQvYXJtL2t2bS5jDQo+ICA+ICsrKyBiL3RhcmdldC9hcm0va3ZtLmMNCj4gID4gQEAgLTk4
MCw2ICs5ODAsNyBAQCB2b2lkIGt2bV9hcm1fY3B1X3Bvc3RfbG9hZChBUk1DUFUgKmNwdSkNCj4g
IHZvaWQNCj4gID4ga3ZtX2FybV9yZXNldF92Y3B1KEFSTUNQVSAqY3B1KSAgew0KPiAgPiAgICAg
IGludCByZXQ7DQo+ICA+ICsgICAgQ1BVU3RhdGUgKmNzID0gQ1BVKGNwdSk7DQo+ICA+DQo+ICA+
ICAgICAgLyogUmUtaW5pdCBWQ1BVIHNvIHRoYXQgYWxsIHJlZ2lzdGVycyBhcmUgc2V0IHRvDQo+
ICA+ICAgICAgICogdGhlaXIgcmVzcGVjdGl2ZSByZXNldCB2YWx1ZXMuDQo+ICA+IEBAIC0xMDAx
LDYgKzEwMDIsMTIgQEAgdm9pZCBrdm1fYXJtX3Jlc2V0X3ZjcHUoQVJNQ1BVICpjcHUpDQo+ICA+
ICAgICAgICogZm9yIHRoZSBzYW1lIHJlYXNvbiB3ZSBkbyBzbyBpbiBrdm1fYXJjaF9nZXRfcmVn
aXN0ZXJzKCkuDQo+ICA+ICAgICAgICovDQo+ICA+ICAgICAgd3JpdGVfbGlzdF90b19jcHVzdGF0
ZShjcHUpOw0KPiAgPiArDQo+ICA+ICsgICAgLyoNCj4gID4gKyAgICAgKiBFbnN1cmUgd2UgY2Fs
bCBrdm1fYXJjaF9wdXRfcmVnaXN0ZXJzKCkuIFRoZSB2Q1BVIGlzbid0IG1hcmtlZCBkaXJ0eSBp
Zg0KPiAgPiArICAgICAqIGl0IHdhcyBwYXJrZWQgaW4gS1ZNIGFuZCBpcyBub3cgYm9vdGluZyBm
cm9tIGEgUFNDSSBDUFVfT04gY2FsbC4NCj4gID4gKyAgICAgKi8NCj4gID4gKyAgICBjcy0+dmNw
dV9kaXJ0eSA9IHRydWU7DQo+ICA+ICB9DQo+ICA+DQo+ICA+ICB2b2lkIGt2bV9hcm1fY3JlYXRl
X2hvc3RfdmNwdShBUk1DUFUgKmNwdSkNCj4gIA0KPiAgQWxzbyBhYm92ZSBteSBwYXkgZ3JhZGUs
IGJ1dCBhcm1fc2V0X2NwdV9vbl9hc3luY193b3JrKCkgd2hpY2ggc2VlbXMNCj4gIHRvIGJlIHdo
YXQgY2FsbHMgdGhlIENQVSByZXNldCB5b3UgcmVmZXIgdG8gZG9lcyBhIGJ1bmNoIG9mIENQVSBy
ZWdpc3RlciBhbmQNCj4gIHN0YXRlIHNldHRpbmcgaW5jbHVkaW5nIHRoZSBwb3dlciBzdGF0ZSBz
ZXR0aW5nIHRoYXQgeW91IG1lbnRpb24uDQo+ICBXb3VsZCB0aGUgdmNwdV9kaXJ0eSBiZSBiZXR0
ZXIgdG8gZ28gdGhlcmU/DQoNCg0KTWF5YmUgd2UgY2FuLiBMZXQgbWUgY3Jvc3MgdmVyaWZ5IHRo
aXMuDQoNCg0KVGhhbmtzDQpTYWxpbC4NCg0KPiAgDQo+ICBUaGFua3MsDQo+ICBOaWNrDQo=
