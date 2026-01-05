Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B74CD040C
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 21:33:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcsCq-0007Dy-FS; Mon, 05 Jan 2026 16:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vcsCd-00075r-UW
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 16:33:29 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vcsCc-0003Kk-EC
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 16:33:27 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a081c163b0so3387795ad.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 13:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767648805; x=1768253605; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QaRoVS0sZmfqN3jLRtmuEp8o9Uz2j0VWCn7U6l8V5Jo=;
 b=dc3AaN7epaj3fbtv+wNVI59SbPhWiVQ7K5J/DN3GMknt+n9MFhiMpCpDmxnpd36B9g
 Hs56cxsYrp4+bluZAQGDipaTnrqdmSnfspm3fkWh56x0luJAnOL7lUuR8bYhbgS+gdQC
 ou+EWvdhnOE5HjWcVOH+Swd7Vmw/jLIg5s3x7aj1U2L2UtJzsFafTDpH+4ULmIZEg8+w
 U0sbjUJll9d8IuC5SmI1T4CV812ncB/K20p8pjP8GQRSZyoCeoBhd6dX2LKx/ZVrZuZK
 0bc+dvkmkoiF/j1NIqvZRH8wYsrVih9/bwvX5RfOxl/P/ClIOX+PSzxyq+DGpLc7zK8c
 55sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767648805; x=1768253605;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaRoVS0sZmfqN3jLRtmuEp8o9Uz2j0VWCn7U6l8V5Jo=;
 b=kyOgm1+a9A5r7ylJfMI2zKbBnF8hWNZ6W3cRPMTy1SgrMeGGrwM5vFKBWiGLNBXQjf
 bQldFbqOo7pa1P8Ewkcwrj7Ta81f1gIJGzosQS7zYYn2jm4RjkHNCiPmWol2dSmGyTMZ
 Z2DcJ8gSpG+tRKveTl0Wup4awAAQx/K8nCgB8gdDpkgHy06j2Rpzs1nvuax+MUcIVUZb
 luE971stbrZVLcKL9cnuIJLXlAa5qqfe7zp6g12PqkkqjtWqmqTWZkNq5FEzm+8u1xvg
 DhTwfxECgIH0OoJ9AUY5uRWgw6K2mgnehqUS9wdBeFaBDbkbtcB9YfWezTLZlZ1QLR4m
 96ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv5a0cGBk8lYn0la1h8b+j0vpyGVrSiczvDkU2U7wgAs8djpC778tKvWpw1iatjyG8BqsQC9chTA==@nongnu.org
X-Gm-Message-State: AOJu0YzPGDn6QBMbNuEI7y+2K8Loit4TJdDZDcb4xPlTn6HRQeQUYYw8
 lm30pTBMvUCcnJHSxtO516RVv/gbU5Oy+AFvOpiiuxdGHc71kamFTOzTRw7CeCnBEqg=
X-Gm-Gg: AY/fxX4CH83fghKCUD78fr4AG/AD7QDjJnK8AjJruaZQIOZ+nj/azmayIXAkpDqYLOr
 w9CySickYEjWZyP+TIEK45SQChn1yVZD2un9cYyspXnlWdVyPfwRGi0NFZvao+M4WwZp5euenQD
 FcvYWpieTir0jk2ZSyGtPr4CczjK8iROGWayw1Fx9bLUjchvLiwijydrpmklFKddsMDVO58hbPV
 K3zcB7c9AV2sz02AhSHFJfPENMm9fdrk1bs/fojNPiuBKTLmiaa2IX1+5UXvm4dXIqVGXS92rep
 KxNj7uP+ZluJAH5r58+PNwBPO5tUum8SIN8H/yB20zpU3INGWc2yr6vwzSTb+Co2QC2p/G/0TZA
 aq0RrGbz2tK5/JZRsqja81EzMCQwe68ookVWQfC7TtaU0f2l0Q7/KrkjLzvppliAm+9PhNtDliJ
 3NLc1aG7yf++QayyaLk/+2xro6ughFtg==
X-Google-Smtp-Source: AGHT+IGWHTXoXkpcOI/OdGXuw2mE9tqFjWdhBWc5BaAnWFHWJE0s0HyAzYbOc8qxXwpYIQ7mIZWDeA==
X-Received: by 2002:a17:902:c403:b0:2a0:c1ed:c8c2 with SMTP id
 d9443c01a7336-2a3e2d36061mr8961905ad.55.1767648804719; 
 Mon, 05 Jan 2026 13:33:24 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cbf28f6cdsm279764a12.6.2026.01.05.13.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 13:33:24 -0800 (PST)
Message-ID: <fc94c263-81eb-4013-9fa1-5259b37e3d76@linaro.org>
Date: Tue, 6 Jan 2026 08:33:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/12] target/arm: add TCSO bitmasks to SCTLR
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
 <20260105-feat-mte4-v3-2-86a0d99ef2e4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260105-feat-mte4-v3-2-86a0d99ef2e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/6/26 05:14, Gabriel Brookman wrote:
> These are the bitmasks used to control the FEAT_MTE_STORE_ONLY feature.
> They are now named and setting these fields of SCTLR is ignored if MTE
> or MTE4 is disabled, as per convention.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/cpu-features.h |  5 +++++
>   target/arm/cpu.h          |  2 ++
>   target/arm/helper.c       | 11 +++++++++--
>   3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 48009b5a66..3473787ab8 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1144,6 +1144,11 @@ static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
>       return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) == 1;
>   }
>   
> +static inline bool isar_feature_aa64_mte4(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEFAR) == 1;
> +}

There is no ID register field for FEAT_MTE4.

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 263ca29d92..4086423b6f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3364,10 +3364,17 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>   
>       if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
>           if (ri->opc1 == 6) { /* SCTLR_EL3 */
> -            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
> +            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA | SCTLR_TCSO);
>           } else {
>               value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
> -                       SCTLR_ATA0 | SCTLR_ATA);
> +                       SCTLR_ATA0 | SCTLR_ATA | SCTLR_TCSO | SCTLR_TCSO0);
> +        }
> +    } else if (ri->state == ARM_CP_STATE_AA64
> +            && !cpu_isar_feature(aa64_mte4, cpu)) { /* mte but not mte4 */
> +        if (ri->opc1 == 6) { /* SCTLR_EL3 */
> +            value &= ~SCTLR_TCSO;
> +        } else {
> +            value &= ~(SCTLR_TCSO | SCTLR_TCSO0);
>           }

(1) Better to refactor to eliminate duplicate checks.
(2) These bits are explicitly vs FEAT_MTE_STORE_ONLY not FEAT_MTE4.

Thus

     if (ri->state == ARM_CP_STATE_AA64) {
         if (!cpu_isar_feature(aa64_mte, cpu)) {
             ...
         } else if (!cpu_isar_feature(aa64_mte_store_only, cpu)) {
             ...
         }
     }


r~

