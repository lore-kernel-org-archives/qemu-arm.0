Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp152315wrt;
        Wed, 21 Nov 2018 19:05:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5fYV2zUlF/3aKObImbhzVPxkbVkPADAog5uHCP94v9/7SB6WRBVrazPZETe5LzZ0yaV6YzN
X-Received: by 2002:a62:8096:: with SMTP id j144mr9752838pfd.140.1542855955228;
        Wed, 21 Nov 2018 19:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542855955; cv=none;
        d=google.com; s=arc-20160816;
        b=E5EsOVkLFxgeehxLZKCosxrCDKp/Ueo8GhwXHHZu7RnXPE6xOTe5+JtQSgX4ylx1De
         Vyq6lTzE7HU2oe4nnyC8Iv7oFjBjr9b/hsiijlH+SR5Ri96ZDa+Sy9uiPg9CriGJE6TR
         zFNDaAQc9a+WxLCOEF6K1/re+SZkVUJlw+w1LGt6N93VSo5HGNrrPmItklg+xXae/AsT
         WQK61f7Sp+/O4FdVJhIAdrK2qQ0WksT2Af7FUE8y8eVyLe9I+LA4aB4Tkqt5AhmgTWPd
         QFL9F9PWMwNl0y6RYd8N9I/ajPKW3okAsH7UoBPymyWjpI6M3H+uvFqVEc2XmD/Yt6F8
         6S/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from;
        bh=PwxBKmptM/gtFRfYHDlXStgqz6qjLOIUthovSOdPrQQ=;
        b=gYqxzQWoWX/uiYpdQE5qr5r1IL5mYapWLm4Nyf3fkPOhkVNz5c6nDgmFifQ2ZeNROa
         NwyIPsYKJ6uCrEu9+AY+VC+CkjD9hPUyNnSTpOdVMovnZKirrNua0aoiYXilFewIM5kr
         xLRZN9YWlP/hHyGp7wMSd/VBG13alDBejsFNA13z+h2HV6svhz23d0oCJ+GlTETxxiv1
         oUcB5sbZMSFyPQBE6zq6y11xKJoA8jjsMUz3ME0BDR7eFt2ZNDJBALzD85v37KOYNx8f
         sVpH/3JYnDvU/9E465d70qho3hKBLvC0SP6XJMqBrZMROKVwnWutv/wnadkHGAs5vMm4
         tdmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id y1si47806963pgy.174.2018.11.21.19.05.54;
        Wed, 21 Nov 2018 19:05:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731692AbeKVNnL (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 22 Nov 2018 08:43:11 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:6434 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728825AbeKVNnL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Nov 2018 08:43:11 -0500
Received: from DGGEMA403-HUB.china.huawei.com (unknown [172.30.72.56])
        by Forcepoint Email with ESMTP id 2488DBA69F72F;
        Thu, 22 Nov 2018 11:05:50 +0800 (CST)
Received: from DGGEMA423-HUB.china.huawei.com (10.1.198.156) by
 DGGEMA403-HUB.china.huawei.com (10.3.20.44) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 22 Nov 2018 11:05:50 +0800
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.15]) by
 dggema423-hub.china.huawei.com ([10.1.198.156]) with mapi id 14.03.0415.000;
 Thu, 22 Nov 2018 11:05:41 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     'Peter Maydell' <peter.maydell@linaro.org>
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
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggUkVTRU5EIHYxNSAxMC8xMF0gdGFyZ2V0LWFybTog?=
 =?utf-8?Q?kvm64:_handle_SIGBUS_signal_from_kernel_or_KVM?=
Thread-Topic: [PATCH RESEND v15 10/10] target-arm: kvm64: handle SIGBUS
 signal from kernel or KVM
Thread-Index: AQHUgOPww2opbaBODESLifx2cCvFl6VaTjFA
Date:   Thu, 22 Nov 2018 03:05:41 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201F7D7EB@DGGEMA503-MBX.china.huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
 <1541672989-15967-11-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-6UKk-WF+M+z0=AN-X7q0XRFLo2RG_yBadDeCas4A5wQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-6UKk-WF+M+z0=AN-X7q0XRFLo2RG_yBadDeCas4A5wQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.68.147]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6hwFGGvixgNz

