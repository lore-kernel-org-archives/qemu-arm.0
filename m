Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1913266ejb;
        Tue, 3 Oct 2023 04:56:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5+Pcr4WZpeSXX9VQf7pnY3XWHoeLGIjLlm5M8oMcqAN65wrgwRtP5JV8sTZyD9suPpWsD
X-Received: by 2002:a5d:6084:0:b0:319:79b4:a8ba with SMTP id w4-20020a5d6084000000b0031979b4a8bamr12585117wrt.41.1696334174847;
        Tue, 03 Oct 2023 04:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696334174; cv=none;
        d=google.com; s=arc-20160816;
        b=xv+RqDirsdT+dWVe1BQ2QdPGjFWMCnIuJNuO5Z+hAjVFuVjhjPfqlAWuiAdVtZURkc
         SXxv0cwziuUCx2VF7gi+sWboy7oBQ0VFiRU1G3XojDTqF/8nNrcorG/Ods7C+5HyL6/M
         /JfJjteRkixegAYmqd+XT6OssPfBxqvLRcgvzjjwmkc5l5rgHffGVr5Cxci14W/PROOd
         d8+ytIAh67ZyCMxqbZBGHh3e1EOkttezcJDumA3X90HIFsJanGgdNqwIUlLmfzIfMecZ
         m8GFWCsoPaIdTTA7hU6Bf6HFW6zbVWrsj2o4UCJG3mV6tSabyHzpGtBRtAuPvn+3cD+4
         QKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=jyHgWgkV9w8w3hGJ6ldH3MMfj4p7FH89oebHufi6hJA=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=MRnaDsMXyv0AUKAX9MrmwuSRPmesuiRA6ONC/DhGBLR3urbeu49D/UF0ghoOaef8mh
         60dGxy85/lNthaMSYvm0bUguC6Sg+TWIGIifHye570EdSjwMolTJk181PdbxXc9kJCpV
         flOCP+uKAIlcKrdpvnMJ/s+FDbREqn3D2Zo3IMAtZat/JmuGxTUyOwWvwqDCdCc74gby
         etrtZsdZMufhE4O6wEqFMo8Tfscsxo9of8POaAAdIfItU0cxp4zuYLLyp9bHWLUq+Xzn
         7xlfa7Sm80795SjWsHE8zwpzL249LL7g05NUxfj9qmwiQtTXQ16UEZ8I57MD3LA85op1
         l7/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id n10-20020a5d660a000000b00323357b04f6si666384wru.513.2023.10.03.04.56.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GVr41XMz67cTF;
	Tue,  3 Oct 2023 19:56:04 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:56:13 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:56:13 +0100
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
Subject: RE: [PATCH V2 09/10] gdbstub: Add helper function to unregister GDB
 register space
Thread-Topic: [PATCH V2 09/10] gdbstub: Add helper function to unregister GDB
 register space
Thread-Index: AQHZ8zRGPsMQQekjMEW7/A+UTTdUE7A3WOyAgAChr/A=
Date: Tue, 3 Oct 2023 11:56:12 +0000
Message-ID: <9fd7a974f5524eb28f0c0c546704d97d@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-10-salil.mehta@huawei.com>
 <1b018c9e-fde4-e486-b853-1d516db2d2b2@redhat.com>
In-Reply-To: <1b018c9e-fde4-e486-b853-1d516db2d2b2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: fvpulVQ88Vwy

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDMsIDIwMjMgNDoxNyBBTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
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
Y3Q6IFJlOiBbUEFUQ0ggVjIgMDkvMTBdIGdkYnN0dWI6IEFkZCBoZWxwZXIgZnVuY3Rpb24gdG8g
dW5yZWdpc3Rlcg0KPiBHREIgcmVnaXN0ZXIgc3BhY2UNCj4gDQo+IA0KPiBPbiA5LzMwLzIzIDEw
OjE5LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiBBZGQgY29tbW9uIGZ1bmN0aW9uIHRvIGhlbHAg
dW5yZWdpc3RlciB0aGUgR0RCIFJlZ2lzdGVyIFNwYWNlLiBUaGlzIHNoYWxsDQo+IGJlDQo+ID4g
ZG9uZSBpbiBjb250ZXh0IHRvIHRoZSBDUFUgdW5yZWFsaXphdGlvbi4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0K
PiA+ICAgZ2Ric3R1Yi9nZGJzdHViLmMgICAgICB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gICBp
bmNsdWRlL2V4ZWMvZ2Ric3R1Yi5oIHwgIDUgKysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+IA0KPiBXaXRoIHRoZSBmb2xsb3dpbmcgbml0cyBhZGRy
ZXNzZWQ6DQo+IA0KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4N
Cj4gDQo+ID4gZGlmZiAtLWdpdCBhL2dkYnN0dWIvZ2Ric3R1Yi5jIGIvZ2Ric3R1Yi9nZGJzdHVi
LmMNCj4gPiBpbmRleCAzNDlkMzQ4YzdiLi44OWFjMGVkZmVhIDEwMDY0NA0KPiA+IC0tLSBhL2dk
YnN0dWIvZ2Ric3R1Yi5jDQo+ID4gKysrIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4gPiBAQCAtNDkx
LDYgKzQ5MSwyMCBAQCB2b2lkIGdkYl9yZWdpc3Rlcl9jb3Byb2Nlc3NvcihDUFVTdGF0ZSAqY3B1
LA0KPiA+ICAgICAgIH0NCj4gPiAgIH0NCj4gPg0KPiA+ICt2b2lkIGdkYl91bnJlZ2lzdGVyX2Nv
cHJvY2Vzc29yX2FsbChDUFVTdGF0ZSAqY3B1KQ0KPiA+ICt7DQo+ID4gKyAgICBHREJSZWdpc3Rl
clN0YXRlICpzLCAqcDsNCj4gPiArDQo+ID4gKyAgICBwID0gY3B1LT5nZGJfcmVnczsNCj4gPiAr
ICAgIHdoaWxlIChwKSB7DQo+ID4gKyAgICAgICAgcyA9IHA7DQo+ID4gKyAgICAgICAgcCA9IHAt
Pm5leHQ7DQo+ID4gKyAgICAgICAgLyogcy0+eG1sIGlzIHN0YXRpYyBjb25zdCBjaGFyIHNvIGlz
bid0IGZyZWVkICovDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5e
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyaW5nIHNvIHRoYXQg
aXQgbmVlZG4ndCBiZSBmcmVlZA0KPiA+ICsgICAgICAgIGdfZnJlZShzKTsNCj4gPiArICAgIH0N
Cj4gPiArICAgIGNwdS0+Z2RiX3JlZ3MgPSBOVUxMOw0KPiA+ICt9DQo+ID4gKw0KPiANCj4gRm9y
IGNvbnNpc3RlbmN5LCBDUFVTdGF0ZTo6Z2RiX251bV9yZWdzIGFuZCBDUFVTdGF0ZTo6Z2RiX251
bV9nX3JlZ3MNCj4gbmVlZCB0byBiZSB1cGRhdGVkIGFjY29yZGluZ2x5LCBldmVuIHRoZSBDUFUg
aW5zdGFuY2Ugd2lsbCBiZSBkZXN0cm95ZWQNCj4gc2hvcnRseS4NCg0KR29vZCBwb2ludC4NCg0K
VGhhbmtzDQpTYWxpbC4NCg0KDQoNCg==
