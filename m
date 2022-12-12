Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3466153ejb;
        Mon, 12 Dec 2022 08:17:00 -0800 (PST)
X-Received: by 2002:a17:90b:78a:b0:214:132a:2bea with SMTP id l10-20020a17090b078a00b00214132a2beamr16667712pjz.4.1670861819787;
        Mon, 12 Dec 2022 08:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670861819; cv=none;
        d=google.com; s=arc-20160816;
        b=FdgWvVW1SOHep4x9TLekiEwFooiTHxpBpzvw5IkPMw6S2+y+nGp7z3ZbpR5haxK+Eu
         lUXLsqGri6bJFQc8V/jZV4jGaTWGM/dNZ1EiFsfyn6u6C7LAiU7UYjAqMTltwAp7GVB6
         EUjFS57QRd1JZpLJnQo4zoz85RSsiRqwRPX4I/KKSYV0LF1KFG1dAXf5hqrm0PJbSAG5
         3OoMFoo1Ch4OSD4VAF9bbYE3R5MXvkTjtIzid14nAC4YN+uAGPxEXpFk1L4ClEHCK/xD
         YelpCbF/gJ4/zOZJFEDxpovVy3rZzMvfAJxl4I0A5Avd6f6dcKMh7X7YNom9k4aGUbL+
         ZMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5uOiTnX4huuSRRuxb+Xsfwnc2vZE5IebtoMrPgdsREI=;
        b=lDb1qVXcRzjdvPro7nvADD3SiyulYCki2FjoTJ+x77xg3dNlvPjE4IEADSxEwEj93A
         V2rnt921ANkcT3fTJZlbAJviB9vbo9wu1gIML8t95vkTF43S++u1gs/0khxpLx9RomeO
         DMoZjUam+0LXvhIcZ9MOc21VcSgpH0XFkOwxnyRlxsHmlrERYk6vcRgHscErh3ZoWpau
         AG7pRVn/mZfx55zBUO/v+/Ri0fe6nsz2nJAsVMaUrpOF3O/o7xcunI37eclQBLK0hWzW
         QtUcgqGVm5XDtZ6eNfQPtnh0u+g+ec7dKTYCM9rZ//Zx99BkqQuV0vQdNI4nHz8VDAHm
         JUcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tl3+8Avt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p14-20020a17090a348e00b0021902eba5dbsor4100111pjb.43.2022.12.12.08.16.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Dec 2022 08:16:59 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tl3+8Avt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5uOiTnX4huuSRRuxb+Xsfwnc2vZE5IebtoMrPgdsREI=;
        b=Tl3+8AvtiOO2Ze8iFAJHJLY+DFy5vhzFwAgp1qOO3bfyBZFaX7NV3/qW8psifhsoLF
         bC8C3HOB5uHuH3ojRYhdEk3KdVNxzTiGUwq/dIYeqJ/xgKNrMT+LyaIaLQbMGU5t6gE6
         DEEZgFMdLUMmUrH7m5mHzG5rKt9tckNw+5oLTefiQe5p3bqgQb2bqmtAyH9My0qggozA
         tStgKBm/tIskxVfUkI3Yp+NdV83JxlAPaIWg4qWcDYyZBq4K+YjiTUJQ0KhiO8b5arir
         7h3uieJgcmW8Qiaz+fjj/oz+9boeOv8qyYCP4Fl8fvp97ckPVYcCJ13KOAecQ1AYcApz
         E4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uOiTnX4huuSRRuxb+Xsfwnc2vZE5IebtoMrPgdsREI=;
        b=axLh2lPsLlVsgIOyrodF7ln9sApxqoEzYJwHDprniYgGQX/oXV1jRQqzLFq/x7SRVT
         Hy48EBwjwBqIKhYxKj2SqjOi73iwKUVMjQREep6vPvkUqZSmsQNPcF2XxVUNs+WGIoXb
         3vX29wUCfnOxEwcThAQL8OwIiUjFm56ypuCA8TDuDsCiV5nwLzx8Sa7RLS+89UGkSnqQ
         QppJFoTeVhOigRHZXgUPFWAXaulAYmp+MiNoSBmYdhT2W80l2IRSYihh5gP22jCLPP+h
         bCOxTIu3N35sVjG0Tjt82pzjYLbDOGY3cHBeJtN+C9BZsHUlFj24Jm1WPNgBmKJ+ub9j
         a3fA==
