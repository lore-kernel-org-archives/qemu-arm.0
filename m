Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3424504wrt;
        Mon, 10 Dec 2018 02:19:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UW6owxlIuin3TJVZubD7L1MkQK84LxZQ6AU+CIlODLDWuXt4zFmeZOXAoDJhucZSgnCEa7
X-Received: by 2002:a62:5950:: with SMTP id n77mr11692649pfb.128.1544437192880;
        Mon, 10 Dec 2018 02:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544437192; cv=none;
        d=google.com; s=arc-20160816;
        b=FVsGn0CmLbQ75vw07JleAfAuHpnFjtU34DQi4pUIsfAvRAgkA6utIang6ThSCPnct+
         agI4TIkgXF3nsifh7emvf70Ufy6y882AYH4Aaz4wnF5brl5NWohjgBQE1wnB+U4mnDKM
         ZHw9uhqHjf8ELDOwhx6Ycb6aSXKMbwlF6C5rhU7WoHVg9fVTCK9lRJ3GJUoajsDJ80vo
         Ht3pHdDWN4clgUmzsr6guvVusSgaYyuAyHx/AopUxPWCy966yK3rDu6jUklzZmFglw2I
         gbYkhhaRTi5N99Mj82TlzP4VFZrQVRiLxu96u1wk/isSFPFZLO2Rot9KMAwDa3Vx1o3R
         s5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uO65PRHQSslq3EeyXVhySgNGy48ctvSVqBXIOTo5MXo=;
        b=pB39J8ZfR5tflrS7FKy8H1wd1OK34nLI7RySgJ8kOfIf7/yPX+9Mhl4OxK5L7QQsqf
         hK/Gu4JzXNM6dsku8ExV9zXAFDr97+uU5+44mFepm06C24ACFstAk2AenJt9qJ9ehDVQ
         z32C740+Ai3AXfyMeN2L2BiJXnnEMVQ0aA/hvWnS1A+p+EfcCdyACjPAPNgO4ypDkQ28
         K7a6c1JYyux2A6kJabzY1jY5+AGSJqPvKNX1FJnrJgf0bp0V33YU7X+xOtucw2YSVtcN
         xTxEEbeQIqh98X/Oj+k8eEOF1sxe6HjGHCRCiKHmfIAbOn6sL+sc6GoxjpWPYxudkReL
         atSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga07-in.huawei.com. [45.249.212.35])
        by mx.google.com with ESMTPS id l9si9411123pgj.543.2018.12.10.02.19.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 02:19:52 -0800 (PST)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) client-ip=45.249.212.35;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 05F77A76A9D61;
	Mon, 10 Dec 2018 18:19:50 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Mon, 10 Dec 2018
 18:19:47 +0800
Subject: Re: [RFC] arm: Allow system registers for KVM guests to be changed by
 QEMU code
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
CC: <patches@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>
References: <20181206151401.13455-1-peter.maydell@linaro.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <4e924bac-82c9-3d0d-045f-9c5ae27b1df8@huawei.com>
Date: Mon, 10 Dec 2018 18:19:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20181206151401.13455-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-TUID: 8FyvOSmmLIEz


On 2018/12/6 23:14, Peter Maydell wrote:
> At the moment the Arm implementations of kvm_arch_{get,put}_registers()
> don't support having QEMU change the values of system registers
> (aka coprocessor registers for AArch32). This is because although
> kvm_arch_get_registers() calls write_list_to_cpustate() to
> update the CPU state struct fields (so QEMU code can read the
> values in the usual way), kvm_arch_put_registers() does not
> call write_cpustate_to_list(), meaning that any changes to
> the CPU state struct fields will not be passed back to KVM.
> 
> The rationale for this design is documented in a comment in the
> AArch32 kvm_arch_put_registers() -- writing the values in the
> cpregs list into the CPU state struct is "lossy" because the
> write of a register might not succeed, and so if we blindly
> copy the CPU state values back again we will incorrectly
> change register values for the guest. The assumption was that
> no QEMU code would need to write to the registers.
> 
> However, when we implemented debug support for KVM guests, we
> broke that assumption: the code to handle "set the guest up
> to take a breakpoint exception" does so by updating various
> guest registers including ESR_EL1.
> 
> Support this by making kvm_arch_put_registers() synchronize
> CPU state back into the list. We sync only those registers
> where the initial write succeeds, which should be sufficient.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Dongjiu Geng <gengdongjiu@huawei.com>

> ---
> I think this patch:
>  * should be necessary for the current KVM debug code to be able
>    to actually set the ESR_EL1 for the guest when it wants to
>    deliver a breakpoint exception to it
>  * will also be necessary for Dongjiu's patchset to inject
>    external aborts on memory errors
> 
> I have tagged it "RFC" because I don't have a setup to test
> that; I've just given it a quick smoke test that it runs a
> VM OK. Please test this and check whether it really does
> fix the bugs I think it does :-)

I have tested this patch in my aarch64 platform,
it works well to inject external aborts on memory errors.
Thanks for this patch.

