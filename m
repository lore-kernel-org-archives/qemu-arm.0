Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5035855lfa;
        Tue, 3 Nov 2020 10:32:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVI0T5dXNiJlnbNv8ONX/tEZ/x5FI5qEFlNfDDpuIExo3relhmPcfoqOg6FRoWLzsn9vik
X-Received: by 2002:a05:620a:5a2:: with SMTP id q2mr20965494qkq.335.1604428366352;
        Tue, 03 Nov 2020 10:32:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604428366; cv=none;
        d=google.com; s=arc-20160816;
        b=SjY9y2sj4IMFhgjTmrNrc8qO1SWNI1jJLMb8KZFHVRabnKHzguiF/Okbwq3PqJulTs
         YQ55jVrxZNIwH6WCS+iEljl68KA6ULHBAxM9pfpexnFOLVXGRXPq/iwpDC+eA2ZzOAiU
         iU8HFurG9QxoeSWsaD8hUksS5TIu68W6naD/2gPC7Kfrpz7moR4QFXDYaDUupJFQjtul
         qOUFUK1ytanVu2i+XA7Z533x8Cftzi6nGjWMcF0CfbEh10Ew8RJEoEBbilpB/acUWInU
         nMSkGQ2/WX4Af3YHZ+XXzb4WpWtUyO3A9OKI0Gsfxjc1BCzQOqbICwxESojFjD52rzwJ
         4chQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WyI+wdpZSvkibXURhsE4UtunQSLgk/mfEDbq38QxQDk=;
        b=GOIEVazw9iV7UVliW7esJ8b2oqRlb4Q40fMTMZ7IyXvOjkZDSq4bBdkBJngmgPzlwx
         UnYfVml3Qgplqn8fYrjIQcbnPrDIJqCdgove0E4AY8awMW06peiTps+P8Uxo/JoVu5Z6
         KN+J0PGREzwVkiNqT0hqdr+XY/Cz2Y2U+P1l3rzgXd/FJYbbR/Nqvi9vWb6IGlp6vZav
         1EmYdD8nVjREVKls+VkDe7YfCc/V9F/R+yFD5ghe876iolyOnFJMUAJRU60DedKdS4l5
         FSaZUGlXv/S0kQz0G+qa1l7INny/dyyYqTlHsvoS2NEbUtKdOXAgTPUfaSOmWy6k4c7V
         vy6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcQyb3iF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si10561308qkd.147.2020.11.03.10.32.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 10:32:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcQyb3iF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka16r-0000gv-OX
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 13:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka16c-0000gf-4f
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 13:32:30 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka16Z-0007HM-7Q
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 13:32:29 -0500
Received: by mail-pg1-x541.google.com with SMTP id r10so14329196pgb.10
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WyI+wdpZSvkibXURhsE4UtunQSLgk/mfEDbq38QxQDk=;
 b=KcQyb3iFTdQ05J0LDLh3583K+jexl8NrWpv6TrYdDb9+cQhIh5ONglbtjQSXG9Spsa
 m9i5N2FoSWxVFxIbnUOoOGlnQPkuEfMWpIReIG2cmkdIDnDz5IQcTKD7xHf8ZwCSOQnf
 0/Xo9xLKSs5pWzBw8sWjXHgPBfENyh1hpx+9uCKocOg4ZNHUcXe6inPLNlEa0Cp4giCq
 Y5dBdSc1m1Y1tFTlEuQuoHEFpr2GswAhuSmJ2jAHU8j0STrJPUurGntavlZ2LFly/aAk
 /K/Lto2vqErLQJvpPltclFEINbeYJWGTfOraaTe9h0nCc/znoq4DYxCeNruXF8NSaI1U
 C4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WyI+wdpZSvkibXURhsE4UtunQSLgk/mfEDbq38QxQDk=;
 b=Pb9d75qKEr6AasE6SWC7fNd8uahSAQCqGvsm6QHQoWsc0mIv4/+SdE7bF764s8W3eA
 3xL+cpYSUxrjqGflPmW0SCEb2/6iR8yrb1NEYU2FvV0e+sdcIBto8xDQVuF9xr3ijf+Z
 ICIAizGBh4FTwHh8nmIEHE8O0LptMGBugT9DEUkwl6kkiB9Qn2R5H/EsXYA66ZmUk2/J
 VRJEeJeFustrsRQaWCi5nfJkEnRhtvuB/HMH2k9G0B1LEg0vs/alVR3YLETec63uyvQY
 XjmZocNxwMgLWzDmD/fu5SchXz4+YUJv2X0dadfILxBODmAoGmP3ag1GbV6PxQw87FeY
 7lwA==
X-Gm-Message-State: AOAM531dPpYSZkAwczBbI/JwccHXn9ajZR/IC26lvCxNGcsH1ncDchRV
 kjgFadvIBA86Zq7lyQxl/rcKOQ==
X-Received: by 2002:a17:90a:468b:: with SMTP id
 z11mr468720pjf.157.1604428345363; 
 Tue, 03 Nov 2020 10:32:25 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id v24sm15882848pgi.91.2020.11.03.10.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 10:32:24 -0800 (PST)
