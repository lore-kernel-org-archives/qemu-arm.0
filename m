Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp1049527njc;
        Wed, 26 Jun 2024 10:53:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgP3WXmDJP17majmOxwOBHFHolAQXWonDCG0navrDaxsmRgfO82rmLr+3Y7XDDTBHBqCSIrH8HqtzLVTmZG5B/6RhwYuFp
X-Google-Smtp-Source: AGHT+IEWYpa9PdWYHgF95hNtQfXp8rrT/+rdvhr74B4wSLaSaphiBNo05kJ5YZySt28zXeM+6tC8
X-Received: by 2002:ac2:5f8b:0:b0:52c:df2c:65fe with SMTP id 2adb3069b0e04-52ce18350bemr7955161e87.15.1719424434337;
        Wed, 26 Jun 2024 10:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719424434; cv=none;
        d=google.com; s=arc-20160816;
        b=gUQW4ENUw8cdcOrt83Ap7EcPEiSLTumMkMfI8zOOOpFRfcndo948kDFmYyXWpO5A2l
         DxgOLtpxemLUbaOdNRuha5DL9TW9XFNygQyTxfehs9LGQk9+1wh7FbyNLXChPV39yhgZ
         SXpWK8UEikfwQMkVjstFGWn8qIbkL1lvUlqNc9J9BtStldUB/8wMoSpjwynT7fRCPaRz
         msk6y4Q4hCtWK/4bYLCIEa4ty+WWj2K+t6f3WR6v4jJqXK7UZxjq35XQTegUM4lIJIrj
         Eg8QV+lVsH+Jp1NAXDRT9FJIR7O5Q+hcxOHLGxf6wxoy99K6GBb23NELE2elJUqXBJO5
         geAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=OlDvB+IEKwXxPHzAnZkK/Ac7Tk8Vp4o5VxgGMT/D3co=;
        fh=nzZfPh+be7ShzS/IsVgb8/g1ejXxQlMT+bHoqwLzckk=;
        b=bZK9y6RI1wxIaQd0h5aP7PVteve5xFzUbufXPoiP5a1KwcU0vsV8pzk5solKkD7gTn
         94nzCE9mC45lgCxtO0jYSGHotajgPhMvhTr04k2V/qxGamciiqs+r9Ll0/Yln27NOaBl
         5n9+0yKaOyJff04a5Xo1HD4yZqhaMP0P771dMb2XS0rVKnu3aQKDpEIBSu87q/oFpm8X
         GOGh0O8/xtdbKsQXWRgElMeGUpZ0+S1NNCk5RBmbYDzpc4/J7srrsw+Eyn2fOXkMB/j4
         OKeI/PEmR9V7ZhFeXOYchCQdTQmV35KNER94DMKoIfIfaWT6r/HnVr3VlMZnlEhn9fKA
         pstg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3663b460882si7029604f8f.1023.2024.06.26.10.53.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2024 10:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W8TmV54tHz6K9JB;
	Thu, 27 Jun 2024 01:52:10 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (unknown [7.191.163.9])
	by mail.maildlp.com (Postfix) with ESMTPS id 00C191400C9;
	Thu, 27 Jun 2024 01:53:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 18:53:52 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Wed, 26 Jun 2024 18:53:52 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, Salil Mehta <salil.mehta@opnsrc.net>, "Igor
 Mammedov" <imammedo@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com"
	<harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V12 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Topic: [PATCH V12 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Index: AQHasiICqFrRyvmDr0+9IflX7gIe/7G0/EKAgAQw/ICAIBLYAIAASTeAgAD1fFA=
Date: Wed, 26 Jun 2024 17:53:52 +0000
Message-ID: <eb5880984ddf41aabca9d036e7ad445f@huawei.com>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
	<20240602180241-mutt-send-email-mst@kernel.org>
	<20240605160327.3c71f4ab@imammedo.users.ipa.redhat.com>
	<CAJ7pxeYehVhPWfbEqRMMSCVHk31JQhtQhRSM_4e1WqBhqv0UHQ@mail.gmail.com>
 <b36e0d64-9653-4d48-b72a-00a1aee86629@redhat.com>
In-Reply-To: <b36e0d64-9653-4d48-b72a-00a1aee86629@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.33.18]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: VY3CkYi2Zzcj

