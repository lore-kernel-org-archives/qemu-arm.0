Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp7971ejr;
        Tue, 10 Oct 2023 02:50:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQILryGBqASO128z2IUzE/h68uM3/EXHGN/wb+4Rd+R8oUCOpKGjY5Xu0IG04PfB62Axo
X-Received: by 2002:a05:600c:3b89:b0:406:478e:9e2d with SMTP id n9-20020a05600c3b8900b00406478e9e2dmr14927323wms.26.1696931439668;
        Tue, 10 Oct 2023 02:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931439; cv=none;
        d=google.com; s=arc-20160816;
        b=w/F+hNbYG2MaK1wYoN9dl/10Xcl8Gg0be7U3Dtb8FDM/pN2E1S4RL3moebltgGYMoF
         1HROhO0AOveVgXkEc2PNbzfxcyoXXG2p3lfLVLmt/cqfOQMQ8y6UHny14ifHmzlViqe3
         09evkq/1xgLB0TJ8Hj1wVgfkeLRFrOKPPhWvhPdOnCnZwtP2+gJcVpWqD3x6rmB4hb9t
         1ZglWQnY8uZe3rfdwXvMmTI4HVojsv0pd91Z0e/k7pGh0kZeygWNoijuviAvYFSdjtTT
         +ZYn8vWCPeBz9UPoxeubQhc/tFTO1zTcNbKhg0aDn++CEa7UdE+nqCticZxjmEUvBEwu
         Je1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=4RMSIDkSCEKnjnYV3ypp9UYSqsw226nS93LFJvwr1pU=;
        fh=ArDpgR21IQ5SVfoMeq0rTdqbphlAxLfW/mhVyowvahQ=;
        b=B6lK/ou8yOBp3DNueCqVnL6oSV7KG8Vm33dlZ1cyrf2JaxZUcbrCnJC3PfaTDDDyyJ
         m8vILpSsaTFHd6jMgfrvl8cDWcO15TS/xqTmn8jAx7grHWf+YjYrpGcof4fKJDR8DWT9
         linKVUVU3hba5KYJ8z6WuY/BUUOTjrQa7KtW+3KvLjQ8TulRLadw005F8xUDlz1/5NFf
         +RsPGFtzlF/MQt/NlxtwraoP+iZ/B39uJrbWF97OjD1I7SoZ6YYj9keuS3fslkIUsX8T
         +f677LHW/XR4Pcj7asFDRL/yWCTUTGQJvTOv79hf6kqhRZVSw3hFAYR76r4o/qikyMHQ
         H8QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id s13-20020a5d69cd000000b0032336f5d655si4349835wrw.157.2023.10.10.02.50.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S4WKQ30LNz6D8cV;
	Tue, 10 Oct 2023 17:47:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 10:50:38 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 10 Oct 2023 10:50:38 +0100
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
Subject: RE: [PATCH V4 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Topic: [PATCH V4 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHZ+vCtAkAWKYXgr0OuLtDfoazlJ7BCnfiAgAAqeOA=
Date: Tue, 10 Oct 2023 09:50:38 +0000
Message-ID: <9cf277f61c4b401fa39cbc88109e1db1@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-8-salil.mehta@huawei.com>
 <d9fdeb5b-5da2-8411-7940-e64ad7ebf91b@redhat.com>
In-Reply-To: <d9fdeb5b-5da2-8411-7940-e64ad7ebf91b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.234]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: afjayjj97Sz0

PiBGcm9tOiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDEwLCAyMDIzIDk6MTggQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5t
ZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiBhcm1Abm9u
Z251Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsg
Sm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgbHBpZXJh
bGlzaUBrZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0Bs
aW51eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1
Z2VyQHJlZGhhdC5jb207IG9saXZlci51cHRvbkBsaW51eC5kZXY7DQo+IHBib256aW5pQHJlZGhh
dC5jb207IG1zdEByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IGdzaGFuQHJlZGhhdC5jb207
DQo+IHJhZmFlbEBrZXJuZWwub3JnOyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsaW51eEBhcm1s
aW51eC5vcmcudWs7DQo+IGRhcnJlbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBpbGtrYUBvcy5h
bXBlcmVjb21wdXRpbmcuY29tOw0KPiB2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsga2Fy
bC5oZXViYXVtQG9yYWNsZS5jb207DQo+IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1l
aHRhQG9wbnNyYy5uZXQ7IHpodWtlcWlhbg0KPiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2Fu
Z3hpb25nZmVuZyAoQykgPHdhbmd4aW9uZ2ZlbmcyQGh1YXdlaS5jb20+Ow0KPiB3YW5neWFuYW4g
KFkpIDx3YW5neWFuYW41NUBodWF3ZWkuY29tPjsgamlha2VybmVsMkBnbWFpbC5jb207DQo+IG1h
b2JpYm9AbG9vbmdzb24uY247IGxpeGlhbmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtIDxsaW51
eGFybUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDA3LzEwXSBody9hY3Bp
OiBVcGRhdGUgQUNQSSBHRUQgZnJhbWV3b3JrIHRvIHN1cHBvcnQNCj4gdkNQVSBIb3RwbHVnDQo+
IA0KPiBPbiAxMC8xMC8yMyAwNDozNSwgU2FsaWwgTWVodGEgdmlhIHdyb3RlOg0KPiA+IEFDUEkg
R0VEIHNoYWxsIGJlIHVzZWQgdG8gY29udmV5IHRvIHRoZSBndWVzdCBrZXJuZWwgYWJvdXQgYW55
IENQVSBob3QtDQo+ICh1bilwbHVnDQo+ID4gZXZlbnRzLiBUaGVyZWZvcmUsIGV4aXN0aW5nIEFD
UEkgR0VEIGZyYW1ld29yayBpbnNpZGUgUUVNVSBuZWVkcyB0byBiZQ0KPiBlbmhhbmNlZA0KPiA+
IHRvIHN1cHBvcnQgQ1BVIGhvdHBsdWcgc3RhdGUgYW5kIGV2ZW50cy4NCj4gPg0KPiA+IENvLWRl
dmVsb3BlZC1ieTogS2VxaWFuIFpodSA8emh1a2VxaWFuMUBodWF3ZWkuY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4gPiBSZXZpZXdl
ZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBSZXZpZXdlZC1i
eTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4NCg0KVGhhbmtzDQo=
