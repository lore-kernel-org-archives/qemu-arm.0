Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp34753wrt;
        Mon, 26 Nov 2018 09:19:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V0jRw+9dYvyX1FLDLQW+fGH0krz8feMOP+xL9QiKNJzQRxo7Rtc0ZMIZJh/fIIPkEf0QUr
X-Received: by 2002:a17:902:8b88:: with SMTP id ay8mr28949895plb.55.1543252752059;
        Mon, 26 Nov 2018 09:19:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543252752; cv=none;
        d=google.com; s=arc-20160816;
        b=muvdYs1btv6/LleZSW6TH1d6UeFT+/bUs2oSU6hrER4fsJtbBOX0+6L6++UFjOWuhT
         9F+LwT6MDv5kS+21/UnYMpV13B06apadi5S98o7BHhPn5I3iFU9GrhHrRV69heXPtD/F
         rYA/GYvZdPjp6vmdP9/arCTjlhg6B5eongYAxVJ0fkFjEwqOy7YdkjWHxR665gaWIXPl
         KDV10SVKe+fRfMPa+nVHhLrGhuumMax6Gdx31NgstaAXf4uYdq5a3kjvARX/Bvnlmbh8
         r2OblRDNesVEqU+ffd9wu/t19BJyOiTBXIR4Mo1CnAcFUzxb+KOswUVNctduCZ5jO4fa
         Yq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=yJuUkvA8s/t62BLH9aEok/0tp7NJFk2t4r+sJYeeywY=;
        b=vK7B6H9I43nyA3BFhUc0Sz+VqKRuBo6dnT9/6ir/EXAKjujxdjwhn3fhgIu2fjcUpL
         dOvqknrnfBtXZfEWYJIY7DtaSAlsTTgQSKEfuy875t22ojuKcsezBGzlgEOzNJSiMU0Z
         O6MUA0GpD6RneZy0dAKmg487SIkz3taguBQT1dsOO9O91IBnebVqQK4N4WabnhOZwxkp
         rFuT78sjXNBEV75P0hpKYWPB99/ul9Z17OkKgBo8MRF/W/700qswSUnB7TzkGEswiaT2
         5N/yAsJBnNplezB3tlRDPzZz8VP3ZLiUhH8jXYgDecIqysQPO4FMIldz+j06AucKaeFf
         PIVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f124si944717pfa.1.2018.11.26.09.19.11;
        Mon, 26 Nov 2018 09:19:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbeK0ENa (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Mon, 26 Nov 2018 23:13:30 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:6481 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726167AbeK0ENa (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 26 Nov 2018 23:13:30 -0500
Received: from DGGEMA401-HUB.china.huawei.com (unknown [172.30.72.57])
        by Forcepoint Email with ESMTP id D168E260FCB93;
        Tue, 27 Nov 2018 01:18:39 +0800 (CST)
Received: from DGGEMA423-HUB.china.huawei.com (10.1.198.156) by
 DGGEMA401-HUB.china.huawei.com (10.3.20.42) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 27 Nov 2018 01:18:40 +0800
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.51]) by
 dggema423-hub.china.huawei.com ([10.1.198.156]) with mapi id 14.03.0415.000;
 Tue, 27 Nov 2018 01:18:30 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        "zhengxiang (A)" <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH RESEND v15 10/10] target-arm: kvm64: handle
 SIGBUS signal from kernel or KVM
Thread-Topic: [Qemu-arm] [PATCH RESEND v15 10/10] target-arm: kvm64: handle
 SIGBUS signal from kernel or KVM
Thread-Index: AdSFq7wZ10G6NHUzTfGkajVMKF5nZQ==
Date:   Mon, 26 Nov 2018 17:18:29 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201F96E93@dggema523-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.83.99]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WMw9sIAvS5Nj

