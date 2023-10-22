Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp891943ejb;
        Sun, 22 Oct 2023 09:55:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPeJlrbZK8jZtINT2vsf2+X/ZA9B43SlUBOqodjk7dcnNP1JbI8My5FR6yUbpD0ExySM2g
X-Received: by 2002:a1f:1246:0:b0:49d:723f:590b with SMTP id 67-20020a1f1246000000b0049d723f590bmr5087876vks.7.1697993738563;
        Sun, 22 Oct 2023 09:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697993738; cv=none;
        d=google.com; s=arc-20160816;
        b=0uypwBUjS/6pLOX0mWP+v+XKP/5bFU9nXaptJP8sWTAzem30PNGYHYpcwm4HFOYWxV
         FS9nhrxoVvmbcui6/KtHey2jr2cPMGhpZ6riREKxPCdTL+1LvOuoDW3l5yqFWmXU7Fcg
         +Iis34k5eUCnTOOdTI/U7qGekiEr3yL4GFvaGw8cWURKjcip4k+jNqWRfWwRq8TEtTfZ
         YgHdmb4sLjjuGLGxVt9ZjxP18DbMuCX/+/uaIKeMHUQDw/12litQqhXrYAHjZiRDzVOJ
         C4QDcznq3MvJk/r7nZOk4CNMwAisB9OyF0rs2vEUKyh7qkwt+6ueesirbW0i5QipSumQ
         Xvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AaVA7FlHxMw4bqhGIA3t8y5F0TB2H9BOmAqHzpClhtk=;
        fh=k4iButtuj8hEc/Hzb102WV+ymnTGT+2i4lFe9Di6uCY=;
        b=D+sgVCsHISm2ynmCxRcbt/L4tD/ddvdP+h/UX1MmIqRQyaZJsZMvarFThFhOM6yVXd
         MzTGBRm2LPssqJyMTf9aRYuV9TKddlH2lzFnwragU5fLZ9/jjhaCjc6ZHC0aWq87wJKL
         VcEjeIwz7lKXavSr8qzhGwAQFLVFTcb6ENuHZNkE5buwJuYI/cDuko5Y+lM66PirxFr+
         g1fGcV/523XfrgITQ8UJoNOIO7rROOgiUbJ617qgnZA27oOfcRzWEPCaO0cda63U4AfU
         L3khrZ2v5cJB/la0bY1wcrSrPwFXP8AZBwCinlq2f9AKi6UrTZB9OI3ukhW0pAPRjAGl
         Fu9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJgOpMW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oh8-20020a056214438800b0066d1385b824si4515436qvb.544.2023.10.22.09.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 09:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJgOpMW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qubjD-0001Zd-W4; Sun, 22 Oct 2023 12:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubj6-0001R3-UL
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 12:54:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubj5-00035m-Da
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 12:54:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-27cfb84432aso1483131a91.2
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697993694; x=1698598494; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AaVA7FlHxMw4bqhGIA3t8y5F0TB2H9BOmAqHzpClhtk=;
 b=HJgOpMW4weiAbiiGuOYXIumTf9HgoaG3YpL3T9+FD2OXmda+D7G1urL3widh1sH3Aq
 CAcraW8DWPLdsjxj1mKQ75Mk/qWLf0KCLnaBt1WqiQLX5//brAuZEuheL8xIEKjzfzzA
 /A8XBCYGe+gzQt8WPX61kG7O5/VIWSX6D+RxYh1K5O4cDAfj/xtrvRr/AnAD4cidOAZp
 Bd9/5HCM7cW1A9w5ukWtTnOJEIo/0FIF2iWyC1owwvAlriAG260LFzRklz43aTES4j2C
 IwrwB9NQ67wrDFMi+GjeWaZZ9PoNtjOU5uA5DZeD2BK4uDmr+PGB5ZLOuJh5OLfLkTpQ
 8gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697993694; x=1698598494;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AaVA7FlHxMw4bqhGIA3t8y5F0TB2H9BOmAqHzpClhtk=;
 b=FMRkL7a3twGnM50hBvwJec0WhxfnF0HLhs2592D+5Yi3Agvg5juEQvUft1lz6T+KyP
 bOpndvi5YrNTJhbuhGTF356REUF5Fc0AU0L8roK2hXHz5l+DwDAr307RdO4JkYsFECkz
 U4bKygeln0HoN8PZJNgJsytTspiXhy+TTKw69LY4fsnGATWNyQi2tNIJMwoTGws4Lcyh
 /dScvmERKONdYTo0n4Zoc+14fOaV/C2TCaXlc+irxulah06zmZyEDIGyYZ68CT/5y4Bo
 tjEbvkhplcxj1Rpq7svwXAEsiPxV9ThA0J+d8Gd6JNr6JavQgK7WFD2oNEyTFGIGSjDB
 bwPg==
X-Gm-Message-State: AOJu0YyB6pt1aqoHnHE4YjWbWfJz3yjK0Q+I0wqLMjm9ivzVNnY25Z5v
 23vpKnPLIGUwPGrbvRvCqqhPWA==
X-Received: by 2002:a17:90a:b903:b0:27d:5504:4cc8 with SMTP id
 p3-20020a17090ab90300b0027d55044cc8mr5255340pjr.9.1697993694211; 
 Sun, 22 Oct 2023 09:54:54 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a17090a2a4a00b002790ded9c6dsm4934130pjg.31.2023.10.22.09.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 09:54:53 -0700 (PDT)
Message-ID: <225e4c3c-2d44-4f2a-b398-60e57a002434@linaro.org>
Date: Sun, 22 Oct 2023 09:54:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hw/char/stm32f2xx_usart: Add more definitions for
 CR1 register
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20231020170009.86870-1-philmd@linaro.org>
 <20231020170009.86870-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231020170009.86870-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: szRToM/UQlkV

On 10/20/23 10:00, Philippe Mathieu-Daudé wrote:
> From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> 
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Useful if unused?
> ---
>   include/hw/char/stm32f2xx_usart.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
> index 65bcc85470..fdfa7424a7 100644
> --- a/include/hw/char/stm32f2xx_usart.h
> +++ b/include/hw/char/stm32f2xx_usart.h
> @@ -48,10 +48,12 @@
>   #define USART_SR_TC   (1 << 6)
>   #define USART_SR_RXNE (1 << 5)
>   
> -#define USART_CR1_UE  (1 << 13)
> -#define USART_CR1_RXNEIE  (1 << 5)
> -#define USART_CR1_TE  (1 << 3)
> -#define USART_CR1_RE  (1 << 2)
> +#define USART_CR1_UE     (1 << 13)
> +#define USART_CR1_TXEIE  (1 << 7)
> +#define USART_CR1_TCEIE  (1 << 6)
> +#define USART_CR1_RXNEIE (1 << 5)
> +#define USART_CR1_TE     (1 << 3)
> +#define USART_CR1_RE     (1 << 2)
>   
>   #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
>   OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXUsartState, STM32F2XX_USART)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