> 
> Opinions welcome on whether the "try the write-and-read-back"
> approach in write_cpustate_to_list() is too hacky and it
> would be better to actually record whether write_list_to_cpustate()
> succeeded for each register. (That would require another array.)
> ---
>  target/arm/cpu.h     |  9 ++++++++-
>  target/arm/helper.c  | 27 +++++++++++++++++++++++++--
>  target/arm/kvm32.c   | 20 ++------------------
>  target/arm/kvm64.c   |  2 ++
>  target/arm/machine.c |  2 +-
>  5 files changed, 38 insertions(+), 22 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2a73fed9a01..c0c111378ea 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2321,18 +2321,25 @@ bool write_list_to_cpustate(ARMCPU *cpu);
>  /**
>   * write_cpustate_to_list:
>   * @cpu: ARMCPU
> + * @kvm_sync: true if this is for syncing back to KVM
>   *
>   * For each register listed in the ARMCPU cpreg_indexes list, write
>   * its value from the ARMCPUState structure into the cpreg_values list.
>   * This is used to copy info from TCG's working data structures into
>   * KVM or for outbound migration.
>   *
> + * @kvm_sync is true if we are doing this in order to sync the
> + * register state back to KVM. In this case we will only update
> + * values in the list if the previous list->cpustate sync actually
> + * successfully wrote the CPU state. Otherwise we will keep the value
> + * that is in the list.
> + *
>   * Returns: true if all register values were read correctly,
>   * false if some register was unknown or could not be read.
>   * Note that we do not stop early on failure -- we will attempt
>   * reading all registers in the list.
>   */
> -bool write_cpustate_to_list(ARMCPU *cpu);
> +bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
>  
>  #define ARM_CPUID_TI915T      0x54029152
>  #define ARM_CPUID_TI925T      0x54029252
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0da1424f72d..bc2969eb4d8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -263,7 +263,7 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
>      return true;
>  }
>  
> -bool write_cpustate_to_list(ARMCPU *cpu)
> +bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
>  {
>      /* Write the coprocessor state from cpu->env to the (index,value) list. */
>      int i;
> @@ -272,6 +272,7 @@ bool write_cpustate_to_list(ARMCPU *cpu)
>      for (i = 0; i < cpu->cpreg_array_len; i++) {
>          uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>          const ARMCPRegInfo *ri;
> +        uint64_t newval;
>  
>          ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
>          if (!ri) {
> @@ -281,7 +282,29 @@ bool write_cpustate_to_list(ARMCPU *cpu)
>          if (ri->type & ARM_CP_NO_RAW) {
>              continue;
>          }
> -        cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
> +
> +        newval = read_raw_cp_reg(&cpu->env, ri);
> +        if (kvm_sync) {
> +            /*
> +             * Only sync if the previous list->cpustate sync succeeded.
> +             * Rather than tracking the success/failure state for every
> +             * item in the list, we just recheck "does the raw write we must
> +             * have made in write_list_to_cpustate() read back OK" here.
> +             */
> +            uint64_t oldval = cpu->cpreg_values[i];
> +
> +            if (oldval == newval) {
> +                continue;
> +            }
> +
> +            write_raw_cp_reg(&cpu->env, ri, oldval);
> +            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
> +                continue;
> +            }
> +
> +            write_raw_cp_reg(&cpu->env, ri, newval);
> +        }
> +        cpu->cpreg_values[i] = newval;
>      }
>      return ok;
>  }
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index bd51eb43c86..a75e04cc8f3 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -387,24 +387,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> -    /* Note that we do not call write_cpustate_to_list()
> -     * here, so we are only writing the tuple list back to
> -     * KVM. This is safe because nothing can change the
> -     * CPUARMState cp15 fields (in particular gdb accesses cannot)
> -     * and so there are no changes to sync. In fact syncing would
> -     * be wrong at this point: for a constant register where TCG and
> -     * KVM disagree about its value, the preceding write_list_to_cpustate()
> -     * would not have had any effect on the CPUARMState value (since the
> -     * register is read-only), and a write_cpustate_to_list() here would
> -     * then try to write the TCG value back into KVM -- this would either
> -     * fail or incorrectly change the value the guest sees.
> -     *
> -     * If we ever want to allow the user to modify cp15 registers via
> -     * the gdb stub, we would need to be more clever here (for instance
> -     * tracking the set of registers kvm_arch_get_registers() successfully
> -     * managed to update the CPUARMState with, and only allowing those
> -     * to be written back up into the kernel).
> -     */
> +    write_cpustate_to_list(cpu, true);
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 0a502091e76..d8ac978d7c3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -834,6 +834,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> +    write_cpustate_to_list(cpu, true);
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 7a22ebc2098..0dd0157f4d4 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -626,7 +626,7 @@ static int cpu_pre_save(void *opaque)
>              abort();
>          }
>      } else {
> -        if (!write_cpustate_to_list(cpu)) {
> +        if (!write_cpustate_to_list(cpu, false)) {
>              /* This should never fail. */
>              abort();
>          }
> 
