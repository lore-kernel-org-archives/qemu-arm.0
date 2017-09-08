Received: by 10.223.172.38 with SMTP id v35csp1683006wrc;
        Fri, 8 Sep 2017 07:28:04 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4XFljSxe9NLCr9ZDvbPPSpcXk1hVmNyOGT8+98uE9G665zX7gA91MOgOFoaFYgG5Pj2FPU
X-Received: by 10.99.182.78 with SMTP id v14mr3398327pgt.325.1504880884133;
        Fri, 08 Sep 2017 07:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504880884; cv=none;
        d=google.com; s=arc-20160816;
        b=auOzIxFNJay9zB19SBJUfK4t7AIfzHWfiq0/PT1miYrXlMk7XYB6gSJGSSCWLbKD6X
         YxfjrhJyk35iOt3igs8/nEpwDTHoQk1pq5XCRb7sSV9A2kPgk1rfeAsSpHhQMK6lcVXw
         0TN33SHZ5bc3n7C35qpzyrmyPX2QoDhjGVfQ5zvOyhxWxBFqePxDVcWsIQpWgKZlXmRB
         uvyjjzJkHgH5bK83bTgFQnTgik8YteDoDAD1qkDPtjvh0A0w6F1vj9aHcIufnbFrc0QK
         lbtNkNVgcTrutyAO7nIiVQ4Beed/dxA1HwxU8iKQK7wrnG/Fd5VRIP2yWjM4e0dWvgYl
         TT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:arc-authentication-results;
        bh=vL3HBI6hwD4v9C9nXOurI5rTUjG7xsp1RE/i7zMLYII=;
        b=JrIYoHDPM987c0ha2amGPWUpsaIGQeerP+p+liXh9EUrRYcTYHm7GgmDENz1GtYXQ/
         3l90i/XzVFl9N92sF9RW+GF5Sifu8UyPVS1qz4GUaXaBvP/Dd4PZ12b5r3zQbCxxQJIY
         2P26wMppqCtDDzgoT/EMK7oH7RRFF+mrQnhpNnpf6zwfrKWrQOpytXj2yY/tqtL5X0Pi
         pU/KW9yGC3IZ9/WGOUtAa9kPWxP4MVbkG+4RtkIOp/WGvmPp0A8KBNMi1GlCL/RVvCn6
         Bq8ps9Vpv9AN27p6p3093iPFMUFBjx7jQfVghE1skVYbMcUW/ADYi8243qqyH3Q2XTJ0
         MCdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c1si1730366plk.408.2017.09.08.07.28.03;
        Fri, 08 Sep 2017 07:28:04 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756161AbdIHO2B (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 8 Sep 2017 10:28:01 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:11767 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755569AbdIHO1y (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 8 Sep 2017 10:27:54 -0400
Received: from 172.30.72.57 (EHLO DGGEMA405-HUB.china.huawei.com) ([172.30.72.57])
        by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id AWA59147;
        Fri, 08 Sep 2017 22:27:11 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.143]) by
 DGGEMA405-HUB.china.huawei.com ([10.3.20.46]) with mapi id 14.03.0301.000;
 Fri, 8 Sep 2017 22:26:59 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Zhaoshenglong <zhaoshenglong@huawei.com>,
        "Paolo Bonzini" <pbonzini@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "Will Deacon" <will.deacon@arm.com>,
        James Morse <james.morse@arm.com>,
        Tyler Baicar <tbaicar@codeaurora.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Ingo Molnar" <mingo@kernel.org>, "bp@suse.de" <bp@suse.de>,
        Shiju Jose <shiju.jose@huawei.com>,
        "zjzhang@codeaurora.org" <zjzhang@codeaurora.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        "lkml - Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        "John Garry" <john.garry@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>,
        "Wangzhou (B)" <wangzhou1@hisilicon.com>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        Wuquanming <wuquanming@huawei.com>,
        Linuxarm <linuxarm@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>
Subject: Re: [PATCH v11 4/6] target-arm: kvm64: detect guest RAS EXTENSION
 feature
Thread-Topic: [PATCH v11 4/6] target-arm: kvm64: detect guest RAS EXTENSION
 feature
Thread-Index: AdMop0zlouCLF3RfQKKP0rckbM+0Iw==
Date:   Fri, 8 Sep 2017 14:26:59 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F2015F5973@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.61.121]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A0B0201.59B2A8C0.0173,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=169.254.1.143,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9227055aee3b93ee7963f2038e4654c0
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: NExTHE0aK+mv

