Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp762183njc;
        Thu, 20 Mar 2025 00:39:25 -0700 (PDT)
X-Received: by 2002:a05:600c:468f:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43d436c753fmr52806475e9.0.1742456364798;
        Thu, 20 Mar 2025 00:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742456364; cv=none;
        d=google.com; s=arc-20240605;
        b=AFgirswSSzGmspFwnDf1RAYRgcXuEQJvvIw4M5p9AfZUqC/Ej752bspdA/ogcCzn+Z
         0M6XlpRbSpNyIfB9SJ+eYmBmCT7nJWG3QAblv94YYqNNM9Bo+gUNuZvD44rcYLhxv1it
         nGH4YH6bz5fA1SY+YOy5GaNRpyvlJtfgTEne7QgK/qSbhe0BPpraCX+K9A7mMbQIOUv6
         v5/2eck+1oXSyfrQug+BM3n3/XPh4wHRBL3QjxgkxVmtnvybE5WEA8srr8eIINnZFQx9
         a3+wK3GUVEGuzDGssCUIh60ePwrxiGqNzPC2VrT1W+2sYRS8Bx2UCbnMAtSYety6GxzR
         ozrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nf4r+1HHRl9mM0NAlDwdoIGe7010ICXlf3pq30lWtuw=;
        fh=VTjyscoH3jg4EEBGXGBCijT0Cth03TkL5RpTsM1FyIc=;
        b=eNrLpoqSFTKzPsGUPyXa/s2ZiQBdFtdupZNehCPnCcEz3kiIfKv5oU/EZ0stQbPZse
         IRLmOpSrqIOz8pCc22642ceHrOiAiwkDVPJuV01VGHyz6JOyq2lmMR96bSwZdm3VvPu1
         TQHjo0d0GA0ezw/m135Q5bJCwsEPO5VEDU+lxpaxt+4BeQhAqTMJu+Tp9Tm3ia9veswC
         yIV1/+CXLY4AptSY1Y07kj86m345YIRG3gTb1vMeJJJbkgLxheEdLuUK27lAZT6SO8JE
         jczGL9DSWN7oS8iWcim2y4A3GJv1jw6CVaAydKBlyCY8ZCxrO+i9uTznM+5TUSBx4MFv
         tWZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OsV7DDE6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d422f6231sor10552785e9.5.2025.03.20.00.39.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 00:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OsV7DDE6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742456364; x=1743061164; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nf4r+1HHRl9mM0NAlDwdoIGe7010ICXlf3pq30lWtuw=;
        b=OsV7DDE6EZBSTbyAkRCSpM5vAExH7VfYVuVtLK2q93RWsdT20BHP+Dl5YQgN/x2fiw
         4F4uUpUqrHG18a3xrAEchBXoYnt646TDacR+ibF3Xi3liNlK3AIxB3jLIc1NzovyjOpS
         sYhqeiQwmd7HEE1z07PTMYjyjrhsrcyDq1X5scBEotfDdLtPPEMIz4HhksF76MigIZl9
         B2fx3606DbZ8O53Izp+fD1rLSYlGgE/YDxKaHq0ASbV/J18+YBbzDYBCZpnQ7vmexflk
         S0PG4PcFne31zPdFU9ZhxW/f/sxyVveGOb8hZWWYvdyIe6BbVW8GIzk/SExVVrS5QmuI
         BIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456364; x=1743061164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf4r+1HHRl9mM0NAlDwdoIGe7010ICXlf3pq30lWtuw=;
        b=NCal3f6iPd5K9tNN8XcAzB4DNKsLbc5PRCE9Bw7Ozst6WQQR/FK4uA3JxA6p9KpEf6
         i50UIkjbj3Hz3Z7GgsQ7pK3d/PxIHRRePYvvtQVENfI3LgWtQ2mx2qZeKMFTr9glkZ24
         1DlOuj0teW7vLo+0y3k+1JleVEKne1mKAaGFTikutScl0tc/dLD1ZppMA/wgSfvrUY5U
         Z09LRaNc9/i8rnwJbqXAh9BRgHTbp4l8u7W1KDwMfd6PFeNj+A3MQG2gbGAgmwbemPf2
         9KXiUTEiS+kFPCLdB8mOPKiSf6eVKXxrD1q9D3t0ul1qzSCwNc35JCS1y/qNKbizIqU2
         mKpg==
