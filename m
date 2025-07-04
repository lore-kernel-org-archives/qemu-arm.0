Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1465927dyc;
        Fri, 4 Jul 2025 14:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHZVW/ozAIDoKdMaOtF1qy1Y4IdEWlxLJ+6sAbeUhqoq/CEqYi90yMe4mAIdxhzmEf3RbTTxNG9W2Wig==@linaro.org
X-Received: by 2002:a05:6808:211a:b0:3fe:af0b:22f7 with SMTP id 5614622812f47-40d07375143mr2623182b6e.11.1751666368027;
        Fri, 04 Jul 2025 14:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751666368; cv=none;
        d=google.com; s=arc-20240605;
        b=Q02DUuUiWLRQSAaEZEopysqWkcjbYJcVRpqOBFFx4lNEuzH0IsB582RYuXjqPhqk/S
         OYBv6Z/fRjw++v4VN4yFsjueuNSB9HJzIzqLfrGkRigKw3rLtZmpRKhYWRWsSFD29lR+
         JhbIcsCLNT2HJkMxw/pnfiukWrpVkpi6nM77SGdT20WZIu7ucGwMOedypkanpgY6jHfq
         MLSfC/bC2HV30n6bqk2WT9nqoAimPZpCvG9IAd/vK0SIR7rl8k2zjb9qfvIm4Z2vrr3s
         qi2EM/WDaNNV2MvNBwK0kGbVguiidLdSH/XM67Y+q18r8dMknMQvXMHJLJ8wcBVGTBXa
         o1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ev7KsC0b9BR/+p9nRfGPqAOeby21hJM34Dq1OG5FbAQ=;
        fh=QiyYs/Wnho7sZUIUOf/CNz7IbBxtDElefjuuWPDCNRQ=;
        b=C3leI5clWU7Gx8R4QREDZ1ctY4Vp0FLZ2heO8CMLLthmumu3zaF+OGtZWVDZbsSuI7
         4M5smN+CO0M2hv1KJ4btwNwGvMZkh0uOxiw3pQTeSfDijOe6b/+QOYMt5oybLqqBPYi9
         +JWOXeSY86ITKPuZdUe59S6Kl54/hkRomN4nVin60Xwa86Wsm64hwayHnC27x0Ha+AUt
         5VlR6RfnGj8FHvzkZ0Dh+2FWJ5c0dXSQLWPKnyileaF3Ni7i0fDST4wkrpzEsGjJuvH/
         tUL17O4AEKRg4g/pZFgUMjvYnW0ViWJY7N7w1ComrWiTEBN6H4zpPv8oTZl9bgxhPNUS
         1M3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zafyPzni;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-40d02ab2d16sor491736b6e.10.2025.07.04.14.59.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 14:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zafyPzni;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751666367; x=1752271167; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ev7KsC0b9BR/+p9nRfGPqAOeby21hJM34Dq1OG5FbAQ=;
        b=zafyPznicRCv07lOIUPzd3+iGj8ygIiIA7aCciIKx+pDlmN7Lq335ZFGMvMx4dzjE8
         Mali0xXiX/gtWz2u/B4zKR7MHuqAa7x1HUAf1xiKYa1sHi9tLF5W7AoR6GItbQNf8/AE
         F2DEtFigByNImmjCldlSF6rfIAtUHJlO0vJ4Ah5/gWv7BIxeUpteGgMyGOsXjw9pYOkr
         WKDuRlPMWVqHt+SiQ8Tio44GEFH/g5UL3q4Yxh8ybch3xnS6aG8CUCK+Rf/LvAhDPQku
         eEyEFyC/nIyusYni4XiJ+rJgspeXA7oV5wDtC5aJ3mti5VK/7rHIlXtZ6ws9zuqUuaTz
         4ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751666367; x=1752271167;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ev7KsC0b9BR/+p9nRfGPqAOeby21hJM34Dq1OG5FbAQ=;
        b=PN4XXDscHJ8ci9TI/3MnOpo8vWVJdvIv9YlenOo12hyvCUeq7rVSNeHR/CiVICgBtL
         4sY8aXaXOe3NIbcsZ1lU/q6oFyKJOXyB+Ss2lkTgbIbiZtpbKEz4jmx/A2/GwC1wFgl+
         A7XyPni406GVwRSPdTxnDVG590MvAqmvqw3zEd1N5lRwrNrxwWGUoXLQrlipZMcpzAT2
         cpoWZnoUtGH7GBrwiOhw7bErhRbkE+wHHlr+aaxx6rZ99QCBbgfnOzt6Oj5Qfk/3clfK
         64xOA8KB3iqz8Kz/O5uzaeg/temaxC3d/ubWf6uLEnSyI+f7vWnnu6F9W1FS9nFJoyYM
         2C1g==
X-Forwarded-Encrypted: i=1; AJvYcCXUvlW3Sz4GWeDPR6DdYJy8HdeDhHUkO6HyRGQ36u2cYNno1+U4jPysyPbz1P1LsEaSwhwZRTBGEhQ3Sw==@linaro.org
X-Gm-Message-State: AOJu0YxRWctvqg2/6dWLosmQ4RGUcj/JLrErNSbKs34YlsyYHLCF7II+
	Pw+fWoUxKBcBVTk8Iz0jyYy4f55YlNjWegmfut3GHFZHbBVJxcnLImswPpnmFil3Uco6Bg==
