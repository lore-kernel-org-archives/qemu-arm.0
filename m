Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1959397njb;
        Mon, 14 Oct 2024 09:22:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVqgFTfywGL5if3k1dWNb5J/ZSC93B9njno7Qqhs4wb2aZ3F5vwf/lsnGZX0jNQ0avHMtlCdgbyRkX5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH13ng5U4wpKNgFV6SIVyLkayGU0iArBHD8pIw5fpgXOooGqHMCCTlxVFVXNWRlbIU3FO2A
X-Received: by 2002:a05:6214:568b:b0:6cc:1f0:d38a with SMTP id 6a1803df08f44-6cc01f0d4c7mr87769026d6.14.1728922937309;
        Mon, 14 Oct 2024 09:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728922937; cv=none;
        d=google.com; s=arc-20240605;
        b=U4HHnDG3/9vNjYOPyFo4ktYemgo3zH9OoZsgX3f/ME2k0KTEkHeKUDca4UCE9y5LdH
         dglwDlFbmGFGiOQUm+yF3l0lCnuxK9UQf5C8V9YVHVTFUB9g7oDGF9yd6p/oFB7zScd4
         vzgeIn9SXyL4lupryIPOAUCTBxLSXa7K6XkohrNPO8r0sTBNTAaiEkGbBCMomKw16pbk
         gWmJWZDnAlYYLw5UoKLEaZV1j7IQFOR3IIC6Ux85W8pZlKkLlXObf5cAVpF7LPXff6Cd
         t+Ix1WsZfQLLnz4RYR9IOFKFgCNKIyULDGImvvxd/0NTlmp2vpcLEIFQqNKxhIub/CUP
         MPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iKi8nhm8LRThhA7OaGrGE7Fu7+K48a8MyXrhua5J6u0=;
        fh=181x6H8wYIeVDpETOQDgihljuXg7dURw7J0UAqxh57I=;
        b=YMUuzHBFed0xQvTz749Y/Fil0tNPTMup5+IUYF9Jw38QfkgDT7dznl6K9FwHeXCamj
         6Sxw4w/IxNl6xzv1XJDbD5DgQPDAtIYULiksy7MY98Q+EX/VFVuPikSS4vdS/0kdVs5I
         90DFVDkKrPeyIVbNtfTOsYBvJ9LOOhFM+iJPcnSa5zqKHVoWTHF/2FAJiTxdtphHLCAH
         UOjKsQgvewCP4qkC58iS3ZWVdFWAiQIyf0b/SufiXrK304OgKvijKZnO1/7fxq0RrDcM
         QuMxNaC/u1Yb/3z67tofnbJiQklRtsLkZrkvJsKkCGJ0H2utwBFANJMAmgXim/rTLvAk
         KY6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgvkFTwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe8692526si105105676d6.342.2024.10.14.09.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 09:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgvkFTwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0NpF-0007Xt-AI; Mon, 14 Oct 2024 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0NpD-0007XS-PO
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:21:39 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0NpC-00080V-45
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:21:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-20c767a9c50so35212185ad.1
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728922896; x=1729527696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iKi8nhm8LRThhA7OaGrGE7Fu7+K48a8MyXrhua5J6u0=;
 b=JgvkFTwg6i6R70N/cW8IVgHfRVyYWEi1bLjZdvta96vy9H0OCPzgotyrRckvstDP/F
 kf860k8lBfxZCgrxAT5yboLHYf6Mn1RfMFL36K09ytpCQs43ZEOSDlmYgFcHmJ5iyueL
 aacu6Y8C3FrMnO+eZKF9tDbdZ4aDPD1VjVAplxqLGmZFqZzEsXTwvY2CP5OB74Yn2TeW
 5dX0ajdfOyf4ZP1qd5ZoFaW8P9DdQbf0VleWLtbqVrHt0BvQ0r+gV992QIsLw7NW88kb
 meO13K4pioury1A10GfGrvs283jLwBPRQKLwyXtGIiSbxQ9OizN9sj9rzdenKFWZjRm9
 FFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728922896; x=1729527696;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iKi8nhm8LRThhA7OaGrGE7Fu7+K48a8MyXrhua5J6u0=;
 b=CWgZO3GJaxOzlk91Ssz0hJEJCHGG6S/hzgYqplfFTZuqn+ZFv8hZ4RObsDg2DxsYJ7
 bfOdtL9Dn/q4nol5ZS9vhe7tclysIgcIH2t1zlk0ufMEAPwwts/h6CL38DUzutIUd87A
 gGW/Z6UJGtR67ECAFy3C5lwugVMRArSFs/nJv06+2+1dTGBEreL9zKiRiTlTQsHl8ckb
 z7DhOWj/0XJNlscG5aQpV6bVKGQzlpKDem4J/jG+ZlDmYIIpOQ2cGda4/6oupQqm5zDR
 LgXPN93Dgo329eJMxl5UlaYsL2HKUMMVk6FuBaJEWQ7t6e6Cn9os1CeVFOGDQaCaRnKS
 5XHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJL1Y5Xo0Q3w+5IrBTAOEbW/TQCBInV4j1+8ip086gyqp3j2cVf6zfs1UCB3QoKcUFxN5pi8HZ+g==@nongnu.org
