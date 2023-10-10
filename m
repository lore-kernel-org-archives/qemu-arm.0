Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp7743ejr;
        Tue, 10 Oct 2023 02:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuEf524ccNqKmuqe14g4SZf7y+Yf2HAYUnwZHTIg5Xtjo4rTdurkwls125gw4fhSd4b6W+
X-Received: by 2002:a5d:574f:0:b0:324:884a:5cd0 with SMTP id q15-20020a5d574f000000b00324884a5cd0mr14402424wrw.47.1696931403892;
        Tue, 10 Oct 2023 02:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931403; cv=none;
        d=google.com; s=arc-20160816;
        b=AhjLwGKSfGgEBchCHVlGCmQmXfF2GL4+07fvf8xS5Mio8CT7R+VLEdnw3LYtsvoLe+
         R+Xzy8Tci+BNvqyqLtGCeYteTwd0g0S5DXINPlbXYnTTWVhoFgOmxPf1+OjmkBNK3qZS
         ugBsT3M+Xc+URDvRi6m+YXRQbKBdgUDEF3LUXaw7fxA9vJ0OlQ0zSx9YZvxbzevUIkBQ
         NWpJCzJS1nwGxeoCZ+zMw9tubv5kI7NbvGZI16WETF5a3ZBPI2mkX6btumnpHJiaB/d3
         myfhzQPRZgX4fnu0BkIAwY3blXy7fBL1ufCccCaQa3L5j4ID86Cu0czDmBk0Q7W3NyWA
         zBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=6AqU5ycYqKhholieNoqz6WjyUqvYVpc8hRl5l0yoly0=;
        fh=ArDpgR21IQ5SVfoMeq0rTdqbphlAxLfW/mhVyowvahQ=;
        b=boIFrKwd0yET1aetLvbaZTw1Ob/zx2KhaS+r5WTjFbq454EM2k+2w2Vl2DEvjmVNhR
         pqonYsrPAkaVVmphs+a6ZIHy/7loj9OvU9AUqjk2TisUaH9sp9NnBg8ZHhRX3cP14VuB
         TKtqOBrNuI0Bv4n2jgFyXtQTloJhcQvZ/UzDkQeDZxbmWer/I3vm8Aw9vmqU2Z5ghLNg
         cH2/eLb8KyMHOm+kSXvxJYy6somPSoFOvJ5F9Ik/npi/94HesXvpT7BG8XjE89f2V0Qj
         eHnPohUBb2QzOYA8Dm4x9e8/tpRuX8SzS2yHZZgrIDL05s0QIXSoUkqA4f2USsCMeYfP
         ylew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j2-20020a5d4522000000b003258934a4basi4444214wra.690.2023.10.10.02.50.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100004.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S4WJk3bnXz67L71;
	Tue, 10 Oct 2023 17:47:02 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 10:50:02 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 10 Oct 2023 10:50:02 +0100
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
Subject: RE: [PATCH V4 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Topic: [PATCH V4 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Index: AQHZ+vB6AtKRuBzpNUSildIIQlsgSLBCkw6AgAA1K/A=
Date: Tue, 10 Oct 2023 09:50:01 +0000
Message-ID: <5201c407bd2440dc8e1b0f337f91aea9@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-4-salil.mehta@huawei.com>
 <af88682c-aa4b-d457-44bf-fa3bba910d3b@redhat.com>
In-Reply-To: <af88682c-aa4b-d457-44bf-fa3bba910d3b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.234]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: nfGvvdInh97W

PiBGcm9tOiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDEwLCAyMDIzIDg6MzkgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5t
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
eGFybUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDAzLzEwXSBody9hY3Bp
OiBBZGQgQUNQSSBDUFUgaG90cGx1ZyBpbml0IHN0dWINCj4gDQo+IA0KPiANCj4gT24gMTAvMTAv
MjMgMDQ6MzUsIFNhbGlsIE1laHRhIHZpYSB3cm90ZToNCj4gPiBBQ1BJIENQVSBob3RwbHVnIHJl
bGF0ZWQgaW5pdGlhbGl6YXRpb24gc2hvdWxkIG9ubHkgaGFwcGVuIGlmIEFDUElfQ1BVX0hPVFBM
VUcNCj4gPiBzdXBwb3J0IGhhcyBiZWVuIGVuYWJsZWQgZm9yIHBhcnRpY3VsYXIgYXJjaGl0ZWN0
dXJlLiBBZGQgY3B1X2hvdHBsdWdfaHdfaW5pdCgpDQo+ID4gc3R1YiB0byBhdm9pZCBjb21waWxh
dGlvbiBicmVhay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5t
ZWh0YUBodWF3ZWkuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxKb25h
dGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdz
aGFuQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0By
ZWRoYXQuY29tPg0KDQpUaGFua3MNCg==
