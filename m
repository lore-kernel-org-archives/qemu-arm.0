Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23616675lff;
        Mon, 6 Jan 2020 09:16:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnkI9Bw5qW/0Hjwc6IXjOxOXP4YRsJydJhMv5lYllk0CAmcf9/Tb+aTCGqC52j4+qXLwCD
X-Received: by 2002:a17:906:1354:: with SMTP id x20mr109350510ejb.279.1578330983622;
        Mon, 06 Jan 2020 09:16:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578330983; cv=none;
        d=google.com; s=arc-20160816;
        b=XnZ+jOHbtNrga+UgvjXRYs981m4948Cfo1FY8x/Tp4kDjrq+FNpN6jR/o3TGmPYckX
         aD2lrjzMAMK5TK6GGDm03DYmKC0nWq+Assu7u7SdknPxlw57KGbkKLvkbt7AHSiPLEjn
         ePpfKNrm3tdDUx7s8rbSuyZxQiamzaGSWWfLfEIBRUcq+yKNwWRtDrL4l7t/fFiHMFDt
         5rxw53Ieet/IFNXrmwGX9wMp24zfz0WtvXjo866J82mPAsVLBh4ySM3f+sAwvdCD2NKF
         1w/BxpFeNH9pgBSuzovwE80VgZsS+y3CndlzKvcufKy+Z+coIZtoFRaQpC8zVapCu4Ca
         /iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQxidMh1ompo67sH9IV7Q3/gPnh7WO+DzKCNJVGFP7o=;
        b=VTi0vWc9+8N/nyt0jIxyGbZAReEq9Ev9DvA3GfRpGGMO+WHx8cQ4DM76Fhr+Qd+Tu0
         81NSEvjjG/fiuH/JTzMEnkVihR//WmT1kfFlkEUCbGV65YAcwPXWQRamx3zXX1URMZ2u
         w5ZT7StZEmwooXbNUqxtlCn7nwP7T5IbBUcHCY6tnvDRYfbpqFmg4by5LHNqBNPNPXX3
         3jSN+nIpOUoDpqPz0pAPQQTMcbsmftsT+poWc9dRUIRlrmeNHDOGEsoZx3DvfvrbhGzQ
         DnoKeWMlU2l26q1Ji7FlEMiPJSxpeu0wSV/L1eqlEp4BIIjiHMkiZODYiV+LyqdE2YO2
         Z5iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k81n14Nw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c95si38873862edf.88.2020.01.06.09.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 09:16:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k81n14Nw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioVzK-0000mu-35
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 12:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVy9-0008Jv-2H
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:15:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVy7-0007dw-9c
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:15:08 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43656)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioVy7-0007ao-0a
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:15:07 -0500
Received: by mail-ot1-x344.google.com with SMTP id p8so36095416oth.10
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LQxidMh1ompo67sH9IV7Q3/gPnh7WO+DzKCNJVGFP7o=;
 b=k81n14NwPPVPYVV1VrArC4mklYxXlDkp9N7qgNTs1of1EVbbK9rdktSkfO0WyNepiy
 FOR2fjKE/z1MCYorKBFypoAAEwUNEMn/cXEczHZYfhYYMPdxTO7QyFq4rj0/Qu7KzmBZ
 sNLQhaAlR0uKT+g+rGX/VamAxHCb4KY+Hr/A03qXCJxRQmn8saikgAKimrhItAj/OTw0
 afUe+62y7uZBi7rfScNLHPQ1Rrn5DI/1nyAWYFiCemfSXvkoWiOMDkln4Btl0uWesPoL
 BqVwIiqmjyRRwQWxRbZ8TUDofs4RQCoaQ61qIH2afba94P/9Bj/8APSMiI0QLfCXXqWf
 ERog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LQxidMh1ompo67sH9IV7Q3/gPnh7WO+DzKCNJVGFP7o=;
 b=EoFkSih2c8yHisrPFEcx9/mz8he8J3NoBa6V3/TviyCwuIF9UzigAbR0YhMOAU8kM+
 wCaJ+OYebtZuVEkrk1sHMIErCkdqoEl+phUOV/vFdlRtDmiMmSRCU8ORRFQnUUtsch/x
 YyB5eWf3qm4v0Ew+8ZfXq4fh8LH5HE3SOSqr8Dtp9X3Rcr81ga+NYJp6GBxVXgZcB/bS
 LUoWkiQCmi6J56RrTr0KgFF7epokbC19aEOZH/c2YQXCxcfy1EzyjnTfo9EmJ0XGO93B
 bh/u6TEDlWF5fYFM1sONIxzn86EeK33zVrur0oRam7Dtc2kFUowpubazW5RTve5A2kZK
 TUNw==