X-Gm-Message-State: ANoB5pkFRPE+/4/JKM4w2as7v2Gj+1TrbL0QInWIux+B6/2Coy06T83N
	eg8eiu1iwD8+uvB6R6e3gcqdzLbo8jLscuGCWQrrPw1t
X-Google-Smtp-Source: AA0mqf7yF5K+WEblXjnxcNYOLVN/fj+5blWB5eitiFbcN1C2+XDBtzLY6b/dmQM5rxak6rBwhxZ6gSxEFF3Z/KoIO2w=
X-Received: by 2002:a17:90b:3c0b:b0:219:e2f1:81ad with SMTP id
 pb11-20020a17090b3c0b00b00219e2f181admr17833071pjb.19.1670861819371; Mon, 12
 Dec 2022 08:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20221116174749.65175-1-fcagnin@quarkslab.com> <20221116174749.65175-3-fcagnin@quarkslab.com>
In-Reply-To: <20221116174749.65175-3-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2022 16:16:47 +0000
Message-ID: <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TOZ3GbGXD0Rr

On Wed, 16 Nov 2022 at 17:48, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>
> Guests can be debugged through the gdbstub.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

Hi; sorry it's taken me a while to get to this patchset.

> +void hvf_arch_update_guest_debug(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    hv_return_t r = HV_SUCCESS;
> +    bool trap_debug_exceptions = false;
> +
> +    cpu_synchronize_state(cpu);
> +
> +    if (cpu->singlestep_enabled) {
> +        trap_debug_exceptions = true;
> +
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
> +        pstate_write(env, pstate_read(env) | PSTATE_SS);
> +    } else {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
> +    }
> +
> +    if (hvf_sw_breakpoints_active(cpu)) {
> +        trap_debug_exceptions = true;
> +    }
> +
> +    if (hvf_arm_hw_debug_active(cpu)) {
> +        trap_debug_exceptions = true;
> +
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
> +
> +        int i;
> +        for (i = 0; i < cur_hw_bps; i++) {
> +            HWBreakpoint *bp = get_hw_bp(i);
> +            env->cp15.dbgbcr[i] = bp->bcr;
> +            env->cp15.dbgbvr[i] = bp->bvr;
> +        }
> +        for (i = 0; i < cur_hw_wps; i++) {
> +            HWWatchpoint *bp = get_hw_wp(i);
> +            env->cp15.dbgwcr[i] = bp->wcr;
> +            env->cp15.dbgwvr[i] = bp->wvr;
> +        }

Can you explain how the patches keep the guest's idea of the debug
registers distinct from the QEMU debugstub's values from them?
Looking at this patch it seems like we just directly set the
cp15.* values with what the debug stub wants them to be here;
but in patch 3 any trapped guest writes to the debug registers
also simply write to the same env fields.

With KVM, this is handled by the host kernel: QEMU tells KVM
that it wants to do guest debug, and then uses the KVM_SET_GUEST_DEBUG
ioctl to say what the bp/wp etc register values should be. The
KVM kernel then uses those values when it runs the VM, as well
as ensuring that debug exceptions go to EL2 rather than EL1,
and that EL1 accesses to the debug regs are also trapped to EL2.
Guest attempts to access the debug registers are then handled by
having reads and writes access fields which correspond to the
guest's view of the debug registers, which is separate from the
values that the QEMU debug stub is using. The effect is that while
QEMU is doing debug of the VM, the guest can still read and write
the debug registers, they just don't have any effect. The guest
can't do anything that messes with the state of the debug registers
that QEMU's debug stub is relying on. If/when QEMU says it's
done with doing guest debug, then the host kernel goes back to using
the guest's values of the debug registers. (In the kernel sources
this is done in arch/arm64/kvm/debug.c, with the trapping of debug
registers done in arch/arm64/kvm/sys_regs.c.)

I suspect that with HVF we need to do the equivalent of this ourselves
in QEMU.

thanks
-- PMM
