Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3354385ejc;
        Fri, 29 Sep 2023 09:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNFRFUpWbmC7KWvIv3oWsIztGJImHmizg0tPzjzRYQHEBSLRgMZ9qNwPNE4ljA8OrqvHPV
X-Received: by 2002:a5d:6e53:0:b0:324:8353:940e with SMTP id j19-20020a5d6e53000000b003248353940emr4058915wrz.34.1696003302603;
        Fri, 29 Sep 2023 09:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696003302; cv=none;
        d=google.com; s=arc-20160816;
        b=NNF3Lx69xuOT+QRrQSWJt156cckD+HgOqiIkpnYTIObs1RcIXn6RzjTf0Sd+mwiLbQ
         mtMru0AAPR0a+ujcFWL8YoF/dOWW9QH889lCW0kRk1MpD4G/wT39284TwGDjrVJQXtcO
         dWBz8gqmXor6+MZn0EMlWTKj2T9x847sVm6AeciGs4Tprzh+ionGyDxjJ95PyMoLC7cD
         14lF/gppebY5Pjg3XSmgLCuqMHUKp33o0c2qGzQxdzP9JrVSFUgN8KIoOlUm8rvh+2pl
         H+9FBGWs0Bmf0PJOwMS7hyi8SzgH2+kw3uH4arHmj7Yw28jyiKXVqEgE2DfeJ1dHSGOD
         BnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=J/NROZ0q8aFhxawrPXFvFLbw93xdGf02ENb5CCeMo+Q=;
        fh=JAq87W6Xz6xK/ErqMBJV5GYr0T4cJ3zSiVlGsuDdrsk=;
        b=kMEd42tirqpBa5RwiGv8PT9wktda1VFCpSy3IOdJrRtzf9R+TBwMp4DFTOPxUTVmWj
         J/bin4E/FUkOXN/sORCJ2zBZ+Ue0Urdm0oQdG7aAkYFKKrtlY2PwnUcEBWSBVb0vL2PC
         M0flTinBmdLeP0UnrGBLUrDUWW5RlcqQkqwAsEfAeiLDRrsaB68KAIQU5hsdKLj0IItt
         n1bt1YjYUu1N7o5Dz4dT8Axb3+JiGWS3OMeT+cYPPu25nFC6EqeZtAsYljIWMLBu0QVI
         nRKRPkR2Cxl/z7PIXXdIETHxlY09s6G8sywIiUdErRsNR2LCodwtJsal1SfSopD5bLsK
         /QVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k10-20020a5d524a000000b0031759ea1c67si9966292wrc.1040.2023.09.29.09.01.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 09:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxw6T0JsJz6K5wC;
	Sat, 30 Sep 2023 00:00:17 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 17:01:40 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 29 Sep 2023 17:01:40 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH 9/9] target/arm/kvm: Write CPU state back to KVM on reset
Thread-Topic: [PATCH 9/9] target/arm/kvm: Write CPU state back to KVM on reset
Thread-Index: AQHZ8tMXq6k82cIrbE+rfYyikSHqfLAxzxoAgAAnjNA=
Date: Fri, 29 Sep 2023 16:01:40 +0000
Message-ID: <12f6eddcb6a44fdda23a297bfdf83da2@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
	<20230929124304.13672-10-salil.mehta@huawei.com> <87pm21nivj.fsf@linaro.org>
In-Reply-To: <87pm21nivj.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.156.153]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: /r+hHEIKpG5n

PiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDI5LCAyMDIzIDM6NDAgUE0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxp
bC5tZWh0YUBodWF3ZWkuY29tPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFy
bUBub25nbnUub3JnOyBtYXpAa2VybmVsLm9yZzsgamVhbi0NCj4gcGhpbGlwcGVAbGluYXJvLm9y
ZzsgSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsNCj4gbHBp
ZXJhbGlzaUBrZXJuZWwub3JnOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7DQo+IHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc7IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0Bs
aW51eC5kZXY7DQo+IGRhdmlkQHJlZGhhdC5jb207IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1
Z2VyQHJlZGhhdC5jb207DQo+IG9saXZlci51cHRvbkBsaW51eC5kZXY7IHBib256aW5pQHJlZGhh
dC5jb207IG1zdEByZWRoYXQuY29tOw0KPiB3aWxsQGtlcm5lbC5vcmc7IGdzaGFuQHJlZGhhdC5j
b207IHJhZmFlbEBrZXJuZWwub3JnOw0KPiBsaW51eEBhcm1saW51eC5vcmcudWs7IGRhcnJlbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyB2
aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4ga2FybC5oZXViYXVtQG9yYWNsZS5jb207
IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7DQo+IHpodWtl
cWlhbiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykNCj4gPHdhbmd4
aW9uZ2ZlbmcyQGh1YXdlaS5jb20+OyB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWku
Y29tPjsNCj4gamlha2VybmVsMkBnbWFpbC5jb207IG1hb2JpYm9AbG9vbmdzb24uY247IGxpeGlh
bmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtDQo+IDxsaW51eGFybUBodWF3ZWkuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDkvOV0gdGFyZ2V0L2FybS9rdm06IFdyaXRlIENQVSBzdGF0ZSBi
YWNrIHRvIEtWTSBvbg0KPiByZXNldA0KPiANCj4gDQo+IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0
YUBodWF3ZWkuY29tPiB3cml0ZXM6DQo+IA0KPiA+IEZyb206IEplYW4tUGhpbGlwcGUgQnJ1Y2tl
ciA8amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPg0KPiA+DQo+ID4gV2hlbiBhIEtWTSB2Q1BVIGlz
IHJlc2V0IGZvbGxvd2luZyBhIFBTQ0kgQ1BVX09OIGNhbGwsIGl0cyBwb3dlciBzdGF0ZQ0KPiA+
IGlzIG5vdCBzeW5jaHJvbml6ZWQgd2l0aCBLVk0gYXQgdGhlIG1vbWVudC4gQmVjYXVzZSB0aGUg
dkNQVSBpcyBub3QNCj4gPiBtYXJrZWQgZGlydHksIHdlIG1pc3MgdGhlIGNhbGwgdG8ga3ZtX2Fy
Y2hfcHV0X3JlZ2lzdGVycygpIHRoYXQgd3JpdGVzDQo+ID4gdG8gS1ZNJ3MgTVBfU1RBVEUuIEZv
cmNlIG1wX3N0YXRlIHN5bmNocm9uaXphdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpl
YW4tUGhpbGlwcGUgQnJ1Y2tlciA8amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiANCj4gU2Vl
bXMgcmVhc29uYWJsZToNCj4gDQo+IFJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+DQoNClRoYW5rcw0KU2FsaWwuDQo=
