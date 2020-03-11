Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1030791lfc;
        Wed, 11 Mar 2020 10:29:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt7kR4VCGIbO/8TczFfMd9tRxxVjeodQfzgqAOmIm9P0HzZtx2WgdmnXAZJ0gd+01/+JWvx
X-Received: by 2002:a37:a991:: with SMTP id s139mr3713336qke.116.1583947745289;
        Wed, 11 Mar 2020 10:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947745; cv=none;
        d=google.com; s=arc-20160816;
        b=kHTnQW7uDXpqiJbhQVozBSPo2RoPN5iEQbBUhbVG1sPXTUrKa8s5q/KDfGR2aGAKRb
         dBC7ZngKix6lKlnaMP+uCWnLss6lyXvuPeoSBLVVPAAW+BUENgy7bJU490FKRMcizW3J
         a4lF7b5jlvlLbKUJcRbQLMIvR6KAAtFKOKV1iO63Ta5QThbu1BaGoPmxKzjt4WTkb8b9
         CFnHcRuwO2OSdW54SKtof5hIi5rqZ2YK89L6TtGDa51/ZseRLlQJmfIBK5BbXNrKwN6V
         NH2RqKVMnbxVpqKafQXobWJvEcQ3QL2CV9ewPAiJwsDB0u+jhioZGJ14eanWFdQQK9TB
         Fo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=Q1MBRh8SrGZm7O4QmySK1HQstctS1pbn4BFFUlmjcoY=;
        b=iVwIAauUz8qLXZ6OVnPcwx7n5B3SrEOJtyjVDhSvL8vPhqsQx+/QeUVfEu+B4H1EMa
         vE4y98s4TPNofmP87kWlkIJQsejPQ1WXWGOtE43OmnM8mue3l72342JXUgHETyFbOzED
         BljY3Oojwk7rJbCPnGW6rPbLfpfNR7roONiAno1ZecsoAhdTNf+qIq+u6DIOidMRwGta
         9FCuB1d2ZFhzdODzgZei4KZuvU4JWtZrlPwkE9IVy+9fsqiBguRfJCU0ouL8xQ5KbdyM
         BtGtZ0AclIpKPDd1AmKneULUAmlxjehAm8+h0Waef3NWjjvKX1jwvn9RzRlizWBeVl9l
         VH6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si508474qkf.154.2020.03.11.10.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC5AG-0004yh-Mi
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC5A6-0004t5-Q9
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC5A5-0008DR-KE
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:28:54 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2082 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC5A5-0008Cn-Ea; Wed, 11 Mar 2020 13:28:53 -0400
Received: from LHREML713-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 76FB0670D6B61220C7A;
 Wed, 11 Mar 2020 17:28:51 +0000 (GMT)
