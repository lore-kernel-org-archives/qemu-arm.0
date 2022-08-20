Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp60331ejc;
        Sat, 20 Aug 2022 10:33:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Ymo8e8VP7gkeHu3HvKosbFo4KQ20V5Chhi7+TzAra54Nw175wMNk12bBLbbms98Uy1LhZ
X-Received: by 2002:a05:622a:2c2:b0:343:645f:1601 with SMTP id a2-20020a05622a02c200b00343645f1601mr10405585qtx.349.1661016834400;
        Sat, 20 Aug 2022 10:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661016834; cv=none;
        d=google.com; s=arc-20160816;
        b=LSOQlAH1+WY8ssX/oSGqt+QG7sCig3693RDUMTvBtKg/rvt0dN4uXAn4/hfs8E74Jl
         o5DX/QNldwsmBCK4+4lsfSke1GDUHmczBMfDEdbdRfv3boYTX2v4/PcVzs0l4EyHT60g
         fcIE6CFauIzAi4tZRAglXey46C9+rQQvDMezNj0izQom+a3/FzWjWXN0vjZOC4bTKGTg
         7HCyux35bkTdaXY2BZStdTln0HhJK7SvVzhHazWqUAVy0D8WmZSTQqdkamlS7zeLYnPA
         DtApcdXG10xT3uhCfyPuli1Fc0HoMsd0KPDgEMRHoMCo6o+AKMDw/jiBYMKwPah0nlit
         /SEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kmvdbYYamAsV1AMc7z8OVkGEKo9ut99qosO5veM/fi0=;
        b=PQU9S0X75PiP/IEad0QrJKr21PaN4T2siiYJZzKTFTDqSS3yl2FQP4zLGs0l6PSBjo
         HI8P9Ss+JHLh08jG6CvxWvj+BSR73JITZECoWR9KRCvWMMaDrxBQpRysi3IVmgLMEGcp
         rR1lPvGDh+4YmhcCy88JE/CNkHREknEjGqdnRSiSayoEAkmGKagiLG+oebfyA+XZ4am4
         xWwBlU4jets2c4z3kyO1lrc7ZUCXyBElUJssWcb6uYm5QDORTSJsq21LDD2OxHd+53wy
         38lFU5P/1/D5BcrilRKdTfmfYMq4eB+fFFU7ZuDynBfjoDxV5YrNTE2Yej16Euc7xU9G
         k/Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=saXwsJ3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm20-20020a05622a251400b00344569472fbsi3058836qtb.7.2022.08.20.10.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Aug 2022 10:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=saXwsJ3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPSM5-0007XP-Uz
	for alex.bennee@linaro.org; Sat, 20 Aug 2022 13:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPSLv-0007X0-Cw
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 13:33:43 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPSLt-0003hI-SI
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 13:33:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso7615112pjj.4
 for <qemu-arm@nongnu.org>; Sat, 20 Aug 2022 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kmvdbYYamAsV1AMc7z8OVkGEKo9ut99qosO5veM/fi0=;
 b=saXwsJ3Pm40FxQa/+97+45lAMiiFLG2hKwkdzdWX9/BMDs/L2ILUrETvXHVCmiG43m
 or55CldV66mmYcypm50IjAaHL9PKDucIK6zv7QrEjr5A9PaXXIzTl7DPc9h1zqTP4tUP
 W+SlUN7x9IQPR1hM8wcNcN335oexudSYi/hhUK+w9khEnx8PaX/brjh6G47k5+DvWEdp
 7f3Dk57RHg3pie4P5Ncsh/DoMXZiJFIXXQvF8xqAWeYHwNEsp6vQKnWSKxEfXZ+Iv1x0
 +zhS9rq1oa/+/W38Y/FgTHNZrF7BsPEzyIxLDhWKzGuanr5BJZMj5FzaXF+oAdm2RR1n
 JU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kmvdbYYamAsV1AMc7z8OVkGEKo9ut99qosO5veM/fi0=;
 b=EpndMs+4Tfp2drxfGNO02xHKrZuJ7Zng31doovKhE0shuKsIyYGZpwiKQdTiia7gv9
 tB3nWWAOOnikeiCZ/KQp7fKvWDTXhVjnsb2ZS7MVAzzBR40ShGCMB/4S6D3fySAxdJTU
 zAiURAZ6fK7BKNIx+IfWt4NGQCBoDNqGtqKRZYj31UAzim6VT9nHWkNuM3QHDaGPOJCs
 WoIxWBA515GNJFyLS+uos9/hQmGnU5kV4ljHT4jPKeKBfHw/ktQxBoOJTe1wk0gXBaN5
 vI6LLX74uFhptFrsyVBqXrCyMLIMoVyxAtRVuz5xR/cF74V/whKot/jX6oLYlU7GiI6y
 3PvQ==
X-Gm-Message-State: ACgBeo12upPLCT635qOeAUqroE5WAR6dpnqUQiP5Fm0cqehFdMkskq7G
 J+huzZ9vcN4JMZAIBSxUB5qfYA==
X-Received: by 2002:a17:90b:4b46:b0:1fa:f4a7:73d5 with SMTP id
 mi6-20020a17090b4b4600b001faf4a773d5mr6761523pjb.108.1661016819939; 
 Sat, 20 Aug 2022 10:33:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:142b:b2fd:5c12:7cf3?
 ([2602:47:d49d:ec01:142b:b2fd:5c12:7cf3])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a635550000000b004299489dd2bsm4599925pgm.8.2022.08.20.10.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 10:33:39 -0700 (PDT)
Message-ID: <949fb9c0-8e7f-d0bd-dbfa-e76067b867d8@linaro.org>
Date: Sat, 20 Aug 2022 10:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dZqjkdgnPfZQ

On 8/11/22 10:16, Peter Maydell wrote:
> FEAT_PMUv3p5 introduces new bits MDCR_EL2.HCCD and MDCR_EL3.SCCD,
> which disable the cycle counter from counting at EL2 and EL3.
> Add the code to support these bits.

While HCCD is v3p5, it seems MCCD (typo above) is v3p7.

> +    if (counter == 31) {
> +        /*
> +         * The cycle counter defaults to running. PMCR.DP says "disable
> +         * the cycle counter when event counting is prohibited".
> +         * Some MDCR bits disable the cycle counter specifically.
> +         */
> +        prohibited = prohibited && env->cp15.c9_pmcr & PMCRDP;
> +        if (cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
> +            if (el == 3) {
> +                prohibited = prohibited || (env->cp15.mdcr_el3 & MDCR_MCCD);
> +            } else if (el == 2) {
> +                prohibited = prohibited || (mdcr_el2 & MDCR_HCCD);
> +            }

But modulo the feature test, the behaviour looks right.


r~
