Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3522097ejc;
        Mon, 16 Oct 2023 16:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBcpchZu0a/MO+lDe+m/YGBroSiZPn3fTN5sWGWnbmEef6yqvybPW9Ofqiq2v/imzNzlSd
X-Received: by 2002:a05:6000:1372:b0:32c:cb0d:424c with SMTP id q18-20020a056000137200b0032ccb0d424cmr557085wrz.45.1697497285876;
        Mon, 16 Oct 2023 16:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697497285; cv=none;
        d=google.com; s=arc-20160816;
        b=APJD28pJqSVF+NGL0aGElWINRzORUHVyhydJQTt/6cl11NWEP16o3yHEg3hoJ3dkA5
         TtiJHPbG/+cGABN3xCeC8a3lwkwsubv99Sw7eqwDB07u+p6U14iQHkBhGUYCBNumrFX9
         0dSQGn3Un/DcdI0Ipn6PaF3zHhTFu71wzfmLL5bv7iFrXl9rD5p7StVOjrwmc7ZuDpfd
         uoGcXZo7EkJZ5Ri+hVNVP0GzlBhjNZEgX6iXPL39KctnrKt9jIzcWPQ09/LdCc7h1E57
         BWxeybihYK9GEpdjeobkYB93UA9pR7lG0c5PNFyjZnxlA50QbzySuB0PfASznAmFMy72
         DsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=G/K3u+PclGxXaG8l/fsmORMMoksO/8aPZTmVM0dLCBc=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=YRgq4bVGg/43MAPEEuORlqabUJwoUe6FwePYve4GwqCdFqO9O7Py0HVqifRjMi8NBg
         LouRp36x8E3lwlZR4A4yL5kFEU7GVNJ93ZSGGjyWhnF438scnglomtn/sZgyMcmGxmeA
         7FHjz1dz8GlECObpgb93dKz5lhqGy21fW6Zk8cOrXc0yQikdVgoPIM++gsnlT4qyyRxN
         xjS+uIA6EZZP0TChLReq5RGd/oQYK3vAEFJtvttnu/2lvHX6hTG+eiO/ebsCn8Yh92V4
         VPhGtT+O5N+9cIl0pvNDZQrpxpwW9QDtMAwA3Bu9FMKaj++A3QNKh68W+vbihET61ouh
         D25w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k4-20020a5d4284000000b0032db7c9fdefsi172104wrq.876.2023.10.16.16.01.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 16:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8Xdz1ngvz67LyQ;
	Tue, 17 Oct 2023 07:00:55 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 17 Oct 2023 00:01:24 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 17 Oct 2023 00:01:24 +0100
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
Subject: RE: [PATCH RFC V2 20/37] hw/acpi: Update GED _EVT method AML with cpu
 scan
Thread-Topic: [PATCH RFC V2 20/37] hw/acpi: Update GED _EVT method AML with
 cpu scan
Thread-Index: AQHZ8GHWAhWSJ6lN2kmLIHc6IBKILLAw13oAgBxQ3AA=
Date: Mon, 16 Oct 2023 23:01:23 +0000
Message-ID: <dcc4f8d8bb6a4752a070af470ecb1146@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-21-salil.mehta@huawei.com>
 <14b334c1-0b5f-7f56-6f35-809925085dcf@redhat.com>
