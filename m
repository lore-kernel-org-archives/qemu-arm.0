Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6581506njn;
        Tue, 21 Jan 2025 02:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9umLVWiQGeGuACtkOyEpxGMgMQggcNm4nbUqyVKHjuISVW5TeUd2lmt9l1JUHqF9qzkVuFtn0dk7egw==@linaro.org
X-Google-Smtp-Source: AGHT+IGO4vd+VAwkPlX6w1yiyb5URs73Xh48zdir/GdiJo1SajJZjVqPva4tnbu4VFcli+ttTwgf
X-Received: by 2002:a05:620a:408c:b0:7b1:21c4:ecf8 with SMTP id af79cd13be357-7be52464e94mr4024663685a.28.1737456218614;
        Tue, 21 Jan 2025 02:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737456218; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3MTfWFKK3wiqkLD3tGl1ty3rmGhbzjql9CcUdhJrbgMy0zhNygiKovFg5XGgUYH2F
         B3nJx268+RP/IHHKreE/gYLwNHgLr5riV+B/Xykok60EAt+kkjodLS9v8zb6Hib1ExUq
         GUZqX3dssTnFnFHpY1GGZmCTnykH3SGmquxQso9JZDhl7fy7qOjmLec51aTmRqKuPzMO
         ZsWfuwgf74WkaX2wuYIXGCG3Jr1fjivohqtStoVgCyv556UYHBjku+WF82UuAYa1r8UC
         8HZWgbVAaqO4Z4Q6spuBnCANFhBSsmO3hmGL1u2OdaCpQs2jE4P2CkgCA0lMXbH33qzL
         sGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XWvjNI+oquW7gOCu3bcr0rKpVqFmdDU9b/bmzWiVX1g=;
        fh=WmyTNzRGack75CxKGFEwCFc4ZErGJNru64m4uVKS2EY=;
        b=bKKqRNSOknjJ19HpFwkyYF/dy5fe3d2RcVX2SGizbbUkcNVyrOZDymMtc/wbg8g3KB
         aKYABp+hpz1EZ6duSbK08NkQsUaNkQZkJ2IY3lr1SukqOW00u9epTzDMc8/9vTPkGqaN
         zyY+CJJtAMmbs03nkUVew8OKtkEVlganJsBpd5RpvdmwBOqZKZVSxC69wxfU1j0TNjWi
         Y1h3IZSbk9PL+u9FPl9SKEj5kbFbRU39oCmZAlE53UCDyTcFDGL6bj6+0TYh/2oKrIt6
         EPJMG96h1/q1dVUI0qKXH99RSxEYzVcFSmybJmfkVL/OJPSebowzHqi3HQAxIjrYmXUy
         kPhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfJAMC+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614cc681si1224061585a.439.2025.01.21.02.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 02:43:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfJAMC+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taBj4-0003ZX-5Z; Tue, 21 Jan 2025 05:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taBj2-0003Yl-5e
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 05:43:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taBj0-0003Gs-IQ
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 05:43:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so2914298f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 02:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737456193; x=1738060993; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XWvjNI+oquW7gOCu3bcr0rKpVqFmdDU9b/bmzWiVX1g=;
 b=IfJAMC+lRTd8PDZF5zH+bx+C/BwPuqzNg8CRtjaMPmN/6jEeWMQtot6agTv9Z7mwZ1
 xNspTdvakaE+mwiFN5k3M26PfBQr/zCn2uoAkfOHEmt6Njd1RZ90kSnB/bZzz1nwrb1W
 vGnPMNgj24L8lWQf6E3ezh6T1Iqz3vPxK02Mnu3y/S9UvZKdA3gKLRt5a938TxXttdC1
 DKkfx3DHiQyh+sD3skbLO4oVPev1uVCkBdmZPy42pV7odrfMtfrOY7Adz+NkNahLUtml
 6NZMOtU7eEzht7O1fsZKkgA1oeVek4XbbifHzjMUsp12aLdB43zE/jOJLyhvuTTgSCVU
 PjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737456193; x=1738060993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWvjNI+oquW7gOCu3bcr0rKpVqFmdDU9b/bmzWiVX1g=;
 b=jShzk4eMGyY8puckFVH2NG3pK5/5A8DnIkM2SJDsWWLLqtEhE8RG7jL0Z0/vR0wriT
 221VKP418wNN/dcP6pGCUJTGlgX+cvbamS2b/CoO75NOHN48ovLC1FzOM6WVJbo03Ies
 XrE+aKea5Mp4p+73aT72fbFZvCqKT02v7NxHTvSVn/QXyuldAakATs0D6IbRSV1h/eDI
 V31uoopIZGeIZSlj5F4XTrQQTtUioaN+lv+2YjqWIvffDD7uNxa50ZbVGyJJSEh66hf3
 E7k+44dR/jNaVHMWNcP5L7AsTPdab3tFIkcG+Dou18C6sKrcuIyjFcH6/GKWSTTOu2Qh
 UUGA==