SGkgUGV0ZXIsDQogICBUaGFua3MgZm9yIHRoZSBjb21tZW50cy4NCg0KPiBPbiBGcmksIDIzIE5v
diAyMDE4IGF0IDE0OjMxLCBnZW5nZG9uZ2ppdSA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiBIaSBQZXRlciwNCj4gPiAgIFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzIGFu
ZCBtYWlsLg0KPiA+DQo+ID4gPg0KPiA+ID4gT24gMjIgTm92ZW1iZXIgMjAxOCBhdCAxMDoyOCwg
UGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiB3cm90ZToNCj4gPiA+ID4g
T24gMjIgTm92ZW1iZXIgMjAxOCBhdCAwMzowNSwgZ2VuZ2RvbmdqaXUgPGdlbmdkb25naml1QGh1
YXdlaS5jb20+IHdyb3RlOg0KPiA+ID4gPj4+ID4NCj4gPiA+ID4+PiBTaG91bGRuJ3QgdGhlcmUg
YmUgc29tZXRoaW5nIGluIGhlcmUgdG8gc2F5ICJvbmx5IHJlcG9ydCB0aGlzIGVycm9yIHRvIHRo
ZSBndWVzdCBpZiB3ZSBhcmUgYWN0dWFsbHkgcmVwb3J0aW5nIFJBUyBlcnJvcnMgdG8gdGhlDQo+
IGd1ZXN0IiA/DQo+ID4gPiA+Pg0KPiA+ID4gPj4gWWVzLCBXZSBjYW4gc2F5IHNvbWV0aGluZyB0
aGF0IHN1Y2ggYXMgInJlcG9ydCB0aGlzIGVycm9yIHRvIHRoZQ0KPiA+ID4gPj4gZ3Vlc3QiLCBi
ZWNhdXNlIHRoaXMgZXJyb3IgaXMgaW5kZWVkIHRyaWdnZXJlZCBieSBndWVzdCwgd2hpY2ggaXMN
Cj4gPiA+ID4+IGd1ZXN0DQo+ID4gPiBlcnJvci4NCj4gPiA+ID4NCj4gPiA+ID4gSSdtIGFmcmFp
ZCBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIENvdWxkIHlvdSB0cnkN
Cj4gPiA+ID4gcmVwaHJhc2luZyBpdD8NCj4gPiA+ID4NCj4gPiA+ID4gTXkgdW5kZXJzdGFuZGlu
ZyB3YXM6DQo+ID4gPiA+ICAqIHdlIGdldCB0aGlzIHNpZ25hbCBpZiB0aGVyZSBpcyBhIFJBUyBl
cnJvciBpbiB0aGUgaG9zdCBtZW1vcnkNCj4gPiA+ID4gICogaWYgd2UgYXJlIGV4cG9zaW5nIFJB
UyBlcnJvcnMgdG8gdGhlIGd1ZXN0IChpZSB3ZSBoYXZlDQo+ID4gPiA+ICAgIHRvbGQgaXQgdGhh
dCBpbiB0aGUgQUNQSSB0YWJsZSB3ZSBwYXNzZWQgaXQgYXQgc3RhcnR1cCkNCj4gPiA+ID4gICAg
dGhlbiB3ZSBzaG91bGQgcGFzcyBvbiB0aGlzIGVycm9yIHRvIHRoZSBndWVzdA0KPiA+ID4gPg0K
PiA+ID4gPiBidXQgdGhhdCB0aGVzZSBhcmUgdHdvIGRpZmZlcmVudCBjb25kaXRpb25zLg0KPiA+
ID4gPg0KPiA+ID4gPiBJZiB0aGUgaG9zdCBoYXJkd2FyZSBkZXRlY3RzIGEgUkFTIGVycm9yIGlu
IG1lbW9yeSB1c2VkIGJ5IHRoZQ0KPiA+ID4gPiBndWVzdCBidXQgdGhlIGd1ZXN0IGlzIG5vdCBi
ZWluZyB0b2xkIGFib3V0IFJBUyBlcnJvcnMsIHRoZW4gd2UNCj4gPiA+ID4gY2Fubm90IHJlcG9y
dCB0aGUgZXJyb3I6IHdlIGhhdmUgbm8gbWVjaGFuaXNtIHRvIGRvIHNvLCBhbmQgdGhlDQo+ID4g
PiA+IGd1ZXN0IGlzIG5vdCBleHBlY3RpbmcgaXQuDQo+ID4gPg0KPiA+ID4gSWYgeW91IGxvb2sg
YXQgdGhlIHg4NiB2ZXJzaW9uIG9mIHRoaXMgZnVuY3Rpb24geW91IGNhbiBzZWUgdGhhdCBpdA0K
PiA+ID4gdGVzdHMgKGVudi0+bWNnX2NhcCAmIE1DR19TRVJfUCksIHdoaWNoIEkgdGhpbmsgaXMg
dGhlIGVxdWl2YWxlbnQgeDg2ICJpcyB0aGUgZ3Vlc3QgQ1BVL2NvbmZpZyBvbmUgd2UgY2FuIHJl
cG9ydCB0aGVzZSBlcnJvcnMgdG8iDQo+IHRlc3QuDQo+ID4NCj4gPiBNQ0dfU0VSX1AgKHNvZnR3
YXJlIGVycm9yIHJlY292ZXJ5IHN1cHBvcnQgcHJlc2VudCkgZmxhZyBpbmRpY2F0ZXMgKHdoZW4g
c2V0KSB0aGF0IHRoZSBwcm9jZXNzb3Igc3VwcG9ydHMgc29mdHdhcmUgZXJyb3IgcmVjb3Zlcnku
DQo+ID4gZW52LT5tY2dfY2FwICdzIHZhbHVlIHNob3VsZCBiZSBnb3QgZnJvbSBLVk0gYXMgc2hv
d24gaW4gdGhlIFFFTVUgY29kZVsxXSwgaXQgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIEtWTSBzdXBw
b3J0IHNvZnR3YXJlIGVycm9yDQo+IHJlY292ZXJ5Lg0KPiA+DQo+ID4gWzFdOg0KPiA+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIHJl
dCA9IGt2bV9nZXRfbWNlX2NhcF9zdXBwb3J0ZWQoY3MtPmt2bV9zdGF0ZSwgJm1jZ19jYXAsICZi
YW5rcyk7DQo+ID4gICBpZiAocmV0IDwgMCkgew0KPiA+ICAgICAgICBmcHJpbnRmKHN0ZGVyciwg
Imt2bV9nZXRfbWNlX2NhcF9zdXBwb3J0ZWQ6ICVzIiwgc3RyZXJyb3IoLXJldCkpOw0KPiA+ICAg
ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAgICB9DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gWWVzLCBidXQgaWYg
eW91IGxvb2sgYXQgdGhlIGNvZGUgd2hpY2ggY2FsbHMgdGhhdCwgaXQgZ29lcyBvbiB0byBkbzoN
Cj4gICAgICAgICBlbnYtPm1jZ19jYXAgJj0gbWNnX2NhcCB8IE1DR19DQVBfQkFOS1NfTUFTSzsN
Cj4gDQo+IHdoaWNoIG1lYW5zIHRoYXQgaWYgdGhlIGhvc3Qga2VybmVsIGRvZXMgbm90IHN1cHBv
cnQgdGhpcyBmZWF0dXJlIHRoZW4gd2Ugd2lsbCBjbGVhciB0aG9zZSBiaXRzIGluIHRoZSBlbnYt
Pm1jZ19jYXAgZmllbGQsIHNvIHdlIGRvIG5vdA0KPiBhZHZlcnRpc2UgaXQgdG8gdGhlIGd1ZXN0
LiBCdXQgd2UgbWlnaHQgYmUgbm90IGFkdmVydGlzaW5nIGl0IHRvIHRoZSBndWVzdCBhdCBhbGws
IGlmIGVudi0+bWNnX2NhcCB3YXMgMCBiZWZvcmUgdGhpcyBjb2RlIHdhcyBjYWxsZWQuIFRoYXQN
Cj4gaGFwcGVucyBpZiB3ZSBhcmUgcHJlc2VudGluZyB0aGUgZ3Vlc3Qgd2l0aCBhIGd1ZXN0IENQ
VSB0eXBlIHdoaWNoIGRvZXMgbm90IGhhdmUgdGhlIGZlYXR1cmUuDQoNClNvIHlvdSBtZWFuICJl
bnYtPm1jZ19jYXAiIHVzZXMgYSBiaXQgdG8gaW5kaWNhdGUgdGhhdCB3aGV0aGVyIGd1ZXN0IENQ
VSBzdXBwb3J0IGVycm9yIHJlY292ZXJ5LCByaWdodD8gSWYgc28sIGhvdyB3ZSBrbm93IHdoZXRo
ZXIgZ3Vlc3QgQ1BVIGhhdmUgdGhpcyBmZWF0dXJlPw0KU2hvdWxkIHdlIGluaXRpYWxpemVkIE1D
R19TRVJfUCBiaXQgb2YgZW52LT5tY2dfY2FwIHRvIDEgb3IgMCBiZWZvcmUgaW5pdGlhbGl6aW5n
IHRoZSB2Y3B1PyAgUGxlYXNlIHRvZ2V0aGVyIHNlZSB0aGUgcmVwbHkgaW4gdGhlIFsyXSwgdGhh
bmtzLg0KDQoNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gdm9pZCBrdm1fYXJjaF9vbl9zaWdidXNfdmNwdShDUFVTdGF0ZSAq
YywgaW50IGNvZGUsIHZvaWQgKmFkZHIpIHsNCj4gPiAgICAgICAgIC4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLg0KPiA+DQo+ID4gICAgICAgICBpZiAocmFtX2FkZHIgIT0gUkFNX0FERFJfSU5W
QUxJRCAmJg0KPiA+ICAgICAgICAgICAgIGt2bV9waHlzaWNhbF9tZW1vcnlfYWRkcl9mcm9tX2hv
c3QoYy0+a3ZtX3N0YXRlLCBhZGRyLA0KPiA+ICZwYWRkcikpIHsNCj4gPg0KPiA+ICAgSWYgaXQg
Z290IHRvIGhlcmUsIGl0IG1lYW5zIHRoZSBob3N0IGhhcmR3YXJlIGRldGVjdHMgYSBSQVMgZXJy
b3IgaW4gbWVtb3J5IHVzZWQgYnkgdGhlIGd1ZXN0IHVzaW5nIGFib3ZlIHR3byBqdWRnbWVudHMu
DQo+ID4gICBNYXliZSB3ZSBjYW4gdGVzdC9jaGVjayB3aGV0aGVyIEtWTSBzdXBwb3J0cyBzb2Z0
d2FyZSBlcnJvciByZWNvdmVyeQ0KPiA+IGluIFszXQ0KPiA+DQo+IA0KPiBUaGUgcXVlc3Rpb24g
aXMgbm90ICJkb2VzIHRoZSBob3N0IENQVSAvIEtWTSBzdXBwb3J0IGVycm9yIHJlcG9ydGluZyIu
IEl0IGlzICJkb2VzIHRoZSAqZ3Vlc3QqIENQVSAvIHN5c3RlbSBzdXBwb3J0IGVycm9yIHJlcG9y
dGluZyIuDQo+IFRoZXNlIGFyZSBkaXN0aW5jdCBxdWVzdGlvbnMgd2hpY2ggbWF5IG5vdCBoYXZl
IHRoZSBzYW1lIGFuc3dlci4NCg0KWzJdOg0KQnV0IFFFTVUgc2hvdWxkIG5vdCBrbm93IHdoZXRo
ZXIgKmd1ZXN0KiBDUFUgLyBzeXN0ZW0gc3VwcG9ydCBlcnJvciByZXBvcnRpbmcuIEZyb20gbXkg
dW5kZXJzdGFuZGluZywgaW4gdGhlIFg4NiBwbGF0Zm9ybSwgaWYgaG9zdCBDUFUgLyBLVk0gc3Vw
cG9ydCBlcnJvciByZXBvcnRpbmcsDQp0aGVuIGl0IHdpbGwgdGhpbmsgZ3Vlc3QgQ1BVIHN1cHBv
cnRzIGVycm9yIHJlcG9ydGluZywgYW5kIHNldCB0aGUgTUNHX1NFUl9QIGJpdCBvZiBlbnYtPm1j
Z19jYXAgdG8gMSANCg0KPiANCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==
