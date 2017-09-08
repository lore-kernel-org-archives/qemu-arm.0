Received: by 10.223.172.38 with SMTP id v35csp1853177wrc;
        Fri, 8 Sep 2017 09:41:42 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6hwWdin1O0z+i7Sa/UhzkKEvx1QyxJwnNPZQD+29C20EaXTfMCDehoiaq+BX2xMjB6YGlH
X-Received: by 10.84.130.35 with SMTP id 32mr4084560plc.368.1504888902389;
        Fri, 08 Sep 2017 09:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504888902; cv=none;
        d=google.com; s=arc-20160816;
        b=F7nFgM5Ij1P/BAt7q5NZhKXaz30fmJWYXkQY1Nb5oI/wesjFSf7iAdeB0tgPGA6Iot
         yYIZdckhhgp1AxUxqEyeqaItAb4LbRVLZ378m8QhjxLhmFdqjy6CsvowhaWFOz8onO1S
         Pjuc4XAxK0nDblP9qRneHIGnYYsyxotCx3eu7x885paatpnmyT9HW8kTlR05rkh410Di
         wH1SzCw1SbsT//yn93/Di0eycnq1/Qm8eEmUPm7vjGpKnNfnUlbpzyuAvWBlqOAR+wQC
         MQMsNb+6SXqg7IWAFdbuNKCKMkgF1YEZVhCZrj63qqbBrbwEacwV7H+7aI+yv10dAZxE
         ewtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from
         :arc-authentication-results;
        bh=e8tynqSFV006YvZcqA6w0G3e0zclRbSaXda9SROYJXc=;
        b=ePjqC9B3o1uj82d97GyC0r97G3DqYxNyRsnuaNTP2vt65VsWbk8uEeDmcOikiVHUKC
         ZfdGHzpQZiFA3CtTOLSHRHZclUOdrbztrGG2To6qJbfSAioIqKB0aL3XuZL2eaR01aQg
         MHgHF5SUf1mZber4AdfCjKh8lA9Exflo5vPu4vgDGXLDBUFFD5dAEZ0LQ8aOzYiH0YD6
         JPj+SdYLlUNXmvPFVVaA4eoP4XqTp4UabaUTlvQIvgzTws/0lr2m+ztmsL2J2jzDUF8Y
         w8uKFX9dVJgqwC2Osy57Vw9rSX8ViYQ/hgGhHYNIBcBJmwSgn92C3EYxgDiMU6/uPIf/
         L0VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 31si1898862pli.216.2017.09.08.09.41.42;
        Fri, 08 Sep 2017 09:41:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756570AbdIHQli (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 8 Sep 2017 12:41:38 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:11833 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754599AbdIHQlg (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 8 Sep 2017 12:41:36 -0400
Received: from 172.30.72.53 (EHLO DGGEMA404-HUB.china.huawei.com) ([172.30.72.53])
        by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id AUZ68197;
        Sat, 09 Sep 2017 00:41:04 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.143]) by
 DGGEMA404-HUB.china.huawei.com ([10.3.20.45]) with mapi id 14.03.0301.000;
 Sat, 9 Sep 2017 00:40:51 +0800
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
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjExIDUvNl0gdGFyZ2V0LWFybToga3ZtNjQ6IGhh?=
 =?utf-8?B?bmRsZSBTSUdCVVMgc2lnbmFsIGZvciBzeW5jaHJvbm91cyBFeHRlcm5hbCBB?=
 =?utf-8?Q?bort?=
Thread-Topic: [PATCH v11 5/6] target-arm: kvm64: handle SIGBUS signal for
 synchronous External Abort
Thread-Index: AdMotzo77KrXAu/nR2mgQkVAQIVn8///iJcA//91ePA=
Date:   Fri, 8 Sep 2017 16:40:51 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F2015F5FE7@DGGEMA503-MBX.china.huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F2015F5F11@DGGEMA503-MBX.china.huawei.com>
 <CAFEAcA8HPhHeeXEDtxnewJ7mAJ-gYzR96pC06qA+Xx95LHu2DA@mail.gmail.com>
In-Reply-To: <CAFEAcA8HPhHeeXEDtxnewJ7mAJ-gYzR96pC06qA+Xx95LHu2DA@mail.gmail.com>
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
        refid=str=0001.0A020203.59B2C824.018C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=169.254.1.143,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7741edccd84342b0831dbd89f203638a
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: wojRvSHRYfNB

Wy4uLl0NCj4gPg0KPiA+IC8qDQo+ID4gICogeHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4
eHh4eA0KPiA+ICAqLw0KPiA+IHZvaWQga3ZtX2h3cG9pc29uX3BhZ2VfYWRkKHJhbV9hZGRyX3Qg
cmFtX2FkZHIpOw0KPiANCj4gSXQgc2hvdWxkIGJlIGluIHRoZSBkb2MtY29tbWVudCBmb3JtYXQs
IHdoaWNoIGJlZ2lucyAiLyoqIiBhbmQgaGFzIHNvbWUgc3R5bGl6YXRpb24gb2YgaG93IHlvdSBs
aXN0IHBhcmFtZXRlcnMgYW5kIHNvIG9uLiBMb3RzIG9mDQo+IGV4YW1wbGVzIGluIHRoZSBleGlz
dGluZyBoZWFkZXJzLg0KDQp1bmRlcnN0YW5kLCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4N
Cg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K
