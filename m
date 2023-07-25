Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp171017ejb;
        Tue, 25 Jul 2023 16:33:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGXeKSnfZ0ZdWJ+AxG0acc45ApY70wX0P6XWyq6A/Ai6k4fFsqjUe9KLiBLv4YF5iEOL9t+
X-Received: by 2002:ac8:7fcb:0:b0:403:b395:b450 with SMTP id b11-20020ac87fcb000000b00403b395b450mr469869qtk.2.1690327984417;
        Tue, 25 Jul 2023 16:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690327984; cv=none;
        d=google.com; s=arc-20160816;
        b=B2W2fsCnnRJvSW+fR+QbeLg1hBNcGrldwbWsQgHnmrC3yeMVBCLpDIhpMfo22/d3vm
         bQqtWrfNX9KX+9N3x3cSkAJGT+07EDhnDQDt9HIwO1HQTe5IBaC8K2ndwwPkfrLwjr5O
         Vj4m1cPNPPxZaJk1PsUENBUwRdl2pG/pp4QHZkRd5VuE0734tIThPjVATTqHPGPiNq5v
         kYJHjdBRGM0D3AlxJiybqhT5RaqpDQiYqlj63GAsRoGwNr82fChRFSfUro1U9U8tr/Ow
         7WzlTlrFuHRwu+dO2mmx47ZF0aXAnADYpyOQ57LJq+8LYqde+6oxwtKipMNQbwTbfvMf
         uO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=XuPJ5j43ZvoOb0KGdDgasUb5Fn8Kyj/lPbEODJqGnd0=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=Gr4iPoDXuYsSf+jfnQVwzmya2BK9jmDBUvWl+aK6/VIE9mWM7hxrNC3NF6MtbzOd0U
         1k/ADNWTq+Yq0VTYu8a5JFqtxf2BIDVqzgjcnAmG2FvbwxoUzXjlFs4dJ1u+nlDkpiW0
         YIXnEo/CAPiq0jyvsyRS3mSc8ktMAXum94PPy8nBKtVJ+gjwy4RQx8T4DHZgLfJHhzDJ
         fumCwFXVMNsz4mZtz8fecZyK/fYzNy8ETTYZa2x+mW5nu3asw9Uwf8a23CRY7lmp3QMM
         jL1Nq8t8IsoYDqkowhJS8Toa9vu7DijHc6azhqG1Gk76J8/Ghne7b4sFmdyPuohA4HHL
         8KmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCk1kHSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3-20020ac85b43000000b004069840f1a0si3546133qtw.290.2023.07.25.16.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 16:33:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCk1kHSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qORW6-0001ww-Ja; Tue, 25 Jul 2023 19:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qORW4-0001w8-PR
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 19:32:32 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qORW3-0007LS-5C
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 19:32:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-553ad54d3c6so3088605a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 16:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690327949; x=1690932749;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XuPJ5j43ZvoOb0KGdDgasUb5Fn8Kyj/lPbEODJqGnd0=;
 b=cCk1kHSv950WrZHcovDUNvFm7mZcxA9cGbj8DZOlr1wygfH36It/O2i9dzMXb6GKO4
 dXohLrJum1vrqfLJHZ7G6/4QMK8xn1YzabNGbUwgCO9PCX5T7dre5R/H3539kJg4KZb9
 2WCY3R65b3KlQz/kYo8uNUGwyNmqjsqfZJvimXOOCv90bewWclSv2/kOLDIEeCySd3sG
 gRHaOmKGi1lrP8zY5UOANwHbatry2AGSF4O0eZupiU1H33oq85AiLXCiX0bW5UvDTmp2
 +KUpKnZArfAtiamOwYVkncOmfZfvVAOTX1uU5DfrwuY4ILFTwMdUX+dHder7ZvCnByjw
 njWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690327949; x=1690932749;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XuPJ5j43ZvoOb0KGdDgasUb5Fn8Kyj/lPbEODJqGnd0=;
 b=PM9b5UC8ThZEn0q1kcAHi802fh0i6fjCL3mH9SJ59nWP2TKEqh1eORYrQ5y305HKHU
 37TjoR/GYQatRt+VtOWnF102C4yfMsMpWFvClC4YTjHOsKSu24+hQlLZcmg1PzavWV5q
 pvj6HCW9ptZekPheRkkQ+6lIli4yu6fiJgvTOLYb8KuhbDZihST2lYLwAgQzt41zHAK+
 cEmHdm+0KTCB+UMFJIo9vmUnv5nHiFC8WQHkWsSpyt8FzkHS6khFpw2KyXHVzkviJ+QU
 wK5g3X9MfIrYrJhjfE5UOZzsT8DoeEhvZ9ykxi62T/Wv0ioo6WTrSB+a+WS3Nsz4b4b5
 WLiQ==
