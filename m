Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp2425077wro;
        Fri, 15 Mar 2019 13:11:03 -0700 (PDT)
X-Received: by 2002:a1c:f202:: with SMTP id s2mr3238974wmc.15.1552680663838;
        Fri, 15 Mar 2019 13:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552680663; cv=none;
        d=google.com; s=arc-20160816;
        b=tZf7QmM4uTQ5qqWBqU/bMPTAmOpq2fEtu3eLh5pLLuswEM9EgQcwapr0gV88tEn/F4
         SfHREWepdkVfq9Prw4pREIDDWpawpblOzjhgFW1ZQHJWsbNcOT6ZS7javrmuv+5/d216
         2VY5x1SFFSEjhjJKzE7BBWppLMofxvW2FZujNNtpsAgnCEly3MBAdVKvYFMpX/6YoRki
         wxkl8eKlgLWk5sdi9V1Q+g2fCyDBPxAYuwLJG4Q8tCVYD6woysRnmeaP+Ue3PAgCb+dY
         wE45n9fmbffVzrJ9T5opQNwNfyfd9P13Unor4eOozyYlLofkX4pi7s+JfSYLkWpGyR80
         GTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=p9T8d6GUJGIifm8pocJY/s1RBt7l8+Px40MXDo2iefE=;
        b=cEyiu6oqc9+qHViiB1d0Z7yhJAz/P7PhBjkVXesvDkvrZJETzBpnMeBEP5JvAkfrnB
         MwLTdh9stk88gtuvbUg84E7R6IEfezXG7GqZbiD0gaZWmTZFUozbT5PqZ5lpgtjkO2vJ
         +QVtDriHmesG8AFj+41UGF6v35m+vhWAkut1hFcccoI9Sv6ILn4A9ephl4ty770HZPJC
         /XxMvuVIuXpB2GHz1pCQW5saYCKkrQMmmwYEP/VBgeEOAEx0DGVFCL3Vs3Gsu+wOgW74
         rA+KLCVpy+0H55RlAPzS7cvwekqHJAyOtPRNxi45wBMhmaPJ7uEv8t0aZynZk0Yo4jiq
         bBbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v18sor2293049wrd.4.2019.03.15.13.11.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2019 13:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p9T8d6GUJGIifm8pocJY/s1RBt7l8+Px40MXDo2iefE=;
        b=I2xmF7upUVME6g+brXud96y0WVIcc2kCB/68mibCbBGSs8ffwe6l8NiWJX8qY0zhFH
         h199s7//yOatB7mtrbr3zz3iriu5mu/PjOZuHAmH388Q5ZGgkb4lmER+mXVdnmzSTpav
         akg8gEYtjiObiqJNglnW5IGDqoDgWC0UDAtZBOtRPUdXg6z0FbuEm0pU6RHqjl/BLCZl
         OxgOpfmnvj5TPAQSH2kW7vpP7yBwwa3Eh19p6Ag1rQ9wTFAkAyKPTgClxxNWtfDObCGG
         6l5RvQIVQtZ3ba354BBt18nJeaJge6n6CaeY+b1FbhTUZDvuwSR/V+5u1ieBiS18sU59
         8REw==
X-Gm-Message-State: APjAAAU+q7/RYx3z5koktlazTYj4LQYQnJ5R17KDk13MqBZaNLo4Rj2T
	0ZLEsiPzAIC5SyIEyXUtlC//hA==
X-Google-Smtp-Source: APXvYqxMz/hOaZ/seN7pYmreJRW4fbB2ZlhFER8AkrzsZ8F2H6hsVXNvTRN00LnPAuVHSU4JTfsXKw==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr3810050wrm.127.1552680663461;
        Fri, 15 Mar 2019 13:11:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net. [88.25.181.43])
        by smtp.gmail.com with ESMTPSA id d1sm2905474wrs.13.2019.03.15.13.11.02
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 13:11:02 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH for-4.0?] arm: Allow system registers for KVM
 guests to be changed by QEMU code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Dongjiu Geng
 <gengdongjiu@huawei.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
References: <20190315143057.20165-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c04c5c7a-f704-1c12-1a09-02f4a3db8506@redhat.com>
Date: Fri, 15 Mar 2019 21:11:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190315143057.20165-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: VS41J83mCeRY

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
> ---
> Should we try to put this in for rc1? Not sure... Testing
> definitely appreciated.

You might include it for rc1 and we still have rc2/rc3 to revert it.

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
