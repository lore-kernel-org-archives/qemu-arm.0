Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1771430wrt;
        Wed, 21 Nov 2018 04:01:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VhaeV4JVNGMRBvE9Q652IykIF547BcghUI09XD6z/rwr8hAF8BOhZCrNQz1qtjUzrTbM++
X-Received: by 2002:a17:902:1e9:: with SMTP id b96mr6529201plb.150.1542801691995;
        Wed, 21 Nov 2018 04:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542801691; cv=none;
        d=google.com; s=arc-20160816;
        b=PImCFCjRBM3sOxZbKvDQgeOaQk6R5CK5hrtZ0UCG9BJdHfHTCNiAhj+m+hJup4cNWg
         sGVPGZKEYKiMBrvEpPtudygIxB/SPWYDQvP8oXog8DWa186DwstCcg9H26VZPQKlvtUD
         PJUQnAzDfdbXnyFw6J0DCFhWxQU20a7LUPT359RCXupVnZLpoepbycH0morwGyvBQA7t
         997QWqVdY2A/hubBZoDD6YPlB0/IRcqePCnbpVruifwUCkRWmN0ZZ+Rd2xU/loZAjSOj
         BUp1ngQpsk3nxsD1CKxi+/K1d/Q2N9e3GhrKvTrXTiB5Uh5GFx3vDOrR4JTRVARa/J/b
         uLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from;
        bh=5daQ6vcjAjqIQ91oD56pspNWulWKlyZya72u04tfq98=;
        b=ioUi9SKLLFm8vu4mkgrnPeKU8yUtUozsXcc1w7NaE6P35alwdF8NjsjGkbY1cJE22N
         ZbfFCRvmXmEW0lk8z2J7lLPGYHJahfc0W1TIhQEqceFdLHDyBgZ/zDAewpQm8nGhhSa5
         CwxCwzure+e9JlDbYQ9Osk4xLDfOzt3cUNelzxWSi0khVPQrSb3c7acwnjg3BMI1P/AE
         CH/w+DMcBGcEqqdmwLeQQzm+0oaac70GTIXk9KuvkMJ3V4arj12j+Hh/4eXFlMMbunxU
         ZRlRKvP6EVK1KJMNJxZH4twJEhwNizgZILNi051T0DCtvbaIbLytShxtM24QiD72+xeP
         86AA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g9si5293162plb.54.2018.11.21.04.01.31;
        Wed, 21 Nov 2018 04:01:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728450AbeKUWfh (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Wed, 21 Nov 2018 17:35:37 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:6060 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727069AbeKUWfg (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 21 Nov 2018 17:35:36 -0500
Received: from DGGEMA406-HUB.china.huawei.com (unknown [172.30.72.56])
        by Forcepoint Email with ESMTP id CC546AF82F9E5;
        Wed, 21 Nov 2018 20:01:25 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.15]) by
 DGGEMA406-HUB.china.huawei.com ([10.3.20.47]) with mapi id 14.03.0415.000;
 Wed, 21 Nov 2018 20:01:20 +0800
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
        "Igor Mammedov" <imammedo@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>
Subject: =?utf-8?B?562U5aSNOiBbUWVtdS1kZXZlbF0gW1BBVENIIFJFU0VORCB2MTUgMDcvMTBd?=
 =?utf-8?B?IEtWTTogTW92ZSByZWxhdGVkIGh3cG9pc29uIHBhZ2UgZnVuY3Rpb25zIHRv?=
 =?utf-8?Q?_accel/kvm/_folder?=
Thread-Topic: [Qemu-devel] [PATCH RESEND v15 07/10] KVM: Move related
 hwpoison page functions to accel/kvm/ folder
Thread-Index: AQHUgOGNbjBRLbNk2EGdtktdYIQiPaVaIMQg
Date:   Wed, 21 Nov 2018 12:01:19 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201F7B38A@DGGEMA503-MBX.china.huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
        <1541672989-15967-8-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA9wLv96u_GYCBPFtkQMvntoHDKhQjremmN1noaJxsvhAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9wLv96u_GYCBPFtkQMvntoHDKhQjremmN1noaJxsvhAQ@mail.gmail.com>
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
X-TUID: 49qHZKNMN1xS

