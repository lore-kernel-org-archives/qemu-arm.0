Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp472200lfe;
        Mon, 16 Mar 2020 12:37:11 -0700 (PDT)
X-Received: by 2002:a62:778d:: with SMTP id s135mr1301827pfc.21.1584387431129;
        Mon, 16 Mar 2020 12:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584387431; cv=none;
        d=google.com; s=arc-20160816;
        b=rSClKX9gZTt19zJRViAulnmYuGqil4h7VLrJdD1HneBhtcOQsJG+Ic5QmJGtq40sbI
         ekZ7DUBNWzpKkf74BjkKJPhUGvi5FonNd9WhyQLIzhZZR0So7t1EK/M7Hm4La2ogxay4
         2PGXu+rhKo7j+P5qNQy9rW5HVEypqkXNYiuFiUypL33/Gc1OUiOMRR05gP2TEnfTFkpf
         xrM8VVJnZDY7vatj3eDNzh6Cm7Mq1wPYi85TlCkM5tk6k9LinC2e5nduA/cxvZhEhc/6
         sXhUxa1JwG6B/+mEYfXaW6rEnywVTOFsGqW53B8nCAHaTzvCb/wBWgMLO9WoVYO2lppD
         Wz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=L89ZWrRD+o41kxNk0fnpcdzdsDuN76+Y+I0X9Rp+gms=;
        b=IX2oNYS1uPOIiS3SHqNGepAEsed5vJEn7uzQSO+fNJsWnNw88nBri1xwA6obG7Bt0U
         MOMSbZZcR4Hg+QXAqCYSc6doCbFXOdAh/oyHk7ioy4nOl4z0WdTxo6w+Q7Qx9LcybAJJ
         lFUVd5ewkMXwUqTI+rHe93WceHamp5LzztayVlM78O5M/UIKhAXcJGFV0+x9jx7C+JvW
         K0eCRcJhwyg0yGn0grqCvx9gu6D/UvpPdBNTf/tQ1Vg6hdkeX60pz0BwAHI/iEAjk5mf
         9gE9TT1z2nF63x+vd4MmcR4cpih/SH08UIKKIrXDtIDuxjWU53o/vOkjJTQ+jrSzVTYx
         CFIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JOykOFt2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i23sor1173742pfo.5.2020.03.16.12.37.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JOykOFt2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L89ZWrRD+o41kxNk0fnpcdzdsDuN76+Y+I0X9Rp+gms=;
        b=JOykOFt2/Pic/Ya/IJ1Yuxkfir9truF3YSQWCcT0DMz/IOBBBgUasm4tSdf1lbYH+C
         KQFeRRmYukwQXIfxV7PiTbjLDRkheJGHGkIcbWD8ukyAGXKnbe7CmubS9P0iR96MXISV
         QPcDoCC3TJnR7ADHr0FEeX9DuMN4Jpww5d8KoHi8f7iEMCzGYL/zGtMYSWxxXnwWW545
         t4t9ttJSJzT78RaBCd6izDyZnmN8Va//drpARvGb3gsINYt2DZjytGl3i0EjGhogROOl
         nECne9eMCiClmtmHmwomneU1aXuC9lfHDIEMrYLeb6r6lJHz+KR5IlDrMQrtGUlkCovL
         JCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L89ZWrRD+o41kxNk0fnpcdzdsDuN76+Y+I0X9Rp+gms=;
        b=FVFdwrIQmS6z1MczYt4wj6512Pxlbzr/J4CL0RSeJNAfN/09TPB3F3aF4gyQr0CspN
         ajuDraasDDwe/ACfYlYa+v/Ic0isiIetnOU3ZwFEJ0SnpJxTf68Nmn9peeY15mnGvco0
         zCQnQdopgGScHpld5K212V3tDfXcWpJaoiiRQYdAQ94oF65i0gGzperQ9N1BMyBJTkPK
         ZEXxXcXwYJ3D0CVgHGgDqsOLawmS/CgpsZ8nZdyCIFZxSXNfeyp6pPNtkTPlg/fd1z/i
         cqzOni3rHKGWb/nG74tcuv1Fbta+QZqiDLG6QDLNHZpDwmqax0af0XxWB2EUj1+IEUfZ
         7O9g==
