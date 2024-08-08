Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp422421njc;
        Thu, 8 Aug 2024 01:36:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKJ6UZykBE2oHGTqqvt2XkWE5Dtmhw/dJVNv2Z66nhjUPbSwxIQ+bdDkgmm+dEUEPa/O/e80T7iPjvM7fXgjOr0UV47dtE
X-Google-Smtp-Source: AGHT+IEs14dw+PT7+xhpjLmuxIWgWKJxyMr+ONr1jtJn+4YsmHZbR+Y1dstNR/5yuitwwrYzug/r
X-Received: by 2002:a05:6512:a96:b0:52e:7125:c70a with SMTP id 2adb3069b0e04-530e5892285mr709539e87.47.1723106210030;
        Thu, 08 Aug 2024 01:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723106209; cv=none;
        d=google.com; s=arc-20160816;
        b=xXZ4+lnNlQpgCyNl2WB/jJ9lncXTpB8TZTsKXXy/e8IWE/8lBNkP64Q59jS3ChKqWz
         3gLip3i+T0Dqgsv1ZglB/uDwWeofK16yucVB7JQHT92yVEUZ9SI3+4NCS6GsA0jBZfLG
         q5dBaHIcunIWLz4HVS3yIl+MHQGpNiR5CfnAy0huY2xARL0t91c+bv7bsXEXJfHzdVQ1
         DzGfKmIhK9U+hZw7oTxpRK7xs44nniyqoiUdlrcSqIbe37fryh8LJYh4gzJy/u+qujmG
         DFgl6Q4iR1LxjaA3XsMbUHmgzbRA+G1bIJiSxpuBj4+o4/97rEzT8tRFhjSCOITm6VoT
         sIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=RZKcgrlXJXoJMZSzZpH278GrWW6abF8AeoipLtoho/Y=;
        fh=IcghoZT+iwDwnUWe0/8u2lfgCRl3Js+UrcNMjs/i9hE=;
        b=LfDCFeyIaqBCsVanBKrnops3rVhcHPm0lx6/rbOlBslKwGaT3i1FT5/CyIt5IDYaEH
         cEnLbKYVirmU/aElrZ/Pm/MUrqhO/hqR2jq0Ily7z8Tj9JwWmnTKASnPLQq6t85RDI08
         b9kYquuotkpO0Og8pYfIbKQ7eI2bmcw/dYMC4P9WXTtv6AeP3lLODdgGJ9xgfc3/riDm
         LpaMWRzAcQO+e2Lz6NA1+K0Nx8t1eNUJWOEym5H3tkGkYZwv1SUa8gPCKzc2IowYkXNL
         z+CqkCFm5gFftuvi7DBvx7lsJQxTfmXFnzgEIH9+ypJAv2Aker6fg0qXILcSWXBFulXO
         dTZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36d272c023bsi510742f8f.916.2024.08.08.01.36.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2024 01:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WfgM73GBxz6K5sy;
	Thu,  8 Aug 2024 16:34:27 +0800 (CST)
Received: from lhrpeml100006.china.huawei.com (unknown [7.191.160.224])
	by mail.maildlp.com (Postfix) with ESMTPS id D1327140B2F;
	Thu,  8 Aug 2024 16:36:48 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 09:36:48 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Thu, 8 Aug 2024 09:36:48 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>
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
	<pbonzini@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
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
	"shahuang@redhat.com" <shahuang@redhat.com>, "zhao1.liu@intel.com"
	<zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Topic: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Index: AQHaveq2F6TAeAWelEWGVYAetyN5RLIb0soAgABLdWCAAJu0gIAAEapQ///7ygCAAJiKwA==
Date: Thu, 8 Aug 2024 08:36:48 +0000
Message-ID: <4f0a035e49c249508385c13b1bbc7bb9@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<41fbfa5a-a10f-4ca0-8a52-e447043ff306@redhat.com>
	<ed0a5631e0674c2aa4679f2388f40127@huawei.com>
	<5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
	<44d06db6ec1b416d8817b7cf5043ddf8@huawei.com>
 <c2dce623-ee44-47d5-b9cb-73481a86b75f@redhat.com>
