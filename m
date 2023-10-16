Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3485674ejc;
        Mon, 16 Oct 2023 14:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9tlP5NTYDnMV9ituXRykbCgQgMUveh22IEp0S8LmT9BtBRNxE9ygw//8/azymxhJUwxqo
X-Received: by 2002:a05:600c:4f15:b0:401:bdd7:49ae with SMTP id l21-20020a05600c4f1500b00401bdd749aemr304426wmq.18.1697492787317;
        Mon, 16 Oct 2023 14:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697492787; cv=none;
        d=google.com; s=arc-20160816;
        b=Oe7KKIMWnV+bUFfvyuGElV0hxjdXxJ5nzeOyRUT3tGXMa0JHA6Ob5erYvdkdwJOoNk
         Se/A+ilS06qd3sQj8sqDPc17UzoSow3Rc40rQS4ECOxFNlNRf7eBM6rPdty7n7VkXFJm
         rwSVKs8IoBAP0r6/A+1a7Y1/6adZcyvKkMc3NurpvPaSsW/vNGgkdtJE2BBBvylJ5LIx
         9MMdUiNQBgAC+8fAw2IpPpJYVZbT6fResXUyiJ7ZxNygT05Arhz/UwjCfow2V1y96k2U
         8PzQmhgeqHXaaxXs/9HBqFnSNkgdeGWQ/SeV7aO6lbn9CQU927/Wut+pJBRu78Jxl+va
         yorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=CZmS5WlLssY8qTzva60008Ep5zfCHyQXspxUY9bZiVM=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=tTQM160yIaQ3DUO/wbcQnDMQsQA7gO3/gQQyXVL6rG4aacKvV+b29RGk9p509XYmG/
         aRtgvj7Y6pJZ1WYBY9HmBM+mwAFBSPdjrmCPFL/bZ4NTMa4xSKKfSWJ7Sra+bAQ7c7NY
         xYxUmMFaoaxEtPSHTKfJznx/q2gvCNmA+PLTX61KdZ1cIzWhEIgr2phM/BHyddtniOCj
         I7+QxYuJ4EYuZ5fcHMqZxgL4ECEZbPE61wMq4ffyVKFS/vx92BF5g4G3Yl0M2NbB4i6P
         5FCmTvv7qd7d7Quh79zVWVFhDv2OPmqTcXdQ3YfazotMSeftD4TdHrHSGJuq18lydIDR
         59zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id c12-20020a05600c0acc00b00406e8ff403bsi3071998wmr.161.2023.10.16.14.46.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 14:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500003.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8VxM3MWhz6K6K4;
	Tue, 17 Oct 2023 05:44:07 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 22:46:25 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 22:46:25 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
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
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: RE: [PATCH RFC V2 14/37] arm/virt: Add cpu hotplug events to GED
 during creation
Thread-Topic: [PATCH RFC V2 14/37] arm/virt: Add cpu hotplug events to GED
 during creation
Thread-Index: AQHZ8GGUCDZ7UAtL0E+Up3q+ynu+4LAvXa2AgB21lfA=
Date: Mon, 16 Oct 2023 21:46:24 +0000
Message-ID: <f6508f4d86424959b72b8faa423e95a0@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-15-salil.mehta@huawei.com>
 <1e526a50-7001-a15b-79cb-e223048b52ce@redhat.com>
In-Reply-To: <1e526a50-7001-a15b-79cb-e223048b52ce@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: oVarj7JJf0uz

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIFNlcHRlbWJlciAyOCwgMjAyMyAyOjA0IEFNDQo+IFRvOiBTYWxpbCBNZWh0
YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1h
cm1Abm9uZ251Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJv
Lm9yZzsgSm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsg
bHBpZXJhbGlzaUBrZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hh
cmQuaGVuZGVyc29uQGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5q
b25lc0BsaW51eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBl
cmljLmF1Z2VyQHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgYXJkYkBrZXJuZWwub3JnOw0K
PiBvbGl2ZXIudXB0b25AbGludXguZGV2OyBwYm9uemluaUByZWRoYXQuY29tOyBtc3RAcmVkaGF0
LmNvbTsNCj4gcmFmYWVsQGtlcm5lbC5vcmc7IGJvcm50cmFlZ2VyQGxpbnV4LmlibS5jb207IGFs
ZXguYmVubmVlQGxpbmFyby5vcmc7DQo+IGxpbnV4QGFybWxpbnV4Lm9yZy51azsgZGFycmVuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb207DQo+IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IHZp
c2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsg
bWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsNCj4gemh1a2Vx
aWFuIDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKQ0KPiA8d2FuZ3hp
b25nZmVuZzJAaHVhd2VpLmNvbT47IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1YXdlaS5j
b20+Ow0KPiBqaWFrZXJuZWwyQGdtYWlsLmNvbTsgbWFvYmlib0Bsb29uZ3Nvbi5jbjsgbGl4aWFu
Z2xhaUBsb29uZ3Nvbi5jbg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyBWMiAxNC8zN10gYXJt
L3ZpcnQ6IEFkZCBjcHUgaG90cGx1ZyBldmVudHMgdG8gR0VEDQo+IGR1cmluZyBjcmVhdGlvbg0K
PiANCj4gSGkgU2FsaWwsDQo+IA0KPiBPbiA5LzI2LzIzIDIwOjA0LCBTYWxpbCBNZWh0YSB3cm90
ZToNCj4gPiBBZGQgQ1BVIEhvdHBsdWcgZXZlbnQgdG8gdGhlIHNldCBvZiBzdXBwb3J0ZWQgZ2Vk
LWV2ZW50cyBkdXJpbmcgdGhlIGNyZWF0aW9uIG9mDQo+ID4gR0VEIGRldmljZSBkdXJpbmcgVk0g
aW5pdC4gQWxzbyBpbml0aWFsaXplIHRoZSBtZW1vcnkgbWFwIGZvciBDUFUgSG90cGx1Zw0KPiAg
ICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eDQo+ICAgICAgICAgICAgICAgaXQgY2FuIGJlIGRy
b3BwZWQuDQoNCk9rIDopDQoNCj4gPiBjb250cm9sIGRldmljZSB1c2VkIGluIGV2ZW50IGV4Y2hh
bmdlcyBiZXR3ZWVuIFFlbXUvVk1NIGFuZCB0aGUgZ3Vlc3QuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGh3L2FybS92aXJ0LmMgICAgICAgICB8IDUgKysrKy0NCj4gPiAgIGluY2x1ZGUvaHcvYXJtL3Zp
cnQuaCB8IDEgKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPg0KPiANCj4gVGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lOg0KPiANCj4g
UmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQoNCg0KR3JlYXQuIFRo
YW5rcw0KDQpjaGVlcnMNClNhbGlsLg0KDQo=
