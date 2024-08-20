Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp390781njx;
        Tue, 20 Aug 2024 09:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV78zhjhK6q5pzl+JKmi/S5D7ZC6rLgsU3mIWEJN+498JogVn5JBULBdi3f+TqW+QCsl8kdKOahMXFRIw==@linaro.org
X-Google-Smtp-Source: AGHT+IG7cS2VyBAFKyaRO90UjXiyP34yp9M+MNLUIYsd+ppfJSK/3PS9BiuYh50+IzBkawVVigfw
X-Received: by 2002:a5d:5f95:0:b0:36b:d21e:bf85 with SMTP id ffacd0b85a97d-371c605ffd8mr2375424f8f.51.1724172044761;
        Tue, 20 Aug 2024 09:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724172044; cv=none;
        d=google.com; s=arc-20160816;
        b=GJS98xYSmtGaMXrclZ9FFnzo2uVX0AouYwzD4aZ75y8mzMo3lzvy7cecg2rZKq+2KJ
         Eaun6ntJSHKP7cH7W7uToR3kFVmIoiitujjz1vS/QypyRNvdVJmRblOrxwiEw2ZZw4XU
         r1SoH5hnxUvwAFXtOUex7ULboQE0Z3jogRThSx/B2nYAf7DQ4IT+CoU6kRSiIyZoxM1i
         6bDJ64lt00X35Z8z04ffPhUIxrzMthtWbxtp2gSmefPf2KiErh8a8MBO9g3678fpIM2M
         XicrqSe2FQgtxyVPcO1pHLJWB1NnpVJhbFIMelvFymCDapRT7UYjYKrqJdzjaTV0tI8j
         i9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=emvrgnhiOFSHTnFZ8XAgMGkJJL4X6FgZPybg6KU4xDg=;
        fh=IcghoZT+iwDwnUWe0/8u2lfgCRl3Js+UrcNMjs/i9hE=;
        b=bcsTkClNF/KbD/0Z/RmVSFOZNI++kM5I8dO1M8u6+xMpr1iDFFNfTCJELL3DPDVea0
         iG3e0XIad0ySBEnAsWMj3g/FISwppHbYTunCMgztb3u7ujcWZY4J+NcfsRslLsyAPHTm
         ABO+1/KZlavSBfTV9EpjZLyZSTSImTF+1IWhTyWJg5YMrjxabj5EM709mbF/6yQyjWLE
         CZR/v5pPTI7Yb/COIGyghzUvZ0j7vcCxMbo6Y/9TNyEPyJdt/qqf1si8ZeU6b8NwtB6I
         1oRlAUjDvHo9usOfcgVaIUBGy4xtLjdFO3V53lMOtlFSGIO7O2NOuiArMLfN7wiBuRcP
         5KHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-371898de3fdsi5181778f8f.934.2024.08.20.09.40.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 09:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WpFVW40dXz6FGpJ;
	Wed, 21 Aug 2024 00:37:07 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A5E9140C98;
	Wed, 21 Aug 2024 00:40:43 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 17:40:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Tue, 20 Aug 2024 17:40:43 +0100
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
Thread-Index: AQHaveuckEaR/Tp4NUKcalC/yUyS9LIksGYAgAo1aXCAALcOgIABH0kA
Date: Tue, 20 Aug 2024 16:40:42 +0000
Message-ID: <1252c2d35b3e40ed84d5d5ae454878a7@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<20240613233639.202896-18-salil.mehta@huawei.com>
	<51dc0813-7dc9-4927-a24b-bd718be54e46@redhat.com>
	<6b435c1f2b934867b8d82850d6d866c6@huawei.com>
 <9b7582f0-8149-4bf0-a1aa-4d4fe0d35e70@redhat.com>
In-Reply-To: <9b7582f0-8149-4bf0-a1aa-4d4fe0d35e70@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.151.47]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: /Cmw9A07J7b5

PiAgRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gIFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyMCwgMjAyNCAxOjA2IEFNDQo+ICBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRh
QGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+ICBxZW11LWFybUBub25nbnUu
b3JnOyBtc3RAcmVkaGF0LmNvbQ0KPiAgDQo+ICBIaSBTYWxpbCwNCj4gIA0KPiAgT24gOC8xOS8y
NCAxMDoyMSBQTSwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ICA+PiAgIEZyb206IEdhdmluIFNoYW4g
PGdzaGFuQHJlZGhhdC5jb20+DQo+ICA+PiAgIFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAxMywgMjAy
NCAyOjE3IEFNDQo+ICA+PiAgIFRvOiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gID4+ICAgcWVtdS1hcm1Abm9uZ251Lm9yZzsg
bXN0QHJlZGhhdC5jb20NCj4gID4+DQo+ICA+PiAgIE9uIDYvMTQvMjQgOTozNiBBTSwgU2FsaWwg
TWVodGEgd3JvdGU6DQo+ICA+PiAgID4gRHVyaW5nIGBtYWNodmlydF9pbml0KClgLCBRT00gQVJN
Q1BVIG9iamVjdHMgYXJlIHByZS1jcmVhdGVkIGFsb25nDQo+ICA+PiAgID4gd2l0aCB0aGUgY29y
cmVzcG9uZGluZyBLVk0gdkNQVXMgaW4gdGhlIGhvc3QgZm9yIGFsbCBwb3NzaWJsZSB2Q1BVcy4N
Cj4gID4+ICAgPiBUaGlzIGlzIG5lY2Vzc2FyeSBkdWUgdG8gdGhlIGFyY2hpdGVjdHVyYWwgY29u
c3RyYWludCB0aGF0IEtWTQ0KPiAgPj4gICA+IHJlc3RyaWN0cyB0aGUgZGVmZXJyZWQgY3JlYXRp
b24gb2YgS1ZNIHZDUFVzIGFuZCBWR0lDDQo+ICA+PiAgID4gaW5pdGlhbGl6YXRpb24vc2l6aW5n
IGFmdGVyIFZNIGluaXRpYWxpemF0aW9uLiBIZW5jZSwgVkdJQyBpcyBwcmUtc2l6ZWQNCj4gIHdp
dGgNCj4gID4+ICAgcG9zc2libGUgdkNQVXMuDQo+ICA+PiAgID4NCj4gID4+ICAgPiBBZnRlciB0
aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIG1hY2hpbmUgaXMgY29tcGxldGUsIHRoZSBkaXNhYmxl
ZA0KPiAgPj4gICA+IHBvc3NpYmxlIEtWTSB2Q1BVcyBhcmUgcGFya2VkIGluIHRoZSBwZXItdmly
dC1tYWNoaW5lIGxpc3QNCj4gID4+ICAgPiAia3ZtX3BhcmtlZF92Y3B1cywiIGFuZCB3ZSByZWxl
YXNlIHRoZSBRT00gQVJNQ1BVIG9iamVjdHMgZm9yDQo+ICB0aGUNCj4gID4+ICAgPiBkaXNhYmxl
ZCB2Q1BVcy4gVGhlc2Ugd2lsbCBiZSByZS1jcmVhdGVkIHdoZW4gdGhlIHZDUFUgaXMNCj4gIGhv
dHBsdWdnZWQNCj4gID4+ICAgPiBhZ2Fpbi4gVGhlIFFPTSBBUk1DUFUgb2JqZWN0IGlzIHRoZW4g
cmUtYXR0YWNoZWQgdG8gdGhlDQo+ICBjb3JyZXNwb25kaW5nDQo+ICA+PiAgIHBhcmtlZCBLVk0g
dkNQVS4NCj4gID4+ICAgPg0KPiAgPj4gICA+IEFsdGVybmF0aXZlbHksIHdlIGNvdWxkIGhhdmUg
Y2hvc2VuIG5vdCB0byByZWxlYXNlIHRoZSBRT00gQ1BVDQo+ICBvYmplY3RzDQo+ICA+PiAgID4g
YW5kIGtlcHQgcmV1c2luZyB0aGVtLiBUaGlzIGFwcHJvYWNoIG1pZ2h0IHJlcXVpcmUgc29tZQ0K
PiAgbW9kaWZpY2F0aW9ucw0KPiAgPj4gICA+IHRvIHRoZSBgcWRldmljZV9hZGQoKWAgaW50ZXJm
YWNlIHRvIHJldHJpZXZlIHRoZSBvbGQgQVJNQ1BVIG9iamVjdA0KPiAgPj4gICA+IGluc3RlYWQg
b2YgY3JlYXRpbmcgYSBuZXcgb25lIGZvciB0aGUgaG90cGx1ZyByZXF1ZXN0Lg0KPiAgPj4gICA+
DQo+ICA+PiAgID4gRWFjaCBvZiB0aGVzZSBhcHByb2FjaGVzIGhhcyBpdHMgb3duIHByb3MgYW5k
IGNvbnMuIFRoaXMgcHJvdG90eXBlDQo+ICA+PiAgID4gdXNlcyB0aGUgZmlyc3QgYXBwcm9hY2gg
KHN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lISkuDQo+ICA+PiAgID4NCj4gID4+ICAgPiBDby1kZXZl
bG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFAaHVhd2VpLmNvbT4NCj4gID4+ICAgPiBT
aWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+DQo+ICA+PiAg
ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+
ICA+PiAgID4gLS0tDQo+ICA+PiAgID4gICBody9hcm0vdmlydC5jIHwgMzIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gID4+ICAgPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspDQo+ICA+PiAgID4NCj4gID4+ICAgPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQu
YyBiL2h3L2FybS92aXJ0LmMgaW5kZXgNCj4gID4+ICAgPiA5ZDMzZjMwYTZhLi5hNzJjZDNiMjBk
IDEwMDY0NA0KPiAgPj4gICA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gID4+ICAgPiArKysgYi9o
dy9hcm0vdmlydC5jDQo+ICA+PiAgID4gQEAgLTIwNTAsNiArMjA1MCw3IEBAIHN0YXRpYyB2b2lk
DQo+ICB2aXJ0X2NwdV9wb3N0X2luaXQoVmlydE1hY2hpbmVTdGF0ZQ0KPiAgPj4gICAqdm1zLCBN
ZW1vcnlSZWdpb24gKnN5c21lbSkNCj4gID4+ICAgPiAgIHsNCj4gID4+ICAgPiAgICAgICBDUFVB
cmNoSWRMaXN0ICpwb3NzaWJsZV9jcHVzID0gdm1zLT5wYXJlbnQucG9zc2libGVfY3B1czsNCj4g
ID4+ICAgPiAgICAgICBpbnQgbWF4X2NwdXMgPSBNQUNISU5FKHZtcyktPnNtcC5tYXhfY3B1czsN
Cj4gID4+ICAgPiArICAgIE1hY2hpbmVTdGF0ZSAqbXMgPSBNQUNISU5FKHZtcyk7DQo+ICA+PiAg
ID4gICAgICAgYm9vbCBhYXJjaDY0LCBzdGVhbF90aW1lOw0KPiAgPj4gICA+ICAgICAgIENQVVN0
YXRlICpjcHU7DQo+ICA+PiAgID4gICAgICAgaW50IG47DQo+ICA+PiAgID4gQEAgLTIxMTEsNiAr
MjExMiwzNyBAQCBzdGF0aWMgdm9pZA0KPiAgdmlydF9jcHVfcG9zdF9pbml0KFZpcnRNYWNoaW5l
U3RhdGUNCj4gID4+ICAgKnZtcywgTWVtb3J5UmVnaW9uICpzeXNtZW0pDQo+ICA+PiAgID4gICAg
ICAgICAgICAgICB9DQo+ICA+PiAgID4gICAgICAgICAgIH0NCj4gID4+ICAgPiAgICAgICB9DQo+
ICA+PiAgID4gKw0KPiAgPj4gICA+ICsgICAgaWYgKGt2bV9lbmFibGVkKCkgfHwgdGNnX2VuYWJs
ZWQoKSkgew0KPiAgPj4gICA+ICsgICAgICAgIGZvciAobiA9IDA7IG4gPCBwb3NzaWJsZV9jcHVz
LT5sZW47IG4rKykgew0KPiAgPj4gICA+ICsgICAgICAgICAgICBjcHUgPSBxZW11X2dldF9wb3Nz
aWJsZV9jcHUobik7DQo+ICA+PiAgID4gKw0KPiAgPj4gICA+ICsgICAgICAgICAgICAvKg0KPiAg
Pj4gICA+ICsgICAgICAgICAgICAgKiBOb3csIEdJQyBoYXMgYmVlbiBzaXplZCB3aXRoIHBvc3Np
YmxlIENQVXMgYW5kIHdlIGRvbnQNCj4gID4+ICAgcmVxdWlyZQ0KPiAgPj4gICA+ICsgICAgICAg
ICAgICAgKiBkaXNhYmxlZCB2Q1BVIG9iamVjdHMgdG8gYmUgcmVwcmVzZW50ZWQgaW4gdGhlIFFP
TS4NCj4gIFJlbGVhc2UNCj4gID4+ICAgdGhlDQo+ICA+PiAgID4gKyAgICAgICAgICAgICAqIGRp
c2FibGVkIEFSTUNQVSBvYmplY3RzIGVhcmxpZXIgdXNlZCBkdXJpbmcgaW5pdCBmb3IgcHJlLQ0K
PiAgc2l6aW5nLg0KPiAgPj4gICA+ICsgICAgICAgICAgICAgKg0KPiAgPj4gICA+ICsgICAgICAg
ICAgICAgKiBXZSBmYWtlIHRvIHRoZSBndWVzdCB0aHJvdWdoIEFDUEkgYWJvdXQgdGhlDQo+ICA+
PiAgIHByZXNlbmNlKF9TVEEuUFJFUz0xKQ0KPiAgPj4gICA+ICsgICAgICAgICAgICAgKiBvZiB0
aGVzZSBub24tZXhpc3RlbnQgdkNQVXMgYXQgVk1NL3FlbXUgYW5kIHByZXNlbnQNCj4gIHRoZXNl
DQo+ICA+PiAgIGFzDQo+ICA+PiAgID4gKyAgICAgICAgICAgICAqIGRpc2FibGVkIHZDUFVzKF9T
VEEuRU5BPTApIHNvIHRoYXQgdGhleSBjYW50IGJlIHVzZWQuDQo+ICBUaGVzZQ0KPiAgPj4gICB2
Q1BVcw0KPiAgPj4gICA+ICsgICAgICAgICAgICAgKiBjYW4gYmUgbGF0ZXIgYWRkZWQgdG8gdGhl
IGd1ZXN0IHRocm91Z2ggaG90cGx1ZyBleGNoYW5nZXMNCj4gID4+ICAgd2hlbg0KPiAgPj4gICA+
ICsgICAgICAgICAgICAgKiBBUk1DUFUgb2JqZWN0cyBhcmUgY3JlYXRlZCBiYWNrIGFnYWluIHVz
aW5nICdkZXZpY2VfYWRkJw0KPiAgUU1QDQo+ICA+PiAgID4gKyAgICAgICAgICAgICAqIGNvbW1h
bmQuDQo+ICA+PiAgID4gKyAgICAgICAgICAgICAqLw0KPiAgPj4gICA+ICsgICAgICAgICAgICAv
Kg0KPiAgPj4gICA+ICsgICAgICAgICAgICAgKiBSRkM6IFF1ZXN0aW9uOiBPdGhlciBhcHByb2Fj
aCBjb3VsZCd2ZSBiZWVuIHRvIGtlZXAgdGhlbQ0KPiAgPj4gICBmb3JldmVyDQo+ICA+PiAgID4g
KyAgICAgICAgICAgICAqIGFuZCByZWxlYXNlIGl0IG9ubHkgb25jZSB3aGVuIHFlbXUgZXhpdHMg
YXMgcGFydCBvZiBmaW5hbGl6ZQ0KPiAgb3INCj4gID4+ICAgPiArICAgICAgICAgICAgICogd2hl
biBuZXcgdkNQVSBpcyBob3RwbHVnZ2VkLiBJbiB0aGUgbGF0ZXIgb2xkIGNvdWxkIGJlDQo+ICBy
ZWxlYXNlZA0KPiAgPj4gICA+ICsgICAgICAgICAgICAgKiBmb3IgdGhlIG5ld2x5IGNyZWF0ZWQg
b2JqZWN0IGZvciB0aGUgc2FtZSB2Q1BVPw0KPiAgPj4gICA+ICsgICAgICAgICAgICAgKi8NCj4g
ID4+ICAgPiArICAgICAgICAgICAgaWYgKCFxZW11X2VuYWJsZWRfY3B1KGNwdSkpIHsNCj4gID4+
ICAgPiArICAgICAgICAgICAgICAgIENQVUFyY2hJZCAqY3B1X3Nsb3Q7DQo+ICA+PiAgID4gKyAg
ICAgICAgICAgICAgICBjcHVfc2xvdCA9IHZpcnRfZmluZF9jcHVfc2xvdChtcywgY3B1LT5jcHVf
aW5kZXgpOw0KPiAgPj4gICA+ICsgICAgICAgICAgICAgICAgY3B1X3Nsb3QtPmNwdSA9IE5VTEw7
DQo+ICA+PiAgID4gKyAgICAgICAgICAgICAgICBvYmplY3RfdW5yZWYoT0JKRUNUKGNwdSkpOw0K
PiAgPj4gICA+ICsgICAgICAgICAgICB9DQo+ICA+PiAgID4gKyAgICAgICAgfQ0KPiAgPj4gICA+
ICsgICAgfQ0KPiAgPj4gICA+ICAgfQ0KPiAgPj4NCj4gID4+ICAgSXQncyBwcm9iYWJseSBoYXJk
IHRvIGtlZXAgdGhvc2UgQVJNQ1BVIG9iamVjdHMgZm9yZXZlci4gRmlyc3Qgb2YgYWxsLA0KPiAg
b25lDQo+ICA+PiAgIHZDUFUgY2FuIGJlIGhvdC1hZGRlZCBmaXJzdCBhbmQgdGhlbiBob3QtcmVt
b3ZlZCBhZnRlcndhcmRzLiBXaXRoDQo+ICB0aG9zZQ0KPiAgPj4gICBBUk1DUFUgb2JqZWN0cyBr
ZXB0IGZvcmV2ZXIsIHRoZSBzeW50YXggb2YgJ2RldmljZV9hZGQnIGFuZA0KPiAgJ2RldmljZV9k
ZWwnDQo+ICA+PiAgIGJlY29tZSBicm9rZW4gYXQgbGVhc3QuDQo+ICA+DQo+ICA+IEkgaGFkIHBy
b3RvdHlwZWQgYm90aCBhcHByb2FjaGVzIDQgeWVhcnMgYmFjay4gWWVzLCBpbnRlcmZhY2UgcHJv
YmxlbQ0KPiAgPiB3aXRoIGRldmljZV9hZGQgd2FzIHNvbHZlZCBieSBhIHRyaWNrIG9mIGtlZXBp
bmcgdGhlIG9sZCB2Q1BVIG9iamVjdA0KPiAgPiBhbmQgb24gZGV2aWNlX2FkZCBpbnN0ZWFkIG9m
IGNyZWF0aW5nIGEgbmV3IHZDUFUgb2JqZWN0IHdlIGNvdWxkIHVzZQ0KPiAgPiB0aGUgb2xkIHZD
UFUgb2JqZWN0IGFuZCB0aGVuIGNhbGwgcWRldl9yZWFsaXplKCkgb24gaXQuDQo+ICA+DQo+ICA+
IEJ1dCBiaWdnZXIgcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCBvZiBtaWdyYXRp
b24uIE9ubHkNCj4gID4gcmVhbGl6ZWQgb2JqZWN0cyBoYXZlIHN0YXRlIHRvIGJlIG1pZ3JhdGVk
LiBTbyBpdCBtaWdodCBsb29rIGNsZWFuZXINCj4gID4gb24gb25lIGFzcGVjdCBidXQgaGFkIGl0
cyBvd24gaXNzdWVzLg0KPiAgPg0KPiAgPiBJIHRoaW5rIEkgZGlkIHNoYXJlIGEgcHJvdG90eXBl
IG9mIHRoaXMgd2l0aCBJZ29yIHdoaWNoIGhlIHdhcyBub3QgaW4NCj4gID4gYWdyZWVtZW50IHdp
dGggYW5kIHdhbnRlZCB2Q1BVIG9iamVjdHMgdG8gYmUgZGVzdHJveWVkIGxpa2UgaW4geDg2Lg0K
PiAgPiBIZW5jZSwgd2Ugc3R1Y2sgd2l0aCB0aGUgY3VycmVudCBhcHByb2FjaC4NCj4gID4NCj4g
IA0KPiAgTWlncmF0aW9uIG5lZWRuJ3QgdG8gYmUgdGhlIGJsb2NrZXIgbmVjZXNzYXJpbHkuIEZv
ciB0aG9zZSBzdGF0ZXMgb2YgdkNQVXMsDQo+ICB3aGljaCBoYXZlIGJlZW4gaW5zdGFudGlhdGVk
IGFuZCBub3QgcmVhbGl6ZWQgeWV0LCB0aG9zZSBzdGF0ZXMgY2FuIGJlDQo+ICBtb3ZlZCBhcm91
bmQgdG8gYmUgbWFuYWdlZCB1bmRlciBhbm90aGVyIG1pZ3JhdGFibGUgb2JqZWN0IChlLmcuDQo+
ICBNYWNoaW5lU3RhdGUpLiBJbiB0aGlzIHdheSwgdGhvc2UgdkNQVSBzdGF0ZXMgY2FuIGJlIG1p
Z3JhdGVkIHRvZ2V0aGVyDQo+ICB3aXRoIE1hY2hpbmVTdGF0ZS4gDQoNCg0KTWlncmF0aW9uIHdh
cyBhIGJsb2NrZXIuLCBJJ2xsIGhhdmUgdG8gbXVkZGxlIG15IGhlYWQgYWdhaW4gdG8gZ2FpbiBi
YWNrIGV2ZXJ5DQpjb250ZXh0IG9mIHRoYXQgd2hpY2ggYXQgdGhpcyBqdW5jdHVyZSBzZWVtcyB1
bm5lY2Vzc2FyeS4NCg0KDQpIb3dldmVyLCBpdCBzb3VuZHMgc3RyYW5nZSB0byBtZSB0byBoYXZl
IHZDUFUgb2JqZWN0cw0KPiAgaW5zdGFudGlhdGVkLCBidXQgdW5yZWFsaXplZCB1bnRpbCBob3Qt
YWRkIGlzIHRyaWdnZXJlZC4NCj4gIEl0J3Mgbm90IHdoYXQgUU9NIHN1cHBvc2VzIHRvIHN1cHBv
cnQuDQoNCg0KWWVzLCBidXQgZm9yIHVzZXIgaXQgZG9lcyBub3QgbWF0dGVyIGFzIGl0IGlzIGFu
IGludGVybmFsIGltcGxlbWVudGF0aW9uIGFuZA0Kd2UgZG9u4oCZdCBoYXZlIHRvIGV4cG9zZSB0
aGF0IHRvIHRoZSBleHRlcm5hbCB1c2VyIGVpdGhlci4gSnVzdCBhIHJlcHJlc2VudGF0aW9uLg0K
DQoNCj4gIA0KPiAgT2ssIEkgZG9uJ3QgcmVhbGl6ZSB4ODYgYWxzbyBmb2xsb3dzIHRoaXMgbW9k
ZWw6IGluc3RhbnRpYXRlIGhvdHBsdWdnYWJsZQ0KPiAgdkNQVXMgYW5kIGRlc3Ryb3kgdGhlbSBv
biBib290dXAuDQoNCg0KQ29ycmVjdCwgc28gd2UgaGF2ZSBub3cga2VwdCBpdCBjb25zaXN0ZW50
IHdpdGggeDg2IGJ1dCBvZiBjb3Vyc2Ugd2UgaGF2ZQ0KZmFrZSBzdGF0ZXMgZm9yIEFSTSBhcmNo
IHdoZW4gdkNQVXMgZG9u4oCZdCBleGlzdCBhbmQgdGhpcyBzdGF0ZSBJcyBub3QgbWlncmF0ZWQu
DQpBQ1BJIHBlcnNpc3RlbnQgc3RhdGUgZ2V0cyBpbml0aWFsaXplZCBhdCB0aGUgc3RhcnQgYnkg
dGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBjb2RlLg0KSGVuY2UsIHdoYXQgdkNQVSBzdGF0ZSB3
ZSBleHBvc2UgdG8ga2VybmVsIGR1cmluZyBRZW11IGluaXQgYW5kIGhvdCh1bilwbHVnDQpvcGVy
YXRpb25zIHZhcmllcy4NCg0KDQo+ICANCj4gID4NCj4gID4+ICAgVGhlIGlkZWFsIG1lY2hhbmlz
bSB3b3VsZCBiZSB0byBhdm9pZCBpbnN0YW5jaWF0aW5nIHRob3NlIEFSTUNQVSBvYmplY3RzDQo+
ICA+PiAgIGFuZCBkZXN0cm95aW5nIHRoZW0gc29vbi4gSSBkb24ndCBrbm93IGlmIG1zLT5wb3Nz
aWJsZV9jcHVzLT5jcHVzW10gY2FuDQo+ICA+PiAgIGZpdCBhbmQgaG93IG11Y2ggZWZmb3J0cyBu
ZWVkZWQuDQo+ICA+DQo+ICA+IFRoaXMgaXMgd2hhdCB3ZSBhcmUgZG9pbmcgbm93IGluIHRoZSBj
dXJyZW50IGFwcHJvYWNoLiBQbGVhc2UgcmVhZCB0aGUNCj4gID4gS1ZNRm9ydW0gc2xpZGVzIG9m
IDIwMjMgZm9yIG1vcmUgZGV0YWlscyBhbmQgdGhlIGNvdmVyIGxldHRlciBvZiBSRkMgVjMNCj4g
IGZvciBtb3JlIGRldGFpbHMuDQo+ICA+DQo+ICANCj4gIE15IHF1ZXN0aW9uIGhhcyBiZWVuIHBh
cnNlZCBpbiBhIHdyb25nIHdheS4gDQoNCk9oLiDwn5iKDQoNCk15IHF1ZXN0aW9uIHdhcyBpZiBp
dCdzIGRvYWJsZQ0KPiAgdG8gYXZvaWQgaW5zdGFudGlhdGluZyB2Q1BVIzEgb24gYm9vdHVwIHdo
ZW4gd2UgaGF2ZSBjb21tYW5kIGxpbmVzICctDQo+ICBjcHUgaG9zdCAtc21wIGNwdXM9MSxtYXhf
Y3B1cz0yJw0KPiAgYW5kIHJlbGVhc2UgaXQgaW4gbWFjaHZpcnRfaW5pdCgpLiBJbnN0ZWFkLCBt
cy0+cG9zc2libGVfY3B1cy0+Y3B1c1tdIGFyZQ0KPiAgcmV1c2VkIHRvIGNyZWF0ZQ0KPiAgR0lD
djMgYW5kIHZDUFUgZmlsZSBkZXNjcmlwdG9ycy4NCg0KDQpXZSBjcmVhdGUgUU9NIHZDUFUgb2Jq
ZWN0cyB0byBpbml0aWFsaXplIEtWTSB2Q1BVIG9iamVjdHMgaW4gaG9zdCBrZXJuZWwuDQphbmQg
b25seSBwZXJtYW5lbnRseSBwb3B1bGF0ZSB0aGUgJ3Bvc3NpYmxlX2NwdXMnIGxpc3QgZm9yIHRo
ZSByZWFsaXplZCB2Q1BVcy4NCldlIHJlbGVhc2UgdkNQVSBvYmplY3RzIGZvciBvdGhlciB2Q1BV
cyB3aGljaCB3aWxsIGJlIGhvdC1wbHVnZ2VkIGluIGZ1dHVyZS4gDQphbmQgb25seSBtYWtlIHRo
ZW4gcGFydCBvZiAncG9zc2libGVfY3B1cycgbGlzdCBhZnRlciB0aGV5IGdldCBwbHVnZ2VkIGFu
ZA0KcmVhbGl6ZWQuDQoNCg0KIEl0IGxvb2tzIGxpa2UgYSBjbGVhbiB3YXkgYXQgbGVhc3QuIFRo
ZXJlIG1heQ0KPiAgYmUgc2lnbmlmaWNhbnQgZWZmb3J0cyB0byByZXVzZSBtYy0+cG9zc2libGVf
Y3B1cy0+Y3B1c1tdLCBidXQgdkNQVSMxDQo+ICBvYmplY3QgaGFzIGVwaGVtZXJhbCBsaWZlIGN5
Y2xlLg0KPiAgSXQgbG9va3MgdW5uZWNlc3NhcnkgdG8gY3JlYXRlIHRoZSBlcGhlbWVyYWwgdkNQ
VSMxIG9iamVjdC4NCg0KSSBkb27igJl0IHVuZGVyc3RhbmQgdGhpcyBjbGVhcmx5LiBBcmUgIHlv
dSBzdWdnZXN0aW5nIHRvIHJldXNlIG9ubHkgc2luZ2xlDQp2Q1BVIG9iamVjdCB0byBpbml0aWFs
aXplIGFsbCBLVk0gdkNQVXMgbm90IHlldCBwbHVnZ2VkPyBJZiB5ZXMsIHRoZW4NCkknbSBub3Qg
c3VyZSB3aGF0IGRvIHdlIGdhaW4gaGVyZSBieSBhZGRpbmcgdGhpcyBjb21wbGV4aXR5PyBJdCBk
b2VzDQpub3QgY29uc3VtZSB0aW1lIG9yIHJlc291cmNlcyBiZWNhdXNlIHdlIGFyZSBub3QgcmVh
bGl6aW5nIGFueSBvZiB0aGVzZQ0KdkNQVSBvYmplY3QgaW4gYW55IGNhc2UuIA0KDQpUaGFua3MN
ClNhbGlsLg0KDQoNCj4gIA0KPiAgVGhhbmtzLA0KPiAgR2F2aW4NCj4gIA0KDQo=
