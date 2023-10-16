Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3521123ejc;
        Mon, 16 Oct 2023 15:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTLWpCZl4FdCQbW53iPteEYITPP6UUxUW3v44+FcdDiS477dVMu0ruk4WFHeqkz0jOIPVC
X-Received: by 2002:a5d:6182:0:b0:32d:aa11:221d with SMTP id j2-20020a5d6182000000b0032daa11221dmr615370wru.27.1697497194174;
        Mon, 16 Oct 2023 15:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697497194; cv=none;
        d=google.com; s=arc-20160816;
        b=Oki7Wc7PizHs3Fuh7Q4aIRGXCJQZJxXJS454juni20r5HofqrHiolkWT3W+eedsF3e
         It87dGR685EXVik8g3ZMHGMigAAKiH3Yu/mJW4wlGuM1dLDVw2WCU+maqtzOGF1wLXiv
         vP6+VtekdVqVrjjApn/jG+yBOgGjbvOxxmTruPSh5K8+8ocnZtE24cma2ONd2WON4ZsW
         HenpEGXTmSpa81RakVZpmR8Ad3rpPX+1mGDNBnnIZ2om3rNgpyiYn0I3ZzOPrnb1ikGB
         bH3ILCcUsSqfpZDq7pq2xdv1jZIQzF9i1/S5P+73LKmkZaovLqW4xKnIZtYgLeazF+9q
         TaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Z4Fo2m2aKkQUgaZxC+XwupM18qp7loSmPvycsWvOgIk=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=AaOyogOqFdYPO9R5lJEbUOfoNhlvDV/THWy9xYi2RUeBR8njPDsd/0DjBlqBGIhaJC
         XihqxUBvXvjEmyrCzAZgWFKeXDyGxcmixueZoZ2RfOpFJFP4Hoommw2IfWDqcmQvuFX3
         ZRiaxVR9FDL3glpQ0pikAZtzfEWpoJv6yfSmVcReu1haYTllaqRLSwPDfImDModojhVU
         CcgrVr5/I94YMvRO/J7OmZTVxYcV4ec0PBllNu4Jd3/UzDvsb8Rgg6iz3HCEfIKwgalk
         xvgCv5BnJ3JCHFzKMG9jtHxGh4qclqII0FsOQjy9npomhaNIwrsrCXxvv7ZMA6ehb1vU
         8W2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id dk4-20020a0560000b4400b0032d93900442si175222wrb.475.2023.10.16.15.59.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 15:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500003.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8XZ60dr2z6K5wl;
	Tue, 17 Oct 2023 06:57:34 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 23:59:52 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 23:59:51 +0100
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
Subject: RE: [PATCH RFC V2 19/37] hw/acpi: ACPI/AML Changes to reflect the
 correct _STA.{PRES,ENA} Bits to Guest
Thread-Topic: [PATCH RFC V2 19/37] hw/acpi: ACPI/AML Changes to reflect the
 correct _STA.{PRES,ENA} Bits to Guest
Thread-Index: AQHZ8GHLlEX4Xw6l3UmDTRJisxuK9rAw1u+AgBxMmfA=
Date: Mon, 16 Oct 2023 22:59:51 +0000
Message-ID: <138a62be6bdd4146b4dfcf0c45991a38@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-20-salil.mehta@huawei.com>
 <da5e5609-1883-8650-c7d8-6868c7b74f1c@redhat.com>
