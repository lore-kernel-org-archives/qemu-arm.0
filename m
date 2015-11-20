Received: by 10.182.158.201 with SMTP id ww9csp545881obb;
        Fri, 20 Nov 2015 07:27:21 -0800 (PST)
X-Received: by 10.129.97.130 with SMTP id v124mr13425260ywb.340.1448033241498;
        Fri, 20 Nov 2015 07:27:21 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x236.google.com (mail-yk0-x236.google.com. [2607:f8b0:4002:c07::236])
        by mx.google.com with ESMTPS id g84si53852ywe.129.2015.11.20.07.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2015 07:27:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::236 as permitted sender) client-ip=2607:f8b0:4002:c07::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by ykdv3 with SMTP id v3so167439636ykd.0
        for <alex.bennee@linaro.org>; Fri, 20 Nov 2015 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=OpjzGxYmh3vmFjSTgrbW5HxrIsVBbJFpbL1x+dtdKxs=;
        b=EA2hGyOuj6EPiZdg3596naa6E3iENCb8a3kiTdNT+Cm9kxqgrjGyE3XBv1MoH7lbdz
         3S7U6WiCc5GMZ3wlbrfCEBg48pbcvSf67iBREBkw/dx8fI4k6J5d5jBdxWnIQ476a5sY
         2DN2Kl897rOlEVppZgBC7Pa/6YCUYHb5PlIg1io1asy7CVygjNnvUxs3MOzJYplFne48
         X+rteMoi5UMoVf7RrlT6UxY+sCWIjdO4Fheylza4E8tHGm27Vj+b6PmlGAdXVxY2OJ35
         18gHxNCBXi3pOpwpQv6H8ANIMNMqf6+3SjoQx7X3BDtbnTYrQvtHjeXwTr8esa/7063w
         GIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=OpjzGxYmh3vmFjSTgrbW5HxrIsVBbJFpbL1x+dtdKxs=;
        b=UYVhWa82g68ToS6P0U3GOjDYrrXo7sXcymsNgMRhMwgynf3dzbFHpW1DNlsJtfD+Pi
         qAt6Wa10iKG4EPEyJMahPD2wRK9hrIesCxtzpnq13TH8nGqvzDhDEvb1H20PnbWi9IKS
         O9O9rolK/cRCZ07x4JB5N3by/4DNsw7gMRsfqpVK4b26LPYGyzpcvpop1HlOldTBl/MP
         6Jmvb5P7/fhYgTyfwfYfd7WJJDRkgznAD+Eusc/Qo6zQ0XV471HnFxJ8b9q3lqJKOxGs
         5BHImtQ4qkpUTk7H/KadWb6zOSJH8JEHt/pIPFcXJ6vMiptsw+NIk6o1Bavc29j4qkv8
         dqMA==
X-Gm-Message-State: ALoCoQkzOuU+qHUXFlOD30WIQMffErXIsg5niBjenI8et9yOE1qb8efal7dn+UTwQw3f/4U6E/FA
X-Received: by 10.129.157.70 with SMTP id u67mr13676826ywg.160.1448033240783;
 Fri, 20 Nov 2015 07:27:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 07:27:01 -0800 (PST)
In-Reply-To: <1447345251-22625-3-git-send-email-alex.bennee@linaro.org>
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-3-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 15:27:01 +0000
Message-ID: <CAFEAcA8bQANMBVq-_=OK_j4wWLkxDOarO9ddrKygRJ3UnPD7GA@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] target-arm: kvm - implement software breakpoints
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qmSY77D5VHX2

