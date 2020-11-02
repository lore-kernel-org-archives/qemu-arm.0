Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3933692lfa;
        Mon, 2 Nov 2020 05:35:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycdfGml+LXiRTP1zaeOB3VnoT5JjuP5waX3xxukFx2yvPf0/ntUrOEwKIoKYNgK8awAhf5
X-Received: by 2002:a05:620a:801:: with SMTP id s1mr6274651qks.206.1604324150688;
        Mon, 02 Nov 2020 05:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604324150; cv=none;
        d=google.com; s=arc-20160816;
        b=b7TxH/w0vSNYC9LeLC4W3v7j2B7SoPeQzSZEkOaGpUbCdc58iON5Sc+2W5bh2Gq3dK
         0KUn69tNISQGVUBpkNuyGpyPv8aqzdnJoKmUTcuYdL0VvyBYVdgtgeFHca2EgRh8xmFn
         cz4paVlTvUeHLhHormmINdmjiZ8Ya5UImXM/DsCe31yX9JhYFLYVyjUoEQjCvOwW/FhN
         +sTVKZgC2A1sT7DE4EJrqHxyLxcMkyte0Bd4Ys+Ci3lRoNeHV8maXM2nQZwXvFnc5elT
         97LpKHXudPc8iSWZCOLPXnhVDPLD5VV8MTWTPWY7fNBUkRQhwcQbmEJlMyagZdZlHbFG
         l3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=NyGBV2NvMQ8L/f/MczpTJRXGrlszl+GJ2YxFEaF5GKc=;
        b=QsSmiAwCs93HhvSpm30Nk4ne3woX2IngHUpAchUJNDwkUF8YGK134ExdL5ydgo4Ytq
         ANzcogBMhA86nRq7xGivFSlKUYGwYC+kMLWHgwjM8kJwRhKrxWjY4yULXrG2HYmfd/JE
         R3lL2ECUjnhGScT3m9kP34BRBXxdEsAShjqe3zz4OUsgNOArFM5OachfK0hXQBAKIAGq
         uC/cxgat7SXvTFKjR6Fw3DYd0TlsDg2QOEGZ2owetX7HZgyusUzuHRFrz4X0xWD6exBt
         wawZIj3DmhEVTI9ptMjp5uioyqm04jWHETr7+GLyIjLb6EmH+QizDhhAgD8dOtqvBUdQ
         XbdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k54si2437994qtb.405.2020.11.02.05.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 05:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZZzy-0000sT-5E
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 08:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi.denis.courmont@huawei.com>)
 id 1kZZza-0000rN-3Y; Mon, 02 Nov 2020 08:35:26 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2125 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi.denis.courmont@huawei.com>)
 id 1kZZzW-0004XY-LY; Mon, 02 Nov 2020 08:35:25 -0500
Received: from lhreml723-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 824E2CEB982C5B6183D1;
 Mon,  2 Nov 2020 13:35:04 +0000 (GMT)
Received: from lhreml727-chm.china.huawei.com (10.201.108.78) by
 lhreml723-chm.china.huawei.com (10.201.108.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 2 Nov 2020 13:35:04 +0000
Received: from lhreml727-chm.china.huawei.com ([10.201.108.78]) by
 lhreml727-chm.china.huawei.com ([10.201.108.78]) with mapi id 15.01.1913.007; 
 Mon, 2 Nov 2020 13:35:04 +0000
From: Remi Denis Courmont <remi.denis.courmont@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
Thread-Topic: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
Thread-Index: AQHWsQhB3r8EiOh900GcB06pOPhjvKm0tEgAgAAi8KA=
Date: Mon, 2 Nov 2020 13:35:04 +0000
Message-ID: <2ea39469edfc4968b706826aa63a44c8@huawei.com>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-1-remi.denis.courmont@huawei.com>
 <CAFEAcA9xhfhGToCXk9H+M5=HQKC91o-ED6eWTy32nvjwpFeJOg@mail.gmail.com>
 <CAFEAcA8xrk1Yd3GbkYRMjBwGjZ-f7bSp4gHGGk=tkhKNk5CqRQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8xrk1Yd3GbkYRMjBwGjZ-f7bSp4gHGGk=tkhKNk5CqRQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.66.212]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=remi.denis.courmont@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 08:35:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G9A6yPHGlkrC

SGksDQoNCj4gSSByZXBsaWVkIHRvIHRoaXMgYmVmb3JlIHRoZSBjb3ZlciBsZXR0ZXIgZXhwbGFp
bmluZyB3aGF0IHRoZSBzZXJpZXMNCj4gaXMgZG9pbmcgYXJyaXZlZCBpbiBteSBpbmJveCwgc28g
dGhlIHNlY29uZCBwYXJ0IG9mIG15IHN1Z2dlc3Rpb24NCj4gd291bGQgYmUgYSBiaXQgcG9pbnRs
ZXNzLiBUaGUgZmlyc3QgcGFydCAobWVudGlvbmluZyB0aGUgbmFtZSBvZg0KPiB0aGUgcHNldWRv
Y29kZSBmdW5jdGlvbikgc3RpbGwgc2VlbXMgd29ydGggZG9pbmcuDQoNClllYWggd2VsbCwgc29t
ZSBzcGFtIGZpbHRlciBzZWVtcyB0byBoZWxwZWQgaXRzZWxmIHRvIHRoZSBvcmlnaW5hbCBjb3Zl
ciBsZXR0ZXIsIGhhZCB0byByZXNlbmQgaXQsIHNvIEkgZmlndXJlZC4NCg0KQW5kIHRoZW4gaXQg
c2VlbXMgSSBtYWRlIGEgYm9vYm9vIGFuZCBhY2NpZGVudGFsbHkgZHJvcHBlZCB0aGUgZmlyc3Qg
cGF0Y2ggaW4gdGhlIHNlcmllcywgaGFuZGxpbmcgSENSLntGLEl9TU8gYml0cy4NCg0KDQo=