X-Gm-Message-State: AOJu0YzxfgJFWuN4Z5KAYtQBtMjrtvk03lMWkIp2qn/T4xGSJ2chqR7k
 xzfkmePSlGJW6XFhbx66XI/NqU/swE9Cr/mmc9svSM/TwxaeTWGQpsNE9ZBYaao=
X-Gm-Gg: ASbGncu1pB9Dyg9hHhxcZcBqaLItKkspnMefvs+Pig4vQC89mrWhhNKedgMF+1JlnAW
 TCGV4jwY6XUsDH3LT1ue7grUxiproWbLZb/6fF9jVq23NLuk0Zlyvje22HDydKeqiX1DR4mqeLF
 jllIfMARkThUywldatylSddHWrr68rWptKxOkcvD3sOReBHCNWZKGPkFMUDfZEb9kuO2N17AQiy
 ev2bPPlJJu0v22Kg+onpPCdrfQMhh0M40HV906p0JMoQcmxNqPRUHna9OHmppr9r32+xilzodj4
 kdZzJ/QCXblE7Ay9NSqMQOZwTazaKBuObSFPjw==
X-Received: by 2002:a5d:5f4d:0:b0:38a:614b:8632 with SMTP id
 ffacd0b85a97d-38bf57a6969mr17110881f8f.39.1737456192304; 
 Tue, 21 Jan 2025 02:43:12 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327de62sm12693987f8f.85.2025.01.21.02.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 02:43:11 -0800 (PST)
Message-ID: <bfa02ef0-12a3-46b5-9749-c9e367145dc3@linaro.org>
Date: Tue, 21 Jan 2025 11:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc: i2c-echo: add tracing
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, its@irrelevant.dk
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
References: <20250121103608.3056288-1-titusr@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250121103608.3056288-1-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: fyPFnH88Bu4M

Hi Titus,

On 21/1/25 11:36, Titus Rwantare wrote:
> This has been useful when debugging when unsure if the guest is
> generating i2c traffic.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/misc/i2c-echo.c   | 13 +++++++++++++
>   hw/misc/trace-events |  5 +++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
> index 5ae3d0817e..06110e0f8e 100644
> --- a/hw/misc/i2c-echo.c
> +++ b/hw/misc/i2c-echo.c
> @@ -13,6 +13,7 @@
>   #include "qemu/main-loop.h"
>   #include "block/aio.h"
>   #include "hw/i2c/i2c.h"
> +#include "trace.h"
>   
>   #define TYPE_I2C_ECHO "i2c-echo"
>   OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
> @@ -80,11 +81,19 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
>       case I2C_START_RECV:
>           state->pos = 0;
>   
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_RECV");
>           break;
>   
>       case I2C_START_SEND:
>           state->pos = 0;
>   
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND");
> +        break;
> +
> +    case I2C_START_SEND_ASYNC:
> +        state->pos = 0;
> +
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND_ASYNC");

This patch is doing a bit more that what it describes, since now
START_SEND_ASYNC returns 0x00 instead of 0xff (besides updating pos).

Please split as one patch per logical change.

Thanks!

Phil.

>           break;
>   
>       case I2C_FINISH:
