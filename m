Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1467959njm;
        Mon, 1 Jul 2024 09:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3NBozkADMCd2qIjUk+MlJeFj0LGfFtdey2eKQfdsgzO2hlsIhdjraPdXm9GNW1o7+QWZxKCIhbq/04whYBjXqzooJ6DEJ
X-Google-Smtp-Source: AGHT+IGdmKMygohtQ1PM0iBl41d5zwg8Hheaej60sP6jmGh1vDmwl7+QyOFQNQeic4jpSKn/RVc2
X-Received: by 2002:a5d:6a4a:0:b0:366:f6bd:a549 with SMTP id ffacd0b85a97d-367756a3adcmr4889517f8f.11.1719851405838;
        Mon, 01 Jul 2024 09:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719851405; cv=none;
        d=google.com; s=arc-20160816;
        b=jdxR8+z3VhuXHb/WvNa6cuZlVc+vnkeDPp5MLKxO28ACTxRsET0/NdBRCKnz/k3JBf
         6+WNevqCbGrDToJIXFaLHUe1/zyOuKZD8gIQVykskU/5W3c41D2w13Rlpa6fTjifu4dY
         CtrFLEfFBvZeOMKAGCjzRhVqq0A1Vymo0EfG7GRjnP8MQ5KKkR5l7SoLRtxzqGpGjNz7
         84q5A6MxWUZyi72zviUMR/wVtjF4WXfk5uhW4MSq9YXoBTJXeiyoKi5YHnS5NmcvpPyO
         Xa9iQdQcX5juuk/W5AarWWPr+FIJtDGCArmCp1hcwiRUCflVs2qt+4nSeZ0oo+dNfDdv
         gMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=3n+8AE3B4omxklgiXzjXGD2iAnr7bviRRkf9BEx0dMM=;
        fh=q9H91gDBcTHxfekwTrp+Tx7a/1e3oQ/sJjIDi+MPBjU=;
        b=xEUi+KWIKbZVaG0kkfIEjFwd7BOZvkPgjdm4qq5JFF62KVosQM/Fr8fmCC+F/krbyF
         fyArso3vRgKrJts1y8LUBOiq/QhQ5js8c47FUQDxHZ1wYogD4duzo7dCLm7JGwaoWmoP
         NZa0LudxCFYHG+BUl5nJzicndxKbTmQHHmL9ofE0RF0YPYuQIrjwDHlU0Rn5tPGqq5NK
         bWr/zgfAvXhQiyi12m/KwxNLFzhYn3LkWrAsKgW28ewabrkR1LZZONgwlf5oQiihdu3M
         E6J735nX5AMfdaDJtLNoIR2LOgVMxtZofvmXLYCJTYK+tgS1cjFNGohvgQVtoylJZjGI
         g6Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3675a0f0b6dsi4458831f8f.434.2024.07.01.09.30.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WCWhq2Kfnz67hqY;
	Tue,  2 Jul 2024 00:29:31 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (unknown [7.191.163.9])
	by mail.maildlp.com (Postfix) with ESMTPS id 9519D140B63;
	Tue,  2 Jul 2024 00:30:04 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 17:30:04 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 1 Jul 2024 17:30:04 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Miguel Luis <miguel.luis@oracle.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, Marc Zyngier
	<maz@kernel.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Richard
 Henderson" <richard.henderson@linaro.org>, Igor Mammedov
	<imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>,
	=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, Karl Heubaum <karl.heubaum@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Topic: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Index: AQHaveq2F6TAeAWelEWGVYAetyN5RLHhydGAgABhdyA=
Date: Mon, 1 Jul 2024 16:30:03 +0000
Message-ID: <fa2913f3034b4d80a30a8ab685f776dc@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <46D74D30-EE54-4AD2-8F0E-BA5627FAA63E@oracle.com>
In-Reply-To: <46D74D30-EE54-4AD2-8F0E-BA5627FAA63E@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.32.244]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: +JjP/s22KPgV

