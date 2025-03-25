Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2717688njc;
        Tue, 25 Mar 2025 08:44:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd934DLlES1sSNsy3TKuQ1SYq+clz5HJGEylZaZwiEQAbMOb70WHE+i55nI4b5EnxYVN+x2Q7p4yh6UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGpyRKHkhELat9uAQCXlQc5ecR7/ityqaO3xG4DCkcqQKeVp3PXb0gEdII3BFguOBhZ5gd3
X-Received: by 2002:a05:6000:402b:b0:390:f5c8:1079 with SMTP id ffacd0b85a97d-39acc477107mr245767f8f.24.1742917445461;
        Tue, 25 Mar 2025 08:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742917445; cv=none;
        d=google.com; s=arc-20240605;
        b=SphpYal0wiUgfa+Y3OEHJi+siFnb7E9B//GbyHVMwPIJVppdS2dwC7vM5G05UJBrr6
         G9fUPz+UCmZKAGKaa+95nOHDfnw4VBvPnDZyj50k92i2IA4R9jF2ydh2TBzyhbScKZ75
         XtmLiQ9YsvvIfiNc9EPIW1WCJx48ddfMKuzQC6UJm7uJ2FEelgOlI67JiE1oKskw3tvR
         m7B4uj0SJNPl/h34j/4Ce/ogqt5Bbi5sdM6d1MvsZEBKWr4WIUEgT0+kd9trhaxOT43U
         zZFnEVOw1jLW1AuCD8MknsxRpwseadY9MxC+FsKqHo9BICtfMFhaAgvMbbu2ftUPAd47
         iXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=ICFwMYPZMssGSZEIB8NoadF5NRv9GT/YDR6wWKiAgRk=;
        fh=O6X2BWEQtTCF1UGIaMMuTYtr58ukGNU/CQyZ48iW9Cs=;
        b=Nw9VtwMNF2PYnAXFNV2vOml+/KsC6R7TgDmHIyCL8Y/bOfsQH/7MLw2et9OZywUEx5
         IdRADHmLIwhZyBPIFSacgWAb4jTfr+q2avvDU/IK8OrJ2f8wu98FJ4uae/2Fhni5vX3k
         ucqkmeVq14ZtNoNPXIy0qyk9fFsz9C995AL5t9hI6b4lhOkVf8O/ZfwHZR4pQ6/Jm/nE
         /cenHdVXUMOfYEcrUIBUKWJvIYRUdaPICEWjcNeQy3HKrhiJix3oNwUxRikvxCa1iEJK
         vdQHchqle9b7IPqk9p5NHVsBXnBOMeMi9mX48D+jCABDpTZyaFQKmb63nD4Ixw/HeWL3
         lhuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43d4fd9ef79si79838015e9.115.2025.03.25.08.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 08:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tx6RO-0000ds-8d; Tue, 25 Mar 2025 11:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tx6RL-0000d5-Ui; Tue, 25 Mar 2025 11:43:43 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tx6RI-0004HY-Os; Tue, 25 Mar 2025 11:43:43 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZMYyV6KYPz6D99x;
 Tue, 25 Mar 2025 23:40:02 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
 by mail.maildlp.com (Postfix) with ESMTPS id 1FC8F14050C;
 Tue, 25 Mar 2025 23:43:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Mar 2025 16:43:29 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 25 Mar 2025 16:43:29 +0100
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
Subject: RE: [RFC PATCH v2 00/20] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
Thread-Topic: [RFC PATCH v2 00/20] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
Thread-Index: AQHbku9qSXcuhW1ML0aJ2/ms8Fev1bOD8a2AgAAdwlA=
Date: Tue, 25 Mar 2025 15:43:29 +0000
Message-ID: <ffff33965d2a4ed4a5bf22c1bda6d774@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <dbc0ee83-cb24-4fa5-9060-54a34a324f2c@redhat.com>
In-Reply-To: <dbc0ee83-cb24-4fa5-9060-54a34a324f2c@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: X+vFWHmnv6lc

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEF1
Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI1LCAy
MDI1IDI6NDMgUE0NCj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkNCj4gPHNoYW1lZXJh
bGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47IHFlbXUtYXJtQG5vbmdudS5vcmc7DQo+IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBqZ2dA
bnZpZGlhLmNvbTsgbmljb2xpbmNAbnZpZGlhLmNvbTsNCj4gZGR1dGlsZUByZWRoYXQuY29tOyBi
ZXJyYW5nZUByZWRoYXQuY29tOyBuYXRoYW5jQG52aWRpYS5jb207DQo+IG1vY2hzQG52aWRpYS5j
b207IHNtb3N0YWZhQGdvb2dsZS5jb207IExpbnV4YXJtDQo+IDxsaW51eGFybUBodWF3ZWkuY29t
PjsgV2FuZ3pob3UgKEIpIDx3YW5nemhvdTFAaGlzaWxpY29uLmNvbT47DQo+IGppYW5na3Vua3Vu
IDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsgSm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4u
Y2FtZXJvbkBodWF3ZWkuY29tPjsgemhhbmdmZWkuZ2FvQGxpbmFyby5vcmcNCj4gU3ViamVjdDog
UmU6IFtSRkMgUEFUQ0ggdjIgMDAvMjBdIGh3L2FybS92aXJ0OiBBZGQgc3VwcG9ydCBmb3IgdXNl
ci0NCj4gY3JlYXRhYmxlIGFjY2VsZXJhdGVkIFNNTVV2Mw0KPiANCg0KDQo+IEZvciB0aGUgcmVj
b3JkIEkgdGVzdGVkIHRoZSBzZXJpZXMgd2l0aCBob3N0IFZGSU8gZGV2aWNlIGFuZCBhDQo+IHZp
cnRpby1ibGstcGNpIGRldmljZSBwdXQgYmVoaW5kIHRoZSBzYW1lIHB4Yi1wY2llL3NtbXUgcHJv
dGVjdGlvbiBhbmQNCj4gaXQgd29ya3MganVzdCBmaW5lDQo+IA0KPiAtKy1bMDAwMDowYV0tKy0w
MS4wLVswYl0tLS0tMDAuMMKgIE1lbGxhbm94IFRlY2hub2xvZ2llcyBDb25uZWN0WCBGYW1pbHkN
Cj4gbWx4NUdlbiBWaXJ0dWFsIEZ1bmN0aW9uDQo+IMKgfMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwt
MDEuMS1bMGNdLS0tLTAwLjDCoCBSZWQgSGF0LCBJbmMuIFZpcnRpbyAxLjAgYmxvY2sgZGV2aWNl
DQo+IMKgXC1bMDAwMDowMF0tKy0wMC4wwqAgUmVkIEhhdCwgSW5jLiBRRU1VIFBDSWUgSG9zdCBi
cmlkZ2UNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstMDEuMC1bMDFdLS0NCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICstMDEuMS1bMDJdLS0NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwtMDIuMMKgIFJlZCBIYXQsIEluYy4gUUVNVSBQQ0llIEV4cGFuZGVyIGJyaWRnZQ0KPiAN
Cj4gVGhpcyBzaG93cyB0aGF0IHdpdGhvdXQgdmNtZHEgZmVhdHVyZSB0aGVyZSBpcyBubyBibG9j
a2VyIGhhdmluZyB0aGUNCj4gc2FtZSBzbW11IGRldmljZSBwcm90ZWN0aW5nIGJvdGggYWNjZWxl
cmF0ZWQgYW5kIGVtdWxhdGVkIGRldmljZXMuDQoNClRoYW5rcyBmb3IgZ2l2aW5nIGl0IGEgc3Bp
bi4gWWVzLCBpdCBjdXJyZW50bHkgc3VwcG9ydHMgdGhlIGFib3ZlLiANCg0KQXQgdGhlIG1vbWVu
dCB3ZSBhcmUgbm90IHVzaW5nIHRoZSBJT1RMQiBmb3IgdGhlIGVtdWxhdGVkIGRldiBmb3IgYQ0K
Y29uZmlnIGxpa2UgYWJvdmUuICBIYXZlIHlvdSBjaGVja2VkIHBlcmZvcm1hbmNlIGZvciBlaXRo
ZXIgZW11bGF0ZWQgb3INCnZmaW8gZGV2IHdpdGggdGhlIGFib3ZlIGNvbmZpZz8gV2hhdGV2ZXIg
bGlnaHQgdGVzdHMgSSBoYXZlIGRvbmUgaXQgc2hvd3MNCnBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9u
IGZvciBlbXVsYXRlZCBkZXYgY29tcGFyZWQgdG8gdGhlIGRlZmF1bHQNClNNTVV2Myhpb21tdT1z
bW11djMpLiANCg0KQW5kIGlmIHRoZSBlbXVsYXRlZCBkZXYgaXNzdWVzIF9UTEJJX05IX0FTSUQs
IHRoZSBjb2RlIGN1cnJlbnRseSB3aWxsIHByb3BhZ2F0ZQ0KdGhhdCBkb3duIHRvIGhvc3QgU01N
VXYzLiBUaGlzIHdpbGwgYWZmZWN0IHRoZSB2ZmlvIGRldiBhcyB3ZWxsLg0KDQpTbyB0aGUgcXVl
c3Rpb24gaXMgd2hldGhlciB3ZSB3YW50IHRvIGFsbG93IHRoaXMoYXNzdW1pbmcgdXNlciBpcyBl
ZHVjYXRlZCkgb3INCmJsb2NrIHN1Y2ggYSBjb25maWcgYXMgdXNlciBoYXMgYW4gb3B0aW9uIG9m
IHVzaW5nIGEgbm9uLWFjY2VsIHNtbXV2MyBmb3INCmVtdWxhdGVkIGRldmljZXMuDQoNClRoYW5r
cywNClNoYW1lZXINCg0KDQo=
