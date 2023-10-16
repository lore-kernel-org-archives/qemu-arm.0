Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3541836ejc;
        Mon, 16 Oct 2023 16:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsvwCJEX8Wi1Erv6yIBYXUQiE9KzrINE2/0XDXI/bt666/eETbSHs0GL0UFqTORwm4tPIj
X-Received: by 2002:a5d:4d8d:0:b0:32d:a2cd:ad0c with SMTP id b13-20020a5d4d8d000000b0032da2cdad0cmr631374wru.50.1697499627522;
        Mon, 16 Oct 2023 16:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697499627; cv=none;
        d=google.com; s=arc-20160816;
        b=t9w7eyoSfIEgZZvBHfJ4PZtFtLA1HfHFHRQJlGz3LMIZKfQ9KGSClYO1hdGyrMxY/e
         XF/dfixsRs7svFSj8sylkvyUz0WgFUcC3vIYZdMDAGukp24xWRbkqcup83RZAMYYdTOq
         IzQvIkPO+lHXuk+l7MNMh3cGY9k3CNN2F6WCyRDQfYHwBMJyBU/PtWJ/wb6XwW/9u2QT
         ZdouhSuHjKR0bJYYv2V9n2HdPFfiurxp3qwKsjirV2BWdWflQH126x/Oc9MoDknWMWBz
         NpxJ94Pe1Vyr0NLf1RJsw0mYmx9l7/mkYYw5jzRTGbKDRA9uQe6L0B0zTfz6lk2/QadM
         IMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=yvL13Kf/ZiO2M7niV+xSyrbLIaA0Eux/EGop6egTU88=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=Bdy0aPLDo3LmgtO2jUeMO95Hw4becaJvlyhlwqNIf8yfyq+gOjscvKnldWapfLL6lH
         9yAyrl+pWsivCfKO9ZrOojUF4yFAUwwXSF+ZpnYg+459XUwOUBQD7VZMTFdLoFJX293n
         VMcV1/cjJEaOaJqobSDgcPEukcRCRkN6ZLJBDY/xD5cZ13VubQPBBCcPKR9uUIE+wlaM
         AlvLulJbj0Yq3Xno6c/0Dk27aJYWRzlu9iMDEcmG4OfkTAD/tgT2M8v1whoTi8FjnSZZ
         T+G2dnPhqcRD+kttQ6NiMLx+m3BSyTrNxWjp2ZctyzjLMBCbb7cYCvhvMnE3g1E7EKhh
         UEew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x3-20020a5d4443000000b0032d96f54e44si226718wrr.738.2023.10.16.16.40.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 16:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8YW053Mrz6K91G;
	Tue, 17 Oct 2023 07:39:56 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 17 Oct 2023 00:40:25 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 17 Oct 2023 00:40:25 +0100
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
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
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
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: RE: [PATCH RFC V2 25/37] arm/virt: Add/update basic hot-(un)plug
 framework
Thread-Topic: [PATCH RFC V2 25/37] arm/virt: Add/update basic hot-(un)plug
 framework
Thread-Index: AQHZ8GIMWlBiSPD+4kyMAQi7zSjsirAw5BkAgBxMVaA=
Date: Mon, 16 Oct 2023 23:40:25 +0000
Message-ID: <80cc6c9281e5419191f46cbe058b0822@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-26-salil.mehta@huawei.com>
 <f18990cd-c211-4c23-aecb-0aec076bc19b@redhat.com>
