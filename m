Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1448884dyc;
        Fri, 4 Jul 2025 14:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx1hZ3tBErQXCds/krwKUbTMdIl9I1aLrsMMJZJpPb+crMTc78hX6unu1f7n26SvUdBNccdu3b09iKkw==@linaro.org
X-Received: by 2002:a05:6871:1c6:b0:2df:b3b9:5dfe with SMTP id 586e51a60fabf-2f796cd66dfmr2832114fac.29.1751663125016;
        Fri, 04 Jul 2025 14:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751663125; cv=none;
        d=google.com; s=arc-20240605;
        b=C/k+jUJny4yr/aYYx986TTdtkYiRN5CPA6EQBqxFfKI5/vsctFBVFzfHYf8MKGwxhx
         3j2W2Ss7k8DMI8naWPehNtlEheUrsEvZp1thC2e6OdOKCsRAAXtMQls2h7Kf8TwYdx0J
         ypXegtMquZEQV6PlUudXVDn/LIuD80esg/4eCO3sz6XANSblw4bQTrc8QXD+O8sFagQO
         63wO1c99UgvDiVMIa2v46a2EbkVLkPSxylTJmPTy5kvmsGQtJiVTEhJwecPJrDOfn5yQ
         VFCmPiSriO9S2+SxWxJiYLj20mtnDuBo0s/JtsgQCk02qn/wPz2iyZhWOmO44ylKORpC
         VLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HnmF+GWdMytPfWe99miS4RSdRwwQ9DvX3uQuYYnubNg=;
        fh=1vbbH1tZkagBcVIE7i8A2yHze6XwCW3UCumahTWOhTw=;
        b=MivjzN3SBRl7KNf7Ce7iwkltOwYtwQVT0Vj8lTQMfjChehK7tytvAt+Jyf82GLT4M4
         /05BXLfenrYKKU0DvPFd17ub/41ycXAekRRElZvgwqFz2R0cZ8JQ3JtR5QFSNwDZOepn
         CVOwh1YSI4kEykRUgE0e/oS6TMFDyu40mx3ei7FSvBADVrwGsvylx5HYiK8XTr5PgurV
         tVM3liinv+ghTzDcvsrLmBuprQFmSfupazZD3EZ687tixaXNc1MbEgPsrYAYS+yZHMV+
         1TB+k2xNe0cUE52pxDCJDVBd2ddIbcrjc88UTWowxwmK3pXXlEi/xDNoNU2+7IRWSG3v
         Fo8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iVT3qnE3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2f790111422sor931957fac.16.2025.07.04.14.05.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 14:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iVT3qnE3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751663124; x=1752267924; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnmF+GWdMytPfWe99miS4RSdRwwQ9DvX3uQuYYnubNg=;
        b=iVT3qnE33xHvr2RH/jF9lwikehPLyXaxwq3UInCnUcynqjKvP3o6MkST09aomKjGA/
         T+vA4ofXXdgslETsLO91mbNzbS6BbvbI0gcAWHTq6JZLZ5gZKeoWUn6rjONk3ZyGs9E3
         6dOB1AeAiIa6L6GVwIFWK7sR+zxWvzCfPFFFskYCdD4CZtm8zGeOnv30k45mKu2PzQnT
         umWjl0Eu5XRMAwAq7di15lRZbdsX/hYp9OYg0xn+jB9zd9mjOdD1Pt5ILUS2ckvhRMmv
         U1pjLPQBY3BdujLtrS9ZRchVckdbhok2oFRuQji56TTD9uEN4IN+vd1W4RuHrkCOy4PB
         FPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751663124; x=1752267924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnmF+GWdMytPfWe99miS4RSdRwwQ9DvX3uQuYYnubNg=;
        b=iH+Zx8W6WFkjh1Wcpk9BgaWxUvsExzTadbK57trZpD63cG7k2nal3U7tSXN5GvGdpb
         bjsmeEQdv6YmaZhVjrd9YgsI2V1i5I8EeneNAaseE9wmzEJqXm5fikhpVgBjZUsT5ft3
         5bd3aRX9rgU8Ikav0ZSBOmzgBS1ng9nOh6VxlIA+kojSwW3GeCHBG9EKpD69iTzsFNn/
         WOff9Xijyc2Zwt1nzHEYQhj1Jnz7qqh+kDyXxOFblDtNyM8WHjX9PjTqZ0UP1+5CODCo
         9aK8R0HxocAmiQo/Ba4Nyqx3rpjW8lJq7/MEuAWROaMadcVTmxd1LAH+ggT4Sww89wml
         p3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU4BjumuqGpoTL0qWN9dkirf7+7k4IFCoJVY+SNFbs9QNaDMM2ci2zfXKBDU1bL/jCx2uKQqVJrwQdg0A==@linaro.org
X-Gm-Message-State: AOJu0YyIPjl3YUs2N7CcW3HKUmVQpV6XboJNJJ7ev2UuSXjt0ouUMPid
	+ALxNJfhO7IawhcAiJayfa8hRh9VjAAGuyXQ0buynb99l7A//ig4LzUvQCeWqp5qkNsngA==
