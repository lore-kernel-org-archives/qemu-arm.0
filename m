Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp85873ejc;
        Fri, 27 Oct 2023 03:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2+ioblse+uBeD0x0M0ZgD+m5H6eY/G6WbQpVUObcFUWNuJXK9vjKKYab0fU+uHCkYsr+b
X-Received: by 2002:a05:600c:1c15:b0:406:f832:6513 with SMTP id j21-20020a05600c1c1500b00406f8326513mr1821380wms.3.1698402228700;
        Fri, 27 Oct 2023 03:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698402228; cv=none;
        d=google.com; s=arc-20160816;
        b=Fn/TVOAKYERZC3yEgYglmIg7BMqjHEYmMAzSFLRC49EBcacdwh1VrozFEXx+Tcu87W
         9CxyY107FdD3nU4Go2JPW//L72JWbtBlMgwVF7KjP/Iw7xRlF+cWLMpjzplZswGUdIbI
         Gzt3Il8x+OWdp6RWVD6fT+azO37bU6jNGp8+vUaE+5YOylq4lyKOKpWr1mar2dsJi1Q6
         ogkL4aAVvmL/c3gp27boUgGfz2sF2iSehk0A5tV1tfty//csBxvlyb5hTMTceopZeuY4
         L0BCEe3XQckwNXObM+uh46e3d+QcOlw8J59V5NYFBwoh0BHJz8zbUszYGEWppmPD72s/
         XYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=a/0ZDC8yXw3jm+9H8KcB98MOS8pzqPUMTgUXiLAZiUU=;
        fh=kANT3D++wurOQU1BOFSp5pyqxd/rDLTFW2yMBofHfAU=;
        b=aR383h8tPqIbGjaFJc0sAWgWSIsDA0ppIOrYSuW5jEHUfD4kuZjcVlXqmhcgxDJdgi
         LvuwKy3waGlAH1y/tbx3fFsVA2rh4OHjaaImj/jYI0wMjAYF/GA46VcSlkV7+WjFwtYR
         VW1QYBCLzRndRA3c++wJFJd4am4cY8ejrwU4ZjTE0Nk+L3fX3fg2Uj0VriPL2oIQG9bI
         Wjk+AI7SYXAcJhVMLJ3gyYHYP51O4eEOWNkLKAGa9n4LAAalPxH4mzQnljaKhiKQ9Xct
         vWVtKfeaCrSgFyusjq0oMBEAHOMiYPuccVtlhoyYsdnQWlSV4xzJmepWwN1BEYYlx4ii
         WYqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id u10-20020a05600c138a00b0040833bbfe84si3243510wmf.129.2023.10.27.03.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Oct 2023 03:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SGzDv3MV7z6J9D7;
	Fri, 27 Oct 2023 18:19:59 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 27 Oct 2023 11:23:46 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 27 Oct 2023 11:23:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com"
	<gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
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
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Topic: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Index: AQHZ/cNQxAxt9PC9FEqdNAxyY88QobBcBxKAgAF626A=
Date: Fri, 27 Oct 2023 10:23:45 +0000
Message-ID: <6a3f5229dccc497a96bd5db405a27fcb@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
 <20231026144103.565a9566@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231026144103.565a9566@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.169.245]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: tFpJlmEeed/E

