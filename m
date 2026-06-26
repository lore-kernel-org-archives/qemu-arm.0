Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7EC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 22:56:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdFSN-0002Tm-0n; Fri, 26 Jun 2026 18:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wdFSL-0002Qj-8H
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 18:55:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wdFSJ-0008Ob-CU
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 18:55:29 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-84538597e1fso822664b3a.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782514525; x=1783119325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCAnbUCnMa+qMLSmwnODeeup7O8oGMDV35YTT8MSyjU=;
 b=M4uXSGpWoCl3/YRs/ycmL/viFkFbXMqhyFly/RAkKn8BaBx4WNMyaYL0Evnh1iIMJJ
 tR96mdBZ5R0mhLXCi2QqjqjhZslIRmw4Wl8DtQWQYxMRJJEO7Ils3f2Qab/F/GoKPg1w
 OC2Atg5EQc2L00/9ThJz27lrrTjmjlxH+Q6+jO1e5eHbJq0SDk6jqYrajDEjkUFw7DpS
 gI3N46/geMqA04GyDZfNfTaYlkOgLEhTh5U5Q/kNJK//nbTq5FPPIaxUWJ3ijnTtxUSd
 4PINGTkQWOvC7eNXl6hSYTl2udMJ9Dh+2vzf64Hie3WCQ31MxJIKTN2leCovLcqR5Kks
 /FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782514525; x=1783119325;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VCAnbUCnMa+qMLSmwnODeeup7O8oGMDV35YTT8MSyjU=;
 b=dhqdCckYQAv8efIEyKDbYmBmC6yN/gz0y1tZJ36ZfR0pLQNHOUAjER92YT0rTVwKA2
 h3MOZbC1M5blTObmnCs5H8RHOi6+BDxUmiMsod3Akwd1okzeD2M1cmGBdiDxzTQcFmiS
 +sh2GKK3rniFgoIxop6lXXdMiTh10RNI9qLXRT0Id+gVyJxcmdRSM4utPsNc5mqH1atn
 KNL54f9BKDNJsTsVsDUM59yJHfyFc/cSRTp6bjBWULcIy6Lyw9Gj4qKP2c6B+WfCeR92
 qouLwSePQ3J6piMRXpYHwxCk0oc27WLxxSZfvaXjKfhK7E0wvctCDaXnN8aUbIj+aGUx
 dZYQ==
X-Gm-Message-State: AOJu0YxPtoM/CytUS8ckPexNdRPBDIXM1upR0kDNfp3Z8Zx4yjiGXeJB
 pikI6QFG1NB+s/mGJAxEGjf94dSEkJcHrmp8QsDME8UtmteN09gB6D6rTaVa2DFyf0E=
X-Gm-Gg: AfdE7ckosbMPI6Tvauc18r1okyoeGxEaskzsldWrXVEB8JaIcCIcl2eociLge6mhqqp
 n0CAyBCfVk/HVg6qS13k9XoU8UGcgT83FlDy2VWDtYeJsthWx+86qFaopPgMYkCMIFsXjnCKfdd
 aKtZj8j2uFjJH0PUbKgYj3LCREVhyg6WJ0gXHwrRCZabCnB83EZObYDxvhLdl404bW6pVCfyD68
 j0heJls+tFHcftb4OHWnxkdet1zYTsUi3EU3Ld/6I0xw0lgZvScYnxcrQROV8xwwgQs9F0iPay6
 7DZcw2Yvmay0mLR8r0LqLrMIwYj7fFqlWdFtuVEq49ixTTJOu1pSHT9VqMec61207HfUK4GMRrL
 3he+wLapTXJHU5ki72sKaLYP+N27OkuS1oTDsqeW0pIOPEzI1GAcnixNO2dR5S4S5xkWcWnpROe
 C73FTGSjw5Fc20EG3g2awr42y8pGJkTQeOR8eylXO/Iy2zAwSI/1A76NaH8w==
X-Received: by 2002:a05:6a00:cc9:b0:845:ce2c:2a2a with SMTP id
 d2e1a72fcca58-845ce2c305cmr2939902b3a.6.1782514525376; 
 Fri, 26 Jun 2026 15:55:25 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a3fec0f7sm7360946b3a.22.2026.06.26.15.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 15:55:24 -0700 (PDT)
Message-ID: <854ffb2f-a363-4c69-9a51-95151dfff517@linaro.org>
Date: Fri, 26 Jun 2026 15:55:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Only evaluate SCR_EL3.PIEN if ARM_FEATURE_EL3
 is present
To: Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260626203639.431191-1-oupton@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260626203639.431191-1-oupton@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/26/26 13:36, Oliver Upton wrote:
> Running KVM with (as of writing, out-of-tree) support for FEAT_S2PIE
> on -cpu max gets stuck in an infinite loop of stage-2 permission faults
> due to the PTW incorrectly using an effective value of 0 for S2PIR_EL2.
> 
> Similar to how S1PIE is handled, only use the IMPLEMENTATION SPECIFIC
> value of 0 for S2PIR_EL2 if EL3 is implemented and PIEN=0.
> 
> Fixes: a811c5dafb ("target/arm: Implement get_S2prot_indirect")
> Signed-off-by: Oliver Upton <oupton@kernel.org>
> ---
>   target/arm/ptw.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 1470de3010..4a7aeb140c 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1414,9 +1414,13 @@ static int get_S2prot_indirect(CPUARMState *env, GetPhysAddrResult *result,
>                     PAGE_READ | PAGE_WRITE },
>       };
>   
> -    uint64_t pir = (env->cp15.scr_el3 & SCR_PIEN ? env->cp15.s2pir_el2 : 0);
> -    int s2pi = extract64(pir, pi_index * 4, 4);
> +    uint64_t pir = env->cp15.s2pir_el2;
> +    int s2pi;
>   
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_PIEN))
> +	pir = 0;
> +
> +    s2pi = extract64(pir, pi_index * 4, 4);
>       result->f.prot = perm_table[s2pi][2];
>       return perm_table[s2pi][s1_is_el0];
>   }
> 
> base-commit: 8f1d3b586f1265023f75ea9c227c35d463321aef

Braces required for the IF.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