X-Gm-Gg: ASbGnctxhlYc6+Gq2sTcCdMQRurvdS49v1N15yhh4ip2aiLS16E7iC12hTVVp+qFeUM
	YiqxXmKSFkept5rKptt9RhHbqYclMBe+oDj+b+zS5KcHUpfeu/o4C1ezaH5WzV8sfEIIq6mk3VH
	e8Z77isCqhmTy4dF1K1q7QTer+gw0bFU2mW4+TGTmWzUy1HXirCb/oeMBDydb7EXNwV++EV3PaS
	4Wi1Gx7jg2M1aau4HWWQ9lHpKUB1G0/rLWPBywOpv9sgYuhGdJSZ6m8/UrnKTCupRSG7iiuSrro
	LXSEramfH2bvXi4b3hfqDlIoPF//pVh7GQaFIA/tesUxIqx5KXHW+X7DCehL2NvH59RiQd6wHTt
	6arz4pSitV4SHjQ+0SKTtE9DHYCiTsmowbIdWXXmY
X-Google-Smtp-Source: AGHT+IEzkwZCCR6fG/k4l6BZPscawmW/So7U0vch0ENSLTMH8G/T/YOWK/bNoY0+6nNYtxiCbKzAqg==
X-Received: by 2002:a05:6870:c195:b0:2d5:714b:f661 with SMTP id 586e51a60fabf-2f796a57083mr2732657fac.12.1751663124384;
        Fri, 04 Jul 2025 14:05:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f790276f63sm705485fac.44.2025.07.04.14.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 14:05:24 -0700 (PDT)
Message-ID: <f18ad948-3d14-446f-8d37-041b4f9ffa8c@linaro.org>
Date: Fri, 4 Jul 2025 15:05:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WIP-for-10.1 v2 2/5] target/arm: Add FEAT_MEC registers
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
 <20250704151431.1033520-3-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250704151431.1033520-3-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DDdu5d6AhVey

On 7/4/25 09:14, Gustavo Romero wrote:
> +        /* MEC registers */
> +        uint64_t mecidr_el2;

Don't need this one.

> +        uint64_t mecid_p0_el2;
> +        uint64_t mecid_a0_el2;
> +        uint64_t mecid_p1_el2;
> +        uint64_t mecid_a1_el2;
> +        uint64_t mecid_rl_a_el3;
> +        uint64_t vmecid_p_el2;
> +        uint64_t vmecid_a_el2;
>       } cp15;
>   
>       struct {
> @@ -2389,6 +2399,10 @@ FIELD(MFAR, FPA, 12, 40)
>   FIELD(MFAR, NSE, 62, 1)
>   FIELD(MFAR, NS, 63, 1)
>   
> +FIELD(MECIDR, MECIDW, 0, 4)
> +FIELD(MECID, MECID, 0, 16)
> +FIELD(VMECID, MECID, 0, 16)

You don't really need these.

> +
>   QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
>   
>   /* If adding a feature bit which corresponds to a Linux ELF
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 889d308807..9f8a284261 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6823,6 +6823,100 @@ static const ARMCPRegInfo nmi_reginfo[] = {
>         .resetfn = arm_cp_reset_ignore },
>   };
>   
> +static void mecidr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /* MECIDWidthm1 = 15, i.e. 16 bits is the width of a MECID. */
> +    env->cp15.mecidr_el2 = FIELD_DP64(0, MECIDR, MECIDW, 15);
> +}
> +
> +static uint64_t mecidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    uint64_t valid_mask;
> +
> +    if (!arm_is_el2_enabled(env)) {
> +        /* All bits are RES0. */
> +        return 0ULL;
> +    }
> +
> +    valid_mask = R_MECIDR_MECIDW_MASK;
> +    return env->cp15.mecidr_el2 & valid_mask;
> +}

How do you get the arm_is_el2_enabled check?

MECIDR_EL2 is a read-only register with one field: MECIDWidthm1, containing a constant 
value.  I would expect to see

     { .name = "MECIDR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .opc2 = 7, .crn = 10, .crm = 8,
       .access = PL2_R, .type = ARM_CP_CONST, .reset = MECID_WIDTH - 1 },



> +
> +static CPAccessResult mecid_access(CPUARMState *env,
> +                                   const ARMCPRegInfo *ri, bool isread)
> +{
> +    int el;
> +
> +    el = arm_current_el(env);
> +    if (el == 2 && !(env->cp15.scr_el3 & SCR_MECEN)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +
> +    return CP_ACCESS_OK;
> +}

It's better practice to initialize local variables when at all possible, especially now 
that we build with -ftrivial-auto-var-init:

     int el = arm_current_el(env);

Missing security state check:

     if (el == 2) {
         if (arm_security_space(env) != ARMSS_Realm) {
             return CP_ACCESS_UNDEFINED;
         }
         if (!(env->cp15.scr_el3 & SCR_MECEN)) {
             return CP_ACCESS_TRAP_EL3;
         }
     }
     return CP_ACCESS_OK;


> +
> +static void mecid_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                        uint64_t value)
> +{
> +    uint64_t valid_mask;
> +
> +    valid_mask = R_MECID_MECID_MASK;
> +    value &= valid_mask;
> +    raw_write(env, ri, value);
> +}

The valid mask does not come from R_MECID_MECID_MASK,
but from the contents of that field.  This should be

     value = extract64(value, 0, MECID_WIDTH);


> +
> +static uint64_t mecid_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    uint64_t valid_mask;
> +
> +    valid_mask = R_MECID_MECID_MASK;
> +    return raw_read(env, ri) & valid_mask;
> +}

If you've properly masked writes, you don't need to mask reads too.


> +    { .name = "MECID_RL_A_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .opc2 = 1, .crn = 10, .crm = 10,
> +      .access = PL2_RW, .accessfn = mecid_access,

.access = PL3_RW, no accessfn.


r~