X-Gm-Message-State: APjAAAXld4PMZG5blJOR2gjbP3DAmrz8Q3FW7PcHmVorcD0T2yldURas
 ALZemp2sqnnzzEGuooQiz3bvfQFLE6FrLsjG6EqFZQ==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr100401197ota.232.1578330904812; 
 Mon, 06 Jan 2020 09:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20191220202707.30641-1-beata.michalska@linaro.org>
 <20191220202707.30641-2-beata.michalska@linaro.org>
In-Reply-To: <20191220202707.30641-2-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 17:14:53 +0000
Message-ID: <CAFEAcA-N=Xsnb3522mm7tT-7TOxBtJ6S_cE23XHw-4vXVVA7Xw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] target/arm: kvm: Handle DABT with no valid ISS
To: Beata Michalska <beata.michalska@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nRHtnGucWU7O

On Fri, 20 Dec 2019 at 20:27, Beata Michalska
<beata.michalska@linaro.org> wrote:
>
> On ARMv7 & ARMv8 some load/store instructions might trigger a data abort
> exception with no valid ISS info to be decoded. The lack of decode info
> makes it at least tricky to emulate those instruction which is one of the
> (many) reasons why KVM will not even try to do so.
>
> Add suport for handling those by requesting KVM to inject external
> dabt into the quest.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  accel/kvm/kvm-all.c    | 15 +++++++
>  accel/stubs/kvm-stub.c |  4 ++
>  include/sysemu/kvm.h   |  1 +
>  target/arm/cpu.h       |  3 +-
>  target/arm/kvm.c       | 95 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm32.c     |  3 ++
>  target/arm/kvm64.c     |  3 ++
>  target/arm/kvm_arm.h   | 19 +++++++++
>  8 files changed, 142 insertions(+), 1 deletion(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ca00daa2f5..a3ee038142 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2174,6 +2174,14 @@ static void do_kvm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
>      }
>  }
>
> +static void do_kvm_cpu_synchronize_state_force(CPUState *cpu,
> +                                               run_on_cpu_data arg)
> +{
> +    kvm_arch_get_registers(cpu);
> +    cpu->vcpu_dirty = true;
> +}

Why is this functionality special such that it needs a non-standard
way of synchronizing state with KVM that nothing else does ?

> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 9fe233b9bf..0cacc61d8a 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -483,6 +483,7 @@ void kvm_cpu_synchronize_state(CPUState *cpu);
>  void kvm_cpu_synchronize_post_reset(CPUState *cpu);
>  void kvm_cpu_synchronize_post_init(CPUState *cpu);
>  void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
> +void kvm_cpu_synchronize_state_force(CPUState *cpu);
>
>  void kvm_init_cpu_signals(CPUState *cpu);
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5f70e9e043..e11b5e7438 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -558,7 +558,8 @@ typedef struct CPUARMState {
>          uint8_t has_esr;
>          uint64_t esr;
>      } serror;
> -
> +    /* Status field for pending extarnal dabt */

"external" (I think you have the same typo later in the patch too)

> +    uint8_t ext_dabt_pending;
>      /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>      uint32_t irq_line_state;


> @@ -701,6 +719,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>              ret = EXCP_DEBUG;
>          } /* otherwise return to guest */
>          break;
> +    case KVM_EXIT_ARM_NISV:
> +        /* External DAB with no valid iss to decode */

"DABT"

> +        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
> +                                 run->arm_nisv.fault_ipa);

(indentation looks odd here?)

> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                        __func__, run->exit_reason);
> @@ -835,3 +858,75 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>  {
>      return (data - 32) & 0xffff;
>  }
> +
> +int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
> +                              uint64_t fault_ipa)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    hwaddr xlat, len;
> +    AddressSpace *as = cs->as ? cs->as : &address_space_memory;

I don't think you should need to test cs->as for NULL;
qemu_init_vcpu() ensures that one is always set up.

Probably the neatest way to get the AddressSpace* is to
call arm_addressspace(cs, MEMTXATTRS_UNSPECIFIED).


