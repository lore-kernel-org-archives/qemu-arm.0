Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4211602ejc;
        Wed, 30 Aug 2023 01:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2cRWNn4w81fOCR9m5F9kMXkNYNKspUqRchmWP0gI97tD/8CivFBy9jvrWRNeFaGWau0V
X-Received: by 2002:a05:620a:1794:b0:765:6923:623e with SMTP id ay20-20020a05620a179400b007656923623emr1629062qkb.29.1693384426358;
        Wed, 30 Aug 2023 01:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693384426; cv=none;
        d=google.com; s=arc-20160816;
        b=clcUUhCBotE8FJAJ5eySQUYYa4FDgLkREEMT2mBOOdbHcCeUc+wRe7P1qo1C9dffbS
         Hr/ToTWkNdSIr/UmE23W3nAghM0mOHGeCTwFIZ0kODiCqJXAql3nHOx/ANsr8b0LWvbj
         RuanqF+OTP3NPoQ2RXKZsPmq905rut3DxrgOMQKdG0PotjV7Hu0TGm+vBMjikeqnuYJT
         cbEBmHkScyDQeOAwQYNrxzXHj4vRwnyL2OIjHkAvuW+WpxvLH9ExyyHZFfZ50B9UT6Et
         K+5xBqnEms9nJ4sPYAqGELhSf04lR0jeQCRNg5PMEEPrc3xXeRfp83pWxJQX/0xivmST
         nuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=LkrL4NdYmvE3rPS5Wg2IOg1d5N37QWBFCErJIfFx3jk=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=y7yjt+sVc4/dySAOWqH5VBhvyzlkK3kH5dlYwSVpvNjFBx/9pd1R2o9cSAx5wJnIjD
         1qLMyIat34C9S7Gp1Bba+NQOaRJF+Wsu4/n68P8WSD3N+/Le439i6bDj0TIeNHzA8hS+
         L6nTRbsXsore9Yr6ETTOXrcV7DNe4Fi7FBWoFW03277ti/ItTd0A6jFYAN40bTXwGKaZ
         tjS+OARlbDiIHoSId/AWzSQNvcBRLAqb9sm310fSiMBICd0ZUoRhwjAatFhQsNLIvTuK
         9U4eMEqIXmSR9095wMe0GtfhbIpRG7mB5VzCuGcvgIXmkdUB3EDKRWO1W9DXp0vgTL1i
         sG+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGwoK9Oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05620a240200b0076f2eb0a46dsi123242qkn.560.2023.08.30.01.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 01:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGwoK9Oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbGdT-0000gS-46; Wed, 30 Aug 2023 04:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbGdS-0000bf-5m
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 04:33:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbGdP-0004OS-AO
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 04:33:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so4199060f8f.3
 for <qemu-arm@nongnu.org>; Wed, 30 Aug 2023 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693384385; x=1693989185; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LkrL4NdYmvE3rPS5Wg2IOg1d5N37QWBFCErJIfFx3jk=;
 b=UGwoK9OhuuI2rFzOEgBQ+AsLlQKuO/S5seK7xYpOTpa4OQ6Zyd5A65XKabUFJsejHq
 1zcCqZ+y+jCf4YNAZ8R3YHX1vyLfWQpFZYdahugvMVdSMlpjEZeCXlORYZsgU87Nt3GB
 rl4h1BiaQtxg2h1l9t8l06ckPdKhhk7ArqWhFqo4AWyTaIKzD/9DFzGXsCSBmdl6kdk7
 dQ16EiNfSc9ztrN+/V5QDM0nwFzsHgA5lm3TjkqQQnt3w2kJ5kgSOanc/JFgIaG1BpO9
 Pv9cX8CHaa4oH4rGPpSKN8GFK7a4kUaBwIqm/szckeI+ga5j+WhmcPZBGn4E1txafmZD
 yG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693384385; x=1693989185;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LkrL4NdYmvE3rPS5Wg2IOg1d5N37QWBFCErJIfFx3jk=;
 b=RAryaim66wdNx9iFxkWRLYNXNaq3gv5GUhxLEhM3f7hNl/77YTpYKVz55VYLGHvBmD
 yqPs+/39Qv07KG8wXtmF0leakKhbcR6sEIfK4CIkUiWL/qbTpWgnmW2ZNjDAGQmIvgqo
 DncZSug42EtThLy+UXCFFFA5jUgh0syZfdpN1QbfISFHPOKYMDDdjJDbLOpbAlDg4+XJ
 pgL/1o334IujmsXHxCKG1Pv6UAD6LHlRmGODXpWjVsAWYKJNiK8sj7EcFOwAQP0zZv6v
 jjHMOQZwth5gm9nQeInTLYlYptXZDWYJrfSrqvWTF0UZBuxY14MOhp12AbZcG8n6i5il
 E+Uw==
