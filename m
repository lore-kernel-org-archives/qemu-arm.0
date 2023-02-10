Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1855520ejb;
        Fri, 10 Feb 2023 05:29:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9f6WWzqWkgWhgkaIbkO6gWDRi8CSJb9HY1IAMEY4gTg2uugisvWKat5QE7PEln1YWF+mXx
X-Received: by 2002:ac8:7d05:0:b0:3b6:2f3f:2713 with SMTP id g5-20020ac87d05000000b003b62f3f2713mr27091621qtb.25.1676035748460;
        Fri, 10 Feb 2023 05:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676035748; cv=none;
        d=google.com; s=arc-20160816;
        b=mJ2J31f+W/Qx76/0HGPzYuF6D+lTIYUgScs7p6xR7HKsJCJo+HH50fSEPoYH+cJsDG
         W+kz8uu6LQcMEJRVWenQvzAtWF/er7qAHvxg7qDTuPzBnKREfINpZ9TWFRvuHWg6nggW
         kzEqPPWHJDHpZ3MJLC63jLQKmKcS6BudplxciFQ6caFoPpmWSsc7MTF981JcIyC96NZQ
         xGKMAGNc2rYI0IAuQYACQURyFyTjJuadXSSb2xD4YG0mUZQdlX8fWbXqL2vyIyMtAyiJ
         sfbSG3NINGAOv5oU5Elhgz0VLfWrwcetp27dzpyo+v6VJgNWU+4GpAJ+VHtxZ78G4595
         DONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YD0SsNne1TI6VhFFbXP/zfcLWxYTwXyRY8QrhJ/xA68=;
        b=gSllExrRLHD0odMHze4z2PNJZKcQNRBHAMwJbBZJo6UkJAow/z3rFN/bYMwU6Pw7Im
         tIzUt6GQNJHijHGAoDhEFjPNo4F/jImPorY7PWy1ijhdjcLnTnEumx8Jh1Ch7HT1WKZG
         R3EpZCh5HeUM93VW/nSW6wFnqHMUyZDMFJ9e5OpgrjDlUAIg03kJRWTnmC8QaECqmJBW
         +XRrmkDjQES3gw6mlbzjlEba4wXVGB351t0Wtu3sYMH47aW1mGplmYERtUDBqACLg7xr
         G0tNnhYKbrdNcO/8S0oVI0gB4T8e9VOJ35eTiH0dzvbLMpOwSDP75q5DL5VTnIeo6wKC
         kB8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf7tQ226;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05622a050900b003b31886ab72si4077329qtx.747.2023.02.10.05.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 05:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf7tQ226;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQTSb-0000ny-Vx; Fri, 10 Feb 2023 08:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTSW-0000nZ-1e
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:29:00 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTSU-0005pT-EM
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:28:59 -0500
Received: by mail-pg1-x531.google.com with SMTP id 24so3693880pgt.7
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YD0SsNne1TI6VhFFbXP/zfcLWxYTwXyRY8QrhJ/xA68=;
 b=kf7tQ226E3R/2IQVb4KAZwCfENcMbrmMTf5BcLqnWS++p6RTfiK83Ju7O/b7gRx5sJ
 B3A4003himDm6A8R2RxyDFE69bnulLP9JOBXYdMFIKDxdI1S2XLZ4l/tkM1B7aJeS9tE
 6atkVf+X5cSWyShE8fhDFNYeEoaIT+ZeHQvU0D1k2xZt7VVTkT/JNEC0OxGnWpgMzOQg
 SBPmcgMm5ADoyjbcy+bI3iHPjZRtKr3c/OGegOmt1S4NNpVJ5Sez6W+X1Gn8bCdGxwAi
 vjn+DR1IOQn7+I2m0voSODU9EAmRnUJewl4mXqhfsTmzI4W8Bv748f/nzMQ6FX3AZYkX
 pfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YD0SsNne1TI6VhFFbXP/zfcLWxYTwXyRY8QrhJ/xA68=;
 b=gauwHZliMJJq+uMFztYrC1QQrAR6QYGLXV9jGJ+G2qmvitUKnFvVOv7No7MctMhGj/
 NSbN8/QZe4VFLAM8iwsxHn42hu1F5lyiIFGB//1S38q5fQetylxH7pFxOOAnKSgu4wbY
 YJC0jLPv2YHgIrpelJFlW5zva61mDBn2bnp05rVLSChEhgY8QtJFe+8tDuZEWeOWKle1
 iEqdNHIWSJ0CTVEJmQGBh/P9N6R1mT4fQvVgyDt7Rqu/++voOsKrLn9G3Va+0XynjHgT
 qglukGsdzwn54Q3VvY+FaH0XaQ8e5cZHlLk8ATDJJHSk4YJ5a46EyTuLTQghkAaddDJ5
 X8Xw==
X-Gm-Message-State: AO0yUKUAmTzzcgFmIPrY8Tryeb4icq3Xj2CCR49vuohLt1oWmAEuiTvC
 qoiY4FnZVTr4Q1JOIsOkhp+3dGuhQDL3E7ndtPWY/A==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3321358pfb.48.1676035733441; Fri, 10
 Feb 2023 05:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-18-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:28:42 +0000
Message-ID: <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
Subject: Re: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OuDXo1NA7juZ

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in which we failed to initialize
> the result attributes properly after the memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index eaa47f6b62..3205339957 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -32,12 +32,6 @@ typedef struct S1Translate {
>      void *out_host;
>  } S1Translate;
>
> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> -                               uint64_t address,
> -                               MMUAccessType access_type,
> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> -    __attribute__((nonnull));

The definition of the function doesn't have the __attribute__,
so if we drop this forward declaration we need to move the attribute.

> -
>  static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                        target_ulong address,
>                                        MMUAccessType access_type,
> @@ -2854,12 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>      cacheattrs1 = result->cacheattrs;
>      memset(result, 0, sizeof(*result));
>
> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> -        ret = get_phys_addr_pmsav8(env, ipa, access_type,
> -                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
> -    } else {
> -        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
> -    }
> +    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
>      fi->s2addr = ipa;
>
>      /* Combine the S1 and S2 perms.  */

Does this do the right thing for PMSAv8 ? The code in get_phys_addr_twostage
sets up various things in ptw based on s2walk_secure, which (per previous
patch) is not really well defined for PMSA.

thanks
-- PMM