SGkgUGV0ZXIsDQogICBUaGFua3MgdmVyeSBtdWNoIGZvciB0aGUgY29tbWFuZHMgYW5kIHJldmll
dy4NCg0KPiBPbiA4IE5vdmVtYmVyIDIwMTggYXQgMTA6MjksIERvbmdqaXUgR2VuZyA8Z2VuZ2Rv
bmdqaXVAaHVhd2VpLmNvbT4gd3JvdGU6DQo+ID4ga3ZtX2h3cG9pc29uX3BhZ2VfYWRkKCkgYW5k
IGt2bV91bnBvaXNvbl9hbGwoKSB3aWxsIGJlIHVzZWQgYm90aCBieQ0KPiA+IFg4NiBhbmQgQVJN
IHBsYXRmb3Jtcywgc28gbW92ZSB0aGVzZSBmdW5jdGlvbnMgdG8gYSBjb21tb24gYWNjZWwva3Zt
Lw0KPiA+IGZvbGRlciB0byBhdm9pZCBkdXBsaWNhdGUgY29kZS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IERvbmdqaXUgR2VuZyA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4g
PiBBZGRyZXNzIFBldGVyJ3MgY29tbWVudHMgdG8gbW92ZSByZWxhdGVkIGh3cG9pc29uIHBhZ2Ug
ZnVuY3Rpb24gdG8NCj4gPiBhY2NlbC9rdm0gZm9sZGVyIGluIFsxXSBBZGRyZXNzIFBhb2xvJ3Mg
Y29tbWVudHMgdG8gbW92ZSBIV1BvaXNvblBhZ2UNCj4gPiBkZWZpbml0aW9uIGJhY2sgdG8gYWNj
ZWwva3ZtL2t2bS1hbGwuYw0KPiA+DQo+ID4gWzFdOg0KPiA+IGh0dHBzOi8vbGlzdHMuZ251Lm9y
Zy9hcmNoaXZlL2h0bWwvcWVtdS1hcm0vMjAxNy0wOS9tc2cwMDA3Ny5odG1sDQo+ID4gaHR0cHM6
Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWFybS8yMDE3LTA5L21zZzAwMTUyLmh0
bWwNCj4gPiAtLS0NCj4gDQo+ID4gLS0tIGEvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4gPiAr
KysgYi9pbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaA0KPiA+IEBAIC0xMTUsNiArMTE1LDExIEBAIHZv
aWQgcWVtdV9yYW1fZnJlZShSQU1CbG9jayAqYmxvY2spOw0KPiA+DQo+ID4gIGludCBxZW11X3Jh
bV9yZXNpemUoUkFNQmxvY2sgKmJsb2NrLCByYW1fYWRkcl90IG5ld3NpemUsIEVycm9yDQo+ID4g
KiplcnJwKTsNCj4gPg0KPiA+ICsvKiBBZGQgYSBwb2lzb25lZCBwYWdlIHRvIHRoZSBsaXN0ICov
IHZvaWQNCj4gPiAra3ZtX2h3cG9pc29uX3BhZ2VfYWRkKHJhbV9hZGRyX3QgcmFtX2FkZHIpOw0K
PiA+ICsvKiBGcmVlIGFuZCByZW1vdmUgYWxsIHRoZSBwb2lzb25lZCBwYWdlcyBpbiB0aGUgbGlz
dCAqLyB2b2lkDQo+ID4gK2t2bV91bnBvaXNvbl9hbGwodm9pZCAqcGFyYW0pOw0KPiA+ICsNCj4g
DQo+IEluIG15IHByZXZpb3VzIHJldmlldyBjb21tZW50cyBJIHNhaWQ6DQo+ID4+PiBBbnkgbmV3
IGdsb2JhbGx5LXZpc2libGUgZnVuY3Rpb24gcHJvdG90eXBlIGluIGEgaGVhZGVyIHNob3VsZCBo
YXZlDQo+ID4+PiBhIGRvYy1jb21tZW50IGZvcm1hdHRlZCBkb2N1bWVudGF0aW9uIGNvbW1lbnQs
IHBsZWFzZS4NCj4gPj4NCj4gPj4NCj4gPj4gT2ssIHRoYW5rcyBmb3IgdGhpcyByZW1pbmRlci4g
RG8geW91IG1lYW4gSSBuZWVkIHRvIGFkZCBjb21tZW50cyBmb3INCj4gPj4gdGhpcyBnbG9iYWxs
eS12aXNpYmxlIGZ1bmN0aW9uLCBzdWNoIGFzIGJlbG93Og0KPiA+Pg0KPiA+PiAvKg0KPiA+PiAg
KiB4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4DQo+ID4+ICAqLw0KPiA+PiB2b2lk
IGt2bV9od3BvaXNvbl9wYWdlX2FkZChyYW1fYWRkcl90IHJhbV9hZGRyKTsNCj4gPg0KPiA+IEl0
IHNob3VsZCBiZSBpbiB0aGUgZG9jLWNvbW1lbnQgZm9ybWF0LCB3aGljaCBiZWdpbnMgIi8qKiIg
YW5kIGhhcw0KPiA+IHNvbWUgc3R5bGl6YXRpb24gb2YgaG93IHlvdSBsaXN0IHBhcmFtZXRlcnMg
YW5kIHNvIG9uLiBMb3RzIG9mDQo+ID4gZXhhbXBsZXMgaW4gdGhlIGV4aXN0aW5nIGhlYWRlcnMu
DQo+IA0KPiBDYW4gd2UgaGF2ZSBhIGRvYy1jb21tZW50IGluIHRoZSBwcm9wZXIgZm9ybWF0IGFu
ZCB3aXRoIGEgbGl0dGxlIG1vcmUgZGV0YWlsIHRoYW4gYSBzaW5nbGUgbGluZSwgcGxlYXNlPw0K
DQpTdXJlLCBJIHdpbGwgYWRkIGl0IGluIHRoZSBwcm9wZXIgZm9ybWF0LCB0aGFua3MsIE1heSBi
ZSBJIGZvcmdldCBpdC4gDQoNCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg0K
