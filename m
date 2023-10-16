Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3063640ejc;
        Mon, 16 Oct 2023 03:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEckyO2qstfv2ICtatH82ZiQTiq23VsnhyItdlHM1ezTDK4yac5IlTRwk5JfoF74qsRFfEU
X-Received: by 2002:a5d:4f82:0:b0:32d:a3c5:ea7b with SMTP id d2-20020a5d4f82000000b0032da3c5ea7bmr6013303wru.44.1697450505440;
        Mon, 16 Oct 2023 03:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697450505; cv=none;
        d=google.com; s=arc-20160816;
        b=HvKt57sLjXfIU7KdfTeyH0D7jZQAqt8YEybRRYdvEVGGnosmgMSypqnpBRkmutNYIP
         m163vZNACgRmjJznRYe3loBTK0U7LQgtsIvxBv19kbpOGoIatEIP1p9qvq8fNZ79G5wR
         vNaChYJb6J7A7mIWlT0n3ImlNo2QycirCQWVx/jVHdW+oieYvPcO1ez5bJHGZTcBBHke
         L1ncrdXVBkxm7kF9P1n5N3clUfXMm12H31spE+4gDPcwY+gRkX/44VJJkzGB73rtWc8i
         RpwvctmLIV4dkzcevo+qCQkS+IRkoyQdPf0MterjL0+KO/TI52QDw1z0T6hDIOSxqPDM
         rrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=G3lOFDZQSoinhlJlUuWb0u76zmMf1y6ESxZI8Ifn8CI=;
        fh=ArDpgR21IQ5SVfoMeq0rTdqbphlAxLfW/mhVyowvahQ=;
        b=Xc5i++tw1wJU47xy08H0O6EU9mi3NzLnNJB96KB3VBoXY9DldxHe/Yf1SrfuKYfJav
         Uw5t1AaIJx3YqFTuKYW4fTuQ2wYvve/EBT9yAJtsJJ48mDUBFD2GVRogO4geWGNF4E1F
         5km86Mjg+dh7tACw8GTDQ3QVraDe3TKIAUcg8NUVJRTFv8i8ecDFI5yOZZnqP8XtNSOp
         Mm0XOhXRcDz0anVJdkX0CNudtrQo76eA/Ai6QLrr8QK5VrF/I9w1tkC/+ivgR5jTvldp
         tKQj++Nm/g38zpG0o8ACfSBvF5pqEhPtwQPeEvswo+15xyONrSdT3QFK9nczWKUfijo8
         Q/pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id c8-20020a5d5288000000b0031771dfc9b1si10559508wrv.496.2023.10.16.03.01.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 03:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8CLM4w6Dz6K8tB;
	Mon, 16 Oct 2023 18:01:15 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 11:01:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 11:01:43 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Shaoqin Huang <shahuang@redhat.com>, "qemu-devel@nongnu.org"
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
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
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
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V5 4/9] hw/acpi: Init GED framework with CPU hotplug
 events
Thread-Topic: [PATCH V5 4/9] hw/acpi: Init GED framework with CPU hotplug
 events
Thread-Index: AQHZ/HuL7tRAez8w1EqzmIDx/2tQSbBLrkUAgACGpOA=
Date: Mon, 16 Oct 2023 10:01:43 +0000
Message-ID: <f356262f23db4f90bfab0eed9900aee1@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
	<20231011194355.15628-5-salil.mehta@huawei.com>
 <cf0f3eb5-4dd1-207e-1f15-145603860ac8@redhat.com>
In-Reply-To: <cf0f3eb5-4dd1-207e-1f15-145603860ac8@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.147.12]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: yHevJlEg2inL

PiBGcm9tOiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBNb25k
YXksIE9jdG9iZXIgMTYsIDIwMjMgMzo1NCBBTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1l
aHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25n
bnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBK
b25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFs
aXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxp
bnV4LmRldjsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVyaWMuYXVn
ZXJAcmVkaGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsNCj4gcGJvbnppbmlAcmVkaGF0
LmNvbTsgbXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgZ3NoYW5AcmVkaGF0LmNvbTsN
Cj4gcmFmYWVsQGtlcm5lbC5vcmc7IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxp
bnV4Lm9yZy51azsNCj4gZGFycmVuQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFt
cGVyZWNvbXB1dGluZy5jb207DQo+IHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJs
LmhldWJhdW1Ab3JhY2xlLmNvbTsNCj4gbWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVo
dGFAb3Buc3JjLm5ldDsgemh1a2VxaWFuDQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5n
eGlvbmdmZW5nIChDKSA8d2FuZ3hpb25nZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAo
WSkgPHdhbmd5YW5hbjU1QGh1YXdlaS5jb20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFv
Ymlib0Bsb29uZ3Nvbi5jbjsgbGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4
YXJtQGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjUgNC85XSBody9hY3BpOiBJ
bml0IEdFRCBmcmFtZXdvcmsgd2l0aCBDUFUgaG90cGx1Zw0KPiBldmVudHMNCj4gDQo+IA0KPiAN
Cj4gT24gMTAvMTIvMjMgMDM6NDMsIFNhbGlsIE1laHRhIHZpYSB3cm90ZToNCj4gPiBBQ1BJIEdF
RChhcyBkZXNjcmliZWQgaW4gdGhlIEFDUEkgNi4yIHNwZWMpIGNhbiBiZSB1c2VkIHRvIGdlbmVy
YXRlIEFDUEkNCj4gZXZlbnRzDQo+ID4gd2hlbiBPU1BNL2d1ZXN0IHJlY2VpdmVzIGFuIGludGVy
cnVwdCBsaXN0ZWQgaW4gdGhlIF9DUlMgb2JqZWN0IG9mIEdFRC4NCj4gT1NQTQ0KPiA+IHRoZW4g
bWFwcyBvciBkZW11bHRpcGxleGVzIHRoZSBldmVudCBieSBldmFsdWF0aW5nIF9FVlQgbWV0aG9k
Lg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2UgYWRkcyB0aGUgc3VwcG9ydCBvZiBDUFUgaG90cGx1ZyBl
dmVudCBpbml0aWFsaXphdGlvbiBpbiB0aGUNCj4gPiBleGlzdGluZyBHRUQgZnJhbWV3b3JrLg0K
PiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4xQGh1YXdlaS5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2VxaWFuIFpodSA8emh1a2VxaWFuMUBodWF3ZWkuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29t
Pg0KPiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1
YXdlaS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPg0K
PiA+IFRlc3RlZC1ieTogVmlzaG51IFBhamp1cmkgPHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcu
Y29tPg0KPiBSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4N
Cg0KVGhhbmtzLg0KDQpQbGVhc2UgdXNlIGxhdGVzdCB2ZXJzaW9uIGZvciBhbnkgZnVydGhlciBy
ZXZpZXdzLg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzQ3NjRDRjQ3LTQ3
Q0EtNDY4NS04MDVDLUJCRTYzMTBCRTE2NEBvcmFjbGUuY29tL1QvI201NjNiN2ZiNDY5MDk5OGM3
MmNlZTdhNDFiMjE1MjI0ZTFjYzUzY2MwDQoNClRoYW5rcw0KU2FsaWwuDQo=
