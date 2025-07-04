Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1477941dyc;
        Fri, 4 Jul 2025 15:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuTphfwMfWulbgbC5dYw4SwEXjlbFs+6DinU5dkPLVCxC5h1TR+e0CNVJgio6o3vg7mj0+ImIjCuy5Qw==@linaro.org
X-Received: by 2002:a05:6808:50a5:b0:408:fef8:9c6d with SMTP id 5614622812f47-40d2cc4054bmr256940b6e.19.1751668164651;
        Fri, 04 Jul 2025 15:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751668164; cv=none;
        d=google.com; s=arc-20240605;
        b=O7an3B6wNiidnY+ZIUhFBlYScr3Z2vqJTQFcnzH/NtooLzTWzgW44MeV1DOZw93G6S
         E+/euoiP0JOmb/lztGlhMHx2MI7djpxWsmgUt3d50nCi2Lk/Nu9tq9puy1PJQaDGq2Cp
         vQwWOWbiBrRR5TDwq426qlZbLFPdDy40N9OmMHYjVBoXP9mmIF9xGljU5NNjlS4XfQX+
         Z5ttqv1i6/pyzdEni3MO30Izju2b6GvILg78AXLFeizPcqDnF6A+zTKNonhAXvZ34kCW
         KbLkpryWkkj+zunyMVE6A5e7c3vOeeu42i7ElA6vmDZAty5gS2S3ojaRIz7uks4HacZA
         F3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PSW5Sd3fMRcO+9pF1PYCNd4U9ckjj4wNXGVkuLJI+50=;
        fh=PbIWsCRlDlo67MNf/czZGAlFwyYGJhZeMivct6wjw/4=;
        b=GXiPoecW6v6TX1mHTQli4A6TjJ4jPs1NHbZveovoyXr2V8kfP9uxW2QvEcfo211ve/
         9pNaFezbQHoYbwf28Ib5e7um36uBK3dad06zAC118hhDCtKcV9BREHaG46xRsKY3ugVW
         CUPwQjPVZP4Whfah2Br3hk9QNRk9ZFUakyIpdqu2W1N/Q13KMvlTfdvrHs1wVnpqYxhX
         6Ggam512q5+DRmFOdCzcxeLde3K1lZkplr0IZcdqLm73g8Jjp/CfO7/pKb3vd0BT28Ex
         EoGqvD3hhTHrckJWMK+zcgQeFc7WdULrIH2uknlmyABq2v1VlAeMwnTHdloTJJWamRwJ
         XUZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l3bjowzt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-40d02ad471bsor516518b6e.9.2025.07.04.15.29.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 15:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l3bjowzt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751668164; x=1752272964; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSW5Sd3fMRcO+9pF1PYCNd4U9ckjj4wNXGVkuLJI+50=;
        b=l3bjowzt5AuQDWxaqRgnwsaFV+vSK/9re25T3gp4l6ep+O1WTgLXET0ESC3PLGlkNb
         lFUWhwHmcbkWngtO9EtK5A7usSRex6BaD0XPjSTR8eUTaIUSg8fBj7e0jXnConmgE1dt
         YSvWrR5TI67B9Y79qtIn3hqO4rj2L7rl/Ppn8BOaNjeNHaJ2sI6LSGl+pVx0+GFfsBHi
         GpPqbJvAyTFJ0wC74sljKhZiJUuhgithsl7gjiZ+ufUq3QWB92p3qfOsUzOP9YNHHQ5c
         JAZxlZbXih6tPTAgx2Li/9eztlVSVA4flaDDc3B1dFqCH1ej9+oYHQs84Ts2R8kPAZ5e
         ZbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751668164; x=1752272964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSW5Sd3fMRcO+9pF1PYCNd4U9ckjj4wNXGVkuLJI+50=;
        b=TMp4VqlU4NAoBldprvaH5KLuTaz4aaQyeX4Qrm6ZMZCZHVFy+Q1fORkgdrjbtZtW0a
         iFNSmsXGkPniu/uaEwovtFougAQ8a8Bfn694Gqk1kjC4S2Z/o6F2Tc8uOhUiRgZoUgth
         UB6pjpEN9hZJW3NbII+OTrpQyP74PdwueQFAS40DB23InFrihbHuUmL59rJ3YqNZbpSi
         N0ntc3a6TOominT3cqxyB58q6u51I33XNVU2wAdYi+lWfDad21FfxrhUX0CqBdI39dX7
         84dFWvQfEThNCc61Z2XKk5XdQBmEfX6qmIhcHCvASOOOhHNfzD5aPddrL/lljHqQXLpT
         tgJg==