In-Reply-To: <c2dce623-ee44-47d5-b9cb-73481a86b75f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.245.88]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: iEUBTefYdmKB

SGkgR2F2aW4sDQoNCj4gIEZyb206IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQo+ICBT
ZW50OiBUaHVyc2RheSwgQXVndXN0IDgsIDIwMjQgMToyOSBBTQ0KPiAgVG86IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiAgcWVt
dS1hcm1Abm9uZ251Lm9yZzsgbXN0QHJlZGhhdC5jb20NCj4gIA0KPiAgSGkgU2FsaWwsDQo+ICAN
Cj4gIE9uIDgvOC8yNCA5OjQ4IEFNLCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gID4+ICAgT24gOC83
LzI0IDExOjI3IFBNLCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gID4+ICAgPg0KPiAgPj4gICA+IExl
dCBtZSBmaWd1cmUgb3V0IHRoaXMuIEhhdmUgeW91IGFsc28gaW5jbHVkZWQgdGhlIGJlbG93IHBh
dGNoIGFsb25nDQo+ICA+PiAgID4gd2l0aCB0aGUgYXJjaGl0ZWN0dXJlIGFnbm9zdGljIHBhdGNo
LXNldCBhY2NlcHRlZCBpbiB0aGlzIFFlbXUgY3ljbGU/DQo+ICA+PiAgID4NCj4gID4+ICAgPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MDExNDIzMjIuMzk0ODg2Ni0zLQ0KPiAg
cGV0ZXIubWF5ZGVsbEBsaW4NCj4gID4+ICAgPiBhcm8ub3JnLw0KPiAgPj4gICA+DQo+ICA+Pg0K
PiAgPj4gICBUaGVyZSBhcmUgbm8gdkNQVSBmZCB0byBiZSBwYXJrZWQgYW5kIHVucGFya2VkIHdo
ZW4gdGhlIGNvcmUgZHVtcA0KPiAgPj4gICBoYXBwZW5lcy4gSSB0cmllZCBpdCwgYnV0IGRpZG4n
dCBoZWxwLiBJIGFkZGVkIG1vcmUgZGVidWdnaW5nIG1lc3NhZ2VzDQo+ICBhbmQNCj4gID4+ICAg
dGhlIGNvcmUgZHVtcCBpcyB0cmlnZ2VyZWQgaW4gdGhlIGZvbGxvd2luZyBwYXRoLiBJdCBzZWVt
cyAnY3B1LQ0KPiAgPj4gICA+c3ZlX3ZxLm1hcCcgaXNuJ3QgY29ycmVjdCBzaW5jZSBpdCdzIHBv
cHVsYXRlZCBpbiBDUFUgcmVhbGl6YXRpb24gcGF0aCwNCj4gIGFuZA0KPiAgPj4gICB0aG9zZSBu
b24tY29sZC1ib290ZWQgQ1BVcyBhcmVuJ3QgcmVhbGl6ZWQgaW4gdGhlIGJvb3Rpbmcgc3RhZ2Uu
DQo+ICA+DQo+ICA+DQo+ICA+IEFoLCBJJ3ZlIHRvIGZpeCB0aGUgU1ZFIHN1cHBvcnQuIEknbSBh
bHJlYWR5IHdvcmtpbmcgb24gaXQgYW5kIHdpbGwgYmUNCj4gID4gcGFydCBvZiB0aGUgUkZDIFY0
Lg0KPiAgPg0KPiAgPiBIYXZlIHlvdSB0cmllZCBib290aW5nIFZNIGJ5IGRpc2FibGluZyB0aGUg
U1ZFIHN1cHBvcnQ/DQo+ICA+DQo+ICANCj4gIEknbSBhYmxlIHRvIGJvb3QgdGhlIGd1ZXN0IGFm
dGVyIFNWRSBpcyBkaXNhYmxlZCBieSBjbGVhcmluZyB0aGUNCj4gIGNvcnJlc3BvbmRpbmcgYml0
cyBpbiBJRF9BQTY0UEZSMCwgYXMgYmVsb3cuDQo+ICANCj4gIHN0YXRpYyBib29sIGt2bV9hcm1f
Z2V0X2hvc3RfY3B1X2ZlYXR1cmVzKEFSTUhvc3RDUFVGZWF0dXJlcyAqYWhjZikNCj4gIHsNCj4g
ICAgICAgOg0KPiAgDQo+ICAgICAgIC8qDQo+ICAgICAgICAqIFNWRSBpcyBleHBsaWNpdGx5IGRp
c2FibGVkLiBPdGhlcndpc2UsIHRoZSBub24tY29sZC1ib290ZWQNCj4gICAgICAgICogQ1BVcyBj
YW4ndCBiZSBpbml0aWFsaXplZCBpbiB0aGUgdkNQVSBob3RwbHVnIHNjZW5hcmlvLg0KPiAgICAg
ICAgKi8NCj4gICAgICAgZXJyID0gcmVhZF9zeXNfcmVnNjQoZmRhcnJheVsyXSwgJmFoY2YtPmlz
YXIuaWRfYWE2NHBmcjAsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSTTY0X1NZU19S
RUcoMywgMCwgMCwgNCwgMCkpOw0KPiAgICAgICBhaGNmLT5pc2FyLmlkX2FhNjRwZnIwICY9IH5S
X0lEX0FBNjRQRlIwX1NWRV9NQVNLOyB9DQo+ICANCj4gIEhvd2V2ZXIsIEknbSB1bmFibGUgdG8g
aG90LWFkZCBhIHZDUFUgYW5kIGhhdmVuJ3QgZ2V0IGEgY2hhbmNlIHRvIGxvb2sgYXQNCj4gIGl0
IGNsb3NlbHkuDQo+ICANCj4gIChxZW11KSBkZXZpY2VfYWRkIGhvc3QtYXJtLWNwdSxpZD1jcHUs
c29ja2V0LWlkPTENCj4gIChxZW11KSBbICAyNTguOTAxMDI3XSBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCB3cml0ZSB0byByZWFkLW9ubHkgbWVtb3J5DQo+ICBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZm
ZjgwMDA4MGZhNzE5MCBbICAyNTguOTAxNjg2XSBNZW0gYWJvcnQgaW5mbzoNCj4gIFsgIDI1OC45
MDE4ODldICAgRVNSID0gMHgwMDAwMDAwMDk2MDAwMDRlDQo+ICBbICAyNTguOTAyMTYwXSAgIEVD
ID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiAgWyAgMjU4LjkwMjU0
M10gICBTRVQgPSAwLCBGblYgPSAwDQo+ICBbICAyNTguOTAyNzYzXSAgIEVBID0gMCwgUzFQVFcg
PSAwDQo+ICBbICAyNTguOTAyOTkxXSAgIEZTQyA9IDB4MGU6IGxldmVsIDIgcGVybWlzc2lvbiBm
YXVsdA0KPiAgWyAgMjU4LjkwMzMzOF0gRGF0YSBhYm9ydCBpbmZvOg0KPiAgWyAgMjU4LjkwMzU0
N10gICBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMDRlLCBJU1MyID0gMHgwMDAwMDAwMA0KPiAgWyAg
MjU4LjkwMzk0M10gICBDTSA9IDAsIFduUiA9IDEsIFRuRCA9IDAsIFRhZ0FjY2VzcyA9IDANCj4g
IFsgIDI1OC45MDQzMDRdICAgR0NTID0gMCwgT3ZlcmxheSA9IDAsIERpcnR5Qml0ID0gMCwgWHMg
PSAwDQo+ICBbICAyNTguOTA0Njg3XSBzd2FwcGVyIHBndGFibGU6IDRrIHBhZ2VzLCA0OC1iaXQg
VkFzLA0KPiAgcGdkcD0wMDAwMDAwMGI4ZTI0MDAwIFsgIDI1OC45MDUyNThdIFtmZmZmODAwMDgw
ZmE3MTkwXQ0KPiAgcGdkPTEwMDAwMDAwYjk1YjAwMDMsIHA0ZD0xMDAwMDAwMGI5NWIwMDAzLCBw
dWQ9MTAwMDAwMDBiOTViMTAwMywNCj4gIHBtZD0wMDYwMDAwMGI4YzAwNzgxIFsgIDI1OC45MDYw
MjZdIEludGVybmFsIGVycm9yOiBPb3BzOg0KPiAgMDAwMDAwMDA5NjAwMDA0ZSBbIzFdIFBSRUVN
UFQgU01QIFsgIDI1OC45MDY0NzRdIE1vZHVsZXMgbGlua2VkIGluOg0KPiAgWyAgMjU4LjkwNjcw
NV0gQ1BVOiAwIFVJRDogMCBQSUQ6IDI5IENvbW06IGt3b3JrZXIvdTg6MSBOb3QgdGFpbnRlZCA2
LjExLjAtDQo+ICByYzItZ2F2aW4tZ2I0NDZhMmRhZTk4NCAjNyBbICAyNTguOTA3MzM4XSBIYXJk
d2FyZSBuYW1lOiBRRU1VIEtWTQ0KPiAgVmlydHVhbCBNYWNoaW5lLCBCSU9TIGVkazItc3RhYmxl
MjAyNDAyLXByZWJ1aWx0LnFlbXUub3JnIDAyLzE0LzIwMjQgWw0KPiAgMjU4LjkwODAwOV0gV29y
a3F1ZXVlOiBrYWNwaV9ob3RwbHVnIGFjcGlfaG90cGx1Z193b3JrX2ZuIFsNCj4gIDI1OC45MDg0
MDFdIHBzdGF0ZTogNjM0MDAwMDUgKG5aQ3YgZGFpZiArUEFOIC1VQU8gK1RDTyArRElUIC1TU0JT
DQo+ICBCVFlQRT0tLSkgWyAgMjU4LjkwODg5OV0gcGMgOiByZWdpc3Rlcl9jcHUrMHgxNDAvMHgy
OTAgWyAgMjU4LjkwOTE5NV0gbHIgOg0KPiAgcmVnaXN0ZXJfY3B1KzB4MTI4LzB4MjkwIFsgIDI1
OC45MDk0ODddIHNwIDogZmZmZjgwMDA4MTdmYmExMCBbICAyNTguOTA5NzI3XQ0KPiAgeDI5OiBm
ZmZmODAwMDgxN2ZiYTEwIHgyODogMDAwMDAwMDAwMDAwMDAwMCB4Mjc6IGZmZmYwMDAwMDExZjkw
OTggWw0KPiAgMjU4LjkxMDI0Nl0geDI2OiBmZmZmODAwMDgxNjdiMWIwIHgyNTogMDAwMDAwMDAw
MDAwMDAwMSB4MjQ6DQo+ICBmZmZmODAwMDgxNTNkYWQwIFsgIDI1OC45MTA3NjJdIHgyMzogMDAw
MDAwMDAwMDAwMDAwMSB4MjI6DQo+ICBmZmZmMDAwMGZmN2RlMjEwIHgyMTogZmZmZjgwMDA4MTFi
OWEwMCBbICAyNTguOTExMjc5XSB4MjA6DQo+ICAwMDAwMDAwMDAwMDAwMDAwIHgxOTogZmZmZjgw
MDA4MGZhNzE5MCB4MTg6IGZmZmZmZmZmZmZmZmZmZmYgWyAgMjU4LjkxMTc5OF0NCj4gIHgxNzog
MDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAwMDAgeDE1OiBmZmZmMDAwMDA1YTQ2
YTFjIFsNCj4gIDI1OC45MTIzMjZdIHgxNDogZmZmZmZmZmZmZmZmZmZmZiB4MTM6IGZmZmYwMDAw
MDVhNDYzMmIgeDEyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ICBbICAyNTguOTEyODU0XSB4MTE6IDAw
MDAwMDAwMDAwMDAwNDAgeDEwOiAwMDAwMDAwMDAwMDAwMDAwIHg5IDoNCj4gIGZmZmY4MDAwODA4
YTZjZDQgWyAgMjU4LjkxMzM4Ml0geDggOiAwMTAxMDEwMTAxMDEwMTAxIHg3IDogN2Y3ZjdmN2Y3
ZjdmN2Y3Zg0KPiAgeDYgOiBmZWZlZmVmZWZlZmVmZWZmIFsgIDI1OC45MTM5MDZdIHg1IDogZmZm
ZjAwMDAwNTNmYWI0MCB4NCA6DQo+ICBmZmZmMDAwMDA1M2ZhOTIwIHgzIDogZmZmZjAwMDAwNTNm
YWJiMCBbICAyNTguOTE0NDM5XSB4MiA6IGZmZmYwMDAwMDBkZTExMDANCj4gIHgxIDogZmZmZjgw
MDA4MGZhNzE5MCB4MCA6IDAwMDAwMDAwMDAwMDAwMDIgWyAgMjU4LjkxNDk2OF0gQ2FsbCB0cmFj
ZToNCj4gIFsgIDI1OC45MTUxNTRdICByZWdpc3Rlcl9jcHUrMHgxNDAvMHgyOTAgWyAgMjU4Ljkx
NTQyOV0NCj4gIGFyY2hfcmVnaXN0ZXJfY3B1KzB4ODQvMHhkOCBbICAyNTguOTE1NzI2XQ0KPiAg
YWNwaV9wcm9jZXNzb3JfYWRkKzB4NDgwLzB4NWIwIFsgIDI1OC45MTYwNDJdDQo+ICBhY3BpX2J1
c19hdHRhY2grMHgxYzQvMHgzMDAgWyAgMjU4LjkxNjMzNF0NCj4gIGFjcGlfZGV2X2Zvcl9vbmVf
Y2hlY2srMHgzYy8weDUwIFsgIDI1OC45MTY2ODldDQo+ICBkZXZpY2VfZm9yX2VhY2hfY2hpbGQr
MHg2OC8weGM4IFsgIDI1OC45MTcwMTJdDQo+ICBhY3BpX2Rldl9mb3JfZWFjaF9jaGlsZCsweDQ4
LzB4ODAgWyAgMjU4LjkxNzM0NF0NCj4gIGFjcGlfYnVzX2F0dGFjaCsweDg0LzB4MzAwIFsgIDI1
OC45MTc2MjldICBhY3BpX2J1c19zY2FuKzB4NzQvMHgyMjAgWw0KPiAgMjU4LjkxNzkwMl0gIGFj
cGlfc2Nhbl9yZXNjYW5fYnVzKzB4NTQvMHg4OCBbICAyNTguOTE4MjExXQ0KPiAgYWNwaV9kZXZp
Y2VfaG90cGx1ZysweDIwOC8weDQ3OCBbICAyNTguOTE4NTI5XQ0KPiAgYWNwaV9ob3RwbHVnX3dv
cmtfZm4rMHgyYy8weDUwIFsgIDI1OC45MTg4MzldDQo+ICBwcm9jZXNzX29uZV93b3JrKzB4MTVj
LzB4M2MwIFsgIDI1OC45MTkxMzldDQo+ICB3b3JrZXJfdGhyZWFkKzB4MmVjLzB4NDAwIFsgIDI1
OC45MTk0MTddICBrdGhyZWFkKzB4MTIwLzB4MTMwIFsNCj4gIDI1OC45MTk2NThdICByZXRfZnJv
bV9mb3JrKzB4MTAvMHgyMCBbICAyNTguOTE5OTI0XSBDb2RlOiA5MTA2NDAyMQ0KPiAgOWFkNzIw
MDAgOGIxMzBjMzMgZDUwMzIwMWYgKGY4MjAzMjdmKSBbICAyNTguOTIwMzczXSAtLS1bIGVuZCB0
cmFjZQ0KPiAgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQoNCg0KWWVzLCB0aGlzIGNyYXNoLiBUaGFu
a3MgZm9yIGNvbmZpcm1pbmchDQoNCg0KPiAgDQo+ICBUaGFua3MsDQo+ICBHYXZpbg0KPiAgDQo+
ICANCg0K
