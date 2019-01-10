Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1946113wrt;
        Thu, 10 Jan 2019 07:37:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5hoGbJz3RGKsq+iyzkmj9fsemwWvycOAUk0m+jLvuKIy5DXBUS/KJBPP1ncuRmpI9H7vm3
X-Received: by 2002:a17:902:6e0f:: with SMTP id u15mr10614590plk.175.1547134625442;
        Thu, 10 Jan 2019 07:37:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547134625; cv=none;
        d=google.com; s=arc-20160816;
        b=BXTwh6SMguIcJeYJUzuEUlcZRgxUtg5p9wcbneUMPbjyq3OB3yVjn8vrJJMMqWBDg3
         9TwxX2MqgzMBS3z4b+djooCVA30O6sZ9d89JkAESYnrPYvhJmiGBUlMt68Tyo643LWmS
         WjSXq7dNO4DlwIirLltoddk5LkSdI5eSB+Vi/J4sz9Ll3Te5nLkGi28mOm35jdxdHRS6
         4u/dyMZeKvjD4pTsbwPqMcboeRzVdTjjfhMR8dwCLW0iiWtdlCwUGW43mMvW8Qy/tdOL
         rk/2WayaGQKV62OQvq6pEl+RUI1l2vJN+WkpOk4ngaQRWY9V81P4f2HNg/Zwu3zJYfYQ
         OTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=5ciodWCagpvEvIHOj947F0pgd18YcGJCMSHAbDCIkQs=;
        b=FjpK0bEZIMhaMM+Dl1XrBuMWk7mZWO9vZ85whoT9VS0Woc/5pNTg2Sot7Ih0Q/Hp+C
         D0N/vVaa8VuQnW+8TtJ75CdK6w3jLb+w2EfXDRHASmiBUERJRa+epVnr9jfiPdM/G/c7
         Mh4o/Mrq6AqR8cQ3oyFiV1nIJlihKaVUBTrGgkIrkFf5KwrJ4H+ZkaCgq9xbv5z/6Nl1
         idfAU2tQ1OpfBPQvuZ60nG94wnfhkWi5K9tSzYEveZCAVIP5kMR3pba5NjLV8ncYsSmw
         y3/VMeEOjcK3Ss1qXFHLdjbHrltynmr3ij0ZCex5CkkOyfieedakj30iFGjYin37/UL9
         O5PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h36si51688680pgm.200.2019.01.10.07.37.05;
        Thu, 10 Jan 2019 07:37:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729433AbfAJPhE (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 10 Jan 2019 10:37:04 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:56302 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727819AbfAJPhE (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 10 Jan 2019 10:37:04 -0500
Received: from DGGEMA405-HUB.china.huawei.com (unknown [172.30.72.55])
        by Forcepoint Email with ESMTP id 04DB6FA1D8DCD79FCF15;
        Thu, 10 Jan 2019 23:36:59 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.180]) by
 DGGEMA405-HUB.china.huawei.com ([10.3.20.46]) with mapi id 14.03.0415.000;
 Thu, 10 Jan 2019 23:36:58 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v15 10/10] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
Thread-Topic: [PATCH v15 10/10] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
Thread-Index: AdSo+emXx7ndb7nXS/K5ksADz60bxQ==
Date:   Thu, 10 Jan 2019 15:36:57 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F202045412@dggema523-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.56.182]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: nci5virF47vT

