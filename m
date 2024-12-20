Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2254651njk;
        Fri, 20 Dec 2024 02:26:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWP6aX3RdQxQgRcBnq2No4ofQK6tl5Dx+AmPMCX4uBGSWwwuLsU4uCiklreh2DjgFvlQWSjrhG222GtjA==@linaro.org
X-Google-Smtp-Source: AGHT+IFg05t7t4X6JvjUjfNVWOrLe0rHaS7ptYmBlCmUTDn5WixY2gNZ0LFqofZz8FiwNjbE7Cvc
X-Received: by 2002:ac8:7e87:0:b0:467:45b7:c495 with SMTP id d75a77b69052e-46a4a8cdc04mr34935191cf.15.1734690375110;
        Fri, 20 Dec 2024 02:26:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734690375; cv=none;
        d=google.com; s=arc-20240605;
        b=E3MTjBXPhWG2Kh+FQJ337uuQNZXuWjG9M9nUZ7W4EacWezvKkJWrfyQ1Wdqc4UPVyi
         cgzP0zLe4icIm3F1aImdlvntcRVypEg6o27d+KlgSsWeD3rmlIzUDDgnb5Cn5eUsrlb0
         EztUt+Ok7vIIIMTRbFOturRsw9QlMiPUDzrhU9xX9qXw/y/ajmtLmsQL/kkavVYYM3NM
         3riFZoJtEGKgu0P7LGZHTSlgA3YD7AzX+LBW3dXzDgwnQNQuKrH7sObWBwdt0R2ZGVHm
         DLDwd8pLiNMTi/uVZj4RS0xb6SbLeoN+buC9oc425TTH1BrgTxQXniyLvNeim5mKHbVY
         rqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2UzE0euSl0tJtXtQ85xngC+JKg6+SMV8rtbtI4ia8oA=;
        fh=5BFhwWh7cnuGShaoPU6Q8KdJT/WMd5zKy5owbpwhH1Y=;
        b=b4u+K/mqwlY2KV+wmzX65zu3Pfj6kJXRu2XMmrCycD+DkqncxSrRWdOVbnG/fu2PwO
         TJJldptpAV6vYOLZA8/LiNKnM6827Zv0Itz5sBN7+SV219o1dIWbnec40/RDrX6Q1cc1
         891JG+95R45Bn4g5dMSk4R7C7MjMJ9jFe3n3es/VfaRAjSvc6v82bnxDVsDnAUjfsDeN
         hQUHVvsrjLV4LnDwsCdoOL5tHdLoUrSB0GuAeit5sbDlPYNnF37GEf5JXBMd/G+qnuCZ
         c4JQYD5bWei5mF18N5wqxI8zWr+DvKdbRKoXNj+pISvUTX4XsUWD70kcBe5pHZnxzYSU
         cY/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gicbAjtS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb99255si39397021cf.257.2024.12.20.02.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2024 02:26:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gicbAjtS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tOaCS-0003oh-PR; Fri, 20 Dec 2024 05:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOaCQ-0003oB-Ky
 for qemu-arm@nongnu.org; Fri, 20 Dec 2024 05:25:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOaCP-0007na-46
 for qemu-arm@nongnu.org; Fri, 20 Dec 2024 05:25:38 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so18443155e9.0
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2024 02:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734690335; x=1735295135; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UzE0euSl0tJtXtQ85xngC+JKg6+SMV8rtbtI4ia8oA=;
 b=gicbAjtS33TovH011asaSxKDI85LB07eoM56/MRISOYPpFi+Vm3g+u5Sr6fJf2wWqF
 Z3knbpGAyXOXdxBB/x3RMLKfl/4zKlGTDWn55kHksQK6q9eDNIWosL5ZmDXoJ985vGXD
 LU5rMdOAT1yKmc9+2k880MjDZSwyaQPdkBii3CLMEOuY26oh261SNcaWYr9cl/MTXdEo
 HzHIM/qFo9vg9fsj7JM5dCZ7XVdIyzj1ViWLwpf6PLfUXxeDmR+UJbj2W8zRbr50e7im
 lcsCB2Mnk5HoM2x4Ioikensm888qpTeopjlcYXXi/SH8KQ8GgUlgzniNuaGMVOAQTz6Z
 4YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734690335; x=1735295135;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2UzE0euSl0tJtXtQ85xngC+JKg6+SMV8rtbtI4ia8oA=;
 b=pnfV8n8XjF0GQslTTNa74j5zDBLS11eC12ahnHJZQCKenBFISftOLWv/e8x50l2GwH
 zUmSzylKV3knsJsEBXngt3oDyMZW/AKLKrOb+m0qxGwXlB1Q7071pvOewzgNabYLMCBA
 YUSpjK8KDwwkdD/l3REJAauZQb7BswqtUYZ3Of1niJk7i5+mG1BOx8TKj6DRXnFl+Hzx
 mF0j3n/uAGJN768V5M9QZSNKOQ/o+n+PW8rO7oBSkFYH/NHVOvr+NqmOPo1wIpMr3xVO
 v+E971hIzsiuXLIzyZVGbF+rpynTVtNyFE8vBUBCKj2wFblcBHC+oBgrCSTt6bYq+6S4
 hMFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWbVhjAWBdYR6MORiSi0azj73RIS/9GBafG1zbwcn+fGctPKuGvRQ36b6kwfYs/M5TRwlo9FKSLw==@nongnu.org
