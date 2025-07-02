Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3878821dye;
        Wed, 2 Jul 2025 08:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdBhNuqnF1rOlZaTq+yfJBhfwgGjdzdLBx15faKoxcjfzG0GaU8+Dtue3fT/dTvG2tWx/XaAnoXgB3Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IHmB02KN9rG7BsPHGYGtlEjLXuF3UdkmNgnsN7uvC4EyYG/9VKbHst/k2XOJZK+4xPIvcBK
X-Received: by 2002:a05:620a:2493:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7d5c47357demr454251685a.23.1751468934600;
        Wed, 02 Jul 2025 08:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751468934; cv=none;
        d=google.com; s=arc-20240605;
        b=FJ7TLqUGaIGfbZiCjEEGGia2q7EIYx6oBQKo9va4KhieoWBEN3w5Tj+4k2grIHU3bt
         OyUSvm0XhDPXTbJ7/pcoEOh/1KBgQweu6JD1kRVRE0++ynNbCx398iFE9AZi3fnFXIjp
         AT2DUS3du+3vA7UtdgqrYJQWpf4074fnYwJ75DbNqEUPkA2oOwbLNzTOafMnDsl4l88t
         lrdek65zUIpG/CzsMLoH5XBrKnKGolyqELNu+UEq14kwUhmsMHO7b/rQ7SNlZdNuSFP1
         chCEEzmk6VinFbjypyJHlTsr4Q+zBK10ugoVvfOLazHZ1IqVilz7u/Q77iwttfMNaOXt
         Iehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=v86I0B/j7RDpCVQlbyvftTdhQ62oyei/DUEgMFZMiNQ=;
        fh=+/JS3Qn114huyNvHmzR/Qunpstj/00bH7zwSQZmyD4A=;
        b=Fjo8r1DLn0mOoHCmxrJKGPEO0wL5UEKuFJJsMR6CL5jZ1GhXW1XjH//Lz8gSOa0iX9
         FqOVfFEELd2ZAGiAb4ybL2egYc1SG96k3lHYkMpdQAYK2zGOq92N6eTSEZzHwuPWDVX0
         WcGqfKIPOpLR2zwQnSI272jXCOFT2b0Ucd8SXjVDIOLR2XBdc9ZCAqqICTcADqkUbAVp
         5etnjvCxqHDY8YCj72dOFzKNoyVpOtkj8Bh1YJ9Lq7vJScjMcgNoNuPFXwNnP0p4foBv
         izaykeXl+VnY9q/bATBwip+5uxakKY+5CgwJeI1iIwxMRZrFruxBIaemslG6WgyF5mgD
         J0Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44326a17bsi1238817085a.433.2025.07.02.08.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 08:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWz4T-0004Ls-IN; Wed, 02 Jul 2025 11:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uWz4N-0004II-MW; Wed, 02 Jul 2025 11:08:21 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uWz4H-0001eQ-Rc; Wed, 02 Jul 2025 11:08:19 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXNVY6dBFz6L5XQ;
 Wed,  2 Jul 2025 23:05:09 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5D96B1402EA;
 Wed,  2 Jul 2025 23:08:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Jul 2025 17:08:03 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 2 Jul 2025 17:08:02 +0200
To: Nathan Chen <nathanc@nvidia.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "berrange@redhat.com" <berrange@redhat.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>, jiangkunkun <jiangkunkun@huawei.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "smostafa@google.com"
 <smostafa@google.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v5 00/11] hw/arm/virt: Add support for user creatable
 SMMUv3 device
Thread-Topic: [PATCH v5 00/11] hw/arm/virt: Add support for user creatable
 SMMUv3 device
