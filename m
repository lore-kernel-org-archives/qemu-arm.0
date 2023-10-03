Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1899714ejb;
        Tue, 3 Oct 2023 04:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvZM31DY7NLQMB443XRc6nqGGPk/q4EtR9QD5VkUisLhBv6W6YMWFrYR/5iRUht4miIlDk
X-Received: by 2002:a7b:cbc9:0:b0:405:1ba2:4fcb with SMTP id n9-20020a7bcbc9000000b004051ba24fcbmr12948061wmi.16.1696332532347;
        Tue, 03 Oct 2023 04:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332532; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvQMCEhpwogxz4NFxT9GUW4tH+DYsQKYOvCDvrkX9Qik7I4XaLdr2mr/cikwveeNhK
         tV6nY4LYy3ClyfmA2YfsqW96atpeC5bp2Zm6vD45UOeThSNBe+1viGcZXAv3NqwJC2OI
         bI60yUeA0NQICnF3xhKuIXV9wxU0vm3OHWnxZtpVudd55BTJ/qwb7xHX5BxOKaY+IJHL
         uLfMxeQpOsI7jPrvm9EIf103G3ZVjW4MzddO1Xr45DOzwq0Dv2MJrt9+U4rMFMDR001u
         O+IqgUJB+aQb5uGxtm+kLWSjge63xnFxqmhESZqwotPkUdyi94TNJY19dqgNIwqm5OUG
         3/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=5VPJp6R9JirEQoJlVtQ4EGAqdqFnV6Bw41kfnIMLHX0=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=lu35qyB8MKZyUzjh6H2bXKftFCjtpAOIUQkHQMSD8mEsX6YzazuadqlN+vLORjRfiQ
         1J9TNY3SIWMWEXtu+06xoUDkQYm2XDh2XUaj9zPFVWuZuU3LJ1EdI9gXKfOiklELtbNb
         8ry5l7a7F36JX/ML+UhkPmTZJabxR4zXJqyPBIW4SCDnQ9ApRBsFrSAFBrlD5T+JSSXt
         MTFG1PzloCu3NA/m+sG5EI58yYXvQk/ybAX7sLyg6DmMxk8V+OPTyOlERIhd8zcAOqum
         uqTXX8zXSwlSUZwj+XsMhc2oXJUGjsv7eKBjSlxUZrQoALCGRVSHm0jPJhW57vG5fepn
         QyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k10-20020a5d428a000000b0031fa2774ccbsi640248wrq.646.2023.10.03.04.28.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0FvG0srTz6K7Jh;
	Tue,  3 Oct 2023 19:28:42 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:28:50 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:28:50 +0100
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
Subject: RE: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Topic: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Index: AQHZ8zQBSEWKLvEbcUWOpyX49Zq1SrA3GDKAgADatxA=
Date: Tue, 3 Oct 2023 11:28:50 +0000
Message-ID: <56cfc7514d8a4bb4ad6e63ce6824c731@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-4-salil.mehta@huawei.com>
 <1269fcdc-0b14-2449-2623-9de2948f81fa@redhat.com>
In-Reply-To: <1269fcdc-0b14-2449-2623-9de2948f81fa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 3MbR5h+F+785

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDMsIDIwMjMgMTI6MjUgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBo
dWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiBhcm1Abm9uZ251Lm9y
Zw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsgSm9uYXRo
YW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgbHBpZXJhbGlzaUBr
ZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hhcmQuaGVuZGVyc29u
QGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0BsaW51eC5k
ZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1Z2VyQHJl
ZGhhdC5jb207IG9saXZlci51cHRvbkBsaW51eC5kZXY7DQo+IHBib256aW5pQHJlZGhhdC5jb207
IG1zdEByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IHJhZmFlbEBrZXJuZWwub3JnOw0KPiBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsaW51eEBhcm1saW51eC5vcmcudWs7DQo+IGRhcnJlbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tOyBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiB2
aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsga2FybC5oZXViYXVtQG9yYWNsZS5jb207DQo+
IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7IHpodWtlcWlh
bg0KPiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykgPHdhbmd4aW9u
Z2ZlbmcyQGh1YXdlaS5jb20+Ow0KPiB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWku
Y29tPjsgamlha2VybmVsMkBnbWFpbC5jb207DQo+IG1hb2JpYm9AbG9vbmdzb24uY247IGxpeGlh
bmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYyIDAzLzEwXSBody9hY3BpOiBBZGQgQUNQSSBDUFUgaG90cGx1ZyBp
bml0IHN0dWINCj4gDQo+IA0KPiBPbiA5LzMwLzIzIDEwOjE5LCBTYWxpbCBNZWh0YSB3cm90ZToN
Cj4gPiBBQ1BJIENQVSBob3RwbHVnIHJlbGF0ZWQgaW5pdGlhbGl6YXRpb24gc2hvdWxkIG9ubHkg
aGFwcGVuIGlmDQo+IEFDUElfQ1BVX0hPVFBMVUcNCj4gPiBzdXBwb3J0IGhhcyBiZWVuIGVuYWJs
ZWQgZm9yIHBhcnRpY3VsYXIgYXJjaGl0ZWN0dXJlLiBBZGQNCj4gY3B1X2hvdHBsdWdfaHdfaW5p
dCgpDQo+ID4gc3R1YiB0byBhdm9pZCBjb21waWxhdGlvbiBicmVhay4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0K
PiA+ICAgaHcvYWNwaS9hY3BpLWNwdS1ob3RwbHVnLXN0dWIuYyB8IDYgKysrKysrDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gDQo+IFJldmlld2VkLWJ5OiBH
YXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KDQpUaGFua3MNClNhbGlsLg0KDQoNCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2h3L2FjcGkvYWNwaS1jcHUtaG90cGx1Zy1zdHViLmMgYi9ody9hY3Bp
L2FjcGktY3B1LWhvdHBsdWctDQo+IHN0dWIuYw0KPiA+IGluZGV4IDNmYzRiMTRjMjYuLmM2YzYx
YmI5Y2QgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYWNwaS9hY3BpLWNwdS1ob3RwbHVnLXN0dWIuYw0K
PiA+ICsrKyBiL2h3L2FjcGkvYWNwaS1jcHUtaG90cGx1Zy1zdHViLmMNCj4gPiBAQCAtMTksNiAr
MTksMTIgQEAgdm9pZCBsZWdhY3lfYWNwaV9jcHVfaG90cGx1Z19pbml0KE1lbW9yeVJlZ2lvbg0K
PiAqcGFyZW50LCBPYmplY3QgKm93bmVyLA0KPiA+ICAgICAgIHJldHVybjsNCj4gPiAgIH0NCj4g
Pg0KPiA+ICt2b2lkIGNwdV9ob3RwbHVnX2h3X2luaXQoTWVtb3J5UmVnaW9uICphcywgT2JqZWN0
ICpvd25lciwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIENQVUhvdHBsdWdTdGF0ZSAq
c3RhdGUsIGh3YWRkciBiYXNlX2FkZHIpDQo+ID4gK3sNCj4gPiArICAgIHJldHVybjsNCj4gICAg
ICAgICBeXl5eXl4NCj4gPiArfQ0KPiA+ICsNCj4gDQo+IEkgZ3Vlc3MgdGhlIHJldHVybiBpcyB0
aGUgb3V0Y29tZSBieSBmb2xsb3dpbmcgdGhlIHBhdHRlcm4gb2Ygb3RoZXINCj4gZnVuY3Rpb25z
IDstKQ0KDQoNCkkgY2FuIHJlbW92ZSBpdC4gOikNCg0KDQo=