Received: from lhreml702-chm.china.huawei.com (10.201.108.51) by
 LHREML713-CAH.china.huawei.com (10.201.108.36) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 17:28:51 +0000
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml702-chm.china.huawei.com (10.201.108.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Wed, 11 Mar 2020 17:28:50 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1713.004; Wed, 11 Mar 2020 17:28:50 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: RE: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Thread-Topic: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Thread-Index: AQHVzV43w2nN4JnxQEOUTwT8NpSKx6gLQ1MAgAAWtoCAACc+AIABYS3wgAAIyYCAAR1e4IAAFJiAgAAHflCAADtYAIABo1pQgARLAwCAAABbwIAABn8AgAN5SJCAADkTAIABctiAgAAIuACAAAKygIAXjGswgAAUwYCAEtIIAA==
Date: Wed, 11 Mar 2020 17:28:50 +0000
Message-ID: <1f38f5ffe9c140c4b02626ec48992cf4@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200204162320.67e5d353@redhat.com>
 <74eaaa45-0d20-9a21-fbf8-6d29deb248eb@redhat.com>
 <4ce41554-8b8e-dbb5-5fe9-43af09950f23@redhat.com>
 <8e0b2c762e914c64bebfab5fc7441661@huawei.com>
 <133f274e-e942-7008-93d2-8edb1bc4d7ae@redhat.com>
 <52fff289cca14874ad493fc25806fe3d@huawei.com>
 <f041380c-afcb-f8d8-89db-8f48c7b46767@redhat.com>
 <e97fa28c653044b8bab66aeca2374682@huawei.com>
 <0ff4d2c1-ebd3-1d2f-07e8-a4f13be07ceb@redhat.com>
 <6bf255ecb88446f1b08ee4ab21a85f02@huawei.com>
 <69848dd3-fac4-ec6b-78a8-a052124f4fc3@redhat.com>
 <49b54eea65cd49ae832cd6ec21eae64a@huawei.com>
 <b4ccf1d9-4514-6b63-5ef9-1d337f539267@redhat.com>
 <fad66252aa8f4b46816f21b5315b6358@huawei.com>
 <8f10dd72-9a19-b910-489c-eacc6a772046@redhat.com>
 <04adb50079bc45888f514721edb3cfa3@huawei.com>
 <69ab2339-f4c3-dbd6-1be7-5d6eef28d027@redhat.com>
 <b78f892f-c917-a3a8-4c6b-8d03af02782d@redhat.com>
 <8f27608fd02147bfb11bdfca38316f4c@huawei.com>
 <01aa6f4a-cfa7-6a35-8a7a-5189b66e2c9e@redhat.com>
In-Reply-To: <01aa6f4a-cfa7-6a35-8a7a-5189b66e2c9e@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.176.76.210
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 Juan Jose Quintela Carreira <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCndcV0bQU+f

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGF2aWQgSGlsZGVuYnJh
bmQgW21haWx0bzpkYXZpZEByZWRoYXQuY29tXQ0KPiBTZW50OiAyOCBGZWJydWFyeSAyMDIwIDE4
OjAwDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90aHVt
LnRob2RpQGh1YXdlaS5jb20+Ow0KPiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29t
Pg0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyB4aWFvZ3Vhbmdyb25nLmVyaWNAZ21h
aWwuY29tOw0KPiBtc3RAcmVkaGF0LmNvbTsgc2hhbm5vbi56aGFvc2xAZ21haWwuY29tOyBxZW11
LWRldmVsQG5vbmdudS5vcmc7DQo+IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+OyBMaW51
eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47DQo+IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgcWVt
dS1hcm1Abm9uZ251Lm9yZzsgbGVyc2VrQHJlZGhhdC5jb207DQo+IGRnaWxiZXJ0QHJlZGhhdC5j
b207IEp1YW4gSm9zZSBRdWludGVsYSBDYXJyZWlyYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzddIGV4ZWM6IEZpeCBmb3IgcWVtdV9yYW1fcmVzaXpl
KCkgY2FsbGJhY2sNCj4gDQoNClsuLi5dDQogDQo+IA0KPiBXZSBzaG91bGQgaW5zdGVhZCB0aGlu
ayBhYm91dA0KPiANCj4gMS4gTWlncmF0aW5nIHRoZSBhY3R1YWwgc2l6ZSBvZiB0aGUgMyBtZW1v
cnkgcmVnaW9ucyBzZXBhcmF0ZWx5IGFuZCBzZXR0aW5nDQo+IHRoZW0gdmlhDQo+IG1lbW9yeV9y
ZWdpb25fcmFtX3Jlc2l6ZSgpIHdoZW4gbG9hZGluZyB0aGUgdm1zdGF0ZS4gVGhpcyB3aWxsIHRy
aWdnZXINCj4gYW5vdGhlciBGVyBjZmcNCj4gZml4dXAgYW5kIHNob3VsZCBiZSBmaW5lICh3aXRo
IHRoZSBzYW1lIHFlbXVfcmFtX3Jlc2l6ZSgpIGFib3ZlKS4NCj4gDQo+IDIuIEludHJvZHVjZSBh
IG5ldyBSQU1fU0FWRV9GTEFHX01FTV9TSVpFXzIsIHRoYXQgZS5nLiwgc3RvcmVzIHRoZQ0KPiBu
dW1iZXIgb2YgcmFtYmxvY2tzLA0KPiBub3QgdGhlIHRvdGFsIGFtb3VudCBvZiBtZW1vcnkgb2Yg
dGhlIHJhbSBibG9ja3MuIEJ1dCBpdCdzIGhhY2t5LCBiZWNhdXNlIHdlDQo+IG1pZ3JhdGUNCj4g
c29tZXRoaW5nIGZvciBSQU0gYmxvY2tzLCB0aGF0IGlzIG5vdCBhIFJBTSBibG9jayBjb25jZXB0
IChzdWItYmxvY2sgc2l6ZXMpLg0KPiANCj4gSSB0aGluayB5b3Ugc2hvdWxkIGxvb2sgaW50byAx
LiBTaG91bGRuJ3QgYmUgdG9vIGhhcmQgSSB0aGluay4NCg0KSSBoYXZlIHNlbmQgb3V0IHYzIG9m
IHRoaXMgc2VyaWVzIChbUEFUQ0ggdjMgMDAvMTBdIEFSTSB2aXJ0OiBBZGQgTlZESU1NIHN1cHBv
cnQpDQp3aXRoIGFuIGF0dGVtcHQgdG8gbWlncmF0ZSB0aGUgbWVtb3J5IHJlZ2lvbnMgc2VwYXJh
dGVseS4gSXQgYWxzbyBpbmNsdWRlcw0KeW91ciBwYXRjaCBmb3IgcWVtdV9yYW1fcmVzaXplKCkg
Y2FsbGJhY2sgZml4LiBQbGVhc2UgdGFrZSBhIGxvb2sgYW5kIGxldCBtZSBrbm93Lg0KDQpUaGFu
a3MsDQpTaGFtZWVyDQoNCg0K