Thread-Index: AQHb5C8S0d/fYPGiP0CF8356U8e6vbQd79AAgAEM2gA=
Date: Wed, 2 Jul 2025 15:08:02 +0000
Message-ID: <ea936a5cdfcb4d6187d35794d1eb65fd@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <81708f09-849a-4b01-9e4c-a854ae26eefb@nvidia.com>
In-Reply-To: <81708f09-849a-4b01-9e4c-a854ae26eefb@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4hpn+jdA9weT

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmF0aGFuIENoZW4gPG5h
dGhhbmNAbnZpZGlhLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDIsIDIwMjUgMjowMiBB
TQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBiZXJyYW5nZUByZWRoYXQuY29t
OyBkZHV0aWxlQHJlZGhhdC5jb207IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsNCj4gZ3VzdGF2by5y
b21lcm9AbGluYXJvLm9yZzsgaW1hbW1lZG9AcmVkaGF0LmNvbTsgamdnQG52aWRpYS5jb207DQo+
IGppYW5na3Vua3VuIDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsgSm9uYXRoYW4gQ2FtZXJvbg0K
PiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdl
aS5jb20+Ow0KPiBtb2Noc0BudmlkaWEuY29tOyBuYXRoYW5jQG52aWRpYS5jb207IG5pY29saW5j
QG52aWRpYS5jb207DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcWVtdS1hcm1Abm9uZ251
Lm9yZzsgU2hhbWVlcmFsaSBLb2xvdGh1bQ0KPiBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50
aG9kaUBodWF3ZWkuY29tPjsgc21vc3RhZmFAZ29vZ2xlLmNvbTsNCj4gV2FuZ3pob3UgKEIpIDx3
YW5nemhvdTFAaGlzaWxpY29uLmNvbT47IHpoYW5nZmVpLmdhb0BsaW5hcm8ub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMDAvMTFdIGh3L2FybS92aXJ0OiBBZGQgc3VwcG9ydCBmb3IgdXNl
ciBjcmVhdGFibGUNCj4gU01NVXYzIGRldmljZQ0KPiANCj4gPiAgICBUbyBhZGRyZXNzIHRoaXMs
IHBhdGNoICM2IGluIHRoZSBzZXJpZXMgaW50cm9kdWNlcyBhIG5ldyBoZWxwZXINCj4gPiAgICBm
dW5jdGlvbiBwY2lfc2V0dXBfaW9tbXVfcGVyX2J1cygpLCB3aGljaCBleHBsaWNpdGx5IHNldHMg
dGhlDQo+ID4gICAgaW9tbXVfcGVyX2J1cyBmaWVsZCBpbiB0aGUgUENJQnVzIHN0cnVjdHVyZS4g
VGhpcyBhbGxvd3MNCj4gPiAgICBwY2lfZGV2aWNlX2dldF9pb21tdV9idXNfZGV2Zm4oKSB0byBy
ZXRyaWV2ZSBJT01NVSBvcHMgYmFzZWQNCj4gPiAgICBvbiB0aGUgc3BlY2lmaWMgYnVzLg0KPiA+
DQo+ID4gICAgVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBhIHVzZXIt
Y3JlYXRhYmxlIFNNTVV2Mw0KPiBkZXZpY2UNCj4gPiAgICAoLWRldmljZSBhcm0tc21tdXYzKSBp
biBRRU1VLg0KPiANCj4gVGVzdGVkLWJ5OiBOYXRoYW4gQ2hlbiA8bmF0aGFuY0BudmlkaWEuY29t
Pg0KPiANCj4gSSByZS1yYW4gdGhlIHRlc3QgZnJvbSB2MyBbMF0gYW5kIGFtIGFibGUgdG8gY3Jl
YXRlIDE2IFNNTVV2MyBkZXZpY2VzIGluDQo+IGEgcWVtdSBWTSB3aXRoIGVtdWxhdGVkIGRldmlj
ZXMgcHJvcGVybHkgYXNzb2NpYXRlZCB3aXRoIHRoZSBndWVzdA0KPiBTTU1Vcw0KPiBpbiBndWVz
dCBzeXNmcyAtIHZlcmlmaWVkIHdpdGggc29tZSBndWVzdCBTTU1VcyBoYXZpbmcgdHdvIG9yIHRo
cmVlDQo+IGVtdWxhdGVkIE5JQ3MgYXNzaWduZWQgdG8gdGhlbSB3aGlsZSBvdGhlciBndWVzdCBT
TU1VcyBoYXZlIGEgbWluaW11bQ0KPiBvZg0KPiBvbmUgYXNzaWduZWQuDQo+IA0KPiBSZW1vdmlu
ZyBTTU1VdjMgZGV2aWNlcyBmcm9tIHRoZSBWTSBjb25maWcgZGVzY3JpYmVkIGFib3ZlLCBJIGRv
IG5vdA0KPiBvYnNlcnZlIHRoZSBwcm9ibGVtYXRpYyBiZWhhdmlvciB3aGVyZSBkZXZpY2VzIGJl
aGluZCBQWEJzIHdpdGhvdXQNCj4gU01NVXMNCj4gZXJyb25lb3VzbHkgdXNlIHRoZSBhZGRyZXNz
IHNwYWNlIGZyb20gcGNpZS4wJ3MgU01NVS4gSSByZW1vdmVkIFNNTVV2Mw0KPiBkZXZpY2VzIGZy
b20gUFhCcyB3aXRoIG9uZSwgdHdvLCBhbmQgdGhyZWUgZW11bGF0ZWQgTklDcyBhc3NpZ25lZCB0
bw0KPiB0aGVtLiBCZWxvdyBhcmUgdGhlIGd1ZXN0IHRvcG9sb2d5IGFuZCBxZW11IGNvbW1hbmQg
dXNlZCB3aGVyZQ0KPiBTTU1VdjMNCj4gZGV2aWNlcyBhcmUgZXhjbHVkZWQgZnJvbSB0aGUgb3Jp
Z2luYWwgdGVzdDoNCg0KQ29vbC4gQXBwcmVjaWF0ZSB0ZXN0aW5nIHRoYXQgc3BlY2lmaWNhbGx5
Lg0KDQpUaGFua3MsDQpTaGFtZWVyDQoNCg==
