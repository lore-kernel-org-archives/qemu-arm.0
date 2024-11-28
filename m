Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1351868njb;
        Thu, 28 Nov 2024 00:28:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWND2piz43QoZPVQpRHHdlzFxMb0RIw2YbUZ5SK9oy/03WGgAUQN2LCLOt3/mO/mx2o/Lkt9oa+5NTHbA==@linaro.org
X-Google-Smtp-Source: AGHT+IGmH6RjyVfydzbAXf0H2HRqY9W5QUMM/6+rg85/B+V1xp23hp5utRJzA26Ym4zPFNwLUlJu
X-Received: by 2002:a05:620a:2142:b0:7b6:7970:6526 with SMTP id af79cd13be357-7b67c43524amr600071185a.43.1732782514606;
        Thu, 28 Nov 2024 00:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732782514; cv=none;
        d=google.com; s=arc-20240605;
        b=dGNNTgW1KVeV+6YnFSrNPl3/e086YLc3Xv9TaJPNViRIp1V5jBaTuLIZFNglnS+YFR
         qICHbxMpbKA0GnsGnwZWb/FHYpn1jA8YadpdVS9LT62ameoVDWVQMxARdEu/xU/vXCYe
         aWAY53pKih5D7X4nvTCb6jzheirAyJQaMgHXOXFWokUmA2VgxC+YrSqMguGqBKc3M5Kh
         DJg0fpzTay0IntM1yz053VGTDXLqrZ5BCGZe1wGCBKnElu7g0pJNFMFLrXXPmzRJDOsT
         3kPgv7AAHCUD0GfWgNFPRNBTSjo3GaxjUeRo9DTOOVoWk+2yomrxetIM+acvkAd7oEea
         7oFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=CU3kmY/tq8q433BB3EvEZB2l1Lq29hPJOfx1Rncpz5A=;
        fh=rnT1pPzylwJxDByAfI9GMRb2QivtT8l1D/Bw078q8f0=;
        b=SCeS/w47/VG4vYLvilSDic2w/jpudQbI4kcqguKFBoUr4SaGa8ZokmR6r2oL9P+Pj+
         m5XMHyH1kmSuYg8JnJm8RCoaxlo90GVxNbzmUSASb0Dye2Q3LmINZ6BZ//huRF6O+iZz
         pdxZkfttU6CYlL8EWSa0NwE4hlpmCoIQSM+OmsDAvQsv4axZtUg7XAsijj9SoQCOPEck
         6AnIp68nTfRI/S5JvkknwjFF8PN0ZjiroaDnE0gTRwhyX4aXJIw85AAMrkoHlytDqRur
         ZLh9CDxabsyHAGEd3bjd1VRlb3YVfXfuPyiCt4aTuxNfdhEZ3cHcB1ziYs06LXZo7h0m
         8AfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849fae2dsi119036685a.696.2024.11.28.00.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2024 00:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGZsx-0007Lt-FC; Thu, 28 Nov 2024 03:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tGZsu-0007LO-HC; Thu, 28 Nov 2024 03:28:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tGZss-0000Of-6a; Thu, 28 Nov 2024 03:28:23 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XzTqm0ldKz6K5Xl;
 Thu, 28 Nov 2024 16:24:20 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id DF0DC1400F4;
 Thu, 28 Nov 2024 16:28:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 09:28:15 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 28 Nov 2024 09:28:15 +0100
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Zhangfei Gao
 <zhangfei.gao@linaro.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, Donald Dutile <ddutile@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: RE: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Thread-Topic: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Thread-Index: AQHbMeWSJ83HnnIr30KCqoK78hZMsLK1adCAgAAO0ACAFHTOgIABDrKggABaSYCAAAGHgIAAvdCAgABOkYCAABTxcA==
Date: Thu, 28 Nov 2024 08:28:15 +0000
Message-ID: <3fa6f093ff9a4749bcd25d0dfa60b1d7@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
 <d8fbaa677771425dac985438b4b1db59@huawei.com>
 <20241127160031.GA1253388@nvidia.com>
 <bd4c4665-148c-427b-8717-457c584fb233@redhat.com>
 <CABQgh9ErT6BmvbrUr_aNiLFws2Kx-=NzGJJCo+vV7AV_U6Pk9g@mail.gmail.com>
 <05470fe6-4336-455a-8b30-e05fb273aa25@redhat.com>
