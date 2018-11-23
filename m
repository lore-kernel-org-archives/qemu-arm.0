Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2108385wrt;
        Fri, 23 Nov 2018 06:31:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5cJMIyEyCmh4NgP/kkyXEp6XbMFH0ibKK7LIPFC4Q43ZSX0jIaX2Cc5Yf78D77O+JyM2Iaq
X-Received: by 2002:a62:85:: with SMTP id 127-v6mr16010325pfa.24.1542983490230;
        Fri, 23 Nov 2018 06:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542983490; cv=none;
        d=google.com; s=arc-20160816;
        b=L5SZZS012EcfW+JcxGyyc8PDq0EHhSPOi0FeXLgISZd1oLhEsMQdxeqSTyy4sayDoV
         LcNnYKoBRzN1wobafusQ3TMCXSaY/2/nPEA6CZhVSpOsTQlPR8fit/ptJMGm5WQ1p3nO
         +hf9MQlfcV+RUjpOw+xcXwlhM60XuUnOJUJhdDwbJiZjA0729Ft6qQL9/XN3mFvZr63o
         cgvLFMXiGMCHMKcN/kD2vcNm21qQzYc45uzE3Ae5dHCh28rH5W5oZxSRO9WEYj7xVfRr
         NhSR8eqJb8bideFx+T20E1Bf9JifVuTzO247sOzQTDAeHJzSAejr/rlu0NaFiVgFxLXQ
         GFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=y/PmVPSyejj5AhQkB5Sa6iTew0b7rbegWRboUgKPVd8=;
        b=nf9fqIzMVkfOrWbt2OEb7UGn9zv5TnzIdhBbKdoI/DsUR6YBXLOhwD99OuVL/tKFyV
         qcOyIulyf+pVTYm+UcKj691l9D1ODSLN7GYe/Rvltkxehi/S2tU10EwEhYFi0Bu75wZn
         kBDaZ19NCmQars2bQXKD5+IbQGBNS4zeaLiu1MGfDTAy58nFzBnmBtAwCV1a2V2OcLbE
         CQR4Txd4woRb+dv3ZCVbSOc2gFp5nSK/sWAqzRqdVUrifri0/5TiNSepO1qjNQ6DA6Ef
         na6Nz9aXV63+yEtGtQ5Le8vmFTconGtOnM2CFqiYap6SB3fuh3mjiaVOITRf1aQEB5hi
         zj+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id o9-v6si44743135plk.434.2018.11.23.06.31.30;
        Fri, 23 Nov 2018 06:31:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410078AbeKXBPx (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Fri, 23 Nov 2018 20:15:53 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:55179 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391009AbeKXBPw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 23 Nov 2018 20:15:52 -0500
Received: from DGGEMA403-HUB.china.huawei.com (unknown [172.30.72.53])
        by Forcepoint Email with ESMTP id DB34CC99A58AF;
        Fri, 23 Nov 2018 22:31:24 +0800 (CST)
Received: from DGGEMA421-HUB.china.huawei.com (10.1.198.154) by
 DGGEMA403-HUB.china.huawei.com (10.3.20.44) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 23 Nov 2018 22:31:24 +0800
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.15]) by
 dggema421-hub.china.huawei.com ([10.1.198.154]) with mapi id 14.03.0415.000;
 Fri, 23 Nov 2018 22:31:18 +0800
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
Subject: Re: [PATCH RESEND v15 10/10] target-arm: kvm64: handle SIGBUS
 signal from kernel or KVM
Thread-Topic: [PATCH RESEND v15 10/10] target-arm: kvm64: handle SIGBUS
 signal from kernel or KVM
Thread-Index: AdSDLl0YYjb7JecJR5WF7YY6N7u3rQ==
Date:   Fri, 23 Nov 2018 14:31:18 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201F85395@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.83.70]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xscqw7p1gWrC

