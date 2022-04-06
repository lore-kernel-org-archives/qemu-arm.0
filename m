Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp721826lfu;
        Wed, 6 Apr 2022 07:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8oiPI0OZbJ6JEjPpgBpvC/Kw6EhI2tPioJ1g+1chEvR4MA0ICde2S31h5s+2jZclYKkii
X-Received: by 2002:a05:620a:13d3:b0:67d:4eac:ff42 with SMTP id g19-20020a05620a13d300b0067d4eacff42mr5759043qkl.21.1649253900534;
        Wed, 06 Apr 2022 07:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253900; cv=none;
        d=google.com; s=arc-20160816;
        b=L01qu2EHdSQAuwfvm7HndLaQmW7IQKDs8T9jZN5dSmKScQZFn08NGdwJ/FSm9bTZmM
         PsSZL5BcHc9tQzsWIVdCYUcrUKFpTdrXeFhxnL6ZsZhVf824ROZ/pvEtMbfd0bgo/clK
         MgSDfo8kbgxfG2iCHYXBZBzSQ4F3YIWsqyfoIeo8IEfpi0HlEo/Vc1xjP7jBTYW3p6Hk
         LwTPKLiKRc1YOSuVukMQwyM8dQoJDAFtPyWcy0C0lHwbbp7zUeIfjv5aZlDfTPq0pXxk
         sUTQUabLJ/eR0KVEK9yhMkKnvRBkZoHmK85sV2fK4Du81jfaCx9WxEyPCKi9Isg/gKK7
         fzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4h8UMFA4ejdvIM1tKnWcGX2zbAcop0O+0xD5M1/H4tw=;
        b=tqmkcKeFRXAFU+DQtNeRdzrB9nx4Ye65+zPBchNUnVm2NGiG1qarolbEKmm9J+zwJg
         qAyEvbJsjkffga+GeX8YQP0hVuIfxDYFBNHmdPcnhrgM0rkSK6s10OuK5XwWKlV3R4JQ
         BC9s5/8xDqOWQZoT4433ldtEtp/LFae8jPeV6rA/9SKHEswLuzP7KMuOcw9etnm2Szsj
         HeGdVLairIgWzl23gLYYQCY3/v5BlegL8I239hmBlpTgBRrq3WZSAu1T0P/wFY0bDmQG
         RjjkE+x82azh4iZfAilaaxHPsOsnutQTbH52Y7DGWM8P3SpxihGITvrXjpqzIJBO2GWB
         T0zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ew9QzIgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a0562141c0900b00440ff7989c8si7021014qvc.500.2022.04.06.07.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 07:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ew9QzIgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc6HL-0003nD-SY
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 10:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Gz-0003mu-GH
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:04:37 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Gx-0006PN-O0
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:04:37 -0400
Received: by mail-qt1-x82a.google.com with SMTP id z19so4436182qtw.2
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4h8UMFA4ejdvIM1tKnWcGX2zbAcop0O+0xD5M1/H4tw=;
 b=ew9QzIgiyCO+mg4d88TWjf3+4T0Smyj9ZW41pt1LgNudxuiJahwhk3VzbfCxN8qmoF
 d86ZgWUxY9EBHSlu6DyZ2N300Pdzjk8P5V209Fn31n9N4PJKA+xUZlwlubEvHDEZqZ0C
 ZWOiu+klqcx+CI1vSmW1UEk8x3H3Odnq6cayzYUmsn7u1nip2emr7H6EZq6ArNoOi+ye
 vMOdYEIUH0vzrtoWl4tEmvavbHpUIkaB9D0tUSDnE/7YnQvJMqPqaAUbFo+VPuMSqPyg
 ROqZjilqhRjdU4F4yHOGuWopcvaKNQqZO9ejotqHa7vFl/EwGmZF0YrvHnXdTMSffCye
 +YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4h8UMFA4ejdvIM1tKnWcGX2zbAcop0O+0xD5M1/H4tw=;
 b=C0ZfIooQuDd4VIA5tO3YqjxpDWuD/fFTH/UH1kdF+/r1KL/8a5HkcbqfSNeBjq3kFY
 dNl1X3dD3t5Z2BJgheE0e+Mwi9HlsvL+jBncTk3JpO2hKK7jB4WW/i8udEAZlZm4duYY
 c3ecXO+jh1VfH6BvBghL2m4ci8xfuz4wNGlGRIJWVE7jemqKwZmX2heNaIBKnCcMXVEL
 +cKaF1onWaWTfHgfaH+aEhxJoRcKHoed1zs185DPw7G+PniQnpQqLW2Kx+6w4aG7kN8j
 Gtbj6VJRuNWSDgTkQEXZZPdfebPUHM601ZizJroj5lZilSRmjDdA5dH8aQa4AziTaRg4
 w1kA==
