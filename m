Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp42598wrt;
        Mon, 26 Nov 2018 09:25:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X06qd/7h3UBvpkRGniUbHyQtfqPJ1Z2cyyIxtwR3T2U8sNcWYbHCgDjJo1oXNDMmYa8Ylu
X-Received: by 2002:a65:4784:: with SMTP id e4mr25062709pgs.12.1543253120997;
        Mon, 26 Nov 2018 09:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543253120; cv=none;
        d=google.com; s=arc-20160816;
        b=iOo5dmvI+zDFiR7KgK63APM2glrsXWVB1bcnmL7/5ZWdNaex6jHh+IAj1CDNFpERY0
         vQemzkJNitqvR0+uCeHFQfDXWXNldRoXIuEsm0twRvznqyaubDFCAuqkupa45pu+qVpI
         vHMkLg6dtDntLuxe9eVd9nsXZ9NZCP3MuumyPtCktJtyL1rlxKzM5LqNFUwBmsDwD5pL
         VOye+lUQE2Lyu3i1WxIbVNyHHYUvtIFUdcpfjuZ4hOBYYV3m8grjFQtsB9Sv0NX+2JpB
         iloQDLII1wMkDZOKpYHfqRUpMJcqyDifQnhSO0sdxcbQUF6WwNJ5QNKQIFpDeDo9rqPV
         9pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from;
        bh=xsss2K5Tvsk7FUrZ6+vu0iFqYjhYDsg5CF67iJwuAxI=;
        b=EJB82VkMQa57eOdHfJ43vDBkVlVWijh3mrWosCx8TYuvCi5e5POF/mr9EFj824IQzM
         hP1CN0PlJ33QlYtx9i+Xmy12OGwrk4Tr9j8rOLZnptzKSYT+dgwisk3WHU7PTwvsBtzC
         0izSW5yXZq6AqMtN/XSevNdo9uWlMTKzjde274nvABdRqqqSeIVupsN/ltgHKnpp5v6y
         g6kf56KOmgNFSIgQLkIB1KWwsDijeXvuO5PoUW+L9EuiAXfNH+vmhv/I5mpe9pIl47x3
         YHClAI0pBhnZALP0kuNki/MJJT+5Jq4daGeWLgbDNZtXHQgb7OP0seTDzMwo0THIHLFz
         BsBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id 43si864448plb.176.2018.11.26.09.25.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Nov 2018 09:25:20 -0800 (PST)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMA404-HUB.china.huawei.com (unknown [172.30.72.54])
	by Forcepoint Email with ESMTP id 4AB6246597B9F;
	Tue, 27 Nov 2018 01:25:17 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.51]) by
 DGGEMA404-HUB.china.huawei.com ([10.3.20.45]) with mapi id 14.03.0415.000;
 Tue, 27 Nov 2018 01:25:09 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>, Marc Zyngier
	<marc.zyngier@arm.com>, James Morse <james.morse@arm.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, "Richard
 Henderson" <rth@twiddle.net>, "zhengxiang (A)" <zhengxiang9@huawei.com>,
	Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, QEMU Developers
	<qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH RESEND v15 08/10] target-arm: kvm64: inject synchronous
 External Abort
Thread-Topic: [PATCH RESEND v15 08/10] target-arm: kvm64: inject synchronous
 External Abort
Thread-Index: AdSFrK1EQq5y10MUQbCUpydLAbxyUw==
Date: Mon, 26 Nov 2018 17:25:09 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201F96F02@dggema523-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.45.84.5]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: aXMQEngLiSnH

