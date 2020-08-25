Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp96913lfc;
        Tue, 25 Aug 2020 11:48:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXwxoF/4yGOdaWilkXx+NqTM67D0wK/vX23prsX1NVoUZmPM1rxWM6OfNYnpqS7bYiZAr0
X-Received: by 2002:a25:d8c3:: with SMTP id p186mr17629065ybg.50.1598381323398;
        Tue, 25 Aug 2020 11:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598381323; cv=none;
        d=google.com; s=arc-20160816;
        b=i+CRpLKZT4kekWTn1UMgZeliLif1+edx/JRN48JCV/S269xMFZQlVCbJ2vPpckaRPd
         95cwZz2bWTvqoUrbDgbMBV70GGMUFxx5e0YCgRFTC5DFIoR7jnjB3X8C+yws0NI3egXe
         cPhuLa9Jt2+PMC3OzlnzbQEQJDfUw74X3hXwHo/Xy3N5fXBgFITl8fOpoHfC2JZG8MOn
         63KqFYqFzf/ZcqzlnIqBu9QRDMZiyuCBf64KFxLdcbWbti8NjGHEFuRxu6/tIsLktGIg
         f3pE94qmdK5UOFR5zBMS55HKpLyJVZuSNeyyh2j31x9rcMIqzLhXJujFX3cIOlrN4nHi
         sq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=isF5Woq5aSdLBbbtD2StJ3KXo+eex49HUq9vSAe/TM4=;
        b=UUl654IkKq8BhjpUwY5/XZDnziRzjdDQr1CtGmu88UT+Pb4avu5hRAvmtXqgd4AVhQ
         omX3GLYeuQrLtRaloK2sxTiBxCVyKj0bxNISLsmsUTDfq2xpGMmaHKnCdeaVG8iemhQN
         fdF/G6faTZOUe6ZjEGlEBPdGIFrJeA9d9lj8I2SoSW+sYCy/HxSyf6/38Jb/QNqLFWji
         zYTaF7ZuReMpEstaw5PNwQI6YPzMbkAhVktTp7gKDoeHX/ZNTKS2LPBPdT0g7/C7ymOp
         GJQEwQZVX8mQegcJZ8eV8QdzNx/fPDvFM3Lymr0OJAz39nh7Ir5u9XiZygAwXRXjUE8v
         5Gsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pgCApJ4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si2494519ybd.491.2020.08.25.11.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pgCApJ4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdzu-0006gF-QV
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdzk-0006dv-Gr
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:48:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdzi-0001gV-Um
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:48:32 -0400
Received: by mail-pg1-x542.google.com with SMTP id v15so7443721pgh.6
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=isF5Woq5aSdLBbbtD2StJ3KXo+eex49HUq9vSAe/TM4=;
 b=pgCApJ4VXdPmQYkSb95qkUJAa3pHtD8fqLnV5jDScSUipH3hYhWb5Uhk5fFoqo2sG4
 m4/81qNJ3g9Vo4yzUme0lKFLqH7SIR4DpHFCh2R/5bnMtgrhPn/Y+iPuYdio5kYe4ATM
 tJ0BYluhyPVauN0zPrjmgs3+20A2YwWWIY+J3IklYg+EerOREms7nobUx031q0KQ/k2c
 eC30ps1y1DPdd9RtQgYXBHFlNn2qiFNnBTg9d1FEb3xfA+/KkHN2e0MiIucXF/IeOnS+
 yeirAQasQwYgU82qNzn+mvPSDSZyMjcyOFQ25phyeD1+CDZ4joHet3jflcmqlJiH/JKM
 d2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=isF5Woq5aSdLBbbtD2StJ3KXo+eex49HUq9vSAe/TM4=;
 b=K0RtdXLPKqCMVz6XdqT7TPPk1v5JHkW3XhJH9X8pFS+jkBKy03ec8l1mUjurJ1uIC5
 tD32fI2FJBhk7bnplzO7+ROkB3Kn+2mxLCcqGZfxdwCEvbFoJ0wezOVgxXQ5RUcmbiSQ
 yJ01kiVXv5e+MQlqfQ5KExv0JeCEpVn1RzU8aKCw8+OncX5f4rtzn12BDiWFk5vUj0Gh
 VFSS7VQs0eyuE2FPcRxW+tTb01/yRuCPJWXPfn4C3Mx+RllXoAApyonY3UG12qfb+TML
 Tw+jM/RD3oslUt2r+SfhkRVCdWBN8GBmRLOD9gsArAHQpmwnC8liXc9fxtBqOrHKqoCk
 NR4A==
X-Gm-Message-State: AOAM5310tHLodTkAREQ9/zr3MVCTHTtc8wZXjFvqAalv/4GAdtzBrO6l
 1wbi5+QkoVGfAelK4YHdoa4jdPWeYxe96g==
X-Received: by 2002:a05:6a00:7c2:: with SMTP id
 n2mr7173123pfu.28.1598381306203; 
 Tue, 25 Aug 2020 11:48:26 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id d124sm7977046pfa.40.2020.08.25.11.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:48:25 -0700 (PDT)
Subject: Re: [PATCH 14/22] target/arm: Use macros instead of open-coding fp16
 conversion helpers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d3a16e38-7464-f22b-f78c-361e4eece375@linaro.org>
Date: Tue, 25 Aug 2020 11:48:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 9OmzWj84/Olc

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Now the VFP_CONV_FIX macros can handle fp16's distinction between the
> width of the operation and the width of the type used to pass operands,
> use the macros rather than the open-coded functions.
> 
> This creates an extra six helper functions, all of which we are going
> to need for the AArch32 VFP fp16 instructions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h     |  6 +++
>  target/arm/vfp_helper.c | 86 +++--------------------------------------
>  2 files changed, 12 insertions(+), 80 deletions(-)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
