Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4478761ejb;
        Mon, 6 Feb 2023 10:59:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+UN5LtKZCUPYU5OSTIdDvLDNHNtTHLYP/5nafHcWrJnO1rAJiji9lbKk0k067jmtO5Oaka
X-Received: by 2002:a05:6214:240b:b0:56b:f9d9:1aa3 with SMTP id fv11-20020a056214240b00b0056bf9d91aa3mr256341qvb.14.1675709980587;
        Mon, 06 Feb 2023 10:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675709980; cv=none;
        d=google.com; s=arc-20160816;
        b=sDEJWJWnxJnukoSG+iQiaW8sP2qW7g1lQSazRKjprr/JHNcRI2bFqOiUWlmx3LS/td
         kRD+Ow9O6l3wbDpUxkvzQTvsgqyam5gs4lMTekWEAGzv/4llnib3p4yQqV30SlKmXF+F
         Z0peVOKq/J8MB+TFtjwfOswOqBGlV5csJukLmxrJ8gtxX3p/R44nk+PNR3iyZzNshIaw
         OZV18oR/14pd3pULsorNLG43wkczkUzyrazag77Q+GdfsDDFEMYwlMd6KNGd93pASyJh
         5Ae6zDPO8nvlAMV5I6j8/B/YfB66XTuHm9taeCD012vpOMZ1SntNveZ35we4oBafz/hp
         x2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=f3OtrwXSwfJpC87TsYuhJYLn56aWcRnxzuKLBspPg10=;
        b=sLcdCTIHdUPQdrFAjXXzWVtSRfXq8jhstPUroMUbRzDZTd3Lv3C22gDCqi2kZxxLgO
         g4vxNW8eyCN24fttKCc9Z/f0tjScPxXs8FkLjBQ1tt+qoxcxVexTreatIHEUSutPH3c/
         Bq7BOxQaZHRA9x/hH7zlFbXYbAjZGeqFVTFym3cjR5R4gFosxJmU1Z0tShQ2jDs6XcQU
         5lz6pmGy5x+Edn9DGq6nduGTRn3UXjOd5Ibu0PLjpcyNGprqlmsjHCdt5IHl5a81lHwu
         ZVcKb1e9c3b2T8Dqr+ZuTGyJ+tiQE+Za5fh3j5p5tg9hPTj/L09cKMNhrJE6LcOcA6Qa
         WkrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=us1R5tjs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 137-20020a37068f000000b0071ea29b1836si8620534qkg.278.2023.02.06.10.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 10:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=us1R5tjs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP6i5-0001DY-TO; Mon, 06 Feb 2023 13:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6i1-0001D8-NN
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:59:21 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6hz-0006cA-F4
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:59:20 -0500
Received: by mail-pf1-x433.google.com with SMTP id ay1so9100952pfb.7
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 10:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f3OtrwXSwfJpC87TsYuhJYLn56aWcRnxzuKLBspPg10=;
 b=us1R5tjsXexYo2le3Gbc5jUGB/XKVYFGZcT8+Fn6OZUMJObnlkvEs5fRl2RusAeUDC
 o9um8XSBS239cBIP9jgNDSLNcv0IspJlxNx5RTISEQhkBS5zK/6yCpAInr8qtlWo0VlL
 vJgkfWsL21WlZyMVdrRkc6CT6gj8RYpyYluwjAmK0WifvcOOaYLfDvzfKXC4GvsIv2J0
 JiHUFAYFQKtyo0fzSSwy/scljEwWsrGjcoDE1fKKU8/M2qZyUxC4hTCozOZACboMmUfR
 1bsUyoEc9TlvOWKPxzw9WT5f0Lla3tn4W95b0oRfnEhcc/py3xrstRhMwGDvIlboYaEH
 S8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3OtrwXSwfJpC87TsYuhJYLn56aWcRnxzuKLBspPg10=;
 b=ZXPtt01u60WfuhfcLpoIpc8P39+fc8a4OiWZ0pdhNx7owrA+iHKvazN/sIrzrpj9Uc
 IOy5i28PyLLS86Fh0gz7+JdZmhzQ4hJYyK5UeHcwjrCFAGnlvh5qrASZnDGfgdPNkUWa
 0qSlEX47wQyv92i3abNM/zG3U+oSuzLs4PKYaZ9+77CWMOesnBV5QirvNswaXQjPlJKq
 sIfE0pTuT6JYVuNMfCb7nOjOQzIOF3P9PCcKVLoxAHW6bHXIaCiSFbqdcEjbyKMWWrkI
 BNivRulAx4M/Pm/rlSIDWs5BedjPRxe/UlA7+RIbfh8kfKo6WDZrLMUTr4BhEBiN2BuG
 DkRQ==
X-Gm-Message-State: AO0yUKVIYGtvphotE/KxT3ZnDMvlPTHeijpYe1Yyb13/06LxzAC9ABzN
 mTgrmjhqUniuckAAA9jG4Xud4PI2Yc/9eD11JjhXkQ==
X-Received: by 2002:a62:1605:0:b0:58d:be61:8bc8 with SMTP id
 5-20020a621605000000b0058dbe618bc8mr491197pfw.8.1675709958155; 
 Mon, 06 Feb 2023 10:59:18 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 187-20020a6217c4000000b005825b8e0540sm7476882pfx.204.2023.02.06.10.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:59:17 -0800 (PST)
Message-ID: <1f778126-e60c-261f-b40b-7f6dd8476c6f@linaro.org>
Date: Mon, 6 Feb 2023 08:59:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 7/9] target/arm: Declare CPU <-> NVIC helpers in
 'hw/intc/armv7m_nvic.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mVu9DW1s2xok

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> While dozens of files include "cpu.h", only 3 files require
> these NVIC helper declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/intc/armv7m_nvic.h | 123 ++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c              |   4 +-
>   target/arm/cpu.h              | 123 ----------------------------------
>   target/arm/cpu_tcg.c          |   3 +
>   target/arm/m_helper.c         |   3 +
>   5 files changed, 132 insertions(+), 124 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
