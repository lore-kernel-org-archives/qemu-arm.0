Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1008541lff;
        Wed, 11 Dec 2019 10:32:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZl9q02TGLRUvfOfSXlMD0ZVRduNMptCP02Vpu404HEGFSEKuiV/mhRPbsuBYPIEbu3Afu
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr1255557wme.133.1576089123000;
        Wed, 11 Dec 2019 10:32:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576089122; cv=pass;
        d=google.com; s=arc-20160816;
        b=BQeokPbbrT/DEXOiDWx4uZ3Ki//4RLr9Fglw4XaE/9j2/e0FcWNBJILnpiuYWfxGl0
         UojBFfL+kFA9YPveCqKHtVVwI41/i8QNr+Zi0Jit0/bab/z1ZI9I2wAISWWd9/2D8MA1
         sVDkoS4HszFcZa2gApkvH1Ama9MQZ1KcTlqnHA8lzTqCHc2rBvhNlaI3usHz5HCQe+GN
         EqbxvMdjgqmRSuZWFFlmpUYY7OlOCVnrd4YHk512Q3hwOjL1slsEPbZKb9t0UsNKwfW0
         RaanSEqoAdb/Gnq1BgTi/NZHZG198Qwb6L1HAq9bVTgz79ieOBlVXt3xhKcSTmT7Y/De
         NpvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=mQ5xyVW08Yw0tiMnTbHBQxwUQsPAL+SLR0RjCN/xVwQ=;
        b=lI8CwMsCUeDkHeqUiA1qpzAGrnvzeBXc8bN2wGH9Cuh3qVsw5a+w+6LBcG7vzKLx9d
         4IZpxDVjFx5ddqddmHxmL1yBhz882f0+iUko4gqTw0yumAGPS0uDeMKMVewUlyw2IUty
         eAQAZ9cqsdDtr4W6wYJwjaijyMTKK4p2q8p+JB0auPStEMERix/E0EM7hi8Q1HzjFcVn
         U+5d03JhkceP8ozYZ/fLFt6aGZ+k418OiLtYGL1+l45rooFeFix2RJOTjP7z7szSE9O3
         umc6trONhnW0miGrmYh4CUoyuC8vCwC0mZTWjl3TjeWnJYpOad5KpPGrOZhAYp2PtH2w
         zz3Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=fAl0Y54H;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id n130si2905377wma.113.2019.12.11.10.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 10:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=fAl0Y54H;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 300BF96EF0;
	Wed, 11 Dec 2019 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1576089121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ5xyVW08Yw0tiMnTbHBQxwUQsPAL+SLR0RjCN/xVwQ=;
	b=fAl0Y54H0WvabByUlsIUS+w7FlVJ5wnWmaPKFYP6B9IJyDLtaPdF1nDzKfZ0fXDPHqHjmN
	yYZKskzRQCnD5AvqmXGgIcSOX0hgc8uKv4aIxM8mwB2wB85bEhPkIhd6d46sKvIWDewdAh
	7eLhssqavBHsko38WYhL2ta0EgKkozs=
Subject: Re: [PATCH v3 08/20] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alan.hayward@arm.com,
 luis.machado@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-9-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <b65e722f-7524-9269-3f36-6045ab5393c5@greensocs.com>
Date: Wed, 11 Dec 2019 19:31:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1576089121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ5xyVW08Yw0tiMnTbHBQxwUQsPAL+SLR0RjCN/xVwQ=;
	b=QWFzz8Xc8qssztDzulzl2qUg/Y2Hi3b+740Hj8v5WC7oYh1MVWDFq9M86v9ZfrVFwJ9tFR
	y3TcCJ8illJ7PbaWhQqvEG6BLU+/Rvec8D0lkx0m9OjRljRSApaCqFsVVNBg46viyjQY4O
	gW2UoLQW/+EjMSGHrOvGYbBXqfLImMM=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576089121; a=rsa-sha256;
	cv=none;
	b=AdJvTldr38lAKee51wr23drslH+ZiFf69ixXo+bZmkc2IjO+Zts7XspKqv1O1VaoZ7qC+M
	mBHDotNTEDcdIEctLayxnBt8LgdnrzSdWB63rlOqQENmprqqzK+YeY+gyknZpKZ5U9sWzz
	/hxW4+LBQmnBHJOLPq26xZHVOC55fJc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: xd9oddDaU5uN


Hi Alex,

On 12/11/19 6:05 PM, Alex Bennée wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

[...]

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0ac950d6c71..6476245e789 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -47,30 +47,27 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>  
>  static void switch_mode(CPUARMState *env, int mode);
>  
> -static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> +static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
>  {
>      int nregs;
>  
>      /* VFP data registers are always little-endian.  */
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        stq_le_p(buf, *aa32_vfp_dreg(env, reg));
> -        return 8;
> +        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));

It was a little-endian version, you've put a target-endian version.
Is that what you meant ?

