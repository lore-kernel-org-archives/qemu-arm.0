Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp1564151wrt;
        Sun, 17 Mar 2019 10:59:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfnPKYEZPBCI9TxTzV94OyurIEKZUuls1q+Jdw8hUmm1tsSsbjho22ON7BdZE4iQhA/t69
X-Received: by 2002:ac8:30d1:: with SMTP id w17mr2577810qta.4.1552845591215;
        Sun, 17 Mar 2019 10:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552845591; cv=none;
        d=google.com; s=arc-20160816;
        b=yu7G4tiPT7lLXYdMV13e0DKxuB7RFJCZB5w+uF63GoCitrA8rvxaa5E1HWc140twiQ
         RECqTbvSyUYB4EHDdYfWsXTmKPuIiSqG9saiDs6wsa2Z0tz5YyRTmxJpiOuIssOktobu
         Kfji1pLdk9rA3mXYYIpp6DtRRkpaDV1tCnSW2h93QZEz9Lm9XAFEY++wiobT2a6MbAb+
         LDPmZSx2Pj1WvEV11xRc6IRDlFdM2g0FsQYPoRFqyJZ36+LULRaKh+a7DiOlH/Z7ec2g
         sm8DhRnE+MezqmknesiBYYQtyTQ5w5MbpfNEZApJk84P0/+LfaV6VtLozOAPfuIgoE/S
         RqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+Lr7VfDs0K2BFi7GmM8fzfpWol5AEEMHYVr+/XfLVsc=;
        b=tH3qItqoQlqQdLH/xyx0wjc+OeQuAjtTSPVcse+KVbvzptTT6BDHUFVwlXhBbet8vl
         LGq1BDEad1b6BWZLfwkIwKEmIp/FMtHLXQV0cEwjpyduNPh6Klwc8Px66J3nVLoqqxDz
         AqskXZEnucUrlBLJgbiVHms1ONi4Me5TVSo9mdrje5LXy8Olv41bwK9a24jtnAPEXJ2Y
         3+bN4Oilyuh70fSphuyjjg/Rc4zljbcc8jGieaz0vwPDYlK4HHKDrMgni0wpDN6FVrQ+
         Ge8Fr0GP2TLOWXZchqU+Fg2Kim6qT7NxJVLzoJZcmpJ2u9117NXCh7amMqfVUZnj0DSe
         ttxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x192si1260512qka.208.2019.03.17.10.59.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Mar 2019 10:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 480B287621;
	Sun, 17 Mar 2019 17:59:50 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 798593849;
	Sun, 17 Mar 2019 17:59:48 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH for-4.0?] arm: Allow system registers for KVM
 guests to be changed by QEMU code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Dongjiu Geng <gengdongjiu@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
References: <20190315143057.20165-1-peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a1244fe1-f28d-df10-5f4b-679f248a1987@redhat.com>
Date: Sun, 17 Mar 2019 18:59:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190315143057.20165-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sun, 17 Mar 2019 17:59:50 +0000 (UTC)
X-TUID: AGvJzplc+XSA

Hi Peter,

On 3/15/19 3:30 PM, Peter Maydell wrote:
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
> This commit is the same as commit 823e1b3818f9b10b824ddc which we
> had to revert in commit 942f99c825fc94c8b1a4, except that the bug
> which was preventing EDK2 guest firmware running has been fixed:
> kvm_arm_reset_vcpu() now calls write_list_to_cpustate().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>

With this patch applied on the revert, I don't observe the regression I
reported earlier. I didn't test the guest debug feature though.

Thanks

Eric

> ---
> Should we try to put this in for rc1? Not sure... Testing
> definitely appreciated.
> 
> ---
>  target/arm/cpu.h     |  9 ++++++++-
>  target/arm/helper.c  | 27 +++++++++++++++++++++++++--
>  target/arm/kvm.c     |  8 ++++++++
>  target/arm/kvm32.c   | 20 ++------------------
>  target/arm/kvm64.c   |  2 ++
>  target/arm/machine.c |  2 +-
>  6 files changed, 46 insertions(+), 22 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5f23c621325..82f40a7ea90 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2559,18 +2559,25 @@ bool write_list_to_cpustate(ARMCPU *cpu);
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
> index 2607d39ad1c..554f111ea89 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -265,7 +265,7 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
>      return true;
>  }
>  
> -bool write_cpustate_to_list(ARMCPU *cpu)
> +bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
>  {
>      /* Write the coprocessor state from cpu->env to the (index,value) list. */
>      int i;
> @@ -274,6 +274,7 @@ bool write_cpustate_to_list(ARMCPU *cpu)
>      for (i = 0; i < cpu->cpreg_array_len; i++) {
>          uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>          const ARMCPRegInfo *ri;
> +        uint64_t newval;
>  
>          ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
>          if (!ri) {
> @@ -283,7 +284,29 @@ bool write_cpustate_to_list(ARMCPU *cpu)
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
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 79a79f01905..59956346126 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -497,6 +497,14 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
>          fprintf(stderr, "write_kvmstate_to_list failed\n");
>          abort();
>      }
> +    /*
> +     * Sync the reset values also into the CPUState. This is necessary
> +     * because the next thing we do will be a kvm_arch_put_registers()
> +     * which will update the list values from the CPUState before copying
> +     * the list values back to KVM. It's OK to ignore failure returns here
> +     * for the same reason we do so in kvm_arch_get_registers().
> +     */
> +    write_list_to_cpustate(cpu);
>  }
>  
>  /*
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 50327989dcc..327375f6252 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -384,24 +384,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
> index 089af9c5f02..e3ba1492482 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -838,6 +838,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> +    write_cpustate_to_list(cpu, true);
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index b2925496148..124192bfc26 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -630,7 +630,7 @@ static int cpu_pre_save(void *opaque)
>              abort();
>          }
>      } else {
> -        if (!write_cpustate_to_list(cpu)) {
> +        if (!write_cpustate_to_list(cpu, false)) {
>              /* This should never fail. */
>              abort();
>          }
> 