> +    int store_ins = ((esr_iss >> 6) & 1); /* WnR bit */

This should be a bool (matching the argument type for
address_space_translate), so you can just do
   bool is_write = esr_iss & (1 << 6);

> +    int ret;
> +
> +    /*
> +     * Note: The ioctl for SET_EVENTS will be triggered before next
> +     * KVM_RUN call though the vcpu regs need to be updated before hand
> +     * so to not to overwrite changes done by KVM upon injecting the abort.
> +     * This sadly requires running sync twice - shame ...
> +     */
> +    kvm_cpu_synchronize_state(cs);
> +   /*
> +    * ISS [23:14] is invalid so there is a limited info
> +    * on what has just happened so the only *useful* thing that can
> +    * be retrieved from ISS is WnR & DFSC (though in some cases WnR
> +    * might be less of a value as well)
> +    */
> +    /* Verify whether the memory being accessed is even recognisable */
> +    if (!address_space_translate(as, fault_ipa, &xlat, &len,
> +                                 store_ins, MEMTXATTRS_UNSPECIFIED)) {
> +        error_report("An attemp to access memory outside of the boundries"

"attempt"; "boundaries". But I think what we should actually report here
is:

"Guest attempted to access memory/device at guest physical address
0x... using an instruction that KVM could not emulate (no valid ISS).
Injecting a data abort exception into guest."

It doesn't seem to me worth distinguishing whether the guest
physical address happens to have anything mapped there or not;
we're going to inject a somewhat bogus dabt anyway.

After the initial error_report(), supplemental information like
the offending instruction should be printed with error_printf(),
because it isn't a separate new error.

> +                     "at 0x" TARGET_FMT_lx, (target_ulong) fault_ipa);
> +    } else {
> +        uint32_t ins;
> +        uint8_t ins_fetched;
> +
> +        /*
> +         * Get current PC before it will get updated to except vector entry

"exception"

> +         */
> +        target_ulong ins_addr = is_a64(env) ? env->pc
> +                                /* AArch32 mode vs T32 aka Thumb mode */
> +                                : env->regs[15] - (env->thumb ? 4 : 8);
> +
> +        /*
> +         * Get the faulting instruction
> +         * Instructions have a fixed length of 32 bits
> +         * and are always little-endian

...unless they're 16-bit Thumb. In an ideal world you should handle
the Thumb case by doing a 16-bit load, and then loading another 16-bit
value if the top 3 bits of the first part are 0b111.

At least we don't have to consider the possibility ofold-style
really-big-endian-instruction-ordering :-)

> +         */
> +        ins_fetched = !cpu_memory_rw_debug(cs, ins_addr, (uint8_t *) &ins,
> +                                           sizeof(uint32_t), store_ins) ;

stray space before semicolon

> +
> +        error_report("Data abort exception with no valid ISS generated by "
> +                     "memory access at 0x" TARGET_FMT_lx,
> +                     (target_ulong)fault_ipa);
> +        error_report(ins_fetched ? "%s: 0x%" PRIx32 " (encoded)" : "%s",
> +                     "Unable to emulate memory instruction",
> +                     (!ins_fetched ? 0 : ldl_le_p(&ins)));
> +
> +        error_report("Faulting instruction at 0x" TARGET_FMT_lx, ins_addr);
> +    }
> +    /*
> +     * Set pending ext dabt amd trigger SET_EVENTS so that
> +     * KVM can inject the abort
> +     */
> +    env->ext_dabt_pending = 1;
> +
> +    ret = kvm_put_vcpu_events(cpu);
> +
> +    /* Get the most up-tp-date state */

"to"

> +    if (!ret) {
> +        /* Hacky but the sync needs to be forced */
> +        kvm_cpu_synchronize_state_force(cs);
> +    }
> +    return ret;
> +}
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 32bf8d6757..5539c3a3f2 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -240,6 +240,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      /* Check whether userspace can specify guest syndrome value */
>      kvm_arm_init_serror_injection(cs);
>
> +    /* Set status for supporting the extarnal dabt injection */
> +    kvm_arm_init_ext_dabt_injection(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 876184b8fe..3da4e2e70e 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -792,6 +792,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      /* Check whether user space can specify guest syndrome value */
>      kvm_arm_init_serror_injection(cs);
>
> +    /* Set status for supporting the extarnal dabt injection */
> +    kvm_arm_init_ext_dabt_injection(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }

thanks
-- PMM
