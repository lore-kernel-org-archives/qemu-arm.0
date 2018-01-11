Received: by 10.28.173.206 with SMTP id w197csp132256wme;
        Wed, 10 Jan 2018 22:00:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBotL4H+gUP2lBCuOpVEwj+kvmTSqYG/xgDlpVk/i8fSTclWzXZdB3TniXzTDJe9ZUeKC5YgT
X-Received: by 10.99.96.23 with SMTP id u23mr15767135pgb.40.1515650422748;
        Wed, 10 Jan 2018 22:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515650422; cv=none;
        d=google.com; s=arc-20160816;
        b=fBZVB1fnmS+ohkhvyYqrM470sQwhQnVzUZPv/8nn3GAPIKX9goAHkn1VQwyJiuTNI6
         ut4N99gYdbas7P1f5+k6G53g3Hdv5eS3QIKDEX5Q8ixF95SkVP4qDCkKaSF1/hhRqtXn
         xHbGf9MJbgaiVmTBC58XqCLdYGlVUaKecS+n4pjAXofoHHmS8WEBYUXrQvV6JEEfBJ+b
         hMJtQqPW2F5YsynZJsXHqmjPdP2WKXldOs5ORKCh0t8eeBQselPZKKpzLdwwz4WwS8Az
         9b6qj92reM0pi5hAh8Br6cY4EkjE58UrMwDqnKjmYSc5Dqf/IxJudpvR3wMRNuAIN2+k
         daTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=WcO1xzRccfp2yYgQ3QnLibodyhHFl0d2CMgdJv5KcNk=;
        b=rTiPBcP5Lb7dobQE6h7b2J63BPizPKrc9VpCYC1aYNzCWV4V/Hoq2/11//xCCGtjbn
         JDiH9u7TrTZn3AA/M72ZDzFWGekqYVrPKyewmaAcyAT0wKt612iMuMUoW7L9247ESIHj
         0StVjDKtXxRqJXUS/oBTunkUx7SLYYbXIw+lcGhyMtCA0EgQNVxVJHB95WGDPhEaEIX8
         7KNcaU9wIG+iP6/WOy4a6bxWiiiiwpbUnrZzrQcbP8F0rC7vgcB2ufdRmmYEcJjz1oj/
         C/VIkfq00Ik+o8mzziqqnrazvR8E4yukqNV9ULr8Dgjlmq5+k6Fc4ibrb1jzYRUsJztk
         o6kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id m23si2939139pgc.438.2018.01.10.22.00.22;
        Wed, 10 Jan 2018 22:00:22 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751162AbeAKGAU (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 11 Jan 2018 01:00:20 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3770 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753881AbeAKGAS (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 11 Jan 2018 01:00:18 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 976C8EC45FBD5;
        Thu, 11 Jan 2018 14:00:03 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.361.1; Thu, 11 Jan 2018
 13:59:57 +0800
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
Message-ID: <558dc576-6d05-50d4-9f7c-73738e28ad26@huawei.com>
Date:   Thu, 11 Jan 2018 13:59:47 +0800
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
X-TUID: 4aMhZ4phmo3V

Hi Peter.

On 2018/1/10 1:30, Peter Maydell wrote:
> On 28 December 2017 at 05:54, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> Add synchronous external abort injection logic, setup
>> exception type and syndrome value. When switch to guest,
>> guest will jump to the synchronous external abort vector
>> table entry.
>>
>> The ESR_ELx.DFSC is set to synchronous external abort(0x10),
>> and ESR_ELx.FnV is set to not valid(0x1), which will tell
>> guest that FAR is not valid and holds an UNKNOWN value.
>> These value will be set to KVM register structures through
>> KVM_SET_ONE_REG IOCTL.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> Marc is against that KVM inject the synchronous external abort(SEA) in [1],
>> so user space how to inject it. The test result that injection SEA to guest by Qemu
>> is shown in [2].
>>
>> [1]: https://lkml.org/lkml/2017/3/2/110
>> [2]:
>> Taking exception 4 [Data Abort]
>> ...from EL0 to EL1
>> ...with ESR 0x24/0x92000410
>> ...with FAR 0x0
>> ...with ELR 0x40cf04
>> ...to EL1 PC 0xffffffc000084c00 PSTATE 0x3c5
>> after kvm_inject_arm_sea
>> Unhandled fault: synchronous external abort (0x92000410) at 0x0000007fa234c12c
>> CPU: 0 PID: 536 Comm: devmem Not tainted 4.1.0+ #20
>> Hardware name: linux,dummy-virt (DT)
>> task: ffffffc019ab2b00 ti: ffffffc008134000 task.ti: ffffffc008134000
>> PC is at 0x40cf04
>> LR is at 0x40cdec
>> pc : [<000000000040cf04>] lr : [<000000000040cdec>] pstate: 60000000
>> sp : 0000007ff7b24130
>> x29: 0000007ff7b24260 x28: 0000000000000000
>> x27: 00000000000000ad x26: 000000000049c000
>> x25: 000000000048904b x24: 000000000049c000
>> x23: 0000000040600000 x22: 0000007ff7b243a0
>> x21: 0000000000000002 x20: 0000000000000000
>> x19: 0000000000000020 x18: 0000000000000000
>> x17: 000000000049c6d0 x16: 0000007fa22c85c0
>> x15: 0000000000005798 x14: 0000007fa2205f1c
>> x13: 0000007fa241ccb0 x12: 0000000000000137
>> x11: 0000000000000000 x10: 0000000000000000
>> x9 : 0000000000000000 x8 : 00000000000000de
>> x7 : 0000000000000000 x6 : 0000000000002000
>> x5 : 0000000040600000 x4 : 0000000000000003
>> x3 : 0000000000000001 x2 : 0000000000000000
>> x1 : 0000000000000000 x0 : 0000007fa2418000
>> ---
>>  target/arm/kvm64.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index a16abc8..c00450d 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -582,6 +582,71 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>>      return KVM_PUT_RUNTIME_STATE;
>>  }
>>
>> +static int kvm_arm_cpreg_value(ARMCPU *cpu, ptrdiff_t fieldoffset)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < cpu->cpreg_array_len; i++) {
> 
> This is still absolutely the wrong thing to do. Nothing should
> need to scan this array like this.
I will confirm that whether KVM mode will need this code, if not, I will remove this function.

> 
>> +        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>> +        const ARMCPRegInfo *ri;
>> +        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
>> +        if (!ri) {
>> +            continue;
>> +        }
>> +
>> +        if (ri->type & ARM_CP_NO_RAW) {
>> +            continue;
>> +        }
>> +
>> +        if (ri->fieldoffset == fieldoffset) {
>> +            cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
>> +            return 0;
>> +        }
>> +    }
>> +    return -EINVAL;
>> +}
>> +
>> +/* Inject synchronous external abort */
>> +static void kvm_inject_arm_sea(CPUState *c)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(c);
>> +    CPUARMState *env = &cpu->env;
>> +    unsigned long cpsr = pstate_read(env);
>> +    uint32_t esr, ret;
>> +
>> +    /* This exception is synchronous data abort*/
> 
> Missing space before */
will fix it.

