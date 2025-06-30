Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2294875dye;
        Mon, 30 Jun 2025 00:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRoXsZ9efS55UQrhXgI6nAThV/x+Fbqz5tymYkdd/GQw3ij5xxGjiJU/aDj4leg9mTfN9OhSUiOtjxeA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFeTYzen4z93QW1ijJOuql+mC99MGd9++6gccp+oU6WOWfqeHX19gzaylHiJySwVKjzzOi
X-Received: by 2002:a05:620a:6010:b0:7d4:430b:f467 with SMTP id af79cd13be357-7d443950d3emr1671944685a.35.1751267562248;
        Mon, 30 Jun 2025 00:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751267562; cv=none;
        d=google.com; s=arc-20240605;
        b=T4iOYk8fBqph4f7Y9c7JngiqpDv3W5/DSD2qQLWAag9tkvCscRFhZ8EuDokJjTgfxx
         Z2yNitLKheHQ+cYkx+855QV8ftw7nA4NrvEcuooLCAkXvLwCw70ryPTyOw/rsIUbCZgz
         mzaiVX9pZO1nsqdrshieYlXl8EgksRIjtPXZ6h3hmy9zYuOCAxvWfO8xkstkFfaNz6Lv
         6wYZ3KpdGaDYoitf90FXVhMjCZNemcabCgRt/jcyuwxxRMsGVCIKTCo6HRYm07P7fvvE
         oZLm5rblXM8e4HdgbM2bzjUHI8eQh46UhBPqbyy29hZbJAYafYbbAkXfCvEPo8UpfPfx
         q6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=Ok+Jryf/s2XPb9IQBJ+Hfl88wWE7cEkFOgy0sy/xNUI=;
        fh=xDxPiJhlsCJw89ieQcVVSGZg3kwhOXQ4nzv6h2Jqe2U=;
        b=Y4C6HI+I0Px7QN2a0ie+VOy66/YvLl6yH7+OXNlHqPW7hl3NLNbiwaP6v4RRJUI6z8
         abDXZYcmhinKrI01/IhI9yvZKmh0LwprDRtWV0YsAQC9BWtlNKKcU3xcOeaJXNzxsUB8
         DFwQ5ffY3A1QlQKiQ4GKDqoAqCjIvytcnVsHVDSMqZTNOEaImtrEJvu+vBDKO/BE3K4L
         u8H9FItC/Ih62+fJDcf8r95mgK18K24nqDBZAgw9vzNgv609//lACMNftEF4zxSu9yPy
         r9Ty50A2UDyDofsfnSt+hELiQDg4fcByUEeDy334CqlAaCRzA77Ej/3YU1ovus4hgQN+
         Br4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77354e46si100171736d6.142.2025.06.30.00.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 00:12:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uW8gq-0006jP-Tu; Mon, 30 Jun 2025 03:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uW8gg-0006Ur-TG; Mon, 30 Jun 2025 03:12:26 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uW8gc-0004V9-LR; Mon, 30 Jun 2025 03:12:22 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bVy2Y3MZgz6L55K;
 Mon, 30 Jun 2025 15:09:25 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 4BD1E1402EC;
 Mon, 30 Jun 2025 15:12:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Jun 2025 09:12:12 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 30 Jun 2025 09:12:12 +0200
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v5 00/11] hw/arm/virt: Add support for user creatable
 SMMUv3 device
Thread-Topic: [PATCH v5 00/11] hw/arm/virt: Add support for user creatable
 SMMUv3 device
Thread-Index: AQHb5C8S0d/fYPGiP0CF8356U8e6vbQW1lEAgAR9sXA=
Date: Mon, 30 Jun 2025 07:12:12 +0000
Message-ID: <942853c1cd54409480fa4136e45e7db8@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <7a878419-d709-4da7-8b06-2c36a2b05287@redhat.com>
In-Reply-To: <7a878419-d709-4da7-8b06-2c36a2b05287@redhat.com>
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: nejYAvd0r/sv

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bmUgMjcsIDIwMjUgMTozNyBQ
TQ0KPiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaQ0KPiA8c2hhbWVlcmFsaS5rb2xvdGh1
bS50aG9kaUBodWF3ZWkuY29tPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsNCj4gcWVtdS1kZXZlbEBu
b25nbnUub3JnDQo+IENjOiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IGpnZ0BudmlkaWEuY29t
OyBuaWNvbGluY0BudmlkaWEuY29tOw0KPiBkZHV0aWxlQHJlZGhhdC5jb207IGJlcnJhbmdlQHJl
ZGhhdC5jb207IGltYW1tZWRvQHJlZGhhdC5jb207DQo+IG5hdGhhbmNAbnZpZGlhLmNvbTsgbW9j
aHNAbnZpZGlhLmNvbTsgc21vc3RhZmFAZ29vZ2xlLmNvbTsNCj4gZ3VzdGF2by5yb21lcm9AbGlu
YXJvLm9yZzsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBXYW5nemhvdQ0KPiAoQikg
PHdhbmd6aG91MUBoaXNpbGljb24uY29tPjsgamlhbmdrdW5rdW4gPGppYW5na3Vua3VuQGh1YXdl
aS5jb20+Ow0KPiBKb25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+
Ow0KPiB6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAw
LzExXSBody9hcm0vdmlydDogQWRkIHN1cHBvcnQgZm9yIHVzZXIgY3JlYXRhYmxlDQo+IFNNTVV2
MyBkZXZpY2UNCj4gDQo+IEhpIFNoYW1lZXIsDQo+IA0KPiBPbiA2LzIzLzI1IDExOjQyIEFNLCBT
aGFtZWVyIEtvbG90aHVtIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+IENoYW5nZXMgZnJv
bSB2NDoNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjUwNjEzMTQ0
NDQ5LjYwMTU2LTEtDQo+IHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbS8NCj4g
Pg0KPiA+IE1ham9yIGNoYW5nZXMgZnJvbSB2NDoNCj4gdGhpcyB3aWxsIG5lZWQgYSByZXNwaW4g
YWZ0ZXIgbWVyZ2Ugb2YNCj4gZjVlYzc1MWVlNzBkwqAgaHcvYXJtL3ZpcnQ6IENoZWNrIGJ5cGFz
cyBpb21tdSBpcyBub3Qgc2V0IGZvciBpb21tdS1tYXANCj4gRFQgcHJvcGVydHkNCg0KWWVzLiBN
aXNzZWQgdGhhdC4gV2lsbCBkby4NCg0KVGhhbmtzLA0KU2hhbWVlcg0KDQo=
