Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp629423dlb;
        Wed, 7 Aug 2024 16:48:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7BhxVdJAJuvaA6qR9O1n1y3VH7BmaCQcFT9yrdDWplatBdpBmqn7jDwDRMG/DpvfOQZEYXwXIe9QA1DxNRoMap2bqoKFG
X-Google-Smtp-Source: AGHT+IFh4uvAVfQZSVyxech4lwV2A1oXigeBNNZHP6YFH2pGsb7ejhDTiq6ESkUUOnJUvJJ3UUo2
X-Received: by 2002:a5d:4f8f:0:b0:368:3f74:f7dd with SMTP id ffacd0b85a97d-36d274db2c7mr74229f8f.20.1723074527229;
        Wed, 07 Aug 2024 16:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723074527; cv=none;
        d=google.com; s=arc-20160816;
        b=qXCgru7yhAv02yihjmNQ8FS+uVhOuLDgYXiY3xNuSrI3D6wcxusASbWy2xEWukMbuq
         upb+6aMVT+i9ndfdLUUy7qny87ZjyDuC2dB8I9bgScx8qb5I4QQzycM2Im6dCTFeR3LW
         zN3aQsEZtmWknmBbW9kNJMW4X78hpomSRNEjmCKG9yWlq7QacN27y6KuQRGMq7cIOJi1
         2NCWAIwOo0l6EaqdnuMCllUNgtuW2UGh5YizFME8CVPP+a43L5aIU91Cu94K3cVafX9K
         TmajTyUez0C8NBWaQktCZNjbf8A2hF1MQWNn/obiHxtnk4xqqwfsxmTMKIj6vUjQ8lrC
         k2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=x7b2dajv93JLOrAzml0CpE7f77qoQl31JnR20gUe/pY=;
        fh=IcghoZT+iwDwnUWe0/8u2lfgCRl3Js+UrcNMjs/i9hE=;
        b=GGyZZg7sDJUU/ert7BAMo7+MhtPcylS3O1+n5TrPtJIp1r/JhVqoWR1KQUCbEUiSqN
         u6P20fTTQb08j/HOOwCTb8dTxxCVUXdxwIItte66AUFRd1CSHfChoE6Ys/IvIQPIFsLA
         7OQCCn4DJWOB3Otgh7SS7xi1vBtZ06qdtkHCH5kQqdpNZt+27S0ZcKRY4+Op4Yy/ybGj
         lwCRScUnf8d6I2wZrrFXtMSQIKaO6+O5fJ22B2WEm2ynLiEBqc1RBjHzNreJbenhGzvp
         dn9Msu6ZmBrXagEU2lXyV7tIzJbZJm8BF1es8jLxvgt3O55Dv5jw8qRhLZIQPnRuIGhf
         yfTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36d2721f765si69957f8f.458.2024.08.07.16.48.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2024 16:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WfRdB3HPHz6K6k0;
	Thu,  8 Aug 2024 07:45:50 +0800 (CST)
Received: from lhrpeml100001.china.huawei.com (unknown [7.191.160.183])
	by mail.maildlp.com (Postfix) with ESMTPS id C4C171401DC;
	Thu,  8 Aug 2024 07:48:45 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 00:48:45 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Thu, 8 Aug 2024 00:48:45 +0100
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
Thread-Index: AQHaveq2F6TAeAWelEWGVYAetyN5RLIb0soAgABLdWCAAJu0gIAAEapQ
Date: Wed, 7 Aug 2024 23:48:45 +0000
Message-ID: <44d06db6ec1b416d8817b7cf5043ddf8@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<41fbfa5a-a10f-4ca0-8a52-e447043ff306@redhat.com>
	<ed0a5631e0674c2aa4679f2388f40127@huawei.com>
 <5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
In-Reply-To: <5843f79d-c9b7-45bf-a2b1-2ae4c7babf46@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.245.88]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: AoIsEFB64z3S

