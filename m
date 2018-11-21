Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1792538wrt;
        Wed, 21 Nov 2018 04:19:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VrCIC6muAA6JzGZ40R4E5u2C91JrWSyV0OtH9swrDbOHSAp+7eyGCX+XomZJeoi7J+Cj/G
X-Received: by 2002:a17:902:3225:: with SMTP id y34-v6mr6383641plb.227.1542802757683;
        Wed, 21 Nov 2018 04:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542802757; cv=none;
        d=google.com; s=arc-20160816;
        b=HCVryxAgyxh+7tb0WjXFmzIRZI1Tqb3H86k0pT3nk81b8ZfDmfs890Xvjq5s26IXVW
         vJqbDx38Kr1px00Q0flF5G982XPPL809x8ifo6lAjy4TqGLsbFMJDgvfRV811oZzBJUL
         coz0ayd5YJyDfFiWgopl6kKlE8AHJOnaG2zD6nueciS9G54h4+cWL//E3NiaOurlsJjd
         A4+IuX4LC865fRq+ZYK1MyMkt4Tk1aWuWtSdgb7XgBSS2D/iuJUuT5t3qk6irqr2kGn1
         gNJfaSwrWsydYGjDORjxLebzfGLpgo1mKr5r7ZyTa2VNLjqw8U6q+VzC481VrTVMmhcf
         C9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=2MAUToem/bRSkapeDwFV2UeXJH243YcoceMiqZSg+Yk=;
        b=cjHGflEObxCkdatMpfpth4ipK+62SmjO8i5XIE95eq2lkkmgD4NXBfkiGaf0TIqPc5
         9kc043OOmMWy0WfKAeGIfXRrgAuso+vUl+VCZC6VRzt3E0IIkAOlSkwMx/6hbKLJBolS
         AnRIo4JLOMjJShkHL8A0mnWKEfah15ADGtWL7lI8Q6mt64YpqCE0RJAPnfJ5eQwFbU47
         /ds7saARO+b396Wts1IUYHWdDuJ/b8EdbeXJJgIdXq9w53Lk7yPTs6ox3K3mUZQ44dDx
         tmysaFZU5SBYARtENnE8LFTH1oEY1dCqUOPhnH+XiW2FePhQz67GUIFLb4M6/nR/MokO
         e/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 85si2210637pfc.145.2018.11.21.04.19.17;
        Wed, 21 Nov 2018 04:19:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbeKUWxZ (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Wed, 21 Nov 2018 17:53:25 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:6479 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730016AbeKUWxZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 21 Nov 2018 17:53:25 -0500
Received: from DGGEMA406-HUB.china.huawei.com (unknown [172.30.72.53])
        by Forcepoint Email with ESMTP id 8878DDD95CED3;
        Wed, 21 Nov 2018 20:19:10 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.15]) by
 DGGEMA406-HUB.china.huawei.com ([10.3.20.47]) with mapi id 14.03.0415.000;
 Wed, 21 Nov 2018 20:19:04 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>,
        "zhengxiang (A)" <zhengxiang9@huawei.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH RESEND v15 09/10] hw/arm/virt: Add RAS platform version
 for migration
Thread-Topic: [PATCH RESEND v15 09/10] hw/arm/virt: Add RAS platform version
 for migration
Thread-Index: AdSBlGAV0b0Q7iYMQA2PC2qSN9FW+A==
Date:   Wed, 21 Nov 2018 12:19:03 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201F7B46C@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.80.233]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DwqC2egBPiLX