> 
>> +    c->exception_index = EXCP_DATA_ABORT;
>> +    /* Inject the exception to guest El1 */
> 
> "EL1", all caps.
will fix it.

> 
>> +    env->exception.target_el = 1;
>> +    CPUClass *cc = CPU_GET_CLASS(c);
> 
> Don't declare variables in the middle of the code -- check QEMU's
> CODING_STYLE doc for more info.
will fix it.

> 
>> +
>> +    /* Set the DFSC to synchronous external abort and set FnV to not valid,
>> +     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
>> +     */
>> +    esr = (0x10 | (1 << 10));
>> +
>> +    /* This exception comes from lower or current exception level. */
>> +    if ((cpsr & 0xf) == PSTATE_MODE_EL0t) {
> 
> This looks like it'll be wrong for AArch32 guests (which you can
> still have with KVM with a 64-bit host), and even for AArch32
> userspace in a 64-bit guest. The correct way to find out what the
> current EL is is to use arm_current_el().
 sorry, in the OS(include guest OS), for software error recovery, we only support AArch64 kernel, not support AArch32
 kernel or AArch32 user space.

> 
>> +        esr |= (EC_DATAABORT << ARM_EL_EC_SHIFT);
>> +    } else {
>> +        esr |= (EC_DATAABORT_SAME_EL << ARM_EL_EC_SHIFT);
>> +    }
> 
> I'm pretty sure in a previous round of review I said you shouldn't
> be manually constructing ESR values. We have helper functions for
> those (syn_data_abort_*).
sorry, it is my mistake. I will use syn_data_abort_*.

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
Good point.
After I confirmed, in the TCG mode, it does not need this code. I am not sure whether KVM mode will need it.
I will test it in the KVM mode. If KVM mode also does not need it, I will remove this code.


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
