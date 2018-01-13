Received: by 10.28.173.206 with SMTP id w197csp381797wme;
        Sat, 13 Jan 2018 00:28:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBovzXN7ht80q4WuVzguhPzh036V2e4wKdALI4TcjVD1OmAJLO9m73q0UnIBkJ//ETMtbrY0G
X-Received: by 10.101.80.204 with SMTP id s12mr6746593pgp.185.1515832087375;
        Sat, 13 Jan 2018 00:28:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515832087; cv=none;
        d=google.com; s=arc-20160816;
        b=tel7Xt869bcTr1wihhrZamqZHjx5c/MpK/EiwWQl+7Ofx1lPMhuLiDP9EGXY2bDVh1
         klL2rRTJrUfYEChZ1h8QkPPdyDzxhxlcBJ7EWAK0t7t8Aa74qkI+PMgunO78C6XjJKhC
         mLhEso70DvumoR+H1SVbs6Tcxib6R7TH6jp4hrAtgxDbc3Vjpe2kgnQqjyEjv7VhK7oC
         lc3GLRJw3Zt+QZeTIYdvpZW5WTdCTuWnaX4kAapmM8DMS8bKTn8CyeM5BHRrJY7opIHI
         pDb8GNKYWbgkOhnvvlgxgV2z+hzyA3mlxLHfaJzAqEjg5+fp2u+srl3D52HWL7PRCjNy
         s0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:arc-authentication-results;
        bh=uXakbHZokBQkWmmL0HbCKnLKSnTL8HcrkCCWD9ePjrM=;
        b=YyZ+J3JUa30ff68ioaTI5RMuY9G9jC0/j5GMHrzwvpvSZLEBiUCISrkSiDvBiXCORL
         nLbSblSKEs9gC1WuQqYAfCXUHN+5gCb9VYu275CtQLhNC7xRya0P60bD8cr4EVtoJ5Hi
         gVOvoUYWNaEMauNgd20pFKTViL4X/k4dy4fZRWC1LwqWwEAs1dAxyYVtSyVk6kZ7SaH3
         WnriyvaezV0bl9SakMtfT2oa4yqnzKNZDzUZjyw2yaLETCOFodG0BOyOnYLmXeYU8Vp8
         q72TBNaoQOHGajoUk0cT8bqSFkak+tAzS4hStUYFw+E0cX4Ymo/vJC88TTQ/EacxSVtq
         pGOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f184si4725902pgc.696.2018.01.13.00.28.06;
        Sat, 13 Jan 2018 00:28:07 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754813AbeAMI2E (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Sat, 13 Jan 2018 03:28:04 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:47312 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754647AbeAMI2D (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 13 Jan 2018 03:28:03 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 9C917BF296982;
        Sat, 13 Jan 2018 16:27:39 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.361.1; Sat, 13 Jan 2018
 16:27:34 +0800
Subject: Re: [PATCH v14 5/9] target-arm: kvm64: inject synchronous External
 Abort
From:   gengdongjiu <gengdongjiu@huawei.com>
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
 <f6853acc-ca07-9627-32e6-91240c6669b7@huawei.com>
Message-ID: <bf79cd19-c1d0-16db-7d6b-36784bc8aa02@huawei.com>
Date:   Sat, 13 Jan 2018 16:27:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <f6853acc-ca07-9627-32e6-91240c6669b7@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: eX+58+XF57Oc

Hi Peter,

On 2018/1/13 13:24, gengdongjiu wrote:
>>> +
>>> +    /* For the AArch64, instruction length is 32-bit */
>>> +    esr |= ARM_EL_IL;
>>> +    env->exception.syndrome = esr;
>>> +
>>> +    cc->do_interrupt(c);
>>> +
>>> +    /* set ESR_EL1 */
>>> +    ret = kvm_arm_cpreg_value(cpu, offsetof(CPUARMState, cp15.esr_el[1]));
>> Breakpoint injection doesn't need to do this. Neither should this code.
> As my above explanation, in the KVM mode, it needs to set the ESR_ELx in extra method.
> the cc->do_interrupt(c) does not set ESR_ELx. so I use kvm_arm_cpreg_value()
> to set it. whether you have better method to set the ESR_Elx except for my method?  Thanks.

If QEMU changes the KVM's registers, it needs to call write_list_to_kvmstate() to write the cpu->cpreg_values[] list
to KVM through KVM_SET_ONE_REG IOCTL[1]. In Qemu, now it should not have software path to change the cpu->cpreg_values[] list
except write_cpustate_to_list(). Here I can also call write_cpustate_to_list() instead of kvm_arm_cpreg_value() to change
cpu->cpreg_values[] list, but the write_cpustate_to_list() will write all the coprocessor state to the cpu->cpreg_values[] list,
we can not sure all the coprocessor states are right, so here I only change corresponding index value in this list using kvm_arm_cpreg_value().

Breakpoint injection that you mentioned should not change KVM register or not in the KVM mode.

[1]:
 kvm_arch_put_registers()
  -> write_list_to_kvmstate()
    -> write cpu->cpreg_values[] to the kernel KVM through KVM_SET_ONE_REG

> 
> 
>>> +    if (ret) {
>>> +        fprintf(stderr, "<%s> failed to set esr_el1\n", __func__);
>>> +        abort();
>>> +    }
>>> +}
>>> +
>>>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
>>>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>>>
>>> --
>>> 1.8.3.1