PiA+DQo+ID4gK3ZvaWQga3ZtX2FyY2hfb25fc2lnYnVzX3ZjcHUoQ1BVU3RhdGUgKmMsIGludCBj
b2RlLCB2b2lkICphZGRyKSB7DQo+ID4gKyAgICByYW1fYWRkcl90IHJhbV9hZGRyOw0KPiA+ICsg
ICAgaHdhZGRyIHBhZGRyOw0KPiA+ICsNCj4gPiArICAgIGFzc2VydChjb2RlID09IEJVU19NQ0VF
UlJfQVIgfHwgY29kZSA9PSBCVVNfTUNFRVJSX0FPKTsNCj4gPiArICAgIGlmIChhZGRyKSB7DQo+
ID4gKyAgICAgICAgcmFtX2FkZHIgPSBxZW11X3JhbV9hZGRyX2Zyb21faG9zdChhZGRyKTsNCj4g
PiArICAgICAgICBpZiAocmFtX2FkZHIgIT0gUkFNX0FERFJfSU5WQUxJRCAmJg0KPiA+ICsgICAg
ICAgICAgICBrdm1fcGh5c2ljYWxfbWVtb3J5X2FkZHJfZnJvbV9ob3N0KGMtPmt2bV9zdGF0ZSwg
YWRkciwgJnBhZGRyKSkgew0KPiA+ICsgICAgICAgICAgICBrdm1faHdwb2lzb25fcGFnZV9hZGQo
cmFtX2FkZHIpOw0KPiA+ICsgICAgICAgICAgICBpZiAoY29kZSA9PSBCVVNfTUNFRVJSX0FSKSB7
DQo+ID4gKyAgICAgICAgICAgICAgICBrdm1fY3B1X3N5bmNocm9uaXplX3N0YXRlKGMpOw0KPiA+
ICsgICAgICAgICAgICAgICAgaWYgKGdoZXNfcmVjb3JkX2Vycm9ycyhBQ1BJX0hFU1RfTk9USUZZ
X1NFQSwgcGFkZHIpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAga3ZtX2luamVjdF9hcm1f
c2VhKGMpOw0KPiA+ICsgICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImZhaWxlZCB0byByZWNvcmQgdGhlIGVycm9yXG4iKTsN
Cj4gPiArICAgICAgICAgICAgICAgIH0NCj4gDQo+IFNob3VsZG4ndCB0aGVyZSBiZSBzb21ldGhp
bmcgaW4gaGVyZSB0byBzYXkgIm9ubHkgcmVwb3J0IHRoaXMgZXJyb3IgdG8gdGhlIGd1ZXN0IGlm
IHdlIGFyZSBhY3R1YWxseSByZXBvcnRpbmcgUkFTIGVycm9ycyB0byB0aGUgZ3Vlc3QiID8NCg0K
WWVzLCBXZSBjYW4gc2F5IHNvbWV0aGluZyB0aGF0IHN1Y2ggYXMgInJlcG9ydCB0aGlzIGVycm9y
IHRvIHRoZSBndWVzdCIsIGJlY2F1c2UgdGhpcyBlcnJvciBpcyBpbmRlZWQgdHJpZ2dlcmVkIGJ5
IGd1ZXN0LCB3aGljaCBpcyBndWVzdCBlcnJvci4NCg0KPiANCj4gPiArICAgICAgICAgICAgfQ0K
PiA+ICsgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIGZw
cmludGYoc3RkZXJyLCAiSGFyZHdhcmUgbWVtb3J5IGVycm9yIGZvciBtZW1vcnkgdXNlZCBieSAi
DQo+ID4gKyAgICAgICAgICAgICAgICAiUUVNVSBpdHNlbGYgaW5zdGVhZCBvZiBndWVzdCBzeXN0
ZW0hXG4iKTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBpZiAoY29kZSA9PSBCVVNfTUNF
RVJSX0FSKSB7DQo+ID4gKyAgICAgICAgZnByaW50ZihzdGRlcnIsICJIYXJkd2FyZSBtZW1vcnkg
ZXJyb3IhXG4iKTsNCj4gPiArICAgICAgICBleGl0KDEpOw0KPiA+ICsgICAgfQ0KPiA+ICt9DQo+
ID4gKw0KPiA+ICAvKiBDNi42LjI5IEJSSyBpbnN0cnVjdGlvbiAqLw0KPiA+ICBzdGF0aWMgY29u
c3QgdWludDMyX3QgYnJrX2luc24gPSAweGQ0MjAwMDAwOw0KPiANCj4gdGhhbmtzDQo+IC0tIFBN
TQ0K
