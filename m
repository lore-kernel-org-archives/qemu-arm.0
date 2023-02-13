Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp130432ejb;
        Mon, 13 Feb 2023 03:52:39 -0800 (PST)
X-Received: by 2002:a05:6a20:e688:b0:bc:92cd:1536 with SMTP id mz8-20020a056a20e68800b000bc92cd1536mr21518750pzb.61.1676289159649;
        Mon, 13 Feb 2023 03:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676289159; cv=none;
        d=google.com; s=arc-20160816;
        b=TdAGU+oWOAy6Ajxe/Ub2y7ANEoiSUD1YiDEEuCHIx5sg6BlCb4+c53KJDEaOSANfL5
         jtnKz86vCEkUg4J7xktw9okNJkiCeaOYoas05hjKxmJyCnxwi2lty+XuvET8ygB+Y1v2
         Z5KBmXKeQsFd810Erwae1dpKBQVHriBdlyxsrKLFDRw+9hDwee0JCvylnJ1/XBa1EhzQ
         XETs6AmjvL6v9rnd7y+zMZRKaMJMerOFPLJAMfe3dorowG13J4h44bEjgeykTYfXtDl8
         ihBr67xQszX4HohnJGENU6IbJ5RBe3sxxj31jjKGPA/zpKsxCnqBOfvSncF+fBjS1u4R
         NWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rfr0vB/rPk3zdU4Xx55SHy2XeRyBDOkTls6Yb2BvMsc=;
        b=z40U8yAoPZHCd0ZhsVpFXT102bfv5zr+RbDPVzcEKh8b57Z3lZLcRMXtNfmmdVdKjM
         xJ2fLfNltKXMJS/MrxfUhyNMvephYSXnTLiteW2SZs8Nvo+FQ1Fjuq+u42Xaw512bsGI
         jN0vhi0AAJSSOTFxHLr9mZoLgpHSeROgvspw7T6zbR5ruP2N1dV1OCblBDvM57UQtIzW
         SuX8pfT+EJ7owIFB+H4AKfOtD2prs806FnQ5fLjGwlev77J5eby4/7NpZISvoko/jH7f
         1tMU4lKhfXuQDcwHZ5P+wVY0almqDE6T+XHELABM/nVfO8kULVfAYqhNyTR6i25FB/Bm
         Yn4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hf5v5UoS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x63-20020a638642000000b004957aef7ae9sor5544385pgd.13.2023.02.13.03.52.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 03:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hf5v5UoS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676289159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rfr0vB/rPk3zdU4Xx55SHy2XeRyBDOkTls6Yb2BvMsc=;
        b=Hf5v5UoStgKxQLJw9aYgBgJisc8pbs2ZXKfYykHvGu48ud7vtjtMQ9SQ7j+PuHE4BL
         NFwWP4sZ3JCEptiAvobhvtC9Z3eOGrglPNzdgfDXDm7UbvWbCgZXgbeZYeVSWVCYuaJg
         NQXSV6drMgOtskNvfToGFrvdo7ukeSn+4MQXbS5cfvC/iVru7Fs5ewB2n3TMdKCRYCly
         p6B0vI33WSTKpY7r8eoJzLDJPphJybG6q3icu7f0bkcQPuiTO0GfenueCFk2kFx5XZrp
         3fl1vHxxjZ5Fdy+mgeUja9rvaGZsYQPjvPP3K+BUOlpNclrBTUCP8ShgabSP8p8kO4af
         JuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676289159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfr0vB/rPk3zdU4Xx55SHy2XeRyBDOkTls6Yb2BvMsc=;
        b=AyzwIbKKZPX1Bsqgv9knTYVHnEbhOQDo6bXTHLttplmKyzNXY3M524cTMpAqy2OL9s
         01Ruom0wcQqxoA3Tr0hbhxqDM05d4msGT/SPeqVQHuuDcbn+U0PRohUikoKMc/8e6e39
         8uG0XOTS9qvaVR52qWqqXGpRxZNmlJkIx7/0MPFuvoKcl6rmGPnB3jSt2XFxFBieX0Eq
         DfSk66ahlXLGiLH3ZHCSRFdiPyE8cFxQeTg6glYljRpbxdHTIDhS2vdxbMeV4UIqbFtN
         TzNABlZC79iyzq3L+cJCMqBvsPGOEZvXyjA/rWIsywfZn7+rfxouUeG0BEcG8EMPdPcF
         p4GQ==
X-Gm-Message-State: AO0yUKVt8psa6YBksmx3lYSOBjKLQhVkjO/nzsvOWXh3Tm6a4iBjAqRG
	dP6oiC6quoT/efDGPHyQKHZLZ1yM2Kc3jF/bdxpGkogg
