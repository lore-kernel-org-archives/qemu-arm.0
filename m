Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3712569wrq;
        Mon, 18 Jun 2018 02:47:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKnDxKim4GV6pm4D9+k039SV4rdY8B9v07kk6+nV7bTZoipqM2wUgvMtCyNOj6ynxlVamdX
X-Received: by 2002:a37:a5d1:: with SMTP id o200-v6mr9205702qke.199.1529315248668;
        Mon, 18 Jun 2018 02:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529315248; cv=none;
        d=google.com; s=arc-20160816;
        b=g/4T/Drvkj0APjlyGvOE6K4xJwdzxaTzbO/jccdPRhg8TUBO6mH31z5l++LnG5UGV/
         SmXToOe/lVAQtKT3kQVlE8U5x27M4tHHOSfPvVzvmQfn+LTqs50cQ75v6O64Wxy3AdGU
         Dmxa+M0Z2xEyLH2NMDvg2+fXul79QBuedduEqQYpj06h2WGlj6BVL8kspwEzOGSNkkw7
         2rnUPv7r0jje0ZQyTqPy1aWAv+JX0wRetViGW31mLKL+fM5P3qILKjqJYgr3J/RQeeVS
         BLyca7J8jaSTcE6GbOEPDun/0+vEpetayAa0RuLyqmfHNgab1YZzGaO07wDHDHId2Rk3
         MNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=GEYwXti8cHauJI1t4HUL4Aw8eyIYbgOIUOC5PO0izI0=;
        b=rS744sqgytD997pjBzfV3gsgoCc2pedoPEqpq/H39CGR6IjiMivvcPYhDpkWOh7D0E
         Z34xYOYZTtmwId6HCHgivxNW48fIgNMr3G3/Ofn/Po4lop7RIBaq4J2G3xSO8du8Vc+q
         +6UX/YMy3pvoa9fd6pGkcUoURQQR4Qg5NZ+FJDQrNfcur9cWkNKmzgbAM1OOUCqkbB2N
         UNc239W7vTY9elCJcYf7ejWUK8y3wIoElvGC4vuX+MicW5IudaPVdaY/3JcbME3jSBS1
         l1TXtuFA5GlO4/CoeuQgAFNIhuyQUxbBSwTa0++Kv8qGgwO1+36X4+dsTSb8Bv71/W4B
         gscw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w4-v6si11469506qtn.46.2018.06.18.02.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 02:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUqky-00063l-5B
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 05:47:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fUqkg-00061r-CM
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fUqkd-0006Iz-96
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:47:10 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4262 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fUqkd-0006GI-2n; Mon, 18 Jun 2018 05:47:07 -0400
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 8BC022B45D058;
	Mon, 18 Jun 2018 10:47:00 +0100 (IST)
Received: from FRAEMA708-CHM.china.huawei.com (10.206.14.57) by
	lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Mon, 18 Jun 2018 10:47:01 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA708-CHM.china.huawei.com ([169.254.8.193]) with mapi id
	14.03.0382.000; Mon, 18 Jun 2018 11:46:55 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Auger Eric
	<eric.auger@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v2 6/6] hw/arm: Populate non-contiguous
	memory regions
