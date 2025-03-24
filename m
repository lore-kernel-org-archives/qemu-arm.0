Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1961756njc;
        Mon, 24 Mar 2025 06:55:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUz06rVtjh9m1+9lrN/RbHUZqM99hRtw2eI9oIRZaPIu1QacveCe3KBU0bmijqb/bb5RpTkRhVKtnBPpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFdw0XSokGoiITSWDyauR6RdQCvl5/2H8hWOdh8QnEXlXq1jiO9/tLw6yeZSii9bw3/p4Xr
X-Received: by 2002:ac8:529a:0:b0:477:29f5:53eb with SMTP id d75a77b69052e-47729f55467mr119737171cf.6.1742824548097;
        Mon, 24 Mar 2025 06:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742824548; cv=none;
        d=google.com; s=arc-20240605;
        b=FdRknkfd3NnHvGXLHKxeGJHvF1Vt8GZPLj2gy6Qjfhshh0KAEQ2Ez824GzKBYISc/j
         Zgi3u8vDTWzksOlbNgZV6/rcYOjPIjXL0w1k2Qlt/UshjWApiSuqVatR8TYnzpV4gygw
         hmK264xydAGxKdcQNr1aYfpF5nq+y7aaID9lP6Vcr1GIrae+X/t7l4PNFTfwJ1Rf+xBm
         HeeNhd2bBX3TM3lA5x3y/OUeLSMwB1mLO/3oir4yIiDk3fsEpCRDSGZzUI4Sjoo80B6x
         /x13PygI2gWe1Kychw67JBJDWTHoorJyg5WoL2j+DuRjC5J/JqOut9ITv4ScVnzWvZOb
         djWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=/7nM0w6H9ExX9WuNUOAb18nx465KXSwYe7hNHS4cQ9Q=;
        fh=tJTLm+ud1IqUZ6NB/nutz2k5IJasNo/ju6T0EsSGNsY=;
        b=eBdzBSClmkKSQjPy3UXkITJt0m4QcBQK588y2jInWIT3s2hIp/crjMl51AAFh8vYho
         eoG9X5ltt8qj3yhKnxxPJayol0m2cHMhVEKaVaRzZsB3ASZM800GY807SHmK6CkhoHJA
         v4vT2HK4S6ZNkyqiiOPcozU5lCWm0A0cfgku0LPWZKV01Cqn7WYC/IQ3s5DyuIOWB7fW
         Xd9mstl5yH7ZaIQZfLBR2GnzUqDOEpVHEOwi7y5KPx2Dy3IZWvJh0IX4cGcTI2aEKDSz
         HbEv+ChAHkkL+7y2E75+GvFteTbwJ1jh+hekD1r7UrFx8t8ZStbcKL0AyJVqYe6nSg6U
         HD+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d65a5e8si78250831cf.661.2025.03.24.06.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 06:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twiH7-0005CU-W2; Mon, 24 Mar 2025 09:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1twiH6-00059T-5j; Mon, 24 Mar 2025 09:55:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1twiGz-0003Z5-A2; Mon, 24 Mar 2025 09:55:27 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZLvh13xCFz6L5GD;
 Mon, 24 Mar 2025 21:55:13 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
 by mail.maildlp.com (Postfix) with ESMTPS id 02D9E140518;
 Mon, 24 Mar 2025 21:55:21 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Mar 2025 14:55:20 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 24 Mar 2025 14:55:20 +0100
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Nicolin Chen
 <nicolinc@nvidia.com>
CC: Donald Dutile <ddutile@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
Thread-Topic: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie
 bus
