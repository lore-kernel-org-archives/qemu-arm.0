Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp548752ejc;
        Wed, 8 May 2024 07:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzwAY1SUZMxUFueen965lz0H5fcD1q8XZDcVLjou59oY+j5PsFpvrUNBCVgkqGs+zGbfaurpG7h5LErm6YTzkXURb+lO16
X-Google-Smtp-Source: AGHT+IG0G+Ufl9iT2BMKIj0Fdh3MF34pfOMGPglQb4neCG9fOiWW9dY9TTKj+X2ESpV0a7WkfHNH
X-Received: by 2002:ad4:5fcf:0:b0:6a0:7df4:90b8 with SMTP id 6a1803df08f44-6a15149072amr29792336d6.35.1715177340083;
        Wed, 08 May 2024 07:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715177340; cv=none;
        d=google.com; s=arc-20160816;
        b=mAVavH3u9YyYBH13NDC7U8T1PzMJNipqUnPj5Fj5xrgjL39wofz28qzWIuBdJ/IwoN
         N7ibzFCTLN4pp7j9zUF+wobL1+RZZl01PydmaWUZFcSouzEaZi2JuheLWmvA5VU9b4jX
         yZqU2e6GtZg+QeF3OnqEuVTKXpGdRSqXsj9y6Xp9y/nMCMaOuMdFT57rI/XozhOFIEvK
         +WddPQM+OsVGknIcZC8871uCatgB9Q0WY3VYC/KwHv1Di2T40sOCp9+r3z5TLs5/Pr2x
         ajrjtS/k4CyIY7NQfWJdT883iLbrqw/nrhK4GHSDUHWoE0xWFTGmS1thzAiCAg60YjXX
         Cl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5RHqHsuiLiPA/oyCgbngDHmPlwOj1ZNaC9uXrn1XVW8=;
        fh=rz3dKNHLKN5B8pJEVqKymKY7LoNJkvFkM3e5oITJ8M8=;
        b=Ufv7QBkFeu65TNKqSZ+xTs8yc/KlY9q0ifAUwzGWvEa3HMka85Mq3C70FKpxVfcrmL
         xZxCpwaxMNA7v1ae+LVoML5wucDUQAsiPhZi/6vOAbbdevyBwhkJteyhGX81mddGRu6b
         LdTswN4T6xs6JBP/6Q6J2Qv88whossmuGXH88Br7VmfkufN2ywIWxMug611wKpyj5eg/
         n9sd9ksQ7Gpzoe4/AzxrgOWVFsstQcphVqiqCKT6JICJUGiDVC1ANRfJEbkm3m/QtBGP
         if4CHchpP8hCIamt+3n8NTV6tY4ZPgRIB3gzVAoXGH6ehqjDZXrvDD3sRWPEOjPmBtky
         Nzuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F/bBcKI8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if3-20020a0562141c4300b0069b720b263asi14027645qvb.540.2024.05.08.07.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2024 07:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F/bBcKI8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4hyX-0007su-6Z; Wed, 08 May 2024 10:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s4hyV-0007sS-UD
 for qemu-arm@nongnu.org; Wed, 08 May 2024 10:08:51 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s4hyU-0002gR-6N
 for qemu-arm@nongnu.org; Wed, 08 May 2024 10:08:51 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so166867966b.1
 for <qemu-arm@nongnu.org>; Wed, 08 May 2024 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715177328; x=1715782128; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5RHqHsuiLiPA/oyCgbngDHmPlwOj1ZNaC9uXrn1XVW8=;
 b=F/bBcKI8/qGW+48XCB/jsKwBcfJfFVWISIix9o3CyecMf3phcR4IirdC74Hq6Bv2Uq
 SPrCrPz0RJ0xVFr7yvq/VDHepstkHMDmh5vDCSpbn3e0YzHv3nicsII0P15VX6/EcErw
 TVnfIUekt52SgID592ZqsJ8v1LGkdZz80QLKNz19UVYoSDqFHYDYCXExKuQy1YEN2KnO
 jwOyhNJ+M/0D2IXUEetAl4kruhOLGQYz02ZnE5Xi5JHyA7MkI5OXO2iadaQjBFTV0UZh
 ewx3NFCZUpcDivtm9IeJ8KMHJflnHnxTUp9+2a1eqUikF01tFR5ovNsitEWBcrlM5x+5
 U55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715177328; x=1715782128;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5RHqHsuiLiPA/oyCgbngDHmPlwOj1ZNaC9uXrn1XVW8=;
 b=EMiq+kqDSUb6yp9oyb8XDyJDh1bV3GPjxgTO8P9xDOUH7wJxFvpGSy8D1vltufVKGp
 uQbZgcEUvt+S0p3FPdz5/LPwMnGOatAKD5aamKHc2OPA/5GZ975+9ycBTkl9YOnJM0He
 rUNW53hFeQyQECnGnyKFuQSPXus1r8AQR2o81hU0nnx8zpi1n+Z8c2ZN0ReMudQPxCvd
 UqMw0smYvoS5Q2E+9bgYQ32fjblRy6maJoSfh8eWMuGlLYEwg59V/hWw61obttxwjVJY
 EQ/K1LJe74BjValsYAsSB+64yCwWWRAwNNoeQ+GIgNIyyIOylcPVoSWQobAR7/d1T2ip
 d69g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP5Qdimx7y0WID3AQmXKx4r5rCWPCNDNvAb1UWI4DTnEkwtzO7f6SpNNZdz8PA3Zwy0IKBUQ3Oe7j5MtVtjZJsI3xV
