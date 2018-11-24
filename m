Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3002713wrt;
        Fri, 23 Nov 2018 23:14:59 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VPcGPkuj3Zvi7HnxDnBHKbTqN2JhiLa4+ZE265IBmKZQAMbrAkYA9x0ZwMLgKfpgEVdn/T
X-Received: by 2002:a9d:4c88:: with SMTP id m8mr10990128otf.360.1543043699403;
        Fri, 23 Nov 2018 23:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543043699; cv=none;
        d=google.com; s=arc-20160816;
        b=v0p78R6PDfOleTrH9k2Q8VYY6Ly3CusuNd48C7gt4GvtphbZeu1p3VRCnuhqmzHwLu
         ewqq1w1UVSwy2+m7xCWm4GJXBTlIEUtvOiHpmOFkJtC/1buW73C79bctal17NnA1pO3D
         c16aXdh8aEyFx6WwAB88MPMypZyRhDK7pmdLGb/4OBJZzTi+jhx8EnhXXgaJ5MFI+JRC
         jOGtk3cn56DYL6UlTrOsMyptdslgdR0HM/A4zIR3klWKJdD2C/8OltPt1HqCjqK0Tdze
         VLIZniHzNVM8FBK9JbcjceJTjYRMQvfapj9FGEANVvOSiQqv7YPQCquIU7UIJ9v1RjKs
         A3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=5xJYiXneoSd9nMNXd9WGU/rYHvkwE/j7Txko828WA74=;
        b=vvMQKJS97+d46hNb7q6IpLUmd9o3rBbpWJh4DEe5fT17gqW4B/ExDiE5LyjcUr+EwN
         zIxl2OJOiLH6oVEOGDrk1UBfogo9mL5k00WGSfZ3Ei3yZzFqG7fyxt3q73RsnfPbHq7r
         NiUGcM8MHDeSJIfX8kSTkZoUuf1EEiOvf/D+gkt9ilBDISrNOJHs1hIxv7X+kORIbXAA
         2ATf/+k5pJDnnr0EuAU8YnGtBDN6vH9+OCOEsvfloCkEBN9A82lZt5PuC4wLL7+6CNM8
         Al7JyTmfubVEwWwGkWAiIRqxcwuyBhXBxejrKcmfuzK7sw6dGMhe26FUv+Zk+KBohH8H
         FsNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.191 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga05-in.huawei.com. [45.249.212.191])
        by mx.google.com with ESMTPS id d141si13249697oig.122.2018.11.23.23.14.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Nov 2018 23:14:59 -0800 (PST)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.191 as permitted sender) client-ip=45.249.212.191;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.191 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 548F2781A4910;
	Sat, 24 Nov 2018 15:14:55 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Sat, 24 Nov 2018
 15:14:46 +0800
Subject: Re: [PATCH RESEND v15 08/10] target-arm: kvm64: inject synchronous
 External Abort
To: Peter Maydell <peter.maydell@linaro.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>, Marc Zyngier
	<marc.zyngier@arm.com>, James Morse <james.morse@arm.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, "Richard
 Henderson" <rth@twiddle.net>, Zheng Xiang <zhengxiang9@huawei.com>, "Eduardo
 Habkost" <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>, Shannon Zhao
	<shannon.zhaosl@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm
	<qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <0184EA26B2509940AA629AE1405DD7F201F7BBE8@DGGEMA503-MBX.china.huawei.com>
 <CAFEAcA_abaoxA=myPszVrO59-hSazHAePRJXUCHKSFnoEdsfiw@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <997764b7-64b6-20f4-a38d-baefb055cff9@huawei.com>
Date: Sat, 24 Nov 2018 15:14:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_abaoxA=myPszVrO59-hSazHAePRJXUCHKSFnoEdsfiw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-TUID: BZaVThSSmMbx

Hi Peter,

On 2018/11/24 2:45, Peter Maydell wrote:
> On Wed, 21 Nov 2018 at 14:34, gengdongjiu <gengdongjiu@huawei.com> wrote:
>>
>> Hi Peter,
>>   Thanks for the review and comments.
>>
>>>
>>> On 8 November 2018 at 10:29, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>>> +bool write_part_cpustate_to_list(ARMCPU *cpu, ptrdiff_t fieldoffset)
>>>
>>> What is this about? Nothing else in QEMU needs to mess with the cpustate synchronization. My first assumption is that you should not
>>> need to do so either.
>>
>> We should change the guest CP15 ESR_EL1's value, the only method is to change the cpu->cpreg_values[] in QEMU, then QEMU call write_list_to_kvmstate()
>> to set the cpu->cpreg_values[] to KVM which include the specified ESR_EL1 value, KVM do world switch, and then set the specified ESR_EL1's value to guest kernel.
> 
> Ah, I see. This is a bug in our current handling of the register
> state, where we implicitly assume that nothing in QEMU will ever
> want to change any system register values. This assumption is
> now false -- kvm_arm_handle_debug() broke it -- so we need to
> fix the code that does kvm_arch_put_registers(). There is a comment
> in the kvm32.c version of that function about this. (The kvm64.c
> version has the same assumption but doesn't comment on it.)
> 
> We should (ideally) fix this bug in the code that does register
> syncing, without requiring places in QEMU that update system
> registers to have to manually indicate which registers they have
> changed. I'll have a think about how best to do this.

Ok, it is great that you will think about it, waiting for your wonderful solution

> 
>> About the detailed explanation, as shown in [2].
>>
>> kvm_arm_handle_debug() does not need to do this because QEMU does not need to change CP15 registers, such as ESR_EL1.
> 
> kvm_arm_handle_debug does change ESR_EL1: it is injecting an exception
> and so should set the exception register. This happens when it
> calls the do_interrupt() hook, because arm_cpu_do_interrupt_aarch64()
> writes to env->cp15.esr_el[new_el].

Yes, I see it, but the env->cp15.esr_el[new_el] shouldn't be successfully set to KVM when call kvm_arch_put_registers()

> 
> I'm not entirely sure why this is working today, in fact.
> Alex, did you test whether our debug-exception-injection
> reports the correct ESR_EL1 to the guest ?

Alex?

> 
>>>> +/* Inject synchronous external abort */ static void
>>>> +kvm_inject_arm_sea(CPUState *c) {
>>>> +    ARMCPU *cpu = ARM_CPU(c);
>>>> +    CPUARMState *env = &cpu->env;
>>>> +    CPUClass *cc = CPU_GET_CLASS(c);
>>>> +    uint32_t esr;
>>>> +    int ret;
>>>> +
>>>> +    /* This exception is synchronous data abort */
>>>> +    c->exception_index = EXCP_DATA_ABORT;
>>>> +    /* Inject the exception to guest EL1 */
>>>> +    env->exception.target_el = 1;
>>>
>>> These comments don't tell us anything that the code does not.
>>
>>  Thanks, do you mean I need to remove it or add more detailed comments to it?
> 
> As a rule of thumb, comments should provide information to
> the reader which they wouldn't get if they only had the code.
> Comments often answer the "why do we do this" question, or
> provide an overall summary of what the code is going to do,
> or refer to an external source (a datasheet, an algorithm)
> that is necessary to understand the code. It's better to
> avoid comments that say "what the code is doing" at a line-by-line
> level, because the code itself already answers the "what"
> question at that level of detail.

sure, got it, thanks for the explanation and guidelines.

> 
> thanks
> -- PMM
> 
> .
> 
