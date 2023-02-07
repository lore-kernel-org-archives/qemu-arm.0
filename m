Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5869494ejb;
        Tue, 7 Feb 2023 14:59:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/r5WkHrMa7rt9Geg/1zOOPhrDcUg+0NriqOpxdcmxpznXcrSfixh7FXQV59M4/IuZMrEpS
X-Received: by 2002:a05:6214:766:b0:56b:f0d8:d4ce with SMTP id f6-20020a056214076600b0056bf0d8d4cemr7158834qvz.0.1675810777546;
        Tue, 07 Feb 2023 14:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675810777; cv=none;
        d=google.com; s=arc-20160816;
        b=ybu9ciYmj1Z/jPJEkgoafxeh+15zjrYHh4qt+Cb5M/99VUpMJlLLaVtyhyclNJ0VeK
         Llu32Ku6189o1h0OSUivIUcm52VII+BCAHdNllcV9OP1QIGRpksR4FNFt4j8i7GPGkC9
         tDPuWUiHFqR9Nvif05SQzV6DiIOqFHCKGQGA/7CPlhoodpVusKM+6ev2DUKOu4ZeQHoq
         sBNMZUHe9gasgKXKmrMQCWvAuQ0gx/4fbmU4Y5NsXiWhTBfDqWtH79qHHy9ZZjtP2LN1
         LF/Lxp04atv4ICEe2+2JIZRHQ0ytOR0Y7AeVd05PNEZorRL3FfSOS5QjeGjeglY+HgEg
         9S7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iEeW3DoEK3Lc8rA9gJUYXTwtZDjS/pFE4Wh2Y06imIA=;
        b=X9vfAnt10NeEqzauGnMVQDM67z5EIu6agsEceX5ipnB3+/PvBSt9bFsXIJoIJYGzJk
         py+xL18Rczd0zDJUNEpQq6WsC7Ie7EcfsbXEviZ4sZ1wFkelGKgYp53SCod7rrZnTjac
         hWtONRsiKnvan7vHngnjgaWvWkQme51nHPzfkPmdN/e492U0q83at2smblileSHTkWBW
         gUseMJAI8sCbp8IOzxle1DhFZCCcczXzu7mgW/W8M8wDiBbhtvVFOFhd7Uzrr7bH49oY
         fzWUNCTrdfqnVLFWUMLo1Wy6QYzJmwq1kIZHeIU/h7zB+M0/JINbbsxgdMKB0ZgJP9vp
         pUIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znR4twCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a0ce6e1000000b005387b6749d5si10246396qvn.542.2023.02.07.14.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 14:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znR4twCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPWvy-0007Fx-Iq; Tue, 07 Feb 2023 17:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPWvr-0007Dy-ME
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 17:59:25 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPWvq-00049c-4z
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 17:59:23 -0500
Received: by mail-pj1-x1030.google.com with SMTP id mi9so16549066pjb.4
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 14:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iEeW3DoEK3Lc8rA9gJUYXTwtZDjS/pFE4Wh2Y06imIA=;
 b=znR4twCxDhylk+Co7F5rLi50GXYsniUbI645+m7DEFCK3md2Ve4F3xVLq4QA5tPlU6
 HWmL0OXcsNGg0pODz3nHIVBn8nhiWfOBXj9l4QdtpVNDt8XadSSlNZwhuZ+SN14j7Tpl
 vA3dEdIAw0J+7VKgdkKulyT1MNbu+jpfU2ngPAwA9+s+kwVTgg+ze/OVXisM8fgzCFvo
 iwJtHx1X1kuFq3j+eH/9KWO0xCOP//3WJBzKMZLjU5LwuLEHpv28W/WEor9siPNeI0Uv
 bf0iT8r4p/J5qpj2dSJNYemJ4Z67jrMkpY6WV+8skzn+TiENKVn76hJuiQnGnlPrfaaC
 H9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iEeW3DoEK3Lc8rA9gJUYXTwtZDjS/pFE4Wh2Y06imIA=;
 b=lQLzM3lKhqHcafOuNusBGpAV9ZdiFRuE5krJImLtBp94qWNMK4/f9GXQBJIKkpRdWF
 8Kwhv5yxwBmW/wdxbYhGhq75qa5Qrhk0XebIBC0KMN7e3fBMTJ0HmSZLy/4KSDku26KR
 xNXBj7lrqkS4vKCTkfRHn6h6IpcBkCi8vWkwVU40hKJmjjwhqzfTEztqCvL9fAc1kdey
 RgxkADk2qjjFKkBrymXKtiII+cTfJPRyl9XgYNE+Lb9QH2LdBdF7kSS9km+QkMuWv4l9
 0mVpBFRkfd0EumcsksT6tEl1SXLbZYGozZN1Au/3XfRzvV4D1dtpM1sQhs9eS3nBXfol
 Qxng==
X-Gm-Message-State: AO0yUKU3iuw5EXHfFrE8Ki0kzjBcRG+KIQJVdthE/0bKPmOGxLHelteY
 cq7UKmKefnGTfgYUmcvG19Iz0g==
X-Received: by 2002:a05:6a20:3ca6:b0:bf:9f83:2374 with SMTP id
 b38-20020a056a203ca600b000bf9f832374mr6164895pzj.52.1675810760538; 
 Tue, 07 Feb 2023 14:59:20 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q25-20020a639819000000b004dadeb4decasm8402765pgd.53.2023.02.07.14.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 14:59:19 -0800 (PST)
Message-ID: <0dfe9a93-e593-82bf-0a00-59223c943fef@linaro.org>
Date: Tue, 7 Feb 2023 12:59:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/11] hw/intc/armv7m_nvic: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: lAl1Jew/skYg

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
> similarly to automatic conversion from commit 8063396bf3
> ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/intc/armv7m_nvic.h | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> index 0180c7b0ca..07f9c21a5f 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -16,10 +16,7 @@
>   #include "qom/object.h"
>   
>   #define TYPE_NVIC "armv7m_nvic"
> -
> -typedef struct NVICState NVICState;
> -DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
> -                         TYPE_NVIC)
> +OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
>   
>   /* Highest permitted number of exceptions (architectural limit) */
>   #define NVIC_MAX_VECTORS 512

