Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1942351ejc;
        Mon, 6 May 2024 17:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCQlXtA8w8UmZJF0o99Z5ShAQ4mdZENy2jOEcEuf6CT3yrh2Z8ZKU8XATaY+8zxN6oybjd7eVooP4Nq2Uc72Xq6GMxXm5Y
X-Google-Smtp-Source: AGHT+IF/VSJUIHco2iP3t7IXiy5OwFetMbQ1l0hi3Fbe50p8VchGQrXdkD45VdXKUPd6x3FtWsOZ
X-Received: by 2002:a5d:6d88:0:b0:34d:a738:30b8 with SMTP id l8-20020a5d6d88000000b0034da73830b8mr10567981wrs.12.1715040675810;
        Mon, 06 May 2024 17:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715040675; cv=none;
        d=google.com; s=arc-20160816;
        b=lmFoEK6xsFq27VpXqgyrcXzsYLG0G9oUzJkr8KYClFVwwovZ6JIucMNkkbHDoDL+x8
         EQhP2IrTnktx1r48hy9e33Z1y5Wb9u7IRMVkr6FIEoFxQOV8keZzsnLdhUYiHGlzWqIN
         IcoSfyPTm9/AJoefBT0i2XqNM1oLeMP0cOxzlKBd5v/BVS8Wp4UDHNzWBM8hp6h2pcj1
         Ipbo0N48n7QvTTwUbQX/ViT1P67Mm3+zqhdx48qykkTKzRZfA0PItFGdg3JKoA9mIsy7
         hgm3hnuFh+I3DvGdkYDjrybZVJANnRt05AV0kXfdgo6Ss4WaRVhz0+IXGrCUEXy3yVRk
         V40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=o0MfLP/Tz4tTL5qlsr/7Bug9+JhW/fAFj4IJBDjrtE8=;
        fh=QWMYmS1AHbKc5j9IFDJwJUxEST1+zYikw0L2XprMdGs=;
        b=RP8ZqsLaHRwXHDNizwnIyuHQkny2dwHQPnZnSiGymf7wt8TQaVmzdg42ulJAJdvIL3
         N+26Fwk3WL7tisjDzqvSzSVHtCW5uFsRBNsOYVwzFvPFt6PBV9fM8L6Y2rTRXLm5wY/T
         E41GvXRAPKqT1tsTaqPO7yZWmUAw4eOPl1WENtgwwFdAVQixocuXFnkTzBpYylgC+oZI
         +mPESiDf9f0oGhUEaQlK2Sj2bnsiLwi32bKeM/XpXxbzntfIsM5q2GX9DEcuzENThmnx
         I+Odo+71F99TqTIbpCR/xOGHzW4Ex2eQLqevhIA7UEmyEdAWn3iWqaA0l/INtcCQRKjp
         oePA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j15-20020adfea4f000000b0034d743f7c66si6115905wrn.878.2024.05.06.17.11.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2024 17:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VYJX31Y29z67ydF;
	Tue,  7 May 2024 08:08:19 +0800 (CST)
