Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2406993lfv;
        Mon, 1 Nov 2021 11:45:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz0ZyaYLz2dlnHCxwS66U0W5FdrweHNJQ6eevQ5a+g/CKTLfQ3QUI4JfxO8W22y4kd4XDC
X-Received: by 2002:a05:6830:4428:: with SMTP id q40mr3254829otv.300.1635792315840;
        Mon, 01 Nov 2021 11:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635792315; cv=none;
        d=google.com; s=arc-20160816;
        b=sWS+pe0RQzMUwd4He/pr7M8RJKM4G4sDPMxQHP2Kc/1ZPVm1GMZl0dzqz8T0ssKyEQ
         aQT/IvXA1BjD0/8oBIu+jYzowJPGzcBBg0Qm//ZWFCkwqkTCsww0E+wk7LTm8LTn9t2s
         z1Jg3nb6vRivEsciEp0XgbSTw3+DgzwEeZ9M8P2MnWK+WcLqzhljONpSIl4KZ+WDtW+u
         Z//2LyTBAvWy5qq/3O7W201XU9Xd+I9i5jBBlCkzh2Eu3LpDJ6G7AwXHDT4OuuD66iJ/
         w/WE7jk436sHdxOdCqgPye+3kMFJTnMrcu3e99SC5sBe+qjbU6tW4LE0Zwjx4EgntZG9
         xqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6hf7t5wanOhfIpE/odMgA6Vp2TU64TQ4Pa0qFNbLaCM=;
        b=Q9is3RgITruzp/+wqq2MSQAhsjQcbdIINItt0GBeMizDdzVwGkj9KlwHeYTVhmB+/s
         hPE2HHQ8l9dl8DuYUXFqdiuxef61+Wvr6RK6wohJDrgEwo5gqyC59w2VOuuYfUCG1VHG
         yZoPtrIh3yKzINUm15l7SUPCzwdv3KOs2V0dIOpAXxonBV/W67e7wfZHh26maO0Xo2rK
         Cg/2UEtXrKt8XWJmZJ3ulnA+z0o2JtZcVT9ufNGWAXestAQw6ZMmFRhfWLj7LNNFozY6
         dzjBmm1zoAtDxRh5Pks1aoz+lW/pOTFkzfFzH2QgeYU9vwUm8CJKOS0e5vKMu41NcFKA
         /x4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qaVGYTRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si15826426oti.11.2021.11.01.11.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qaVGYTRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcJ1-0003UA-57
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbJ5-0008Ha-P1
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:41:15 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbJ2-0006kE-TD
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:41:15 -0400
Received: by mail-qk1-x736.google.com with SMTP id br39so4100545qkb.8
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6hf7t5wanOhfIpE/odMgA6Vp2TU64TQ4Pa0qFNbLaCM=;
 b=qaVGYTRQ/U2rncI6jj5cXHqJOk+OoivKlpHQbktWsTrULPGETBfa2e1sZRpXYkze/g
 u3fM7XWF1rykQcHYZ62BeziQLl4q9iySgSwrTu2FLDF5Vt3M9Jw6NFmY2IexbNgmkEbh
 fGXwltOXa9d0g+SzkvfW8Vx9mz1T0D2CzN5B9AUHFlvA4dYmmaublulS4G0wKFFzF1NA
 wXekHTfRQbJUnsJKYSOwp3/3bwusP8au27L22ruApSDhf68MiwjL8nEsR4AhxYxU3wcM
 KTZzQ6stY2UKKKQtAjiHRIUPRmvU5kByc8iLH8JNZCQQkMzTHYM6DOnIF5s/uJzyJypN
 TFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hf7t5wanOhfIpE/odMgA6Vp2TU64TQ4Pa0qFNbLaCM=;
 b=oqFZJpvwoF2CzTluPa3uLQW/+50ABaBX6v0P9QJH25drdDuj69dFC6mCELbkUfGcPU
 5GTt0NRaT6u6Z6A9eMPifOgb3RG9yeYq/LLtX9mXxwmDUdwg1BE9MD6pHlO9ZCB3HL+q
 SmIwv9hqsRFLA0ik0HPZK2A7wfxi03Sc+GFBPgVm5RaarRkCUFsuKrxBk/gtSwmeWCXl
 Kt+6SsPMn8VQK2Mt2WOmgeC7A2TuuaFK5gvqHMkbB4MKVdrAc+ADpQxAadEXKZVwC87e
 eqE7FpDrAJMEaeaIIt6YDBpLK2DAeL8BRz0KTE2OmZhsVNsEPn5uEffb/r36Rd2EqzbR
 3I2w==
X-Gm-Message-State: AOAM5322+1f3gdBVAc6UKO7MeZeEYeGHPfYBebtuCJQI/bhdWToKCqiu
 DLLQxS012vga2FhRSaGXeFglhk0wxCBX1A==
X-Received: by 2002:a05:620a:29c8:: with SMTP id
 s8mr7300890qkp.250.1635788471837; 
 Mon, 01 Nov 2021 10:41:11 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id j20sm11330300qtj.72.2021.11.01.10.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:41:11 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] target/arm: Use tcg_constant_*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211029231834.2476117-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c74589f-dea1-6e56-c173-fc8e88b577bf@linaro.org>
Date: Mon, 1 Nov 2021 13:41:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 093oP4irLrGM

On 10/29/21 7:18 PM, Philippe Mathieu-Daudé wrote:
> Missing review: patches #2 & #5 (new)
> 
> Introduce store_cpu_field_constant() helper to avoid using temporary
> when the value is constant (and read-only).
> 
> Since v2:
> - Simplify store_cpu_field_constant(), do not modify store_cpu_field()
> - Added another use in gen_rev16()
> 
> Philippe Mathieu-Daudé (5):
>    target/arm: Use tcg_constant_i32() in op_smlad()
>    target/arm: Introduce store_cpu_field_constant() helper
>    target/arm: Use the constant variant of store_cpu_field() when
>      possible
>    target/arm: Use tcg_constant_i64() in do_sat_addsub_64()
>    target/arm: Use tcg_constant_i32() in gen_rev16()
> 
>   target/arm/translate-a32.h |  3 +++
>   target/arm/translate-sve.c | 17 ++++++++---------
>   target/arm/translate.c     | 27 ++++++++-------------------
>   3 files changed, 19 insertions(+), 28 deletions(-)

Thanks, applied to target-arm.next.


r~

