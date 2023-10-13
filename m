Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1401754ejc;
        Fri, 13 Oct 2023 03:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH40ODItCoIM2BTeUB3Cjw7GJDejinkkLixBV4ifYW4vmO+hbrYZfUKyBHim12Bog4kwT4A
X-Received: by 2002:adf:f0c2:0:b0:32d:9718:b32a with SMTP id x2-20020adff0c2000000b0032d9718b32amr2394783wro.0.1697192512008;
        Fri, 13 Oct 2023 03:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697192511; cv=none;
        d=google.com; s=arc-20160816;
        b=e4o8O2Zyjeei2dDa+GV/MHlbKE68noru66JDJSBcKr/QN0/XUyO0TgQkEynVdDlruI
         yacObYNC55tfjuZnG8mLZYooNj7S9ye9gT7RgdqbA5HvurjB57vs7UjTV3mrBIGQ2kIq
         hbHlxobda3g95XL6j52GY5Lrgn/Khq98gEpeRxIah1smLqiC92rLyggI4IUfbEQLebqa
         VdXKh/nNSA8lCmmFz15Vhl94M58R/0T7APaWvIGHJrg3LwYWrFfOeG5rCcNV9jVWa9/h
         KvuvXPAmxPjmNFDQ4URX0sCqUIhvbM7FD1cjbP17YZ9CgBdkl5xXI9maRA0bovldhQsy
         y6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=1mli/Ha4xJC/qPUhrAVHeX/4mv9yTcDs7yKg1FegDtk=;
        fh=Uh+y2+kWAaSBhKyc1vQ5JTcMKSdzzcmLCTqqtt1QPBw=;
        b=fZ7HhXBUCAjtWjuKJ8gaqnsMbVeRr7CwlYlR1m154YY80Nt3UCnJmfwLRiayMs+rO4
         cXaaIpYqP4OUUyMtg+00ARmXp80kq6o7u+iEX4rj2jr0IpzN7hSqd0Ouuz90ko+RAoyf
         YOjnZPrr3yclfkfkcFSD4laCy3ECdRujiw6lifUmevjEspZQKnjBWe39A1k164t10Dx1
         86AM+hQRrJYK7H1uSVAFqG9jAPzW0/9iG0HL0rpHfSzQ4f5ghpnbE5n3L3tfamBNv+9i
         AusqUzuDf99zHFhmT0h48PMEsCP8ipmfsr+oM35MP2FtN0shfWfxLsh7g2MWPCOFcxLU
         +9rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x7-20020a5d4447000000b0032d5e6fc816si3696220wrr.941.2023.10.13.03.21.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6Mx24PHcz688p7;
	Fri, 13 Oct 2023 18:21:26 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:21:49 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 13 Oct 2023 11:21:49 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: lixianglai <lixianglai@loongson.cn>, "qemu-devel@nongnu.org"
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
	<maobibo@loongson.cn>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V5 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Topic: [PATCH V5 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Index: AQHZ/HtfLWuY6i1N0k+WjJbW2iez6rBHCU2AgAB6juA=
Date: Fri, 13 Oct 2023 10:21:49 +0000
Message-ID: <42792608ae1f4eecb13c43c06197a837@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <34927805-a968-271f-16c2-17c8d90693d9@loongson.cn>
In-Reply-To: <34927805-a968-271f-16c2-17c8d90693d9@loongson.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.247.32]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: GOwvk/33CtyW

SGkgWGlhbmdsYWksDQoNCj4gRnJvbTogbGl4aWFuZ2xhaSA8bGl4aWFuZ2xhaUBsb29uZ3Nvbi5j
bj4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDQ6NTggQU0NCj4gVG86IFNhbGls
IE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBx
ZW11LQ0KPiBhcm1Abm9uZ251Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlw
cGVAbGluYXJvLm9yZzsgSm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3
ZWkuY29tPjsgbHBpZXJhbGlzaUBrZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc7IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207
IGFuZHJldy5qb25lc0BsaW51eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5h
cm8ub3JnOyBlcmljLmF1Z2VyQHJlZGhhdC5jb207IG9saXZlci51cHRvbkBsaW51eC5kZXY7DQo+
IHBib256aW5pQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IGdz
aGFuQHJlZGhhdC5jb207DQo+IHJhZmFlbEBrZXJuZWwub3JnOyBhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnOyBsaW51eEBhcm1saW51eC5vcmcudWs7DQo+IGRhcnJlbkBvcy5hbXBlcmVjb21wdXRpbmcu
Y29tOyBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiB2aXNobnVAb3MuYW1wZXJlY29t
cHV0aW5nLmNvbTsga2FybC5oZXViYXVtQG9yYWNsZS5jb207DQo+IG1pZ3VlbC5sdWlzQG9yYWNs
ZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7IHpodWtlcWlhbg0KPiA8emh1a2VxaWFuMUBo
dWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykgPHdhbmd4aW9uZ2ZlbmcyQGh1YXdlaS5jb20+
Ow0KPiB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWkuY29tPjsgamlha2VybmVsMkBn
bWFpbC5jb207DQo+IG1hb2JpYm9AbG9vbmdzb24uY247IExpbnV4YXJtIDxsaW51eGFybUBodWF3
ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY1IDAvOV0gQWRkIGFyY2hpdGVjdHVyZSBh
Z25vc3RpYyBjb2RlIHRvIHN1cHBvcnQgdkNQVQ0KPiBIb3RwbHVnDQo+IA0KPiBIaSBTYWxpbCBN
ZWh0YSB2aWE6DQo+IA0KPiA+IFZpcnR1YWwgQ1BVIGhvdHBsdWcgc3VwcG9ydCBpcyBiZWluZyBh
ZGRlZCBhY3Jvc3MgdmFyaW91cw0KPiBhcmNoaXRlY3R1cmVzWzFdWzNdLg0KDQpbLi4uXQ0KDQoN
Cj4gSSByZWJhc2UgeW91ciBwYXRjaCB2NSBvbiBsb29uZ2FyY2ggdGNnLCB0aGVyZSBpcyBubyBw
cm9ibGVtIHdpdGggY3B1DQo+IGhvdHBsdWcvdW5wbHVnLg0KPiANCj4gVGhhbmsgeW91IHNvIG11
Y2ggZm9yIHlvdXIgY29udHJpYnV0aW9uIHRvIHRoZSBjb21tdW5pdHkuDQoNCk1hbnkgdGhhbmtz
IGZvciB0ZXN0aW5nIGFuZCB0aGlzIGNvbmZpcm1hdGlvbiENCg0KU2luY2UgeW91IGhhdmUgc2hh
cmVkIFRlc3RlZC1ieSB0YWcgb24gVjUgaW4gcHJpdmF0ZSBJIHdpbGwNCmFkZCBpdCBpbiBWNi4N
Cg0KQnV0IGNhbiBJIHJlcXVlc3QgeW91ciBUZXN0ZWQtYnkgdGFnIGhlcmUgYXMgd2VsbCBzbyB0
aGF0DQppdCBpcyB2aXNpYmxlIHRvIHRoZSBtYWludGFpbmVycyBhcyB3ZWxsPw0KDQoNClRoYW5r
cw0KU2FsaWwuDQoNCg0KDQo+IA0KPiBUaGFua3MsDQo+IFhpYW5nbGFpLg0KPiANCg0K
