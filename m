Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp733963njc;
        Wed, 19 Mar 2025 23:21:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-7377a92c67bmr3720225b3a.18.1742451676356;
        Wed, 19 Mar 2025 23:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742451676; cv=none;
        d=google.com; s=arc-20240605;
        b=la6tqADQRmI67+j5SBes20zkrtlzxlh2FK4GwLN8NBepDKOjSuJw/vqW//u4yLbXWF
         g8BHsf+hjjmJuBiYE6cKpuURmCtLtYaVI/Qs5BFsrBOeOSS4Yky96PQ2B3YeLJqjFvVW
         DwnOsBvnxk0PqefrVzr3Aousv1UiRFnRjo9B5xLSqdTRhvEhiJIdA57J6Z6jPHiNOzba
         6MS4yrMGlExgEuerMOvmX1aDeHiYDEWWCg86XDfKbxD0rBZPfTlMr7RSVZeGby/KKul0
         M5IXVj+/d145SvA8iopSIc+GLr78aMiLOE9h5aVA/ztiKFR0Ck1iheJrXgvTF20oqN40
         YRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2nNZxDTDESGfSLyL353XFE0BeY1oeJ3+DukZFk8chPQ=;
        fh=E8t/02ZSsoJgyiOrQcDlRoFznYRvW+Fe/0vT732LnmY=;
        b=J9fK9pJXOm+x+7X6SWwA618hvtTrVG0UjesJ+BhyQSII+peT4pJjc923SboHZNhYx6
         6koBIkXbdsX3l27lgQrzUrN8mJc0k5GwqeYcyIDqa8Onq1eu//e02zQMl3Snyg1hlUj+
         jg2055TXZIQtTulUQm7bgWY1xZ8LqfGRJY2AU5RCWXHI+cE9fNR2b+RZ19oFwJGNbYr7
         vAamR5poP9qgmvIXYTtYD16MmoJBQLa72Vu1D1AA0i4QljNodYRZ9jhU2d0+Fg5AiNTw
         u41ULfXBnK9TGkBprf+fJg4rif+qFo9w/f8oVclLPvR1AfSr+mAsx/Qd0jvBFQobV9ig
         Dt8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=O5PTNzVT;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737116d5a92sor11986253b3a.10.2025.03.19.23.21.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 23:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=O5PTNzVT;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742451675; x=1743056475; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nNZxDTDESGfSLyL353XFE0BeY1oeJ3+DukZFk8chPQ=;
        b=O5PTNzVTa+TFEoWlhrfzmlsbYWl24fwCL6e9RgwIDMlyrIVzGteN/o02BtgWycZXwf
         NAuuQspmnpj/Lf4isVYTyGLCpSsfqzp6lEAr/DzbtZyJF5OFQIUsjhV6Xr50vP8d0F0X
         K2qkCVOzeiF/ZOCySYp3gaUwm27F0CBYSJvbmAnnEOj+rngdYEdbxaCYgbDJUgEm7lzi
         FgbrC8UmU4Qj/kL7rPvkAkr3EaJ+Cq2VZOXx7jAIuzRNlQPVIfc0ZuvAlWaWksF5NasE
         kvFGDPR8UYc8vfPGSOdC9YRPiTi5Jncb278YI4Qt7J4kZA5EUDTiSjZhgTmU/XeGygbh
         bOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742451675; x=1743056475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nNZxDTDESGfSLyL353XFE0BeY1oeJ3+DukZFk8chPQ=;
        b=P7YU2v7l/XWWLk3ME2PHi/l3mmCbgmKuT8n4nsaiIDiqfbyiXxkyBpSA68dcPVRoEC
         DkGy8bX6VoeHDIUks4nXjB6aU35c4gey93CCCprGJ6C7MBnABlGQGOzeHd/i+xh6jCxu
         n+EOIXGSL8Vq2+A1LLyj/AsOm0r+S+mpI7yEamEI3dO+1fr2yxhGuqaGTbv8Z/vpTeiC
         dVziA68m2N+sS55ZAbMhVBgh88HE+XO2cx4aMpNuIJdWQj7p/bzAlvNGK/50dTO0fspI
         qrP1v1LpMlCeazxV/JXa+BDYnGpUcfDsMSWOfhSp4AgzVtYMJiFzx0R35/zgOzXbec1b
         Q0qQ==
