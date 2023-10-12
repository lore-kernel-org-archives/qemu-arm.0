Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp672140ejc;
        Thu, 12 Oct 2023 02:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZVlRdQ68zNEdk/Qauwf7lYC6HQsy45UGeowCaFRZ/MSgpy4IkihJG0S0ZPEMbAOV1Pupm
X-Received: by 2002:adf:a19b:0:b0:32d:8942:9ff6 with SMTP id u27-20020adfa19b000000b0032d89429ff6mr2763450wru.68.1697102383614;
        Thu, 12 Oct 2023 02:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697102383; cv=none;
        d=google.com; s=arc-20160816;
        b=V1QyM6DhT0421zHLuBajMXdVN1loUrEm1cqYwIwGN636QFRPMHkjiNTz2SQ/X6N2vh
         D1MFWrF+nA+6PHb01X0D2/CkG/qhz3s0q+q1fbibW2C8gQPU2lYSYx5TUNxQjTBmfzfz
         aEZrKWV/UTfaS96CRF2pf2QbJLquljV6ez6oISbrWXYImWOfIilc7xht+/OLFf4sQHGM
         sZpJ0AJA2cl8aKfvPyyGaNv36f+wKhb0/XByoFzlK5GvxaHF4sgW7MXu/v1PQDJANAV+
         1FuchD3fMVbyjl9G+HLlGIaRK+grIQHjBrMj9W2Iq/ytpeoUzmjSF3ARDhQqCaaMAQ10
         cWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Q2fpQtbTUDAJ29v2DlJSxnVYZoM/s4TM+WjQ7lo6Oxs=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=EnabaQ5RAbnhaYdxsX23X+xmHYUtjsL5Sadujv7SoZH1M156IJCx4mGiTyRUqiXwqr
         5Qp6SEYZ1xY4wdIw1mn838TAOr3WF9DDFfRPk7lrjxD6IgDBkvFdCIj6B+C91sR7Ekwv
         GfBXIouxnZI5LMNLYEduiu0jMtJ60M7G5mJUUeD4q/Tia6wgs45WRO++we0n/eZLF28S
         lpqnRCnxHZr7iR/CxFVYOl1GB4tmSvZZ8+MmzoP4zNrVtFeOkzgfn5DZ2s+/HLDTUzRA
         sGxOR5VvDS3UCspx5M3JgHqEUJlS9lNNZNVB3qQHojECJxXrDnHvQGIY4jR7mmxhiNkN
         88ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id l12-20020a5d668c000000b003248c93950csi6682448wru.952.2023.10.12.02.19.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500003.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5kYt4tDrz6K5v5;
	Thu, 12 Oct 2023 17:17:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 10:19:41 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Thu, 12 Oct 2023 10:19:41 +0100
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
Subject: RE: [PATCH V5 9/9] gdbstub: Add helper function to unregister GDB
 register space
Thread-Topic: [PATCH V5 9/9] gdbstub: Add helper function to unregister GDB
 register space
Thread-Index: AQHZ/HvBN0u3se0o1kicXc2uo3J6h7BFNl4AgACq53A=
Date: Thu, 12 Oct 2023 09:19:41 +0000
Message-ID: <bb13b0ee0a3544c7891ac29ecceb73d5@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-10-salil.mehta@huawei.com>
 <ca79ed5f-b807-10eb-8f79-c2def1ab028f@redhat.com>
