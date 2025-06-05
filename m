Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp165235njc;
        Thu, 5 Jun 2025 04:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4wqNkqo9fr8wUJmyK6reIDUxgofaUNK/NckKqbRhZma44Fc4ddwwX/c7wRBK7pnbfQ7McYDlMy8zUIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEm+X1idl3c2VjayqLEt/Gt44JpdR93BapG/EIMx/WL+v2Z3s8cUpqHhFjehng2g6bv5WBN
X-Received: by 2002:a05:620a:400e:b0:7d0:998a:2e5a with SMTP id af79cd13be357-7d219841f3cmr910820685a.22.1749122128020;
        Thu, 05 Jun 2025 04:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749122128; cv=none;
        d=google.com; s=arc-20240605;
        b=P4MUv7WFZoCNuUy8MIONdiqPl8NON4nLkDVCkwA8jhXAGZGPx7NPSBdbmTkeDbjG6C
         gFiY8b/ml+Gw84tGhcKbcf/XuhHD/9jy14xwvS0N4fG9X72T5pMprkUJUvSyHFQwrX3O
         YxEj+wQ5mM/SPZ0IrEh6aWa1TqDw49eHH+Lv8BUGUFQK6zu3MPHbjcpUbfWUWQQptb+Z
         G+3z23DMDJhQohP0jRpbSDHNFb72Dq8FD3w71fhLj09QQWI2+PxO1oMl1IaAM4tEUo0F
         ZGHJDWnzUEt80t53RBOMPY6YmvjPuLh60NkXkinaH0m4I32K/93SDOulpZnmA5ddiMzw
         BY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=W2eYLi9ox5swhb0p7lAZX8ntf6Yy3dHMD1uty9CgY7c=;
        fh=O6X2BWEQtTCF1UGIaMMuTYtr58ukGNU/CQyZ48iW9Cs=;
        b=SFnomuxCCfYs2d9UEKjlIVM6MGwe2OhDLmTWjYoWSEW7zMXcR2/xxCWvbskUwm+ncX
         66eUvoRE69nyXivqD5gcNEtp9HSyy2QLps/rZzPv4Ezx4klvRF9chEgpHVvnmLGDEcnO
         WwVDBn4dHiIOSZpN6/R4qciZC/grIdbuRdr4tglgecvTAh4csrgYemavA9InSg91YpJZ
         AKENUmV+wTxiD7E85A7U87WZyVEBB6lfCmHF+xKQkAL7hK5L+rRh3N2I6obpzN1BhLU5
         vZHL8ld2a6jUAa+GbKnxxB2H8wsM3wDKnYiVAu7PSbi4h2X6gBwn91xNH4eyJ4I9MRey
         B3nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a319c37si1657336485a.633.2025.06.05.04.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 04:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uN8Z0-0008Ei-05; Thu, 05 Jun 2025 07:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uN8Yy-0008DL-CK; Thu, 05 Jun 2025 07:15:12 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uN8Yw-0000Et-3l; Thu, 05 Jun 2025 07:15:12 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bChdl2q1Xz6K9ZG;
 Thu,  5 Jun 2025 19:13:31 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 04C231402CB;
 Thu,  5 Jun 2025 19:15:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Jun 2025 13:15:06 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 5 Jun 2025 13:15:06 +0200
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Thread-Topic: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Thread-Index: AQHb09UMySB7lOszwECrIiqSkZXavbP0Ng6AgAAChwCAADWzEA==
Date: Thu, 5 Jun 2025 11:15:06 +0000
Message-ID: <463538bc608e4d04940e2122ca5e393f@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
 <15b1fd04-2dd0-4191-8958-9d8db8dff7c9@redhat.com>
 <cb2a688d-fbf2-497e-8baf-f28352766105@redhat.com>
In-Reply-To: <cb2a688d-fbf2-497e-8baf-f28352766105@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bqZ/9DKWvHmg

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSA1LCAyMDI1IDExOjAy
IEFNDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpQGh1YXdlaS5jb20+OyBxZW11LWFybUBub25nbnUub3JnOw0KPiBxZW11LWRldmVs
QG5vbmdudS5vcmcNCj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgamdnQG52aWRpYS5j
b207IG5pY29saW5jQG52aWRpYS5jb207DQo+IGRkdXRpbGVAcmVkaGF0LmNvbTsgYmVycmFuZ2VA
cmVkaGF0LmNvbTsgbmF0aGFuY0BudmlkaWEuY29tOw0KPiBtb2Noc0BudmlkaWEuY29tOyBzbW9z
dGFmYUBnb29nbGUuY29tOyBMaW51eGFybQ0KPiA8bGludXhhcm1AaHVhd2VpLmNvbT47IFdhbmd6
aG91IChCKSA8d2FuZ3pob3UxQGhpc2lsaWNvbi5jb20+Ow0KPiBqaWFuZ2t1bmt1biA8amlhbmdr
dW5rdW5AaHVhd2VpLmNvbT47IEpvbmF0aGFuIENhbWVyb24NCj4gPGpvbmF0aGFuLmNhbWVyb25A
aHVhd2VpLmNvbT47IHpoYW5nZmVpLmdhb0BsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgMS82XSBody9hcm0vc21tdXYzOiBDaGVjayBTTU1VdjMgaGFzIFBDSWUgUm9vdA0KPiBD
b21wbGV4IGFzc29jaWF0aW9uDQo+IA0KPiA+IHNob3VsZG4ndCB5b3UgY2hlY2sgYXMgd2VsbCB0
aGF0ICFwY2lfYnVzX2J5cGFzc19pb21tdShidXMpPw0KPiANCj4gSSBzZWUgeW91IGRvIHRoZSBj
aGVjayBpbiA2LzYgYW5kIEkgdGhpbmsgdGhpcyBpcyB0aGUgY29ycmVjdCB3YXkgYmVjYXVzZSBp
bg0KPiBjYXNlIG9mIGxlZ2FjeSBTTU1VIGl0IGlzIGFsbG93ZWQgdG8gaGF2ZSBwY2lfYnVzX2J5
cGFzc19pb21tdSBzZXQgb24NCj4gdGhlIHJvb3QgYnVzIHRvIGxldCB0aGUgU01NVSBhcHBseSBv
bmx5IG9uIHB4YiBidXNlcyBvbmx5LiBTbyBwbGVhc2UNCj4gaWdub3JlIHRoaXMgY29tbWVudC4N
Cg0KWWVzLiBJdCBpcyB0byBrZWVwIHRoZSBleGlzdGluZyBiZWhhdmlvciBmb3IgbGVnYWN5IFNN
TVV2My4NCg0KVGhhbmtzLA0KU2hhbWVlcg0K
