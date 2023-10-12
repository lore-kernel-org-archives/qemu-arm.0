Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp984682ejc;
        Thu, 12 Oct 2023 10:54:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKV2MGVE2wnjCBI7fWYYzi/ttLhTgyUbmw3pKSkrD/3FPxRbJsKlGHk/kHZxVQUWmCGYJI
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id q9-20020a7bce89000000b00402f07c4b48mr21066019wmj.28.1697133290119;
        Thu, 12 Oct 2023 10:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697133290; cv=none;
        d=google.com; s=arc-20160816;
        b=1Bn5wFgeVWVQHwZVIpAvJ4jwZv0SxRZJoo4TIDGiccJzE4GRYxGZKyB5huSvQM2Jsv
         dspg+C+77ibnFUkLNTHasI/GznvluV/TC3/FgIQ4oQ12dYvR7ly/ot1Ev7hnnBAYlsfI
         o/S8DVzWy8Jap9US/fBdxd+B1/3r5f9qBRh9qMJvE/NahKdsTijbZmQBQ0SBdB3RTQzB
         +UU/OhueZNFUUoyZKa5/Rlw6NufwQMbNOUjSe637utSP8eY77q+wPGFZ6kHo7amUXeBv
         7jFuKS1KLZssPwgLxxb5O1gxLzyD6iZJ3BGjxp3bsLLnhC9LfYr3HM6MvTL7lUdfvVuM
         bJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=pN3AH58b4H1FFW4y9LuS2Qskgybg3voeoDFe4temBGk=;
        fh=ZjTtZiNk+POcRAG+KIQ4R4RZ6OYYFsH/NlpZVY2NOYE=;
        b=ewAIaVNnP/HWsOSqfsk543g07mPOez+4nDiGzSKaiKH7oVX9u5yuLcphyY44niC8Ur
         9SnG0cw7MyiIOmMiUc8APT0D9AbTYhcJkBYerbHspnukALuLT7NpwFxsZ6VMwFEPCikB
         syDvrXtMRP4d9k6opw8CCKY9DZRpFjk0PvnW8jcFuwhNTAkP0n9SUUYrV/cdErAtAOKf
         iR3dxfn/tefLNd3p/6T6Pz58g+AszOCLoJV9/5rpB0rosjWFPN+n8KpJ+BqQVpDX65R9
         BMZyOL8UI7y58kYwveUNEAopOVJ7uvHKjtAA1KOe6S51f91BQpMJS1HLnrKtpjTctE+e
         GruA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x10-20020a05600c188a00b003fe30eeb72fsi176958wmp.206.2023.10.12.10.54.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 10:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100004.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5y0C3t55z6K6Hw;
	Fri, 13 Oct 2023 01:52:43 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 18:54:47 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Thu, 12 Oct 2023 18:54:47 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Miguel Luis <miguel.luis@oracle.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, Marc Zyngier <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Richard
 Henderson" <richard.henderson@linaro.org>, "imammedo@redhat.com"
	<imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, Karl Heubaum <karl.heubaum@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: RE: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Topic: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Index: AQHZ8GD5tXnhHWBXpU+yNvnWwxAS6rBGajKAgAAcCwA=
Date: Thu, 12 Oct 2023 17:54:47 +0000
Message-ID: <3b1e102f20be420eb43d394d713e81f9@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <BBD0C802-A71B-473E-A7E3-FDA5D0674D49@oracle.com>
In-Reply-To: <BBD0C802-A71B-473E-A7E3-FDA5D0674D49@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.35.158]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: Yc6SEwHyxSxf