SGkgR2F2aW4sDQoNClRoYW5rcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbi4NCg0KPiAgRnJvbTog
R2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gIFNlbnQ6IFRodXJzZGF5LCBBdWd1c3Qg
OCwgMjAyNCAxMjo0MSBBTQ0KPiAgVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWku
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiAgcWVtdS1hcm1Abm9uZ251Lm9yZzsgbXN0
QHJlZGhhdC5jb20NCj4gIA0KPiAgSGkgU2FsaWwsDQo+ICANCj4gIE9uIDgvNy8yNCAxMToyNyBQ
TSwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ICA+DQo+ICA+IExldCBtZSBmaWd1cmUgb3V0IHRoaXMu
IEhhdmUgeW91IGFsc28gaW5jbHVkZWQgdGhlIGJlbG93IHBhdGNoIGFsb25nDQo+ICA+IHdpdGgg
dGhlIGFyY2hpdGVjdHVyZSBhZ25vc3RpYyBwYXRjaC1zZXQgYWNjZXB0ZWQgaW4gdGhpcyBRZW11
IGN5Y2xlPw0KPiAgPg0KPiAgPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MDEx
NDIzMjIuMzk0ODg2Ni0zLXBldGVyLm1heWRlbGxAbGluDQo+ICA+IGFyby5vcmcvDQo+ICA+DQo+
ICANCj4gIFRoZXJlIGFyZSBubyB2Q1BVIGZkIHRvIGJlIHBhcmtlZCBhbmQgdW5wYXJrZWQgd2hl
biB0aGUgY29yZSBkdW1wDQo+ICBoYXBwZW5lcy4gSSB0cmllZCBpdCwgYnV0IGRpZG4ndCBoZWxw
LiBJIGFkZGVkIG1vcmUgZGVidWdnaW5nIG1lc3NhZ2VzIGFuZA0KPiAgdGhlIGNvcmUgZHVtcCBp
cyB0cmlnZ2VyZWQgaW4gdGhlIGZvbGxvd2luZyBwYXRoLiBJdCBzZWVtcyAnY3B1LQ0KPiAgPnN2
ZV92cS5tYXAnIGlzbid0IGNvcnJlY3Qgc2luY2UgaXQncyBwb3B1bGF0ZWQgaW4gQ1BVIHJlYWxp
emF0aW9uIHBhdGgsIGFuZA0KPiAgdGhvc2Ugbm9uLWNvbGQtYm9vdGVkIENQVXMgYXJlbid0IHJl
YWxpemVkIGluIHRoZSBib290aW5nIHN0YWdlLg0KDQoNCkFoLCBJJ3ZlIHRvIGZpeCB0aGUgU1ZF
IHN1cHBvcnQuIEknbSBhbHJlYWR5IHdvcmtpbmcgb24gaXQgYW5kIHdpbGwgYmUgcGFydCBvZg0K
dGhlIFJGQyBWNC4NCg0KSGF2ZSB5b3UgdHJpZWQgYm9vdGluZyBWTSBieSBkaXNhYmxpbmcgdGhl
IFNWRSBzdXBwb3J0Pw0KDQoNCj4gIA0KPiAgIyBkbWVzZyB8IGdyZXAgIlNjYWxhYmxlIFZlY3Rv
ciBFeHRlbnNpb24iDQo+ICBbICAgIDAuMTE3MTIxXSBDUFUgZmVhdHVyZXM6IGRldGVjdGVkOiBT
Y2FsYWJsZSBWZWN0b3IgRXh0ZW5zaW9uDQo+ICANCj4gICMgc3RhcnRfdm0NCj4gID09PT4gbWFj
aHZpcnRfaW5pdDogY3JlYXRlIENQVSBvYmplY3QgKGlkeD0wLCB0eXBlPVtob3N0LWFybS1jcHVd
KQ0KPiAgY3B1X2NvbW1vbl9pbml0Zm4gYXJtX2NwdV9pbml0Zm4gYWFyY2g2NF9jcHVfaW5pdGZu
DQo+ICBhYXJjaDY0X2NwdV9pbnN0YW5jZV9pbml0IGFhcmNoNjRfaG9zdF9pbml0Zm4gYXJtX2Nw
dV9wb3N0X2luaXQgPT09Pg0KPiAgbWFjaHZpcnRfaW5pdDogcmVhbGl6ZSBDUFUgb2JqZWN0IChp
ZHg9MCkgdmlydF9jcHVfcHJlX3BsdWcNCj4gIGFybV9jcHVfcmVhbGl6ZWZuIGNwdV9jb21tb25f
cmVhbGl6ZWZuIHZpcnRfY3B1X3BsdWcgPT09Pg0KPiAgbWFjaHZpcnRfaW5pdDogY3JlYXRlIENQ
VSBvYmplY3QgKGlkeD0xLCB0eXBlPVtob3N0LWFybS1jcHVdKQ0KPiAgY3B1X2NvbW1vbl9pbml0
Zm4gYXJtX2NwdV9pbml0Zm4gYWFyY2g2NF9jcHVfaW5pdGZuDQo+ICBhYXJjaDY0X2NwdV9pbnN0
YW5jZV9pbml0IGFhcmNoNjRfaG9zdF9pbml0Zm4gYXJtX2NwdV9wb3N0X2luaXQNCj4gIGt2bV9h
cmNoX2luaXRfdmNwdTogRXJyb3IgLTIyIGZyb20ga3ZtX2FybV9zdmVfc2V0X3ZscygpDQo+ICBx
ZW11LXN5c3RlbS1hYXJjaDY0OiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBob3N0IHZjcHUgMSBBYm9y
dGVkIChjb3JlDQo+ICBkdW1wZWQpDQoNClllcywgc3VyZS4gDQoNClRoYW5rcw0KU2FsaWwuDQoN
Cg0KPiAgDQo+ICBUaGFua3MsDQo+ICBHYXZpbg0KPiAgDQo+ICA+Pg0KPiAgPj4gICBXaXRoIHRo
aXMgc2VyaWVzIGFuZCBsYXRlc3QgdXBzdHJlYW0gTGludXgga2VybmVsIChob3N0KSwgSSByYW4g
aW50byBjb3JlDQo+ICA+PiAgIGR1bXAgYXMgYmVsb3cuDQo+ICA+PiAgIEknbSBub3Qgc3VyZSBp
ZiBpdCdzIGEga25vd24gaXNzdWUgb3Igbm90Lg0KPiAgPj4NCj4gID4+ICAgIyB1bmFtZSAtcg0K
PiAgPj4gICA2LjExLjAtcmMyLWdhdmluKw0KPiAgPj4gICAjIC9ob21lL2dhdmluL3NhbmRib3gv
cWVtdS5tYWluL2J1aWxkL3FlbXUtc3lzdGVtLWFhcmNoNjQgLQ0KPiAgYWNjZWwNCj4gID4+ICAg
a3ZtIFwNCj4gID4+ICAgICAgLW1hY2hpbmUgdmlydCxnaWMtdmVyc2lvbj1ob3N0LG52ZGltbT1v
biAtY3B1IGhvc3QgICAgICAgICAgICAgICAgIFwNCj4gID4+ICAgICAgLXNtcCBtYXhjcHVzPTIs
Y3B1cz0xLHNvY2tldHM9MixjbHVzdGVycz0xLGNvcmVzPTEsdGhyZWFkcz0xICAgICAgIFwNCj4g
ID4+ICAgICAgLW0gNDA5Nk0sc2xvdHM9MTYsbWF4bWVtPTEyOEcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4gID4+ICAgICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1y
YW0saWQ9bWVtMCxzaXplPTIwNDhNICAgICAgICAgICAgICAgICAgICAgIFwNCj4gID4+ICAgICAg
LW9iamVjdCBtZW1vcnktYmFja2VuZC1yYW0saWQ9bWVtMSxzaXplPTIwNDhNICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4gID4+ICAgICAgLW51bWEgbm9kZSxub2RlaWQ9MCxtZW1kZXY9bWVtMCxj
cHVzPTAtMCAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gID4+ICAgICAgLW51bWEgbm9k
ZSxub2RlaWQ9MSxtZW1kZXY9bWVtMSxjcHVzPTEtMSAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gID4+ICAgICAgICA6DQo+ICA+PiAgIHFlbXUtc3lzdGVtLWFhcmNoNjQ6IEZhaWxlZCB0
byBpbml0aWFsaXplIGhvc3QgdmNwdSAxIEFib3J0ZWQgKGNvcmUNCj4gID4+ICAgZHVtcGVkKQ0K
PiAgPj4NCj4gID4+ICAgIyBnZGIgL3Zhci9saWIvc3lzdGVtZC9jb3JlZHVtcC9jb3JlLjANCj4g
ID4+ICAgL2hvbWUvZ2F2aW4vc2FuZGJveC9xZW11Lm1haW4vYnVpbGQvcWVtdS1zeXN0ZW0tYWFy
Y2g2NA0KPiAgPj4gICAoZ2RiKSBidA0KPiAgPj4gICAjMCAgMHgwMDAwZmZmZjllZWM0MmU4IGlu
IF9fcHRocmVhZF9raWxsX2ltcGxlbWVudGF0aW9uICgpIGF0DQo+ICA+PiAgIC9saWI2NC9saWJj
LnNvLjYNCj4gID4+ICAgIzEgIDB4MDAwMGZmZmY5ZWU3YzczYyBpbiByYWlzZSAoKSBhdCAvbGli
NjQvbGliYy5zby42DQo+ICA+PiAgICMyICAweDAwMDBmZmZmOWVlNjkwMzQgaW4gYWJvcnQgKCkg
YXQgL2xpYjY0L2xpYmMuc28uNg0KPiAgPj4gICAjMyAgMHgwMDAwYWFhYWM3MTE1MmMwIGluIGt2
bV9hcm1fY3JlYXRlX2hvc3RfdmNwdQ0KPiAgPj4gICAoY3B1PTB4YWFhYWU0YzBjYjgwKQ0KPiAg
Pj4gICAgICAgIGF0IC4uL3RhcmdldC9hcm0va3ZtLmM6MTA5Mw0KPiAgPj4gICAjNCAgMHgwMDAw
YWFhYWM3MDU3NTIwIGluIG1hY2h2aXJ0X2luaXQgKG1hY2hpbmU9MHhhYWFhZTQ4MTk4YzApIGF0
DQo+ICA+PiAgIC4uL2h3L2FybS92aXJ0LmM6MjUzNA0KPiAgPj4gICAjNSAgMHgwMDAwYWFhYWM2
YjBkMzFjIGluIG1hY2hpbmVfcnVuX2JvYXJkX2luaXQNCj4gID4+ICAgICAgICAobWFjaGluZT0w
eGFhYWFlNDgxOThjMCwgbWVtX3BhdGg9MHgwLCBlcnJwPTB4ZmZmZmY3NTRlZTM4KSBhdA0KPiAg
Pj4gICAuLi9ody9jb3JlL21hY2hpbmUuYzoxNTc2DQo+ICA+PiAgICM2ICAweDAwMDBhYWFhYzZm
NThkNzAgaW4gcWVtdV9pbml0X2JvYXJkICgpIGF0IC4uL3N5c3RlbS92bC5jOjI2MjANCj4gID4+
ICAgIzcgIDB4MDAwMGFhYWFjNmY1OTBkYyBpbiBxbXBfeF9leGl0X3ByZWNvbmZpZw0KPiAgKGVy
cnA9MHhhYWFhYzg5MTExMjANCj4gID4+ICAgPGVycm9yX2ZhdGFsPikNCj4gID4+ICAgICAgICBh
dCAuLi9zeXN0ZW0vdmwuYzoyNzEyDQo+ICA+PiAgICM4ICAweDAwMDBhYWFhYzZmNWI3MjggaW4g
cWVtdV9pbml0IChhcmdjPTgyLCBhcmd2PTB4ZmZmZmY3NTRmMWQ4KSBhdA0KPiAgPj4gICAuLi9z
eXN0ZW0vdmwuYzozNzU4DQo+ICA+PiAgICM5ICAweDAwMDBhYWFhYzZhNTMxNWMgaW4gbWFpbiAo
YXJnYz04MiwgYXJndj0weGZmZmZmNzU0ZjFkOCkgYXQNCj4gID4+ICAgLi4vc3lzdGVtL21haW4u
Yzo0Nw0KPiAgPj4NCj4gID4+ICAgVGhhbmtzLA0KPiAgPj4gICBHYXZpbg0KPiAgPj4NCj4gID4N
Cj4gIA0KDQo=