PiANCj4gT24gOCBOb3ZlbWJlciAyMDE4IGF0IDEwOjI5LCBEb25naml1IEdlbmcgPGdlbmdkb25n
aml1QGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+IFN1cHBvcnQgdGhpcyBmZWF0dXJlIHNpbmNlIHZl
cnNpb24gMi4xMiwgZGlzYWJsZSBpdCBieSBkZWZhdWx0IGluIHRoZQ0KPiA+IG9sZCB2ZXJzaW9u
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uZ2ppdSBHZW5nIDxnZW5nZG9uZ2ppdUBodWF3
ZWkuY29tPg0KPiA+IC0tLQ0KPiA+IEFkZHJlc3MgU2hhbm5vbidzIGNvbW1lbnRzIHRvIGFkZCBw
bGF0Zm9ybSB2ZXJzaW9uIGluIFsxXS4NCj4gPg0KPiA+IFsxXTogaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTcvOC8yNS84MjENCj4gPiAtLS0NCj4gPiAgaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5j
IHwgMTQgKysrKysrKysrLS0tLS0NCj4gPiAgaHcvYXJtL3ZpcnQuYyAgICAgICAgICAgIHwgIDQg
KysrKw0KPiA+ICBpbmNsdWRlL2h3L2FybS92aXJ0LmggICAgfCAgMSArDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMgYi9ody9hcm0vdmlydC1hY3BpLWJ1aWxk
LmMgaW5kZXgNCj4gPiAxOWMxYjdlLi42ZjUwYTI5IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92
aXJ0LWFjcGktYnVpbGQuYw0KPiA+ICsrKyBiL2h3L2FybS92aXJ0LWFjcGktYnVpbGQuYw0KPiA+
IEBAIC04MzYsMTAgKzgzNiwxMSBAQCB2b2lkIHZpcnRfYWNwaV9idWlsZChWaXJ0TWFjaGluZVN0
YXRlICp2bXMsIEFjcGlCdWlsZFRhYmxlcyAqdGFibGVzKQ0KPiA+ICAgICAgYWNwaV9hZGRfdGFi
bGUodGFibGVfb2Zmc2V0cywgdGFibGVzX2Jsb2IpOw0KPiA+ICAgICAgYnVpbGRfc3Bjcih0YWJs
ZXNfYmxvYiwgdGFibGVzLT5saW5rZXIsIHZtcyk7DQo+ID4NCj4gPiAtICAgIGFjcGlfYWRkX3Rh
YmxlKHRhYmxlX29mZnNldHMsIHRhYmxlc19ibG9iKTsNCj4gPiAtICAgIGJ1aWxkX2hhcmR3YXJl
X2Vycm9yX3RhYmxlKHRhYmxlcy0+aGFyZHdhcmVfZXJyb3JzLCB0YWJsZXMtPmxpbmtlcik7DQo+
ID4gLSAgICBidWlsZF9hcGVpX2hlc3QodGFibGVzX2Jsb2IsIHRhYmxlcy0+aGFyZHdhcmVfZXJy
b3JzLCB0YWJsZXMtPmxpbmtlcik7DQo+ID4gLQ0KPiA+ICsgICAgaWYgKCF2bWMtPm5vX3Jhcykg
ew0KPiA+ICsgICAgICAgIGFjcGlfYWRkX3RhYmxlKHRhYmxlX29mZnNldHMsIHRhYmxlc19ibG9i
KTsNCj4gPiArICAgICAgICBidWlsZF9oYXJkd2FyZV9lcnJvcl90YWJsZSh0YWJsZXMtPmhhcmR3
YXJlX2Vycm9ycywgdGFibGVzLT5saW5rZXIpOw0KPiA+ICsgICAgICAgIGJ1aWxkX2FwZWlfaGVz
dCh0YWJsZXNfYmxvYiwgdGFibGVzLT5oYXJkd2FyZV9lcnJvcnMsIHRhYmxlcy0+bGlua2VyKTsN
Cj4gPiArICAgIH0NCj4gDQo+IFRoaXMgbG9va3Mgb2RkLiBJZiB3ZSBuZWVkIHRvIGdhdGUgdGhl
IGFkZGl0aW9uIG9mIHRoZSB0YWJsZSBvbiB3aGV0aGVyIHRoZSBtYWNoaW5lIHR5cGUgYXNrcyBm
b3IgaXQsIHRoZW4gd2UgbmVlZCB0aGUgcGF0Y2ggd2hpY2ggYWRkcyB0aGUNCj4gbm9fcmFzIGZs
YWcgdG8gY29tZSBmaXJzdC4gT3RoZXJ3aXNlIHRoZXJlJ3MgYSBwb2ludCBpbiB0aGUgY29tbWl0
IGhpc3Rvcnkgd2hlcmUgd2UgYWRkIHRoZSB0YWJsZXMgZXZlbiBmb3IgdGhlIG9sZGVyIG1hY2hp
bmUgdHlwZXMuDQoNCk9rLCB0aGFua3MsIEkgd2lsbCBtb3ZlIHRoaXMgcGF0Y2ggdG8gdGhlIGZy
b250Lg0KDQo+IA0KPiA+ICAgICAgaWYgKG5iX251bWFfbm9kZXMgPiAwKSB7DQo+ID4gICAgICAg
ICAgYWNwaV9hZGRfdGFibGUodGFibGVfb2Zmc2V0cywgdGFibGVzX2Jsb2IpOyBAQCAtOTI2LDYg
KzkyNyw3DQo+ID4gQEAgc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX3Zp
cnRfYWNwaV9idWlsZCA9IHsNCj4gPg0KPiA+ICB2b2lkIHZpcnRfYWNwaV9zZXR1cChWaXJ0TWFj
aGluZVN0YXRlICp2bXMpICB7DQo+ID4gKyAgICBWaXJ0TWFjaGluZUNsYXNzICp2bWMgPSBWSVJU
X01BQ0hJTkVfR0VUX0NMQVNTKHZtcyk7DQo+ID4gICAgICBBY3BpQnVpbGRUYWJsZXMgdGFibGVz
Ow0KPiA+ICAgICAgQWNwaUJ1aWxkU3RhdGUgKmJ1aWxkX3N0YXRlOw0KPiA+DQo+ID4gQEAgLTk1
Nyw3ICs5NTksOSBAQCB2b2lkIHZpcnRfYWNwaV9zZXR1cChWaXJ0TWFjaGluZVN0YXRlICp2bXMp
DQo+ID4gICAgICBmd19jZmdfYWRkX2ZpbGUodm1zLT5md19jZmcsIEFDUElfQlVJTERfVFBNTE9H
X0ZJTEUsIHRhYmxlcy50Y3BhbG9nLT5kYXRhLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgIGFj
cGlfZGF0YV9sZW4odGFibGVzLnRjcGFsb2cpKTsNCj4gPg0KPiA+IC0gICAgZ2hlc19hZGRfZndf
Y2ZnKHZtcy0+ZndfY2ZnLCB0YWJsZXMuaGFyZHdhcmVfZXJyb3JzKTsNCj4gPiArICAgIGlmICgh
dm1jLT5ub19yYXMpIHsNCj4gPiArICAgICAgICBnaGVzX2FkZF9md19jZmcodm1zLT5md19jZmcs
IHRhYmxlcy5oYXJkd2FyZV9lcnJvcnMpOw0KPiA+ICsgICAgfQ0KPiA+DQo+ID4gICAgICBidWls
ZF9zdGF0ZS0+cnNkcF9tciA9IGFjcGlfYWRkX3JvbV9ibG9iKGJ1aWxkX3N0YXRlLCB0YWJsZXMu
cnNkcCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEFDUElfQlVJTERfUlNEUF9GSUxFLA0KPiA+IDApOyBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQu
YyBiL2h3L2FybS92aXJ0LmMgaW5kZXggYTJiOGQ4Zi4uMzY3MzA2Yg0KPiA+IDEwMDY0NA0KPiA+
IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9ody9hcm0vdmlydC5jDQo+ID4gQEAgLTE5
MjAsNiArMTkyMCwxMCBAQCBzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfMl8xMV9vcHRpb25zKE1h
Y2hpbmVDbGFzcyAqbWMpDQo+ID4gICAgICB2aXJ0X21hY2hpbmVfMl8xMl9vcHRpb25zKG1jKTsN
Cj4gPiAgICAgIFNFVF9NQUNISU5FX0NPTVBBVChtYywgVklSVF9DT01QQVRfMl8xMSk7DQo+ID4g
ICAgICB2bWMtPnNtYmlvc19vbGRfc3lzX3ZlciA9IHRydWU7DQo+ID4gKyAgICAvKiBEaXNhYmxl
IG1lbW9yeSByZWNvdmVyeSBmZWF0dXJlIGZvciAyLjExIGFzIFJBUyBzdXBwb3J0IHdhcw0KPiA+
ICsgICAgICogaW50cm9kdWNlZCB3aXRoIDIuMTIuDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIHZt
Yy0+bm9fcmFzID0gdHJ1ZTsNCj4gDQo+IFJBUyBzdXBwb3J0IHdhc24ndCBpbnRyb2R1Y2VkIHdp
dGggUUVNVSAyLjEyLCBvciBldmVuIHdpdGggMy4wIG9yIDMuMS4gVGhlIGVhcmxpZXN0IHRoaXMg
d2lsbCBiZSBhZGRlZCB3aWxsIGJlIDQuMCwgc28gd2UgbmVlZCB0byB1cGRhdGUNCj4gdGhpcyBj
b2RlIGFjY29yZGluZ2x5Lg0KDQpHb3QgaXQsIEkgd2lsbCBjaGFuZ2UgaXQgdG8gdGhlIGxhdGVz
dCB2ZXJzaW9uIGluc3RlYWQgb2YgMi4xMi4NCg0KPiANCj4gPiAgfQ0KPiA+ICBERUZJTkVfVklS
VF9NQUNISU5FKDIsIDExKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvYXJtL3Zp
cnQuaCBiL2luY2x1ZGUvaHcvYXJtL3ZpcnQuaCBpbmRleA0KPiA+IDRjYzU3YTcuLmE0NDkwZGQg
MTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9ody9hcm0vdmlydC5oDQo+ID4gKysrIGIvaW5jbHVk
ZS9ody9hcm0vdmlydC5oDQo+ID4gQEAgLTk4LDYgKzk4LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0K
PiA+ICAgICAgYm9vbCBkaXNhbGxvd19hZmZpbml0eV9hZGp1c3RtZW50Ow0KPiA+ICAgICAgYm9v
bCBub19pdHM7DQo+ID4gICAgICBib29sIG5vX3BtdTsNCj4gPiArICAgIGJvb2wgbm9fcmFzOw0K
PiA+ICAgICAgYm9vbCBjbGFpbV9lZGdlX3RyaWdnZXJlZF90aW1lcnM7DQo+ID4gICAgICBib29s
IHNtYmlvc19vbGRfc3lzX3ZlcjsNCj4gPiAgICAgIGJvb2wgbm9faGlnaG1lbV9lY2FtOw0KPiA+
IC0tDQo+ID4gMS44LjMuMQ0KPiA+DQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=