SGkgUGV0ZXIsDQogIFNvcnJ5IGZvciBteSBsYXRlIHJlc3BvbnNlLg0KDQo+IA0KPiBPbiAxOCBB
dWd1c3QgMjAxNyBhdCAxNToyMywgRG9uZ2ppdSBHZW5nIDxnZW5nZG9uZ2ppdUBodWF3ZWkuY29t
PiB3cm90ZToNCj4gPiBjaGVjayBpZiBrdm0gc3VwcG9ydHMgZ3Vlc3QgUkFTIEVYVEVOU0lPTi4g
aWYgc28sIHNldCBjb3JyZXNwb25kaW5nDQo+ID4gZmVhdHVyZSBiaXQgZm9yIHZjcHUuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25naml1IEdlbmcgPGdlbmdkb25naml1QGh1YXdlaS5jb20+
DQo+ID4gLS0tDQo+ID4gIGxpbnV4LWhlYWRlcnMvbGludXgva3ZtLmggfCAxICsNCj4gPiAgdGFy
Z2V0L2FybS9jcHUuaCAgICAgICAgICB8IDMgKysrDQo+ID4gIHRhcmdldC9hcm0va3ZtNjQuYyAg
ICAgICAgfCA4ICsrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpbnV4LWhlYWRlcnMvbGludXgva3ZtLmggYi9saW51
eC1oZWFkZXJzL2xpbnV4L2t2bS5oDQo+ID4gaW5kZXggNzk3MWE0Zi4uMmFhMTc2ZSAxMDA2NDQN
Cj4gPiAtLS0gYS9saW51eC1oZWFkZXJzL2xpbnV4L2t2bS5oDQo+ID4gKysrIGIvbGludXgtaGVh
ZGVycy9saW51eC9rdm0uaA0KPiA+IEBAIC05MjksNiArOTI5LDcgQEAgc3RydWN0IGt2bV9wcGNf
cmVzaXplX2hwdCB7ICAjZGVmaW5lDQo+ID4gS1ZNX0NBUF9QUENfU01UX1BPU1NJQkxFIDE0NyAg
I2RlZmluZSBLVk1fQ0FQX0hZUEVSVl9TWU5JQzIgMTQ4DQo+ID4gI2RlZmluZSBLVk1fQ0FQX0hZ
UEVSVl9WUF9JTkRFWCAxNDkNCj4gPiArI2RlZmluZSBLVk1fQ0FQX0FSTV9SQVNfRVhURU5TSU9O
IDE1MA0KPiA+DQo+ID4gICNpZmRlZiBLVk1fQ0FQX0lSUV9ST1VUSU5HDQo+ID4NCj4gDQo+IEhp
LiBDaGFuZ2VzIHRvIGxpbnV4LWhlYWRlcnMgbmVlZCB0byBiZSBkb25lIGFzIGEgcGF0Y2ggb2Yg
dGhlaXIgb3duIGNyZWF0ZWQgdXNpbmcgc2NyaXB0cy91cGRhdGUtbGludXgtaGVhZGVycy5zaCBy
dW4gYWdhaW5zdCBhIG1haW5saW5lDQo+IGtlcm5lbCB0cmVlIChhbmQgd2l0aCBhIGNvbW1pdCBt
ZXNzYWdlIHRoYXQgcXVvdGVzIHRoZSBrZXJuZWwgY29tbWl0IGhhc2ggdXNlZCkuIFRoaXMgZW5z
dXJlcyB0aGF0IHdlIGhhdmUgYSBjb25zaXN0ZW50IHNldCBvZiBoZWFkZXJzDQo+IHRoYXQgZG9u
J3QgZGl2ZXJnZSBmcm9tIHRoZSBrZXJuZWwgY29weS4NClN1cmUsIEkgd2lsbCwgdGhhbmtzIGEg
bG90IGZvciB5b3VyIHJlbWluZGVyLg0KDQo+IA0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJt
L2NwdS5oIGIvdGFyZ2V0L2FybS9jcHUuaCBpbmRleA0KPiA+IGIzOWQ2NGEuLjZiMDk2MWIgMTAw
NjQ0DQo+ID4gLS0tIGEvdGFyZ2V0L2FybS9jcHUuaA0KPiA+ICsrKyBiL3RhcmdldC9hcm0vY3B1
LmgNCj4gPiBAQCAtNjExLDYgKzYxMSw4IEBAIHN0cnVjdCBBUk1DUFUgew0KPiA+DQo+ID4gICAg
ICAvKiBDUFUgaGFzIG1lbW9yeSBwcm90ZWN0aW9uIHVuaXQgKi8NCj4gPiAgICAgIGJvb2wgaGFz
X21wdTsNCj4gPiArICAgIC8qIENQVSBoYXMgcmFzIGV4dGVuc2lvbiB1bml0ICovDQo+ID4gKyAg
ICBib29sIGhhc19yYXNfZXh0ZW5zaW9uOw0KPiA+ICAgICAgLyogUE1TQXY3IE1QVSBudW1iZXIg
b2Ygc3VwcG9ydGVkIHJlZ2lvbnMgKi8NCj4gPiAgICAgIHVpbnQzMl90IHBtc2F2N19kcmVnaW9u
Ow0KPiA+DQo+ID4gQEAgLTEyMjksNiArMTIzMSw3IEBAIGVudW0gYXJtX2ZlYXR1cmVzIHsNCj4g
PiAgICAgIEFSTV9GRUFUVVJFX1RIVU1CX0RTUCwgLyogRFNQIGluc25zIHN1cHBvcnRlZCBpbiB0
aGUgVGh1bWIgZW5jb2RpbmdzICovDQo+ID4gICAgICBBUk1fRkVBVFVSRV9QTVUsIC8qIGhhcyBQ
TVUgc3VwcG9ydCAqLw0KPiA+ICAgICAgQVJNX0ZFQVRVUkVfVkJBUiwgLyogaGFzIGNwMTUgVkJB
UiAqLw0KPiA+ICsgICAgQVJNX0ZFQVRVUkVfUkFTX0VYVEVOU0lPTiwgLypoYXMgUkFTIGV4dGVu
c2lvbiBzdXBwb3J0ICovDQo+IA0KPiBNaXNzaW5nIHNwYWNlIGFmdGVyICcvKicgPw0KWWVzLCB0
aGFua3MgZm9yIHRoZSBwb2ludGluZyBvdXQuDQoNCj4gDQo+ID4gIH07DQo+ID4NCj4gPiAgc3Rh
dGljIGlubGluZSBpbnQgYXJtX2ZlYXR1cmUoQ1BVQVJNU3RhdGUgKmVudiwgaW50IGZlYXR1cmUp
IGRpZmYNCj4gPiAtLWdpdCBhL3RhcmdldC9hcm0va3ZtNjQuYyBiL3RhcmdldC9hcm0va3ZtNjQu
YyBpbmRleCBhMTZhYmM4Li4wNzgxMzY3DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvdGFyZ2V0L2Fy
bS9rdm02NC5jDQo+ID4gKysrIGIvdGFyZ2V0L2FybS9rdm02NC5jDQo+ID4gQEAgLTUxOCw2ICs1
MTgsMTQgQEAgaW50IGt2bV9hcmNoX2luaXRfdmNwdShDUFVTdGF0ZSAqY3MpDQo+ID4gICAgICAg
ICAgdW5zZXRfZmVhdHVyZSgmZW52LT5mZWF0dXJlcywgQVJNX0ZFQVRVUkVfUE1VKTsNCj4gPiAg
ICAgIH0NCj4gPg0KPiA+ICsgICAgaWYgKGt2bV9jaGVja19leHRlbnNpb24oY3MtPmt2bV9zdGF0
ZSwgS1ZNX0NBUF9BUk1fUkFTX0VYVEVOU0lPTikpIHsNCj4gPiArICAgICAgICBjcHUtPmhhc19y
YXNfZXh0ZW5zaW9uID0gdHJ1ZTsNCj4gPiArICAgICAgICBzZXRfZmVhdHVyZSgmZW52LT5mZWF0
dXJlcywgQVJNX0ZFQVRVUkVfUkFTX0VYVEVOU0lPTik7DQo+ID4gKyAgICB9IGVsc2Ugew0KPiA+
ICsgICAgICAgIGNwdS0+aGFzX3Jhc19leHRlbnNpb24gPSBmYWxzZTsNCj4gPiArICAgICAgICB1
bnNldF9mZWF0dXJlKCZlbnYtPmZlYXR1cmVzLCBBUk1fRkVBVFVSRV9SQVNfRVhURU5TSU9OKTsN
Cj4gPiArICAgIH0NCj4gPiArDQo+IA0KPiBTaG91bGRuJ3Qgd2UgbmVlZCB0byBhbHNvIHRlbGwg
dGhlIGtlcm5lbCB0aGF0IHdlIGFjdHVhbGx5IHdhbnQgaXQgdG8gZXhwb3NlIFJBUyB0byB0aGUg
Z3Vlc3Q/IENvbXBhcmUgdGhlIFBNVSBjb2RlIGluIHRoaXMgZnVuY3Rpb24sDQo+IHdoZXJlIHdl
IHNldCBhIGt2bV9pbml0X2ZlYXR1cmVzIGJpdCB0byBkbyB0aGlzLg0KPiAoVGhpcyBzdWdnZXN0
cyB0aGF0IHlvdXIgQUJJIGZvciB0aGUga2VybmVsIHBhcnQgb2YgdGhpcyBmZWF0dXJlIG1heSBu
b3QgYmUgY29ycmVjdD8pDQoNCkluIHRoZSBQTVUgY29kZSwgaXQgaW5kZWVkIHNldHMgYSBrdm1f
aW5pdF9mZWF0dXJlcyBiaXQuIEhlcmUgQVJNIEphbWVzIGhhcyBhIGNvbmNlcm4gdGhhdCB3ZSBh
cmUgZGVwZW5kIG9uIHRoZSBob3N0IENQVSBSQVMgZXh0ZW5zaW9uLA0KSGUgbWVhbnMgdGhhdCBp
ZiB1c2Vyc3BhY2UgcmVjZWl2ZXMgdGhlIFNJR0JVUyBkZWxpdmVyZWQgYnkgaG9zdCBtZW1vcnlf
ZmFpbHVyZSgpLCB1c2VyIHNwYWNlIHNob3VsZCByZWNvcmQgdGhlIENQRVIgZm9yIGd1ZXN0DQph
bmQgaGFuZGxpbmcgdGhlIGVycm9yIHJlZ2FyZGxlc3Mgd2hldGhlciBob3N0IENQVSBzdXBwb3J0
cyBSQVMgZXh0ZW5zaW9uLiBCdXQgSSB0aGluayBpZiB1c2VyIHNwYWNlIHJlY2VpdmVzIHRoZSBT
SUdCVVMgc2lnbmFsLCB0aGF0IG1lYW5zDQpob3N0IENQVSBSQVMgbW9kdWxlIGRldGVjdHMgdGhl
IGVycm9yIG9yIENQVSBjb25zdW1lcyB0aGUgcG9pc29uIGRhdGEsIHRodXMgd2Ugc2hvdWxkIGNo
ZWNrIHdoZXRoZXIgcGh5c2ljYWwgQ1BVIHN1cHBvcnQgUkFTIGV4dGVuc2lvbi4gDQoNCj4gDQo+
IFlvdSBzaG91bGQgYWxzbyBub3QgYmUgY2FsbGluZyBzZXRfZmVhdHVyZSgpIGhlcmUgLS0gaWYg
dGhlIENQVSBmZWF0dXJlcyBiaXQgZG9lc24ndCBzYXkgInRoaXMgQ1BVIHNob3VsZCBoYXZlIHRo
ZSBSQVMgZXh0ZW5zaW9ucyIgd2UNCj4gc2hvdWxkbid0IGNyZWF0ZSBhIENQVSB3aXRoIHRoZW0u
IEluc3RlYWQgeW91IHNob3VsZCBzZXQgaXQgaW4ga3ZtX2FybV9nZXRfaG9zdF9jcHVfZmVhdHVy
ZXMoKSAoYWdhaW4sIGNvbXBhcmUgdGhlIFBNVSBjb2RlKS4NCg0KVW5kZXJzdGFuZCwgSSB3aWxs
IGxvb3AgeW91IHRvIGFub3RoZXIgbWFpbCB0aHJlYWQgdG8gY29uc3VsdCB3aXRoIHlvdSB0aGF0
IHdoZXRoZXIgdXNlcnNwYWNlIHNob3VsZCBkZXRlY3QgQ1BVIFJBUyBleHRlbnNpb24uDQpJZiBh
bGwgYWdyZWUgdG8gZGV0ZWN0IENQVSBSQVMgZmVhdHVyZSwgSSB3aWxsIGZpeCB0aGUgaXNzdWUg
dGhhdCB5b3UgcG9pbnRpbmcgb3V0Lg0KDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=
