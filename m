Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1907963ejb;
        Tue, 3 Oct 2023 04:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX1fe9VrqK+t4FkQ0JA9yzbBfa03m6uSGAjS13S/L6AREfz/AfocIddi+GmLZivJqor4iV
X-Received: by 2002:a05:6512:3a90:b0:4fe:19ef:8791 with SMTP id q16-20020a0565123a9000b004fe19ef8791mr13918016lfu.38.1696333511821;
        Tue, 03 Oct 2023 04:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696333511; cv=none;
        d=google.com; s=arc-20160816;
        b=F7RtaT0zRkSkcuZzaf95BgdS4BhqfFaaSJ1iYfpyp7I4LLT9p5bbVs7Jok4xVt4E7O
         pfseNs5YWtfISul3EKmsvtVPN3w2d5+1Z749LAmsA8Az1rogkZPfyxNRoi5NC1kRUFIn
         H9WzQYwp74Tcz7LJzFQs1x6wh85NZf2w+fjiZMZk+1cgObFnuGTYWLf8OoSk67jQmaD2
         aSqEk7qMFCYyZsbjXlrprOt4jWYOTPvU9o3duSyxTebRaahxMIqMubz+pWFuq5hGuodi
         RhFdjrlIomIXTeO9bgsqo/d0sLJUlOp8qcKiLVerhLEHa7YX5SKleX4W7ZM/zKiLmTna
         U70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=UvCY7XuwRw/ahfJsVcrnA+gUBnTLdrAZGp+oqrtLFuk=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=V+xhV6OH50wOtTdTIhUiCtvgMF0f6JXxOD5G6M9/NeCRDs9oXT6IdlSiFAV6fk/L2J
         /V9NGe2FnpdFgwxqL1BsxEFRW3BcHpQgNcyJKT1tmwe961WJCECwq/UN09SwfXunxu4g
         f9z4Uv4sX2a8anqFaXtcRloFuvTHaRLf661Ev/q87PJJ9bqk2btqDNP/RAA6BUkg5u4j
         hJg7P081aBKGI/lFNGfUAHddMwznCfnrPqHb3nKUmMqY2rErAAcjyTigrKQ5jWTAMr2m
         x1vguGQvbhQqXAkgsUNDKCwYtvUDcAi+iKUBdZKd1AyZn+gQlEr6Zn8m5eToFWccOX9D
         2Big==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id p18-20020a5d68d2000000b0032336ee77d7si678739wrw.724.2023.10.03.04.45.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GG53PW8z6K7jp;
	Tue,  3 Oct 2023 19:45:01 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:45:10 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:45:10 +0100
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
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
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
Subject: RE: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Topic: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHZ8zQvM2IN4l39W0uWcRE2hMPQGbA3JTEAgADScvA=
Date: Tue, 3 Oct 2023 11:45:09 +0000
Message-ID: <2af8fbd7523a4545ab733895ac81454a@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-8-salil.mehta@huawei.com>
 <4134b7ab-7a76-77b9-e8c0-7e6d75e0ad50@redhat.com>
In-Reply-To: <4134b7ab-7a76-77b9-e8c0-7e6d75e0ad50@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: W66sniry6Y3Z

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDMsIDIwMjMgMToxMiBBTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25nbnUub3Jn
DQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBKb25hdGhh
biBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFsaXNpQGtl
cm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJzb25A
bGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxpbnV4LmRl
djsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVyaWMuYXVnZXJAcmVk
aGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsg
bXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+IGFs
ZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gZGFycmVuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+IHZp
c2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsNCj4g
bWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsgemh1a2VxaWFu
DQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKSA8d2FuZ3hpb25n
ZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1YXdlaS5j
b20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29uZ3Nvbi5jbjsgbGl4aWFu
Z2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggVjIgMDcvMTBdIGh3L2FjcGk6IFVwZGF0ZSBBQ1BJIEdFRCBmcmFtZXdv
cmsgdG8gc3VwcG9ydA0KPiB2Q1BVIEhvdHBsdWcNCj4gDQo+IE9uIDkvMzAvMjMgMTA6MTksIFNh
bGlsIE1laHRhIHdyb3RlOg0KPiA+IEFDUEkgR0VEIHNoYWxsIGJlIHVzZWQgdG8gY29udmV5IHRv
IHRoZSBndWVzdCBrZXJuZWwgYWJvdXQgYW55IENQVSBob3QtDQo+ICh1bilwbHVnDQo+ID4gZXZl
bnRzLiBUaGVyZWZvcmUsIGV4aXN0aW5nIEFDUEkgR0VEIGZyYW1ld29yayBpbnNpZGUgUUVNVSBu
ZWVkcyB0byBiZQ0KPiBlbmhhbmNlZA0KPiA+IHRvIHN1cHBvcnQgQ1BVIGhvdHBsdWcgc3RhdGUg
YW5kIGV2ZW50cy4NCj4gPg0KPiA+IENvLWRldmVsb3BlZC1ieTogS2VxaWFuIFpodSA8emh1a2Vx
aWFuMUBodWF3ZWkuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlh
bjFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVo
dGFAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGh3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZp
Y2UuYyB8IDEwICsrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspDQo+ID4NCj4gDQo+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29t
Pg0KDQoNClRoYW5rcw0KU2FsaWwuDQoNCg==