X-Gm-Message-State: AOJu0YwfgZKEjsapVzTXaHnHhYMQ4uBhA45Iwj7aeaQK7NI5hmTNVxly
 bxIHnvXwfivj20ldj1Y+ZqixIGd6uNICukw5tg23jrBRdLpzu650D5fLOwgs5UI=
X-Gm-Gg: ASbGncvZwtgv2sILGtcC4vSyj0LBBRzl34K2dLtH3yRUdPQw8dE3XKE2ndKXwVDU63Y
 XA4tJMAS47sVo/O4kRr8/rq1asrHnoZ1mcVjZK/CWDX4egbvgAZo2cFmBLDVvf2MLcf60/nCVP5
 RNYhZJAR+/TPvps2uc7IAu4wz8Jga/mWLsTZRFwSyuW/MVRY85xpRiWVOtDiAlfG43OlCb+EAdG
 fD9pTMbtry+wazNJkzwZFFsVVyBlzwu5QLEDlrIsDdbmkHVhGx9IvSoeArTtdVWVfeKpJ4=
X-Received: by 2002:a05:600c:4709:b0:436:1ac2:1acf with SMTP id
 5b1f17b1804b1-43668a3a35dmr17378285e9.20.1734690335359; 
 Fri, 20 Dec 2024 02:25:35 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366e210cecsm6001875e9.2.2024.12.20.02.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 02:25:34 -0800 (PST)
Message-ID: <b266d634-d922-4402-aa28-1096d19e07ba@linaro.org>
Date: Fri, 20 Dec 2024 11:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char: stm32f2xx_usart: replace print with trace
To: Nikita Shubin <nikita.shubin@maquefel.me>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241220084623.1889-1-nikita.shubin@maquefel.me>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241220084623.1889-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: DWsK8C6BepQ+

Hi Nikita,

On 20/12/24 09:46, Nikita Shubin wrote:
> From: Nikita Shubin <nshubin@yadro.com>
> 
> Drop debug printing macros and replace them with according trace
> functions.
> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>   hw/char/stm32f2xx_usart.c | 47 ++++++++++++++++++---------------------
>   hw/char/trace-events      |  6 +++++
>   2 files changed, 28 insertions(+), 25 deletions(-)


>   static int stm32f2xx_usart_can_receive(void *opaque)
>   {
> @@ -67,10 +57,11 @@ static void stm32f2xx_update_irq(STM32F2XXUsartState *s)
>   static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf, int size)
>   {
>       STM32F2XXUsartState *s = opaque;
> +    DeviceState *d = DEVICE(s);
>   
>       if (!(s->usart_cr1 & USART_CR1_UE && s->usart_cr1 & USART_CR1_RE)) {
>           /* USART not enabled - drop the chars */
> -        DB_PRINT("Dropping the chars\n");
> +        trace_stm32f2xx_usart_drop(d->id);
>           return;
>       }
>   
> @@ -79,7 +70,7 @@ static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf, int size)
>   
>       stm32f2xx_update_irq(s);
>   
> -    DB_PRINT("Receiving: %c\n", s->usart_dr);
> +    trace_stm32f2xx_usart_recieve(d->id, *buf);

Typo "receive".

>   }
>   
>   static void stm32f2xx_usart_reset(DeviceState *dev)
> @@ -101,49 +92,55 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
>                                          unsigned int size)
>   {
>       STM32F2XXUsartState *s = opaque;
> +    DeviceState *d = DEVICE(s);
>       uint64_t retvalue;

'retvalue' should be initialized ...

>   
> -    DB_PRINT("Read 0x%"HWADDR_PRIx"\n", addr);
> -
>       switch (addr) {
>       case USART_SR:
>           retvalue = s->usart_sr;
>           qemu_chr_fe_accept_input(&s->chr);
> -        return retvalue;
> +        break;
>       case USART_DR:
> -        DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->usart_dr);
>           retvalue = s->usart_dr & 0x3FF;
>           s->usart_sr &= ~USART_SR_RXNE;
>           qemu_chr_fe_accept_input(&s->chr);
>           stm32f2xx_update_irq(s);
> -        return retvalue;
> +        break;
>       case USART_BRR:
> -        return s->usart_brr;
> +        retvalue = s->usart_brr;
> +        break;
>       case USART_CR1:
> -        return s->usart_cr1;
> +        retvalue = s->usart_cr1;
> +        break;
>       case USART_CR2:
> -        return s->usart_cr2;
> +        retvalue = s->usart_cr2;
> +        break;
>       case USART_CR3:
> -        return s->usart_cr3;
> +        retvalue = s->usart_cr3;
> +        break;
>       case USART_GTPR:
> -        return s->usart_gtpr;
> +        retvalue = s->usart_gtpr;
> +        break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
>           return 0;
>       }
>   
> -    return 0;
> +    trace_stm32f2xx_usart_read(d->id, size, addr, retvalue);
> +
> +    return retvalue;

... since you return here.

Otherwise, the patch looks good!

Regards,

Phil.

>   }