Thread-Index: AQHbkps6in4QB/PMZUednFRw1zRmILN5b66AgADGVyCAAgfGgIAFxokwgABCuACAABjAsA==
Date: Mon, 24 Mar 2025 13:55:20 +0000
Message-ID: <a5ba5e2228b24338b4ef509bb1748739@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <b3a4ce7f-41a9-4da9-a8ca-54848b9e9cf1@redhat.com>
 <3d1312b411f04121a3be90879a915982@huawei.com>
 <Z9xKL49nOenvQIsW@Asurada-Nvidia>
 <2f84490d309440a4a2ac56fd893ddab8@huawei.com>
 <ad0b5fac-2a7f-4978-9f6b-0f7b1df14a35@redhat.com>
In-Reply-To: <ad0b5fac-2a7f-4978-9f6b-0f7b1df14a35@redhat.com>
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
X-TUID: 1qKcWSlhZc83

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBxZW11LWRl
dmVsLQ0KPiBib3VuY2VzK3NoYW1lZXJhbGkua29sb3RodW0udGhvZGk9aHVhd2VpLmNvbUBub25n
bnUub3JnIDxxZW11LQ0KPiBkZXZlbC1ib3VuY2VzK3NoYW1lZXJhbGkua29sb3RodW0udGhvZGk9
aHVhd2VpLmNvbUBub25nbnUub3JnPiBPbg0KPiBCZWhhbGYgT2YgRXJpYyBBdWdlcg0KPiBTZW50
OiBNb25kYXksIE1hcmNoIDI0LCAyMDI1IDE6MTMgUE0NCj4gVG86IFNoYW1lZXJhbGkgS29sb3Ro
dW0gVGhvZGkNCj4gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47IE5pY29s
aW4gQ2hlbg0KPiA8bmljb2xpbmNAbnZpZGlhLmNvbT4NCj4gQ2M6IERvbmFsZCBEdXRpbGUgPGRk
dXRpbGVAcmVkaGF0LmNvbT47IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtDQo+IGRldmVsQG5v
bmdudS5vcmc7IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgamdnQG52aWRpYS5jb207DQo+IGJl
cnJhbmdlQHJlZGhhdC5jb207IG5hdGhhbmNAbnZpZGlhLmNvbTsgbW9jaHNAbnZpZGlhLmNvbTsN
Cj4gc21vc3RhZmFAZ29vZ2xlLmNvbTsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBX
YW5nemhvdSAoQikNCj4gPHdhbmd6aG91MUBoaXNpbGljb24uY29tPjsgamlhbmdrdW5rdW4gPGpp
YW5na3Vua3VuQGh1YXdlaS5jb20+Ow0KPiBKb25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1l
cm9uQGh1YXdlaS5jb20+Ow0KPiB6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1JGQyBQQVRDSCB2MiAwNS8yMF0gaHcvYXJtL3NtbXV2My1hY2NlbDogQXNzb2NpYXRlIGEg
cHhiLQ0KPiBwY2llIGJ1cw0KPiANCj4gSGkgU2hhbWVlciwNCj4gDQo+IE9uIDMvMjQvMjUgOTox
OSBBTSwgU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSB3cm90ZToNCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBOaWNvbGluIENoZW4gPG5pY29saW5jQG52
aWRpYS5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMCwgMjAyNSA1OjAzIFBNDQo+
ID4+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVt
LnRob2RpQGh1YXdlaS5jb20+DQo+ID4+IENjOiBEb25hbGQgRHV0aWxlIDxkZHV0aWxlQHJlZGhh
dC5jb20+OyBxZW11LWFybUBub25nbnUub3JnOw0KPiBxZW11LQ0KPiA+PiBkZXZlbEBub25nbnUu
b3JnOyBlcmljLmF1Z2VyQHJlZGhhdC5jb207IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4g
Pj4gamdnQG52aWRpYS5jb207IGJlcnJhbmdlQHJlZGhhdC5jb207IG5hdGhhbmNAbnZpZGlhLmNv
bTsNCj4gPj4gbW9jaHNAbnZpZGlhLmNvbTsgc21vc3RhZmFAZ29vZ2xlLmNvbTsgTGludXhhcm0N
Cj4gPj4gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBXYW5nemhvdSAoQikgPHdhbmd6aG91MUBoaXNp
bGljb24uY29tPjsNCj4gPj4gamlhbmdrdW5rdW4gPGppYW5na3Vua3VuQGh1YXdlaS5jb20+OyBK
b25hdGhhbiBDYW1lcm9uDQo+ID4+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyB6aGFu
Z2ZlaS5nYW9AbGluYXJvLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiAwNS8y
MF0gaHcvYXJtL3NtbXV2My1hY2NlbDogQXNzb2NpYXRlIGENCj4gcHhiLQ0KPiA+PiBwY2llIGJ1
cw0KPiA+Pg0KPiA+PiBPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCAwOToyNjoyOUFNICswMDAwLCBT
aGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+ID4+IHdyb3RlOg0KPiA+Pj4gSGF2aW5nIHNhaWQg
dGhhdCwgIGN1cnJlbnQgY29kZSBvbmx5IGFsbG93cyBweGItcGNpZSByb290IGNvbXBsZXhlcw0K
PiA+PiBhdm9pZGluZw0KPiA+Pj4gdGhlIHBjaWUuMC4gVGhlIGlkZWEgYmVoaW5kIHRoaXMgd2Fz
LCB1c2VyIGNhbiB1c2UgcGNpZS4wIHdpdGggYSBub24NCj4gYWNjZWwNCj4gPj4gU01NVXYzDQo+
ID4+PiBmb3IgYW55IGVtdWxhdGVkIGRldmljZXMgYXZvaWRpbmcgdGhlIHBlcmZvcm1hbmNlIGJv
dHRsZW5lY2tzIHdlIGFyZQ0KPiA+Pj4gZGlzY3Vzc2luZyBmb3IgZW11bGF0ZWQgZGV2K3NtbXV2
My1hY2NlbCBjYXNlcy4gQnV0IGJhc2VkIG9uIHRoZQ0KPiA+PiBmZWVkYmFjayBmcm9tDQo+ID4+
PiBFcmljIGFuZCBEYW5pZWwgSSB3aWxsIHJlbGF4IHRoYXQgcmVzdHJpY3Rpb24gYW5kIHdpbGwg
YWxsb3cgYXNzb2NpYXRpb24NCj4gd2l0aA0KPiA+PiBwY2llLjAuDQo+ID4+DQo+ID4+IEp1c3Qg
d2FudCBhIGNsYXJpZmljYXRpb24gaGVyZS4uDQo+ID4+DQo+ID4+IElmIFZNIGhhcyBhIHBhc3N0
aHJvdWdoIGRldmljZSBvbmx5Og0KPiA+PiAgYXR0YWNoIGl0IHRvIFBDSUUuMCA8PT4gdlNNTVUw
IChhY2NlbD1vbikNCj4gPiBZZXMuIEJhc2ljYWxseSBzdXBwb3J0IGFjY2VsPW9uIHRvIHBjaWUu
MCBhcyB3ZWxsLg0KPiANCj4gYWdyZWVkIHdlIHNoYWxsIGJlIGFibGUgdG8gaW5zdGFudGlhdGUg
dGhlIGFjY2VsZXJhdGVkIFNNTVUgb24gcGNpZS4wIHRvby4NCj4gPg0KPiA+PiBJZiBWTSBoYXMg
YW4gZW11bGF0ZWQgZGV2aWNlIGFuZCBhIHBhc3N0aHJvdWdoIGRldmljZToNCj4gPj4gIGF0dGFj
aCB0aGUgZW11bGF0ZWQgZGV2aWNlIHRvIFBDSUUuMCA8PT4gdlNNTVUgYnlwYXNzIChvciBhY2Nl
bD1vZmY/KQ0KPiA+PiAgYXR0YWNoIHRoZSBwYXNzdGhyb3VnaCBkZXZpY2UgdG8gcHhiLXBjaWUg
PD0+IHZTTU1VMCAoYWNjZWw9b24pDQo+ID4gVGhpcyBjYW4gYmUgb3RoZXIgd2F5IGFyb3VuZCBh
cyB3ZWxsOg0KPiA+IGllLA0KPiA+IHBhc3MtdGhyb3VnaCB0byBwY2llLjAoYWNjZWw9b24pIGFu
ZCBlbXVsYXRlZCB0byBhbnkgb3RoZXIgcHhiLXBjaWUgd2l0aA0KPiBhY2NlbCA9IG9mZi4NCj4g
KzENCj4gPg0KPiA+IEkgdGhpbmsgdGhlIHdheSBidXMgbnVtYmVycyBhcmUgYWxsb2NhdGVkIGlu
IFFlbXUgZm9yIHBjaWUuMCBhbmQgcHhiLQ0KPiBwY2llIGFsbG93cw0KPiA+IHVzIHRvIHN1cHBv
cnQgdGhpcyBpbiBJT1JUIElEIG1hcHMuDQo+IE9uZSB0cm91YmxlIHdlIG1heSBnZXQgaW50byBp
cyBwb3NzaWJsZSBidXMgcmVvcmRlcmluZyBieSB0aGUgZ3Vlc3QuIEkNCj4gZG9uJ3Qga25vdyB0
aGUgZGV0YWlscyBidXQgSSByZW1lbWJlciB0aGF0IGluIGNlcnRhaW4gY29uZGl0aW9ucyB0aGUN
Cj4gZ3Vlc3QgY2FuIHJlb3JkZXIgdGhlIGJ1cyBudW1iZXJzLg0KDQpZZWFoLCBHdWVzdCBrZXJu
ZWwgY2FuIHJlLWVudW1lcmF0ZSBQQ0llLiBJIHdpbGwgY2hlY2suDQogDQo+IEJlc2lkZXMgd2hh
dCBJIGRvbid0IGdldCBpbiB0aGUgYWJvdmUgZGlzY3Vzc2lvbiwgcmVsYXRlZCB0byB3aGV0aGVy
IHRoZQ0KPiBhY2NlbGVyYXRlZCBtb2RlIGNhbiBhbHNvIHNpcHBvcnQgZW11bGF0ZWQgZGV2aWNl
cywgaXMgdGhhdCBpZiB5b3UgdXNlDQo+IHRoZSBvcmlnaW5hbGx5IHN1Z2dlc3RlZCBoaWVyYXJj
aHkgKHB4Yi1wY2llICsgcm9vdCBwb3J0ICsgVkZJTyBkZXZpY2UpDQo+IHlvdSBldmVudHVhbGx5
IGdldCBvbiBndWVzdCBzaWRlIDIgZGV2aWNlcyBwcm90ZWN0ZWQgYnkgdGhlIFNNTVUNCj4gaW5z
dGFuY2U6IHRoZSByb290IHBvcnQgYW5kIHRoZSBWRklPIGRldmljZS4gVGhleSBlbmQgdXAgaW4g
ZGlmZmVyZW50DQo+IGlvbW11IGdyb3Vwcy4gU28gdGhlcmUgaXMgYWxyZWFkeSBhIG1peCBvZiBl
bXVsYXRlZCBhbmQgVkZJTyBkZXZpY2UuDQoNClRydWUuIEJ1dCBJIGd1ZXNzIHRoZSByb290IHBv
cnQgYXNzb2NpYXRlZCBhY3Rpdml0eShpbnZhbGlkYXRpb25zIGV0Yykgd2lsbCBiZQ0KdmVyeSBt
aW5pbWFsKG9yIG5pbD8pIGNvbXBhcmVkIHRvIGEgdmlydGlvIGRldmljZS4NCg0KVGhhbmtzLA0K
U2hhbWVlcg0KDQoNCg0K
