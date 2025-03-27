Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3866161njc;
        Thu, 27 Mar 2025 02:27:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUP6MQnupnaOSgELX4bjMp5MPdrLg6Mg5DykFiNuOjc5gp0N27P49b2WNw6AEosjv7TFHSoT81/CfAGSw==@linaro.org
X-Google-Smtp-Source: AGHT+IEDX60/UmOcZrxfTakXkksDzACnRlbG8BCJ/5mxf07/jMJqadXqY/RtSXei+xez5AIlzP+E
X-Received: by 2002:a05:6214:628:b0:6e6:5ec3:8688 with SMTP id 6a1803df08f44-6ed23977dbfmr35480476d6.45.1743067637162;
        Thu, 27 Mar 2025 02:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743067637; cv=none;
        d=google.com; s=arc-20240605;
        b=Q2+n+RkI4Z0a4BYi1kMAtYaP62N2a0KxqrF0cdxi+ALBxfqBezsnNQS83RDqlLskXj
         mSCtqcrZh6D5+homhffpvv0NpEgk4f6By6LtQQlMgxiJ2k67mAFiMa6IbM+f/1Y9IvPi
         Eeprid3f/H4L2Y3p33NrrsjLPNPdALkzh71vdG3Gq+skzZnBeDkV44mqTyUmgjcM4RNz
         w92ThIzMR0BeTHLASm5jww+bBu61uRpK1SEyYuYrDgpE/W+Pwol5rDTcnS+mYCxjam5q
         6aQHQ1VuS/N38q+leoqRqo02qWrGHlVUKXxFx0WVgqIReY4hVEBXc62y3NctgLzU+RgQ
         VuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=orPt1P4XUhFxpjG16hNfK4Hfv7CWrtAjxqw/kCc2lco=;
        fh=/qL1VtEaSszD21vlBRg+K82xeheMymc1It3EtD/hFIU=;
        b=AvhvzTU8YqXylICAlJ0o/tBDgqXZygIq7pfk9vULlX0KEcIRPIUe07rKqgw/hBHI6C
         rPRaNHnSDRJvkoPE7D/vFee4QnimuKy5ig0rVUWjS2UJwKT+93zHc4qvubbh4Su6aGPx
         16Dmm0Css6x8+oMBUWWMjrWnT8cexe/Bsp61ZxFqpsj2Opliw8RK/K5AECbmmDO7l84S
         mk8p8Zy7HlL4cryaB1Q6Vo7bJu+qEJhz+qSdYnyHyRV3ZzeYKW/XXeTzDStrXDfBAix+
         pycAFz2Jum9O+fcYHa91b+bmKrspyYNyBUWNZRGkIV2y/yz1Sw9v7BgUtfalwmSVfzBn
         1bug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f03eea4si129864256d6.422.2025.03.27.02.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 02:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txjVq-0002Jh-By; Thu, 27 Mar 2025 05:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1txjVj-0002IV-4X; Thu, 27 Mar 2025 05:26:54 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1txjVg-0007O9-P8; Thu, 27 Mar 2025 05:26:50 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZNdW03Zffz6JBVj;
 Thu, 27 Mar 2025 17:23:24 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id 7ADD6140732;
 Thu, 27 Mar 2025 17:26:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Mar 2025 10:26:41 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 27 Mar 2025 10:26:41 +0100
To: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 19/20] hw/arm/virt-acpi-build: Update IORT with
 multiple smmuv3-accel nodes
Thread-Topic: [RFC PATCH v2 19/20] hw/arm/virt-acpi-build: Update IORT with
 multiple smmuv3-accel nodes
Thread-Index: AQHbkpXaZGm+luHjsU602tobgzU5RbOFv+eAgAAKHYCAAQQf4A==
Date: Thu, 27 Mar 2025 09:26:41 +0000
Message-ID: <32f8c82aff9a4cdf9057eb7343d9b351@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-20-shameerali.kolothum.thodi@huawei.com>
 <1b03e73c-f50b-4be6-b5a5-58f3e80f9161@redhat.com>
 <Z+RMg92cjxZkNyWJ@nvidia.com>