Received: from lhrpeml100006.china.huawei.com (unknown [7.191.160.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 67FA81400CB;
	Tue,  7 May 2024 08:11:14 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 7 May 2024 01:11:14 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Tue, 7 May 2024 01:11:13 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "richard.henderson@linaro.org"
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
Subject: RE: [PATCH V8 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Topic: [PATCH V8 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Index: AQHadCFXcU6yTs2isEyCNhmIUrtCDrGHWFKAgALjoLD///qlAIAAEQrg
Date: Tue, 7 May 2024 00:11:13 +0000
Message-ID: <55f942d2a3644bdaaff759014e3a4c20@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-7-salil.mehta@huawei.com>
 <CAFEAcA93EotG4-LXRJF034_9dWAWgZJA1VF6dB-xCsXn0T059g@mail.gmail.com>
 <10f35804a55e460a8ce6ecdb3f0c79b6@huawei.com>
 <CAFEAcA-w7wf9F4VVAnZR3b34ydEWq=QNw=CxhTMobsr+AP_LCg@mail.gmail.com>
In-Reply-To: <CAFEAcA-w7wf9F4VVAnZR3b34ydEWq=QNw=CxhTMobsr+AP_LCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.159.236]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: 6EoPtz7jwwDO

PiAgRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiAgU2Vu
dDogTW9uZGF5LCBNYXkgNiwgMjAyNCAxMDoyOSBBTQ0KPiAgVG86IFNhbGlsIE1laHRhIDxzYWxp
bC5tZWh0YUBodWF3ZWkuY29tPg0KPiAgDQo+ICBPbiBNb24sIDYgTWF5IDIwMjQgYXQgMTA6MDYs
IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiAgd3JvdGU6DQo+ICA+DQo+
ICA+IEhpIFBldGVyLA0KPiAgPg0KPiAgPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ICA+DQo+
ICA+ID4gIEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gIFdo
ZW4gZG8gd2UgbmVlZCB0bw0KPiAgPiA+IGRlc3Ryb3kgYSBzaW5nbGUgYWRkcmVzcyBzcGFjZSBp
biB0aGlzIHdheSB0aGF0IG1lYW5zICB3ZSBuZWVkIHRvDQo+ICA+ID4ga2VlcCBhIGNvdW50IG9m
IGhvdyBtYW55IEFTZXMgdGhlIENQVSBjdXJyZW50bHkgaGFzPyBUaGUgIGNvbW1pdA0KPiAgPiA+
IG1lc3NhZ2UgdGFsa3MgYWJvdXQgdGhlIGNhc2Ugd2hlbiB3ZSB1bnJlYWxpemUgdGhlIHdob2xl
IENQVQ0KPiAgPiA+IG9iamVjdCwgYnV0IGluIHRoYXQgc2l0dWF0aW9uIHlvdSBjYW4ganVzdCB0
aHJvdyBhd2F5IGFsbCB0aGUgQVNlcw0KPiAgPiA+IGF0IG9uY2UgKGVnICBieSBjYWxsaW5nIHNv
bWUNCj4gID4gPiAgY3B1X2Rlc3Ryb3lfYWRkcmVzc19zcGFjZXMoKSBmdW5jdGlvbiBmcm9tDQo+
ICBjcHVfY29tbW9uX3VucmVhbGl6ZWZuKCkpLg0KPiAgPg0KPiAgPg0KPiAgPiBZZXMsIG1heWJl
LCB3ZSBjYW4gZGVzdHJveSBhbGwgYXQgb25jZSBmcm9tIGNvbW1vbiBsZWcgYXMgd2VsbC4gSSdk
DQo+ICA+IHByZWZlciB0aGlzIHRvIGJlIGRvbmUgZnJvbSB0aGUgYXJjaCBzcGVjaWZpYyBmdW5j
dGlvbiBmb3IgQVJNIHRvDQo+ICA+IG1haW50YWluIHRoZSBjbGFyaXR5ICYgc3ltbWV0cnkgb2Yg
aW5pdGlhbGl6YXRpb24gYW5kDQo+ICA+IHVuLWluaXRpYWxpemF0aW9uIGxlZ3MuICBGb3Igbm93
LCBhbGwgb2YgdGhlc2UgYWRkcmVzcyBzcGFjZSBkZXN0cnVjdGlvbiBpcw0KPiAgaGFwcGVuaW5n
IGluIGNvbnRleHQgdG8gdGhlIGFybV9jcHVfdW5yZWFsaXplZm4oKS4NCj4gID4NCj4gID4gSXTi
gJlzIGEga2luZCBvZiB0cmFkZS1vZmYgYmV0d2VlbiBsaXR0bGUgbW9yZSBjb2RlIGFuZCBjbGFy
aXR5IGJ1dCBJJ20NCj4gID4gb3BlbiB0byBmdXJ0aGVyIHN1Z2dlc3Rpb25zLg0KPiAgPg0KPiAg
Pg0KPiAgPiA+DQo+ICA+ID4gIEFsc28sIGlmIHdlJ3JlIGxlYWtpbmcgc3R1ZmYgaGVyZSBieSBm
YWlsaW5nIHRvIGRlc3Ryb3kgaXQsIGlzIHRoYXQNCj4gID4gPiBhIHByb2JsZW0gZm9yICBleGlz
dGluZyBDUFUgdHlwZXMgbGlrZSB4ODYgdGhhdCB3ZSBjYW4gYWxyZWFkeSBob3RwbHVnPw0KPiAg
Pg0KPiAgPiBObyB3ZSBhcmUgbm90LiBXZSBhcmUgdGFraW5nIGNhcmUgb2YgdGhlc2UgaW4gdGhl
IEFSTSBhcmNoIHNwZWNpZmljDQo+ICA+IGxlZ3Mgd2l0aGluIGZ1bmN0aW9ucyBhcm1fY3B1Xyh1
bilyZWFsaXplZm4oKS4NCj4gIA0KPiAgSG93IGNhbiB5b3UgYmUgdGFraW5nIGNhcmUgb2YgKng4
NiogQ1BVIHR5cGVzIGluIHRoZSBBcm0gdW5yZWFsaXplPw0KDQoNClNvcnJ5LCB5ZXMsIEkgbWlz
c2VkIHRvIHJlcGx5IHRoYXQgY2xlYXJseS4gVGhlcmUgd2FzIGluZGVlZCBhIGxlYWsgd2l0aCB4
ODYgcmVwb3J0ZWQNCmJ5IFBoaWxsaXBlL0RhdmlkIGxhc3QgeWVhci4gSW4gZmFjdCwgUGhpbGxp
cGUgZmxvYXRlZCBhIHBhdGNoIGxhc3QgeWVhciBmb3IgdGhpcy4NCkkgdGhvdWdodCBpdCB3YXMg
Zml4ZWQgYWxyZWFkeSBhcyBwYXJ0IG9mIGNwdV9jb21tb25fdW5yZWFsaXplKCkgYnV0IEkganVz
dA0KY2hlY2tlZCBhbmQgcmVhbGl6ZWQgdGhhdCB0aGUgYmVsb3cgcHJvcG9zZWQgY2hhbmdlZCBz
dGlsbCBpc27igJl0IHBhcnQgb2YgdGhlDQptYWlubGluZQ0KDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9xZW11LWRldmVsLzIwMjMwOTE4MTYwMjU3LjMwMTI3LTktcGhpbG1kQGxpbmFyby5vcmcv
DQoNCkkgY2FuIGRlZmluaXRlbHkgYWRkIGEgY29tbW9uIENQVSBBZGRyZXNzU3BhY2UgZGVzdHJ1
Y3Rpb24gbGVnIGFzIHBhcnQgb2YgdGhpcw0KcGF0Y2ggaWYgaW4gY2FzZSBhcmNoIHNwZWNpZmlj
IENQVSB1bnJlYWxpemUgZG9lcyBub3QgY2xlYW5zIHVwIGl0cyBDUFUNCkFkZHJlc3NTcGFjZT8N
Cg0KDQpUaGFua3MNClNhbGlsLg0KDQo+ICANCj4gIHRoYW5rcw0KPiAgLS0gUE1NDQo=
