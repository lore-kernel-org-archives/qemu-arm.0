Received: by 10.223.172.38 with SMTP id v35csp1832214wrc;
        Fri, 8 Sep 2017 09:22:20 -0700 (PDT)
X-Received: by 10.98.163.156 with SMTP id q28mr3727576pfl.185.1504887740075;
        Fri, 08 Sep 2017 09:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504887740; cv=none;
        d=google.com; s=arc-20160816;
        b=MqfsMnXPFJCdrtKEjQAAJV2p9pJhU1SemZWxYGhNaNUbiSrWCPPQP/RLsuFTgWpybt
         TxeX2dQDbNS6A17oiQIl3L9+ZxpcX5p69o7BFJVTbEhfPep/h82FvMyDi7EIb+7W2F4v
         oKPf0o7e8ajz5IsvXbJ5KyRBvEMAjRmmjZpHC1YuYHLJzv6hPUohQWun6mFPaD3sOEWi
         lPr8lzVfXybH7lZdVtmLK49c+WCK7aLg7BzQ2Va02gqqZ3xY/QbfG9WBPxi9MTwuCK5Q
         ZcXHnJRYP7jr2FWhun50PmqPDepZYpZAyXf4XW6JjvrFZ7QwZbbhfGZiu66GGxdtATAs
         Osqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ova9C7igh6SnemrclqHDOFsuBIGMw1YLBb4QTXUg2rM=;
        b=0Um4/52kROW11zNdpRi5JIbfhEqiWyOGF37lYd3wVavzAScgE7xIyyu+nvIq0PVJRy
         DYMdWJy4T1cBAuzl63e6Q2xi6byUJ2QTQjhf85ZpwM6n6Gfy1leBWeLu3iiKxwWeFjAf
         nm8v75ljPJBAgVjEjHw+nbrPViZSuWInhMb1DNRRAyEDQFdUATDIMKNm+pMyUpJNln6k
         u0fn0pQ8HrlcO/TIo6bvxqoRatRe45GwwOI7vOjqLxsNL4aUZb55kl0+swNMPBiUv0Py
         TT+HUcr8jF9XME+nxAU9QwYSZDuLanywTwFpNoRDzTD36KJBOVoEIVALRs/ME67Bgo//
         uZpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=If0nwoGs;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l73si1828776pfi.84.2017.09.08.09.22.19;
        Fri, 08 Sep 2017 09:22:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=If0nwoGs;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756332AbdIHQWQ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 8 Sep 2017 12:22:16 -0400