In-Reply-To: <Z+RMg92cjxZkNyWJ@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.173.48]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: GX/0Nt435Fxp

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmljb2xpbiBDaGVuIDxu
aWNvbGluY0BudmlkaWEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDI2LCAyMDI1IDY6
NTEgUE0NCj4gVG86IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4gQ2M6IFNo
YW1lZXJhbGkgS29sb3RodW0gVGhvZGkNCj4gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVh
d2VpLmNvbT47IHFlbXUtYXJtQG5vbmdudS5vcmc7DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBqZ2dAbnZpZGlhLmNvbTsNCj4gZGR1dGlsZUByZWRo
YXQuY29tOyBiZXJyYW5nZUByZWRoYXQuY29tOyBuYXRoYW5jQG52aWRpYS5jb207DQo+IG1vY2hz
QG52aWRpYS5jb207IHNtb3N0YWZhQGdvb2dsZS5jb207IExpbnV4YXJtDQo+IDxsaW51eGFybUBo
dWF3ZWkuY29tPjsgV2FuZ3pob3UgKEIpIDx3YW5nemhvdTFAaGlzaWxpY29uLmNvbT47DQo+IGpp
YW5na3Vua3VuIDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsgSm9uYXRoYW4gQ2FtZXJvbg0KPiA8
am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgemhhbmdmZWkuZ2FvQGxpbmFyby5vcmcNCj4g
U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggdjIgMTkvMjBdIGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6
IFVwZGF0ZSBJT1JUIHdpdGgNCj4gbXVsdGlwbGUgc21tdXYzLWFjY2VsIG5vZGVzDQo+IA0KDQo+
ID4gPiAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgc21tdV9pZG1hcHMtPmxlbjsgaSsrKSB7DQo+
ID4gPiArICAgICAgICAgICAgaWYgKHZtcy0+aW9tbXUgPT0gVklSVF9JT01NVV9TTU1VVjNfQUND
RUwpIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgb2Zmc2V0ID0gc21tdV9vZmZzZXRbaV07DQo+
ID4gPiArICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgb2Zmc2V0
ID0gc21tdV9vZmZzZXRbMF07DQo+IA0KPiA+IG1heWJlIHdlIGNhbiBhbHNvIHVzZSBzbW11X29m
ZnNldCBhcnJheSBmb3Igbm9uIGFjY2VsIG1vZGUgYW5kIGdldCByaWQNCj4gPiBvZiB0aGlzLg0K
PiANCj4gSSByZWNhbGwgdGhhdCBteSBwcmV2aW91cyB2ZXJzaW9uIGRvZXMgY29tYmluZSB0d28g
bW9kZXMsIGkuZS4NCj4gbm9uLWFjY2VsIG1vZGUgb25seSB1c2VzIHNtbXVfb2Zmc2V0WzBdLiBQ
ZXJoYXBzIFNoYW1lZXIgZm91bmQgc29tZQ0KPiBtaXNtYXRjaCBiZXR3ZWVuIHNtbXVfaWRtYXBz
LT5sZW4gYW5kIG51bV9zbW11cz8NCg0KUGVyaGFwcyBJIGRpZCDwn5iKLiBJIHRoaW5rIGl0IHdh
cyBmb3IgYSBjYXNlIHdoZXJlIHRoZXJlIHdlcmUgbXVsdGlwbGUgaG9zdCBicmlkZ2VzIA0KYXNz
b2NpYXRlZCB3aXRoIGlvbW11PXNtbXV2My4gSSB3aWxsIHJldmlzaXQgdG8gc2VlIHRoaXMgY2Fu
IGJlIHNpbXBsaWZpZWQuDQoNCkJldHdlZW4sIFRoYW5rcyB0byBib3RoIG9mIHlvdShhbmQgb3Ro
ZXJzIG9mIGNvdXJzZSEpIGZvciBnb2luZyB0aHJvdWdoIHRoZSBzZXJpZXMuDQpJIHdpbGwgY29u
c29saWRhdGUgdGhlIGNvbW1lbnRzIGFuZCByZXdvcmsgdGhlIHNlcmllcyBzb29uLiANCg0KVGhh
bmtzLA0KU2hhbWVlcg0KDQo=
