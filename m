Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1131533ejc;
        Thu, 23 Feb 2023 13:41:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/57YJDEFj318bYxiqR799eDlf+3e5YH5FOueVXnXGTahmbx/IKQD++5RQjlldt7lZS3KWt
X-Received: by 2002:a05:622a:30a:b0:3bd:10fb:6917 with SMTP id q10-20020a05622a030a00b003bd10fb6917mr27340613qtw.5.1677188488522;
        Thu, 23 Feb 2023 13:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677188488; cv=none;
        d=google.com; s=arc-20160816;
        b=QlRfU72xnZ2HBkHdwSYSm3rkeimDWzc0OIlpLGziC8FGpCpdwSZaDX4C7oaLBGBDkR
         OjmP5h07efPmFUpnysE6Nwvshi0aGJGvq4sOBKPi3hwBG7bfYgZ/L+E6MrKgLYiV/jxf
         tDFhUlJtxSUE9OeeKSr7s4BoEbeLmw7ggWJtYJxtjBu/eA122AU1E/ZtdeVqmEL32bWN
         9y097KTc9ju5gFEeNz7SZw7SsLhIW8VugZO+CYC1qDdamS7Vm79mnBPAwKuLYz/tBo3Y
         G1i5aXYhGFgO6LmoQMslMhdNfRguxQ4APGBcqAloCZightUCbcAarLHtuG5a3Fp9AaSv
         5vqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fTGb0MOzx99g6Plo8I6MmD6Ps0tFZW9GRM4NVTbl048=;
        b=WqEKudEyJPqMExV4hsCBg7l6sGgVVDrLDtOop/kHoZgNNW6Z5SLsrmuwgLX7cnzZy+
         fTzZILLeKvVKU7bnzPLdi243BYN8EINXyAB11jnm+zHCI9Vaq26h3DwnODpblpLnJYrQ
         ffAbuT3yLbOwkq/csGPdf/Dr/NL5zZ1GqbFl3uTfz3aRsmhXD5HOwhH1tuDKkXiwsEvb
         UQn01zjkjK9GTdCklOG5gzaSzaZ9/L62wk3fEUkqMrpJmiNseS1LP+lZA9m8TptudfbB
         waPpuySN9uFZyDmusUBEUUSiAU6qiEN5crvj6dgZzBCowyb1yWgtyzQkaLdxSsLiVu0T
         iC0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GHT2L404;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020ac85e52000000b003b645a4dfe7si4769860qtx.771.2023.02.23.13.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 13:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GHT2L404;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVJKz-0006vR-RM; Thu, 23 Feb 2023 16:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJKx-0006un-9Y
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 16:41:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJKs-0004Yb-7x
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 16:41:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so648530wms.2
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 13:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fTGb0MOzx99g6Plo8I6MmD6Ps0tFZW9GRM4NVTbl048=;
 b=GHT2L404p6Yb80CijHDskVBUcmr/JfJWupLzxIdI4kI7y1uzcf7MnaaIraxon1LmHE
 je0bKemhoSik72SjOrHl2XVao5bvEr8V3Ptt2VkQW0wXpIYlQdSwldrOIn+0lJzvjxMN
 0aUOWEOso96ILplgvk0jr4C9gqrfDD20L2Ss/pokjeIe8e26BKKdb/7Y/7yVZDBqAli3
 uGaoB6HvJWORcym8eoMdOGS3mgXBAzF5ZKkbwV2r72q/o0M2AC5R7Hd2q91b5aZe/bW8
 RHmCVnVklhqCOtOsUnTisTQYu3z//lz7+i2jEttAgv0akDn5xTLHvhTB295pIvwNMXux
 Oy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTGb0MOzx99g6Plo8I6MmD6Ps0tFZW9GRM4NVTbl048=;
 b=G55JaMkAlzEKi4Nhvp4s+EN4lTzpgGlaNXwfCRLDeisDPnHoRaR7ewZAdXY9zaQgrt
 1EGP4N1CL3ib8JJgdlxm/ocjVTE/LxdAJlpmCkM3ylxNmoT3CdoID6vdn0tb35lbVjpw
 NDbFZndddNmCz7PtklK7+//lQnN7vO8Wdkeqwvda6PoqmjMOdGXEV01DGGHBo8XcEP3f
 qfBnGg+zV1Mb8iOFyjyiO9by5Az5ZlAoSS6JsEZw1sZTU4JZS2q29mj5oEDUNJpCTMRO
 xLECyYdnMZZfQo2tV6Gah0aF177KSP2OGkdgMpBmDgoWyQ8Ifo08GEFbTHBty+86Paw7
 dtVg==
X-Gm-Message-State: AO0yUKVj8GNKnzZCWQp7RzrNLcchJtsdic33GNk+zvPwR48Ow3wAv3sw
 5DM8u4UoEo/bhzPOw/Rgje0eng==
X-Received: by 2002:a05:600c:348f:b0:3ea:f132:63d8 with SMTP id
 a15-20020a05600c348f00b003eaf13263d8mr613065wmq.5.1677188464571; 
 Thu, 23 Feb 2023 13:41:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a5d6e55000000b002c3f81c51b6sm12606730wrz.90.2023.02.23.13.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:41:04 -0800 (PST)
Message-ID: <7ff2c4b4-d590-8969-4322-0c09b8aeb581@linaro.org>
Date: Thu, 23 Feb 2023 22:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 12/13] target/arm: Do memory type alignment check when
 translation disabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hwRy41G18l2t

On 23/2/23 21:43, Richard Henderson wrote:
> If translation is disabled, the default memory type is Device,
> which requires alignment checking.  This is more optimially done

"optimally"?

> early via the MemOp given to the TCG memory operation.
> 
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 36 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 07d4100365..b1b664e0ad 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11867,6 +11867,37 @@ static inline bool fgt_svc(CPUARMState *env, int el)
>           FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL1);
>   }
>   
> +/*
> + * Return true if memory alignment should be enforced.
> + */
> +static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return false;
> +#else
> +    /* Check the alignment enable bit. */
> +    if (sctlr & SCTLR_A) {
> +        return true;
> +    }
> +
> +    /*
> +     * If translation is disabled, then the default memory type is
> +     * Device(-nGnRnE) instead of Normal, which requires that alignment
> +     * be enforced.  Since this affects all ram, it is most efficient
> +     * to handle this during translation.
> +     */
> +    if (sctlr & SCTLR_M) {
> +        /* Translation enabled: memory type in PTE via MAIR_ELx. */
> +        return false;
> +    }

I haven't checked <...

> +    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
> +        /* Stage 2 translation enabled: memory type in PTE. */
> +        return false;
> +    }

...> this part, but for the rest:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    return true;
> +#endif
> +}
> +
>   static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
>                                              ARMMMUIdx mmu_idx,
>                                              CPUARMTBFlags flags)
> @@ -11936,8 +11967,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>   {
>       CPUARMTBFlags flags = {};
>       int el = arm_current_el(env);
> +    uint64_t sctlr = arm_sctlr(env, el);
>   
> -    if (arm_sctlr(env, el) & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>           DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>       }
>   
> @@ -12037,7 +12069,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>   
>       sctlr = regime_sctlr(env, stage1);
>   
> -    if (sctlr & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>           DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>       }
>   