SGkgUGV0ZXIsDQogIFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzIGFuZCBtYWlsLg0KDQo+IA0KPiBP
biAyMiBOb3ZlbWJlciAyMDE4IGF0IDEwOjI4LCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+IE9uIDIyIE5vdmVtYmVyIDIwMTggYXQgMDM6MDUsIGdl
bmdkb25naml1IDxnZW5nZG9uZ2ppdUBodWF3ZWkuY29tPiB3cm90ZToNCj4gPj4+ID4NCj4gPj4+
IFNob3VsZG4ndCB0aGVyZSBiZSBzb21ldGhpbmcgaW4gaGVyZSB0byBzYXkgIm9ubHkgcmVwb3J0
IHRoaXMgZXJyb3IgdG8gdGhlIGd1ZXN0IGlmIHdlIGFyZSBhY3R1YWxseSByZXBvcnRpbmcgUkFT
IGVycm9ycyB0byB0aGUgZ3Vlc3QiID8NCj4gPj4NCj4gPj4gWWVzLCBXZSBjYW4gc2F5IHNvbWV0
aGluZyB0aGF0IHN1Y2ggYXMgInJlcG9ydCB0aGlzIGVycm9yIHRvIHRoZSBndWVzdCIsIGJlY2F1
c2UgdGhpcyBlcnJvciBpcyBpbmRlZWQgdHJpZ2dlcmVkIGJ5IGd1ZXN0LCB3aGljaCBpcyBndWVz
dA0KPiBlcnJvci4NCj4gPg0KPiA+IEknbSBhZnJhaWQgSSBkb24ndCByZWFsbHkgdW5kZXJzdGFu
ZCB3aGF0IHlvdSBtZWFuLiBDb3VsZCB5b3UgdHJ5DQo+ID4gcmVwaHJhc2luZyBpdD8NCj4gPg0K
PiA+IE15IHVuZGVyc3RhbmRpbmcgd2FzOg0KPiA+ICAqIHdlIGdldCB0aGlzIHNpZ25hbCBpZiB0
aGVyZSBpcyBhIFJBUyBlcnJvciBpbiB0aGUgaG9zdCBtZW1vcnkNCj4gPiAgKiBpZiB3ZSBhcmUg
ZXhwb3NpbmcgUkFTIGVycm9ycyB0byB0aGUgZ3Vlc3QgKGllIHdlIGhhdmUNCj4gPiAgICB0b2xk
IGl0IHRoYXQgaW4gdGhlIEFDUEkgdGFibGUgd2UgcGFzc2VkIGl0IGF0IHN0YXJ0dXApDQo+ID4g
ICAgdGhlbiB3ZSBzaG91bGQgcGFzcyBvbiB0aGlzIGVycm9yIHRvIHRoZSBndWVzdA0KPiA+DQo+
ID4gYnV0IHRoYXQgdGhlc2UgYXJlIHR3byBkaWZmZXJlbnQgY29uZGl0aW9ucy4NCj4gPg0KPiA+
IElmIHRoZSBob3N0IGhhcmR3YXJlIGRldGVjdHMgYSBSQVMgZXJyb3IgaW4gbWVtb3J5IHVzZWQg
YnkgdGhlIGd1ZXN0DQo+ID4gYnV0IHRoZSBndWVzdCBpcyBub3QgYmVpbmcgdG9sZCBhYm91dCBS
QVMgZXJyb3JzLCB0aGVuIHdlIGNhbm5vdA0KPiA+IHJlcG9ydCB0aGUgZXJyb3I6IHdlIGhhdmUg
bm8gbWVjaGFuaXNtIHRvIGRvIHNvLCBhbmQgdGhlIGd1ZXN0IGlzIG5vdA0KPiA+IGV4cGVjdGlu
ZyBpdC4NCj4gDQo+IElmIHlvdSBsb29rIGF0IHRoZSB4ODYgdmVyc2lvbiBvZiB0aGlzIGZ1bmN0
aW9uIHlvdSBjYW4gc2VlIHRoYXQgaXQgdGVzdHMgKGVudi0+bWNnX2NhcCAmIE1DR19TRVJfUCks
IHdoaWNoIEkgdGhpbmsgaXMgdGhlIGVxdWl2YWxlbnQgeDg2ICJpcw0KPiB0aGUgZ3Vlc3QgQ1BV
L2NvbmZpZyBvbmUgd2UgY2FuIHJlcG9ydCB0aGVzZSBlcnJvcnMgdG8iIHRlc3QuDQoNCk1DR19T
RVJfUCAoc29mdHdhcmUgZXJyb3IgcmVjb3Zlcnkgc3VwcG9ydCBwcmVzZW50KSBmbGFnIGluZGlj
YXRlcyAod2hlbiBzZXQpIHRoYXQgdGhlIHByb2Nlc3NvciBzdXBwb3J0cyBzb2Z0d2FyZSBlcnJv
ciByZWNvdmVyeS4NCmVudi0+bWNnX2NhcCAncyB2YWx1ZSBzaG91bGQgYmUgZ290IGZyb20gS1ZN
IGFzIHNob3duIGluIHRoZSBRRU1VIGNvZGVbMV0sIGl0IGluZGljYXRlcyB3aGV0aGVyIHRoZSBL
Vk0gc3VwcG9ydCBzb2Z0d2FyZSBlcnJvciByZWNvdmVyeS4NCg0KWzFdOg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KICByZXQgPSBrdm1fZ2V0
X21jZV9jYXBfc3VwcG9ydGVkKGNzLT5rdm1fc3RhdGUsICZtY2dfY2FwLCAmYmFua3MpOw0KICBp
ZiAocmV0IDwgMCkgew0KICAgICAgIGZwcmludGYoc3RkZXJyLCAia3ZtX2dldF9tY2VfY2FwX3N1
cHBvcnRlZDogJXMiLCBzdHJlcnJvcigtcmV0KSk7DQogICAgICAgICAgIHJldHVybiByZXQ7DQog
ICB9DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQoNCg0KDQoNCg0KWzJdOg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCnZvaWQga3ZtX2FyY2hfb25fc2lnYnVzX3ZjcHUoQ1BVU3RhdGUgKmMs
IGludCBjb2RlLCB2b2lkICphZGRyKQ0Kew0KICAgICAgICAuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4NCg0KICAgICAgICBpZiAocmFtX2FkZHIgIT0gUkFNX0FERFJfSU5WQUxJRCAmJg0KICAg
ICAgICAgICAga3ZtX3BoeXNpY2FsX21lbW9yeV9hZGRyX2Zyb21faG9zdChjLT5rdm1fc3RhdGUs
IGFkZHIsICZwYWRkcikpIHsNCiAgICAgICAgICAgIA0KICBJZiBpdCBnb3QgdG8gaGVyZSwgaXQg
bWVhbnMgdGhlIGhvc3QgaGFyZHdhcmUgZGV0ZWN0cyBhIFJBUyBlcnJvciBpbiBtZW1vcnkgdXNl
ZCBieSB0aGUgZ3Vlc3QgdXNpbmcgYWJvdmUgdHdvIGp1ZGdtZW50cy4NCiAgTWF5YmUgd2UgY2Fu
IHRlc3QvY2hlY2sgd2hldGhlciBLVk0gc3VwcG9ydHMgc29mdHdhcmUgZXJyb3IgcmVjb3Zlcnkg
aW4gWzNdDQogICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgfQ0KICAgICAgICAg
ICAgcmV0dXJuOw0KICAgICAgICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KICAgICAg
ICB9DQp9DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCg0KWzNdOg0KSWYgd2UgY2hlY2sgaXQgYXMgeDg2LCB3ZSBjYW4gY2hlY2sgdGhhdCB3
aGV0aGVyIEtWTSBzdXBwb3J0cyBzb2Z0d2FyZSByZWNvdmVyeSB0aG91Z2ggSU9DVEwsIGZvciBl
eGFtcGxlLg0KDQppbnQgciA9IGt2bV9pb2N0bChzLCBYWFhYWFhfR0VUX1NFUl9DQVBfU1VQUE9S
VEVELCBzZWdfY2FwKTsNCi0tLS0tLS0tLS0tLS0tDQppZiAoc2VnX2NhcCAmJiBhZGRyKSB7DQog
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCn0NCg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K