In-Reply-To: <14b334c1-0b5f-7f56-6f35-809925085dcf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: K0QOsw2h/mL8

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIFNl
cHRlbWJlciAyOSwgMjAyMyAxMjozNiBBTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRh
QGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25nbnUu
b3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBKb25h
dGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFsaXNp
QGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxpbnV4
LmRldjsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVyaWMuYXVnZXJA
cmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwub3JnOyBhcmRiQGtlcm5lbC5vcmc7DQo+IG9saXZlci51
cHRvbkBsaW51eC5kZXY7IHBib256aW5pQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOw0KPiBy
YWZhZWxAa2VybmVsLm9yZzsgYm9ybnRyYWVnZXJAbGludXguaWJtLmNvbTsgYWxleC5iZW5uZWVA
bGluYXJvLm9yZzsNCj4gbGludXhAYXJtbGludXgub3JnLnVrOyBkYXJyZW5Ab3MuYW1wZXJlY29t
cHV0aW5nLmNvbTsNCj4gaWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsgdmlzaG51QG9zLmFt
cGVyZWNvbXB1dGluZy5jb207DQo+IGthcmwuaGV1YmF1bUBvcmFjbGUuY29tOyBtaWd1ZWwubHVp
c0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBvcG5zcmMubmV0Ow0KPiB6aHVrZXFpYW4gPHpodWtl
cWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9uZ2ZlbmcgKEMpDQo+IDx3YW5neGlvbmdmZW5nMkBo
dWF3ZWkuY29tPjsgd2FuZ3lhbmFuIChZKSA8d2FuZ3lhbmFuNTVAaHVhd2VpLmNvbT47DQo+IGpp
YWtlcm5lbDJAZ21haWwuY29tOyBtYW9iaWJvQGxvb25nc29uLmNuOyBsaXhpYW5nbGFpQGxvb25n
c29uLmNuDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIFYyIDIwLzM3XSBody9hY3BpOiBVcGRh
dGUgR0VEIF9FVlQgbWV0aG9kIEFNTCB3aXRoDQo+IGNwdSBzY2FuDQo+IA0KPiBPbiA5LzI2LzIz
IDIwOjA0LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiBPU1BNIGV2YWx1YXRlcyBfRVZUIG1ldGhv
ZCB0byBtYXAgdGhlIGV2ZW50LiBUaGUgY3B1IGhvdHBsdWcgZXZlbnQNCj4gZXZlbnR1YWxseQ0K
PiA+IHJlc3VsdHMgaW4gc3RhcnQgb2YgdGhlIGNwdSBzY2FuLiBTY2FuIGZpZ3VyZXMgb3V0IHRo
ZSBjcHUgYW5kIHRoZSBraW5kDQo+IG9mDQo+ID4gZXZlbnQocGx1Zy91bnBsdWcpIGFuZCBub3Rp
ZmllcyBpdCBiYWNrIHRvIHRoZSBndWVzdC4NCj4gPg0KPiA+IFRoZSBjaGFuZ2UgaW4gdGhpcyBw
YXRjaCB1cGRhdGVzIHRoZSBHRUQgQU1MIF9FVlQgbWV0aG9kIHdpdGggdGhlIGNhbGwgdG8NCj4g
PiBcXF9TQi5DUFVTLkNTQ04gd2hpY2ggd2lsbCBkbyBhYm92ZS4NCj4gPg0KPiA+IENvLWRldmVs
b3BlZC1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ID4gQ28tZGV2
ZWxvcGVkLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogS2VxaWFuIFpodSA8emh1a2VxaWFuMUBodWF3ZWkuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgaHcvYWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5jIHwgNCArKysrDQo+ID4gICBpbmNsdWRl
L2h3L2FjcGkvY3B1X2hvdHBsdWcuaCAgfCAyICsrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5A
cmVkaGF0LmNvbT4NCg0KVGhhbmtzLiBBbHJlYWR5IHJldmlld2VkIGFzIHBhcnQgb2YgYXJjaGl0
ZWN0dXJlIGFnbm9zdGljIHBhdGNoLXNldA0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11
LWRldmVsLzQ3NjRDRjQ3LTQ3Q0EtNDY4NS04MDVDLUJCRTYzMTBCRTE2NEBvcmFjbGUuY29tL1Qv
I200MGI3MjA3N2FkOGM3OTc1OTc1ODg2MDBiZmY1ZTVhYmNhNDQxNTBjDQoNCmNoZWVycw0KU2Fs
aWwuDQoNCg0K
