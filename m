Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2247265njb;
        Mon, 10 Feb 2025 14:11:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKiBG+VmEdClrKvAtgG4SKXzWgb/3wMPsJBK6OgeRQus1tkBx9h/ZlNzogVNrgN/71zeiMFKapS4wmfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZQOGtgEWqXT0Nz7sPwkN6QXi8plO4itio8xmVVUM4oOUIAp3vlJSVbs9kHQdM8MKcCpuZ
X-Received: by 2002:a05:620a:4312:b0:7b6:672d:7fc7 with SMTP id af79cd13be357-7c047c21160mr2517292585a.46.1739225472388;
        Mon, 10 Feb 2025 14:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225472; cv=none;
        d=google.com; s=arc-20240605;
        b=lUkfU7TCJCEpq94Xhh5rc1zhCxfRrK4hsXBpE5x0btnSU+E0f2qqS8a2iWfJogY5/g
         pNfholcdH3MxHV6mxNrXRHIjRUYpoTYpuPRdaISumN4Y+lXx0CpyWXRY9j4fEpq2k+Do
         ZmyUXJrdAiGZpuqRZXwF87QdeoEevPX3eOt39xdspkOK3yPqErheqtbHAuxK1tjw4Ffm
         5i5V1nfzjxTK+19+lUIzC7HlvVwHvvnWYymvmpbDto+ZcI2bAsnHLpPigWCdBQSWm1mJ
         4Oh7ZEqtestXVa0xUDse1HgQrkeADEmepaVgdRm0+1/BftTUaqJx/xwuZpJ97eJmZfo5
         Mf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hx6rXmOzmhNZfCCRok9AvvrGUo50eO9KKj9SQEthRLs=;
        fh=meiulI/db/tjxn0KlrpPUP3m1HSokt28S0Of1T9WYEI=;
        b=SvwYPqZJsc0R4K9cn+6qsY2Agb1bHnGS52IUKOfrUAB19vzei51ZVsBJTHABMeAlKu
         zh5APnKAg00NogStdLzl485RIC9zou0AkrIKzLr+0BlbsI5siQ0Q815GZnR02g1oaR6q
         4qd+GvCo75tWNLbTOd5t8Sz8lwIysdYb14+N5oN093uDsfFlAO1x12G/WbAc6hcuLh+U
         ge8jVkG1opldAxCqVdw5hPA7cZVXF2UxgALCioq3BlEH/RqkFYmOwAcskRyZoXPqt8VC
         WLQQKtVZVISBCxTDp7LFwR+jZgUAWyH6AMIl7RRs5vBWsMysCPwiEeppynp+lq06fzJi
         5YxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ks5MJZ/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c068a1f7c9si63815885a.23.2025.02.10.14.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ks5MJZ/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbzO-0000F6-8y; Mon, 10 Feb 2025 17:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbzM-0000EH-Jw
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:10:48 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbzK-00015H-Td
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:10:48 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2f9d3d0f55dso7562567a91.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225445; x=1739830245; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hx6rXmOzmhNZfCCRok9AvvrGUo50eO9KKj9SQEthRLs=;
 b=Ks5MJZ/eV22l8SqIdWwMJXCDuzI00lchH8VxJ9ylVvTfPWaWDG7z+sFo0WlP+EFpUH
 pj+QwFl3YrhyPYFUuXjgko3vb2N7MSaGtBjnPgQXQkxVUgb2Kkl6C9o/VGXC9ObVHZXL
 pIzl/dGbLF+HcHW/PqZjTf7bStadH220kckv0UT5cK+8tkoEsOGuW25Uz6Nd+mccTxmx
 hKvp8MMF974r+t3FAamVmKPEItPR9WdlXq60d4eToY6NpVFqrlkbL7hiQc3LPS/eJucR
 O7a5VZTGSO7l4+J1R8/UKIwjdpHgibDxUFJ1XfKL/A2o16sHmbnQNq19H76YgP9yKDCj
 0sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225445; x=1739830245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hx6rXmOzmhNZfCCRok9AvvrGUo50eO9KKj9SQEthRLs=;
 b=iZAW0De1/BNygc3Rnj3/aSEH74Xzyhoj5zyGhVUlcezHcYG1fNv2Ay3ZWyq0kaTaNQ
 kQy1GgppPMEkM+WAqF2nMFV0wQT9QHq7zP3a0Qyg5mj8i+t2JzGSN19ChrZ1kn9D/pMu
 w6EIKTVdBIrrmG2IOAOohXCidPqMGR9PU8sxuajLno/WHb+MxLz27T/DOoxdohHNAQJ7
 N7n9zYkJvsObh7hw1WcTYslYIYIJiZDmbW0TiUuX29JmcYm0yiSH6JVOfuKpWtgIBLfh
 wK9MruDnchHpr8ztNKwb4YZXiZDvZ1nSNp5a/+KabizRbxBPBEYJV3exL0roNXdH8IGn
 P2Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8UVzPjNECxIZXv5HU97s1Ha+nNswbsKi8Kkrq8IfrkQgCKOa7+9qtBY12g4+sWnU9fXMM7Z/fKA==@nongnu.org