SGkgR2F2aW4sDQoNCj4gIEZyb206IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+DQo+ICBT
ZW50OiBXZWRuZXNkYXksIEp1bmUgMjYsIDIwMjQgNToxMyBBTQ0KPiAgVG86IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBvcG5zcmMubmV0PjsgSWdvciBNYW1tZWRvdg0KPiAgPGltYW1tZWRvQHJl
ZGhhdC5jb20+DQo+ICANCj4gIEhpIFNhbGlsIGFuZCBJZ29yLA0KPiAgDQo+ICBPbiA2LzI2LzI0
IDk6NTEgQU0sIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPiBPbiBXZWQsIEp1biA1LCAyMDI0IGF0
IDM6MDPigK9QTSBJZ29yIE1hbW1lZG92DQo+ICA8aW1hbW1lZG9AcmVkaGF0LmNvbSA8bWFpbHRv
OmltYW1tZWRvQHJlZGhhdC5jb20+PiB3cm90ZToNCj4gID4gICAgIE9uIFN1biwgMiBKdW4gMjAy
NCAxODowMzowNSAtMDQwMA0KPiAgPiAgICAgIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRo
YXQuY29tIDxtYWlsdG86bXN0QHJlZGhhdC5jb20+Pg0KPiAgd3JvdGU6DQo+ICA+DQo+ICA+ICAg
ICAgPiBPbiBUaHUsIE1heSAzMCwgMjAyNCBhdCAxMjo0MjozM0FNICswMTAwLCBTYWxpbCBNZWh0
YSB3cm90ZToNCj4gID4gICAgICA+ID4gVmlydHVhbCBDUFUgaG90cGx1ZyBzdXBwb3J0IGlzIGJl
aW5nIGFkZGVkIGFjcm9zcyB2YXJpb3VzIGFyY2hpdGVjdHVyZXNbMV1bM10uDQo+ICA+ICAgICAg
PiA+IFRoaXMgc2VyaWVzIGFkZHMgdmFyaW91cyBjb2RlIGJpdHMgY29tbW9uIGFjcm9zcyBhbGwg
YXJjaGl0ZWN0dXJlczoNCj4gID4gICAgICA+ID4NCj4gID4gICAgICA+ID4gMS4gdkNQVSBjcmVh
dGlvbiBhbmQgUGFya2luZyBjb2RlIHJlZmFjdG9yIFtQYXRjaCAxXQ0KPiAgPiAgICAgID4gPiAy
LiBVcGRhdGUgQUNQSSBHRUQgZnJhbWV3b3JrIHRvIHN1cHBvcnQgdkNQVSBIb3RwbHVnIFtQYXRj
aCAyLDNdDQo+ICA+ICAgICAgPiA+IDMuIEFDUEkgQ1BVcyBBTUwgY29kZSBjaGFuZ2UgW1BhdGNo
IDQsNV0NCj4gID4gICAgICA+ID4gNC4gSGVscGVyIGZ1bmN0aW9ucyB0byBzdXBwb3J0IHVucmVh
bGl6YXRpb24gb2YgQ1BVIG9iamVjdHMgW1BhdGNoICA2LDddDQo+ICA+ICAgICAgPiA+IDUuIERv
Y3MgW1BhdGNoIDhdDQo+ICA+ICAgICAgPiA+DQo+ICA+ICAgICAgPiA+DQo+ICA+ICAgICAgPiA+
IFJlcG9zaXRvcnk6DQo+ICA+ICAgICAgPiA+DQo+ICA+ICAgICAgPiA+IFsqXSBodHRwczovL2dp
dGh1Yi5jb20vc2FsaWwtbWVodGEvcWVtdS5naXQgICA8aHR0cHM6Ly9naXRodWIuY29tL3NhbGls
LW1laHRhL3FlbXUuZ2l0PiB2aXJ0LWNwdWhwLWFybXY4L3JmYy0gdjMuYXJjaC5hZ25vc3RpYy52
MTINCj4gID4gICAgICA+ID4NCj4gID4gICAgICA+ID4gTk9URTogVGhpcyBzZXJpZXMgaXMgbWVh
bnQgdG8gd29yayBpbiBjb25qdW5jdGlvbiB3aXRoIEFyY2hpdGVjdHVyZSBzcGVjaWZpYyBwYXRj
aC1zZXQuDQo+ICA+ICAgICAgPiA+IEZvciBBUk0sIHRoaXMgd2lsbCB3b3JrIGluIGNvbWJpbmF0
aW9uIG9mIHRoZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgcGFydCBiYXNlZCBvbg0KPiAgPiAgICAg
ID4gPiBSRkMgVjIgWzFdLiBUaGlzIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBwYXRjaC1zZXQgUkZD
IFYzIHNoYWxsIGJlIGZsb2F0ZWQgc29vbiBhbmQgaXMNCj4gID4gICAgICA+ID4gcHJlc2VudCBh
dCBiZWxvdyBsb2NhdGlvbg0KPiAgPiAgICAgID4gPg0KPiAgPiAgICAgID4gPiBbKl0gaHR0cHM6
Ly9naXRodWIuY29tL3NhbGlsLW1laHRhL3FlbXUvdHJlZS92aXJ0LWNwdWhwLWFybXY4L3JmYy12
My1yYzEgPGh0dHBzOi8vZ2l0aHViLmNvbS9zYWxpbC1tZWh0YS9xZW11L3RyZWUvdmlydC1jcHVo
cC1hcm12OC9yZmMtdjMtcmMxPg0KPiAgPiAgICAgID4gPg0KPiAgPiAgICAgID4NCj4gID4gICAg
ICA+DQo+ICA+ICAgICAgPiBJZ29yIHBsYW4gdG8gdGFrZSBhIGxvb2s/DQo+ICA+DQo+ICA+ICAg
ICBZZXAsIEkgcGxhbiB0byByZXZpZXcgaXQNCj4gID4NCj4gID4NCj4gID4gQSBnZW50bGUgcmVt
aW5kZXIgb24gdGhpcy4NCj4gID4NCj4gIA0KPiAgU2luY2UgdGhlIGxhdGVzdCByZXZpc2lvbiBm
b3IgdGhpcyBzZXJpZXMgaXMgdjEzLCBzbyBJIGd1ZXNzIElnb3IgbmVlZHMgdG8gZG8gdGhlDQo+
ICBmaW5hbCBzY3JlZW5pbmcgb24gdjEzIGluc3RlYWQ/DQo+ICANCj4gIHYxMzogaHR0cHM6Ly9s
aXN0cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWFybS8yMDI0LTA2L21zZzAwMTI5Lmh0
bWwNCg0KDQpZZXMsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcy4g8J+Yig0KDQoNCj4gIA0KPiAg
VGhhbmtzLA0KPiAgR2F2aW4NCj4gIA0KDQo=