X-Gm-Message-State: AOJu0YyuF3fvsFgOeXqycCGZODZwaDBuom99ankTvSTrM02W7DrpbCHg
	5Y/44LQ0keARLW6qn82FknsZDY0U1zcgJq/vxL9Z6/XST551cW5lb89NA1mRp0fYVZ9Jrv71AjB
	OWLA=
X-Gm-Gg: ASbGncsSvA15t+fdLNugdNXe5wKSXnDXyZCx0PHaCib+UxUyucm7OyWpdHAsW2Si/xt
	6azbAqKs2r2efokuJ//sxNKyElDOIJWtJNXk+TRNlNK3vORGcbcpV1lb0iXgKRsNkJCVI0qiuAN
	8zFpOhLdJKDXIKY4LsbEYqoMwNle80wagXHJ1LR06TB2rm8S6I+gKr5uWYCuAUVOhpQNblYTlFJ
	qrgtlh0zqgc5LHQYFQ3PK8H1I1hW3yARNYHMfNO/52jUMhijdYchQ4W13/r0W2K/gxVBJNkBwHt
	GdPgXkRFSkWvxqQyxCBsaNk9PqSr74Jm2U38UhwK5wmvOmNpmBi0Axn1ogVpVHC3sZFA+vE9b9y
	OKRwLpZ16rPz6
X-Google-Smtp-Source: AGHT+IF5iFIAmvd5x5g0gVj4Ts/bGYTDsScqRgAbWZ9okMeojOdqKjdJg2n01Qc9M0o0MGM7gNRTVw==
X-Received: by 2002:a05:600c:468f:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43d436c753fmr52805815e9.0.1742456363779;
        Thu, 20 Mar 2025 00:39:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6b37sm23258321f8f.37.2025.03.20.00.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:39:23 -0700 (PDT)
Message-ID: <91758d60-7fdf-4df8-9513-b3c0ca1ecc4c@linaro.org>
Date: Thu, 20 Mar 2025 08:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/arm: convert 64 bit gdbstub to new helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-5-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250319182255.3096731-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SNYEkSi7pAov

On 19/3/25 19:22, Alex Bennée wrote:
> For some of the helpers we need a temporary variable to copy from
> although we could add some helpers to return pointers into env in
> those cases if we wanted to.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/gdbstub64.c | 53 ++++++++++++++++++++++++++----------------
>   1 file changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 1a4dbec567..793332af31 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -20,7 +20,7 @@
>   #include "qemu/log.h"
>   #include "cpu.h"
>   #include "internals.h"
> -#include "gdbstub/helpers.h"
> +#include "gdbstub/registers.h"
>   #include "gdbstub/commands.h"
>   #include "tcg/mte_helper.h"
>   #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
> @@ -35,15 +35,16 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   
>       if (n < 31) {
>           /* Core integer register.  */
> -        return gdb_get_reg64(mem_buf, env->xregs[n]);
> +        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &env->xregs[n]);

s/MO_TEUO/MO_TEUQ/

But I think we should get MO_TE from CPUState in prologue.

   MemOp mop = MO_TE; /* FIXME get from CPUState */

   ...
   return gdb_get_register_value(mop | MO_64, mem_buf, &env->xregs[n]);

>       }
>       switch (n) {
>       case 31:
> -        return gdb_get_reg64(mem_buf, env->xregs[31]);
> +        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &env->xregs[31]);

s/MO_TEUO/MO_TEUQ/

But harder to get it wrong using the MO_$bit equivalent:

   return gdb_get_register_value(mop | MO_64, mem_buf, &env->xregs[31]);

>       case 32:
> -        return gdb_get_reg64(mem_buf, env->pc);
> +        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &env->pc);

s/MO_TEUO/MO_TEUQ/