X-Gm-Message-State: AOJu0YwNQPCJh4KsacqKgiINGHFO1Y9tn+yOc4WVlZccAr1ASyUW31ay
 3E9eFMIWKEJmmViKbh+BRWhzce2PeVO5Tujuzk9dAsNQDnGd5K9WdB3hdM9tkHs=
X-Gm-Gg: ASbGncvyOA39cvMeURaHDPYTdfmMUAABONbYQeIvWY63djqriU11de0g3pEkjmoX0zc
 NdeCDn2LO1crudSXxt2XPcNO99+dBTsEkAcDqrCv0UKwOSPjLEICAhQAp9a+mLsf2rRZ5FBNPwA
 N5QVrf3FPImAAQ3iyo+lK+kN84mEJvFTTifKT9jciGKatAUArh7fZXHKdmb5sAv7H3HI34a4UwE
 D5PpkzElGh1lOimFQ4RhjxdJvvwG4Ezhnc4AJG8wxvIhgKF/lzD4GaqPyxuEtAhV6lFkPf8dvGk
 gjDvfL5eHmtkzekTo1XVWlIVrSPximRhqqvYJqp3tp0ZX6ylP57VRZY=
X-Received: by 2002:a17:90b:184d:b0:2ee:fdf3:38dd with SMTP id
 98e67ed59e1d1-2fa242e5d0dmr18722411a91.23.1739225445366; 
 Mon, 10 Feb 2025 14:10:45 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa618e5e18sm4344939a91.41.2025.02.10.14.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:10:45 -0800 (PST)
Message-ID: <7056fbfc-58eb-4881-a6ee-67b3e608a336@linaro.org>
Date: Mon, 10 Feb 2025 14:10:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] target/arm: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YNg69A+KCfxa

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 94f1c55622b..68b3a9d3ab0 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1188,7 +1188,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       ARMCPU *ac = ARM_CPU(cpu);
>       CPUARMState *env = &ac->env;
> -    bool sctlr_b;
> +    bool sctlr_b = arm_sctlr_b(env);
>   
>       if (is_a64(env)) {
>           info->cap_arch = CS_ARCH_ARM64;
> @@ -1215,13 +1215,9 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>           info->cap_mode = cap_mode;
>       }
>   
> -    sctlr_b = arm_sctlr_b(env);
> +    info->endian = BFD_ENDIAN_LITTLE;
>       if (bswap_code(sctlr_b)) {
> -#if TARGET_BIG_ENDIAN
> -        info->endian = BFD_ENDIAN_LITTLE;
> -#else
> -        info->endian = BFD_ENDIAN_BIG;
> -#endif
> +        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>       }
>       info->flags &= ~INSN_ARM_BE32;
>   #ifndef CONFIG_USER_ONLY

This is a faithful adjustment to the existing code, so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

However:

(1) aarch64 code is always little-endian,
(2) sctlr_b is always false from armv7 (and thus always false for aarch64)
(3) I think the BE32 logic is wrong -- CONFIG_USER_ONLY is irrelevant.
     See linux-user/arm/cpu_loop.c, target_cpu_copy_regs.


r~
