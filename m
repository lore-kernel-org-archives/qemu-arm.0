Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp7405ejr;
        Tue, 10 Oct 2023 02:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECGTrHQRmLdu0kEydW290lZ55OR/jZ874gTn5IGcYFgXUus+BDRwH2UdCNhVX1PJNgK2Ny
X-Received: by 2002:a5d:52c9:0:b0:317:67bf:3376 with SMTP id r9-20020a5d52c9000000b0031767bf3376mr15136358wrv.57.1696931356767;
        Tue, 10 Oct 2023 02:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931356; cv=none;
        d=google.com; s=arc-20160816;
        b=hfkXxELS+0U7rg2E/ygIsBRgYUGBRq/84Z3dMgTZJbXouRywrb4C+309I/ryf/NSHc
         8Taz4NvAd/V6IZkcpp4PuLV8bIyq4Ur7qQFqLXMLziS92g26+lwR0JFy4ltDI2e2N0T/
         QVQe+3dozFz6nM16g0FadSUsHWsPSevFLVFyDL13+cjM2rBXDg49POjaIb1Y2APew2eT
         0+YONLTGpeUFobs+uhq/nfaLQwAsFZefenNMX1R1ldTO826bM/KBd7+u4NNHiDN6pnQv
         ojZNHud7WBQUMMvu3EB9i+liXtKTRs9sV47RZ1NhQ2z5qh088WbOnScK/zaj2TOfovKD
         7gHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=cEKZjWaBFXJWf3tIam4xQs0rulihSZQO9/GDZZAHeXk=;
        fh=ArDpgR21IQ5SVfoMeq0rTdqbphlAxLfW/mhVyowvahQ=;
        b=dERdguu+QAjtbthM7hVSzW7JbIkExQQUEb7sL6fUfX92SMg4fg6PMMyHgEpSUEfAnV
         R8I4y/ZTwBw2wcFTxngtByuOCGthd0yGIqMB/W0vn30o0DFgqHjA2fMp2/Hmk63LTOr7
         59TfN8dffGhdsICwsrjoK1yPXRFibQLREdcpwlf+hKSnwWQItYV4uYYvdo3E4pFiBvQd
         8ElN7YdnoT8AECuzrU9E6JOrAwIof7EvlDzh8NecObscRrzrTewkwhyq9QZHHQxgvIpE
         8TnnH4rs8Z7ZaKDt86gWk9GGNvBKjzrCiqEyxXQQ2mbsAjr4nfpXHI3Id89tuNZuZlMD
         T2Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id b5-20020adff245000000b00327d6c8e9a9si4389040wrp.481.2023.10.10.02.49.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S4WLw0Lrrz67cDq;
	Tue, 10 Oct 2023 17:48:56 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 10:49:14 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 10 Oct 2023 10:49:14 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Shaoqin Huang <shahuang@redhat.com>, "qemu-devel@nongnu.org"
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
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
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
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V4 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
Thread-Topic: [PATCH V4 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Thread-Index: AQHZ+vBtk+LhMznAKEmqa630qCVqebBCkbeAgAA2V7A=
Date: Tue, 10 Oct 2023 09:49:14 +0000
Message-ID: <53f75592aba94a70b671ed1ad09232a7@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-3-salil.mehta@huawei.com>
 <e2141d6a-7627-d092-3930-76ba91a77e7f@redhat.com>
In-Reply-To: <e2141d6a-7627-d092-3930-76ba91a77e7f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.234]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: TtAnI1CvRtRZ

PiBGcm9tOiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDEwLCAyMDIzIDg6MzQgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5t
ZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiBhcm1Abm9u
Z251Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsg
Sm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgbHBpZXJh
bGlzaUBrZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0Bs
aW51eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1
Z2VyQHJlZGhhdC5jb207IG9saXZlci51cHRvbkBsaW51eC5kZXY7DQo+IHBib256aW5pQHJlZGhh
dC5jb207IG1zdEByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IGdzaGFuQHJlZGhhdC5jb207
DQo+IHJhZmFlbEBrZXJuZWwub3JnOyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsaW51eEBhcm1s
aW51eC5vcmcudWs7DQo+IGRhcnJlbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBpbGtrYUBvcy5h
bXBlcmVjb21wdXRpbmcuY29tOw0KPiB2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsga2Fy
bC5oZXViYXVtQG9yYWNsZS5jb207DQo+IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1l
aHRhQG9wbnNyYy5uZXQ7IHpodWtlcWlhbg0KPiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2Fu
Z3hpb25nZmVuZyAoQykgPHdhbmd4aW9uZ2ZlbmcyQGh1YXdlaS5jb20+Ow0KPiB3YW5neWFuYW4g
KFkpIDx3YW5neWFuYW41NUBodWF3ZWkuY29tPjsgamlha2VybmVsMkBnbWFpbC5jb207DQo+IG1h
b2JpYm9AbG9vbmdzb24uY247IGxpeGlhbmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtIDxsaW51
eGFybUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDAyLzEwXSBody9hY3Bp
OiBNb3ZlIENQVSBjdHJsLWRldiBNTUlPIHJlZ2lvbiBsZW4NCj4gbWFjcm8gdG8gY29tbW9uIGhl
YWRlciBmaWxlDQo+IA0KPiANCj4gDQo+IE9uIDEwLzEwLzIzIDA0OjM1LCBTYWxpbCBNZWh0YSB2
aWEgd3JvdGU6DQo+ID4gQ1BVIGN0cmwtZGV2IE1NSU8gcmVnaW9uIGxlbmd0aCBjb3VsZCBiZSB1
c2VkIGluIEFDUEkgR0VEIGFuZCB2YXJpb3VzDQo+IG90aGVyDQo+ID4gYXJjaGl0ZWN0dXJlIHNw
ZWNpZmljIHBsYWNlcy4gTW92ZSBBQ1BJX0NQVV9IT1RQTFVHX1JFR19MRU4gbWFjcm8gdG8gbW9y
ZQ0KPiA+IGFwcHJvcHJpYXRlIGNvbW1vbiBoZWFkZXIgZmlsZS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+IFJldmlld2Vk
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+ID4gUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gPiBSZXZpZXdlZC1i
eTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBT
aGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPg0KDQpUaGFua3MNClNhbGlsLg0K
