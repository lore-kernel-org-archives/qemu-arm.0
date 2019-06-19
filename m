Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp397711wrg;
        Wed, 19 Jun 2019 01:19:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqLCdvEGtXDmGlaKohdNCy6fl71EPqOPZ0TlYfy8F1ZNbCfMPGjhmoxl4L7oWTkwrsPi36
X-Received: by 2002:a17:906:b6c2:: with SMTP id ec2mr35719527ejb.200.1560932384433;
        Wed, 19 Jun 2019 01:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560932384; cv=none;
        d=google.com; s=arc-20160816;
        b=l4lptqiAANx2uqLYSbIo1mLUfQLy7n3y+rsmNHLZqrBfIa5OBTPMgSub/T6eTJYlNh
         mM2G57aNlMxq5D6E6CnrmLjh0VvY6H8PzLDQnk6zCjeTd+K27GS8rfD4fI1a8mw5h8cp
         KcNXnlJuLYL7FWRLO8rI1ya1FbYzSAffdRjIHqeem4hV9fypLbpHms1yKUZT+wbS+i/X
         JO3S/eftedJXTu/Wz77kwaxKomuwS+qqj1Wo+KDCd2QMqrYVQKkBqQ3RyjJZz9+MPURS
         04em0zE81EPX9gBxLCdoKr4/xg8vH47HEqvdEszo5FajlRQ323qwa/x5ozrOMC4VZ6Y7
         h/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=SJoRZL4N406wNXfUA3LcoojM42sDlPwY1kainGHrlNI=;
        b=PU6uUue3sV5B5N5oRWiQV/Uj+TYAuP9ISnDFw7MGOcvvQnaQ3hgCyPS8bN1WvSFSrf
         Eh+jl2Qxbyy025UEWePOT0sYCD4zSJrp+/DQ7ES59yA19w1YDRNCvy2gaAQwU4bnxa0P
         XpiQQVdVM8cw1MXjJ9eS7+w7i06Qcyt4bKZViDOxRIkDcNzgvu//crv/BQ/50Na2N3n3
         qxcK1csiryc5mBk8P97g2D9Lj84x9aiivC+S4xngG/cMZxSEjdGl5Li55V9372u7L6qa
         sI6lDCgrMR8H7yKpqsch6zLSb2ytxWp+C10CsARYHucmAMs3SRYq5T02qC3MfTOpN3Pn
         NSQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x57si13104684edx.428.2019.06.19.01.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 01:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdVol-0007vI-GR
	for alex.bennee@linaro.org; Wed, 19 Jun 2019 04:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hdVnh-0007tB-1s
 for qemu-arm@nongnu.org; Wed, 19 Jun 2019 04:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hdVnd-0007eX-3G
 for qemu-arm@nongnu.org; Wed, 19 Jun 2019 04:18:35 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45415 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hdVna-00075Y-9d; Wed, 19 Jun 2019 04:18:30 -0400
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 7611219928A051FA66D4;
 Wed, 19 Jun 2019 09:18:07 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.112]) by
 lhreml708-cah.china.huawei.com ([10.201.108.49]) with mapi id 14.03.0415.000; 
 Wed, 19 Jun 2019 09:18:01 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Thread-Topic: [PATCH v5 0/8] ARM virt: ACPI memory hotplug support
Thread-Index: AQHVELrXjlt3iCVXlkWsFxU/nLHFv6ahdyaAgAABhYCAAA0HgIABR4Eg
Date: Wed, 19 Jun 2019 08:18:00 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F2AA96B@lhreml524-mbs.china.huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <653a6b3c-ac1a-f197-1240-a28f59890fa8@redhat.com>
 <CAFEAcA9g=9u1Cj+1gqWqXWfg1phmZPw4=y7Ks_EzbYOEBW-WOA@mail.gmail.com>
 <2c08ff88-7e94-6f24-33f1-173957cee2ba@redhat.com>
In-Reply-To: <2c08ff88-7e94-6f24-33f1-173957cee2ba@redhat.com>
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
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v5 0/8] ARM virt: ACPI memory hotplug support
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wo2QuxCiScSx

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAxOCBKdW5lIDIwMTkg
MTQ6NDUNCj4gVG86IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4g
Q2M6IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlA
aHVhd2VpLmNvbT47DQo+IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsg
cWVtdS1hcm0NCj4gPHFlbXUtYXJtQG5vbmdudS5vcmc+OyBJZ29yIE1hbW1lZG92IDxpbWFtbWVk
b0ByZWRoYXQuY29tPjsNCj4gU2hhbm5vbiBaaGFvIDxzaGFubm9uLnpoYW9zbEBnbWFpbC5jb20+
OyBTYW11ZWwgT3J0aXoNCj4gPHNhbWVvQGxpbnV4LmludGVsLmNvbT47IHNlYmFzdGllbi5ib2V1
ZkBpbnRlbC5jb207IHh1d2VpIChPKQ0KPiA8eHV3ZWk1QGh1YXdlaS5jb20+OyBMYXN6bG8gRXJz
ZWsgPGxlcnNla0ByZWRoYXQuY29tPjsgQXJkIEJpZXNoZXV2ZWwNCj4gPGFyZC5iaWVzaGV1dmVs
QGxpbmFyby5vcmc+OyBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NSAwLzhdIEFSTSB2aXJ0OiBBQ1BJIG1lbW9yeSBob3RwbHVnIHN1cHBvcnQN
Cj4gDQo+IEhpIFBldGVyLA0KPiBPbiA2LzE4LzE5IDI6NTcgUE0sIFBldGVyIE1heWRlbGwgd3Jv
dGU6DQo+ID4gSSdtIG5vdCBzdXJlIHdlIHNob3VsZCBjYXJyeSBhY3Jvc3MgVGVzdGVkLWJ5IHRh
Z3MgbGlrZSB0aGF0OiBhbnkNCj4gPiByZXNwaW4gbWlnaHQgYWNjaWRlbnRhbGx5IGludHJvZHVj
ZSBidWdzIHRoYXQgbWFrZSBpdCBzdG9wIHdvcmtpbmcuLi4NCj4gDQo+IE9LLiBObyBwcm9ibGVt
LiBJIHdpbGwgdGVzdCB0aGUgbmV4dCB2ZXJzaW9uIHRoZW4uDQoNClRoYW5rcyBmb3IgdGVzdGlu
ZyBhbmQgdmVyaWZ5aW5nLiBJIHdpbGwgcmVzcGluIHRoaXMgc29vbi4NCg0KQ2hlZXJzLA0KU2hh
bWVlcg0KIA0K
