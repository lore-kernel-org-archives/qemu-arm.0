Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp711540lfu;
        Wed, 6 Apr 2022 06:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFufge4IEFrDo6PFyc3m4903NYsFcjeNgtft0hVheuhClKThXq8AQQzklRjZVWE8as4bx5
X-Received: by 2002:a05:622a:1884:b0:2e1:b789:5b7a with SMTP id v4-20020a05622a188400b002e1b7895b7amr7671954qtc.362.1649252953749;
        Wed, 06 Apr 2022 06:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649252953; cv=none;
        d=google.com; s=arc-20160816;
        b=lk89Tz4gKPWVzMPT58vh3Jcyj71qZRopos1Zm8Zf2tOPMqE+S6LpFLFjGCLmFAemY2
         AKn1ZJm2oAZMoBkFp349SLcv6UGXIFhZ3p21XTnzXAbY1LLwdPeavTicPXwVJRMC+xS3
         Y65Qa8p0jtLJrVpGj59J98PGMrG/AR5WFcA/4cL2NARlbwV2Yyo58XYszropp9cxMYZF
         Sx/C7TnMKdc4GVl8vVvKQEqMfwgmfWykpfnaNFGhqsl8tsD0+0FyHQSbKLIE7I9l0q/u
         yy899jWwvOa/vueBUuV6MQ88j/qVC4hzfmy/bTKF3UtidAVmLd1sXErJjw6NR/npOshl
         aGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=CAjr5UyPClVVB9rHitcgjPuLfDMBN3rhab7fTyWNZTM=;
        b=AwHlgquplbiwIVlCeM9b/wHRpdv/kIrn9asnNE33hhaIbGnMLBCNVLQTQRofF551Of
         VXlU+BeHSFCke1mv6xf6xtQzqfDJWPHxg6xVzz+eZWdPtaTx53G1HYyqDhbU74f9hSHw
         FKq9yG7ZalX/9RPSGZemTCRYG7S/T2ks3jZeoNBrS26g/hIYM9rH+UVCZeUc6sPT4btu
         0XH6irv3wHrU4sHMwP30R2kJjVi+2Y47HxH/XRNdUWd9auuSH6E8gZMSo0CpibPFzLfN
         SjY1zOHbw9XTxlkjSkFFn9MVW6Dxkqc80fGsRERGvfw5L7kNHwuyqhUog8oHnh9S7Fbi
         4ocg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIvQ1gCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26-20020ac8469a000000b002e1fbf3c114si5882314qto.773.2022.04.06.06.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIvQ1gCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc625-0002w7-9d
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc61L-0001Vw-ES
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:48:27 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:37641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc61I-0002mh-JY
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:48:26 -0400
Received: by mail-qt1-x82b.google.com with SMTP id t19so4333486qtc.4
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CAjr5UyPClVVB9rHitcgjPuLfDMBN3rhab7fTyWNZTM=;
 b=OIvQ1gCypCsNtvI8e9btBTwwqymORL3G9mPKRHeQVc6fEGXwFsQZqnUwFD52rQW+BP
 m+TBCt2BbYjohBDuOiSjQGoyzrK7bJgXR7ohnxdbGOrgwDKmU8yI6/q44jXvn5ohyxLL
 LERpdbH7HPXwKZ/liElzPyEhQ2uq3o8qkfTp3ixSQMcKEd1dOKQBVgFPgaSYfQ068/yz
 eDP/fkUEAfIxCMAeDyvhey8HkJ+EoBG2uC4rPsHQPaQBIADTx4QnT0QhPAG7r0IFutNz
 w7oubGlPRcGR7JVhUu7r/VD2QbmQ3f8iklvSSy+3TTm8dNUXCet/8/b8e2ecmS830/Du
 /wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CAjr5UyPClVVB9rHitcgjPuLfDMBN3rhab7fTyWNZTM=;
 b=OV34Dyt/61hi3zN7UZxQUpQELd+jIf7/G3LqjvujqcXIfJo+gq+BX1Cq9Qjx8A6LLO
 tTGdeH8EvupObzwvRCxEQHvqrHYkU61EgM5QYXvXPQxDPHK2kF5/Zq02y8XQ4omePSRR
 YyMWRBl7J8R/SrTHwyqzKea9WRI5/nIuaEP+rOcWJjZdEM3GbRozGZf+cs8sYWTmh327
 eKVoSz60LXw+xpAvfL9QermZyTN70QPn3EQ6+UXOAZzc8tCM+ijwyMiGxHoJibBg/i8u
 niA0H7blFjz9Ko2atWptdI2QC0HG4Saeldh3DF3vbIy2CZNmPY3n7Fum6gppnFFUnVVg
 sX2g==
X-Gm-Message-State: AOAM532cq0ZZw5qAfAHhVUjL3We+fY6VRBb0U+pbXqBuxZLBP5LV84OI
 TheAUPC5+/Wj+q/QMEOixPnSoQ==
X-Received: by 2002:a05:622a:4d3:b0:2e1:bc11:3b97 with SMTP id
 q19-20020a05622a04d300b002e1bc113b97mr7434584qtx.189.1649252901933; 
 Wed, 06 Apr 2022 06:48:21 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm13559734qtw.9.2022.04.06.06.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:48:20 -0700 (PDT)
Message-ID: <22fc9253-794a-3822-36fb-0c2a6b9a66fd@linaro.org>
Date: Wed, 6 Apr 2022 08:48:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 07/18] hw/arm/exynos4210: Move
 exynos4210_init_board_irqs() into exynos4210.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z17wLvXf1ovo

On 4/4/22 10:46, Peter Maydell wrote:
> The function exynos4210_init_board_irqs() currently lives in
> exynos4210_gic.c, but it isn't really part of the exynos4210.gic
> device -- it is a function that implements (some of) the wiring up of
> interrupts between the SoC's GIC and combiner components.  This means
> it fits better in exynos4210.c, which is the SoC-level code.  Move it
> there. Similarly, exynos4210_git_irq() is used almost only in the
> SoC-level code, so move it too.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |   4 -
>   hw/arm/exynos4210.c         | 202 +++++++++++++++++++++++++++++++++++
>   hw/intc/exynos4210_gic.c    | 204 ------------------------------------
>   3 files changed, 202 insertions(+), 208 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