X-Gm-Message-State: AOJu0Yz+e+GSEqTcAIDljKvR8QpIiANDE5tX7Y5Wp+OVEKe7yZ0RdI4q
 JQ60qFMsc+bgml6h0+jdC8lZ1g==
X-Received: by 2002:adf:f9c2:0:b0:319:7134:a3cf with SMTP id
 w2-20020adff9c2000000b003197134a3cfmr1195845wrr.31.1693384385529; 
 Wed, 30 Aug 2023 01:33:05 -0700 (PDT)
Received: from [192.168.32.175] (123.red-95-127-43.staticip.rima-tde.net.
 [95.127.43.123]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d4b4c000000b0031416362e23sm16038420wrs.3.2023.08.30.01.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 01:33:05 -0700 (PDT)
Message-ID: <eab126a5-7d4e-5251-3a85-d6e95cd2c491@linaro.org>
Date: Wed, 30 Aug 2023 10:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH for-8.2 3/3] hw/arm: Set number of MPU regions correctly
 for an505, an521, an524
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
 <20230724174335.2150499-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230724174335.2150499-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3JVZ6GzWmDsl

On 24/7/23 19:43, Peter Maydell wrote:
> The IoTKit, SSE200 and SSE300 all default to 8 MPU regions.  The
> MPS2/MPS3 FPGA images don't override these except in the case of
> AN547, which uses 16 MPU regions.
> 
> Define properties on the ARMSSE object for the MPU regions (using the
> same names as the documented RTL configuration settings, and
> following the pattern we already have for this device of using
> all-caps names as the RTL does), and set them in the board code.
> 
> We don't actually need to override the default except on AN547,
> but it's simpler code to have the board code set them always
> rather than tracking which board subtypes want to set them to
> a non-default value separately from what that value is.
> 
> Tho overall effect is that for mps2-an505, mps2-an521 and mps3-an524
> we now correctly use 8 MPU regions, while mps3-an547 stays at its
> current 16 regions.
> 
> It's possible some guest code wrongly depended on the previous
> incorrectly modeled number of memory regions. (Such guest code
> should ideally check the number of regions via the MPU_TYPE
> register.) The old behaviour can be obtained with additional
> -global arguments to QEMU:
> 
> For mps2-an521 and mps2-an524:
>   -global sse-200.CPU0_MPU_NS=16 -global sse-200.CPU0_MPU_S=16 -global sse-200.CPU1_MPU_NS=16 -global sse-200.CPU1_MPU_S=16
> 
> For mps2-an505:
>   -global sse-200.CPU0_MPU_NS=16 -global sse-200.CPU0_MPU_S=16
> 
> NB that the way the implementation allows this use of -global
> is slightly fragile: if the board code explicitly sets the
> properties on the sse-200 object, this overrides the -global
> command line option. So we rely on:
>   - the boards that need fixing all happen to use the SSE defaults
>   - we can write the board code to only set the property if it
>     is different from the default, rather than having all boards
>     explicitly set the property
>   - the board that does need to use a non-default value happens
>     to need to set it to the same value (16) we previously used
> This works, but there are some kinds of refactoring of the
> mps2-tz.c code that would break the support for -global here.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1772
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm not super-enthusiastic about the -global handling here, as you
> may have guessed from the wording above, though it does avoid having
> explicit back-compat code.  The other option for back-compat would be
> to add an explicit board property to say "use the old values".
> ---
>   include/hw/arm/armsse.h |  5 +++++
>   hw/arm/armsse.c         | 16 ++++++++++++++++
>   hw/arm/mps2-tz.c        | 29 +++++++++++++++++++++++++++++
>   3 files changed, 50 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

