Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp929958lfr;
        Thu, 15 Apr 2021 15:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm2BKqxEsj0IgAU567mkMXoru3YMxaiB816YTqptO+jHuwitlvl3+fssHmcLZXtWuycZjd
X-Received: by 2002:aca:35d4:: with SMTP id c203mr4208399oia.10.1618525523927;
        Thu, 15 Apr 2021 15:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618525523; cv=none;
        d=google.com; s=arc-20160816;
        b=Ooia78Ra7LsRFujjpZxEcV6nK9ZtyTY4jY2zlf9CM0sTlB+wmwwcbRPxw4xnVUepDx
         DHNfR6V4UAF+3NSgOlZel7C4tbz9SPoXox/sjB6QjaP2L4OWLpwENHb0pCoUQvkqEg5O
         1Dj9/XFvcGyt1ITwezEwszmSVjAyMhmY3L/iRhE8sNrSze/VyA7J6Q49r6QjpJIufglY
         6KSuUcKu4U88sEUtlOmEF5dGyZ9rLJJyp7pqqN+pOxT9OKD9tjL3tmBQeWkmNLwiKzyk
         NK6xB0yyFI598ToLolMX6BZux+BGtuGnzlKDS8lfRO4g0Aj091GLUwvTYzVrrgyzHOPS
         hlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OsFyBiBOCKTjkQNT6yRdyWwxH3TNiEJ1hscJXYK5138=;
        b=oJ0gWv3cxNYR4PGI+jx26RtmF7ASybjb0jaOLbORb6tYsU8yZxe8sFjiBDKRxM9DNk
         j4EssoJR6dWzxJr2H2K6wllcCL0uQxFaReBlwXhWxyysUK2bZZx0KHz0e49pckzTr72e
         A+zXK1XtVPkcMAjGrOIrchGjBtpe3lgB34N28vrekbwuhdvT4hIaJaaO+y2+W0bm6g7v
         y0nURLYRR/F8+9KpQsTEPEBh4pyJ6sud+3N8xsS1ibut0S9epbZduffXeEm1WPPjUbRg
         aVJ4CUPUpyFxoIE0vwRJbjBG+oRNK7W5R1N1QC0gnaGBOebMieP7iNdQF2CxAiALBVqv
         SbGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kgXK6UUH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24si3660478otd.232.2021.04.15.15.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 15:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kgXK6UUH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXAQN-0005QI-97
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 18:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAQ7-0005I9-TB
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 18:25:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAQ5-0004zx-OO
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 18:25:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id s14so8022574pjl.5
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OsFyBiBOCKTjkQNT6yRdyWwxH3TNiEJ1hscJXYK5138=;
 b=kgXK6UUHoL/DuSaEs62M3NsE+AUDjy0lxs+VxmKhLwypb3S2dW8w1b3Q/2kJiZ0s7X
 T9hlpz0CaT/b7OonoeRp9W3xqrlR7Dq5oginjMC6fcB18fht1JFx3Ppy2smwLqrg+yro
 qXFHTvt3BHBBt065Ig9GNbCRwcBHDzbmn4IIE+VGvcRC2bzypSZnE/FoNZVknfd03A3C
 DFKXpfD57tYZ/t8rEZZEPGltvAMrmaYHm1h3s3aCjQ/elENNe9sWffEoihoK1OqbJuZP
 87xVuT8gWwFgLLJjE3sg0vXwBFjWxnkxdc4LsyUJbno12OewINheqmrwp7KGxi+9LRXD
 j1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OsFyBiBOCKTjkQNT6yRdyWwxH3TNiEJ1hscJXYK5138=;
 b=ft68+KMnYM6ZYHS4wLyWAxI4F3QFJo9mVZ2RRU3J1rIUvXbqQku+Gh4b24JEJX9Ll9
 iX7K/RIe61FvFNi0XmJluf/r3eHe1XVxYvMLAcx1iDGKm1uW48VIiKjmERgHMix35GYw
 Umx3eyFrBe95KXLkDyRkyBEBBetTLvY1UNqoT8eEFmtQsWckh3ccuqmHZ2rmxOXl0sUn
 JjNA2z6d/i7Nuje2OnKJPyorrBmbvpo3UFAqRuv9A5hDOqpwGRUl5cLt0fnJoReZ+ygp
 uQZQZj4zhzSMtxnSSFrd48O4fa2BpqAqGaKd2Fpe9dD5azBz5hm9EMsu6KDNipySC1kV
 jrLQ==
X-Gm-Message-State: AOAM531fijwDg5Zbri4EFALK/uI8qEzbn4I+zbF5r3hclD3NyhM7iaH4
 jhLrc+kwWCXtJqF99n3WvkCzQw==
X-Received: by 2002:a17:903:1cc:b029:e6:f37a:2185 with SMTP id
 e12-20020a17090301ccb02900e6f37a2185mr6293652plh.67.1618525504274; 
 Thu, 15 Apr 2021 15:25:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 18sm3062383pgn.82.2021.04.15.15.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 15:25:03 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Give SSE-300 its own Property
 array
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210415182353.8173-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6502730d-a3f0-dbbf-b532-8c863216406b@linaro.org>
Date: Thu, 15 Apr 2021 15:25:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415182353.8173-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: ecBUeEsADgLa

On 4/15/21 11:23 AM, Peter Maydell wrote:
> SSE-300 currently shares the SSE-200 Property array. This is
> bad principally because the default values of the CPU0_FPU
> and CPU0_DSP properties disable the FPU and DSP on the CPU.
> That is correct for the SSE-300 but not the SSE-200.
> Give the SSE-300 its own Property array with the correct
> SSE-300 specific settings:
>   * SSE-300 has only one CPU, so no CPU1* properties
>   * SSE-300 CPU has FPU and DSP
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a simple and pretty safe fix, but I don't think it quite
> merits doing an rc4 by itself. I think if we do an rc4 for some
> other reason it ought to go in, though.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