X-Gm-Message-State: AOJu0YxfaIQYp8PE1yKQmdoUdtgoJK+ftrbERy9ky8i45/AenebHTMpd
 bvWnFIF3QmzwexdYy3dPdmxbM0odhc5VuHbwgvEtzgQJWlj2QXJomsa9a5gF5/w=
X-Received: by 2002:a17:907:9490:b0:a59:fb06:5d35 with SMTP id
 a640c23a62f3a-a59fb065e31mr295445866b.8.1715177328136; 
 Wed, 08 May 2024 07:08:48 -0700 (PDT)
Received: from [192.168.69.100] (sar95-h02-176-184-10-250.dsl.sta.abo.bbox.fr.
 [176.184.10.250]) by smtp.gmail.com with ESMTPSA id
 jt26-20020a170906ca1a00b00a558206b2c5sm7748013ejb.99.2024.05.08.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 07:08:47 -0700 (PDT)
Message-ID: <d03ca96e-53e9-43ed-886e-0cffd15994fb@linaro.org>
Date: Wed, 8 May 2024 16:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/char: Add QOM property for STM32L4x5 USART clock
 frequency
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
 <20240505140556.373711-4-ines.varhol@telecom-paris.fr>
 <06e98554-3430-49d5-94f3-c5d683327f55@linaro.org>
 <CAFEAcA83cgqq3yh3=d=gHd-LK3qh2g-pE2v734apKmcNTJTvww@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA83cgqq3yh3=d=gHd-LK3qh2g-pE2v734apKmcNTJTvww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: /f7bhXJs+nmt

Hi,

On 7/5/24 11:54, Peter Maydell wrote:
> On Mon, 6 May 2024 at 10:34, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi,
>>
>> On 5/5/24 16:05, Inès Varhol wrote:
>>> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
>>> ---
>>>    hw/char/stm32l4x5_usart.c | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
>>> index fc5dcac0c4..ee7727481c 100644
>>> --- a/hw/char/stm32l4x5_usart.c
>>> +++ b/hw/char/stm32l4x5_usart.c
>>> @@ -26,6 +26,7 @@
>>>    #include "hw/clock.h"
>>>    #include "hw/irq.h"
>>>    #include "hw/qdev-clock.h"
>>> +#include "qapi/visitor.h"
>>>    #include "hw/qdev-properties.h"
>>>    #include "hw/qdev-properties-system.h"
>>>    #include "hw/registerfields.h"
>>> @@ -523,6 +524,14 @@ static Property stm32l4x5_usart_base_properties[] = {
>>>        DEFINE_PROP_END_OF_LIST(),
>>>    };
>>>
>>> +static void clock_freq_get(Object *obj, Visitor *v,
>>> +    const char *name, void *opaque, Error **errp)
>>> +{
>>> +    Stm32l4x5UsartBaseState *s = STM32L4X5_USART_BASE(obj);
>>> +    uint32_t clock_freq_hz = clock_get_hz(s->clk);
>>> +    visit_type_uint32(v, name, &clock_freq_hz, errp);
>>> +}
>>> +
>>>    static void stm32l4x5_usart_base_init(Object *obj)
>>>    {
>>>        Stm32l4x5UsartBaseState *s = STM32L4X5_USART_BASE(obj);
>>> @@ -534,6 +543,9 @@ static void stm32l4x5_usart_base_init(Object *obj)
>>>        sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>>>
>>>        s->clk = qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
>>> +
>>> +    object_property_add(obj, "clock-freq-hz", "uint32",
>>> +                        clock_freq_get, NULL, NULL, NULL);
>>
>> Patch LGTM, but I wonder if registering QOM getter without setter
>> is recommended. Perhaps we should encourage parity? In normal HW
>> emulation we shouldn't update this clock externally, but thinking
>> about testing, this could be interesting to introduce jitter.
> 
> object_property_add() with the set function NULL is fine,
> and is documented to mean "property cannot be set". Attempts
> to set it will be failed (in object_property_set()) with a
> reasonable error.
> 
> But it's not clear to me why we want the property in the first
> place -- we don't generally have devices which take a Clock
> input have properties exposing its frequency. If we did want
> that it would probably be better if we could do it generically
> rather than by adding more boilerplate code to each device.

Inès qtest checking (via HMP) the configured clock has a
correct scaled frequency seems a good use case.

> Mostly "frequency" properties on devices are for the case
> where  they *don't* have a Clock input and instead have
> ad-hoc legacy handling where the board/SoC that creates the
> device sets an integer property to define the input frequency
> because it doesn't model the clock tree with Clock objects.
> 
> thanks
> -- PMM