In-Reply-To: <ca79ed5f-b807-10eb-8f79-c2def1ab028f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.35.158]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 8+p1cmivmlVa

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIE9jdG9iZXIgMTIsIDIwMjMgMTowNyBBTQ0KPiBUbzogU2FsaWwgTWVodGEg
PHNhbGlsLm1laHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+
IGFybUBub25nbnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5h
cm8ub3JnOyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+
OyBscGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3
LmpvbmVzQGxpbnV4LmRldjsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7
IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsNCj4gcGJvbnpp
bmlAcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgcmFmYWVsQGtl
cm5lbC5vcmc7DQo+IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51
azsNCj4gZGFycmVuQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1
dGluZy5jb207DQo+IHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1A
b3JhY2xlLmNvbTsNCj4gbWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3Jj
Lm5ldDsgemh1a2VxaWFuDQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5n
IChDKSA8d2FuZ3hpb25nZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5
YW5hbjU1QGh1YXdlaS5jb20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29u
Z3Nvbi5jbjsgbGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdl
aS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjUgOS85XSBnZGJzdHViOiBBZGQgaGVscGVy
IGZ1bmN0aW9uIHRvIHVucmVnaXN0ZXIgR0RCDQo+IHJlZ2lzdGVyIHNwYWNlDQo+IA0KPiBIaSBT
YWxpbCwNCj4gDQo+IE9uIDEwLzEyLzIzIDA1OjQzLCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiBB
ZGQgY29tbW9uIGZ1bmN0aW9uIHRvIGhlbHAgdW5yZWdpc3RlciB0aGUgR0RCIFJlZ2lzdGVyIFNw
YWNlLiBUaGlzIHNoYWxsDQo+IGJlDQo+ID4gZG9uZSBpbiBjb250ZXh0IHRvIHRoZSBDUFUgdW5y
ZWFsaXphdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5t
ZWh0YUBodWF3ZWkuY29tPg0KPiA+IFRlc3RlZC1ieTogVmlzaG51IFBhamp1cmkgPHZpc2hudUBv
cy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZ2Ric3R1Yi9nZGJzdHViLmMg
ICAgICB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ICAgaW5jbHVkZS9leGVjL2dkYnN0dWIuaCB8
ICA1ICsrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykNCj4gPg0K
PiANCj4gV2l0aCB0aGUgZm9sbG93aW5nIG5pdHMgYWRkcmVzc2VkOg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQo+IA0KPiA+IGRpZmYgLS1naXQgYS9n
ZGJzdHViL2dkYnN0dWIuYyBiL2dkYnN0dWIvZ2Ric3R1Yi5jDQo+ID4gaW5kZXggMzQ5ZDM0OGM3
Yi4uOTdiODllMmQwMCAxMDA2NDQNCj4gPiAtLS0gYS9nZGJzdHViL2dkYnN0dWIuYw0KPiA+ICsr
KyBiL2dkYnN0dWIvZ2Ric3R1Yi5jDQo+ID4gQEAgLTQ5MSw2ICs0OTEsMjEgQEAgdm9pZCBnZGJf
cmVnaXN0ZXJfY29wcm9jZXNzb3IoQ1BVU3RhdGUgKmNwdSwNCj4gPiAgICAgICB9DQo+ID4gICB9
DQo+ID4NCj4gPiArdm9pZCBnZGJfdW5yZWdpc3Rlcl9jb3Byb2Nlc3Nvcl9hbGwoQ1BVU3RhdGUg
KmNwdSkNCj4gPiArew0KPiA+ICsgICAgR0RCUmVnaXN0ZXJTdGF0ZSAqcywgKnA7DQo+ID4gKw0K
PiA+ICsgICAgcCA9IGNwdS0+Z2RiX3JlZ3M7DQo+ID4gKyAgICB3aGlsZSAocCkgew0KPiA+ICsg
ICAgICAgIHMgPSBwOw0KPiA+ICsgICAgICAgIHAgPSBwLT5uZXh0Ow0KPiA+ICsgICAgICAgIC8q
IHMtPnhtbCBpcyBzdGF0aWMgY29uc3QgY2hhciBzbyBpc24ndCBmcmVlZCAqLw0KPiA+ICsgICAg
ICAgIGdfZnJlZShzKTsNCj4gPiArICAgIH0NCj4gPiArICAgIGNwdS0+Z2RiX3JlZ3MgPSBOVUxM
Ow0KPiANCj4gICAgICAgICBjcHUtPmJhc2VfcmVnID0gMDsNCj4gICAgICAgICBjcHUtPm51bV9y
ZWdzID0gMDsNCg0KDQpTdXJlLiB0aGFua3MNCg0KU2FsaWwuDQoNCj4gDQo+ID4gKyAgICBjcHUt
PmdkYl9udW1fZ19yZWdzID0gMDsNCj4gPiArfQ0K