SGkgSWdvciwNCg0KPiBGcm9tOiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29tPg0K
PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNiwgMjAyMyAxOjQxIFBNDQo+IFRvOiBTYWxpbCBN
ZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9y
ZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgbWF6QGtlcm5lbC5vcmc7IGplYW4tDQo+IHBoaWxpcHBl
QGxpbmFyby5vcmc7IEpvbmF0aGFuIENhbWVyb24gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNv
bT47DQo+IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOw0K
PiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBhbmRyZXcuam9uZXNAbGludXguZGV2OyBk
YXZpZEByZWRoYXQuY29tOw0KPiBwaGlsbWRAbGluYXJvLm9yZzsgZXJpYy5hdWdlckByZWRoYXQu
Y29tOyBvbGl2ZXIudXB0b25AbGludXguZGV2Ow0KPiBwYm9uemluaUByZWRoYXQuY29tOyBtc3RA
cmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwub3JnOyBnc2hhbkByZWRoYXQuY29tOw0KPiByYWZhZWxA
a2VybmVsLm9yZzsgYWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGludXhAYXJtbGludXgub3JnLnVr
Ow0KPiBkYXJyZW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbTsgaWxra2FAb3MuYW1wZXJlY29tcHV0
aW5nLmNvbTsNCj4gdmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGthcmwuaGV1YmF1bUBv
cmFjbGUuY29tOw0KPiBtaWd1ZWwubHVpc0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBvcG5zcmMu
bmV0OyB6aHVrZXFpYW4NCj4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9uZ2Zlbmcg
KEMpIDx3YW5neGlvbmdmZW5nMkBodWF3ZWkuY29tPjsNCj4gd2FuZ3lhbmFuIChZKSA8d2FuZ3lh
bmFuNTVAaHVhd2VpLmNvbT47IGppYWtlcm5lbDJAZ21haWwuY29tOw0KPiBtYW9iaWJvQGxvb25n
c29uLmNuOyBsaXhpYW5nbGFpQGxvb25nc29uLmNuOyBMaW51eGFybSA8bGludXhhcm1AaHVhd2Vp
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNiAwLzldIEFkZCBhcmNoaXRlY3R1cmUgYWdu
b3N0aWMgY29kZSB0byBzdXBwb3J0IHZDUFUNCj4gSG90cGx1Zw0KPiANCj4gT24gRnJpLCAxMyBP
Y3QgMjAyMyAxMTo1MToyMCArMDEwMA0KPiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2Vp
LmNvbT4gd3JvdGU6DQo+IA0KPiA+IFZpcnR1YWwgQ1BVIGhvdHBsdWcgc3VwcG9ydCBpcyBiZWlu
ZyBhZGRlZCBhY3Jvc3MgdmFyaW91cw0KPiBhcmNoaXRlY3R1cmVzWzFdWzNdLg0KPiA+IFRoaXMg
c2VyaWVzIGFkZHMgdmFyaW91cyBjb2RlIGJpdHMgY29tbW9uIGFjcm9zcyBhbGwgYXJjaGl0ZWN0
dXJlczoNCj4gPg0KPiA+IDEuIHZDUFUgY3JlYXRpb24gYW5kIFBhcmtpbmcgY29kZSByZWZhY3Rv
ciBbUGF0Y2ggMV0NCj4gPiAyLiBVcGRhdGUgQUNQSSBHRUQgZnJhbWV3b3JrIHRvIHN1cHBvcnQg
dkNQVSBIb3RwbHVnIFtQYXRjaCA0LDYsN10NCj4gPiAzLiBBQ1BJIENQVXMgQU1MIGNvZGUgY2hh
bmdlIFtQYXRjaCA1XQ0KPiA+IDQuIEhlbHBlciBmdW5jdGlvbnMgdG8gc3VwcG9ydCB1bnJlYWxp
emF0aW9uIG9mIENQVSBvYmplY3RzIFtQYXRjaCA4LDldDQo+ID4gNS4gTWlzYyBbUGF0Y2ggMiwz
XQ0KPiANCj4gVGhhbmtzIFNhbGlsIQ0KPiANCj4gT3ZlcmFsbCBzZXJpZXMgbG9va3MgZ29vZCB0
byBtZSAobW9kdWxvIHNvbWUgcG9pbnRzLCBJJ2QgbGlrZSB0byBiZSBhZGRyZXNzZWQpDQo+IEkn
bGwgZG8gc29tZSB0ZXN0aW5nIGFuZCBmb2xsb3cgd2l0aCBwZXIgcGF0Y2ggcmV2aWV3IHRvbW9y
cm93Lg0KDQpNYW55IHRoYW5rcyEgdGhhdCB3b3VsZCBiZSBoZWxwZnVsLg0KDQpNZWFud2hpbGUs
IEkgYW0gcHJlcGFyaW5nIHRoZSBWNyB2ZXJzaW9uIG9mIHRoaXMgdG8gYWRkcmVzcyB0aGUgeDg2
L21pY3Jvdm0NCnF0ZXN0IGJyZWFrIHJlcG9ydGVkIGJ5IE1pZ3VlbC4NCg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcWVtdS1kZXZlbC81MUI2QzEyMC0zNzA3LTQ3MzAtQUUxNC0wRjVDRDMyREM5
ODRAb3JhY2xlLmNvbS8NCg0KDQpTb2x1dGlvbiBzdWdnZXN0ZWQgaGVyZToNCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMTVlNzA2MTYtNmFiYi02M2E0LTE3ZDAtODIwZjRhMjU0
NjA3QG9wbnNyYy5uZXQvVC8jbTEwOGYxMDJiMmZlOTJiN2RkNzIxOGYyZjk0MmY3YjIzM2E5ZDZh
ZjMNCg0KDQpjaGVlcnMNClNhbGlsLg0KDQoNCj4gPiBSZXBvc2l0b3J5Og0KPiA+DQo+ID4gWypd
IGh0dHBzOi8vZ2l0aHViLmNvbS9zYWxpbC1tZWh0YS9xZW11LmdpdCB2aXJ0LWNwdWhwLWFybXY4
L3JmYy12Mi5jb21tb24udjYNCj4gPg0KPiA+DQo+ID4gUmV2aXNpb24gSGlzdG9yeToNCj4gPg0K
PiA+IFBhdGNoLXNldCAgVjUgLT4gVjYNCj4gPiAxLiBBZGRyZXNzZWQgR2F2aW4gU2hhbidzIGNv
bW1lbnRzDQo+ID4gICAgLSBGaXhlZCB0aGUgYXNzZXJ0KCkgcmFuZ2VzIG9mIGFkZHJlc3Mgc3Bh
Y2VzDQo+ID4gICAgLSBSZWJhc2VkIHRoZSBwYXRjaC1zZXQgdG8gbGF0ZXN0IGNoYW5nZXMgaW4g
dGhlIHFlbXUuZ2l0DQo+ID4gICAgLSBBZGRlZCBSZXZpZXdlZC1ieSB0YWdzIGZvciBwYXRjaGVz
IHs4LDl9DQo+ID4gMi4gQWRkcmVzc2VkIEpvbmF0aGFuIENhbWVyb24ncyBjb21tZW50cw0KPiA+
ICAgIC0gVXBkYXRlZCBjb21taXQtbG9nIGZvciBbUGF0Y2ggVjUgMS85XSB3aXRoIG1lbnRpb24g
b2YgdHJhY2UgZXZlbnRzDQo+ID4gICAgLSBBZGRlZCBSZXZpZXdlZC1ieSB0YWdzIGZvciBwYXRj
aGVzIHsxLDV9DQo+ID4gMy4gQWRkZWQgVGVzdGVkLWJ5IHRhZ3MgZnJvbSBYaWFuZ2xhaSBMaQ0K
PiA+IDQuIEZpeGVkIGNoZWNrcGF0Y2gucGwgZXJyb3IgIlFlbXUgLT4gUUVNVSIgaW4gW1BhdGNo
IFY1IDEvOV0NCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIw
MjMxMDExMTk0MzU1LjE1NjI4LTEtc2FsaWwubWVodGFAaHVhd2VpLmNvbS8NCj4gPg0KPiA+IFBh
dGNoLXNldCAgVjQgLT4gVjUNCj4gPiAxLiBBZGRyZXNzZWQgR2F2aW4gU2hhbidzIGNvbW1lbnRz
DQo+ID4gICAgLSBGaXhlZCB0aGUgdHJhY2UgZXZlbnRzIHByaW50IHN0cmluZyBmb3Iga3ZtX3tj
cmVhdGUsZ2V0LHBhcmssZGVzdHJveX1fdmNwdQ0KPiA+ICAgIC0gQWRkZWQgUmV2aWV3ZWQtYnkg
dGFnIGZvciBwYXRjaCB7MX0NCj4gPiAyLiBBZGRlZCBTaGFvcWluIEh1YW5nJ3MgUmV2aWV3ZWQt
YnkgdGFncyBmb3IgUGF0Y2hlcyB7MiwzfQ0KPiA+IDMuIEFkZGVkIFRlc3RlZC1ieSBUYWcgZnJv
bSBWaXNobnUgUGFqanVyaSB0byB0aGUgcGF0Y2gtc2V0DQo+ID4gNC4gRHJvcHBlZCB0aGUgQVJN
IHNwZWNpZmljIFtQYXRjaCBWNCAxMC8xMF0NCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9xZW11LWRldmVsLzIwMjMxMDA5MjAzNjAxLjE3NTg0LTEtc2FsaWwubWVodGFAaHVhd2Vp
LmNvbS8NCj4gPg0KPiA+IFBhdGNoLXNldCAgVjMgLT4gVjQNCj4gPiAxLiBBZGRyZXNzZWQgRGF2
aWQgSGlsZGVyYnJhbmQncyBjb21tZW50cw0KPiA+ICAgIC0gRml4ZWQgdGhlIHdyb25nIGRvYyBj
b21tZW50IG9mIGt2bV9wYXJrX3ZjcHUgQVBJIHByb3RvdHlwZQ0KPiA+ICAgIC0gQWRkZWQgUmV2
aWV3ZWQtYnkgdGFncyBmb3IgcGF0Y2hlcyB7Miw0fQ0KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzEwMDkxMTI4MTIuMTA2MTItMS1zYWxpbC5tZWh0YUBo
dWF3ZWkuY29tLw0KPiA+DQo+ID4gUGF0Y2gtc2V0ICBWMiAtPiBWMw0KPiA+IDEuIEFkZHJlc3Nl
ZCBKb25hdGhhbiBDYW1lcm9uJ3MgY29tbWVudHMNCj4gPiAgICAtIEZpeGVkICd2Y3B1LWlkJyB0
eXBlIHdyb25nbHkgY2hhbmdlZCBmcm9tICd1bnNpZ25lZCBsb25nJyB0byAnaW50ZWdlcicNCj4g
PiAgICAtIFJlbW92ZWQgdW5uZWNlc3NhcnkgdXNlIG9mIHZhcmlhYmxlICd2Y3B1X2lkJyBpbiBr
dm1fcGFya192Y3B1DQo+ID4gICAgLSBVcGRhdGVkIFtQYXRjaCBWMiAzLzEwXSBjb21taXQtbG9n
IHdpdGggZGV0YWlscyBvZiBBQ1BJX0NQVV9TQ0FOX01FVEhPRCBtYWNybw0KPiA+ICAgIC0gVXBk
YXRlZCBbUGF0Y2ggVjIgNS8xMF0gY29tbWl0LWxvZyB3aXRoIGRldGFpbHMgb2YgY29uZGl0aW9u
YWwgZXZlbnQgaGFuZGxlciBtZXRob2QNCj4gPiAgICAtIEFkZGVkIFJldmlld2VkLWJ5IHRhZ3Mg
Zm9yIHBhdGNoZXMgezIsMyw0LDYsN30NCj4gPiAyLiBBZGRyZXNzZWQgR2F2aW4gU2hhbidzIGNv
bW1lbnRzDQo+ID4gICAgLSBSZW1vdmUgdW5uZWNlc3NhcnkgdXNlIG9mIHZhcmlhYmxlICd2Y3B1
X2lkJyBpbiBrdm1fcGFyX3ZjcHUNCj4gPiAgICAtIEZpeGVkIHJldHVybiB2YWx1ZSBpbiBrdm1f
Z2V0X3ZjcHUgZnJvbSAtMSB0byAtRU5PRU5UDQo+ID4gICAgLSBSZXNldCB0aGUgdmFsdWUgb2Yg
J2dkYl9udW1fZ19yZWdzJyBpbiBnZGJfdW5yZWdpc3Rlcl9jb3Byb2Nlc3Nvcl9hbGwNCj4gPiAg
ICAtIEZpeGVkIHRoZSBrdm1fe2NyZWF0ZSxwYXJrfV92Y3B1IHByb3RvdHlwZXMgZG9jcw0KPiA+
ICAgIC0gQWRkZWQgUmV2aWV3ZWQtYnkgdGFncyBmb3IgcGF0Y2hlcyB7MiwzLDQsNSw2LDcsOSwx
MH0NCj4gPiAzLiBBZGRyZXNzZWQgb25lIGVhcmxpZXIgbWlzc2VkIGNvbW1lbnQgYnkgQWxleCBC
ZW5uw6llIGluIFJGQyBWMQ0KPiA+ICAgIC0gQWRkZWQgdHJhY2VzIGluc3RlYWQgb2YgRFBSSU5U
RiBpbiB0aGUgbmV3bHkgYWRkZWQgYW5kIHNvbWUgZXhpc3RpbmcgZnVuY3Rpb25zDQo+ID4gTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIzMDkzMDAwMTkzMy4yNjYw
LTEtIHNhbGlsLm1laHRhQGh1YXdlaS5jb20vDQo+ID4NCj4gPiBQYXRjaC1zZXQgVjEgLT4gVjIN
Cj4gPiAxLiBBZGRyZXNzZWQgQWxleCBCZW5uw6llJ3MgY29tbWVudHMNCj4gPiAgICAtIFJlZmFj
dG9yZWQgdGhlIGt2bV9jcmVhdGVfdmNwdSBsb2dpYyB0byBnZXQgcmlkIG9mIGdvdG8NCj4gPiAg
ICAtIEFkZGVkIHRoZSBkb2NzIGZvciBrdm1fe2NyZWF0ZSxwYXJrfV92Y3B1IHByb3RvdHlwZXMN
Cj4gPiAgICAtIFNwbGl0dGVkIHRoZSBnZGJzdHViIGFuZCBBZGRyZXNzU3BhY2UgZGVzdHJ1Y3Rp
b24gY2hhbmdlIGludG8gc2VwYXJhdGUgcGF0Y2hlcw0KPiA+ICAgIC0gQWRkZWQgUmV2aWV3ZWQt
YnkgdGFncyBmb3IgcGF0Y2hlcyB7MiwxMH0NCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9xZW11LWRldmVsLzIwMjMwOTI5MTI0MzA0LjEzNjcyLTEtc2FsaWwubWVodGFAaHVhd2Vp
LmNvbS8NCj4gPg0KPiA+IFJlZmVyZW5jZXM6DQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIzMDkyNjEwMDQzNi4yODI4NC0xLXNhbGlsLm1laHRhQGh1
YXdlaS5jb20vDQo+ID4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxMzE2
MzgyMy43ODgwLTEtamFtZXMubW9yc2VAYXJtLmNvbS8NCj4gPiBbM10gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvcWVtdS1kZXZlbC9jb3Zlci4xNjk1Njk3NzAxLmdpdC5saXhpYW5nbGFpQGxvb25n
c29uLmNuLw0KPiA+DQo+ID4NCj4gPiBTYWxpbCBNZWh0YSAoOSk6DQo+ID4gICBhY2NlbC9rdm06
IEV4dHJhY3QgY29tbW9uIEtWTSB2Q1BVIHtjcmVhdGlvbixwYXJraW5nfSBjb2RlDQo+ID4gICBo
dy9hY3BpOiBNb3ZlIENQVSBjdHJsLWRldiBNTUlPIHJlZ2lvbiBsZW4gbWFjcm8gdG8gY29tbW9u
IGhlYWRlciBmaWxlDQo+ID4gICBody9hY3BpOiBBZGQgQUNQSSBDUFUgaG90cGx1ZyBpbml0IHN0
dWINCj4gPiAgIGh3L2FjcGk6IEluaXQgR0VEIGZyYW1ld29yayB3aXRoIENQVSBob3RwbHVnIGV2
ZW50cw0KPiA+ICAgaHcvYWNwaTogVXBkYXRlIENQVXMgQU1MIHdpdGggY3B1LShjdHJsKWRldiBj
aGFuZ2UNCj4gPiAgIGh3L2FjcGk6IFVwZGF0ZSBHRUQgX0VWVCBtZXRob2QgQU1MIHdpdGggQ1BV
IHNjYW4NCj4gPiAgIGh3L2FjcGk6IFVwZGF0ZSBBQ1BJIEdFRCBmcmFtZXdvcmsgdG8gc3VwcG9y
dCB2Q1BVIEhvdHBsdWcNCj4gPiAgIHBoeXNtZW06IEFkZCBoZWxwZXIgZnVuY3Rpb24gdG8gZGVz
dHJveSBDUFUgQWRkcmVzc1NwYWNlDQo+ID4gICBnZGJzdHViOiBBZGQgaGVscGVyIGZ1bmN0aW9u
IHRvIHVucmVnaXN0ZXIgR0RCIHJlZ2lzdGVyIHNwYWNlDQo+ID4NCj4gPiAgYWNjZWwva3ZtL2t2
bS1hbGwuYyAgICAgICAgICAgICAgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKy0tLS0t
LQ0KPiA+ICBhY2NlbC9rdm0vdHJhY2UtZXZlbnRzICAgICAgICAgICAgICAgICB8ICA0ICsrDQo+
ID4gIGdkYnN0dWIvZ2Ric3R1Yi5jICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysNCj4g
PiAgaHcvYWNwaS9hY3BpLWNwdS1ob3RwbHVnLXN0dWIuYyAgICAgICAgfCAgNiArKysNCj4gPiAg
aHcvYWNwaS9jcHUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNyArKysrKysrLS0tLQ0K
PiA+ICBody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMgICAgICAgICB8IDIyICsrKysrKysr
Kw0KPiA+ICBody9pMzg2L2FjcGktYnVpbGQuYyAgICAgICAgICAgICAgICAgICB8ICAzICstDQo+
ID4gIGluY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmggICAgICAgICAgICAgIHwgIDggKysrKw0KPiA+
ICBpbmNsdWRlL2V4ZWMvZ2Ric3R1Yi5oICAgICAgICAgICAgICAgICB8ICA1ICsrDQo+ID4gIGlu
Y2x1ZGUvaHcvYWNwaS9jcHUuaCAgICAgICAgICAgICAgICAgIHwgIDUgKy0NCj4gPiAgaW5jbHVk
ZS9ody9hY3BpL2NwdV9ob3RwbHVnLmggICAgICAgICAgfCAgNCArKw0KPiA+ICBpbmNsdWRlL2h3
L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuaCB8ICA1ICsrDQo+ID4gIGluY2x1ZGUvaHcvY29y
ZS9jcHUuaCAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiA+ICBpbmNsdWRlL3N5c2VtdS9rdm0u
aCAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysNCj4gPiAgc3lzdGVtL3BoeXNtZW0uYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAyOSArKysrKysrKysrKysNCj4gPiAgMTUgZmlsZXMgY2hh
bmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiA+DQoNCg==
