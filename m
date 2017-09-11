Received: by 10.223.172.38 with SMTP id v35csp5678366wrc;
        Mon, 11 Sep 2017 08:18:54 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6R8RgjJrT0nznsproFt6EZ/hdAyT2lPFmHFPhmWG4sczSdeo1+DqkYeOA79TzeOMsta+Rz
X-Received: by 10.98.218.18 with SMTP id c18mr4946216pfh.256.1505143134565;
        Mon, 11 Sep 2017 08:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505143134; cv=none;
        d=google.com; s=arc-20160816;
        b=dM5fQp7RVoqwKj1IqGMJ4U5eZWgBUBTdXB1dqA/RLGEafhRcd+/kHg7WlmvRT/VlbI
         +UmLM5Yzh4US7YukY7wQAaknEgO6KQpD2HtguXLGnV5XrjAicfOM6+FRHqNgO2T1Af0t
         PCE1DUPeBz1ZukshMH1dD0dk/iR0nPN4Hv5lqJAHvGVr4iQ9fZVIQ8rJ6RQBUmn5GKD0
         VqPNBDqI4peyEVSJ7HSph7LGxdTbOY7Y/0ENnGBM8BIJFc1ND6rzHL+AULIKOHULxGGx
         ZDeHEEbhtwBPvCw+UoD9RJ4s07nuyQFJInuyhNyq3RuzKEKBwctlGb8IIrs7ByFchAkl
         wpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:arc-authentication-results;
        bh=/i7UKU7Be9vSsW0dzj79IguidpEdXm+Kvcpe63JqM8Y=;
        b=aryAPE7CddVE1vxyjMJV14nE0YWNdOcZTk2kMAlWMM7rYBuiZZZD01DkB6m8QRHMYY
         lktsKexowTUGS9UueKIerxSllNVAuPaUL41SYexVMweH2RQRHch1gCN2gfs9uhNW97u9
         2zqzcm+zB8DLbwbmZiDhX4x1q9BAe3GRm9T6maIS2BQxsQKQEhqgcCi5bvZmYDAw6xkL
         Y5iOPd6ens0nLG+YxzGJTJzjG92UGpCmGLYcKfQWHDd/XxMg7lfLiMMSSHECXGZomM5P
         Hyc4o4Oh5IRm1N/29tJ/OY7yU1uo/xBhu8x7Wuv6ifP3yZPhIzS0hhtZl5l2lLk+85Od
         MXyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n62si6404719pfh.131.2017.09.11.08.18.53;
        Mon, 11 Sep 2017 08:18:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751452AbdIKPSv (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Mon, 11 Sep 2017 11:18:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:11770 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750782AbdIKPSs (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 11 Sep 2017 11:18:48 -0400
Received: from 172.30.72.57 (EHLO DGGEMA405-HUB.china.huawei.com) ([172.30.72.57])
        by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id AWE26855;
        Mon, 11 Sep 2017 23:18:08 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.143]) by
 DGGEMA405-HUB.china.huawei.com ([10.3.20.46]) with mapi id 14.03.0301.000;
 Mon, 11 Sep 2017 23:17:56 +0800
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
Subject: Re: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
Thread-Topic: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
Thread-Index: AdMrCRa4KZaz5ySoTnWsNFUZHxwfmg==
Date:   Mon, 11 Sep 2017 15:17:56 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F2015FE17F@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.58.55]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A0B0202.59B6A933.0028,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=169.254.1.143,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8ebcdaf78631e07f0344534d603dfe6e
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: 2K4X4WuFGA9+

