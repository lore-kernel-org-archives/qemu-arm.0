Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2012165ejy;
        Tue, 20 Sep 2022 13:12:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53GQpvVpZ5hcnQE1dLU+ehDj1esg0WejV0/yCk9TfOMaF9IFCD/67fnpVIgjFaNtPE851h
X-Received: by 2002:a05:6214:2528:b0:4ad:1edb:639d with SMTP id gg8-20020a056214252800b004ad1edb639dmr15869182qvb.122.1663704725282;
        Tue, 20 Sep 2022 13:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663704725; cv=none;
        d=google.com; s=arc-20160816;
        b=Oo9JK4n3VemoTan3G6XSzZgyNY5UTyodGz0QUPftrdoN+mat3telIQteZeT1caPorz
         Q9HpdGaRZGfUKOKKAluZQQrIyPVxaVXxt2wXBZtR85kyX+2fDoHI+JgqYkPQ6pgekBlk
         w5yWrcgFf/ZCPUgJE2i3rDpq6QOq52aVX9QeNWjNO5kM/lijCmHuaZt8X/+lApT7NLsn
         a1STsHNgT6qXmFk5fnmk52r9121i4xP5s2RA4+vkCwmieuAwuJuclqGUUOaJbY6abYUz
         bt1C1hDk5tNWRvYDnOmtBgT5UPukKgd3SOap0TtWErsRwsGcA5GtxtIu25AGqUSEvVzP
         0U0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0an74z04NubzjOxfL5+CrsBXzEo50KLSikcsmtWgupI=;
        b=iHhRBtO7F/9lJQ8NvIKO+9v9iHz67DvqhTraLjGY3fmUncswybaJsh+DlRxVCS1MOt
         mYYhF6JL5QdOpFeeANaotGH3fxcb/8oRcDDIv9OE+fMhXLyopUEo9/5KcztSKEDc1bdt
         VST5620br3EleiePmAOb5wNFCHVRSEIQXs7aoQqqtlNjrGN1kF3BE9wrW/3FBNUe0yjI
         6SrJpsXINWNXTAsXnC3XH1Mdfa6F2xKTN/ZaT+wKXcW6yn+xW/Y62UW1PL75wBccccAg
         O1wEOsM14Z1umlQSH19RCe1TyDFHasd2dHEWbZKHBUHsLumkpDj7Om4v1UkgIrD0Lj6L
         iJpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yn70GxlE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05621419ea00b004ad6dd8ed19si124699qvc.238.2022.09.20.13.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yn70GxlE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oajbA-0002vA-Pp
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafY7-00006b-Uh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:52:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafY6-0003t5-32
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:52:39 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bj12so7139769ejb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0an74z04NubzjOxfL5+CrsBXzEo50KLSikcsmtWgupI=;
 b=yn70GxlE6lqSg75z1nfjTzm3vcKxRjrtIVNqQZHQnpxvJoKTqCKos32EbhLBr5QIvX
 LMfwQc8M9UtXLPrAGBqk5o/2njTuAKD9AilyWBmAvUOc6bQ/+/dql6FKQaNJdBbnHzby
 td88lQul4jDj/RO2MBr/Pno583Rt6hG4sncxatoB2CzvnWF2xlNwt6AHtVMCdGXn6npg
 r68XxZG1F7e+6sZEQA8plshnmFllySDNX0IGW1Xf9IUCWcqskOWJUkslX3SGEO4DVdZf
 8GrjPMdWVkUvZBIN2P1EEHSPWr34T8EjSFeFcNzZS4laEacZZ2IjZHyUcuZnfu/aTT+/
 PneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0an74z04NubzjOxfL5+CrsBXzEo50KLSikcsmtWgupI=;
 b=FFGFXCTrinZbknDRFvV2dETWkUeY5Cs1RjgBPo4ouZCnnP47pDEXCokD8PUmz4DWn3
 8BDNfRTAk6el7gC02mcBhTCivwTtNKjd9kOzQGttwiSgbK2RW7M7xbIfEtA8oOIC9lmd
 kyLJcvITgUJE156YjEBn5YygKS6IsQSLVraJI0P4SBv3GKLki6jbXjbb+VuCg9nz/z61
 jbmP/GZLggtE7+V/1tTLi7mFygrKdGqEk7TToOjKyy87MiUFGEOgRr5e7icO/36TFv1A
 TYrmE8K6PKEc4Kx2yP5EqTa/Ch01lQXSTeSUD3LRXl8yrkvKgxrnVeRqYH2X1Waw9Zc2
 mcTQ==
X-Gm-Message-State: ACrzQf1/IrNLctv5bTgnzKRPxYuinD9BgYpaTmLMdCqPztbWsiVeZsAr
 GoHZRzlDOZCQNUKDunzekJiXcy6g34ZMP9Rzx9/a8Q==
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16763072ejc.504.1663689156499; Tue, 20
 Sep 2022 08:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-30-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:52:24 +0100
Message-ID: <CAFEAcA_ZTxY7vW+9kG3LYjPJKOsk+hzeysg1n6E-PWy-zNtg8w@mail.gmail.com>
Subject: Re: [PATCH v2 29/66] target/arm: Introduce arm_hcr_el2_eff_secstate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: icxbZqTSKJa+

On Mon, 22 Aug 2022 at 17:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For page walking, we may require HCR for a security state
> that is not "current".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 20 +++++++++++++-------
>  target/arm/helper.c | 11 ++++++++---
>  2 files changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index cea2121f67..a08e546de4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2401,15 +2401,15 @@ static inline bool arm_is_secure(CPUARMState *env)
>   * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
>   * This corresponds to the pseudocode EL2Enabled()
>   */
> +static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
> +{
> +    return (arm_feature(env, ARM_FEATURE_EL2)
> +            && (!secure || (env->cp15.scr_el3 & SCR_EEL2)));

This doesn't need the outermost set of ().

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
