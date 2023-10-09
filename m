Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp54917ejb;
        Mon, 9 Oct 2023 13:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdP1hklvwr8tj17SF1bVCD3lyeZ/x5qIulQOSBH99uPKl1dA1Ko2mfEPZKrs8gYfmZnIoX
X-Received: by 2002:adf:cd81:0:b0:31c:2f95:8056 with SMTP id q1-20020adfcd81000000b0031c2f958056mr11712170wrj.23.1696884878864;
        Mon, 09 Oct 2023 13:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696884878; cv=none;
        d=google.com; s=arc-20160816;
        b=eJtUHPswsWSg0gDquo1FT++Ryp3DAYpwbLOMy6zfRMi4cTnUjzbeV4P74jDTNU59yL
         /ZOENW/3eyQ1Hzn2alL/Q1FtvNYC6Y3S2wdLlo+fcwjlrWaD2zdnEvFN8ZMBGTsQZYFJ
         2Rkq34O0QAk53t0LkttLQoyy/2HFcHVi9wpR4YMZCEXOI78crc5dYJVtBTWjr98mh5+z
         YBC36QSfqxghWFB+tmYWvdnTV/IiNBf2/HnqX9713nosdtbCc8PMgpgLF08BqRhBDXBD
         9KP380CnlSbmjuCu5lid5HhnEtXLTkK38TEkMZMEEP4zDyYZgWqchIe1/TEgcAWYGXu9
         0Wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=nGVQ+WD5dKei0AX0YcPDFuL1TJXLqV93V/ppkmdhV7g=;
        fh=Ip9gjzNoisC7q01iVmEPxtLcq0sI5ZJWwitXLxOPxw4=;
        b=Y3KbVQLzyzekaFl5/mk926jV5ULvWnahaHa92/LHcvHAQgPkCMyqRZh5LomtbHGxF6
         M1i11CrcSoBLgwT7EimiGgOObbF+yIq3nfshalfbdiGUDgC5NMo6v1XcNGmbekDShFL9
         IR6M57RDDeoj2F5zWm2eRxtUEnv/2oUzmIDpAAhH5mYrp5Z1b7JO8pDNNY2PKgrVH/RL
         n/RNHHpXSq9JjERQuARZIzaq4Ld3SymDXa0xXoSquAG9/Dp+6A5e6ynyyKysTdDxJaPU
         XpnzLaDqAWr8uht9Yu76hTkS2TC668Vg5rhtBMzLW9IoUKgy8GIkXw6IDXq9sjCoJAo1
         56UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id e17-20020a5d5311000000b0031ff11c0db1si3985729wrv.412.2023.10.09.13.54.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S4B970LG5z6K7Gh;
	Tue, 10 Oct 2023 04:54:19 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:54:37 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 9 Oct 2023 21:54:37 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>
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
Subject: RE: [PATCH V4 10/10] target/arm/kvm: Write CPU state back to KVM on
 reset
Thread-Topic: [PATCH V4 10/10] target/arm/kvm: Write CPU state back to KVM on
 reset
Thread-Index: AQHZ+vDU4bIePd9190qIV2a+Q3I29rBB7aTg
Date: Mon, 9 Oct 2023 20:54:36 +0000
Message-ID: <816256a3dd1f406a84f448eeab969c45@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-11-salil.mehta@huawei.com>
In-Reply-To: <20231009203601.17584-11-salil.mehta@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.175.116]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: TezwvYn6t2ac