PiA+Pg0KPiA+PiBIaSBQZXRlciwNCj4gPj4gICBUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIGNv
bW1lbnRzLg0KPiA+Pg0KPiA+PiA+DQo+ID4+ID4gT24gOCBOb3ZlbWJlciAyMDE4IGF0IDEwOjI5
LCBEb25naml1IEdlbmcgPGdlbmdkb25naml1QGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+PiA+ID4g
K2Jvb2wgd3JpdGVfcGFydF9jcHVzdGF0ZV90b19saXN0KEFSTUNQVSAqY3B1LCBwdHJkaWZmX3QN
Cj4gPj4gPiA+ICtmaWVsZG9mZnNldCkNCj4gPj4gPg0KPiA+PiA+IFdoYXQgaXMgdGhpcyBhYm91
dD8gTm90aGluZyBlbHNlIGluIFFFTVUgbmVlZHMgdG8gbWVzcyB3aXRoIHRoZQ0KPiA+PiA+IGNw
dXN0YXRlIHN5bmNocm9uaXphdGlvbi4gTXkgZmlyc3QgYXNzdW1wdGlvbiBpcyB0aGF0IHlvdSBz
aG91bGQgbm90IG5lZWQgdG8gZG8gc28gZWl0aGVyLg0KPiA+Pg0KPiA+PiBXZSBzaG91bGQgY2hh
bmdlIHRoZSBndWVzdCBDUDE1IEVTUl9FTDEncyB2YWx1ZSwgdGhlIG9ubHkgbWV0aG9kIGlzDQo+
ID4+IHRvIGNoYW5nZSB0aGUgY3B1LT5jcHJlZ192YWx1ZXNbXSBpbiBRRU1VLCB0aGVuIFFFTVUg
Y2FsbCB3cml0ZV9saXN0X3RvX2t2bXN0YXRlKCkgdG8gc2V0IHRoZSBjcHUtPmNwcmVnX3ZhbHVl
c1tdIHRvIEtWTSB3aGljaA0KPiBpbmNsdWRlIHRoZSBzcGVjaWZpZWQgRVNSX0VMMSB2YWx1ZSwg
S1ZNIGRvIHdvcmxkIHN3aXRjaCwgYW5kIHRoZW4gc2V0IHRoZSBzcGVjaWZpZWQgRVNSX0VMMSdz
IHZhbHVlIHRvIGd1ZXN0IGtlcm5lbC4NCj4gPg0KPiA+IEFoLCBJIHNlZS4gVGhpcyBpcyBhIGJ1
ZyBpbiBvdXIgY3VycmVudCBoYW5kbGluZyBvZiB0aGUgcmVnaXN0ZXINCj4gPiBzdGF0ZSwgd2hl
cmUgd2UgaW1wbGljaXRseSBhc3N1bWUgdGhhdCBub3RoaW5nIGluIFFFTVUgd2lsbCBldmVyIHdh
bnQNCj4gPiB0byBjaGFuZ2UgYW55IHN5c3RlbSByZWdpc3RlciB2YWx1ZXMuIFRoaXMgYXNzdW1w
dGlvbiBpcyBub3cgZmFsc2UgLS0NCj4gPiBrdm1fYXJtX2hhbmRsZV9kZWJ1ZygpIGJyb2tlIGl0
IC0tIHNvIHdlIG5lZWQgdG8gZml4IHRoZSBjb2RlIHRoYXQNCj4gPiBkb2VzIGt2bV9hcmNoX3B1
dF9yZWdpc3RlcnMoKS4gVGhlcmUgaXMgYSBjb21tZW50IGluIHRoZSBrdm0zMi5jDQo+ID4gdmVy
c2lvbiBvZiB0aGF0IGZ1bmN0aW9uIGFib3V0IHRoaXMuIChUaGUga3ZtNjQuYyB2ZXJzaW9uIGhh
cyB0aGUgc2FtZQ0KPiA+IGFzc3VtcHRpb24gYnV0IGRvZXNuJ3QgY29tbWVudCBvbiBpdC4pDQo+
ID4NCj4gPiBXZSBzaG91bGQgKGlkZWFsbHkpIGZpeCB0aGlzIGJ1ZyBpbiB0aGUgY29kZSB0aGF0
IGRvZXMgcmVnaXN0ZXINCj4gPiBzeW5jaW5nLCB3aXRob3V0IHJlcXVpcmluZyBwbGFjZXMgaW4g
UUVNVSB0aGF0IHVwZGF0ZSBzeXN0ZW0gcmVnaXN0ZXJzDQo+ID4gdG8gaGF2ZSB0byBtYW51YWxs
eSBpbmRpY2F0ZSB3aGljaCByZWdpc3RlcnMgdGhleSBoYXZlIGNoYW5nZWQuIEknbGwNCj4gPiBo
YXZlIGEgdGhpbmsgYWJvdXQgaG93IGJlc3QgdG8gZG8gdGhpcy4NCj4gPg0KPiA+PiBBYm91dCB0
aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24sIGFzIHNob3duIGluIFsyXS4NCj4gPj4NCj4gPj4ga3Zt
X2FybV9oYW5kbGVfZGVidWcoKSBkb2VzIG5vdCBuZWVkIHRvIGRvIHRoaXMgYmVjYXVzZSBRRU1V
IGRvZXMgbm90IG5lZWQgdG8gY2hhbmdlIENQMTUgcmVnaXN0ZXJzLCBzdWNoIGFzIEVTUl9FTDEu
DQo+ID4NCj4gPiBrdm1fYXJtX2hhbmRsZV9kZWJ1ZyBkb2VzIGNoYW5nZSBFU1JfRUwxOiBpdCBp
cyBpbmplY3RpbmcgYW4gZXhjZXB0aW9uDQo+ID4gYW5kIHNvIHNob3VsZCBzZXQgdGhlIGV4Y2Vw
dGlvbiByZWdpc3Rlci4gVGhpcyBoYXBwZW5zIHdoZW4gaXQgY2FsbHMNCj4gPiB0aGUgZG9faW50
ZXJydXB0KCkgaG9vaywgYmVjYXVzZSBhcm1fY3B1X2RvX2ludGVycnVwdF9hYXJjaDY0KCkgd3Jp
dGVzDQo+ID4gdG8gZW52LT5jcDE1LmVzcl9lbFtuZXdfZWxdLg0KPiA+DQo+ID4gSSdtIG5vdCBl
bnRpcmVseSBzdXJlIHdoeSB0aGlzIGlzIHdvcmtpbmcgdG9kYXksIGluIGZhY3QuDQo+ID4gQWxl
eCwgZGlkIHlvdSB0ZXN0IHdoZXRoZXIgb3VyIGRlYnVnLWV4Y2VwdGlvbi1pbmplY3Rpb24gcmVw
b3J0cyB0aGUNCj4gPiBjb3JyZWN0IEVTUl9FTDEgdG8gdGhlIGd1ZXN0ID8NCj4gPHNuaXA+DQo+
IA0KPiBJIGRpZCBub3QgLSBJIHdhcyBtb3N0bHkgZm9jdXNpbmcgaW4gdGhlIGhvc3QtZGVidWdn
aW5nLXRoZS1ndWVzdCB0ZXN0IGNhc2UuIEknbGwgZ2V0IGEgdGVzdCByaWcgdXAgYW5kIGNoZWNr
Lg0KDQpUaGFua3MsIHBsZWFzZSB0ZXN0IGl0IGluIHRoZSBLVk0gbW9kZSwgbm90IGluIHRoZSBU
Q0cgbW9kZS4gV2FpdGluZyBmb3IgeW91ciB0ZXN0IHJlc3VsdC4NCg0KPiANCj4gLS0NCj4gQWxl
eCBCZW5uw6llDQo=