In-Reply-To: <f18990cd-c211-4c23-aecb-0aec076bc19b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 33yLOWRS5Wa6

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogRnJpZGF5LCBTZXB0ZW1iZXIgMjksIDIwMjMgMToyMSBBTQ0KPiBUbzogU2FsaWwgTWVodGEg
PHNhbGlsLm1laHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtYXJt
QG5vbmdudS5vcmcNCj4gQ2M6IG1hekBrZXJuZWwub3JnOyBqZWFuLXBoaWxpcHBlQGxpbmFyby5v
cmc7IEpvbmF0aGFuIENhbWVyb24NCj4gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47IGxw
aWVyYWxpc2lAa2VybmVsLm9yZzsNCj4gcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyByaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnOw0KPiBpbWFtbWVkb0ByZWRoYXQuY29tOyBhbmRyZXcuam9u
ZXNAbGludXguZGV2OyBkYXZpZEByZWRoYXQuY29tOw0KPiBwaGlsbWRAbGluYXJvLm9yZzsgZXJp
Yy5hdWdlckByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IGFyZGJAa2VybmVsLm9yZzsNCj4g
b2xpdmVyLnVwdG9uQGxpbnV4LmRldjsgcGJvbnppbmlAcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5j
b207DQo+IHJhZmFlbEBrZXJuZWwub3JnOyBib3JudHJhZWdlckBsaW51eC5pYm0uY29tOyBhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnOw0KPiBsaW51eEBhcm1saW51eC5vcmcudWs7IGRhcnJlbkBvcy5h
bXBlcmVjb21wdXRpbmcuY29tOw0KPiBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyB2aXNo
bnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4ga2FybC5oZXViYXVtQG9yYWNsZS5jb207IG1p
Z3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7DQo+IHpodWtlcWlh
biA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykNCj4gPHdhbmd4aW9u
Z2ZlbmcyQGh1YXdlaS5jb20+OyB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWkuY29t
PjsNCj4gamlha2VybmVsMkBnbWFpbC5jb207IG1hb2JpYm9AbG9vbmdzb24uY247IGxpeGlhbmds
YWlAbG9vbmdzb24uY24NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBSRkMgVjIgMjUvMzddIGFybS92
aXJ0OiBBZGQvdXBkYXRlIGJhc2ljIGhvdC0odW4pcGx1Zw0KPiBmcmFtZXdvcmsNCj4gDQo+IEhp
IFNhbGlsLA0KPiANCj4gT24gOS8yNi8yMyAyMDowNCwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4g
QWRkIENQVSBob3QtdW5wbHVnIGhvb2tzIGFuZCB1cGRhdGUgaG90cGx1ZyBob29rcyB3aXRoIGFk
ZGl0aW9uYWwgc2FuaXR5IGNoZWNrcw0KPiA+IGZvciB1c2UgaW4gaG90cGx1ZyBwYXRocy4NCj4g
Pg0KPiA+IE5vdGUsIEZ1bmN0aW9uYWwgY29udGVudHMgb2YgdGhlIGhvb2tzKG5vdyBsZWZ0IHdp
dGggVE9ETyBjb21tZW50KSBzaGFsbCBiZQ0KPiA+IGdyYWR1YWxseSBmaWxsZWQgaW4gdGhlIHN1
YnNlcXVlbnQgcGF0Y2hlcyBpbiBhbiBpbmNyZW1lbnRhbCBhcHByb2FjaCB0byBwYXRjaA0KPiA+
IGFuZCBsb2dpYyBidWlsZGluZyB3aGljaCB3b3VsZCBiZSByb3VnaGx5IGFzIGZvbGxvd3M6DQo+
ID4gMS4gKFVuLSl3aXJpbmcgb2YgaW50ZXJydXB0cyBiZXR3ZWVuIHZDUFU8LT5HSUMNCj4gPiAy
LiBTZW5kaW5nIGV2ZW50cyB0byBHdWVzdCBmb3IgaG90LSh1bilwbHVnIHNvIHRoYXQgZ3Vlc3Qg
Y2FuIHRha2UgYXBwcm9wcmlhdGUNCj4gPiAgICAgYWN0aW9ucy4NCj4gPiAzLiBOb3RpZnlpbmcg
R0lDIGFib3V0IGhvdC0odW4pcGx1ZyBhY3Rpb24gc28gdGhhdCB2Q1BVIGNvdWxkIGJlICh1bi0p
c3RpdGNoZWQNCj4gPiAgICAgdG8gdGhlIEdJQyBDUFUgaW50ZXJmYWNlLg0KPiA+IDQuIFVwZGF0
aW5nIHRoZSBHdWVzdCB3aXRoIE5leHQgYm9vdCBpbmZvIGZvciB0aGlzIHZDUFUgaW4gdGhlIGZp
cm13YXJlLg0KPiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVo
dGFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVo
dGFAaHVhd2VpLmNvbT4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlh
bjFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4x
QGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRh
QGh1YXdlaS5jb20+DQoNClsuLi5dDQoNCj4gPiBAQCAtMjk4NSwxMiArMjk4NiwyMyBAQCBzdGF0
aWMgdm9pZCB2aXJ0X2NwdV9wcmVfcGx1ZyhIb3RwbHVnSGFuZGxlcg0KPiAqaG90cGx1Z19kZXYs
IERldmljZVN0YXRlICpkZXYsDQo+ID4gICB7DQo+ID4gICAgICAgVmlydE1hY2hpbmVTdGF0ZSAq
dm1zID0gVklSVF9NQUNISU5FKGhvdHBsdWdfZGV2KTsNCj4gPiAgICAgICBNYWNoaW5lU3RhdGUg
Km1zID0gTUFDSElORShob3RwbHVnX2Rldik7DQo+ID4gKyAgICBNYWNoaW5lQ2xhc3MgKm1jID0g
TUFDSElORV9HRVRfQ0xBU1MobXMpOw0KPiA+ICAgICAgIEFSTUNQVSAqY3B1ID0gQVJNX0NQVShk
ZXYpOw0KPiA+ICAgICAgIENQVVN0YXRlICpjcyA9IENQVShkZXYpOw0KPiA+ICAgICAgIENQVUFy
Y2hJZCAqY3B1X3Nsb3Q7DQo+ID4gICAgICAgaW50MzJfdCBtaW5fY3B1aWQgPSAwOw0KPiA+ICAg
ICAgIGludDMyX3QgbWF4X2NwdWlkOw0KPiA+DQo+ID4gKyAgICBpZiAoZGV2LT5ob3RwbHVnZ2Vk
ICYmICF2bXMtPmFjcGlfZGV2KSB7DQo+ID4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiR0VE
IGFjcGkgZGV2aWNlIGRvZXMgbm90IGV4aXN0cyIpOw0KPiA+ICsgICAgICAgIHJldHVybjsNCj4g
PiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBpZiAoZGV2LT5ob3RwbHVnZ2VkICYmICFtYy0+aGFz
X2hvdHBsdWdnYWJsZV9jcHVzKSB7DQo+ID4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiQ1BV
IGhvdHBsdWcgbm90IHN1cHBvcnRlZCBvbiB0aGlzIG1hY2hpbmUiKTsNCj4gPiArICAgICAgICBy
ZXR1cm47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiANCj4gSSBndWVzcyB0aGVzZSBjYW4gYmUgY29t
YmluZWQgdG86DQo+IA0KPiAgICAgICAgIGlmIChkZXYtPmhvdHBsdWdnZWQgJiYgKCFtYy0+aGFz
X2hvdHBsdWdnYWJsZV9jcHVzIHx8ICF2bXMtPmFjcGlfZGV2KSkgew0KPiAgICAgICAgICAgICBl
cnJvcl9zZXRnKGVycnAsICJDUFUgaG90cGx1ZyBub3Qgc3VwcG9ydGVkIG9yIEdFRCBBQ1BJIGRl
dmljZSBub3QgZXhpc3QiKTsNCj4gICAgICAgICB9DQoNCg0KQWJvdmUgY2hlY2tzIGV4aXN0cyBi
ZWNhdXNlIEkgd2FudGVkIGRpZmZlcmVudCBlcnJvciBzdHJpbmdzIGZvciBlYWNoLg0KDQoNCj4g
DQo+IEJlc2lkZXMsIG5lZWQgd2UgY2hlY2sgKHZtcy0+Z2ljX3ZlcnNpb24gPT0gVklSVF9HSUNf
VkVSU0lPTl8zKT8NCg0KRmxhZyAnIG1jLT5oYXNfaG90cGx1Z2dhYmxlX2NwdXMnIHRha2VzIGNh
cmUgYWxsIG9mIHRoYXQuDQoNCg0KPiANCj4gPiAgICAgICAvKiBzYW5pdHkgY2hlY2sgdGhlIGNw
dSAqLw0KPiA+ICAgICAgIGlmICghb2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoY3B1KSwgbXMt
PmNwdV90eXBlKSkgew0KPiA+ICAgICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJJbnZhbGlkIENQ
VSB0eXBlLCBleHBlY3RlZCBjcHUgdHlwZTogJyVzJyIsDQo+ID4gQEAgLTMwMzksNiArMzA1MSwy
MiBAQCBzdGF0aWMgdm9pZCB2aXJ0X2NwdV9wcmVfcGx1ZyhIb3RwbHVnSGFuZGxlcg0KPiAqaG90
cGx1Z19kZXYsIERldmljZVN0YXRlICpkZXYsDQo+ID4gICAgICAgfQ0KPiA+ICAgICAgIHZpcnRf
Y3B1X3NldF9wcm9wZXJ0aWVzKE9CSkVDVChjcyksIGNwdV9zbG90LCBlcnJwKTsNCj4gPg0KPiA+
ICsgICAgLyoNCj4gPiArICAgICAqIEZpeCB0aGUgR0lDIGZvciB0aGlzIG5ldyB2Q1BVIGJlaW5n
IHBsdWdnZWQuIFRoZSBRT00gQ1BVIG9iamVjdCBmb3IgdGhlDQo+ID4gKyAgICAgKiBuZXcgdkNQ
VSBuZWVkIHRvIGJlIHVwZGF0ZWQgaW4gdGhlIGNvcnJlc3BvbmRpbmcgUU9NIEdJQ3YzQ1BVU3Rh
dGUgb2JqZWN0DQo+ID4gKyAgICAgKiBXZSBhbHNvIG5lZWQgdG8gcmUtd2lyZSB0aGUgSVJRcyBm
b3IgdGhpcyBuZXcgQ1BVIG9iamVjdC4gVGhpcyB1cGRhdGUNCj4gPiArICAgICAqIGlzIGxpbWl0
ZWQgdG8gdGhlIFFPTSBvbmx5IGFuZCBkb2VzIG5vdCBhZmZlY3RzIHRoZSBLVk0uIExhdGVyIGhh
cw0KPiA+ICsgICAgICogYWxyZWFkeSBiZWVuIHByZS1zaXplZCB3aXRoIHBvc3NpYmxlIENQVSBh
dCBWTSBpbml0IHRpbWUuIFRoaXMgaXMgYQ0KPiA+ICsgICAgICogd29ya2Fyb3VuZCB0byB0aGUg
Y29uc3RyYWludHMgcG9zZWQgYnkgQVJNIGFyY2hpdGVjdHVyZSB3LnIudCBzdXBwb3J0aW5nDQo+
ID4gKyAgICAgKiBDUFUgSG90cGx1Zy4gU3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBleGlzdCBmb3Ig
dGhlIGxhdGVyLg0KPiA+ICsgICAgICogVGhpcyBwYXRjaC11cCBpcyByZXF1aXJlZCBib3RoIGZv
ciB7Y29sZCxob3R9LXBsdWdnZWQgdkNQVXMuIENvbGQtaW5pdGVkDQo+ID4gKyAgICAgKiB2Q1BV
cyBoYXZlIHRoZWlyIEdJQyBzdGF0ZSBpbml0aWFsaXplZCBkdXJpbmcgbWFjaHZpdF9pbml0KCku
DQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlmICh2bXMtPmFjcGlfZGV2KSB7DQo+ID4gKyAgICAg
ICAgLyogVE9ETzogdXBkYXRlIEdJQyBhYm91dCB0aGlzIGhvdHBsdWcgY2hhbmdlIGhlcmUgKi8N
Cj4gPiArICAgICAgICAvKiBUT0RPOiB3aXJlIHRoZSBHSUM8LT5DUFUgaXJxcyAqLw0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gDQo+IFdoZW4gbG9va2luZyBhdCB0aGVzZSAnVE9ETycsIGl0IHNlZW1z
IHlvdSBuZWVkIG9yZGVyIHRoZSBwYXRjaGVzIHRvIG1ha2UgdGhvc2UNCj4gcHJlcGFyYXRvcnkg
cGF0Y2hlcyBhaGVhZCBvZiB0aGlzIG9uZS4gSW4gdGhpcyB3YXksIHRoZSAnVE9ETycgY2FuIGJl
IGF2b2lkZWQuDQoNCk1heWJlIGJ1dCBpdCB3aWxsIGJyZWFrIHN0ZXAgd2lzZSBmbG93IG9mIHRo
ZSBwYXRjaC1zZXQNCg0KDQpbLi4uXQ0KDQo+ID4gQEAgLTMwNTgsMTAgKzMwODcsODEgQEAgc3Rh
dGljIHZvaWQgdmlydF9jcHVfcGx1ZyhIb3RwbHVnSGFuZGxlcg0KPiAqaG90cGx1Z19kZXYsIERl
dmljZVN0YXRlICpkZXYsDQo+ID4gICAgICAgY3B1X3Nsb3QgPSB2aXJ0X2ZpbmRfY3B1X3Nsb3Qo
bXMsIGNzLT5jcHVfaW5kZXgpOw0KPiA+ICAgICAgIGNwdV9zbG90LT5jcHUgPSBPQkpFQ1QoZGV2
KTsNCj4gPg0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIFVwZGF0ZSB0aGUgQUNQSSBIb3RwbHVn
IHN0YXRlIGJvdGggZm9yIHZDUFVzIGJlaW5nIHtob3QsY29sZH0tcGx1Z2dlZC4NCj4gPiArICAg
ICAqIHZDUFVzIGNhbiBiZSBjb2xkLXBsdWdnZWQgdXNpbmcgJy1kZXZpY2UnIG9wdGlvbi4gRm9y
IHZDUFVzIGJlaW5nIGhvdA0KPiA+ICsgICAgICogcGx1Z2dlZCwgZ3Vlc3QgaXMgYWxzbyBub3Rp
ZmllZC4NCj4gPiArICAgICAqLw0KPiA+ICsgICAgaWYgKHZtcy0+YWNwaV9kZXYpIHsNCj4gPiAr
ICAgICAgICAvKiBUT0RPOiB1cGRhdGUgYWNwaSBob3RwbHVnIHN0YXRlLiBTZW5kIGNwdSBob3Rw
bHVnIGV2ZW50IHRvIGd1ZXN0ICovDQo+ID4gKyAgICAgICAgLyogVE9ETzogcmVnaXN0ZXIgY3B1
IGZvciByZXNldCAmIHVwZGF0ZSBGL1cgaW5mbyBmb3IgdGhlIG5leHQgYm9vdCAqLw0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gDQo+IFdlIG5lZWRuJ3QgdmFsaWRhdGUgdm1zLT5hY3BpX2RldiBhZ2Fp
biBzaW5jZSBpdCBoYXMgYmVlbiBkb25lIGluIHByZV9wbHVnKCkuDQoNCldlIHdhbnQgdGhpcyBs
ZWcgdG8gYmUgY29uZGl0aW9uYWwgZm9yIGNvbGQgaW5pdGVkIENQVXMuDQoNCg0KWy4uLl0NCg0K
PiA+ICtzdGF0aWMgdm9pZCB2aXJ0X2NwdV91bnBsdWcoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdf
ZGV2LCBEZXZpY2VTdGF0ZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RXJyb3IgKiplcnJwKQ0KPiA+ICt7DQo+ID4gKyAgICBWaXJ0TWFjaGluZVN0YXRlICp2bXMgPSBW
SVJUX01BQ0hJTkUoaG90cGx1Z19kZXYpOw0KPiA+ICsgICAgTWFjaGluZVN0YXRlICptcyA9IE1B
Q0hJTkUoaG90cGx1Z19kZXYpOw0KPiA+ICsgICAgQ1BVU3RhdGUgKmNzID0gQ1BVKGRldik7DQo+
ID4gKyAgICBDUFVBcmNoSWQgKmNwdV9zbG90Ow0KPiA+ICsNCj4gPiArICAgIGlmICghdm1zLT5h
Y3BpX2RldiB8fCAhZGV2LT5yZWFsaXplZCkgew0KPiA+ICsgICAgICAgIGVycm9yX3NldGcoZXJy
cCwgIkdFRCBkb2VzIG5vdCBleGlzdHMgb3IgZGV2aWNlIGlzIG5vdCByZWFsaXplZCEiKTsNCj4g
PiArICAgICAgICByZXR1cm47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgY3B1X3Nsb3Qg
PSB2aXJ0X2ZpbmRfY3B1X3Nsb3QobXMsIGNzLT5jcHVfaW5kZXgpOw0KPiA+ICsNCj4gPiArICAg
IC8qIFRPRE86IHVwZGF0ZSB0aGUgYWNwaSBjcHUgaG90cGx1ZyBzdGF0ZSBmb3IgY3B1IGhvdC11
bnBsdWcgKi8NCj4gPiArDQo+ID4gKyAgICAvKiBUT0RPOiB1bndpcmUgdGhlIGdpYy1jcHUgaXJx
cyBoZXJlICovDQo+ID4gKyAgICAvKiBUT0RPOiB1cGRhdGUgdGhlIEdJQyBhYm91dCB0aGlzIGhv
dCB1bnBsdWcgY2hhbmdlICovDQo+ID4gKw0KPiA+ICsgICAgLyogVE9ETzogdW5yZWdpc3RlciBj
cHUgZm9yIHJlc2V0ICYgdXBkYXRlIEYvVyBpbmZvIGZvciB0aGUgbmV4dCBib290ICovDQo+ID4g
Kw0KPiANCj4gU2FtZSBhcyBhYm92ZS4NCg0KSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIEJ1dCB3
aWxsIHNwb2lsIHRoZSBmbG93IG9mIHBhdGgtc2V0DQoNClRoYW5rcw0KU2FsaWwuDQo=
