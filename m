Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp713493ejr;
        Wed, 11 Oct 2023 02:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZxGvvut/E3+NpFmsyBDWRVSpd/A2d25Ne6GZrGnZopsxMkAD+dl6uhHwab5HVU7J2sSqA
X-Received: by 2002:a17:902:f7cf:b0:1c6:1c80:5663 with SMTP id h15-20020a170902f7cf00b001c61c805663mr16167303plw.41.1697018373840;
        Wed, 11 Oct 2023 02:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697018373; cv=none;
        d=google.com; s=arc-20160816;
        b=lnPGXwnzfahjxCLLJhcG6FG80n1zRbm76z4RkGB/eIxp0RLkl33qM4nTvmH/GF2/+e
         sO9VC836taG5A4BIJLjV6b3bqBIo0XLBIhSVu/zutbzK7sw5M4Q4qEHNw2IuVOCXZS3B
         zfaE0ZW37H94ItVycShSFmNTfFgoHNjsy51U+XS3N6oA9aEnwtoIs5o0yhl6Ehlad/jc
         wZexeM5VCHq0yU24HUcDrB5o2Mk3LzIhXIvmTNpWuLvaGlNVE13s3fzDIwr2UADxVHFe
         hoiuffOQIBC7gtse1y2Ej+2Zu9XV9mEM06H9F8Z+eT51fEcd4VJv34tsrNuQBJ3gjJVp
         rqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=WNqPPWPuO+MNIG67tzYtoVQsgLPkqytxBnNRQJp7H9Q=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=FmTB4qo3BhxLGR53Xwnonaol5pb/psTdKAostS8NYrNsdh3Rgtru90f+GM/kD7IYQ1
         oNPHV4gyICj0WqLqBIpfjcjp2ylGyH/kz3CcYDGKjBSZKGBLPjHOeLn4Y5ZIWMnONg4b
         4EZOrotfR4gCsVP68p9v9RYPzsKeBr9D6GvIMI1I/sZELlniqh29o13a5Q9X9HTKfH/8
         N3jdzfMDA2zSJV4MGD1Y5VAs98YrH+6yJgbyAfoqF5wr2dlMaV83F0hp4DjiQ3ywkchv
         DZqdcGCU+JbqbTqxMbm1RQRdm+9bTQ08HVJJaZ/eyaojrBJoseRPc1/ACBsetY29DvJh
         S2Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id lb14-20020a170902fa4e00b001b89613687bsi13282227plb.439.2023.10.11.02.59.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S57T52VXTz6JB1Q;
	Wed, 11 Oct 2023 17:56:25 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 10:59:27 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Wed, 11 Oct 2023 10:59:27 +0100
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
Subject: RE: [PATCH V4 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V4 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ+vBgREM3O/r310KkRZMgbkve2LBEHPqAgAA8E7A=
Date: Wed, 11 Oct 2023 09:59:27 +0000
Message-ID: <d1b0c94a235747aeb6817bb07e49c190@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-2-salil.mehta@huawei.com>
 <910cb268-7344-fa0b-aa1e-935ded612d3e@redhat.com>
In-Reply-To: <910cb268-7344-fa0b-aa1e-935ded612d3e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.228]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: vWp8XR7eQs8A

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDExLCAyMDIzIDg6MDkgQU0NCj4gVG86IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFy
bUBub25nbnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8u
b3JnOyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBs
cGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3Lmpv
bmVzQGxpbnV4LmRldjsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVy
aWMuYXVnZXJAcmVkaGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsNCj4gcGJvbnppbmlA
cmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgcmFmYWVsQGtlcm5l
bC5vcmc7DQo+IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsN
Cj4gZGFycmVuQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGlu
Zy5jb207DQo+IHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3Jh
Y2xlLmNvbTsNCj4gbWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5l
dDsgemh1a2VxaWFuDQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChD
KSA8d2FuZ3hpb25nZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5h
bjU1QGh1YXdlaS5jb20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29uZ3Nv
bi5jbjsgbGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMDEvMTBdIGFjY2VsL2t2bTogRXh0cmFjdCBj
b21tb24gS1ZNIHZDUFUNCj4ge2NyZWF0aW9uLHBhcmtpbmd9IGNvZGUNCj4gDQo+IEhpIFNhbGls
LA0KPiANCj4gT24gMTAvMTAvMjMgMDY6MzUsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiA+IEtWTSB2
Q1BVIGNyZWF0aW9uIGlzIGRvbmUgb25jZSBkdXJpbmcgdGhlIGluaXRpYWxpemF0aW9uIG9mIHRo
ZSBWTSB3aGVuIFFlbXUNCj4gPiB0aHJlYWQgaXMgc3Bhd25lZC4gVGhpcyBpcyBjb21tb24gdG8g
YWxsIHRoZSBhcmNoaXRlY3R1cmVzLg0KPiA+DQo+ID4gSG90LXVucGx1ZyBvZiB2Q1BVIHJlc3Vs
dHMgaW4gZGVzdHJ1Y3Rpb24gb2YgdGhlIHZDUFUgb2JqZWN0IGluIFFPTSBidXQgdGhlDQo+ID4g
Y29ycmVzcG9uZGluZyBLVk0gdkNQVSBvYmplY3QgaW4gdGhlIEhvc3QgS1ZNIGlzIG5vdCBkZXN0
cm95ZWQgYW5kIGl0cw0KPiA+IHJlcHJlc2VudGF0aXZlIEtWTSB2Q1BVIG9iamVjdC9jb250ZXh0
IGluIFFlbXUgaXMgcGFya2VkLg0KPiA+DQo+ID4gUmVmYWN0b3IgY29tbW9uIGxvZ2ljIHNvIHRo
YXQgc29tZSBBUElzIGNvdWxkIGJlIHJldXNlZCBieSB2Q1BVIEhvdHBsdWcgY29kZS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0K
PiA+IC0tLQ0KPiA+ICAgYWNjZWwva3ZtL2t2bS1hbGwuYyAgICB8IDY0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+ICAgYWNjZWwva3ZtL3RyYWNlLWV2ZW50
cyB8ICA0ICsrKw0KPiA+ICAgaW5jbHVkZS9zeXNlbXUva3ZtLmggICB8IDE2ICsrKysrKysrKysr
DQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQ0KPiA+DQo+IA0KPiBXaXRoIHRoZSBmb2xsb3dpbmcgb25lIGNvbW1lbnQgYWRkcmVzc2VkOg0K
PiANCj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQoNCg0KVGhh
bmtzDQoNCg0KWy4uLl0NCg0KPiA+IGRpZmYgLS1naXQgYS9hY2NlbC9rdm0vdHJhY2UtZXZlbnRz
IGIvYWNjZWwva3ZtL3RyYWNlLWV2ZW50cw0KPiA+IGluZGV4IDM5OWFhZWIwZWMuLjA4ZTJkYzI1
M2YgMTAwNjQ0DQo+ID4gLS0tIGEvYWNjZWwva3ZtL3RyYWNlLWV2ZW50cw0KPiA+ICsrKyBiL2Fj
Y2VsL2t2bS90cmFjZS1ldmVudHMNCj4gPiBAQCAtOSw2ICs5LDEwIEBAIGt2bV9kZXZpY2VfaW9j
dGwoaW50IGZkLCBpbnQgdHlwZSwgdm9pZCAqYXJnKSAiZGV2IGZkDQo+ICVkLCB0eXBlIDB4JXgs
IGFyZyAlcCINCj4gPiAgIGt2bV9mYWlsZWRfcmVnX2dldCh1aW50NjRfdCBpZCwgY29uc3QgY2hh
ciAqbXNnKSAiV2FybmluZzogVW5hYmxlIHRvIHJldHJpZXZlIE9ORVJFRyAlIiBQUkl1NjQgIiBm
cm9tIEtWTTogJXMiDQo+ID4gICBrdm1fZmFpbGVkX3JlZ19zZXQodWludDY0X3QgaWQsIGNvbnN0
IGNoYXIgKm1zZykgIldhcm5pbmc6IFVuYWJsZSB0byBzZXQgT05FUkVHICUiIFBSSXU2NCAiIHRv
IEtWTTogJXMiDQo+ID4gICBrdm1faW5pdF92Y3B1KGludCBjcHVfaW5kZXgsIHVuc2lnbmVkIGxv
bmcgYXJjaF9jcHVfaWQpICJpbmRleDogJWQgaWQ6ICVsdSINCj4gPiAra3ZtX2NyZWF0ZV92Y3B1
KGludCBjcHVfaW5kZXgsIHVuc2lnbmVkIGxvbmcgYXJjaF9jcHVfaWQpICJjcmVhdGluZyBLVk0g
Y3B1OiBjcHVfaW5kZXg6ICVkIGFyY2ggdmNwdS1pZDogJWx1Ig0KPiA+ICtrdm1fZ2V0X3ZjcHUo
dW5zaWduZWQgbG9uZyBhcmNoX2NwdV9pZCkgInVucGFya2luZyBLVk0gdmNwdTogYXJjaCB2Y3B1
LWlkOiAlbHUiDQo+ID4gK2t2bV9kZXN0cm95X3ZjcHUoaW50IGNwdV9pbmRleCwgdW5zaWduZWQg
bG9uZyBhcmNoX2NwdV9pZCkgImRlc3Ryb3kgdmNwdTogY3B1X2luZGV4OiAlZCBhcmNoIHZjcHUt
aWQ6ICVsdSINCj4gPiAra3ZtX3BhcmtfdmNwdShpbnQgY3B1X2luZGV4LCB1bnNpZ25lZCBsb25n
IGFyY2hfY3B1X2lkKSAicGFya2luZyBLVk0gdmNwdTogY3B1X2luZGV4OiAlZCBhcmNoIHZjcHUt
aWQ6ICVsdSINCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0aGUgZHVwbGljYXRlIGlkZW50
aWZpZXJzIGxpa2UgImNyZWF0aW5nIEtWTSBjcHUiDQo+IHNpbmNlIHRoZSBldmVudCBuYW1lIGNh
biBzZXJ2ZSB0aGUgcHVycG9zZS4gQmVzaWRlcywgdGhlIHBhcmFtZXRlcnMNCj4gYXJlIGRlc2Ny
aXB0aXZlIGJ5ICJpbmRleDogJWQgaWQ6ICVsdSIsIHVzZWQgYnkga3ZtX2luaXRfdmNwdSgpLiBX
ZSBqdXN0DQo+IG5lZWQgdG8gZm9sbG93IHRoYXQgcGF0dGVybi4gT3RoZXJ3aXNlLCBpbmNvbnNp
c3RlbnQgb3V0cHV0IHdpbGwgYmUgcHJpbnRlZA0KPiBieSBrdm1faW5pdF92Y3B1KCkgYW5kIGt2
bV9nZXRfdmNwdSgpLiBTbyBJIHdvdWxkIGNoYW5nZSB0aGVtIGxpa2UgYmVsb3c6DQo+IA0KPiBr
dm1faW5pdF92Y3B1KGludCBjcHVfaW5kZXgsIHVuc2lnbmVkIGxvbmcgYXJjaF9jcHVfaWQpICJp
bmRleDogJWQgaWQ6ICVsdSINCj4ga3ZtX2NyZWF0ZV92Y3B1KGludCBjcHVfaW5kZXgsIHVuc2ln
bmVkIGxvbmcgYXJjaF9jcHVfaWQpICJpbmRleDogJWQgaWQ6ICVsdSINCj4ga3ZtX2dldF92Y3B1
KHVuc2lnbmVkIGxvbmcgYXJjaF9jcHVfaWQpICJpZDogJWx1Ig0KPiBrdm1fZGVzdHJveV92Y3B1
KGludCBjcHVfaW5kZXgsIHVuc2lnbmVkIGxvbmcgYXJjaF9jcHVfaWQpICJpbmRleDogJWQgaWQ6
ICVsdSINCj4ga3ZtX3BhcmtfdmNwdShpbnQgY3B1X2luZGV4LCB1bnNpZ25lZCBsb25nIGFyY2hf
Y3B1X2lkKSAiaW5kZXg6ICVkIGlkOiAlbHUiDQoNCk5vIHByb2JsZW0uIFdpbGwgZml4DQoNCk9u
bHkgZXhlY3V0ZWQgYmVsb3cgdG8gY2hlY2sgZm9yIG5ldyB0cmFjZSBjb3VudGVyczoNClFlbXU+
IGluZm8gdHJhY2UtZXZlbnRzDQoNCg0KVGhhbmtzDQpTYWxpbC4NCg0K