>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          /* Aliases for Q regs.  */
>          nregs += 16;
>          if (reg < nregs) {
>              uint64_t *q = aa32_vfp_qreg(env, reg - 32);
> -            stq_le_p(buf, q[0]);
> -            stq_le_p(buf + 8, q[1]);
> -            return 16;
> +            return gdb_get_reg128(buf, q[0], q[1]);

Ditto here.

>          }
>      }
>      switch (reg - nregs) {
> -    case 0: stl_p(buf, env->vfp.xregs[ARM_VFP_FPSID]); return 4;
> -    case 1: stl_p(buf, vfp_get_fpscr(env)); return 4;
> -    case 2: stl_p(buf, env->vfp.xregs[ARM_VFP_FPEXC]); return 4;
> +    case 0: return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]); break;
> +    case 1: return gdb_get_reg32(buf, vfp_get_fpscr(env)); break;
> +    case 2: return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]); break;
>      }
>      return 0;
>  }
> @@ -101,7 +98,7 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
>      return 0;
>  }
>  
> -static int aarch64_fpu_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> +static int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
>  {
>      switch (reg) {
>      case 0 ... 31:
> @@ -204,7 +201,7 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
>      }
>  }
>  
> -static int arm_gdb_get_sysreg(CPUARMState *env, uint8_t *buf, int reg)
> +static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
>  {
>      ARMCPU *cpu = env_archcpu(env);
>      const ARMCPRegInfo *ri;

[...]

> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 823759c92e7..6f08021cc22 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -114,10 +114,11 @@ void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
>   * the FP regs zero size when talking to a newer gdb.
>   */
>  
> -int ppc_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
> +int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
> +    uint8_t *mem_buf;
>      int r = ppc_gdb_register_len(n);
>  
>      if (!r) {
> @@ -126,17 +127,17 @@ int ppc_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>  
>      if (n < 32) {
>          /* gprs */
> -        gdb_get_regl(mem_buf, env->gpr[n]);
> +        gdb_get_regl(buf, env->gpr[n]);
>      } else if (n < 64) {
>          /* fprs */
> -        stfq_p(mem_buf, *cpu_fpr_ptr(env, n - 32));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
>      } else {
>          switch (n) {
>          case 64:
> -            gdb_get_regl(mem_buf, env->nip);
> +            gdb_get_regl(buf, env->nip);
>              break;
>          case 65:
> -            gdb_get_regl(mem_buf, env->msr);
> +            gdb_get_regl(buf, env->msr);
>              break;
>          case 66:
>              {
> @@ -145,31 +146,33 @@ int ppc_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>                  for (i = 0; i < 8; i++) {
>                      cr |= env->crf[i] << (32 - ((i + 1) * 4));
>                  }
> -                gdb_get_reg32(mem_buf, cr);
> +                gdb_get_reg32(buf, cr);
>                  break;
>              }
>          case 67:
> -            gdb_get_regl(mem_buf, env->lr);
> +            gdb_get_regl(buf, env->lr);
>              break;
>          case 68:
> -            gdb_get_regl(mem_buf, env->ctr);
> +            gdb_get_regl(buf, env->ctr);
>              break;
>          case 69:
> -            gdb_get_reg32(mem_buf, env->xer);
> +            gdb_get_reg32(buf, env->xer);
>              break;
>          case 70:
> -            gdb_get_reg32(mem_buf, env->fpscr);
> +            gdb_get_reg32(buf, env->fpscr);
>              break;
>          }
>      }
> +    mem_buf = buf->data - r;

Should it not be something more like this ?
mem_buf = buf->data + buf->len - r;

There seem to be the same issue below for every
ppc_maybe_bswap_register() call.

>      ppc_maybe_bswap_register(env, mem_buf, r);
>      return r;
>  }
>  
> -int ppc_cpu_gdb_read_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
> +int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
> +    uint8_t *mem_buf;
>      int r = ppc_gdb_register_len_apple(n);
>  
>      if (!r) {
> @@ -178,21 +181,21 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
>  
>      if (n < 32) {
>          /* gprs */
> -        gdb_get_reg64(mem_buf, env->gpr[n]);
> +        gdb_get_reg64(buf, env->gpr[n]);
>      } else if (n < 64) {
>          /* fprs */
> -        stfq_p(mem_buf, *cpu_fpr_ptr(env, n - 32));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
>      } else if (n < 96) {
>          /* Altivec */
> -        stq_p(mem_buf, n - 64);
> -        stq_p(mem_buf + 8, 0);
> +        gdb_get_reg64(buf, n - 64);
> +        gdb_get_reg64(buf, 0);
>      } else {
>          switch (n) {
>          case 64 + 32:
> -            gdb_get_reg64(mem_buf, env->nip);
> +            gdb_get_reg64(buf, env->nip);
>              break;
>          case 65 + 32:
> -            gdb_get_reg64(mem_buf, env->msr);
> +            gdb_get_reg64(buf, env->msr);
>              break;
>          case 66 + 32:
>              {
> @@ -201,23 +204,24 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
>                  for (i = 0; i < 8; i++) {
>                      cr |= env->crf[i] << (32 - ((i + 1) * 4));
>                  }
> -                gdb_get_reg32(mem_buf, cr);
> +                gdb_get_reg32(buf, cr);
>                  break;
>              }
>          case 67 + 32:
> -            gdb_get_reg64(mem_buf, env->lr);
> +            gdb_get_reg64(buf, env->lr);
>              break;
>          case 68 + 32:
> -            gdb_get_reg64(mem_buf, env->ctr);
> +            gdb_get_reg64(buf, env->ctr);
>              break;
>          case 69 + 32:
> -            gdb_get_reg32(mem_buf, env->xer);
> +            gdb_get_reg32(buf, env->xer);
>              break;
>          case 70 + 32:
> -            gdb_get_reg64(mem_buf, env->fpscr);
> +            gdb_get_reg64(buf, env->fpscr);
>              break;
>          }
>      }
> +    mem_buf = buf->data - r;
>      ppc_maybe_bswap_register(env, mem_buf, r);
>      return r;
>  }
> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
> index ba726dec4d0..154f876e44c 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -9587,7 +9587,7 @@ static int gdb_find_spr_idx(CPUPPCState *env, int n)
>      return -1;
>  }
>  
> -static int gdb_get_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      int reg;
>      int len;
> @@ -9598,8 +9598,8 @@ static int gdb_get_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      }
>  
>      len = TARGET_LONG_SIZE;
> -    stn_p(mem_buf, len, env->spr[reg]);
> -    ppc_maybe_bswap_register(env, mem_buf, len);
> +    gdb_get_regl(buf, env->spr[reg]);
> +    ppc_maybe_bswap_register(env, buf->data - len, len);
>      return len;
>  }
>  
> @@ -9621,15 +9621,18 @@ static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>  }
>  #endif
>  
> -static int gdb_get_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
> +    uint8_t *mem_buf;
>      if (n < 32) {
> -        stfq_p(mem_buf, *cpu_fpr_ptr(env, n));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
> +        mem_buf = buf->data - 8;
>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          return 8;
>      }
>      if (n == 32) {
> -        stl_p(mem_buf, env->fpscr);
> +        gdb_get_reg32(buf, env->fpscr);
> +        mem_buf = buf->data - 4;
>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
>      }
> @@ -9651,28 +9654,31 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>  
> -static int gdb_get_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
> +    uint8_t *mem_buf;
> +
>      if (n < 32) {
>          ppc_avr_t *avr = cpu_avr_ptr(env, n);
>          if (!avr_need_swap(env)) {
> -            stq_p(mem_buf, avr->u64[0]);
> -            stq_p(mem_buf + 8, avr->u64[1]);
> +            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
>          } else {
> -            stq_p(mem_buf, avr->u64[1]);
> -            stq_p(mem_buf + 8, avr->u64[0]);
> +            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
>          }
> +        mem_buf = buf->data - 16;
>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          ppc_maybe_bswap_register(env, mem_buf + 8, 8);
>          return 16;
>      }
>      if (n == 32) {
> -        stl_p(mem_buf, helper_mfvscr(env));
> +        gdb_get_reg32(buf, helper_mfvscr(env));
> +        mem_buf = buf->data - 4;
>          ppc_maybe_bswap_register(env, mem_buf, 4);>          return 4;
>      }
>      if (n == 33) {
> -        stl_p(mem_buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        mem_buf = buf->data - 4;
>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
>      }
> @@ -9707,25 +9713,25 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>  
> -static int gdb_get_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      if (n < 32) {
>  #if defined(TARGET_PPC64)
> -        stl_p(mem_buf, env->gpr[n] >> 32);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        gdb_get_reg32(buf, env->gpr[n] >> 32);
> +        ppc_maybe_bswap_register(env, buf->data - 4, 4);
>  #else
> -        stl_p(mem_buf, env->gprh[n]);
> +        gdb_get_reg32(buf, env->gprh[n]);
>  #endif
>          return 4;
>      }
>      if (n == 32) {
> -        stq_p(mem_buf, env->spe_acc);
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        gdb_get_reg64(buf, env->spe_acc);
> +        ppc_maybe_bswap_register(env, buf->data - 8, 8);
>          return 8;
>      }
>      if (n == 33) {
> -        stl_p(mem_buf, env->spe_fscr);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        gdb_get_reg32(buf, env->spe_fscr);
> +        ppc_maybe_bswap_register(env, buf->data - 4, 4);
>          return 4;
>      }
>      return 0;
> @@ -9760,11 +9766,11 @@ static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>  
> -static int gdb_get_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      if (n < 32) {
> -        stq_p(mem_buf, *cpu_vsrl_ptr(env, n));
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
> +        ppc_maybe_bswap_register(env, buf->data - 8, 8);
>          return 8;
>      }
>      return 0;

Otherwise, other files seem ok.

Regards,
--
Damien