Thread-Index: AQHT7Smp6QHgsUaqbU6E/UX/WhtxEaRFIoCAgAMh+zCACSM+IIAQG/iAgAACpwCAAAVkAIAABXaAgARkTLA=
Date: Mon, 18 Jun 2018 09:46:54 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8387019ED@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
	<20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
	<CAFEAcA-nG4Xv=PmxzW3tzs-TStziMDHMFxYi6_teSe1GhLH=hw@mail.gmail.com>
	<333cd485-dc75-d295-16fd-98a1108e1e15@redhat.com>
	<CAFEAcA-+Xp6B_g_a89-7wP_DN1ftGrKTON=P6wH_6ESq9GPKKQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-+Xp6B_g_a89-7wP_DN1ftGrKTON=P6wH_6ESq9GPKKQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/6] hw/arm: Populate
 non-contiguous memory regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Zhaoshenglong <zhaoshenglong@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qbhqF0yaC8O3

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCBb
bWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4gU2VudDogMTUgSnVuZSAyMDE4IDE3
OjMzDQo+IFRvOiBBdWdlciBFcmljIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IENjOiBBbmRy
ZXcgSm9uZXMgPGRyam9uZXNAcmVkaGF0LmNvbT47IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkN
Cj4gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZzsgcWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7IEpvbmF0aGFuIENhbWVyb24gPGpvbmF0
aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47DQo+IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29t
PjsgYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207DQo+IFpoYW9zaGVuZ2xvbmcgPHpoYW9zaGVu
Z2xvbmdAaHVhd2VpLmNvbT47IGltYW1tZWRvQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtR
ZW11LWRldmVsXSBbUkZDIHYyIDYvNl0gaHcvYXJtOiBQb3B1bGF0ZSBub24tY29udGlndW91cw0K
PiBtZW1vcnkgcmVnaW9ucw0KPiANCj4gT24gMTUgSnVuZSAyMDE4IGF0IDE3OjEzLCBBdWdlciBF
cmljIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+IE9uIDA2LzE1LzIwMTggMDU6
NTQgUE0sIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+ID4+IFdoeSBzaG91bGQgdGhlIFZNIGV2ZXIg
Y2FyZSBhYm91dCB3aGVyZSB0aGUgYWRkcmVzcyByZWdpb25zIGluIHRoZQ0KPiA+PiBob3N0IGhh
cHBlbiB0byBiZSB3aGVuIGl0IGNvbWVzIHRvIHdoZXJlIGl0J3MgcHV0dGluZyBpdHMgUkFNDQo+
ID4+IGluIHRoZSBWTSdzIGFkZHJlc3MgbGF5b3V0PyBJIGZlZWwgbGlrZSBJJ20gbWlzc2luZyBz
b21ldGhpbmcgaGVyZS4uLg0KPiANCj4gPiBUaGUgVk0gY2Fubm90IHVzZSBSQU0gR1BBIHRoYXQg
bWF0Y2hlcyBhc3NpZ25lZCBkZXZpY2UgcmVzZXJ2ZWQgSU9WQQ0KPiA+IHJlZ2lvbnMuIFdoZW4g
eW91IGFzc2lnbiBhIGRldmljZSwgdGhlIHdob2xlIFZNIFJBTSBpcyBtYXBwZWQgaW4gdGhlDQo+
ID4gcGh5c2ljYWwgSU9NTVUgYW5kIElPVkEgY29ycmVzcG9uZHMgdG8gR1BBLiBidXQgc29tZXRp
bWVzIHNvbWUgSU9WQQ0KPiA+IGNhbm5vdCBiZSB1c2VkIGR1ZSB0byB0aGUgaG9zdCBzcGVjaWZp
Y2l0aWVzIGFuZCBlc3BlY2lhbGx5IGlvbW11DQo+ID4gcGVjdWxpYXJpdGllcy4gU29tZSBJT1ZB
cyBtYXkgYmUgc2ltcGx5ICJieXBhc3NlZCIgYnkgdGhlIGlvbW11LCBsaWtlIG9uDQo+ID4geDg2
IGFuZCBhbHNvIHdpdGggc29tZSBBUk0gU01NVSBpbnRlZ3JhdGlvbi4gSW4gc3VjaCBhIGNhc2Ug
dGhlIERNQQ0KPiA+IGFjY2Vzc2VzIGhhdmUgbm8gY2hhbmNlIHRvIHJlYWNoIHRoZSBndWVzdCBS
QU0gYXMgZXhwZWN0ZWQuIEhvcGUgaXQNCj4gPiBjbGFyaWZpZXMuDQo+IA0KPiBIbW0uIFdlIGRv
bid0IHdhbnQgdG8gaGF2ZSB0aGUgYWRkcmVzcyBsYXlvdXQgb2YNCj4gdGhlIFZNIGhhdmUgdG8g
Y29wZSB3aXRoIGFsbCB0aGUgdmFyaW91cyBvZGRpdGllcyB0aGF0IGhvc3QNCj4gc3lzdGVtcyBt
aWdodCBoYXZlLiBJcyB0aGlzIGtpbmQgb2YgdGhpbmcgY29tbW9uLCBvciByYXJlPw0KPiBJJ2Qg
bXVjaCByYXRoZXIganVzdCBzYXkgIndlIGRvbid0IHN1cHBvcnQgZGV2aWNlIHBhc3N0aHJvdWdo
DQo+IG9uIHRoYXQgc29ydCBvZiBzeXN0ZW0iLg0KPg0KDQpBcyBmYXIgYXMgSSBrbm93IG9uIEFS
TTY0IHBsYXRmb3JtcyB0aGlzIGlzIG5vdCB2ZXJ5IHJhcmUgbWFpbmx5IGJlY2F1c2Ugb2YNCnRo
ZSBwaHlzIE1TSSBkb29yYmVsbCBhbmQgdGhlIGZhY3QgdGhhdCBtZW1vcnkgbWFwIGlzIG5vdCBz
dGFuZGFyZGl6ZWQuIFRoaXMNCndhcyBkaXNjdXNzZWQgaW4gTFBDIHNvbWV0aW1lIGJhY2tbMV0g
YW5kIGEgc3lzZnMgaW50ZXJmYWNlIHdhcyBwcm92aWRlZCB0bw0KcmVwb3J0IHRoZXNlIHJlc2Vy
dmVkIHJlZ2lvbnMuIEFuZCBsYXRlciBBbGV4IGNvbW1lbnRlZCB0aGF0IHZmaW8gbmVlZHMgYSBt
b3JlDQpyb2J1c3Qgd2F5IG9mIGlkZW50aWZ5aW5nIGFuZCByZXBvcnRpbmcgdGhlc2UgcmVnaW9u
cyBhbmQgdGhhdOKAmXMgaG93IHRoZSB2ZmlvIGtlcm5lbA0KcGF0Y2ggc2VyaWVzWzJdIHdhcyBp
bnRyb2R1Y2VkIG9uIHdoaWNoIHRoaXMgcWVtdSBzZXJpZXMgaXMgYmFzZWQgb24uDQoNClRoYW5r
cywNClNoYW1lZXINCg0KWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE2LzExLzcvOTM1DQoN
ClsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC80LzE4LzI5Mw0KDQoNCg==
