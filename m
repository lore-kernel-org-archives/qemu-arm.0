Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6554980lfg;
        Thu, 4 Mar 2021 12:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgJVnCcnowtp68enlzoHOns/IhcWiaEk1qwosDDs1GgauJ+TI2o6qEz6d65CetpdLvpHRn
X-Received: by 2002:a02:4087:: with SMTP id n129mr5954904jaa.143.1614889499354;
        Thu, 04 Mar 2021 12:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889499; cv=none;
        d=google.com; s=arc-20160816;
        b=0Snn+5r77MVPozYwl2dwWbrzECSnuMJSnf4ZYW28MaR9rQWppQIFSAkWdJ239ONjZm
         K04+WGSJf050540b+tPcPZUhwnQ7ZACCRcTEbvnRIfPJYqreM8o2TZjRsK5ZpAPTFOtt
         M+s8r2tsfYV18PsyqDEs4Lk7bNhb7I+QzeJuiqxWYUUXklQ5FFYnJLMAQkbLvmxehUfx
         XJWbm1dw/a6WNBICAKQjz24GMd3zOfvVFUn99JKV0T85Cxi5Vq/nGsN+GzPpY6ajc+mx
         3G9sUTfiLXI7ffQLOgMETgW7qY5S/3Gc4G3XBL/DKGy0h6S+PX9Pc7fkpsJMiR45Z5Gh
         To+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QLLUoZUDXAVz+xqcLApBhYjtsuVSgvIE9lsUXIfKtWM=;
        b=t1Wk0VSCZZHDggPkI1hNYhCAaPVrbUr0jOQMIohgKn2ypzDQfJAD8nLRatfuJwy/Sn
         pTu1r3kkoN66mXA4Rk5L0VoZeS/YKV2qVgv96jR0A8WtTSsSjkpbD1vokEgwVz/A4ViL
         AQmnlUxPavhwvvKCEYcE4BBybeUn92oG870njob7gOXDKuPYXW19iIbfk6VLF6j2wx2E
         VawydNHBHBn84rxvgUMB8zehZKZMyAuRdSgkwX3Pkod8WquVpn8fsftqtDWZz7TdMVuW
         wbgy453rrx73dI6T6tlvraVek5SK4yMZ4ViH4PvqA9NddsdaFLw4u6nroRL1XO9jIWED
         2H7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OJNAVsrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si134301ilc.71.2021.03.04.12.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OJNAVsrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuWo-0008Ku-KS
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuUm-0005w0-3T; Thu, 04 Mar 2021 15:22:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuUk-00080j-4U; Thu, 04 Mar 2021 15:22:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id k66so10928500wmf.1;
 Thu, 04 Mar 2021 12:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QLLUoZUDXAVz+xqcLApBhYjtsuVSgvIE9lsUXIfKtWM=;
 b=OJNAVsrYu81xM/eFu+er1GGHhjoSoYIPrEaRYNwds1Is1SpBUjPS5VBxGBJDO/YMTk
 vhIP9czvVUXkQpjB91mg3Wk+IqlTppEfE9QfJlyunWauqL1e+5WAAA5eKpAYvvDf9E/P
 g4Qj9Z207k1qmFubwJ6+0bT9hk78zMw0MJhLhuaDN+n/vSe+AZRJUpfTJ/ZUun35Kk84
 1EpY2D1+yD9WLx/Gm8ipdXKNHnYqCusWipqBo7J2CmBHj2izNPJMSBKh+8SqLDXMI5gS
 WxFrY95rMWWt+01g8GePP55nHvU18UKmQ8C5+lsWm0jpOEtOIWo+5c0jKVAIOsuZGXaP
 5cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QLLUoZUDXAVz+xqcLApBhYjtsuVSgvIE9lsUXIfKtWM=;
 b=LYQc/ZcFY5TIS1dD/M8CgHrg6X4dru+nt38V9Qih4UpK85QcSjTFpDWISMxxyl++S9
 0w4aeXsUBGwBT9LUr5kT2DgprNcuV/rJ1V3JwYXzDL8jjMjDs/HEdRC1Yd1Ws+IF0kvZ
 HULK+sJ3oLlDgV/+DtaqRdmwDB0PyTx0qNUmji701kv00hMb0i9Et15mzFujoSQMVJBj
 SwnhAPcNeR/ys8E0DPHMBl2pFosv3kHRn9LsKBZ/gY+VfXXCnC/okRbbXH1S/Cgpdf+9
 cUrO6++ECznMo1A/3mt8etf+LAqQt2K6jiQ9H4fhYhDwmY+BgPYfS+pacG+Pp9USK8s0
 8pLw==
X-Gm-Message-State: AOAM533WYM1OnxJc4WZt43qes6QOFKAfDx8/dSKJaNZ6hWhPfUQ/3vYi
 e729VJXgpgjycUIX+C4wNzp2kGWFcQs=
X-Received: by 2002:a1c:a916:: with SMTP id s22mr5735355wme.82.1614889367574; 
 Thu, 04 Mar 2021 12:22:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m3sm768349wmc.48.2021.03.04.12.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:22:47 -0800 (PST)
Subject: Re: [PATCH 33/44] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-34-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <70537fcc-1d8b-eacc-890b-e010fb80ab86@amsat.org>
Date: Thu, 4 Mar 2021 21:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 8Xj+FRQPqZTf

On 2/19/21 3:46 PM, Peter Maydell wrote:
> The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
> the code for having these in an ARMSSEDeviceInfo array.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  2 ++
>  hw/arm/armsse.c         | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