X-Gm-Message-State: ANhLgQ3YSFSbgXFPEpU3AD04IMqJpYA58P5FlGX52C2VT+EujVy5/qYR
	CtmNCVut0ZzWcQpgKekPYostlssW
X-Google-Smtp-Source: ADFU+vvhNufPP7bu7Lbr300PVxk4IJgWKvd7lJvPzyrN4DkPlsGgJZsWycA0QGAqYFPlScuXekBqTA==
X-Received: by 2002:aa7:8711:: with SMTP id b17mr1118088pfo.315.1584387430595;
        Mon, 16 Mar 2020 12:37:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g13sm673135pfi.183.2020.03.16.12.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:37:09 -0700 (PDT)
Subject: Re: [PATCH v3 04/19] target/arm: Restric the Address Translate
 operations to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c257230b-277c-d568-756b-39acb93ac308@linaro.org>
Date: Mon, 16 Mar 2020 12:37:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: UI4H6EvSkzGS

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> Under KVM the ATS instruction will trap.

Not trap, they'll just work.
Otherwise similar comment as for dcpop.


r~

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/helper.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 924deffd65..a5280c091b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3322,7 +3322,7 @@ static void par_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>      }
>  }
>  
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>  /* get_phys_addr() isn't present for user-mode-only targets */
>  
>  static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -3631,7 +3631,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>  
>      env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx);
>  }
> -#endif
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>  
>  static const ARMCPRegInfo vapa_cp_reginfo[] = {
>      { .name = "PAR", .cp = 15, .crn = 7, .crm = 4, .opc1 = 0, .opc2 = 0,
> @@ -3639,7 +3639,7 @@ static const ARMCPRegInfo vapa_cp_reginfo[] = {
>        .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
>                               offsetoflow32(CPUARMState, cp15.par_ns) },
>        .writefn = par_write },
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      /* This underdecoding is safe because the reginfo is NO_RAW. */
>      { .name = "ATS", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = CP_ANY,
>        .access = PL1_W, .accessfn = ats_access,
> @@ -4880,7 +4880,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 6,
>        .access = PL2_W, .type = ARM_CP_NO_RAW,
>        .writefn = tlbi_aa64_alle1is_write },
> -#ifndef CONFIG_USER_ONLY
> +
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      /* 64 bit address translation operations */
>      { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
>        .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 0,
> @@ -4929,7 +4930,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .access = PL1_RW, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.par_el[1]),
>        .writefn = par_write },
> -#endif
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
> +
>      /* TLB invalidate last level of translation table walk */
>      { .name = "TLBIMVALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
>        .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
> @@ -5536,7 +5538,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
>        .access = PL2_W, .type = ARM_CP_NO_RAW,
>        .writefn = tlbi_aa64_vae2is_write },
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      /* Unlike the other EL2-related AT operations, these must
>       * UNDEF from EL3 if EL2 is not implemented, which is why we
>       * define them here rather than with the rest of the AT ops.
> @@ -6992,7 +6994,7 @@ static const ARMCPRegInfo vhe_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>  
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>  static const ARMCPRegInfo ats1e1_reginfo[] = {
>      { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
>        .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
> @@ -7894,14 +7896,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      if (cpu_isar_feature(aa64_pan, cpu)) {
>          define_one_arm_cp_reg(cpu, &pan_reginfo);
>      }
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      if (cpu_isar_feature(aa64_ats1e1, cpu)) {
>          define_arm_cp_regs(cpu, ats1e1_reginfo);
>      }
>      if (cpu_isar_feature(aa32_ats1e1, cpu)) {
>          define_arm_cp_regs(cpu, ats1cp_reginfo);
>      }
> -#endif
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>      if (cpu_isar_feature(aa64_uao, cpu)) {
>          define_one_arm_cp_reg(cpu, &uao_reginfo);
>      }
> 
