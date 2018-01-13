Received: by 10.28.173.206 with SMTP id w197csp259883wme;
        Fri, 12 Jan 2018 21:26:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBot27KsUMQkn1vXeRdUx1z1De1qGxz93VaGnVyB7md4h3TdJWw7VkkS5RYqyHY0GlvEdLnSo
X-Received: by 10.98.24.22 with SMTP id 22mr15774696pfy.65.1515821171562;
        Fri, 12 Jan 2018 21:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515821171; cv=none;
        d=google.com; s=arc-20160816;
        b=iHh8CydE8Lv/IYsyclJNIaWUkAOlotEghRyB2gz9sBqOgJWI12TjOsLjgHuI0YeNb7
         m5yW6eDmI4GtlBxYEBkrVl2M1H5JAxbSzCz0II6wt+r4U3bXzeQHJ01F1TzWbXUE74sw
         ThxvSes1NWUhAEG0Q7dQSXO5NfENMmnuIbSZZgcIfenUPHNnGiVcKRj6DOliRh0iB2eK
         ljb6ksdn+fbqS5xasp1QeTrag8GW0sc4cyUXZTDmHjsVzia5j9DP3318ualtAQad/j2i
         UyDeoj0KZfxchdDwi9qSAb/ALki4sOlnhqIf+wwSQ5QOcln+MDV8AfaJ6fx5iQoc/V6Q
         4KuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=azL609AeOPr+d2OOhbTaSqJm4y3iIXRWM7TKnu9rd7c=;
        b=fdoSyG+JD6pzBrbQMYw7YW55xiPaG5rSn9N8xJ0rUd4nD9zxhqc7uBM83GLnTRCtom
         XS9fbHq6wUbOX7FoOgB9kQNcfBHk6JTxWJjZvt1NvclpTNISIb2jAQnOPABkAZWmWjf/
         fP/SmMZQwKINgw8j0QVA2VdCJvxiksBExQSPto6DAwh0SYSlYSa30cCL09JPKPO2UIFk
         i54xTA3+1MhPiKwT3ZKeHW0pPcZbO4S+IJoXi6u4XCeZHQZY4EnPzEsnJJiKDK5k5XXo
         Jel8NUrcptnbkhTv/9jVBEja3gR9Aa6cGmECETCKUjOqQpk2r7h4OgcyFfFhkJUmyxiL
         PZuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v186si9093635pfb.284.2018.01.12.21.26.10;
        Fri, 12 Jan 2018 21:26:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750764AbeAMF0I (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Sat, 13 Jan 2018 00:26:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:4218 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750705AbeAMF0H (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 13 Jan 2018 00:26:07 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3F846B6AF7EBA;
        Sat, 13 Jan 2018 13:25:52 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.361.1; Sat, 13 Jan 2018
 13:25:47 +0800
Subject: Re: [PATCH v14 5/9] target-arm: kvm64: inject synchronous External
 Abort
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "James Morse" <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-RC6hUMR5jPrgOB7nkWjXaPxo6dYEXO=kgC=59k7EVrw@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <f6853acc-ca07-9627-32e6-91240c6669b7@huawei.com>
Date:   Sat, 13 Jan 2018 13:24:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-RC6hUMR5jPrgOB7nkWjXaPxo6dYEXO=kgC=59k7EVrw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: TD1vg3+lt0TJ

Hi Peter,

>> +static int kvm_arm_cpreg_value(ARMCPU *cpu, ptrdiff_t fieldoffset)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < cpu->cpreg_array_len; i++) {
> 
> This is still absolutely the wrong thing to do. Nothing should
> need to scan this array like this.

For the KVM mode, I use this function to set the ESR_ELx's value. If not set it using this way, do you have better method? Thanks!
From my test, if kvm_inject_arm_sea() does not call this function kvm_arm_cpreg_value() to set the ESR_ELx's register, the guest
will have wrong ESR value. As shown the log in [1], QEMU sets the ESR to  0x96000414, but the guest's ESR value is 0x56000000 instead of 0x96000414.

[1]:
Taking exception 4 [Data Abort]
...from EL1 to EL1
...with ESR 0x25/0x96000414
...with FAR 0x0
...with ELR 0xffffff8008081a80
...to EL1 PC 0xffffff8008081a00 PSTATE 0x3c5

[   16.974756] Bad mode in Synchronous Abort handler detected on CPU0, code 0x56000000 -- SVC (AArch64)
[   16.989504] Internal error: Oops - bad mode: 0 [#1] SMP
[   16.990753] Modules linked in:
[   16.991462] CPU: 0 PID: 204 Comm: sh Tainted: G        W       4.13.0-rc4ajb-00005-g1353b1e-dirty #40
[   16.993533] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
[   16.995083] task: ffffffc03d3c2b00 task.stack: ffffffc03d2b0000
[   16.996448] PC is at vectors+0x280/0x784
[   16.997340] LR is at pl011_tx_empty+0x18/0x40


> 
>> +        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>> +        const ARMCPRegInfo *ri;
>> +        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
>> +        if (!ri) {
>> +            continue;
>> +        }

[...]

> 
>> +
>> +    /* For the AArch64, instruction length is 32-bit */
>> +    esr |= ARM_EL_IL;
>> +    env->exception.syndrome = esr;
>> +
>> +    cc->do_interrupt(c);
>> +
>> +    /* set ESR_EL1 */
>> +    ret = kvm_arm_cpreg_value(cpu, offsetof(CPUARMState, cp15.esr_el[1]));
> 
> Breakpoint injection doesn't need to do this. Neither should this code.
As my above explanation, in the KVM mode, it needs to set the ESR_ELx in extra method.
the cc->do_interrupt(c) does not set ESR_ELx. so I use kvm_arm_cpreg_value()
to set it. whether you have better method to set the ESR_Elx except for my method?  Thanks.


> 
>> +    if (ret) {
>> +        fprintf(stderr, "<%s> failed to set esr_el1\n", __func__);
>> +        abort();
>> +    }
>> +}
>> +
>>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
>>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>>
>> --
>> 1.8.3.1
> 
> thanks
> -- PMM
> 
> .
> 