SEkgTWlndWVsLA0KDQo+ICBGcm9tOiBNaWd1ZWwgTHVpcyA8bWlndWVsLmx1aXNAb3JhY2xlLmNv
bT4NCj4gIFNlbnQ6IE1vbmRheSwgSnVseSAxLCAyMDI0IDEyOjM5IFBNDQo+ICBUbzogU2FsaWwg
TWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ICANCj4gIEhpIFNhbGlsLA0KPiAgDQo+
ICA+IE9uIDEzIEp1biAyMDI0LCBhdCAyMzozNiwgU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
YXdlaS5jb20+IHdyb3RlOg0KPiAgPg0KPiAgPiBQUk9MT0dVRQ0KPiAgPiA9PT09PT09PQ0KPiAg
Pg0KPiAgPiBUbyBhc3Npc3QgaW4gcmV2aWV3IGFuZCBzZXQgdGhlIHJpZ2h0IGV4cGVjdGF0aW9u
cyBmcm9tIHRoaXMgUkZDLA0KPiAgPiBwbGVhc2UgZmlyc3QgcmVhZCB0aGUgc2VjdGlvbnMgKkFQ
UEVOREVEIEFUIFRIRSBFTkQqIG9mIHRoaXMgY292ZXINCj4gIGxldHRlcjoNCj4gID4NCj4gID4g
MS4gSW1wb3J0YW50ICpESVNDTEFJTUVSKiBbU2VjdGlvbiAoWCldIDIuIFdvcmsgcHJlc2VudGVk
IGF0DQo+ICBLVk1Gb3J1bQ0KPiAgPiBDb25mZXJlbmNlIChzbGlkZXMgYXZhaWxhYmxlKSBbU2Vj
dGlvbiAoVilGXSAzLiBPcmdhbml6YXRpb24gb2YNCj4gID4gcGF0Y2hlcyBbU2VjdGlvbiAoWEkp
XSA0LiBSZWZlcmVuY2VzIFtTZWN0aW9uIChYSUkpXSA1LiBEZXRhaWxlZCBUT0RPDQo+ICA+IGxp
c3Qgb2YgbGVmdG92ZXIgd29yayBvciB3b3JrLWluLXByb2dyZXNzIFtTZWN0aW9uIChJWCldDQo+
ICA+DQo+ICA+IFRoZXJlIGhhcyBiZWVuIGludGVyZXN0IHNob3duIGJ5IG90aGVyIG9yZ2FuaXph
dGlvbnMgaW4gYWRhcHRpbmcgdGhpcw0KPiAgPiBzZXJpZXMgZm9yIHRoZWlyIGFyY2hpdGVjdHVy
ZS4gSGVuY2UsIFJGQyBWMiBbMjFdIGhhcyBiZWVuIHNwbGl0IGludG8NCj4gID4gYXJjaGl0ZWN0
dXJlDQo+ICA+ICphZ25vc3RpYyogWzIyXSBhbmQgKnNwZWNpZmljKiBwYXRjaCBzZXRzLg0KPiAg
Pg0KPiAgPiBUaGlzIGlzIGFuIEFSTSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgcGF0Y2ggc2V0IGNh
cnZlZCBvdXQgb2YgUkZDIFYyLg0KPiAgPiBQbGVhc2UgY2hlY2sgc2VjdGlvbiAoWEkpQiBmb3Ig
ZGV0YWlscyBvZiBhcmNoaXRlY3R1cmUgYWdub3N0aWMgcGF0Y2hlcy4NCj4gID4NCj4gID4gU0VD
VElPTlMgW0kgLSBYSUlJXSBhcmUgYXMgZm9sbG93czoNCj4gID4NCj4gID4gKEkpIEtleSBDaGFu
Z2VzIFtkZXRhaWxzIGluIGxhc3Qgc2VjdGlvbiAoWElWKV0NCj4gID4gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAgPg0KPiAgPiBSRkMgVjIgLT4gUkZD
IFYzDQo+ICA+DQo+ICA+IDEuIFNwbGl0IGludG8gQXJjaGl0ZWN0dXJlICphZ25vc3RpYyogKFYx
MykgWzIyXSBhbmQgKnNwZWNpZmljKiAoUkZDIFYzKQ0KPiAgcGF0Y2ggc2V0cy4NCj4gID4gMi4g
QWRkcmVzc2VkIGNvbW1lbnRzIGJ5IEdhdmluIFNoYW4gKFJlZEhhdCksIFNoYW9xaW4gSHVhbmcN
Cj4gIChSZWRIYXQpLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoTGluYXJvKSwNCj4gID4gICBK
b25hdGhhbiBDYW1lcm9uIChIdWF3ZWkpLCBaaGFvIExpdSAoSW50ZWwpLg0KPiAgPg0KPiAgDQo+
ICBJ4oCZdmUgdGVzdGVkIHRoaXMgc2VyaWVzIGFsb25nIHdpdGggdjEwIGtlcm5lbCBwYXRjaGVz
IGZyb20gWzFdIG9uIHRoZQ0KPiAgZm9sbG93aW5nIGl0ZW1zOg0KPiAgDQo+ICBCb290Lg0KPiAg
SG90cGx1ZyB1cCB0byBtYXhjcHVzLg0KPiAgSG90IHVucGx1ZyBkb3duIHRvIHRoZSBudW1iZXIg
b2YgYm9vdCBjcHVzLg0KPiAgSG90cGx1ZyB2Y3B1cyB0aGVuIG1pZ3JhdGUgdG8gYSBuZXcgVk0u
DQo+ICBIb3QgdW5wbHVnIGRvd24gdG8gdGhlIG51bWJlciBvZiBib290IGNwdXMgdGhlbiBtaWdy
YXRlIHRvIGEgbmV3IFZNLg0KPiAgVXAgdG8gNiBzdWNjZXNzaXZlIGxpdmUgbWlncmF0aW9ucy4N
Cj4gIA0KPiAgQW5kIGluIHdoaWNoIExHVE0uDQo+ICANCj4gIFBsZWFzZSBmZWVsIGZyZWUgdG8g
YWRkLA0KPiAgVGVzdGVkLWJ5OiBNaWd1ZWwgTHVpcyA8bWlndWVsLmx1aXNAb3JhY2xlLmNvbT4N
Cg0KTWFueSB0aGFua3MgZm9yIHlvdXIgZWZmb3J0cy4gQXBwcmVjaWF0ZSB0aGlzLg0KDQoNCkJl
c3QNClNhbGlsLg0KDQoNCj4gIA0KPiAgUmVnYXJkcywNCj4gIE1pZ3VlbA0KPiAgDQo+ICBbMV0N
Cj4gIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FybTY0
L2xpbnV4LmdpdC9sb2cvP2g9Zm9yDQo+ICAtbmV4dC92Y3B1LWhvdHBsdWcNCj4gIA0KPiAgPiBS
RkMgVjEgLT4gUkZDIFYyDQo=