SGkgcGV0ZXIsDQoNCj4gDQo+IE9uIDE4IEF1Z3VzdCAyMDE3IGF0IDE1OjIzLCBEb25naml1IEdl
bmcgPGdlbmdkb25naml1QGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+IFdoZW4gZ3Vlc3QgT1MgaGFw
cGVucyBTRXJyb3IgaW50ZXJydXB0KFNFSSksIGl0IHdpbGwgdHJhcCB0byBob3N0Lg0KPiA+IEhv
c3QgZmlyc3RseSBjYWxscyBtZW1vcnkgZmFpbHVyZSB0byBkZWFsIHdpdGggdGhpcyBlcnJvciBh
bmQgZGVjaWRlDQo+ID4gd2hldGhlciBpdCBuZWVkcyB0byBkZWxpdmVyIFNJR0JVUyBzaWduYWwg
dG8gdXNlcnNwYWNlLiBUaGUgYWR2YW50YWdlDQo+ID4gdGhhdCB1c2luZyBzaWduYWwgdG8gbm90
aWZ5IGlzIHRoYXQgaXQgY2FuIG1ha2UgdGhlIG5vdGlmaWNhdGlvbg0KPiA+IG1ldGhvZCBpcyBn
ZW5lcmFsLCBub24tS1ZNIHVzZXIgY2FuIGFsc28gdXNlIGl0LiB3aGVuIHVzZXJzcGFjZSBnZXRz
DQo+ID4gdGhpcyBzaWduYWwgYW5kIGtub3dzIHRoaXMgaXMgU0Vycm9yIGludGVycnVwdCwgaXQg
d2lsbCB0cmFuc2xhdGUgdGhlDQo+ID4gZGVsaXZlcmVkIGhvc3QgVkEgdG8gUEEgYW5kIHJlY29y
ZCB0aGlzIFBBIHRvIEdIRVMuDQo+ID4NCj4gPiBCZWNhdXNlIEFSTXY4LjIgYWRkcyBhbiBleHRl
bnNpb24gdG8gUkFTIHRvIGFsbG93IHN5c3RlbSBzb2Z0d2FyZQ0KPiA+IGluc2VydCBpbXBsaWNp
dCBFcnJvciBTeW5jaHJvbml6YXRpb24gQmFycmllciBvcGVyYXRpb25zIHRvIGlzb2xhdGUNCj4g
PiB0aGUgZXJyb3IgYW5kIGFsbG93IHBhc3NlcyBzcGVjaWZpZWQgc3luZHJvbWUgdG8gZ3Vlc3Qg
T1MsIHNvIGFmdGVyDQo+ID4gcmVjb3JkIHRoZSBDUEVSLCB1c2VyIHNwYWNlIGNhbGxzIElPQ1RM
IHRvIHBhc3MgYSBzcGVjaWZpZWQgc3luZHJvbWUNCj4gPiB0byBLVk0sIHRoZW4gc3dpdGNoIHRv
IGd1ZXN0IE9TLCBndWVzdCBPUyBjYW4gdXNlIHRoZSByZWNvcmRlZCBDUEVSDQo+ID4gcmVjb3Jk
IGFuZCBzeW5kcm9tZSBpbmZvcm1hdGlvbiB0byBkbyB0aGUgcmVjb3ZlcnkuDQo+ID4NCj4gPiBU
aGUgc3RlcHMgYXJlIHNob3duIGJlbG93Og0KPiA+IDEuIHRyYW5zbGF0ZSB0aGUgaG9zdCBWQSB0
byBndWVzdCBPUyBQQSBhbmQgcmVjb3JkIHRoaXMgZXJyb3IgUEEgdG8gSEVTVCB0YWJsZS4NCj4g
PiAyLiBzZXQgc3BlY2lmaWVkIHZpcnR1YWwgU0Vycm9yIHN5bmRyb21lIGFuZCBwYXNzIHRoZSB2
YWx1ZSB0byBLVk0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25naml1IEdlbmcgPGdlbmdk
b25naml1QGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUXVhbm1pbmcgV3UgPHd1cXVh
bm1pbmdAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgbGludXgtaGVhZGVycy9saW51eC9rdm0u
aCB8ICAxICsNCj4gPiAgdGFyZ2V0L2FybS9pbnRlcm5hbHMuaCAgICB8ICAxICsNCj4gPiAgdGFy
Z2V0L2FybS9rdm02NC5jICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbGludXgtaGVhZGVycy9saW51eC9rdm0uaCBiL2xpbnV4LWhlYWRlcnMvbGludXgva3Zt
LmgNCj4gPiBpbmRleCAyYWExNzZlLi4xMGRmY2FiIDEwMDY0NA0KPiA+IC0tLSBhL2xpbnV4LWhl
YWRlcnMvbGludXgva3ZtLmgNCj4gPiArKysgYi9saW51eC1oZWFkZXJzL2xpbnV4L2t2bS5oDQo+
ID4gQEAgLTEzNTYsNiArMTM1Niw3IEBAIHN0cnVjdCBrdm1fczM5MF91Y2FzX21hcHBpbmcgew0K
PiA+ICAvKiBBdmFpbGFibGUgd2l0aCBLVk1fQ0FQX1MzOTBfQ01NQV9NSUdSQVRJT04gKi8NCj4g
PiAgI2RlZmluZSBLVk1fUzM5MF9HRVRfQ01NQV9CSVRTICAgICAgX0lPV1IoS1ZNSU8sIDB4Yjgs
IHN0cnVjdCBrdm1fczM5MF9jbW1hX2xvZykNCj4gPiAgI2RlZmluZSBLVk1fUzM5MF9TRVRfQ01N
QV9CSVRTICAgICAgX0lPVyhLVk1JTywgMHhiOSwgc3RydWN0IGt2bV9zMzkwX2NtbWFfbG9nKQ0K
PiA+ICsjZGVmaW5lIEtWTV9BUk1fU0VJICAgICAgICAgICAgICAgICBfSU8oS1ZNSU8sICAgMHhi
MTApDQo+ID4NCj4gPiAgI2RlZmluZSBLVk1fREVWX0FTU0lHTl9FTkFCTEVfSU9NTVUgICAgKDEg
PDwgMCkNCj4gPiAgI2RlZmluZSBLVk1fREVWX0FTU0lHTl9QQ0lfMl8zICAgICAgICAgKDEgPDwg
MSkNCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9pbnRlcm5hbHMuaCBiL3RhcmdldC9hcm0v
aW50ZXJuYWxzLmggaW5kZXgNCj4gPiBmYzBhZDZkLi4xOGIxY2JjIDEwMDY0NA0KPiA+IC0tLSBh
L3RhcmdldC9hcm0vaW50ZXJuYWxzLmgNCj4gPiArKysgYi90YXJnZXQvYXJtL2ludGVybmFscy5o
DQo+ID4gQEAgLTIzNyw2ICsyMzcsNyBAQCBlbnVtIGFybV9leGNlcHRpb25fY2xhc3MgeyAgI2Rl
ZmluZSBBUk1fRUxfSVNWICgxDQo+ID4gPDwgQVJNX0VMX0lTVl9TSElGVCkgICNkZWZpbmUgQVJN
X0VMX0VDX01BU0sgICgoMHgzRikgPDwNCj4gPiBBUk1fRUxfRUNfU0hJRlQpICAjZGVmaW5lIEFS
TV9FTF9GU0NfVFlQRSAoMHgzQykNCj4gPiArI2RlZmluZSBBUk1fRUxfSVNTX01BU0sgKCgxIDw8
IEFSTV9FTF9JTF9TSElGVCkgLSAxKQ0KPiA+DQo+ID4gICNkZWZpbmUgRlNDX1NFQSAgICAgICAg
ICgweDEwKQ0KPiA+ICAjZGVmaW5lIEZTQ19TRUFfVFRXMCAgICAoMHgxNCkNCj4gPiBkaWZmIC0t
Z2l0IGEvdGFyZ2V0L2FybS9rdm02NC5jIGIvdGFyZ2V0L2FybS9rdm02NC5jIGluZGV4DQo+ID4g
ZDNiZGFiMi4uYjg0Y2I0OSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvYXJtL2t2bTY0LmMNCj4g
PiArKysgYi90YXJnZXQvYXJtL2t2bTY0LmMNCj4gPiBAQCAtNjE2LDYgKzYxNiwyMiBAQCBzdGF0
aWMgaW50IGt2bV9hcm1fY3ByZWdfdmFsdWUoQVJNQ1BVICpjcHUsIHB0cmRpZmZfdCBmaWVsZG9m
ZnNldCkNCj4gPiAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGlj
IGludCBrdm1faW5qZWN0X2FybV9zZWkoQ1BVU3RhdGUgKmNzKSB7DQo+ID4gKyAgICBBUk1DUFUg
KmNwdSA9IEFSTV9DUFUoY3MpOw0KPiA+ICsgICAgQ1BVQVJNU3RhdGUgKmVudiA9ICZjcHUtPmVu
djsNCj4gPiArDQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIHN5bmRyb21lID0gZW52LT5leGNlcHRp
b24udmFkZHJlc3M7DQo+ID4gKyAgICAvKiBzZXQgdmlydHVhbCBTRXJyb3Igc3luZHJvbWUgKi8N
Cj4gPiArICAgIGlmIChhcm1fZmVhdHVyZShlbnYsIEFSTV9GRUFUVVJFX1JBU19FWFRFTlNJT04p
KSB7DQo+ID4gKyAgICAgICAgc3luZHJvbWUgPSBzeW5kcm9tZSAmIEFSTV9FTF9JU1NfTUFTSzsN
Cj4gPiArICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgc3luZHJvbWUgPSAwOw0KPiA+ICsgICAg
fQ0KPiA+ICsNCj4gPiArICAgIHJldHVybiAga3ZtX3ZjcHVfaW9jdGwoQ1BVKGNwdSksIEtWTV9B
Uk1fU0VJLCAmc3luZHJvbWUpOw0KPiANCj4gVGhpcyBsb29rcyBvZGQuIElmIHdlIGRvbid0IGhh
dmUgdGhlIFJBUyBleHRlbnNpb24gd2h5IGRvIHdlIG5lZWQgdG8gZG8gYW55dGhpbmcgYXQgYWxs
IGhlcmUgPw0KDQpUaGlzIGlzIGJlY2F1c2UgUWVtdSBtYXkgbmVlZCB0byBzdXBwb3J0IG5vbi1S
QVMgZXh0ZW5zaW9uIGFzIGRpc2N1c3NlZCB3aXRoIEFSTSBKYW1lcyBiZWZvcmUuDQpUaGF0IGlz
IHRvIHNheSBob3N0IGhhcmR3YXJlIENQVSBkb2VzIG5vdCBzdXBwb3J0IFJBUywgYnV0IGd1ZXN0
IHN1cHBvcnRzLg0KVGhhdCBpcyB1bmRlciBkaXNjdXNzaW9uLg0KV2hlbiBob3N0IGhhcmR3YXJl
IHN1cHBvcnRzIFJBUywgc3BlY2lmeSB0aGUgc3luZHJvbWUgdG8gYSB2YWxpZCB2YWx1ZSwgb3Ro
ZXJ3aXNlLCBzZXQgaXQgdG8gMC4NCg0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiAgLyogSW5qZWN0
IHN5bmNocm9ub3VzIGV4dGVybmFsIGFib3J0ICovICBzdGF0aWMgaW50DQo+ID4ga3ZtX2luamVj
dF9hcm1fc2VhKENQVVN0YXRlICpjKSAgeyBAQCAtMTAwNyw2ICsxMDIzLDE1IEBAIHN0YXRpYyBi
b29sDQo+ID4gaXNfYWJvcnRfc2VhKHVuc2lnbmVkIGxvbmcgc3luZHJvbWUpDQo+ID4gICAgICB9
DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBpc19hYm9ydF9zZWkodW5zaWduZWQgbG9u
ZyBzeW5kcm9tZSkgew0KPiA+ICsgICAgdWludDhfdCBlYyA9ICgoc3luZHJvbWUgJiBBUk1fRUxf
RUNfTUFTSykgPj4gQVJNX0VMX0VDX1NISUZUKTsNCj4gDQo+IFlvdSBkb24ndCBuZWVkIHRvIGJv
dGhlciBtYXNraW5nIGhlcmUgLS0gaW4gb3RoZXIgcGxhY2VzIGluIFFFTVUgd2UgYXNzdW1lIHRo
YXQgdGhlIEVDIGZpZWxkIGlzIGF0IHRoZSB0b3Agb2YgdGhlIHdvcmQsIHNvIGp1c3QgInN5bmRy
b21lID4+DQo+IEFSTV9FTF9FQ19TSElGVCIgaXMgc3VmZmljaWVudC4NCg0KT0ssIHRoYW5rcyBm
b3IgdGhlIHN1Z2dlc3Rpb24uDQoNCj4gDQo+ID4gKyAgICBpZiAoKGVjICE9IEVDX1NFUlJPUikp
DQo+ID4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgICAg
IHJldHVybiB0cnVlOw0KPiANCj4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIHNob3VsZCB0ZWxsIHlv
dSB0aGF0IHRoaXMgaWYgbmVlZHMgYnJhY2VzIChpdCdzIGdvb2QgdG8gZ2V0IGluIHRoZSBoYWJp
dCBvZiBydW5uaW5nIGl0IG9uIGFsbCBwYXRjaGVzOyBpdCBpcyBub3QgYWx3YXlzDQo+IGNvcnJl
Y3QsIHNvIGp1ZGdlbWVudCBpcyByZXF1aXJlZCwgYnV0IGl0IHdpbGwgZmxhZyB1cCBzb21lIGNv
bW1vbiBtaXN0YWtlcykuDQo+IA0KPiBJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgeW91IHNob3Vs
ZCBqdXN0DQo+ICAgIHJldHVybiBlYyA9PSBFQ19TRVJST1I7DQo+IHRob3VnaC4NCg0KR29vZCBz
dWdnZXN0aW9uLg0KDQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICB2b2lkIGt2bV9hcmNoX29uX3Np
Z2J1c192Y3B1KENQVVN0YXRlICpjLCBpbnQgY29kZSwgdm9pZCAqYWRkcikgIHsNCj4gPiAgICAg
IHJhbV9hZGRyX3QgcmFtX2FkZHI7DQo+ID4gQEAgLTEwMjQsNiArMTA0OSw5IEBAIHZvaWQga3Zt
X2FyY2hfb25fc2lnYnVzX3ZjcHUoQ1BVU3RhdGUgKmMsIGludCBjb2RlLCB2b2lkICphZGRyKQ0K
PiA+ICAgICAgICAgICAgICBpZiAoaXNfYWJvcnRfc2VhKGVudi0+ZXhjZXB0aW9uLnN5bmRyb21l
KSkgew0KPiA+ICAgICAgICAgICAgICAgICAgZ2hlc191cGRhdGVfZ3Vlc3QoQUNQSV9IRVNUX05P
VElGWV9TRUEsIHBhZGRyKTsNCj4gPiAgICAgICAgICAgICAgICAgIGt2bV9pbmplY3RfYXJtX3Nl
YShjKTsNCj4gPiArICAgICAgICAgICAgfSBlbHNlIGlmIChpc19hYm9ydF9zZWkoZW52LT5leGNl
cHRpb24uc3luZHJvbWUpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICBnaGVzX3VwZGF0ZV9ndWVz
dChBQ1BJX0hFU1RfTk9USUZZX1NFSSwgcGFkZHIpOw0KPiA+ICsgICAgICAgICAgICAgICAga3Zt
X2luamVjdF9hcm1fc2VpKGMpOw0KPiA+ICAgICAgICAgICAgICB9DQo+ID4gICAgICAgICAgICAg
IHJldHVybjsNCj4gPiAgICAgICAgICB9DQo+ID4gLS0NCj4gPiAxLjguMy4xDQo+IA0KPiB0aGFu
a3MNCj4gLS0gUE1NDQo=