X-Gm-Message-State: ABy/qLZPcGVC7j6S9CBAcI6NuLfFllHoo03e/z4Ub3R6pAsvKSqq/lQt
 hEU8PV3Fwn4nipAvW9z5SDEBMQ==
X-Received: by 2002:a17:90a:2ac3:b0:25c:571:44bc with SMTP id
 i3-20020a17090a2ac300b0025c057144bcmr485522pjg.28.1690327949165; 
 Tue, 25 Jul 2023 16:32:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:a083:fa5e:b91b:bcc6?
 ([2602:ae:1598:4c01:a083:fa5e:b91b:bcc6])
 by smtp.gmail.com with ESMTPSA id
 br7-20020a17090b0f0700b00267bb769652sm111209pjb.6.2023.07.25.16.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 16:32:28 -0700 (PDT)
Message-ID: <1bbf8dfe-6b92-6a3e-8d0d-98eed2a9844a@linaro.org>
Date: Tue, 25 Jul 2023 16:32:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.2 1/3] target/arm: Do all "ARM_FEATURE_X implies Y"
 checks in post_init
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
 <20230724174335.2150499-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230724174335.2150499-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: EOnxDFFnQRKl

On 7/24/23 10:43, Peter Maydell wrote:
> Where architecturally one ARM_FEATURE_X flag implies another
> ARM_FEATURE_Y, we allow the CPU init function to only set X, and then
> set Y for it.  Currently we do this in two places -- we set a few
> flags in arm_cpu_post_init() because we need them to decide which
> properties to create on the CPU object, and then we do the rest in
> arm_cpu_realizefn().  However, this is fragile, because it's easy to
> add a new property and not notice that this means that an X-implies-Y
> check now has to move from realize to post-init.
> 
> As a specific example, the pmsav7-dregion property is conditional
> on ARM_FEATURE_PMSA && ARM_FEATURE_V7, which means it won't appear
> on the Cortex-M33 and -M55, because they set ARM_FEATURE_V8 and
> rely on V8-implies-V7, which doesn't happen until the realizefn.
> 
> Move all of these X-implies-Y checks into a new function, which
> we call at the top of arm_cpu_post_init(), so the feature bits
> are available at that point.
> 
> This does now give us the reverse issue, that if there's a feature
> bit which is enabled or disabled by the setting of a property then
> then X-implies-Y features that are dependent on that property need to
> be in realize, not in this new function.  But the only one of those
> is the "EL3 implies VBAR" which is already in the right place, so
> putting things this way round seems better to me.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 176 +++++++++++++++++++++++++----------------------
>   1 file changed, 94 insertions(+), 82 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 69e2bde3c2d..58301c4b7d8 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1356,17 +1356,105 @@ unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
>         NANOSECONDS_PER_SECOND / cpu->gt_cntfrq_hz : 1;
>   }
>   
> +static void arm_cpu_propagate_feature_implications(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    bool no_aa32 = false;
> +    /*
> +     * Some features automatically imply others: set the feature

Spacing after local vars.

> +    if (arm_feature(env, ARM_FEATURE_V7VE)) {
> +        /* v7 Virtualization Extensions. In real hardware this implies

Should fix the comment formatting.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I thought I had tried this myself at some point, and ran into a problem.  But I can't 
recall the specifics now.


r~