In-Reply-To: <da5e5609-1883-8650-c7d8-6868c7b74f1c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: oe5ehtn+z7tl

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogRnJpZGF5LCBTZXB0ZW1iZXIgMjksIDIwMjMgMTI6MzQgQU0NCj4gVG86IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFy
bUBub25nbnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8u
b3JnOyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBs
cGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3Lmpv
bmVzQGxpbnV4LmRldjsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVy
aWMuYXVnZXJAcmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwub3JnOyBhcmRiQGtlcm5lbC5vcmc7DQo+
IG9saXZlci51cHRvbkBsaW51eC5kZXY7IHBib256aW5pQHJlZGhhdC5jb207IG1zdEByZWRoYXQu
Y29tOw0KPiByYWZhZWxAa2VybmVsLm9yZzsgYm9ybnRyYWVnZXJAbGludXguaWJtLmNvbTsgYWxl
eC5iZW5uZWVAbGluYXJvLm9yZzsNCj4gbGludXhAYXJtbGludXgub3JnLnVrOyBkYXJyZW5Ab3Mu
YW1wZXJlY29tcHV0aW5nLmNvbTsNCj4gaWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsgdmlz
aG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+IGthcmwuaGV1YmF1bUBvcmFjbGUuY29tOyBt
aWd1ZWwubHVpc0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBvcG5zcmMubmV0Ow0KPiB6aHVrZXFp
YW4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9uZ2ZlbmcgKEMpDQo+IDx3YW5neGlv
bmdmZW5nMkBodWF3ZWkuY29tPjsgd2FuZ3lhbmFuIChZKSA8d2FuZ3lhbmFuNTVAaHVhd2VpLmNv
bT47DQo+IGppYWtlcm5lbDJAZ21haWwuY29tOyBtYW9iaWJvQGxvb25nc29uLmNuOyBsaXhpYW5n
bGFpQGxvb25nc29uLmNuDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIFYyIDE5LzM3XSBody9h
Y3BpOiBBQ1BJL0FNTCBDaGFuZ2VzIHRvIHJlZmxlY3QgdGhlDQo+IGNvcnJlY3QgX1NUQS57UFJF
UyxFTkF9IEJpdHMgdG8gR3Vlc3QNCj4gDQo+IEhpIFNhbGlsLA0KPiANCj4gT24gOS8yNi8yMyAy
MDowNCwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gQUNQSSBBTUwgY2hhbmdlcyB0byBwcm9wZXJs
eSByZWZsZWN0IHRoZSBfU1RBLlBSRVMgYW5kIF9TVEEuRU5BIEJpdHMgdG8NCj4gdGhlDQo+ID4g
Z3Vlc3QgZHVyaW5nIGluaXRpYWx6YXRpb24sIHdoZW4gQ1BVcyBhcmUgaG90cGx1Z2dlZCBhbmQg
YWZ0ZXIgQ1BVcyBhcmUNCj4gPiBob3QtdW5wbHVnZ2VkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gICBo
dy9hY3BpL2NwdS5jICAgICAgICAgICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tDQo+ID4gICBody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMgfCAxMSAr
KysrKysrKw0KPiA+ICAgaW5jbHVkZS9ody9hY3BpL2NwdS5oICAgICAgICAgIHwgIDIgKysNCj4g
PiAgIDMgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9ody9hY3BpL2NwdS5jIGIvaHcvYWNwaS9jcHUuYw0KPiA+IGlu
ZGV4IDIzMjcyMDk5MmQuLmUxMjk5Njk2ZDMgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYWNwaS9jcHUu
Yw0KPiA+ICsrKyBiL2h3L2FjcGkvY3B1LmMNCj4gPiBAQCAtNjMsMTAgKzYzLDExIEBAIHN0YXRp
YyB1aW50NjRfdCBjcHVfaG90cGx1Z19yZCh2b2lkICpvcGFxdWUsIGh3YWRkcg0KPiBhZGRyLCB1
bnNpZ25lZCBzaXplKQ0KPiA+ICAgICAgIGNkZXYgPSAmY3B1X3N0LT5kZXZzW2NwdV9zdC0+c2Vs
ZWN0b3JdOw0KPiA+ICAgICAgIHN3aXRjaCAoYWRkcikgew0KPiA+ICAgICAgIGNhc2UgQUNQSV9D
UFVfRkxBR1NfT0ZGU0VUX1JXOiAvKiBwYWNrIGFuZCByZXR1cm4gaXNfKiBmaWVsZHMgKi8NCj4g
PiAtICAgICAgICB2YWwgfD0gY2Rldi0+Y3B1ID8gMSA6IDA7DQo+ID4gKyAgICAgICAgdmFsIHw9
IGNkZXYtPmlzX2VuYWJsZWQgPyAxIDogMDsNCj4gPiAgICAgICAgICAgdmFsIHw9IGNkZXYtPmlz
X2luc2VydGluZyA/IDIgOiAwOw0KPiA+ICAgICAgICAgICB2YWwgfD0gY2Rldi0+aXNfcmVtb3Zp
bmcgID8gNCA6IDA7DQo+ID4gICAgICAgICAgIHZhbCB8PSBjZGV2LT5md19yZW1vdmUgID8gMTYg
OiAwOw0KPiA+ICsgICAgICAgIHZhbCB8PSBjZGV2LT5pc19wcmVzZW50ID8gMzIgOiAwOw0KPiA+
ICAgICAgICAgICB0cmFjZV9jcHVocF9hY3BpX3JlYWRfZmxhZ3MoY3B1X3N0LT5zZWxlY3Rvciwg
dmFsKTsNCj4gPiAgICAgICAgICAgYnJlYWs7DQo+IA0KPiBUaGUgdkNQVSBzdGF0ZXMgYXJlIHN5
bmNocm9uaXplZCB0byB3aGF0IHdlIGhhZC4gSXQgbWVhbnMgd2UncmUgbWFpbnRhaW5pbmcgdHdv
IHNldA0KPiB2Q1BVIHN0YXRlcywgb25lIGZvciBib2FyZCBsZXZlbCBhbmQgYW5vdGhlciBzZXQg
Zm9yIHZDUFUgaG90cGx1ZyBoZXJlLiBUaGV5IGxvb2sNCj4gZHVwbGljYXRlIHRvIGVhY2ggb3Ro
ZXIuIEhvd2V2ZXIsIGl0IHdpbGwgbmVlZCB0b28gbXVjaCBjb2RlIGNoYW5nZXMgdG8gY29tYmlu
ZQ0KPiB0aGVtLg0KDQpXZSBuZWVkIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gQUNQSSBDUFUgSG90
cGx1ZyBzdGF0ZXMgYW5kIFFPTSBDUFUgc3RhdGVzLg0KQUNQSSBleHBvc2VzIHRoZSBRT00gQ1BV
IHN0YXRlIHRvIEd1ZXN0IE9TLiBUaWxsIG5vdyBBQ1BJIENQVSBIb3RwbHVnDQpzdGF0ZXMgYW5k
IFFPTSBDUFUgc3RhdGVzIHdlcmUgY29uc2lzdGVudCB0byBlYWNoIG90aGVyLiBBQ1BJIGluZmVy
cmVkDQp0aGUgcHJlc2VuY2Ugb2YgUU9NIENQVVN0YXRlIG9iamVjdCBhcyBfU1RBLlBSRVNFTlQ9
MSBhbmQgX1NUQS5FTkFCTEVEPTEuDQoNCkJ1dCB3aXRoIHRoZSBBUk0gQ1BVIGhvdCh1bilwbHVn
IGNoYW5nZXMsIHRoaXMgYXNzdW1wdGlvbiBpcyBubyBsb25nZXIgdHJ1ZS4gDQpRT00gQ1BVU3Rh
dGUgb2JqZWN0IG1pZ2h0IHN0aWxsIGJlIHByZXNlbnQgb3IgTlVMTCBidXQgQUNQSSBDUFUgSG90
cGx1Zw0KU3RhdGUgd2lsbCBhbHdheXMgZXhwb3NlIHVuLXBsdWdnZWQgQ1BVIGkuZS4gd2l0aCBO
VUxMIENQVVN0YXRlIG9iamVjdA0KYXMgX1NUQS5QUkVTRU5UPTEgYW5kIF9TVEEuRU5BQkxFRD0w
LiBUaGlzIGlzIGEga2V5IGNoYW5nZSBiZWNhdXNlIG9mDQp3aGljaCB3ZSBhcmUgYWJsZSB0byBl
bmFibGUgaG90KHVuKXBsdWcgbWVjaGFuaXNtIG9uIEFSTS4NCg0KDQo+IA0KPiA+ICAgICAgIGNh
c2UgQUNQSV9DUFVfQ01EX0RBVEFfT0ZGU0VUX1JXOg0KPiA+IEBAIC0yMjgsNyArMjI5LDIxIEBA
IHZvaWQgY3B1X2hvdHBsdWdfaHdfaW5pdChNZW1vcnlSZWdpb24gKmFzLCBPYmplY3QNCj4gKm93
bmVyLA0KPiA+ICAgICAgICAgICBzdHJ1Y3QgQ1BVU3RhdGUgKmNwdSA9IENQVShpZF9saXN0LT5j
cHVzW2ldLmNwdSk7DQo+ID4gICAgICAgICAgIGlmIChxZW11X3ByZXNlbnRfY3B1KGNwdSkpIHsN
Cj4gPiAgICAgICAgICAgICAgIHN0YXRlLT5kZXZzW2ldLmNwdSA9IGNwdTsNCj4gPiArICAgICAg
ICAgICAgc3RhdGUtPmRldnNbaV0uaXNfcHJlc2VudCA9IHRydWU7DQo+ID4gKyAgICAgICAgfSBl
bHNlIHsNCj4gPiArICAgICAgICAgICAgaWYgKHFlbXVfcGVyc2lzdGVudF9jcHUoY3B1KSkgew0K
PiA+ICsgICAgICAgICAgICAgICAgc3RhdGUtPmRldnNbaV0uaXNfcHJlc2VudCA9IHRydWU7DQo+
ID4gKyAgICAgICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgICBzdGF0ZS0+ZGV2
c1tpXS5pc19wcmVzZW50ID0gZmFsc2U7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gPiAgICAgICAg
ICAgfQ0KPiANCj4gc3RhdGUtPmRldnNbaV0uaXNfcHJlc2VudCA9IHFlbXVfcGVyc2lzdGVudF9j
cHUoY3B1KTsNCg0KDQpTdXJlLiBUaGFua3MgZm9yIHBvaW50aW5nLiA6KQ0KDQoNCj4gPiArDQo+
ID4gKyAgICAgICAgaWYgKHFlbXVfZW5hYmxlZF9jcHUoY3B1KSkgew0KPiA+ICsgICAgICAgICAg
ICBzdGF0ZS0+ZGV2c1tpXS5pc19lbmFibGVkID0gdHJ1ZTsNCj4gPiArICAgICAgICB9IGVsc2Ug
ew0KPiA+ICsgICAgICAgICAgICBzdGF0ZS0+ZGV2c1tpXS5pc19lbmFibGVkID0gZmFsc2U7DQo+
ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gDQo+IHN0YXRlLT5kZXZbaV0uaXNfZW5hYmxlZCA9IHFl
bXVfZW5hYmxlZF9jcHUoY3B1KTsNCg0KDQpTdXJlLiBZZXMuDQoNCg0KVGhhbmtzDQpTYWxpbC4N
Cg==