SGkgTWlndWVsLA0KDQo+IEZyb206IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29t
Pg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxMiwgMjAyMyA2OjAyIFBNDQo+IFRvOiBTYWxp
bCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgTWFyYyBaeW5naWVyDQo+IDxtYXpAa2VybmVsLm9y
Zz47IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsgSm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRo
YW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgbHBpZXJhbGlzaUBrZXJuZWwub3JnOyBQZXRlciBNYXlk
ZWxsDQo+IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBSaWNoYXJkIEhlbmRlcnNvbg0KPiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IGltYW1tZWRvQHJlZGhhdC5jb207DQo+IGFu
ZHJldy5qb25lc0BsaW51eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207IHBoaWxtZEBsaW5hcm8ub3Jn
Ow0KPiBlcmljLmF1Z2VyQHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgYXJkYkBrZXJuZWwu
b3JnOw0KPiBvbGl2ZXIudXB0b25AbGludXguZGV2OyBwYm9uemluaUByZWRoYXQuY29tOyBtc3RA
cmVkaGF0LmNvbTsNCj4gZ3NoYW5AcmVkaGF0LmNvbTsgcmFmYWVsQGtlcm5lbC5vcmc7IGJvcm50
cmFlZ2VyQGxpbnV4LmlibS5jb207DQo+IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFy
bWxpbnV4Lm9yZy51azsNCj4gZGFycmVuQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9z
LmFtcGVyZWNvbXB1dGluZy5jb207DQo+IHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBL
YXJsIEhldWJhdW0gPGthcmwuaGV1YmF1bUBvcmFjbGUuY29tPjsNCj4gc2FsaWwubWVodGFAb3Bu
c3JjLm5ldDsgemh1a2VxaWFuIDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5n
DQo+IChDKSA8d2FuZ3hpb25nZmVuZzJAaHVhd2VpLmNvbT47IHdhbmd5YW5hbiAoWSkgPHdhbmd5
YW5hbjU1QGh1YXdlaS5jb20+Ow0KPiBqaWFrZXJuZWwyQGdtYWlsLmNvbTsgbWFvYmlib0Bsb29u
Z3Nvbi5jbjsgbGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJG
QyBWMiAwMC8zN10gU3VwcG9ydCBvZiBWaXJ0dWFsIENQVSBIb3RwbHVnIGZvciBBUk12OA0KPiBB
cmNoDQo+IA0KPiBIaSBTYWxpbCwNCj4gDQo+ID4gT24gMjYgU2VwIDIwMjMsIGF0IDEwOjAzLCBT
YWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBbICpS
RVBFQVQ6IFNlbnQgcGF0Y2hlcyBnb3QgaGVsZCBhdCBpbnRlcm5hbCBzZXJ2ZXIgeWVzdGVyZGF5
KiBdDQo+ID4NCj4gPiBQUk9MT0dVRQ0KPiA+ID09PT09PT09DQoNClsuLi5dDQoNCg0KPiBUZXN0
ZWQgb24gT3JhY2xlIHBsYXRmb3JtcyB3aXRoIEFtcGVyZSBwcm9jZXNzb3JzLg0KPiB2Q1BVIGhv
dHBsdWcvdW5wbHVnIGZlYXR1cmVzIGFsb25nIFZNIGxpdmUgbWlncmF0aW9uLg0KPiANCj4gUGxl
YXNlIGZlZWwgZnJlZSB0byBhZGQsDQo+IFRlc3RlZC1ieTogTWlndWVsIEx1aXMgPG1pZ3VlbC5s
dWlzQG9yYWNsZS5jb20+DQoNClRoaXMgaXMgYSBncmVhdCBoZWxwLg0KDQpNYW55IHRoYW5rcyBm
b3IgeW91ciBwZXJzaXN0ZW50IGVmZm9ydHMgaW4gdGhlIHBhc3QgZmV3IG1vbnRocy4NCkl0IGhh
cyByZWFsbHkgaGVscGVkIGluIGV4cGVkaXRpbmcgZml4ZXMsIHJlZHVjaW5nIG1hbnkgbWFqb3IN
CmJ1Z3MgYW5kIGFsc28gaGVscGluZyBpbiBUQ0cgcGFydC4gUmVhbGx5IGFwcHJlY2lhdGUgaXQh
DQoNCldpbGwgbG9vayBmb3J3YXJkIHRvIGNvbGxhYm9yYXRlIHRvIGZpeCB0aGUgVENHIHBhcnQg
bmV4dC4NCg0KQ2hlZXJzDQpTYWxpbC4NCg0KDQo=