X-Google-Smtp-Source: AK7set+VvmNtHODiG0To9RK3O9dwwfTqS9j+HowuTm1ExRgon2bWio611ixArq44BF04gURYcarSNR6nQ3AnPxrIqmU=
X-Received: by 2002:a62:1c8c:0:b0:593:ef2a:5ea8 with SMTP id
 c134-20020a621c8c000000b00593ef2a5ea8mr4586052pfc.7.1676289159100; Mon, 13
 Feb 2023 03:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <20230114161302.94595-3-fcagnin@quarkslab.com>
In-Reply-To: <20230114161302.94595-3-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 11:52:27 +0000
Message-ID: <CAFEAcA_qaOD_6uCLdGwsGFibDo1B5DQ30r51XHk_HKJmC9NPyA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: sZcmuZBk/L31

On Sat, 14 Jan 2023 at 16:13, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>
> Guests can be debugged through the gdbstub.
>
> While guest debugging is enabled, the guest can still read and write the
> DBG*_EL1 registers but they don't have any effect.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

This fails to build on x86 macos:
Undefined symbols for architecture x86_64:
  "_hvf_arch_insert_hw_breakpoint", referenced from:
      _hvf_insert_breakpoint in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_insert_sw_breakpoint", referenced from:
      _hvf_insert_breakpoint in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_remove_all_hw_breakpoints", referenced from:
      _hvf_remove_all_breakpoints in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_remove_hw_breakpoint", referenced from:
      _hvf_remove_breakpoint in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_remove_sw_breakpoint", referenced from:
      _hvf_remove_breakpoint in accel_hvf_hvf-accel-ops.c.o
      _hvf_remove_all_breakpoints in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_update_guest_debug", referenced from:
      _hvf_update_guest_debug in accel_hvf_hvf-all.c.o

I think your abstraction layer between generic hvf code and
architecture-specific hvf code is missing x86 "do nothing"
implementations of functions.



> +static bool hvf_supports_guest_debug(void)
> +{
> +#ifdef TARGET_AARCH64
> +    return true;
> +#else
> +    return false;
> +#endif

This should defer to an architecture-specific function (or just
be an architecture specific function) rather than using an inline
ifdef.


> index bb70082e45..3e99c80416 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -36,4 +36,33 @@ typedef struct HVFState HVFState;
>  DECLARE_INSTANCE_CHECKER(HVFState, HVF_STATE,
>                           TYPE_HVF_ACCEL)
>
> +#ifdef NEED_CPU_H
> +#include "cpu.h"

Please don't put #include lines in the middle of files -- keep them at the top.

> +
> +int hvf_update_guest_debug(CPUState *cpu);

Ideally new global functions declared in headers should
have documentation comments.

> +            case HV_SYS_REG_DBGWVR15_EL1:
> +            case HV_SYS_REG_DBGWCR15_EL1: {
> +                const ARMCPRegInfo *ri;
> +                ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_sreg_match[i].key);
> +                val = read_raw_cp_reg(env, ri);
> +
> +                arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;

This would be much easier to understand if there was some commentary
explaining what it was doing.

> +                continue;
> +            }
> +            }
> +        }
> +
>          ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
>          assert_hvf_ok(ret);




> +void hvf_arch_update_guest_debug(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    hv_return_t r = HV_SUCCESS;
> +
> +    guest_debug_enabled = cpu->singlestep_enabled ||
> +        hvf_sw_breakpoints_active(cpu) ||
> +        hvf_arm_hw_debug_active(cpu);
> +
> +    cpu_synchronize_state(cpu);
> +
> +    if (cpu->singlestep_enabled) {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
> +        pstate_write(env, pstate_read(env) | PSTATE_SS);
> +    } else {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
> +    }
> +
> +    if (hvf_arm_hw_debug_active(cpu)) {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
> +
> +        int i;
> +        for (i = 0; i < cur_hw_bps; i++) {
> +            HWBreakpoint *bp = get_hw_bp(i);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], bp->bcr);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], bp->bvr);
> +            assert_hvf_ok(r);
> +        }
> +        for (i = 0; i < cur_hw_wps; i++) {
> +            HWWatchpoint *bp = get_hw_wp(i);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], bp->wcr);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], bp->wvr);
> +            assert_hvf_ok(r);
> +        }
> +    } else {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
> +
> +        int i;
> +        for (i = 0; i < max_hw_bps; i++) {
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], env->cp15.dbgbcr[i]);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], env->cp15.dbgbvr[i]);
> +            assert_hvf_ok(r);
> +        }
> +        for (i = 0; i < max_hw_wps; i++) {
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], env->cp15.dbgwcr[i]);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], env->cp15.dbgwvr[i]);
> +            assert_hvf_ok(r);
> +        }
> +    }

Can you describe what's going on here? Conceptually there are two lots
of debug register state -- the one the guest vCPU has, and the one we
want to be using when we're doing gdbstub debugging. Where are we
keeping the two copies of the state, how do we decide which one to
feed to hvf as the live version, etc ?

More generally, I would prefer to be able to determine your design
by looking at the commit message and comments, rather than by
reverse-engineering it from the code :-)

thanks
-- PMM
