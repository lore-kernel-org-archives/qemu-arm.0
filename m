Received: by 10.223.172.38 with SMTP id v35csp741150wrc;
        Wed, 13 Sep 2017 00:53:16 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4HdF2azQktyHUUvGdvEjti030/j5n2ALeBb0xjv6JgN7eAVTJY+o6TzcgWBICadB1KBKo2
X-Received: by 10.98.35.210 with SMTP id q79mr17368080pfj.340.1505289196821;
        Wed, 13 Sep 2017 00:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505289196; cv=none;
        d=google.com; s=arc-20160816;
        b=R+cO5TmkR7xmZQmt+Ga6hs2lMbh9+rGqEvIx2xkW3UqFFJvkPX5nph1OHbtFDQz1aN
         GrapI3XtBB7PM04Bp/ZYsDUZE0qP7uhrfgmShoNZZmxRGC0aiIlh03yuystjrvTOw+Xy
         yKfa+rByGh0Klz66NxTEnvPW8CKWfkCSEcgLjGoR29D2xIABtvpkNMBNgUWGbyQj73J8
         tbGvONnT/29u4wy5n7g9CapzfDU7LZPFMsfjCD28H9HyuS9hC4BCmwfug24iHahEszCv
         O2pAF9eSK2BaaGlMiLitqiSMj4XKbqTQsYRk/rz6Ue4nS9C/tGvCtWbUyf/moWM3i78F
         wyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=h2UPFUat6JpxAD3Y3P72nJlZn4ZiEbvMGLywX54b4GM=;
        b=favu6kFfc7AInCShUteZajs0F+Q8GkSjaNXYE3AezXJvfB4NZzy2f7m6TcZCLQ1Chu
         n/JabCijEl9cm+a2OLwf3LYtRC9EeUuCrnOHT2F85Dtu2wgUEiJREVNFfoorKsPA5Abe
         GwxvJKnzWOaUs5G/yKMF7qUA9JwnVmDeIhpSk9iCkdo8J4Kn/j69MZHznn6YD9Lfe2Fj
         RbMeBxMMydi5wRvpTGQodQfehp82cV72vrBtujxFgqS/aAJEWHTEWmg7WZ8yMfZpqqEm
         URPdR+I4P1RA5IuN0jrJ5OyCO7rJzZXBF/cPChdMG/LwBNvMRJED23rEw9Gvr2zhZsTJ
         rlOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 24si9217654pfn.337.2017.09.13.00.53.16;
        Wed, 13 Sep 2017 00:53:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751414AbdIMHxO (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Wed, 13 Sep 2017 03:53:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6463 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdIMHxM (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 13 Sep 2017 03:53:12 -0400
Received: from 172.30.72.60 (EHLO DGGEMS413-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DHD18566;
        Wed, 13 Sep 2017 15:52:32 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.301.0; Wed, 13 Sep 2017
 15:52:20 +0800
Subject: Re: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
To:     Peter Maydell <peter.maydell@linaro.org>, <james.morse@arm.com>
References: <0184EA26B2509940AA629AE1405DD7F2015FE17F@DGGEMA503-MBX.china.huawei.com>
 <CAFEAcA8J5wZ23kQypzcbUScUResjWnN6rDG0b0idD1rv7F5Fsw@mail.gmail.com>
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
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <5552cf68-b998-686b-8e7e-710399c2b014@huawei.com>
Date:   Wed, 13 Sep 2017 15:52:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8J5wZ23kQypzcbUScUResjWnN6rDG0b0idD1rv7F5Fsw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020201.59B8E3C2.00BF,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 15ca247d2cce4cb8bdac82ce9979ed6f
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: /0Byqh5umlG2



On 2017/9/12 0:39, Peter Maydell wrote:
>>>> +    return  kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_SEI, &syndrome);
>>> This looks odd. If we don't have the RAS extension why do we need to do anything at all here ?
>> This is because Qemu may need to support non-RAS extension as discussed with ARM James before.
>> That is to say host hardware CPU does not support RAS, but guest supports.
>> That is under discussion.
>> When host hardware supports RAS, specify the syndrome to a valid value, otherwise, set it to 0.
> If the guest CPU doesn't support the RAS extension then we have
> no mechanism for delivering it a notification about the
> memory problem at all, so setting the syndrome to anything
> doesn't make sense.
> 
> I'm not sure what you should do in the case of "host
> supports telling us about a memory problem and has
> done so, but guest does not support being told about it",
> but I'm pretty sure it shouldn't be this.
Hi peter,
   thanks for the comments.

   in short, if the hardware CPU does not support RAS extension, do you think whether the Qemu or guest OS
needs to support RAS(generate APEI table / record CPER / Error recovery).

CC James,

Hi James,
  you ever have below comments:

-----------------------------------------------------------------------
But you can use APEI in a guest on CPUs without the RAS extensions: the host may
signal memory errors to Qemu for any number of reasons.
------------------------------------------------------------------

in fact, I have a concern about it. If CPU without the RAS extension, the host should not deliver the sigbus.
in which case in your test that host still deliver sigbus without RAS?
