Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1993185lft;
        Sat, 2 Jul 2022 07:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vkdjP5QnqhPHF4vO4c1nXqJRjUvEINKlOu+m+gL2J0qG/EVSFkiNl+CjjZM5V8L7xl9rvB
X-Received: by 2002:a67:f88e:0:b0:354:2fd5:1869 with SMTP id h14-20020a67f88e000000b003542fd51869mr14066792vso.42.1656770772454;
        Sat, 02 Jul 2022 07:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656770772; cv=none;
        d=google.com; s=arc-20160816;
        b=qL45HnOfQkNZUZS6HAdNBS5P/WYAKNCSsNIJZX0x4ALGcQf9/eWvdOjQ8txmeDFG/U
         TvD06Zd6tGOFfQSPDdjjDkd7ifogDW9mCZB/RWYCvoHn2b3FjdXqYk/UtS14dtxYAmaL
         KkRvxhk8gO/9JT7nEVrSachKrD20bt5kMAVQoFazFr4z1rGPJg1sBcsq5ILkl2FfVopN
         xVe6MnWugEP/u3RApR3ip8KfgRhSl2Sua9lZrer3MoWA4VGwxnYTmh15GzlH7DHYGjoe
         mCvicv/jjqCfR70sX9ZayFO8NNBFeBS7Go2lVJ1B4YFyh7Re5oVdDt9IMcUd5KvNd19r
         f3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=VHxURPl/8MTYEkzx500mVJB3zx/ZKyGoJAp7kO85dvw=;
        b=TnJw+ZQo6JeQvGrXHYLVwBagAyY33fjIDVePPsItO2loUo6ts5Cckn8AO6Jb+Ogpta
         5z+XQvFcgTqHi+PK6VQc4lZ/SVQZWUPaV0Ozugn7YjkSk5J63AHcUEIcBzLMw3G43FnX
         lqJDHqJE9Dmorlgs3GNGPGsU+hyYBwawnQE5N4LCJWnFQqzjqzagaU2k//XntIcM3Ty/
         zG8zWJXYQldD5ayHPQ/lvw9ePENQ6kl6iznD37hYnrIYs9NRcSo106dNctTwwc6VwQPq
         xgMy1LGNttALqI/exponkhqRRyUyCiaZN0bnU3Hx1A5jT4QHSn4mxS3psxk+Pkb9HkKh
         FiiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VniVwjXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k193-20020a1fa1ca000000b0035d6cd87bfdsi7563690vke.79.2022.07.02.07.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Jul 2022 07:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VniVwjXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7dlD-0004yS-QX
	for alex.bennee@linaro.org; Sat, 02 Jul 2022 10:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dcr-0007ki-RX
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 09:57:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dcq-0000ef-6U
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 09:57:33 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so874986pjo.3
 for <qemu-arm@nongnu.org>; Sat, 02 Jul 2022 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=VHxURPl/8MTYEkzx500mVJB3zx/ZKyGoJAp7kO85dvw=;
 b=VniVwjXHmXeRvhRCRU0hIY8h9Zb1WukOT1pPHPI6I7Y44B5CyId28jr3YabEfSx5rU
 JAcIVaWShSjn48T+jE2PZR1+wVh7JZuzwDcuXehTRzHxzmjaVcBE5d1v1fmsz33vufFV
 nTXFVS+jyLqoqYNMwn+cCkH928A9Z0ttJZzzv9dGnpV/sglxmr0jh2xFGnIkw6mwZVKe
 mRld1kGfffI6BsSk0NIffANW6QAeZ6fpNhQGQxnQD+Qu0Fe7GEA9w8Kz7BB1V9M9VlhO
 mxP/lTV5kun47Zq6hatQH5I+pW22fck7mRjFWSvjRsnBE/8NxkrjGvYDDaWnMh8OocWT
 3jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VHxURPl/8MTYEkzx500mVJB3zx/ZKyGoJAp7kO85dvw=;
 b=DUm/1ywtyfoUxzhoe0m36gVGPcK3CdlG91uqbK3JwV9dHApINM2FL7PvBVl5OeVcos
 T8LsBLMk8WP1pyPvTCQ2/1oaicALOR2wXQygAO2UC5s3nqdjlYBt0ZM08GLk6bQJvxFA
 3iAbCYZ26ILoHTeENaiQQI76ASD30ChFab3WByR3DbFo5NflhlV/xPZlr6KNHxo4cNXz
 2DwEvIiJTt3uN0QcUq9Kf1eum6R19L05B+M/XOLI7YR3kka/WlvP6R9nkTVO3IZCfPMg
 9BCzhibm3/hPdPf8kWZumrPNvYPdwrbc54LzfV/2Wu32+C+9ihVWylOIEQ4Rg/GVy7Is
 VLgg==
X-Gm-Message-State: AJIora8xckYJ0iEahSOO2Nf2UsCgRyYdXzsY7r2sHfwWENoRUvnqFrUU
 L1j5eoAixMlFMKV8lAzaGqJUZA==
X-Received: by 2002:a17:903:234e:b0:16a:2d02:add7 with SMTP id
 c14-20020a170903234e00b0016a2d02add7mr24001362plh.10.1656770247618; 
 Sat, 02 Jul 2022 06:57:27 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w34-20020a17090a6ba500b001e34b5ed5a7sm6016799pjj.35.2022.07.02.06.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:57:25 -0700 (PDT)
Message-ID: <cb1d8ad9-ac6c-7f2f-3a93-49ebc0ee0faa@linaro.org>
Date: Sat, 2 Jul 2022 19:27:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] target/arm: Move define_debug_regs() to debug_helper.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-3-peter.maydell@linaro.org>
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
X-TUID: mRhDeSO1JQrV

On 7/1/22 01:11, Peter Maydell wrote:
> The target/arm/helper.c file is very long and is a grabbag of all
> kinds of functionality.  We have already a debug_helper.c which has
> code for implementing architectural debug.  Move the code which
> defines the debug-related system registers out to this file also.
> This affects the define_debug_regs() function and the various
> functions and arrays which are used only by it.
> 
> The functions raw_write() and arm_mdcr_el2_eff() and
> define_debug_regs() now need to be global rather than local to
> helper.c; everything else is pure code movement.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h       |   3 +
>   target/arm/internals.h    |   9 +
>   target/arm/debug_helper.c | 525 +++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c       | 531 +-------------------------------------
>   4 files changed, 538 insertions(+), 530 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