In-Reply-To: <05470fe6-4336-455a-8b30-e05fb273aa25@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.931, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: +2kR0gD82v5R

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjgsIDIwMjQg
ODowNyBBTQ0KPiBUbzogWmhhbmdmZWkgR2FvIDx6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZz4NCj4g
Q2M6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+OyBTaGFtZWVyYWxpIEtvbG90aHVt
IFRob2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+OyBEb25hbGQg
RHV0aWxlDQo+IDxkZHV0aWxlQHJlZGhhdC5jb20+OyBOaWNvbGluIENoZW4gPG5pY29saW5jQG52
aWRpYS5jb20+OyBxZW11LQ0KPiBhcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3Jn
OyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7DQo+IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWku
Y29tPjsgV2FuZ3pob3UgKEIpDQo+IDx3YW5nemhvdTFAaGlzaWxpY29uLmNvbT47IGppYW5na3Vu
a3VuIDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsNCj4gSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRo
YW4uY2FtZXJvbkBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAyLzVdIGh3
L2FybS9zbW11djM6IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yDQo+IFNNTVV2MyBOZXN0ZWQgZGV2
aWNlDQo+IA0KPiANCj4gDQo+IE9uIDExLzI4LzI0IDA0OjI1LCBaaGFuZ2ZlaSBHYW8gd3JvdGU6
DQo+ID4gSGksIEVyaWMNCj4gPg0KPiA+IE9uIFRodSwgMjggTm92IDIwMjQgYXQgMDA6MDYsIEVy
aWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4gd3JvdGU6DQo+ID4NCj4gPj4+IFllYWgs
IHRoZXJlIGlzIG5vIGxpdmUgbWlncmF0aW9uIHN1cHBvcnQgeWV0IGluIHRoZSBTTU1VIHFtZXUg
ZHJpdmVyLA0KPiA+Pj4gQUZBSUs/DQo+ID4+IHRoZSBub24gYWNjZWxlcmF0ZWQgU01NVSBRRU1V
IGRldmljZSBkb2VzIHN1cHBvcnQgbWlncmF0aW9uLg0KPiA+IENvdWxkIHlvdSBjbGFyaWZ5IG1v
cmUgYWJvdXQgdGhpcz8NCj4gPiBUaGUgbWlncmF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgaWYgdXNp
bmcgdmlvbW11IChTTU1VIFFFTVUgZGV2aWNlKSwNCj4gaXNuJ3QgaXQ/DQo+IE5vIHRoaXMgaXMg
bm90IGNvcnJlY3QuIEN1cnJlbnQgUUVNVSBTTU1VIGRldmljZSAqZG9lcyogc3VwcG9ydA0KPiBt
aWdyYXRpb24gKHNlZSBWTVN0YXRlRGVzY3JpcHRpb24pIGFzIHdlbGwgYXMgcWVtdSB2aXJ0aW8t
aW9tbXUgZGV2aWNlLg0KPiBzbyBmb3IgaW5zdGFuY2UgaWYgeW91IHJ1biBhIGd1ZXN0IHdpdGgg
c21tdXYzIGFuZCBwcm90ZWN0ZWQgdmlydGlvLXBjaQ0KPiBkZXZpY2VzIHRoaXMgaXMgc3VwcG9z
ZWQgdG8gYmUgbWlncmF0YWJsZS4gSWYgaXQgZG9lcyBub3Qgd29yayB0aGlzIGlzDQo+IGJ1ZyBh
bmQgdGhpcyBzaG91bGQgYmUgZml4ZWQgOy0pDQoNCkkgdGhpbmsgaWYgSSBhbSByaWdodCBaaGFu
Z2ZlaSB3YXMgdGVzdGluZyB3aXRoIHZmaW8tcGNpIGRldmljZSBhc3NpZ25lZCBvbiBoaXMgdlNW
QQ0KYnJhbmNoLiBCdXQgbWlncmF0aW9uIHdpdGggdmZpbyBkZXZpY2UgaXMgY3VycmVudGx5IGV4
cGxpY2l0bHkgYmxvY2tlZCBpZiB2SU9NTVUgaXMNCnByZXNlbnQuIA0KDQpJIHRoaW5rIEpvYW8g
aXMgd29ya2luZyBvbiBpdCBoZXJlWzFdLg0KDQpCdXQgd2UgbWF5IHJlcXVpcmUgYWRkaXRpb25h
bCBzdXBwb3J0IHdoZW4gd2UgaGF2ZSB2U1ZBIHRvIGhhbmRsZSBhbnkNCmluLWZsaWdodCBwYWdl
IGZhdWx0IGhhbmRsaW5nIGdyYWNlZnVsbHkuDQoNClRoYW5rcywNClNoYW1lZXINCjEuIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDYyMjIxNDg0NS4zOTgwLTEtam9hby5tLm1hcnRp
bnNAb3JhY2xlLmNvbS8NCg0KDQoNCg==