SGVsbG8sDQpQZXJoYXBzIEkgbmVlZCB0byBkcm9wIHRoaXMgcGF0Y2ggZnJvbSB0aGlzIHBhdGNo
LXNldCBhcyBpdCBpcyBBUk0gc3BlY2lmaWMuDQpJIHB1bGxlZCB0aGlzIGZyb20gUkZDIFYyIG9m
IFZpcnR1YWwgQ1BVIEhvdHBsdWcgU3VwcG9ydCBvbiBBUk12OCBhbmQgaXMNCm5vdCByZXF1aXJl
ZCBieSBvdGhlciBhcmNoaXRlY3R1cmVzIHRyeWluZyB0byBpbXBsZW1lbnQgVmlydHVhbCBDUFUg
SG90cGx1Zw0KU3VwcG9ydC4NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8y
MDIzMDkyNjEwMzY1NC4zNDQyNC0yLXNhbGlsLm1laHRhQGh1YXdlaS5jb20vDQoNCkkgd2lsbCBy
ZXRhaW4gdGhlIFJldmlld2VkLWJ5J3MgY29sbGVjdGVkIGhlcmUgaW4gdGhlIFJGQyBWMyBwYXRj
aC1zZXQuDQoNClNvcnJ5LCBmb3IgdGhlIG5vaXNlLg0KDQpUaGFua3MNClNhbGlsLg0KDQo+IEZy
b206IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiBTZW50OiBNb25kYXks
IE9jdG9iZXIgOSwgMjAyMyA5OjM2IFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFl
bXUtYXJtQG5vbmdudS5vcmcNCj4gQ2M6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWku
Y29tPjsgbWF6QGtlcm5lbC5vcmc7IGplYW4tDQo+IHBoaWxpcHBlQGxpbmFyby5vcmc7IEpvbmF0
aGFuIENhbWVyb24gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47DQo+IGxwaWVyYWxpc2lA
a2VybmVsLm9yZzsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOw0KPiByaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOyBhbmRyZXcuam9uZXNAbGludXguZGV2
Ow0KPiBkYXZpZEByZWRoYXQuY29tOyBwaGlsbWRAbGluYXJvLm9yZzsgZXJpYy5hdWdlckByZWRo
YXQuY29tOw0KPiBvbGl2ZXIudXB0b25AbGludXguZGV2OyBwYm9uemluaUByZWRoYXQuY29tOyBt
c3RAcmVkaGF0LmNvbTsNCj4gd2lsbEBrZXJuZWwub3JnOyBnc2hhbkByZWRoYXQuY29tOyByYWZh
ZWxAa2VybmVsLm9yZzsNCj4gYWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGludXhAYXJtbGludXgu
b3JnLnVrOw0KPiBkYXJyZW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbTsgaWxra2FAb3MuYW1wZXJl
Y29tcHV0aW5nLmNvbTsNCj4gdmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGthcmwuaGV1
YmF1bUBvcmFjbGUuY29tOw0KPiBtaWd1ZWwubHVpc0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBv
cG5zcmMubmV0OyB6aHVrZXFpYW4NCj4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9u
Z2ZlbmcgKEMpIDx3YW5neGlvbmdmZW5nMkBodWF3ZWkuY29tPjsNCj4gd2FuZ3lhbmFuIChZKSA8
d2FuZ3lhbmFuNTVAaHVhd2VpLmNvbT47IGppYWtlcm5lbDJAZ21haWwuY29tOw0KPiBtYW9iaWJv
QGxvb25nc29uLmNuOyBsaXhpYW5nbGFpQGxvb25nc29uLmNuOyBMaW51eGFybSA8bGludXhhcm1A
aHVhd2VpLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIFY0IDEwLzEwXSB0YXJnZXQvYXJtL2t2bTog
V3JpdGUgQ1BVIHN0YXRlIGJhY2sgdG8gS1ZNIG9uDQo+IHJlc2V0DQo+IA0KPiBGcm9tOiBKZWFu
LVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gDQo+IFdoZW4g
YSBLVk0gdkNQVSBpcyByZXNldCBmb2xsb3dpbmcgYSBQU0NJIENQVV9PTiBjYWxsLCBpdHMgcG93
ZXIgc3RhdGUNCj4gaXMgbm90IHN5bmNocm9uaXplZCB3aXRoIEtWTSBhdCB0aGUgbW9tZW50LiBC
ZWNhdXNlIHRoZSB2Q1BVIGlzIG5vdA0KPiBtYXJrZWQgZGlydHksIHdlIG1pc3MgdGhlIGNhbGwg
dG8ga3ZtX2FyY2hfcHV0X3JlZ2lzdGVycygpIHRoYXQgd3JpdGVzDQo+IHRvIEtWTSdzIE1QX1NU
QVRFLiBGb3JjZSBtcF9zdGF0ZSBzeW5jaHJvbml6YXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gU2ln
bmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+IFJldmll
d2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IFJldmlld2Vk
LWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiAtLS0NCj4gIHRhcmdldC9hcm0v
a3ZtLmMgfCA4ICsrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9rdm0uYyBiL3Rhcmdl
dC9hcm0va3ZtLmMNCj4gaW5kZXggYjY2YjkzNmE5NS4uOGNiNzBiOWU3YyAxMDA2NDQNCj4gLS0t
IGEvdGFyZ2V0L2FybS9rdm0uYw0KPiArKysgYi90YXJnZXQvYXJtL2t2bS5jDQo+IEBAIC02NDIs
MTEgKzY0MiwxMiBAQCB2b2lkIGt2bV9hcm1fY3B1X3Bvc3RfbG9hZChBUk1DUFUgKmNwdSkNCj4g
IHZvaWQga3ZtX2FybV9yZXNldF92Y3B1KEFSTUNQVSAqY3B1KQ0KPiAgew0KPiAgICAgIGludCBy
ZXQ7DQo+ICsgICAgQ1BVU3RhdGUgKmNzID0gQ1BVKGNwdSk7DQo+IA0KPiAgICAgIC8qIFJlLWlu
aXQgVkNQVSBzbyB0aGF0IGFsbCByZWdpc3RlcnMgYXJlIHNldCB0bw0KPiAgICAgICAqIHRoZWly
IHJlc3BlY3RpdmUgcmVzZXQgdmFsdWVzLg0KPiAgICAgICAqLw0KPiAtICAgIHJldCA9IGt2bV9h
cm1fdmNwdV9pbml0KENQVShjcHUpKTsNCj4gKyAgICByZXQgPSBrdm1fYXJtX3ZjcHVfaW5pdChj
cyk7DQo+ICAgICAgaWYgKHJldCA8IDApIHsNCj4gICAgICAgICAgZnByaW50ZihzdGRlcnIsICJr
dm1fYXJtX3ZjcHVfaW5pdCBmYWlsZWQ6ICVzXG4iLCBzdHJlcnJvcigtcmV0KSk7DQo+ICAgICAg
ICAgIGFib3J0KCk7DQo+IEBAIC02NjMsNiArNjY0LDExIEBAIHZvaWQga3ZtX2FybV9yZXNldF92
Y3B1KEFSTUNQVSAqY3B1KQ0KPiAgICAgICAqIGZvciB0aGUgc2FtZSByZWFzb24gd2UgZG8gc28g
aW4ga3ZtX2FyY2hfZ2V0X3JlZ2lzdGVycygpLg0KPiAgICAgICAqLw0KPiAgICAgIHdyaXRlX2xp
c3RfdG9fY3B1c3RhdGUoY3B1KTsNCj4gKyAgICAvKg0KPiArICAgICAqIEVuc3VyZSB3ZSBjYWxs
IGt2bV9hcmNoX3B1dF9yZWdpc3RlcnMoKS4gVGhlIHZDUFUgaXNuJ3QgbWFya2VkDQo+IGRpcnR5
IGlmDQo+ICsgICAgICogaXQgd2FzIHBhcmtlZCBpbiBLVk0gYW5kIGlzIG5vdyBib290aW5nIGZy
b20gYSBQU0NJIENQVV9PTiBjYWxsLg0KPiArICAgICAqLw0KPiArICAgIGNzLT52Y3B1X2RpcnR5
ID0gdHJ1ZTsNCj4gIH0NCj4gDQo+ICAvKg0KPiAtLQ0KPiAyLjM0LjENCg0K