X-Gm-Message-State: AOJu0YzWzBTuAVzG+U8U90x477mJQaIuzXyoK7uV9MPUFLISVAwNEMJT
	KZTkmISXvPqSJD5Pib/emGWQ8z+qAYgXnXajUMuVzpfju2sqn3b2v7blQYdzf/APP2S452cYCSV
	jSx0=
X-Gm-Gg: ASbGncs9Ndc32GvbMQyJ+3uxIshoHrqC5w8ieD9uRoDjOLAYAYEx0DrZgi5vCjzjOVE
	vtSW6/hhsy9pCh11qDwCcgZ4VTNsHE7PAcBeYeE1QH1OSraVSWpboBXVKDmOeDcmr2P9jZGXPgJ
	FfyHi1lc9fPdc5Z3bdqk1GRUyG1FROCgo+Zr8+jGZCj6qp6GB9IhQeB9S+W28bTYU/+yFYfQOLW
	4VQSAw+Gry/lJfhiwqy3o60djTlJkDHcBIP8BkB22ac1R7OXCRjnG9QRBJOrq4DVS5k73L+ZvR6
	Gr9LR3TPJswrSJSiTq4C5f5BDVoSF1b+Y62gvXb/l+t7Kntho8WkcSr0mg==
X-Google-Smtp-Source: AGHT+IH/smRTpReLHOEHZvgsu+gEofJJqbRkx/KIaxyEPBUoQYUD7oEq36t/WdWPIWd243UYcObvgw==
X-Received: by 2002:a05:6a21:789c:b0:1f5:7280:1cf7 with SMTP id adf61e73a8af0-1fd11800f26mr3574987637.16.1742451675449;
        Wed, 19 Mar 2025 23:21:15 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167d764sm13298961b3a.98.2025.03.19.23.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 23:21:14 -0700 (PDT)
Message-ID: <552d5c6f-61ae-43e5-90e5-c94639b40b71@daynix.com>
Date: Thu, 20 Mar 2025 15:21:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] target/arm: convert 32 bit gdbstub to new helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-4-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250319182255.3096731-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EEO421Br+CYc