On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> These don't involve messing around with debug registers, just setting
> the breakpoint instruction in memory. GDB will not use this mechanism if
> it can't access the memory to write the breakpoint.
>
> All the kernel has to do is ensure the hypervisor traps the breakpoint
> exceptions and returns to userspace.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> --
> v2
>   - handle debug exit with new hsr exception info
>   - add verbosity to UNIMP message
> v3
>   - sync with kvm_cpu_synchronize_state() before checking PC.
>   - use internals.h defines
>   - use env->pc
>   - use proper format types
> v9
>   - add include for error_report
>   - define a brk_insn constant
> ---
>  target-arm/kvm.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 78 insertions(+), 12 deletions(-)
>
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index 79ef4c6..50f70ef 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -17,6 +17,7 @@
>
>  #include "qemu-common.h"
>  #include "qemu/timer.h"
> +#include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
> @@ -516,9 +517,60 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kv=
m_run *run)
>      return MEMTXATTRS_UNSPECIFIED;
>  }
>
> +/* See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
> + *
> + * To minimise translating between kernel and user-space the kernel
> + * ABI just provides user-space with the full exception syndrome
> + * register value to be decoded in QEMU.
> + */
> +
> +static int kvm_handle_debug(CPUState *cs, struct kvm_run *run)
> +{
> +    struct kvm_debug_exit_arch *arch_info =3D &run->debug.arch;
> +    int hsr_ec =3D arch_info->hsr >> ARM_EL_EC_SHIFT;

This doesn't build for 32-bit ARM:

target-arm/kvm.c:530:27: error: =E2=80=98struct kvm_debug_exit_arch=E2=80=
=99 has no
member named =E2=80=98hsr=E2=80=99
     int hsr_ec =3D arch_info->hsr >> ARM_EL_EC_SHIFT;

> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
> +    /* Ensure PC is synchronised */
> +    kvm_cpu_synchronize_state(cs);
> +
> +    switch (hsr_ec) {
> +    case EC_AA64_BKPT:
> +        if (kvm_find_sw_breakpoint(cs, env->pc)) {
> +            return true;
> +        }
> +        break;
> +    default:
> +        error_report("%s: unhandled debug exit (%"PRIx32", %"PRIx64")\n"=
,
> +                     __func__, arch_info->hsr, env->pc);
> +    }
> +
> +    /* If we don't handle this it could be it really is for the
> +       guest to handle */
> +    qemu_log_mask(LOG_UNIMP,
> +                  "%s: re-injecting exception not yet implemented"
> +                  " (0x%"PRIx32", %"PRIx64")\n",
> +                  __func__, hsr_ec, env->pc);
> +
> +    return false;
> +}
> +
>  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>  {
> -    return 0;
> +    int ret =3D 0;
> +
> +    switch (run->exit_reason) {
> +    case KVM_EXIT_DEBUG:
> +        if (kvm_handle_debug(cs, run)) {
> +            ret =3D EXCP_DEBUG;
> +        } /* otherwise return to guest */
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
> +                      __func__, run->exit_reason);
> +        break;
> +    }
> +    return ret;
>  }
>
>  bool kvm_arch_stop_on_emulation_error(CPUState *cs)
> @@ -543,14 +595,34 @@ int kvm_arch_on_sigbus(int code, void *addr)
>
>  void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *d=
bg)
>  {
> -    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
> +    if (kvm_sw_breakpoints_active(cs)) {
> +        dbg->control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;

This won't compile on 32-bit ARM either:

target-arm/kvm.c:634:38: error: =E2=80=98KVM_GUESTDBG_USE_SW_BP=E2=80=99 un=
declared
(first use in this function)
         dbg->control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;

> +    }
>  }
>
> -int kvm_arch_insert_sw_breakpoint(CPUState *cs,
> -                                  struct kvm_sw_breakpoint *bp)
> +/* C6.6.29 BRK instruction */
> +static const uint32_t brk_insn =3D 0xd4200000;

This is the A64 breakpoint instruction, so why is it in the common-to-32-an=
d-64
source file? How about the A32 and T16 breakpoint insns?

> +
> +int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint=
 *bp)
>  {
> -    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
> -    return -EINVAL;
> +
> +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0=
) ||
> +        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
> +        return -EINVAL;
> +    }

Should we allow insertion of sw breakpoint insns if the kernel doesn't
implement KVM_EXIT_DEBUG and reporting the ESR to us?

> +    return 0;
> +}
> +
> +int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint=
 *bp)
> +{
> +    static uint32_t brk;
> +
> +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
> +        brk !=3D brk_insn ||
> +        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1=
)) {
> +        return -EINVAL;
> +    }
> +    return 0;
>  }
>
>  int kvm_arch_insert_hw_breakpoint(target_ulong addr,
> @@ -567,12 +639,6 @@ int kvm_arch_remove_hw_breakpoint(target_ulong addr,
>      return -EINVAL;
>  }
>
> -int kvm_arch_remove_sw_breakpoint(CPUState *cs,
> -                                  struct kvm_sw_breakpoint *bp)
> -{
> -    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
> -    return -EINVAL;
> -}
>
>  void kvm_arch_remove_all_hw_breakpoints(void)
>  {
> --
> 2.6.3

thanks
-- PMM
