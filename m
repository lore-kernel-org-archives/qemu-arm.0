Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1897025ejb;
        Tue, 3 Oct 2023 04:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVimD7j536NrLjBta643r5J7rytM0QeakSCsOVcmf3yqMBNitDLNkVpuhy9artFy8LKXNe
X-Received: by 2002:a05:600c:1c81:b0:406:6964:7e99 with SMTP id k1-20020a05600c1c8100b0040669647e99mr6652205wms.15.1696332167160;
        Tue, 03 Oct 2023 04:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332167; cv=none;
        d=google.com; s=arc-20160816;
        b=J88Yxih+Izo6LsMQsufC/9VyKZD7kQSxgpZzN6/Rj7umBcxaXib/mAWdp2z8kmV52o
         anDJD1060EKkI8fRMdhqKk9/sEk8SDfM9ngjBBtR2gGdT4dH4G1TFvbx1v8HuGTmWhGY
         KCjpzVcVBLS6RbecBwxhcPt0Voc/HQMtaXFTueCTs6gxjbcJOncJK/ur9f2Fo+3RsnlC
         xDIfIa8zW81k+YDA9wKZuqybcqaBGBM1rrxmzsdDI7FDTx+bODhCUcsFDzI6pF0uxzvW
         Hw8HotJCDsb6EV9YUxHVG2rrNHQj3Ev4kAA8yA3QjUtnlVVad9aHLJs1qbpvhNlEQD3x
         J6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=HtxHrEZO9G48UV3HwaFjDMehsw/Y47fgLhnmP19fz78=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=thdNDiqwg6eWjCVWNqakmYgyUCGpVu9Up2BZZOUV9u1YKKVvJ1Iq0rlyNHT68jVfF2
         7XMfIwccM+Iy8jsYZM9/jqHPlKkHtKHJy1ycpUxz9zssfDTWbBuCTeuZ2yzv94mIGS8V
         VUe2BzjSz1x7TR1dKB265oC0xwLgutYUnyJ9g1gc0wzJHJcifZboDc7JRsGQhSkDW5FS
         dof93bkbcn6keHzNc1bAgaZRsGiossZe03jF75e6VoeN505OGg8cTKbXN+RgR/Qc/Hph
         CJEftRp9fiz6QYuxHxTG+jM8dv0zxHtMh6ekviwm6e8UcqJVg3UxyL1GNlKI/7EDMJG8
         s2NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id hn4-20020a05600ca38400b00405503a6300si5091846wmb.76.2023.10.03.04.22.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0FmC3hZBz6K6f2;
	Tue,  3 Oct 2023 19:22:35 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:22:44 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:22:44 +0100
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
Subject: RE: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ8zPpn9wpwkR00kGhOJ6dnPJS7rA3FhyAgADWeMA=
Date: Tue, 3 Oct 2023 11:22:43 +0000
Message-ID: <bbcadd3aa0574dbeba34f055fcdc2819@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-2-salil.mehta@huawei.com>
 <a8861b68-5e04-5127-5c0f-77816401741b@redhat.com>