On 2025/03/20 3:22, Alex Bennée wrote:
> For some of the helpers we need a temporary variable to copy from
> although we could add some helpers to return pointers into env in
> those cases if we wanted to.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/gdbstub.c | 57 ++++++++++++++++++++++++++++----------------
>   1 file changed, 36 insertions(+), 21 deletions(-)
> 
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 30068c2262..14d931b0bf 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -20,7 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "cpu.h"
>   #include "exec/gdbstub.h"
> -#include "gdbstub/helpers.h"
> +#include "gdbstub/registers.h"
>   #include "gdbstub/commands.h"
>   #include "system/tcg.h"
>   #include "internals.h"
> @@ -33,12 +33,16 @@ typedef struct RegisterSysregFeatureParam {
>       int n;
>   } RegisterSysregFeatureParam;
>   
> -/* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
> -   whatever the target description contains.  Due to a historical mishap
> -   the FPA registers appear in between core integer regs and the CPSR.
> -   We hack round this by giving the FPA regs zero size when talking to a
> -   newer gdb.  */
> -
> +/*
> + * Old gdb always expect FPA registers. Newer (xml-aware) gdb only
> + * expect whatever the target description contains. Due to a
> + * historical mishap the FPA registers appear in between core integer
> + * regs and the CPSR. We hack round this by giving the FPA regs zero
> + * size when talking to a newer gdb.
> + *
> + * While gdb cares about the memory endianess of the target all
> + * registers are passed in little-endian mode.
> + */
>   int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> @@ -46,15 +50,17 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   
>       if (n < 16) {
>           /* Core integer register.  */
> -        return gdb_get_reg32(mem_buf, env->regs[n]);
> +        return gdb_get_register_value(MO_TEUL, mem_buf, (uint8_t *) &env->regs[n]);

Having a whitespace between the cast and the later expression is unusual 
though checkpatch.pl doesn't complain.

>       }
>       if (n == 25) {
>           /* CPSR, or XPSR for M-profile */
> +        uint32_t reg;
>           if (arm_feature(env, ARM_FEATURE_M)) {
> -            return gdb_get_reg32(mem_buf, xpsr_read(env));
> +            reg = xpsr_read(env);
>           } else {
> -            return gdb_get_reg32(mem_buf, cpsr_read(env));
> +            reg = cpsr_read(env);
>           }
> +        return gdb_get_register_value(MO_TEUL, mem_buf, (uint8_t *) &reg);
>       }
>       /* Unknown register.  */
>       return 0;
> @@ -115,19 +121,22 @@ static int vfp_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
>   
>       /* VFP data registers are always little-endian.  */
>       if (reg < nregs) {
> -        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));
> +        return gdb_get_register_value(MO_TEUQ, buf,
> +                                      (uint8_t *) aa32_vfp_dreg(env, reg));
>       }
>       if (arm_feature(env, ARM_FEATURE_NEON)) {
>           /* Aliases for Q regs.  */
>           nregs += 16;
>           if (reg < nregs) {
>               uint64_t *q = aa32_vfp_qreg(env, reg - 32);
> -            return gdb_get_reg128(buf, q[0], q[1]);
> +            return gdb_get_register_value(MO_TEUO, buf, (uint8_t *) q);
>           }
>       }
>       switch (reg - nregs) {
> +        uint32_t fpcr;
>       case 0:
> -        return gdb_get_reg32(buf, vfp_get_fpscr(env));
> +        fpcr = vfp_get_fpscr(env);
> +        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpcr);
>       }
>       return 0;
>   }
> @@ -166,9 +175,11 @@ static int vfp_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
>   
>       switch (reg) {
>       case 0:
> -        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
> +        return gdb_get_register_value(MO_TEUL, buf,
> +                                      (uint8_t *) &env->vfp.xregs[ARM_VFP_FPSID]);
>       case 1:
> -        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
> +        return gdb_get_register_value(MO_TEUL, buf,
> +                                      (uint8_t *) &env->vfp.xregs[ARM_VFP_FPEXC]);
>       }
>       return 0;
>   }
> @@ -196,7 +207,8 @@ static int mve_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
>   
>       switch (reg) {
>       case 0:
> -        return gdb_get_reg32(buf, env->v7m.vpr);
> +        return gdb_get_register_value(MO_TEUL, buf,
> +                                      (uint8_t *) &env->v7m.vpr);
>       default:
>           return 0;
>       }
> @@ -236,9 +248,11 @@ static int arm_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
>       ri = get_arm_cp_reginfo(cpu->cp_regs, key);
>       if (ri) {
>           if (cpreg_field_is_64bit(ri)) {
> -            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
> +            uint64_t cpreg = read_raw_cp_reg(env, ri);
> +            return gdb_get_register_value(MO_TEUQ, buf, (uint8_t *) &cpreg);
>           } else {
> -            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
> +            uint32_t cpreg = (uint32_t) read_raw_cp_reg(env, ri);
> +            return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &cpreg);
>           }
>       }
>       return 0;
> @@ -375,12 +389,12 @@ static uint32_t *m_sysreg_ptr(CPUARMState *env, MProfileSysreg reg, bool sec)
>   static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
>                           MProfileSysreg reg, bool secure)
>   {
> -    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
> +    uint8_t *ptr = (uint8_t *) m_sysreg_ptr(env, reg, secure);
>   
>       if (ptr == NULL) {
>           return 0;
>       }
> -    return gdb_get_reg32(buf, *ptr);
> +    return gdb_get_register_value(MO_TEUL, buf, ptr);
>   }
>   
>   static int arm_gdb_get_m_systemreg(CPUState *cs, GByteArray *buf, int reg)
> @@ -393,7 +407,8 @@ static int arm_gdb_get_m_systemreg(CPUState *cs, GByteArray *buf, int reg)
>        * banked and non-banked bits.
>        */
>       if (reg == M_SYSREG_CONTROL) {
> -        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
> +        uint32_t reg32 = arm_v7m_mrs_control(env, env->v7m.secure);
> +        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &reg32);
>       }
>       return m_sysreg_get(env, buf, reg, env->v7m.secure);
>   }