X-Gm-Message-State: AOAM531yO09BRWGK9ho5GI119Pn33QZlsfYzkrySWHjC1wLkXCEKjqED
 npqE/AiEcyHXze7B0LI5WYEohg==
X-Received: by 2002:ac8:7f86:0:b0:2e1:b6b3:2ca4 with SMTP id
 z6-20020ac87f86000000b002e1b6b32ca4mr7575405qtj.127.1649253874603; 
 Wed, 06 Apr 2022 07:04:34 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 e15-20020ac8670f000000b002e22d9c756dsm11846736qtp.30.2022.04.06.07.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:04:34 -0700 (PDT)
Message-ID: <6cdaeef1-1f4c-2f0c-23a9-ad3203fa9c75@linaro.org>
Date: Wed, 6 Apr 2022 09:04:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 16/18] hw/arm/exynos4210: Fold combiner splits
 into exynos4210_init_board_irqs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ftle6Dsw8yFy

On 4/4/22 10:46, Peter Maydell wrote:
> At this point, the function exynos4210_init_board_irqs() splits input
> IRQ lines to connect them to the input combiner, output combiner and
> external GIC.  The function exynos4210_combiner_get_gpioin() splits
> some of the combiner input lines further to connect them to multiple
> different inputs on the combiner.
> 
> Because (unlike qemu_irq_split()) the TYPE_SPLIT_IRQ device has a
> configurable number of outputs, we can do all this in one place, by
> making exynos4210_init_board_irqs() add extra outputs to the splitter
> device when it must be connected to more than one input on each
> combiner.
> 
> We do this with a new data structure, the combinermap, which is an
> array each of whose elements is a list of the interrupt IDs on the
> combiner which must be tied together.  As we loop through each
> interrupt ID, if we find that it is the first one in one of these
> lists, we configure the splitter device with eonugh extra outputs and
> wire them up to the other interrupt IDs in the list.
> 
> Conveniently, for all the cases where this is necessary, the
> lowest-numbered interrupt ID in each group is in the range of the
> external combiner, so we only need to code for this in the first of
> the two loops in exynos4210_init_board_irqs().
> 
> The old code in exynos4210_combiner_get_gpioin() which is being
> deleted here had several problems which don't exist in the new code
> in its handling of the multi-core timer interrupts:
>   (1) the case labels specified bits 4 ... 8, but bit '8' doesn't
>       exist; these should have been 4 ... 7
>   (2) it used the input irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]
>       multiple times as the input of several different splitters,
>       which isn't allowed
>   (3) in an apparent cut-and-paste error, the cases for all the
>       multi-core timer inputs used "bit + 4" even though the
>       bit range for the case was (intended to be) 4 ... 7, which
>       meant it was looking at non-existent bits 8 ... 11.
> None of these exist in the new code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |   6 +-
>   hw/arm/exynos4210.c         | 178 +++++++++++++++++++++++-------------
>   2 files changed, 119 insertions(+), 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