>       case 33:
> -        return gdb_get_reg32(mem_buf, pstate_read(env));
> +        uint32_t pstate = pstate_read(env);
> +        return gdb_get_register_value(MO_TEUL, mem_buf, (uint8_t *) &pstate);
>       }
>       /* Unknown register.  */
>       return 0;
> @@ -82,23 +83,27 @@ int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> +    uint32_t fpr;
>   
>       switch (reg) {
>       case 0 ... 31:
>       {
>           /* 128 bit FP register - quads are in LE order */
>           uint64_t *q = aa64_vfp_qreg(env, reg);
> -        return gdb_get_reg128(buf, q[1], q[0]);
> +        return gdb_get_register_value(MO_TEUO, buf, (uint8_t *) q);
>       }
>       case 32:
>           /* FPSR */
> -        return gdb_get_reg32(buf, vfp_get_fpsr(env));
> +        fpr = vfp_get_fpsr(env);
> +        break;
>       case 33:
>           /* FPCR */
> -        return gdb_get_reg32(buf, vfp_get_fpcr(env));
> +        fpr = vfp_get_fpcr(env);
> +        break;
>       default:
>           return 0;
>       }
> +    return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpr);
>   }
>   
>   int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
> @@ -132,30 +137,37 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> +    uint32_t fpr;
>   
>       switch (reg) {
>       /* The first 32 registers are the zregs */
>       case 0 ... 31:
>       {
>           int vq, len = 0;
> +        ARMVectorReg *zreg = &env->vfp.zregs[reg];
> +
>           for (vq = 0; vq < cpu->sve_max_vq; vq++) {
> -            len += gdb_get_reg128(buf,
> -                                  env->vfp.zregs[reg].d[vq * 2 + 1],
> -                                  env->vfp.zregs[reg].d[vq * 2]);
> +            len += gdb_get_register_value(MO_TEUQ, buf,
> +                                          (uint8_t *) &zreg->d[vq * 2 + 1]);

s/MO_TEUQ/MO_TEUO/ ?

> +            len += gdb_get_register_value(MO_TEUQ, buf,
> +                                          (uint8_t *) &zreg->d[vq * 2]);

s/MO_TEUQ/MO_TEUO/ ?

>           }
>           return len;
>       }
>       case 32:
> -        return gdb_get_reg32(buf, vfp_get_fpsr(env));
> +        fpr = vfp_get_fpsr(env);
> +        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpr);
>       case 33:
> -        return gdb_get_reg32(buf, vfp_get_fpcr(env));
> +        fpr = vfp_get_fpcr(env);
> +        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpr);
>       /* then 16 predicates and the ffr */
>       case 34 ... 50:
>       {
>           int preg = reg - 34;
>           int vq, len = 0;
>           for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
> -            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
> +            len += gdb_get_register_value(MO_TEUQ, buf,
> +                                          (uint8_t *) &env->vfp.pregs[preg].p[vq / 4]);
>           }
>           return len;
>       }
> @@ -165,8 +177,8 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
>            * We report in Vector Granules (VG) which is 64bit in a Z reg
>            * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
>            */
> -        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
> -        return gdb_get_reg64(buf, vq * 2);
> +        uint64_t vq = (sve_vqm1_for_el(env, arm_current_el(env)) + 1) * 2;
> +        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &vq);

s/MO_TEUL/MO_TEUQ/

>       }
>       default:
>           /* gdbstub asked for something out our range */
> @@ -248,10 +260,11 @@ int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
>               bool is_data = !(reg & 1);
>               bool is_high = reg & 2;
>               ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
> -            ARMVAParameters param;
> +            ARMVAParameters param = aa64_va_parameters(env, -is_high, mmu_idx,
> +                                                       is_data, false);
> +            uint64_t pauth_mask = pauth_ptr_mask(param);
>   
> -            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data, false);
> -            return gdb_get_reg64(buf, pauth_ptr_mask(param));
> +            return gdb_get_register_value(MO_TEUQ, buf, (uint8_t *) &pauth_mask);
>           }
>       default:
>           return 0;
> @@ -399,7 +412,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
>   
>       tcf0 = extract64(env->cp15.sctlr_el[1], 38, 2);
>   
> -    return gdb_get_reg64(buf, tcf0);
> +    return gdb_get_register_value(MO_TEUQ, buf, (uint8_t *) &tcf0);
>   }
>   
>   int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