X-Gm-Gg: ASbGncsz3GwUuQ9CtMYUiwFFITu6DBWwOoWSuYdq9T+rZtG7bxegSNNRNz2cNvUwSuW
	/Xyg1OL4CENP0C2StvNzbokqodhvWdAu0HQyeD/qmuMf82z+iXekBPGP7Eq+Esf4Rv464zaIj0f
	nyxvaM+bHx1cXWAdPwScigRjmbyYvrQuvk835rzgEoqm6m5kQ0Gx61z8bkYWD/2xG2U5t3wngwR
	cgwUo2KDEgLmarTS2npef5bBVeJwtm4P3Q09DWoQdrZNhBk1iWSoNhlnkYCP18LKXqA3IbpLN60
	aj6VygG3gtISq0Si0Rh/rTbYj/ZyhFW63sb1yGqAQ0zhspwl/xTzOcI0IxW9h5uXyJ7cOWTafy5
	n1N9iYf+HFRPjwy+tCx7+QtO20U1VZm1h99ewWjDz/PMOpQUBqaw=
X-Google-Smtp-Source: AGHT+IEsrDtFGguJ116PDfJMP2MxORvHetPFKsc4Ot8546vGb6vyVsLQS+OAP5EogM/1YV4/208bvA==
X-Received: by 2002:a05:6808:2191:b0:40c:fcb9:90b9 with SMTP id 5614622812f47-40d0737f61bmr2536416b6e.16.1751666367379;
        Fri, 04 Jul 2025 14:59:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40d02adbd55sm432967b6e.40.2025.07.04.14.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 14:59:26 -0700 (PDT)
Message-ID: <bffb3cf0-25ce-41fe-bca9-5ce387f7f02e@linaro.org>
Date: Fri, 4 Jul 2025 15:59:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [WIP-for-10.1 v2 3/5] target/arm: Add FEAT_SCTLR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
 <20250704151431.1033520-4-gustavo.romero@linaro.org>
Content-Language: en-US
In-Reply-To: <20250704151431.1033520-4-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: JInHH83Ue2nD

On 7/4/25 09:14, Gustavo Romero wrote:
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 4452e7c21e..a42d1133c2 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -296,6 +296,11 @@ static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
>       return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) >= 2;
>   }
>   
> +static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_mmfr3, ID_AA64MMFR3, SCTLRX) == 1;
> +}

!= 0.  Value 2 will mean "value 1, plus ..."

This also needs updating for the IDREG reorg that landed this week.

> @@ -1692,6 +1706,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>   #define SCR_HXEN              (1ULL << 38)
>   #define SCR_TRNDR             (1ULL << 40)
>   #define SCR_ENTP2             (1ULL << 41)
> +#define SCR_SCTLR2EN          (1ULL << 42)

44.  Bit 42 is RCWMASKEn.

> +static CPAccessResult sctlr2_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                    bool isread)
> +{
> +    int el = arm_current_el(env);
> +
> +    if (!cpu_isar_feature(aa64_sctlr2, env_archcpu(env))) {
> +        return CP_ACCESS_UNDEFINED;
> +    }

Not needed, because the cpregs will not be registered otherwise.

> +    if ((el < 3)  && !(env->cp15.scr_el3 & SCR_SCTLR2EN)) {

Remove extra () and extra space.

For SCTLR2_EL1, this is missing the TVM/TRVM check (use access_tvm_trvm first), and the 
HCRX_EL2.SCTLR2En check.

> +static void sctlr2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    int el = arm_current_el(env);
> +    uint64_t valid_mask = 0ULL;

ULL is unnecessary.

> +
> +    if (el > 1 && cpu_isar_feature(aa64_mec, env_archcpu(env))) {
> +        /* SCTLR2_EL1 does not implement the EMEC bit */

Incorrect test for SCTLR2_EL1: EL is the current cpu state, nothing to do with the 
register.  You might notice that all three registers have different sets of supported 
bits.  If you want to properly validate, you might as well you three different functions.

> +static const ARMCPRegInfo sctlr2_reginfo[] = {
> +    { .name = "SCTLR2_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .opc2 = 3, .crn = 1, .crm = 0,
> +      .access = PL1_RW, .accessfn = sctlr2_access,
> +      .writefn = sctlr2_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[1]) },

Missing .fgt = FGT_SCTLR_EL1, .nv2_redirect_offset.

> +    { .name = "SCTLR2_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .opc2 = 3, .crn = 1, .crm = 0,
> +      .access = PL2_RW, .accessfn = sctlr2_access,
> +      .writefn = sctlr2_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[2]) },
> +    { .name = "SCTLR2_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .opc2 = 3, .crn = 1, .crm = 0,
> +      .access = PL3_RW, .accessfn = sctlr2_access,

No accessfn.


r~