In-Reply-To: <a8861b68-5e04-5127-5c0f-77816401741b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: jvT4+jNrml80

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVHVlc2RheSwgT2N0b2JlciAzLCAyMDIzIDEyOjE4IEFNDQo+IFRvOiBTYWxpbCBNZWh0YSA8
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
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAwMS8xMF0gYWNjZWwva3ZtOiBFeHRyYWN0
IGNvbW1vbiBLVk0gdkNQVQ0KPiB7Y3JlYXRpb24scGFya2luZ30gY29kZQ0KPiANCj4gT24gOS8z
MC8yMyAxMDoxOSwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gS1ZNIHZDUFUgY3JlYXRpb24gaXMg
ZG9uZSBvbmNlIGR1cmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIFZNIHdoZW4gUWVtdQ0K
PiA+IHRocmVhZHMgYXJlIHNwYXduZWQuIFRoaXMgaXMgY29tbW9uIHRvIGFsbCB0aGUgYXJjaGl0
ZWN0dXJlcy4NCj4gICAgXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiAgICB0aHJlYWQgaXMgc3Bhd25l
ZC4NCg0KWWVzLCB3aWxsIGZpeC4NCg0KVGhhbmtzDQpTYWxpbC4NCg0KDQo+ID4gSG90LXVucGx1
ZyBvZiB2Q1BVIHJlc3VsdHMgaW4gZGVzdHJ1Y3Rpb24gb2YgdGhlIHZDUFUgb2JqZWN0cyBpbiBR
T00gYnV0DQo+ID4gdGhlIEtWTSB2Q1BVIG9iamVjdHMgaW4gdGhlIEhvc3QgS1ZNIGFyZSBub3Qg
ZGVzdHJveWVkIGFuZCB0aGVpcg0KPiByZXByZXNlbnRhdGl2ZQ0KPiA+IEtWTSB2Q1BVIG9iamVj
dHMvY29udGV4dCBpbiBRZW11IGFyZSBwYXJrZWQuDQo+ID4NCj4gPiBSZWZhY3RvciBjb21tb24g
bG9naWMgc28gdGhhdCBzb21lIEFQSXMgY291bGQgYmUgcmV1c2VkIGJ5IHZDUFUgSG90cGx1ZyBj
b2RlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gICBhY2NlbC9rdm0va3ZtLWFsbC5jICB8IDYzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ID4gICBpbmNsdWRlL3N5
c2VtdS9rdm0uaCB8IDE0ICsrKysrKysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5z
ZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYWNjZWwv
a3ZtL2t2bS1hbGwuYyBiL2FjY2VsL2t2bS9rdm0tYWxsLmMNCj4gPiBpbmRleCBmZjE1NzhiYjMy
Li5iOGMzNmJhNTBhIDEwMDY0NA0KPiA+IC0tLSBhL2FjY2VsL2t2bS9rdm0tYWxsLmMNCj4gPiAr
KysgYi9hY2NlbC9rdm0va3ZtLWFsbC5jDQo+ID4gQEAgLTgwLDcgKzgwLDcgQEANCj4gPiAgICNl
bmRpZg0KPiA+DQo+ID4gICBzdHJ1Y3QgS1ZNUGFya2VkVmNwdSB7DQo+ID4gLSAgICB1bnNpZ25l
ZCBsb25nIHZjcHVfaWQ7DQo+ID4gKyAgICBpbnQgdmNwdV9pZDsNCj4gDQo+IEB2Y3B1X2lkIHJl
cHJlc2VudHMgdGhlIHZDUFUgaW5kZXggKENQVVN0YXRlOjpjcHVfaW5kZXgpIGluc3RlYWQgb2Yg
dGhlDQo+IGFyY2hpdGVjdHVyYWwgQ1BVIElEIGFueSBtb3JlLiBIb3dldmVyLCBJIGRvbid0IHVu
ZGVyc3RhbmQgaG93IGl0IHdvcmtzDQo+IGZvciB4ODYsIGFuZCBtb3JlIGNvbW1lbnRzIHJlZ2Fy
ZGluZyBpdCBjYW4gYmUgc2VlbiBiZWxvdy4NCg0KSSBtaXNzZWQgdGhlIHJlYXNvbiB3aHkgSSBo
YWQgdXNlZCAndW5zaWduZWQgbG9uZycgZXZlcnl3aGVyZSBpbiB0aGUNCmZpcnN0IGNoYW5nZS4g
WW91IGNhbiBjaGVjayB0aGUgUG93ZXJQQywgaXQgcmV0dXJucyB2Y3B1X2lkIHdoaWNoIG1pZ2h0
DQpub3QgYmUgYW4gJ2ludGVnZXInLiBIZW5jZSwgdGhpcyBjaGFuZ2UgY291bGQgYWN0dWFsbHkg
Y3JlYXRlIGEgcHJvYmxlbS4NCg0KDQo+ID4gICAgICAgaW50IGt2bV9mZDsNCj4gPiAgICAgICBR
TElTVF9FTlRSWShLVk1QYXJrZWRWY3B1KSBub2RlOw0KPiA+ICAgfTsNCj4gPiBAQCAtMTM3LDYg
KzEzNyw3IEBAIHN0YXRpYyBRZW11TXV0ZXgga21sX3Nsb3RzX2xvY2s7DQo+ID4gICAjZGVmaW5l
IGt2bV9zbG90c191bmxvY2soKSAgcWVtdV9tdXRleF91bmxvY2soJmttbF9zbG90c19sb2NrKQ0K
PiA+DQo+ID4gICBzdGF0aWMgdm9pZCBrdm1fc2xvdF9pbml0X2RpcnR5X2JpdG1hcChLVk1TbG90
ICptZW0pOw0KPiA+ICtzdGF0aWMgaW50IGt2bV9nZXRfdmNwdShLVk1TdGF0ZSAqcywgaW50IHZj
cHVfaWQpOw0KPiA+DQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jlc2FtcGxlX2ZkX3Jl
bW92ZShpbnQgZ3NpKQ0KPiA+ICAgew0KPiA+IEBAIC0zMjAsMTEgKzMyMSw0OSBAQCBlcnI6DQo+
ID4gICAgICAgcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0KPiA+ICt2b2lkIGt2bV9wYXJrX3Zj
cHUoQ1BVU3RhdGUgKmNwdSkNCj4gPiArew0KPiA+ICsgICAgaW50IHZjcHVfaWQgPSBjcHUtPmNw
dV9pbmRleDsNCj4gPiArICAgIHN0cnVjdCBLVk1QYXJrZWRWY3B1ICp2Y3B1Ow0KPiA+ICsNCj4g
PiArICAgIHZjcHUgPSBnX21hbGxvYzAoc2l6ZW9mKCp2Y3B1KSk7DQo+ID4gKyAgICB2Y3B1LT52
Y3B1X2lkID0gdmNwdV9pZDsNCj4gPiArICAgIHZjcHUtPmt2bV9mZCA9IGNwdS0+a3ZtX2ZkOw0K
PiA+ICsgICAgUUxJU1RfSU5TRVJUX0hFQUQoJmt2bV9zdGF0ZS0+a3ZtX3BhcmtlZF92Y3B1cywg
dmNwdSwgbm9kZSk7DQo+ID4gK30NCj4gPiArDQo+IA0KPiBAdmNwdV9pZCBjYW4gYmUgZHJvcHBl
ZCBhcyBzdWdnZXN0ZWQgcHJldmlvdXNseS4NCj4gDQo+ICAgICAgICAgdmNwdS0+dmNwdV9pZCA9
IGNwdS0+Y3B1X2luZGV4Ow0KDQoNClllcywgYWdyZWVkLg0KDQpUaGFua3MNClNhbGlsLg0KDQoN
Cj4gPiAraW50IGt2bV9jcmVhdGVfdmNwdShDUFVTdGF0ZSAqY3B1KQ0KPiA+ICt7DQo+ID4gKyAg
ICBpbnQgdmNwdV9pZCA9IGNwdS0+Y3B1X2luZGV4Ow0KPiA+ICsgICAgS1ZNU3RhdGUgKnMgPSBr
dm1fc3RhdGU7DQo+ID4gKyAgICBpbnQga3ZtX2ZkOw0KPiA+ICsNCj4gPiArICAgIERQUklOVEYo
Imt2bV9jcmVhdGVfdmNwdVxuIik7DQo+ID4gKw0KPiA+ICsgICAgLyogY2hlY2sgaWYgdGhlIEtW
TSB2Q1BVIGFscmVhZHkgZXhpc3QgYnV0IGlzIHBhcmtlZCAqLw0KPiA+ICsgICAga3ZtX2ZkID0g
a3ZtX2dldF92Y3B1KHMsIHZjcHVfaWQpOw0KPiA+ICsgICAgaWYgKGt2bV9mZCA8IDApIHsNCj4g
PiArICAgICAgICAvKiB2Q1BVIG5vdCBwYXJrZWQ6IGNyZWF0ZSBhIG5ldyBLVk0gdkNQVSAqLw0K
PiA+ICsgICAgICAgIGt2bV9mZCA9IGt2bV92bV9pb2N0bChzLCBLVk1fQ1JFQVRFX1ZDUFUsIHZj
cHVfaWQpOw0KPiA+ICsgICAgICAgIGlmIChrdm1fZmQgPCAwKSB7DQo+ID4gKyAgICAgICAgICAg
IGVycm9yX3JlcG9ydCgiS1ZNX0NSRUFURV9WQ1BVIElPQ1RMIGZhaWxlZCBmb3IgdkNQVSAlZCIs
IHZjcHVfaWQpOw0KPiA+ICsgICAgICAgICAgICByZXR1cm4ga3ZtX2ZkOw0KPiA+ICsgICAgICAg
IH0NCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBjcHUtPnZjcHVfZGlydHkgPSB0cnVlOw0K
PiA+ICsgICAgY3B1LT5rdm1fZmQgPSBrdm1fZmQ7DQo+ID4gKyAgICBjcHUtPmt2bV9zdGF0ZSA9
IHM7DQo+ID4gKyAgICBjcHUtPmRpcnR5X3BhZ2VzID0gMDsNCj4gPiArICAgIGNwdS0+dGhyb3R0
bGVfdXNfcGVyX2Z1bGwgPSAwOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+
ID4gKw0KPiANCj4gVGhlIGNvbW1lbnRzIGhlcmUgY2FuIGJlIGRyb3BwZWQgc2luY2UgdGhlIGNv
ZGUgaXMgc2VsZi1leHBsYWluaW5nLg0KPiANCj4gQHZjcHVfaWQgcmVwcmVzZW50cyB2Q1BVIGlu
ZGV4LCBpbnN0ZWFkIG9mIHRoZSBhcmNoaXRlY3J1YWwgdkNQVSBJRCBhbnkNCj4gbW9yZS4NCj4g
QHZjcHVfaWQgaXMgcGFzc2VkIHRvIGhvc3QgdGhyb3VnaCBpb2N0bChLVk1fQ1JFQVRFX1ZDUFUp
LCB3aGljaCBpcw0KPiBleHBlY3RlZA0KPiBhcyBhbiBhcmNoaXRlY3J1YWwgdkNQVSBJRCBpbnN0
ZWFkIG9mIGEgdkNQVSBpbmRleCBieSBob3N0LiBJdCdzIGluZGljYXRlZA0KPiBieSAnc3RydWN0
IGt2bV92Y3B1JyBhcyBiZWxvdy4NCg0KDQpUaGF0IHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGlz
IGNoYW5nZS4gSSB0aGluay4NCg0KDQo+IHN0cnVjdCBrdm1fdmNwdSB7DQo+IAk6DQo+IAlpbnQg
dmNwdV9pZDsgIC8qIGlkIGdpdmVuIGJ5IHVzZXJzcGFjZSBhdCBjcmVhdGlvbiAqLw0KPiAgICAg
ICAgICBpbnQgdmNwdV9pZHg7IC8qIGluZGV4IGludG8ga3ZtLT52Y3B1X2FycmF5ICovDQo+IH07
DQo+IA0KPiBGdW5jdGlvbiBrdm1fYXJjaF92Y3B1X2lkKCkgY29udmVydHMgdGhlIHZDUFUgaW5z
dGFuY2Ugb3IgdkNQVSBpbmRleCB0bw0KPiB0aGUgYXJjaGl0ZWNydWFsIHZDUFUgSUQuIEFsbCBh
cmNoaXRlY3R1cmVzIGV4Y2VwdCB4ODYgc2ltcGx5IHJldHVybnMNCj4gdkNQVSBpbmRleCAoQ1BV
U3RhdGU6OmNwdV9pbmRleCkgYXMgdGhlIGFyY2hpdGVjcnVyYWwgdkNQVSBJRC4geDg2IHJldHVy
bnMNCj4gdGhlIEFQSUMgSUQuIFRyZWF0aW5nIHRoZW0gZXF1YWxseSBzZWVtcyB0byBicmVhayB4
ODYuDQoNCkkgdGhpbmsgUG93ZXJQQyByZXR1cm5zIGEgZGlmZmVyZW50IElkIGFzIHdlbGwuDQoN
Cg0KWy4uLl0NCg0KPiA+IC1zdGF0aWMgaW50IGt2bV9nZXRfdmNwdShLVk1TdGF0ZSAqcywgdW5z
aWduZWQgbG9uZyB2Y3B1X2lkKQ0KPiA+ICtzdGF0aWMgaW50IGt2bV9nZXRfdmNwdShLVk1TdGF0
ZSAqcywgaW50IHZjcHVfaWQpDQo+ID4gICB7DQo+ID4gICAgICAgc3RydWN0IEtWTVBhcmtlZFZj
cHUgKmNwdTsNCj4gPg0KPiA+IEBAIC0zODQsNyArNDIwLDcgQEAgc3RhdGljIGludCBrdm1fZ2V0
X3ZjcHUoS1ZNU3RhdGUgKnMsIHVuc2lnbmVkIGxvbmcNCj4gdmNwdV9pZCkNCj4gPiAgICAgICAg
ICAgfQ0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IC0gICAgcmV0dXJuIGt2bV92bV9pb2N0bChzLCBL
Vk1fQ1JFQVRFX1ZDUFUsICh2b2lkICopdmNwdV9pZCk7DQo+ID4gKyAgICByZXR1cm4gLTE7DQo+
ID4gICB9DQo+ID4NCj4gDQo+IFdoeSB3ZSBoYXZlIC0xIGhlcmUuIC1FTk9FTlQgc2VlbXMgbW9y
ZSBkZXNjcmlwdGl2ZT8NCg0KQWdyZWVkLg0KDQpUaGFua3MNClNhbGlsLg0K
