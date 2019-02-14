Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp378637wrp;
        Wed, 13 Feb 2019 17:10:39 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib+QTtZ4TfgPiDsYsaYn4IZZFG2XAZji35uAJMoyhsuc86GPGfzpQK7rT+tO4ZuuWf2ty8Q
X-Received: by 2002:aca:644:: with SMTP id 65mr685916oig.21.1550106639229;
        Wed, 13 Feb 2019 17:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550106639; cv=none;
        d=google.com; s=arc-20160816;
        b=s+qM7jP1aKdu8f9/LkCKzOxq2cSwwx32VeU9dD8Kkz60iNvykWRMfTUNnvMbi8lNY5
         IdJaKBbmbMrlXRiv5w+aLHsSZRBP9wg+cVDKkxxnAJrxx5Gheyf593PAjJFmdJUzDNUn
         NvfeIU9f2BtWlnJRPvyCvYQX1OZxdZTXmrdl9/M6UaSapW3+CpJrVXdCRYy04xr89HEh
         mybJELhFO6L5iTv37xopVddb1XywiK39NufB6uBoDahtDa2O4RLx5eAp+7E3Ueji8vsM
         Wil3o6tWjxYKRwggueH6iyDyOd8aoMHgeJjvqab3ijIhGMRqneIXjLzNeextuAQzatVv
         uZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=HTZ2/KVGPd3R0ndwLlD4s8AMPAxIxMU6s81B6HTFGpA=;
        b=lj3HI1Z7TLFCII31RXxrxlTuS1OQxh62mAuvXoYVNUmGFzazNJNto2tvCJqG3+TpUv
         Ld08SlSLs4eCbzVenu4Q8nYg/RNmeFPAEq9ncMD1+BOkUDJXtzZSsHSTbBRu10hCI5nn
         UGfr9d1YFKxQwuyKOT4Yn+Xr7C6C36QKF9N2CjMXDfRSHJ6teLfnW0NJPrl47H8Y5iRw
         NL9YE53mAcB6lrQwxpbAEwoWr/e4LyxKYamB/1ZMUG0M6mKrQAUw8XBlOWhwR1r1Hpq4
         jEKormEvfXB+EWYIBSVt+jeRxJ8Z27uEFFikiqvvnF/Z7xFKaLmJSaFM/VIY++GBLhMp
         MfBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.190 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga04-in.huawei.com. [45.249.212.190])
        by mx.google.com with ESMTPS id h128si370692oif.269.2019.02.13.17.10.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Feb 2019 17:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.190 as permitted sender) client-ip=45.249.212.190;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.190 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 697F57D6FCDB146DEB91;
	Thu, 14 Feb 2019 09:10:34 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.408.0; Thu, 14 Feb 2019
 09:10:29 +0800
Subject: Re: [RFC] arm: Allow system registers for KVM guests to be changed by
 QEMU code
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
References: <20181206151401.13455-1-peter.maydell@linaro.org>
 <87ftsrird3.fsf@zen.linaroharston>
 <CAFEAcA_GPW0B9bMOia_aB=H0PV8DwUNWBARz+uNbRk2565a+4w@mail.gmail.com>
 <87bm3figs9.fsf@zen.linaroharston>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <9ac389c6-fa1b-70ca-d3f9-254e11bf5ce1@huawei.com>
Date: Thu, 14 Feb 2019 09:10:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87bm3figs9.fsf@zen.linaroharston>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-TUID: 0tjoQdpx9y0C

I think Peter's patch is good, I will resubmit my series patches based on this.

On 2019/2/14 4:18, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Wed, 13 Feb 2019 at 16:29, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> At the moment the Arm implementations of kvm_arch_{get,put}_registers()
>>>> don't support having QEMU change the values of system registers
>>>> (aka coprocessor registers for AArch32). This is because although
>>>> kvm_arch_get_registers() calls write_list_to_cpustate() to
>>>> update the CPU state struct fields (so QEMU code can read the
>>>> values in the usual way), kvm_arch_put_registers() does not
>>>> call write_cpustate_to_list(), meaning that any changes to
>>>> the CPU state struct fields will not be passed back to KVM.
>>>>
>>>> The rationale for this design is documented in a comment in the
>>>> AArch32 kvm_arch_put_registers() -- writing the values in the
>>>> cpregs list into the CPU state struct is "lossy" because the
>>>> write of a register might not succeed, and so if we blindly
>>>> copy the CPU state values back again we will incorrectly
>>>> change register values for the guest. The assumption was that
>>>> no QEMU code would need to write to the registers.
>>>>
>>>> However, when we implemented debug support for KVM guests, we
>>>> broke that assumption: the code to handle "set the guest up
>>>> to take a breakpoint exception" does so by updating various
>>>> guest registers including ESR_EL1.
>>>>
>>>> Support this by making kvm_arch_put_registers() synchronize
>>>> CPU state back into the list. We sync only those registers
>>>> where the initial write succeeds, which should be sufficient.
>>
>>> [snip a long test setup that I didn't really understand]
> 
> Sorry that was just making sure I'd documented the exact steps of the
> manual test for posterity.
> 
>>
>> I'm confused -- I'm not sure if the things you're saying
>> didn't work:
>>  (a) didn't work before this patch and still don't
>>  (b) used to work and are broken by this patch
>>  (c) used to not work and are fixed by this patch
> 
> option (c) - this patch has made things better hence the t-b and r-b
> tags. I might send you a follow up if we can also have single-step
> working as well but that requires me to test a kernel patch (and remove
> the error leg for guest single step in kvm64).
> 
>>
>> More generally:
>>  * this patch claims to fix the code path where QEMU sets
>>    up the guest to take a breakpoint exception (specifically
>>    making our change of ESR_EL1 actually take effect) -- so does
>>    it do that? Or is it impossible for that code path in QEMU
>>    to be used (if so, can we just remove it) ?
> 
> No it's needed - I'm observing exceptions coming through the path and
> then being delivered to the guest while the host is debugging - modulo
> the you can't have active HW breakpoints in both guest and host at the
> same time.
> 
> Even here now we are sure the guest state is correctly reflected we
> could make the debug code smarter and try it's best to preserve guest
> debug regs while using it's own entirely in userspace. But I suspect
> that is a bit niche.
> 
>>
>> thanks
>> -- PMM
> 
> 
> --
> Alex Bennée
> 
> .
> 
