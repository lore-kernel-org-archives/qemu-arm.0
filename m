Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp422935njc;
        Thu, 8 Aug 2024 01:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxFqB1xm9ONGF1yEHW91QvslndlNSSySyn3CNOBBYu2u/ux0G7mojhKwQVGE9BvDRJPGpJS3H/aLn4FjCz0Ffn2hkyO1nX
X-Google-Smtp-Source: AGHT+IFCK83NtcqLGnAo6UR/mmh7FHtYWOpYvojWZKLKQ9CwcB+UtWK1+6QajlFVvgIVqoMU1MM6
X-Received: by 2002:a17:90a:7c4f:b0:2d1:bf48:e767 with SMTP id 98e67ed59e1d1-2d1c3450a75mr1228569a91.29.1723106363930;
        Thu, 08 Aug 2024 01:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723106363; cv=none;
        d=google.com; s=arc-20160816;
        b=Fc6ZjVLb1Wm2XFGp00NDGneeqsbVPClW2T4C9aukJ6WS2FLEDBb0mZSn+cyGs5h21E
         VOx1i0mR8YVhc3Ad+UV+D0YviNA/5Sudyhzs7Up3RCihKDUs07v8xgyLPRCluBp5h9sb
         EL7/HirWl1Wdln5F4IlHQoqB0fm5MP/cjlv6CKdTu5PgzxCwlIwSNgwPcVVUeJp6xpub
         Gqe2QP3CzaNMUmSVWWFpT8M305/w6nTF9XQPPvRQkQkc4Gl0L3E85/trD/1hqbDS0F85
         xzh54jgRlncqEGhVm8VjuPDQqKw0a7S+KGDz2Za87IHZz2/6v4QugXCEJ1UVAAZSTu7W
         nD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=4yotFN8z7HEbMFeQcVeWnuk5cINo+nJHi3iZ3tGRtwQ=;
        fh=IcghoZT+iwDwnUWe0/8u2lfgCRl3Js+UrcNMjs/i9hE=;
        b=p9rI+B9U/yEjpqpYaeRofzQMuTo83A7SjK42ormH4VHiMZ1EWe3caUMQnzQ1O/YdtK
         6J+MWm5BVypIllfDDnNU/kcu+p7ivqd4KnRllTBC65c1MW4IaCXm7wfPlPfVYnd0WaBt
         onGKRTPfokoAPs9+gFDYlfy5B6TAyaLzxpbkq9v/bQ+eECkid2dIEmM0OEpdBKBkiKc4
         /oAOwUk4G8ROMoOe+aQALYPi+2TgMkDBwfkUYQLrGCh2+4w08Gp09SYjpUjrGoZtgpDC
         sPJ8PatzYhdz1+pNd+hjZ085/dSZAWNnlzNqC6ZF0tLhNnAA9SMrgRlTah6ZGKxAHowC
         k2Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2d1c9db967dsi505289a91.116.2024.08.08.01.39.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2024 01:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WfgQ02pgxz6K9g5;
	Thu,  8 Aug 2024 16:36:56 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id C29CA140C98;
	Thu,  8 Aug 2024 16:39:17 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 09:39:17 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Thu, 8 Aug 2024 09:39:17 +0100
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
Thread-Index: AQHaveq2F6TAeAWelEWGVYAetyN5RLIb0soAgABLdWCAAJu0gIAAEapQ///7ygCAAD8uAIAAWeEA
Date: Thu, 8 Aug 2024 08:39:17 +0000
Message-ID: <b881c71a7a224ec28f1bb3e22758a8ea@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<41fbfa5a-a10f-4ca0-8a52-e447043ff306@redhat.com>
	<ed0a5631e0674c2aa4679f2388f40127@huawei.com>
	<5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
	<44d06db6ec1b416d8817b7cf5043ddf8@huawei.com>
	<c2dce623-ee44-47d5-b9cb-73481a86b75f@redhat.com>
 <f21944c4-f498-483a-9a5a-aff2def67427@redhat.com>
In-Reply-To: <f21944c4-f498-483a-9a5a-aff2def67427@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.245.88]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: nFo61jACtt+r

