Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2606587njk;
        Mon, 2 Dec 2024 00:08:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFLSTFIXNx3yzHefJxmPVm1jdk7UjpA8I4RJ+RsSxPuAtp+PRYG+QiV4riJel9yzCsIzrQF+8x0wBHPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFqa7bBgBwLtBRA43mvpHaB0AQ9jpm+Bbl+mbI3nyWwobKMulVDZWDXBbWz1mqUSi0htLPI
X-Received: by 2002:a05:620a:290a:b0:7b6:6bd7:7ad0 with SMTP id af79cd13be357-7b67c282727mr3480942885a.19.1733126885005;
        Mon, 02 Dec 2024 00:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733126884; cv=none;
        d=google.com; s=arc-20240605;
        b=BxPX2VAcCfy8cOkUjfawXkOID97m07oD+6a8oS5RMl+0Wkdd20f/Ip1JGMgDtOkHjU
         ne4CUKs557912o3EyzftbhygqsO5LWKxgByNPvWpmUj0B4s6Mig1yi3riqeCO9MmSv1/
         UCAYHt7i0NWnDxwHITitnmWqIrCDGaQsykimoFsmaTp+RT2t4AKlFr7yaSWV/o1mrze8
         I6LqZX3sqd2kEnkIOZ5kR5k6+1iBC9tg4zuTsr/g3EF04IImk4UeWXb5Pboc2yoeke1m
         vdPpFXH5D1T4RJ+Hr5W+rVZoznNLFu53L133PpnapuEsJpIL09MVfroKrqvEe+OCcIRJ
         MICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=ByPzPKVjAwyJop/2w83h2QiC4SVSgDZyjRz2x+EXnOI=;
        fh=pEpCAAieI779UVaIceJ4ui/5AWeOki49AnVqdnYsEXg=;
        b=jKjhHGrQv6Iee4SpZkXaytI9uzM6hblQ7RvTpzTb7WhXOHZL5V+SI3F61TC+cnqzoz
         l1yzpd2Veue47KRCbdKkxOyyVyEgy/W9K0WG4TZD45y6YGszaDzd4fx2oqzGk+6HGift
         RQhIIp1D8UnakJOn4R3bc1IaegOC3LCw+d7ZCle98xgDR1xE0O6WB8wIAPEdp1r7+Hgk
         meVpAhewnd9vbqQinawo+v5VmvUulpeQGd9+h6Xxc0tKCylTteTIUZhbg91w6Ns48GO6
         RikQS/dZ0kdg3O0mbyl3db0By9VX+DH3/+YhzXGfHeDkWz/5ggfSx27sHPOPEHibfkFT
         01ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923e1esi1337505185a.122.2024.12.02.00.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 00:08:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI1T7-0005bo-2R; Mon, 02 Dec 2024 03:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tI1T2-0005ZZ-2S; Mon, 02 Dec 2024 03:07:41 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tI1Su-0002gP-Un; Mon, 02 Dec 2024 03:07:36 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y1xFQ5ztkz6LCCZ;
 Mon,  2 Dec 2024 16:06:34 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 794BD14034E;
 Mon,  2 Dec 2024 16:07:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 09:07:15 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 2 Dec 2024 09:07:15 +0100
To: Zhangfei Gao <zhangfei.gao@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 Mostafa Saleh <smostafa@google.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Peter Maydell" <peter.maydell@linaro.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Moritz Fischer <mdf@kernel.org>, Michael Shavit
 <mshavit@google.com>, Andrea Bolognani <abologna@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "arighi@nvidia.com" <arighi@nvidia.com>,
 "ianm@nvidia.com" <ianm@nvidia.com>, "jan@nvidia.com" <jan@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>
Subject: RE: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
Thread-Topic: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
Thread-Index: AQHbLBPkDYWW/RlwrUqSJByfpx0jw7KiQNeAgDBWeACAADJP0A==
Date: Mon, 2 Dec 2024 08:07:14 +0000
Message-ID: <8f9d105371be44f1a1f6ba0f268d8c68@huawei.com>
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
 <20241101115501.GS10193@nvidia.com>
 <CABQgh9E3ba1F_4bTxkzRmt0sDmyVR+hbxocnqSvrvwerFZwiug@mail.gmail.com>
