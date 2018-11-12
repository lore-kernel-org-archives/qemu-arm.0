Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2989255wrw;
        Mon, 12 Nov 2018 03:10:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5c4ABeRxUy0Pwuz0T8hzRxaHas9wP7/8V6Ny+WOtKgrIqAlInOdNR+SE2i8N9RL4iemTb+8
X-Received: by 2002:a37:cf9b:: with SMTP id v27mr400455qkl.160.1542021009744;
        Mon, 12 Nov 2018 03:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542021009; cv=none;
        d=google.com; s=arc-20160816;
        b=gzYLMlnPMufukso+CkorZEpKCMVDq5MTrVJ7jaNCyXxw64cRcsYYQ1gyE/EbZsFPRV
         RU3wRGUi1vdGcZTgdSk5Hu3LvtB30PnSL8PE3vunygZiAMQ23HUo8yl5BMn7d1IiWtXY
         pYovvy6nL/pXPtFPQ77OMbM0JpUvoVVYI2mbTGLz6edq+rUNA6v6JTw/VuZAJNUWmGo3
         jdTS6EyeaaUt0eRyh8nQxkFiPAru5VJRQP7Kvud/UZY0ehSxmAb/AESaRq9GRWaTsm4Y
         FIub44Vm2/g7jGqq/32qDbfXVv84Bpl7f+xbmsdjQA5dKISlbeQrJCQ9styHcMvKHI7e
         JbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=hp/4WF/sDDTIQZ1skUuQsJsjkYp67BxCEmAFmtyDLJg=;
        b=F7qgx599+nNx1nCGWUCgfB+TcIFRHOPBV4kphinptZHr9DZbmkeOQiBqLpPJueaB2B
         mgaSNzY5jff0odcpV+HerfBgiIp7QZy7hmlvrQ6cAnTqQ3vgj/zvIC/NdEFcA8gvYzlS
         +Es0RZ8jsRnaWcbg8tutqhNxPWgp1xfSboXfLq+TX4oRX17z8RCT7yQJmTE7/VVrez5H
         quOSDk1emUkfes3LUlMLuSSX4anzOfli1ouWAfN8jo9ITs7BswtiglHVelx6QC6/S9Jj
         sC2eWZ7L7l0QGnIRhwFFFTMfanaBC8NzjyVlRtJ9ThBRuF4OMSfzZKSuFtAWu2jWTJoK
         E07g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uQB26e+5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si2865094qtq.11.2018.11.12.03.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uQB26e+5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMA6a-0004B1-Op
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:10:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMA6O-0004Av-OM
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:09:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMA6K-0003RN-Ka
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:09:56 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gMA6K-0003Pj-5V; Mon, 12 Nov 2018 06:09:52 -0500
Received: by mail-lf1-x142.google.com with SMTP id z13so5841348lfe.11;
	Mon, 12 Nov 2018 03:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hp/4WF/sDDTIQZ1skUuQsJsjkYp67BxCEmAFmtyDLJg=;
	b=uQB26e+5jfD1hnpB3mPHsVjJUlnkE4TlRG8E9K9Clg+f2dfIBLSW6pP8i4eNOSCXrU
	0nbBnGg+BeDBbkH7aLxDR8mwY7OhVzpX9URNJJnwiQ+X+1nM0evW6RRp7whthTycuuCI
	v4+18Tl0ljlRkI8SrAxJQe7BPTEMObhFm3oZzqP9yagFh7oqaRter6TI0bPiH/+MoCWx
	sVHTrEGY6InCVfcsSLkjdkONtRgs/KrgfC1Eh7HGApRa/g7j3eRursZj/cXGCsemm0Q+
	UZn6ON1B0zPUJj7tGPj8KYkIId3fIrWP4xyGARM/cpJpsifC/XYDaU5gCY44aDRVbwaF
	ThdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hp/4WF/sDDTIQZ1skUuQsJsjkYp67BxCEmAFmtyDLJg=;
	b=aGmJwfGxaQ2XiCCvfIA68ks5c7MTZFa4CzZ+FaFsrYNd6+sJLhPvXr0esft8fOIRL6
	eQh0e1ho+C0hrBABGxdFL6dFuJ6tyMvohvMZbG4bDl50SAL2h9tx6C1R67Gi2kruqQ1q
	giYihsQyi+zLp7GOymFDVbqu73uLXzpT2A5KFt+Ok8Ptvyw1UDbBozQgKENnvUUp9Ujn
	wSxjYERulGn9XUTm45FABHCt/yUi292EP3m4qLZzx46a7MgpEOdMxRim2okph/GnYM2Q
	WuVxNoUoSf5vZccHLqOysKr2nzlVDgg+FX/Ym/gtL9jdl+gBOTOncA2uEU3FBQmWs61n
	6ShA==