SGkgR2F2aW4sDQoNCj4gIEZyb206IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQo+ICBT
ZW50OiBUaHVyc2RheSwgQXVndXN0IDgsIDIwMjQgNToxNSBBTQ0KPiAgVG86IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiAgcWVt
dS1hcm1Abm9uZ251Lm9yZzsgbXN0QHJlZGhhdC5jb20NCj4gIA0KPiAgSGkgU2FsaWwsDQo+ICAN
Cj4gIE9uIDgvOC8yNCAxMDoyOSBBTSwgR2F2aW4gU2hhbiB3cm90ZToNCj4gID4gT24gOC84LzI0
IDk6NDggQU0sIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPg0KPiAgPiBIb3dldmVyLCBJJ20gdW5h
YmxlIHRvIGhvdC1hZGQgYSB2Q1BVIGFuZCBoYXZlbid0IGdldCBhIGNoYW5jZSB0byBsb29rDQo+
ICA+IGF0IGl0IGNsb3NlbHkuDQo+ICA+DQo+ICA+IChxZW11KSBkZXZpY2VfYWRkIGhvc3QtYXJt
LWNwdSxpZD1jcHUsc29ja2V0LWlkPTENCj4gID4gKHFlbXUpIFvCoCAyNTguOTAxMDI3XSBVbmFi
bGUgdG8gaGFuZGxlIGtlcm5lbCB3cml0ZSB0byByZWFkLW9ubHkNCj4gID4gbWVtb3J5IGF0IHZp
cnR1YWwgYWRkcmVzcyBmZmZmODAwMDgwZmE3MTkwIFvCoCAyNTguOTAxNjg2XSBNZW0gYWJvcnQg
aW5mbzoNCj4gID4gW8KgIDI1OC45MDE4ODldwqDCoCBFU1IgPSAweDAwMDAwMDAwOTYwMDAwNGUg
W8KgIDI1OC45MDIxNjBdwqDCoCBFQyA9IDB4MjU6DQo+ICA+IERBQlQgKGN1cnJlbnQgRUwpLCBJ
TCA9IDMyIGJpdHMgW8KgIDI1OC45MDI1NDNdwqDCoCBTRVQgPSAwLCBGblYgPSAwIFsNCj4gID4g
MjU4LjkwMjc2M13CoMKgIEVBID0gMCwgUzFQVFcgPSAwIFvCoCAyNTguOTAyOTkxXcKgwqAgRlND
ID0gMHgwZTogbGV2ZWwgMg0KPiAgPiBwZXJtaXNzaW9uIGZhdWx0IFvCoCAyNTguOTAzMzM4XSBE
YXRhIGFib3J0IGluZm86DQo+ICA+IFvCoCAyNTguOTAzNTQ3XcKgwqAgSVNWID0gMCwgSVNTID0g
MHgwMDAwMDA0ZSwgSVNTMiA9IDB4MDAwMDAwMDAgWw0KPiAgPiAyNTguOTAzOTQzXcKgwqAgQ00g
PSAwLCBXblIgPSAxLCBUbkQgPSAwLCBUYWdBY2Nlc3MgPSAwIFvCoCAyNTguOTA0MzA0XQ0KPiAg
PiBHQ1MgPSAwLCBPdmVybGF5ID0gMCwgRGlydHlCaXQgPSAwLCBYcyA9IDAgW8KgIDI1OC45MDQ2
ODddIHN3YXBwZXINCj4gID4gcGd0YWJsZTogNGsgcGFnZXMsIDQ4LWJpdCBWQXMsIHBnZHA9MDAw
MDAwMDBiOGUyNDAwMCBbwqAgMjU4LjkwNTI1OF0NCj4gID4gW2ZmZmY4MDAwODBmYTcxOTBdIHBn
ZD0xMDAwMDAwMGI5NWIwMDAzLCBwNGQ9MTAwMDAwMDBiOTViMDAwMywNCj4gID4gcHVkPTEwMDAw
MDAwYjk1YjEwMDMsIHBtZD0wMDYwMDAwMGI4YzAwNzgxIFvCoCAyNTguOTA2MDI2XSBJbnRlcm5h
bA0KPiAgPiBlcnJvcjogT29wczogMDAwMDAwMDA5NjAwMDA0ZSBbIzFdIFBSRUVNUFQgU01QIFvC
oCAyNTguOTA2NDc0XSBNb2R1bGVzDQo+ICBsaW5rZWQgaW46DQo+ICA+IFvCoCAyNTguOTA2NzA1
XSBDUFU6IDAgVUlEOiAwIFBJRDogMjkgQ29tbToga3dvcmtlci91ODoxIE5vdCB0YWludGVkDQo+
ICA+IDYuMTEuMC1yYzItZ2F2aW4tZ2I0NDZhMmRhZTk4NCAjNyBbwqAgMjU4LjkwNzMzOF0gSGFy
ZHdhcmUgbmFtZTogUUVNVQ0KPiAgPiBLVk0gVmlydHVhbCBNYWNoaW5lLCBCSU9TIGVkazItc3Rh
YmxlMjAyNDAyLXByZWJ1aWx0LnFlbXUub3JnDQo+ICA+IDAyLzE0LzIwMjQgW8KgIDI1OC45MDgw
MDldIFdvcmtxdWV1ZToga2FjcGlfaG90cGx1Zw0KPiAgPiBhY3BpX2hvdHBsdWdfd29ya19mbiBb
wqAgMjU4LjkwODQwMV0gcHN0YXRlOiA2MzQwMDAwNSAoblpDdiBkYWlmICtQQU4NCj4gID4gLVVB
TyArVENPICtESVQgLVNTQlMgQlRZUEU9LS0pIFvCoCAyNTguOTA4ODk5XSBwYyA6DQo+ICA+IHJl
Z2lzdGVyX2NwdSsweDE0MC8weDI5MCBbwqAgMjU4LjkwOTE5NV0gbHIgOiByZWdpc3Rlcl9jcHUr
MHgxMjgvMHgyOTANCj4gID4gW8KgIDI1OC45MDk0ODddIHNwIDogZmZmZjgwMDA4MTdmYmExMCBb
wqAgMjU4LjkwOTcyN10geDI5Og0KPiAgPiBmZmZmODAwMDgxN2ZiYTEwIHgyODogMDAwMDAwMDAw
MDAwMDAwMCB4Mjc6IGZmZmYwMDAwMDExZjkwOTggWw0KPiAgPiAyNTguOTEwMjQ2XSB4MjY6IGZm
ZmY4MDAwODE2N2IxYjAgeDI1OiAwMDAwMDAwMDAwMDAwMDAxIHgyNDoNCj4gID4gZmZmZjgwMDA4
MTUzZGFkMCBbwqAgMjU4LjkxMDc2Ml0geDIzOiAwMDAwMDAwMDAwMDAwMDAxIHgyMjoNCj4gID4g
ZmZmZjAwMDBmZjdkZTIxMCB4MjE6IGZmZmY4MDAwODExYjlhMDAgW8KgIDI1OC45MTEyNzldIHgy
MDoNCj4gID4gMDAwMDAwMDAwMDAwMDAwMCB4MTk6IGZmZmY4MDAwODBmYTcxOTAgeDE4OiBmZmZm
ZmZmZmZmZmZmZmZmIFsNCj4gID4gMjU4LjkxMTc5OF0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgx
NjogMDAwMDAwMDAwMDAwMDAwMCB4MTU6DQo+ICA+IGZmZmYwMDAwMDVhNDZhMWMgW8KgIDI1OC45
MTIzMjZdIHgxNDogZmZmZmZmZmZmZmZmZmZmZiB4MTM6DQo+ICA+IGZmZmYwMDAwMDVhNDYzMmIg
eDEyOiAwMDAwMDAwMDAwMDAwMDAwIFvCoCAyNTguOTEyODU0XSB4MTE6DQo+ICA+IDAwMDAwMDAw
MDAwMDAwNDAgeDEwOiAwMDAwMDAwMDAwMDAwMDAwIHg5IDogZmZmZjgwMDA4MDhhNmNkNCBbDQo+
ICA+IDI1OC45MTMzODJdIHg4IDogMDEwMTAxMDEwMTAxMDEwMSB4NyA6IDdmN2Y3ZjdmN2Y3Zjdm
N2YgeDYgOg0KPiAgZmVmZWZlZmVmZWZlZmVmZiBbwqAgMjU4LjkxMzkwNl0geDUgOiBmZmZmMDAw
MDA1M2ZhYjQwIHg0IDogZmZmZjAwMDAwNTNmYTkyMCB4Mw0KPiAgOiBmZmZmMDAwMDA1M2ZhYmIw
IFvCoCAyNTguOTE0NDM5XSB4MiA6IGZmZmYwMDAwMDBkZTExMDAgeDEgOiBmZmZmODAwMDgwZmE3
MTkwDQo+ICB4MCA6IDAwMDAwMDAwMDAwMDAwMDIgW8KgIDI1OC45MTQ5NjhdIENhbGwgdHJhY2U6
DQo+ICA+IFvCoCAyNTguOTE1MTU0XcKgIHJlZ2lzdGVyX2NwdSsweDE0MC8weDI5MCBbwqAgMjU4
LjkxNTQyOV0NCj4gID4gYXJjaF9yZWdpc3Rlcl9jcHUrMHg4NC8weGQ4IFvCoCAyNTguOTE1NzI2
XQ0KPiAgPiBhY3BpX3Byb2Nlc3Nvcl9hZGQrMHg0ODAvMHg1YjAgW8KgIDI1OC45MTYwNDJdDQo+
ICA+IGFjcGlfYnVzX2F0dGFjaCsweDFjNC8weDMwMCBbwqAgMjU4LjkxNjMzNF0NCj4gID4gYWNw
aV9kZXZfZm9yX29uZV9jaGVjaysweDNjLzB4NTAgW8KgIDI1OC45MTY2ODldDQo+ICA+IGRldmlj
ZV9mb3JfZWFjaF9jaGlsZCsweDY4LzB4YzggW8KgIDI1OC45MTcwMTJdDQo+ICA+IGFjcGlfZGV2
X2Zvcl9lYWNoX2NoaWxkKzB4NDgvMHg4MCBbwqAgMjU4LjkxNzM0NF0NCj4gID4gYWNwaV9idXNf
YXR0YWNoKzB4ODQvMHgzMDAgW8KgIDI1OC45MTc2MjldwqAgYWNwaV9idXNfc2NhbisweDc0LzB4
MjIwIFsNCj4gID4gMjU4LjkxNzkwMl3CoCBhY3BpX3NjYW5fcmVzY2FuX2J1cysweDU0LzB4ODgg
W8KgIDI1OC45MTgyMTFdDQo+ICA+IGFjcGlfZGV2aWNlX2hvdHBsdWcrMHgyMDgvMHg0NzggW8Kg
IDI1OC45MTg1MjldDQo+ICA+IGFjcGlfaG90cGx1Z193b3JrX2ZuKzB4MmMvMHg1MCBbwqAgMjU4
LjkxODgzOV0NCj4gID4gcHJvY2Vzc19vbmVfd29yaysweDE1Yy8weDNjMA0KPiAgW8KgIDI1OC45
MTkxMzldwqAgd29ya2VyX3RocmVhZCsweDJlYy8weDQwMA0KPiAgPiBbwqAgMjU4LjkxOTQxN13C
oCBrdGhyZWFkKzB4MTIwLzB4MTMwIFvCoCAyNTguOTE5NjU4XQ0KPiAgPiByZXRfZnJvbV9mb3Jr
KzB4MTAvMHgyMCBbwqAgMjU4LjkxOTkyNF0gQ29kZTogOTEwNjQwMjEgOWFkNzIwMDANCj4gID4g
OGIxMzBjMzMgZDUwMzIwMWYgKGY4MjAzMjdmKSBbwqAgMjU4LjkyMDM3M10gLS0tWyBlbmQgdHJh
Y2UNCj4gID4gMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ICA+DQo+ICANCj4gIFRoZSBmaXggWzFd
IGlzIG5lZWRlZCBieSB0aGUgZ3Vlc3Qga2VybmVsLiBXaXRoIHRoaXMsIEknbSBhYmxlIHRvIGhv
dCBhZGQgdkNQVQ0KPiAgYW5kIGhvdCByZW1vdmUgdkNQVSBzdWNjZXNzZnVsbHkuDQo+ICANCj4g
IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyNC84LzgvMTU1DQoNCg0KR29vZCBjYXRjaCBp
biB0aGUga2VybmVsLiBBbmQgbWFueSB0aGFua3MgZm9yIGZpeGluZyBhcyB3ZWxsLg0KDQoNCj4g
IA0KPiAgVGhhbmtzLA0KPiAgR2F2aW4NCj4gIA0KDQo=
