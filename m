Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1897877ejb;
        Tue, 3 Oct 2023 04:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLcmkjCYTQFhWU0pMv98Xi6JeWGcu/wskpuZUOCSPcgfdCDQywz0XsQuu3L9Vw+/DQ2Dcm
X-Received: by 2002:a05:6512:33cc:b0:4ff:9bd9:f69a with SMTP id d12-20020a05651233cc00b004ff9bd9f69amr14820204lfg.65.1696332279468;
        Tue, 03 Oct 2023 04:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332279; cv=none;
        d=google.com; s=arc-20160816;
        b=EoNpLgLSJZiYvlXLrrRrX5twh1gUmZNI/6mWlXVROtMO40Z1wWPQgGb9Wthx/yxGm6
         pxyL+bqypXZ81f7BIOi/PueZj483kSqU5+3Dj43WxARpukKZJqe7WXWpcJsOpiCi5XrW
         m0CbewnLk+P2GAbT+MsTUaQrKMEnfhV6iUaW7BrF4jp206KP9BglUq9xlO0WRJjEBv9r
         vnLE+FEvFwgnCGMdrHUc3w4X24GYhkH7s8fEl9eplpLfoZJihe+v8AJFldBBJVu8n6ib
         Uoakggc/1FqK3OCIvR2AR8ub10Av1YJUCtg51zyR2pnPVwHG8okvVulg/0sbdhC3bfO/
         h0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=UhqtzS7OJyEthWHmIzScVEjsY9Xeyv9raB0GpVzoZwM=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=0vaSKVGOsBM+zHuVdHyfqezocrVWFWiapB6qLav1qjuDxTz5rzkDdcWMvuY1AvHPuC
         X/YfpFZJT4Qo5cX7AEXzcXaz7Uv3keaH1iFuAZ5xFzqrcidrrbgYPoG/mMe9qND2PybC
         0ndl+jqus0H04PPeyXo3v/kU3Tllc1dUd3qLB+K/xZnZmnBFGF4asP5oeq2Nvx0yahCe
         KoFRK4rgVhN8Fne59Tvd6qoz1NQjXTY96WDkzTzk5eRApkTG0axXEvdM21h85/s3m1zy
         nWIIzwHtNtL/+UtqGWqRx15TXMnnpn4Z0Phn7Zsxm/ZB+O/MCRpgeiLxkeHWyfZuIGAQ
         B5kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id fk10-20020a05600c0cca00b0040520a27b7bsi5258303wmb.124.2023.10.03.04.24.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0FpP1hqQz6K6gZ;
	Tue,  3 Oct 2023 19:24:29 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:24:37 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:24:37 +0100
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
Subject: RE: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
Thread-Topic: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Thread-Index: AQHZ8zP1LrysHzRY/k+39C2qQDqLGrA3FqMAgADbPOA=
Date: Tue, 3 Oct 2023 11:24:37 +0000
Message-ID: <3c6acfadf8ef4f5792125153feb6c3d5@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-3-salil.mehta@huawei.com>
 <64ecbf50-2287-6bd4-d2bd-e37a793ed6a9@redhat.com>
In-Reply-To: <64ecbf50-2287-6bd4-d2bd-e37a793ed6a9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 2PHRsLI7xKmm

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVHVlc2RheSwgT2N0b2JlciAzLCAyMDIzIDEyOjIwIEFNDQo+IFRvOiBTYWxpbCBNZWh0YSA8
c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS0NCj4g
YXJtQG5vbmdudS5vcmcNCj4gQ2M6IG1hekBrZXJuZWwub3JnOyBqZWFuLXBoaWxpcHBlQGxpbmFy
by5vcmc7IEpvbmF0aGFuIENhbWVyb24NCj4gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47
IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsNCj4gcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyByaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOw0KPiBpbWFtbWVkb0ByZWRoYXQuY29tOyBhbmRyZXcu
am9uZXNAbGludXguZGV2OyBkYXZpZEByZWRoYXQuY29tOw0KPiBwaGlsbWRAbGluYXJvLm9yZzsg
ZXJpYy5hdWdlckByZWRoYXQuY29tOyBvbGl2ZXIudXB0b25AbGludXguZGV2Ow0KPiBwYm9uemlu
aUByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwub3JnOyByYWZhZWxAa2Vy
bmVsLm9yZzsNCj4gYWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGludXhAYXJtbGludXgub3JnLnVr
Ow0KPiBkYXJyZW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbTsgaWxra2FAb3MuYW1wZXJlY29tcHV0
aW5nLmNvbTsNCj4gdmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGthcmwuaGV1YmF1bUBv
cmFjbGUuY29tOw0KPiBtaWd1ZWwubHVpc0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBvcG5zcmMu
bmV0OyB6aHVrZXFpYW4NCj4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9uZ2Zlbmcg
KEMpIDx3YW5neGlvbmdmZW5nMkBodWF3ZWkuY29tPjsNCj4gd2FuZ3lhbmFuIChZKSA8d2FuZ3lh
bmFuNTVAaHVhd2VpLmNvbT47IGppYWtlcm5lbDJAZ21haWwuY29tOw0KPiBtYW9iaWJvQGxvb25n
c29uLmNuOyBsaXhpYW5nbGFpQGxvb25nc29uLmNuOyBMaW51eGFybSA8bGludXhhcm1AaHVhd2Vp
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAwMi8xMF0gaHcvYWNwaTogTW92ZSBDUFUg
Y3RybC1kZXYgTU1JTyByZWdpb24gbGVuDQo+IG1hY3JvIHRvIGNvbW1vbiBoZWFkZXIgZmlsZQ0K
PiANCj4gT24gOS8zMC8yMyAxMDoxOSwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gQ1BVIGN0cmwt
ZGV2IE1NSU8gcmVnaW9uIGxlbmd0aCBjb3VsZCBiZSB1c2VkIGluIEFDUEkgR0VEIGFuZCB2YXJp
b3VzDQo+IG90aGVyDQo+ID4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHBsYWNlcy4gTW92ZSBBQ1BJ
X0NQVV9IT1RQTFVHX1JFR19MRU4gbWFjcm8gdG8gbW9yZQ0KPiA+IGFwcHJvcHJpYXRlIGNvbW1v
biBoZWFkZXIgZmlsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxp
bC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+DQo+ID4gLS0tDQo+ID4gICBody9hY3BpL2NwdS5jICAgICAgICAg
ICAgICAgICB8IDIgKy0NCj4gPiAgIGluY2x1ZGUvaHcvYWNwaS9jcHVfaG90cGx1Zy5oIHwgMiAr
Kw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQoN
ClRoYW5rcw0KU2FsaWwuDQo=
