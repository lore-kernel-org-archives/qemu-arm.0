Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4842975lfa;
        Tue, 8 Jun 2021 15:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFxBl00gTWi95A9StFO2xZDL3rCmNNiKQMBJ9X0MCF0KsAZzFUPNt5dNwnOEx6pfT0/eVo
X-Received: by 2002:a5e:d905:: with SMTP id n5mr17285169iop.208.1623190495532;
        Tue, 08 Jun 2021 15:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623190495; cv=none;
        d=google.com; s=arc-20160816;
        b=NXS91ylMH0jrafglBt6VvMKx/VxsM6K9qm6gTxIZVSZEhZZtV787SxuGCzAacxcu54
         6VjfwOCxckiMZwD45176ZOw3hoC0nQsA61bBphKDM8gHKnsnTaWk3Dw26lpB3WmyG+2P
         ohnO3JTmpqmNcUY+cFoD89aE02/aD0ggRVKEoroMRGJHMRbDgocE2UkbHpO7iIHOzkiv
         GW0DaG+v21p8ZgcsV6zpQMsHDwX9LBcaWKpPl8FoKYmXaUFnR/AhQG7+EAhz2CEdK+jg
         TLYKJxDpIEdnH7I/Ul/zAnX7xo0YNUNGFxVbioo5R1xFEE91zlzhDkU/I8OBNniBJGfx
         jv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j4U3ZDYvEqtHirtZH/WP8MPg6nnJS8rgWjAqxaRWfbo=;
        b=vL8ezf0k2Vpxv40L1W20t3KSDeRp3vYP/mb4jlvg3cbBGntfF74oQlnAPWK52JfQWU
         ftJ0lGLTKPTgZ6QsLBH6D9WAnfQcJfmpyeBBOcEt7KxqdC4MGWzHDfQ++oz+RW8EdLBM
         XR8yA46fIJBLoM6Xa53cxAbV9rWGesqOCj5tkmNkRfJVeyki9DRcKGdEZvO+OGx2naRh
         oqfHBdEVs+LLwIUFKms84xFXvuIgG/Z6v7U0ECceq+crYZe55HvR0IRrqMb9+//v+mJ3
         3vrWL2+vJUxZ70SXvBsgejg8roNwUnNTLVo0roI2BwYf+lrwVnZRlIM/jbjI6HxC6ATZ
         FZig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFB1EKKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si1064913iol.49.2021.06.08.15.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 15:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFB1EKKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqjzq-0004ij-Qs
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 18:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjzd-0004iP-Jr
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:14:41 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjzc-0004IM-19
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:14:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id v13so11462675ple.9
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j4U3ZDYvEqtHirtZH/WP8MPg6nnJS8rgWjAqxaRWfbo=;
 b=DFB1EKKQB/XbXCrrWVni6RO9P/WUJXi+ZFii3tGt1w+q1rbVyJZwYEB77Y0vx5O+bP
 n6lylyeS+m0Fbbi21fXabFwbzn1+m2l4RKzgN+vJGhCiveZH9sJ0EPFLpT0BcaSn1deO
 /rM4Z+OysHXO9CJeIkCFIUX+veLsCmdbCETFvHrchZbuoww6OgoR7RQDtONT3SY72YI9
 ed3NaQNRQrVLLjC1dQm/jCYsf3+0B38tSm8dH5Nn+BVxgPYLiSeEnIc9w8qNekxXGxza
 LBKXyws7O7qJp4VYpQClfUBOtxDseEIOydN9bUqhsx8F/eq1/RkDyRlQno8xutZNG3Ql
 IiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4U3ZDYvEqtHirtZH/WP8MPg6nnJS8rgWjAqxaRWfbo=;
 b=JIAmDoXO/yxSwvkge1lEPIx9NDsrk9cJFpVxHxQ5VpZ6y55S+1RsAVVnC4c1ztg1dv
 0tp2EWur/BHnYKrOdjN5smSBmfEWwi1sLhe5KtfSRfQ9DNfn31mA5YlkqHf42plgJYWd
 PoXT2XEBWGdWnKUSaMF+s86/5A/7Sbw2ViPgW7PHnxpFGVaEa0aZ+y3d7moOL1op3ui2
 j72uhDtbXAOWoKLvhesYguyAKIJMwnzJDqw94beGJ3RCpfFPc10Lu0S5iY4Jj3K3a5k/
 1AmoNBepnJ9ftiyjyN+Thlwpk73eXpnTE1eRgKpCX7Vt2EqmX9qkP7rroyZaSJKgHny7
 j5nA==
X-Gm-Message-State: AOAM533RaBQU7b+GLx3WrNUrC8ZY1jFLaiBa9Lt1qhA5Q9yaKtioNhvg
 EMjG8fT4uWqTtcyBxiCsMUajxoGFSUTT6A==
X-Received: by 2002:a17:90a:fb51:: with SMTP id
 iq17mr16800141pjb.26.1623190478425; 
 Tue, 08 Jun 2021 15:14:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u1sm12260124pgh.80.2021.06.08.15.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:14:38 -0700 (PDT)
Subject: Re: [PATCH 15/55] bitops.h: Provide hswap32(), hswap64(), wswap64()
 swapping operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b20f93ed-b344-dbb5-18e1-38762b8323eb@linaro.org>
Date: Tue, 8 Jun 2021 15:14:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: XkTfD8poRgM0

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Currently the ARM SVE helper code defines locally some utility
> functions for swapping 16-bit halfwords within 32-bit or 64-bit
> values and for swapping 32-bit words within 64-bit values,
> parallel to the byte-swapping bswap16/32/64 functions.
> 
> We want these also for the ARM MVE code, and they're potentially
> generally useful for other targets, so move them to bitops.h.
> (We don't put them in bswap.h with the bswap* functions because
> they are implemented in terms of the rotate operations also
> defined in bitops.h, and including bitops.h from bswap.h seems
> better avoided.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/bitops.h   | 29 +++++++++++++++++++++++++++++
>   target/arm/sve_helper.c | 20 --------------------
>   2 files changed, 29 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