X-Forwarded-Encrypted: i=1; AJvYcCXIpG2RBsmKSvsg9tz/b/gDWc/3ZstP0j1AgywYx+13rFGfV6f4xpgFx6dGfuWQxnBTxKKoAyS2qRVOWw==@linaro.org
X-Gm-Message-State: AOJu0YxqkkhzyW2A3Xar3IKt363jDBEkdiMJbjZx1uw03VS3+pQftwmf
	sX43LAfDi4NumG4UAmmahlLuq384bvM7bqHAHGtA4wHu+ZfHkVjvIaeqcI7vk1Z4c2FcsA==
X-Gm-Gg: ASbGncvgAyOZMEXBzgMXWv6iD+yWe1YKXJPxVxOTtZnhFWLrNcdUOLKm/viukvipVhk
	/hZk3RROJuJFxnIjrSPlHyI+uWmNfcAsOuQcwHHUDKCKSsPSKyFPlm1ujkkrdaP3zpUo8bbHL/i
	jiuCxMtcR1t6Gn/einhIP1CRoy+BS/pd1uytQKUU37YC8j2a1uMaK5VzjT42Mt1LMpzJLvdkjjw
	IneV53v7cmPuYBVIPMNx4ydpZLze2HO7qEAeUvErFe9y1FbSxLyjP/YUVQ1bDoGS1ygf1jLUT+v
	WCUya5zlBWzDSORKtqvRJJ2YagR+3Z5NE1qzFjUQH63QIPxwu0+vSh7cM0N7MN13U/7RGCYqu+n
	EmN/iC+brNra46LpapA76WngIxh3dvP0rG0DtROaG
X-Google-Smtp-Source: AGHT+IFNltfHEPPmzoHupTJkq0BusMmkW8D5wSxtbZ0PuXL0cTpWykazdEPe2SQ/Gw2J+K8yY/PfiQ==
X-Received: by 2002:a05:6808:2183:b0:40b:4208:710f with SMTP id 5614622812f47-40d2cc40ef2mr206202b6e.24.1751668164146;
        Fri, 04 Jul 2025 15:29:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40d02a442d3sm453991b6e.13.2025.07.04.15.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 15:29:23 -0700 (PDT)
Message-ID: <04076187-3892-48dd-9b6d-60bd9dc4a16c@linaro.org>
Date: Fri, 4 Jul 2025 16:29:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WIP-for-10.1 v2 4/5] target/arm: Add FEAT_TCR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
 <20250704151431.1033520-5-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250704151431.1033520-5-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0eJLgyBEoViz

On 7/4/25 09:14, Gustavo Romero wrote:
> +static CPAccessResult tcr2_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                  bool isread)
> +{
> +    return CP_ACCESS_OK;
> +};

Eh?  This is missing everything: TRVM, HCRX_EL2.TCR2En, SCR_EL3.TCR2En.
Two different functions required for TCR2_EL1 and TCR2_EL2.

> +
> +static void tcr2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                       uint64_t value)
> +{
> +    int el = arm_current_el(env);
> +    uint64_t valid_mask = 0ULL;
> +
> +    valid_mask |= TCR2_AMEC0;
> +    if (el_is_in_host(env, el)) {
> +        if (cpu_isar_feature(aa64_mec, env_archcpu(env))) {
> +            valid_mask |= TCR2_AMEC1;
> +	}

This is incorrect.

(1) Both bits are reserved unless FEAT_MEC.
(2) Bits that change interpretation based on el_is_in_host must always be writable, but 
ignored when !el_is_in_host.

> +    }
> +
> +    value &= valid_mask;
> +    raw_write(env, ri, value);
> +}
> +
> +static const ARMCPRegInfo tcr2_reginfo[] = {
> +    { .name = "TCR2_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .opc2 = 3, .crn = 2, .crm = 0,
> +      .access = PL1_RW, .accessfn = tcr2_access,
> +      .writefn = tcr2_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.tcr2_el[1]) },

Missing FGT and NV2 settings.


r~