Subject: Re: [PATCH 08/14] target/arm: add MMU stage 1 for Secure EL2
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-8-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1bca2e0-d926-02cb-c462-5e9d64a51999@linaro.org>
Date: Tue, 3 Nov 2020 10:32:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-8-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vufG0oPiQ6+K

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds the MMU indices for EL2 stage 1 in secure mode.
> 
> To keep code contained, which is largelly identical between secure and
> non-secure modes, this patch introduces a secure bit for all new and
> existing stage 1 translation regimes.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu-param.h     |   2 +-
>  target/arm/cpu.h           |  22 ++++--
>  target/arm/helper.c        | 143 ++++++++++++++++++++++++-------------
>  target/arm/internals.h     |  12 ++++
>  target/arm/translate-a64.c |   4 ++
>  5 files changed, 127 insertions(+), 56 deletions(-)
> 
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 6321385b46..0db5e37c17 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -29,6 +29,6 @@
>  # define TARGET_PAGE_BITS_MIN  10
>  #endif
>  
> -#define NB_MMU_MODES 11
> +#define NB_MMU_MODES 16
>  
>  #endif
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 724b11ee57..3fbb70e273 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2944,6 +2944,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
>  #define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
>  #define ARM_MMU_IDX_M     0x40  /* M profile */
>  
> +/* Meanings of the bits for A profile mmu idx values */
> +#define ARM_MMU_IDX_A_S      0x8
> +
>  /* Meanings of the bits for M profile mmu idx values */
>  #define ARM_MMU_IDX_M_PRIV   0x1
>  #define ARM_MMU_IDX_M_NEGPRI 0x2
> @@ -2967,10 +2970,17 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_E20_2      =  5 | ARM_MMU_IDX_A,
>      ARMMMUIdx_E20_2_PAN  =  6 | ARM_MMU_IDX_A,
>  
> -    ARMMMUIdx_SE10_0     = 7 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_SE10_1     = 8 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_SE10_1_PAN = 9 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_SE3        = 10 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_SE10_0     = ARMMMUIdx_E10_0 | ARM_MMU_IDX_A_S,
> +    ARMMMUIdx_SE20_0     = ARMMMUIdx_E20_0 | ARM_MMU_IDX_A_S,
> +
> +    ARMMMUIdx_SE10_1     = ARMMMUIdx_E10_1 | ARM_MMU_IDX_A_S,
> +    ARMMMUIdx_SE10_1_PAN = ARMMMUIdx_E10_1_PAN | ARM_MMU_IDX_A_S,
> +
> +    ARMMMUIdx_SE2        = ARMMMUIdx_E2 | ARM_MMU_IDX_A_S,
> +    ARMMMUIdx_SE20_2     = ARMMMUIdx_E20_2 | ARM_MMU_IDX_A_S,
> +    ARMMMUIdx_SE20_2_PAN = ARMMMUIdx_E20_2_PAN | ARM_MMU_IDX_A_S,
> +
> +    ARMMMUIdx_SE3        = 15 | ARM_MMU_IDX_A,

Hum.  So, we're adding 4 new mmu_idx, and increasing the mmu_idx count by 5.
The unused index would be 7 -- no non-secure el3.

Is it worth reversing the S bit to NS, so that index 15 becomes the one that is
unused, and so we don't actually have to add it to NB_MMU_MODES?

> @@ -3649,7 +3655,7 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
>                                       bool isread)
>  {
> -    if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & SCR_NS)) {
> +    if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & (SCR_NS|SCR_EEL2))) {

This seems to belong to a different patch?

> +        if (arm_is_secure_below_el3(env))
> +            mask <<= ARM_MMU_IDX_A_S;

Braces.

>      if (raw_read(env, ri) != value) {
> -        tlb_flush_by_mmuidx(cs,
> -                            ARMMMUIdxBit_E10_1 |
> -                            ARMMMUIdxBit_E10_1_PAN |
> -                            ARMMMUIdxBit_E10_0);
> +        uint16_t mask = ARMMMUIdxBit_E10_1 |
> +                        ARMMMUIdxBit_E10_1_PAN |
> +                        ARMMMUIdxBit_E10_0;
> +
> +        if (arm_is_secure_below_el3(env))
> +            mask <<= ARM_MMU_IDX_A_S;

Again.  This appears to be an existing bug with SEL1?  Perhaps it should be
split to a separate patch.

>      if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
> -        return ARMMMUIdxBit_E20_2 |
> +        mask = ARMMMUIdxBit_E20_2 |
>                 ARMMMUIdxBit_E20_2_PAN |
>                 ARMMMUIdxBit_E20_0;
> -    } else if (arm_is_secure_below_el3(env)) {
> -        return ARMMMUIdxBit_SE10_1 |
> -               ARMMMUIdxBit_SE10_1_PAN |
> -               ARMMMUIdxBit_SE10_0;
>      } else {
> -        return ARMMMUIdxBit_E10_1 |
> +        mask = ARMMMUIdxBit_E10_1 |
>                 ARMMMUIdxBit_E10_1_PAN |
>                 ARMMMUIdxBit_E10_0;
>      }
> +
> +    if (arm_is_secure_below_el3(env)) {
> +        mask <<= ARM_MMU_IDX_A_S;
> +    }

Likewise.

The rest of the patch looks mechanically correct.


r~