Received: from mail-wr0-f172.google.com ([209.85.128.172]:35172 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756218AbdIHQWO (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 8 Sep 2017 12:22:14 -0400
Received: by mail-wr0-f172.google.com with SMTP id m18so5566128wrm.2
        for <linux-kernel@vger.kernel.org>; Fri, 08 Sep 2017 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ova9C7igh6SnemrclqHDOFsuBIGMw1YLBb4QTXUg2rM=;
        b=If0nwoGsGxbaKOUvfKflsvvp35ZRR59RgcauBPmu3kUR4gCMimUeumXa9rqj7SzZCP
         o/QOq4IESsc2POTuKGjqCxaWHwcH6Jch2/wB/9BeNSKMS74XAZF+4Gi/MWfm4vG7Kmgv
         hUrPPGhDCFKb1ahQisXJD6i3AV1wfa9XuHq8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ova9C7igh6SnemrclqHDOFsuBIGMw1YLBb4QTXUg2rM=;
        b=QxwszrBvW32H7hWvHRQOaPH5Z3SWvWeNPXQnNw+0i+rgymqsLsziQjeNtClPAIzI6E
         rTFIs+kF82DQhGVn5nWv/BO3OMqURAx4wrOSL9qjKC9tFZbi2CUPV/dtOJ0WK13oRXPk
         TFFUEQsyM+ukOdOai0pZWUMminr/Fsw8XECZQ2oAhUVjDbZATuQaDblO/dFXTiL7ZpZl
         lfcEAgbmHoCXe6z/cNlKAsDK2ohXw0xLhrIyvHNGL4Wq5lFUQwS1ukuF4HAJ7r5w61W7
         4Rq02W4Z7HllrF5vx3L+lTsN3VXrH9DDuz9HxP7hT2E43PllJWAoonehwgWzomxLdccx
         CbZw==
X-Gm-Message-State: AHPjjUhB76qmZYo9keQVJi5DP8RgM3IresuvdNcGvMTzWCJdXotdAyD7
        xNDIA+7IL2cNqz3QvnvzEjEAjUFtxBfmJWQ=
X-Google-Smtp-Source: ADKCNb7FNFO3El26zdjqBGOTprP1J+kHChFOii8oHHQkRkFAIm3bGweQI+siE15p4dZRZQ00TcBCHHqFGzaX8i0fitY=
X-Received: by 10.223.142.82 with SMTP id n76mr2657396wrb.272.1504887732870;
 Fri, 08 Sep 2017 09:22:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 8 Sep 2017 09:21:52 -0700 (PDT)
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F2015F5F11@DGGEMA503-MBX.china.huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F2015F5F11@DGGEMA503-MBX.china.huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 8 Sep 2017 17:21:52 +0100
Message-ID: <CAFEAcA8HPhHeeXEDtxnewJ7mAJ-gYzR96pC06qA+Xx95LHu2DA@mail.gmail.com>
Subject: Re: [PATCH v11 5/6] target-arm: kvm64: handle SIGBUS signal for
 synchronous External Abort
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Zhaoshenglong <zhaoshenglong@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        James Morse <james.morse@arm.com>,
        Tyler Baicar <tbaicar@codeaurora.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>, "bp@suse.de" <bp@suse.de>,
        Shiju Jose <shiju.jose@huawei.com>,
        "zjzhang@codeaurora.org" <zjzhang@codeaurora.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        John Garry <john.garry@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>,
        "Wangzhou (B)" <wangzhou1@hisilicon.com>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        Wuquanming <wuquanming@huawei.com>,
        Linuxarm <linuxarm@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: IAaooKqz0Hgd

On 8 September 2017 at 17:17, gengdongjiu <gengdongjiu@huawei.com> wrote:
>>
>> This code has all just been copied-and-pasted from target/i386/kvm.c.
>> Please instead abstract it out properly into a cpu-independent source file.
>
>
> Yes, it copied from x86.
> Do you mean abstracting this code to a common folder so that i386 and arm platform share it?

I mean it should go into a common source file (perhaps
accel/kvm/kvm-all.c).


>> What is this ??? You should never need to look up things in the cpreg arrays by fieldoffset.
>
>
> I used it to set the esr_el1's and far_el1's value, for example:
>
>   /* set ESR_EL1 */
>   ret = kvm_arm_cpreg_value(cpu, offsetof(CPUARMState, cp15.esr_el[1]));
>
>   /* set FAR_EL1 */
>   ret = kvm_arm_cpreg_value(cpu, offsetof(CPUARMState, cp15.far_el[1]));

Yes, I saw that, but I have no idea why you think that's
the right way to set register values. No other code in
QEMU does this.

> So use the added API kvm_arm_cpreg_value() to set their value.
> If not used it, do you better method to set their value?

I suggest:

>> The code for handling debug exits (software step, watchpoint,
>> etc) is probably a good place to look for how to deal with register state.

>> Any new globally-visible function prototype in a header should
>> have a doc-comment formatted documentation comment, please.
>
>
> Ok, thanks for this reminder. Do you mean I need to add comments
> for this globally-visible function, such as below:
>
> /*
>  * xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>  */
> void kvm_hwpoison_page_add(ram_addr_t ram_addr);

It should be in the doc-comment format, which begins
"/**" and has some stylization of how you list parameters
and so on. Lots of examples in the existing headers.

thanks
-- PMM
