Received: by 10.223.172.38 with SMTP id v35csp950144wrc;
        Wed, 13 Sep 2017 04:52:36 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4cJxcCSq4qbtVATVIKniLYfvUb4MNad6O77z1BzEAAJefuwqMYeaH54Q1vOQfEifLZtG/s
X-Received: by 10.98.213.201 with SMTP id d192mr18187421pfg.210.1505303556455;
        Wed, 13 Sep 2017 04:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505303556; cv=none;
        d=google.com; s=arc-20160816;
        b=uhg/Uxjl/KEUsxxctywSAK55xyWyUo0RSFWhrwuk1lYIBbzRiSNPpYlN+DJ/b35eCo
         dULYRKscMLmRq3cI+ljZqluG5jpZvJ/x6+Mw1iULGE59yFWDI631lfTtflZ8rIfwR7ys
         3h9mwGebosJ9DPNojOg3Hx1zYCguWlwfbraJ2FdYYEa23hDOIG9t9rrCobC5cArcxw4i
         PB54rNAmORI0U101i8e9f/VV8MnwyHqhCiys2IZ3LloO0jTccvNiWIdl57wZ/uYEMcNr
         zmS1aKeWpwBhv1T/1GtOovwXE4fXtBWHjG07UBN9iecExtvzfXyZlWPR+5x9oJ8rDgTP
         fygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=7ynODYN4+AolAHxqdyizoWghYv5EnUz4Mqo51mXy56o=;
        b=wNmPOMe01fxg9D1mi/eNsYIfERQWNzzSTDuwx4e6h9+QIfNuTBvJuLrkBUtZQND89e
         TEyiKXS069bOW6cKLA/xNSYY6pxFtbkwL+fPiQ8r+1rvF4vQJxlahs2PVCcr4uBW23D1
         95HhfwW1BHXkPB3MT8K6iZt59UakeqJ6ecTSCxqHqXjp5x80yBjX6tApTkxGatyHmCT6
         fkRmp34hoteNJ1wxTWjYCtpChAFg2m8GYTGV6rvX+SdopBcub8n8C5LwKlypw0YhQ6w1
         K4HLomDRZ85V/+lYV7a843tTe2bdfrJkldWjxN1Tw8L8yo3uce3RbtXzzThRVPT0eEzX
         xvEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i90si5847850pli.615.2017.09.13.04.52.36;
        Wed, 13 Sep 2017 04:52:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751951AbdIMLwd (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Wed, 13 Sep 2017 07:52:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6473 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751380AbdIMLwa (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 13 Sep 2017 07:52:30 -0400
Received: from 172.30.72.59 (EHLO DGGEMS405-HUB.china.huawei.com) ([172.30.72.59])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DHD52775;
        Wed, 13 Sep 2017 19:52:10 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.301.0; Wed, 13 Sep 2017
 19:51:59 +0800
Subject: Re: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
To:     Peter Maydell <peter.maydell@linaro.org>
References: <0184EA26B2509940AA629AE1405DD7F2015FE17F@DGGEMA503-MBX.china.huawei.com>
 <CAFEAcA8J5wZ23kQypzcbUScUResjWnN6rDG0b0idD1rv7F5Fsw@mail.gmail.com>
 <5552cf68-b998-686b-8e7e-710399c2b014@huawei.com>
 <CAFEAcA_zO_-kDYb0MkW=p5oY6tQPk4PpCqZoG0_01pn=sa3upw@mail.gmail.com>
CC:     James Morse <james.morse@arm.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Zhaoshenglong <zhaoshenglong@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Will Deacon <will.deacon@arm.com>,
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
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c105c670-6aec-32cd-d32b-30642819323e@huawei.com>
Date:   Wed, 13 Sep 2017 19:51:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_zO_-kDYb0MkW=p5oY6tQPk4PpCqZoG0_01pn=sa3upw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.59B91BEB.00A1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 15ca247d2cce4cb8bdac82ce9979ed6f
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: QyM6ZegxJEGZ



On 2017/9/13 18:52, Peter Maydell wrote:
> This question seems to be not really related to the review
> comment that it is responding to.
> 
> (1) If the host does not support notifying us about
> errors, then there is clearly nothing to do in this
> code, because we will never get a notification.
> 
> (2) If the host does support notifying us about errors,
> but we choose not to expose RAS to the guest, then
> there's not much to do either. We probably just want
> to take whatever the default behaviour is for any
> application when it touches memory that's bad.
> We definitely don't want to tell the guest anything.
> 
> (3) If the host supports notification, and we choose
> to expose RAS to the guest, then we need to do
> whatever we have to do to notify the guest.
> 
> If we're in this signal handler and also
> arm_feature(env, ARM_FEATURE_RAS) is false then that
> is case (2), and my point is that doing anything with
> the guest 'syndrome' value looks like the wrong thing.

Peter,
  your explanation is clear. OK, understand, thanks.