In-Reply-To: <CABQgh9E3ba1F_4bTxkzRmt0sDmyVR+hbxocnqSvrvwerFZwiug@mail.gmail.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 6Uil526wU+ov

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhhbmdmZWkgR2FvIDx6
aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZz4NCj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAyLCAyMDI0
IDY6MDUgQU0NCj4gVG86IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+DQo+IENjOiBO
aWNvbGluIENoZW4gPG5pY29saW5jQG52aWRpYS5jb20+OyBTaGFtZWVyYWxpIEtvbG90aHVtIFRo
b2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+OyBFcmljIEF1Z2Vy
DQo+IDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+OyBNb3N0YWZhIFNhbGVoIDxzbW9zdGFmYUBnb29n
bGUuY29tPjsgcWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
UGV0ZXIgTWF5ZGVsbA0KPiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgSmVhbi1QaGlsaXBw
ZSBCcnVja2VyIDxqZWFuLQ0KPiBwaGlsaXBwZUBsaW5hcm8ub3JnPjsgTW9yaXR6IEZpc2NoZXIg
PG1kZkBrZXJuZWwub3JnPjsgTWljaGFlbCBTaGF2aXQNCj4gPG1zaGF2aXRAZ29vZ2xlLmNvbT47
IEFuZHJlYSBCb2xvZ25hbmkgPGFib2xvZ25hQHJlZGhhdC5jb20+Ow0KPiBNaWNoYWVsIFMuIFRz
aXJraW4gPG1zdEByZWRoYXQuY29tPjsgUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPjsNCj4g
bmF0aGFuY0BudmlkaWEuY29tOyBhcmlnaGlAbnZpZGlhLmNvbTsgaWFubUBudmlkaWEuY29tOw0K
PiBqYW5AbnZpZGlhLmNvbTsgbW9jaHNAbnZpZGlhLmNvbQ0KPiBTdWJqZWN0OiBSZTogbmVzdGVk
LXNtbXV2MyB0b3BpYyBmb3IgUUVNVS9saWJ2aXJ0LCBOb3YgMjAyNA0KPiANCj4gSGksIE5pY28N
Cj4gDQo+IE9uIEZyaSwgMSBOb3YgMjAyNCBhdCAxOTo1NSwgSmFzb24gR3VudGhvcnBlIDxqZ2dA
bnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUaHUsIE9jdCAzMSwgMjAyNCBhdCAwOTow
OToyMFBNIC0wNzAwLCBOaWNvbGluIENoZW4gd3JvdGU6DQo+ID4NCj4gPiA+IEZXSVcsIFJvYmlu
IHJlcXVlc3RlZCBhIGRpZmZlcmVudCBzb2x1dGlvbiBmb3IgTVNJIG1hcHBpbmcgWzFdLCB2LnMu
DQo+ID4gPiB0aGUgUk1SIG9uZSB0aGF0IHdlIGhhdmUgYmVlbiB1c2luZyBzaW5jZSBFcmljJ3Mg
d29yay4gSSBkcmFmdGVkIGENCj4gPiA+IGZldyBWRklPL0lPTU1VRkQgcGF0Y2hlcyBmb3IgdGhh
dCwNCj4gPg0KPiA+IEkgYWxzbyB0YWxrZWQgdG8gTWFyY1ogYWJvdXQgdGhpcyBhdCBMUEMgYW5k
IGhlIHNlZW1zIHdpbGxpbmcgdG8NCj4gPiBjb25zaWRlciBpdC4gSXQgdG9vayBhIGJpdCB0byBl
eHBsYWluIGV2ZXJ5dGhpbmcgdGhvdWdoLiBTbyBJIHRoaW5rIHdlDQo+ID4gc2hvdWxkIHRyeSBp
biBOb3YvRGVjDQo+IA0KPiBXaGVuIGJvb3QgcWVtdSwgcmVwb3J0cyB0aGlzDQo+IA0KPiBxZW11
LXN5c3RlbS1hYXJjaDY0OiB3YXJuaW5nOiBJT01NVV9JT0FTX01BUCBmYWlsZWQ6IEJhZCBhZGRy
ZXNzLCBQQ0kNCj4gQkFSPw0KPiBxZW11LXN5c3RlbS1hYXJjaDY0OiB2ZmlvX2NvbnRhaW5lcl9k
bWFfbWFwKDB4YWFhYWRkMzBmMTEwLA0KPiAweDgwMDAyMDAwMDAsIDB4MTAwMDAsIDB4ZmZmZmI4
MDMxMDAwKSA9IC0xNCAoQmFkIGFkZHJlc3MpDQo+IHFlbXUtc3lzdGVtLWFhcmNoNjQ6IHdhcm5p
bmc6IElPTU1VX0lPQVNfTUFQIGZhaWxlZDogQmFkIGFkZHJlc3MsIFBDSQ0KPiBCQVI/DQo+IHFl
bXUtc3lzdGVtLWFhcmNoNjQ6IHZmaW9fY29udGFpbmVyX2RtYV9tYXAoMHhhYWFhZGQyYmMzMTAs
DQo+IDB4ODAwMDIwMDAwMCwgMHgxMDAwMCwgMHhmZmZmYjgwMzEwMDApID0gLTE0IChCYWQgYWRk
cmVzcykNCj4gcWVtdS1zeXN0ZW0tYWFyY2g2NDogd2FybmluZzogSU9NTVVfSU9BU19NQVAgZmFp
bGVkOiBCYWQgYWRkcmVzcywgUENJDQo+IEJBUj8NCj4gcWVtdS1zeXN0ZW0tYWFyY2g2NDogdmZp
b19jb250YWluZXJfZG1hX21hcCgweGFhYWFkY2Y5MDAwMCwNCj4gMHg4MDAwMjAwMDAwLCAweDEw
MDAwLCAweGZmZmZiODAzMTAwMCkgPSAtMTQgKEJhZCBhZGRyZXNzKQ0KPiANCj4gV2lsbCB0aGlz
IGFsc28gYmUgc29sdmVkIGluIHRoZSBuZXcgTVNJIG1hcHBpbmcgcGF0Y2hzZXQ/DQoNCk5vcGUu
IFRoZXNlIGFyZSBub3QgcmVsYXRlZCB0byBNU0lzLiBUaGVzZSBtYXBwaW5ncyBhcmUgcmVxdWly
ZWQgZm9yIA0KUDJQIERNQSBiZXR3ZWVuIGRldmljZXMgYW5kIGlzIG5vdCBzdXBwb3J0ZWQgYnkg
SU9NTVVGRCBhdCB0aGUgbW9tZW50Lg0KDQpTZWUgdGhlIGRpc2N1c3Npb24gaGVyZSwNCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDQyNjEwMzUwNy41NjkzYTBjYS5hbGV4LndpbGxp
YW1zb25AcmVkaGF0LmNvbS8NCg0KVGhhbmtzLA0KU2hhbWVlcg0KDQo=