X-Gm-Message-State: AOJu0YxMg5q1zyBGq4GE1b+RvDDZ2/xMt5ToIo4XohMDAsfbtbexNHWS
 67xKKyRHaqEerJq7LstUNIi4K2pBm7LCumMidkrNWh2Lr/hkwAsgs2k63pXfRhM=
X-Received: by 2002:a17:902:e742:b0:205:8275:768 with SMTP id
 d9443c01a7336-20cbb1a91a3mr106124455ad.21.1728922896359; 
 Mon, 14 Oct 2024 09:21:36 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c8c0f2272sm67658015ad.136.2024.10.14.09.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 09:21:35 -0700 (PDT)
Message-ID: <d429c462-22d8-4df8-9cf1-3ec0105357b0@linaro.org>
Date: Mon, 14 Oct 2024 09:21:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] arm: Add FEAT_XS's TLBI NXS variants
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
 <20241014-arm-feat-xs-v1-1-42bb714d6b11@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-1-42bb714d6b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: SwrAmZdqoVBF

On 10/14/24 03:48, Manos Pitsidianakis wrote:
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/arm/cpu-features.h |   5 +
>   target/arm/helper.c       | 366 +++++++++++++++++++++++++++-------------------
>   2 files changed, 218 insertions(+), 153 deletions(-)
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 04ce2818263e2c3b99c59940001b65302e1d26d2..b4dcd429c3540e18c44d3c30f82f030be45719f2 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -970,6 +970,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
>       return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
>   }
>   
> +static inline bool isar_feature_aa64_xs(const ARMISARegisters *id)
> +{
> +    return FIELD_SEX64(id->id_aa64isar1, ID_AA64ISAR1, XS) >= 0;
> +}
> +
>   /*
>    * Feature tests for "does this exist in either 32-bit or 64-bit?"
>    */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f77b40734f2db831254a0e4eb205751aec0d1e5..3104a2d1dab6e58bf454c75afd478ec6d5fe521f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5671,98 +5671,111 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>         .fgt = FGT_DCCISW,
>         .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
>       /* TLBI operations */
> -    { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
> +#define TLBI(name, opc0, opc1, crn, crm, opc2, access, accessfn, type, fgt, \
> +             writefn)                                                       \
> +{ name, .state = ARM_CP_STATE_AA64, opc0, opc1, crn, crm, opc2, access,     \
> +  accessfn, type, fgt, writefn },                                           \
> +{ name"NXS", .state = ARM_CP_STATE_AA64, opc0, opc1, crn + 1, crm, opc2,    \
> +   access, accessfn, type, fgt, writefn }

You cannot insert the NXS operations into the existing arrays.
They must be separate, so that they are registered only if FEAT_XS is present.

You can see this with the split between v8_cp_reginfo[] and tlbirange_reginfo[].

> @@ -9201,7 +9260,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                                  R_ID_AA64ISAR1_SB_MASK |
>                                  R_ID_AA64ISAR1_BF16_MASK |
>                                  R_ID_AA64ISAR1_DGH_MASK |
> -                               R_ID_AA64ISAR1_I8MM_MASK },
> +                               R_ID_AA64ISAR1_I8MM_MASK |
> +                               R_ID_AA64ISAR1_XS_MASK },

This is incorrect.  Here we are emulating

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm64/cpu-feature-registers.rst#n208

and XS is not present.  Nor should it be, since cache flushing is not something that 
userland may do.


r~