X-Gm-Message-State: AGRZ1gJmIP3IHguCiHR+b+146i9HWvA9wiXmfKXGha/CDn6R8o9ryVHw
	iv4xQDUppMvHv9f9jnJ9rp8=
X-Received: by 2002:a19:2584:: with SMTP id l126mr323837lfl.69.1542020989775; 
	Mon, 12 Nov 2018 03:09:49 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	f18-v6sm3318360ljf.36.2018.11.12.03.09.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 03:09:48 -0800 (PST)
Date: Mon, 12 Nov 2018 12:09:48 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181112110948.GC1148@toto>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
	<20181109173553.22341-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181109173553.22341-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Hyp mode R14 is shared with
 User and System
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aag9pTiOdBRe

On Fri, Nov 09, 2018 at 05:35:52PM +0000, Peter Maydell wrote:
> Hyp mode is an exception to the general rule that each AArch32
> mode has its own r13, r14 and SPSR -- it has a banked r13 and
> SPSR but shares its r14 with User and System mode. We were
> incorrectly implementing it as banked, which meant that on
> entry to Hyp mode r14 was 0 rather than the USR/SYS r14.
> 
> We provide a new function r14_bank_number() which is like
> the existing bank_number() but provides the index into
> env->banked_r14[]; bank_number() provides the index to use
> for env->banked_r13[] and env->banked_cpsr[].
> 
> All the points in the code that were using bank_number()
> to index into env->banked_r14[] are updated for consintency:
>  * switch_mode() -- this is the only place where we fix
>    an actual bug
>  * aarch64_sync_32_to_64() and aarch64_sync_64_to_32():
>    no behavioural change as we already special-cased Hyp R14
>  * kvm32.c: no behavioural change since the guest can't ever
>    be in Hyp mode, but conceptually the right thing to do
>  * msr_banked()/mrs_banked(): we can never get to the case
>    that accesses banked_r14[] with tgtmode == ARM_CPU_MODE_HYP,
>    so no behavioural change
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target/arm/internals.h | 16 ++++++++++++++++
>  target/arm/helper.c    | 29 +++++++++++++++--------------
>  target/arm/kvm32.c     |  4 ++--
>  target/arm/op_helper.c |  2 +-
>  4 files changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 6c2bb2deebd..e5341f21f6f 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -145,6 +145,22 @@ static inline int bank_number(int mode)
>      g_assert_not_reached();
>  }
>  
> +/**
> + * r14_bank_number: Map CPU mode onto register bank for r14
> + *
> + * Given an AArch32 CPU mode, return the index into the saved register
> + * banks to use for the R14 (LR) in that mode. This is the same as
> + * bank_number(), except for the special case of Hyp mode, where
> + * R14 is shared with USR and SYS, unlike its R13 and SPSR.
> + * This should be used as the index into env->banked_r14[], and
> + * bank_number() used for the index into env->banked_r13[] and
> + * env->banked_spsr[].
> + */
> +static inline int r14_bank_number(int mode)
> +{
> +    return (mode == ARM_CPU_MODE_HYP) ? BANK_USRSYS : bank_number(mode);
> +}
> +
>  void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
>  void arm_translate_init(void);
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96301930cc8..6fb1ddc5506 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6455,13 +6455,14 @@ static void switch_mode(CPUARMState *env, int mode)
>  
>      i = bank_number(old_mode);
>      env->banked_r13[i] = env->regs[13];
> -    env->banked_r14[i] = env->regs[14];
>      env->banked_spsr[i] = env->spsr;
>  
>      i = bank_number(mode);
>      env->regs[13] = env->banked_r13[i];
> -    env->regs[14] = env->banked_r14[i];
>      env->spsr = env->banked_spsr[i];
> +
> +    env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
> +    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
>  }
>  
>  /* Physical Interrupt Target EL Lookup Table
> @@ -8040,7 +8041,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
>          if (mode == ARM_CPU_MODE_HYP) {
>              env->xregs[14] = env->regs[14];
>          } else {
> -            env->xregs[14] = env->banked_r14[bank_number(ARM_CPU_MODE_USR)];
> +            env->xregs[14] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)];
>          }
>      }
>  
> @@ -8054,7 +8055,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
>          env->xregs[16] = env->regs[14];
>          env->xregs[17] = env->regs[13];
>      } else {
> -        env->xregs[16] = env->banked_r14[bank_number(ARM_CPU_MODE_IRQ)];
> +        env->xregs[16] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)];
>          env->xregs[17] = env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)];
>      }
>  
> @@ -8062,7 +8063,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
>          env->xregs[18] = env->regs[14];
>          env->xregs[19] = env->regs[13];
>      } else {
> -        env->xregs[18] = env->banked_r14[bank_number(ARM_CPU_MODE_SVC)];
> +        env->xregs[18] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)];
>          env->xregs[19] = env->banked_r13[bank_number(ARM_CPU_MODE_SVC)];
>      }
>  
> @@ -8070,7 +8071,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
>          env->xregs[20] = env->regs[14];
>          env->xregs[21] = env->regs[13];
>      } else {
> -        env->xregs[20] = env->banked_r14[bank_number(ARM_CPU_MODE_ABT)];
> +        env->xregs[20] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)];
>          env->xregs[21] = env->banked_r13[bank_number(ARM_CPU_MODE_ABT)];
>      }
>  
> @@ -8078,7 +8079,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
>          env->xregs[22] = env->regs[14];
>          env->xregs[23] = env->regs[13];
>      } else {
> -        env->xregs[22] = env->banked_r14[bank_number(ARM_CPU_MODE_UND)];
> +        env->xregs[22] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)];
>          env->xregs[23] = env->banked_r13[bank_number(ARM_CPU_MODE_UND)];
>      }
>  
> @@ -8095,7 +8096,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
>              env->xregs[i] = env->fiq_regs[i - 24];
>          }
>          env->xregs[29] = env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)];
> -        env->xregs[30] = env->banked_r14[bank_number(ARM_CPU_MODE_FIQ)];
> +        env->xregs[30] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)];
>      }
>  
>      env->pc = env->regs[15];
> @@ -8145,7 +8146,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>          if (mode == ARM_CPU_MODE_HYP) {
>              env->regs[14] = env->xregs[14];
>          } else {
> -            env->banked_r14[bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
> +            env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
>          }
>      }
>  
> @@ -8159,7 +8160,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>          env->regs[14] = env->xregs[16];
>          env->regs[13] = env->xregs[17];
>      } else {
> -        env->banked_r14[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
> +        env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
>          env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[17];
>      }
>  
> @@ -8167,7 +8168,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>          env->regs[14] = env->xregs[18];
>          env->regs[13] = env->xregs[19];
>      } else {
> -        env->banked_r14[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
> +        env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
>          env->banked_r13[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[19];
>      }
>  
> @@ -8175,7 +8176,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>          env->regs[14] = env->xregs[20];
>          env->regs[13] = env->xregs[21];
>      } else {
> -        env->banked_r14[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
> +        env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
>          env->banked_r13[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[21];
>      }
>  
> @@ -8183,7 +8184,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>          env->regs[14] = env->xregs[22];
>          env->regs[13] = env->xregs[23];
>      } else {
> -        env->banked_r14[bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
> +        env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
>          env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
>      }
>  
> @@ -8200,7 +8201,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>              env->fiq_regs[i - 24] = env->xregs[i];
>          }
>          env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[29];
> -        env->banked_r14[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
> +        env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
>      }
>  
>      env->regs[15] = env->pc;
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 0f1e94c7b5e..cb3fb73a961 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -318,8 +318,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
>      }
>      env->banked_r13[bn] = env->regs[13];
> -    env->banked_r14[bn] = env->regs[14];
>      env->banked_spsr[bn] = env->spsr;
> +    env->banked_r14[r14_bank_number(mode)] = env->regs[14];
>  
>      /* Now we can safely copy stuff down to the kernel */
>      for (i = 0; i < ARRAY_SIZE(regs); i++) {
> @@ -430,8 +430,8 @@ int kvm_arch_get_registers(CPUState *cs)
>          memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
>      }
>      env->regs[13] = env->banked_r13[bn];
> -    env->regs[14] = env->banked_r14[bn];
>      env->spsr = env->banked_spsr[bn];
> +    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
>  
>      /* VFP registers */
>      r.id = KVM_REG_ARM | KVM_REG_SIZE_U64 | KVM_REG_ARM_VFP;
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 90741f6331d..2b62c53f5b5 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -694,7 +694,7 @@ void HELPER(msr_banked)(CPUARMState *env, uint32_t value, uint32_t tgtmode,
>          env->banked_r13[bank_number(tgtmode)] = value;
>          break;
>      case 14:
> -        env->banked_r14[bank_number(tgtmode)] = value;
> +        env->banked_r14[r14_bank_number(tgtmode)] = value;
>          break;
>      case 8 ... 12:
>          switch (tgtmode) {
> -- 
> 2.19.1
> 