PiANCj4gT24gVGh1LCA4IE5vdiAyMDE4IGF0IDEwOjE4LCBEb25naml1IEdlbmcgPGdlbmdkb25n
aml1QGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIFNJR0JVUyBzaWduYWwgaGFuZGxl
ci4gSW4gdGhpcyBoYW5kbGVyLCBpdCBjaGVja3MgdGhlIFNJR0JVUyB0eXBlLA0KPiA+IHRyYW5z
bGF0ZXMgdGhlIGhvc3QgVkEgZGVsaXZlcmVkIGJ5IGhvc3QgdG8gZ3Vlc3QgUEEsIHRoZW4gZmls
bCB0aGlzDQo+ID4gUEEgdG8gZ3Vlc3QgQVBFSSBHSEVTIG1lbW9yeSwgdGhlbiBub3RpZnkgZ3Vl
c3QgYWNjb3JkaW5nIHRvIHRoZSBTSUdCVVMgdHlwZS4NCj4gPiBUaGVyZSBhcmUgdHdvIGtpbmRz
IG9mIFNJR0JVUyB0aGF0IFFFTVUgbmVlZHMgdG8gaGFuZGxlLCB3aGljaCBhcmUNCj4gPiBCVVNf
TUNFRVJSX0FPIGFuZCBCVVNfTUNFRVJSX0FSLg0KPiANCj4gPiArYm9vbCBnaGVzX3JlY29yZF9l
cnJvcnModWludDMyX3Qgbm90aWZ5LCB1aW50NjRfdCBwaHlzaWNhbF9hZGRyZXNzKSB7DQo+ID4g
KyAgICB1aW50NjRfdCBlcnJvcl9ibG9ja19hZGRyLCByZWFkX2Fja19yZWdpc3Rlcl9hZGRyOw0K
PiA+ICsgICAgaW50IHJlYWRfYWNrX3JlZ2lzdGVyID0gMCwgbG9vcCA9IDA7DQo+ID4gKyAgICB1
aW50NjRfdCBzdGFydF9hZGRyID0gbGUzMl90b19jcHUoZ2VzLmdoZXNfYWRkcl9sZSk7DQo+ID4g
KyAgICBib29sIHJldCA9IEdIRVNfQ1BFUl9GQUlMOw0KPiA+ICsgICAgY29uc3QgdWludDhfdCBl
cnJvcl9zb3VyY2VfaWRbXSA9IHsgMHhmZiwgMHhmZiwgMHhmZiwgMHhmZiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4ZmYsIDB4ZmYsIDB4ZmYsIDAsIDF9
Ow0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiB8ICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0rIGdlcy5naGVzX2FkZHJfbGUNCj4gPiArICAgICAqIHwgfGVycm9yX2Jsb2NrX2FkZHJlc3Mw
fA0KPiA+ICsgICAgICogfCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ICsgICAgICogfCB8
ZXJyb3JfYmxvY2tfYWRkcmVzczF8DQo+ID4gKyAgICAgKiB8ICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0rIC0tKy0tDQo+ID4gKyAgICAgKiB8IHwgICAgLi4uLi4uLi4uLi4uLiAgICB8IEdIRVNfQURE
UkVTU19TSVpFDQo+ID4gKyAgICAgKiB8ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0rIC0tKy0tDQo+
ID4gKyAgICAgKiB8IHxlcnJvcl9ibG9ja19hZGRyZXNzTnwNCj4gPiArICAgICAqIHwgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsNCj4gPiArICAgICAqIHwgfCByZWFkX2Fja19yZWdpc3RlcjAgIHwN
Cj4gPiArICAgICAqIHwgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgLS0rLS0NCj4gPiArICAgICAq
IHwgfCByZWFkX2Fja19yZWdpc3RlcjEgIHwgR0hFU19BRERSRVNTX1NJWkUNCj4gPiArICAgICAq
IHwgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgLS0rLS0NCj4gPiArICAgICAqIHwgfCAgIC4uLi4u
Li4uLi4uLi4gICAgIHwNCj4gPiArICAgICAqIHwgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4g
PiArICAgICAqIHwgfCByZWFkX2Fja19yZWdpc3Rlck4gIHwNCj4gPiArICAgICAqIHwgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsgLS0rLS0NCj4gPiArICAgICAqIHwgfCAgICAgIENQRVIgICAgICAg
ICAgIHwgICB8DQo+ID4gKyAgICAgKiB8IHwgICAgICAuLi4uICAgICAgICAgICB8IEdIRVNfTUFY
X1JBV19EQVRBX0xFTkdUDQo+ID4gKyAgICAgKiB8IHwgICAgICBDUEVSICAgICAgICAgICB8ICAg
fA0KPiA+ICsgICAgICogfCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAtLSstLQ0KPiA+ICsgICAg
ICogfCB8ICAgIC4uLi4uLi4uLi4gICAgICAgfA0KPiA+ICsgICAgICogfCArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKw0KPiA+ICsgICAgICogfCB8ICAgICAgQ1BFUiAgICAgICAgICAgfA0KPiA+ICsg
ICAgICogfCB8ICAgICAgLi4uLiAgICAgICAgICAgfA0KPiA+ICsgICAgICogfCB8ICAgICAgQ1BF
UiAgICAgICAgICAgfA0KPiA+ICsgICAgICogfCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+
ICsgICAgICovDQo+ID4gKyAgICBpZiAocGh5c2ljYWxfYWRkcmVzcyAmJiBub3RpZnkgPCBBQ1BJ
X0hFU1RfTk9USUZZX1JFU0VSVkVEKSB7DQo+IA0KPiBXaHkgaXMgYSB6ZXJvIHBoeXNpY2FsIGFk
ZHJlc3Mgc3BlY2lhbCBoZXJlPyBTaG91bGRuJ3Qgd2UgYmUgYWJsZSB0byByZXBvcnQgInRoZSBt
ZW1vcnkgYmFja2luZyBwaHlzYWRkciAwIGhhcyBhIGZhdWx0IiA/DQoNClRoYW5rcyBhIGxvdCBm
b3IgdGhlIHJlbWluZGVyLCB0aGUgcGh5c2ljYWwgbWVtb3J5IGFkZHJlc3MgMCBjYW4gYWxzbyBo
YXZlIGEgZmF1bHQuIEl0IHNob3VsZCBub3QgYSBzcGVjaWFsIGFkZHJlc3MuDQoNCj4gDQo+IHRo
YW5rcw0KPiAtLSBQTU0NCg==
