Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp715562lfu;
        Wed, 6 Apr 2022 06:56:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYr+qw+Gwzx1/d+yo1El4zp2I8jFOGOWMH4Lz/xKHR82LR/777DVlmFovkxkmxobdJPvuN
X-Received: by 2002:ac8:7c4d:0:b0:2e1:fef5:e41f with SMTP id o13-20020ac87c4d000000b002e1fef5e41fmr7485819qtv.577.1649253378517;
        Wed, 06 Apr 2022 06:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253378; cv=none;
        d=google.com; s=arc-20160816;
        b=XsMtaO6mLrnyo19LKROPgk48AVHq8zrdNCOFnd2RIkREGHLkF4cxNppRSgOL+6cnZl
         HX/9NBwBNcCWAmGWMRzsFQDvDH72sa+6GQayfnuO0foa/jhy62x7caNJcuHmFGg+dQnR
         7unT0bt4zqjFXcoD0TSCGd4TSvLSqiiDyM674jtKHciPWlYhNYQozACcshP5co3oBO7s
         wQMAXCwVqRuzU4absR+HXmvyEcXyYRfGN06JQHlykimU7XS50UuumdzX+EfObCN/FPMg
         BJf9v7XGBcyJ7Uaj9N25ZsClUS09l7ZnQDND9DVUHn5fYneHNgVBaUDtzfx1RnJOalmv
         NZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uzpK1boCHcQcR5pc8ogFi5sT1PU+IpQ+ZQqdstika2Q=;
        b=r+FQrL1NW1aJkYCPtCt+wmXMq9OAZyQukjksRGMC78tf9WJsNdb8oJprdRj1XUsd1c
         trj5NX8X3tgBYezu2LZ4oTyzMD8JgKQJZrL2LCYU0uFpPXOX2hm/utQMOJYvdc/EYfah
         t6UWyVs0fhTZsGcUuKvBFPtRtIUcddmdf50ewfyzYSPzr9m9EoohkvPDhekyfT4s2Dmo
         Dd0W1fkxyUz0JI56DEtHdOBxqP0wW0LZG9O3bMOUs+MEve+ImttN+KKYMnjpOwjOz6+i
         1ltQ5sG7CqAJUb1aNAhO31Z4kHhwLDnNWcHW3D2rs0m5JAF7pJTldLiCRQoPg/3+h0cn
         ERUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UotZuXq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020ac848d2000000b002e1fbf3bf75si1606738qtr.358.2022.04.06.06.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UotZuXq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc68w-0003vx-09
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc68S-0003bS-Sj
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:55:49 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc68Q-0004lk-JX
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:55:47 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so2931526fac.10
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uzpK1boCHcQcR5pc8ogFi5sT1PU+IpQ+ZQqdstika2Q=;
 b=UotZuXq9aJNHzadIdnjyScBmVfb+Eu5m2h42ZUb/iUP2hsq4JvjrfybgMQHtiGnQ8+
 AdQDRgacI6FZlSaXTEaKXuAS+qf4oLS/pHVzT3b9DN7YqWki4gEQg3Xeszm/7o2WsSIK
 P/JfvXJ6pNSYe2G3uap5VCpmUepz5Z7Gkf4I9fjd41nG36qwv55CT+ejnHVzhApA/SSL
 Lh3RfBPJ0/6+E5IVTJoED53RkgZ8AJs+6WPGGEvR4NbhXV/KoIQ4rgTcMDArOTPEkPb2
 cp4Ec86ZAXyhSX9Zmd2jvsY4XE7pRLqJBhlA9PA19kXl+wSyy4smhTkp/QHOwttqOS+2
 sq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uzpK1boCHcQcR5pc8ogFi5sT1PU+IpQ+ZQqdstika2Q=;
 b=U5eiAR3OabJAn0sZDA6PTfLEsQxoFnvdgg8ZHsXACm++CAykV2JiW8NOyDRrRBzUzi
 SBn8OeKOcZZqMVFICEHq38X6h9Zo4WfVg+UIALzARL0vwBddlxrq+kI2RVvovLwuMNEV
 xRK6MUW2es6EZ3zPb6Z0tFtqXicBjM3pA04glIb4fflNDbrtiD1FlV9fy3VPqni6P5Gp
 4deJZmB0XdxXa91vpntSo5b+CKfCo1d756r5jPDjynEjO5JblmhHjeXC/qYL/oFXcIx/
 NETI76oQ8QMLluVcsJ9JinV/F+Emzz4pFPVZ9VZJb+9naxAQAj84JRX0swIUKe9zMuOs
 wlNA==
X-Gm-Message-State: AOAM533oEvAvnn9oGGZl5+Lvo4tYFQ4j4GR3H7JL11UyZPYHj3x2ZUIa
 1QRfbkPPSj4bcfm5jXhFvB082w==
X-Received: by 2002:a05:6870:d5a2:b0:de:f682:6c4d with SMTP id
 u34-20020a056870d5a200b000def6826c4dmr3832950oao.283.1649253342752; 
 Wed, 06 Apr 2022 06:55:42 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 z26-20020a9d62da000000b005b23f5488cdsm6781958otk.52.2022.04.06.06.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:55:41 -0700 (PDT)
Message-ID: <0556b3d1-56b8-1278-069e-42cdbd94fccb@linaro.org>
Date: Wed, 6 Apr 2022 08:55:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 12/18] hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in
 exynos4210_init_board_irqs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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
X-TUID: EcaMiOj5/fKV

On 4/4/22 10:46, Peter Maydell wrote:
> In exynos4210_init_board_irqs(), use the TYPE_SPLIT_IRQ device
> instead of qemu_irq_split().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  9 ++++++++
>   hw/arm/exynos4210.c         | 41 +++++++++++++++++++++++++++++--------
>   2 files changed, 42 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
