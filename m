Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1446606ejc;
        Mon, 6 May 2024 02:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9pxqn2nC1fJB93jzzgCmUdbG86LYf7bqEgAVUCZEKnqn9tODvWqsY48SjykZ1EF+FCMT51JL94LTlcBlCqJ6U1XuHEmUE
X-Google-Smtp-Source: AGHT+IEjxzGOuiiwrinkW5ecjMIORiE/zokY9Y+d4QnER7zyQ/Ler0tTOICP8AHYEu+19nHlEgOd
X-Received: by 2002:a05:6808:638b:b0:3c8:2b6f:de1d with SMTP id ec11-20020a056808638b00b003c82b6fde1dmr9417577oib.6.1714988654271;
        Mon, 06 May 2024 02:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714988654; cv=none;
        d=google.com; s=arc-20160816;
        b=WD45Al5zRotwC4Ztfa/uq9jB/dZQwQ3HBbAmEaCsC3WJIQq2TUt9eUx3vWwAsDxdBD
         0C481SaUYUep5rNUZHSKVni4NiAtOzF5419qCUOtNRyMN7uUhljwrmoCOGLPTc2RVPNR
         RBM5djxVaVovApIkikhNPRa7fLxdufd1594k8lI3E3Cd16PAxmit4/yZhiy46K2amePk
         U4scvy02Stt6h1grZa18koZpzFLlMVqt1mra0c0rcFrd8raB45JmdWaHlS+7ZgDcq5AA
         3Rmsm6o0RC1dH+pXLnuYJdp0gb3juWv6M6Lon+EVA45cptO8+Emb+Ijggctvev2Mj07r
         VeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X+4F1yoD9pWlkg7x/lCbVPD9tv9Quejjrv1H3pO9uw8=;
        fh=e6XOwpCqYD2fTTHYa+J6EXflspP9GF19mFdLxf8HieE=;
        b=aJJWTy/Nz3tSCYCKblkJGmaKkl6zNjQRuZ233dP31HVQL0Pt5ucHGCRHhGSRPkarlG
         +ooynlQa4QiMF8FipGZnRJCvfBqXZ32owNObzoRFcS6Fu6nKx08b0l9tnwHCvnWCy2OT
         KWEdZ550CMtSFzkVOjgxws3OC51Pg+UAqyanpEHKOrxl+OU1LngsUf9HXmwAEILBdSMM
         R4rkppcoBbjocRQV1n+/r9aAPDZsL+TeE5oSo/b/Za8WI4Pfo1b8ffvakQtU6oRmo44E
         l53OfbFr6M8wJUu1JzKt5KK6Onn5zs/nnsKpkJBVPiX6hiNjwLGqH3aCfHFcNxmRrBOg
         UcKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHYsgsk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a05620a260700b00790efbcb869si9487479qko.504.2024.05.06.02.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 02:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHYsgsk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3ut4-0005SI-8m; Mon, 06 May 2024 05:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3ut1-0005R1-4w
 for qemu-arm@nongnu.org; Mon, 06 May 2024 05:43:56 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3usw-0000pb-82
 for qemu-arm@nongnu.org; Mon, 06 May 2024 05:43:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41e82b78387so10965905e9.0
 for <qemu-arm@nongnu.org>; Mon, 06 May 2024 02:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714988628; x=1715593428; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X+4F1yoD9pWlkg7x/lCbVPD9tv9Quejjrv1H3pO9uw8=;
 b=oHYsgsk5KaMBDwMLWVIwNrorBxVdlHiCoS1gPWYVlTMkVyS0HUQyYMqJ8CC6bjC7p6
 P0K6Nh5Itx3h2s8DUBXSBsec+wlINDTlzM+roraqHUd4hu1Z+9qwjnzo+vdnDFbYYfbG
 s7aLPEPkJinfgCeRXg2mv++Z+jLlxBvM+Bj/5PYnYijzWVpcLa28+IHJBJtuSlAL9zBd
 wjtktNmPuaZizBmdksCcTLqTM6vhg1nRDK29+yli60vUdN7AZ/+MvRrTJoh6zXLPJ+R+
 wTiKmqUXEetYR0Swg/WnkXrF69gwkV/TFd1VEjcUI9LKSTNN7dkSUImh+oCde0ZDFeev
 SlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714988628; x=1715593428;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X+4F1yoD9pWlkg7x/lCbVPD9tv9Quejjrv1H3pO9uw8=;
 b=trr0HAMbJ+jVpAyzoB8ho5vY4ByJjsTggdvmpgQlbcuyIvl7IgnOHqC0s86gK2Fpv4
 z7WF1/gIJJFaV+gM7+dUbO+h64HsIIWLzv1KYOdI2hd9pK44hbnlClzqM2bz87VHltNB
 eV6d5cp9dOCxz5p6uKAnWXN8IZIgXwdxrCdv9iKWovVfvJiZHAx/CPrFO9pui5P4bdP7
 dRJwolyUOJbp95PxwjIn8xtjt0OuVHqZbn8c9qQJwLpqwK9tS6grbSK/iw6GJgrQsSOP
 Gl1z2ywqazPewVmYA7GRI+bFVQnB3azvkBRp1kCD7VOIeRanYZ0Vxb1DZCt+gk4i3Woe
 vvVw==
X-Gm-Message-State: AOJu0YyMiiy3s2itaqyHnGPHgRxowDnjx4uQACdS6rf5ieDT7iaPPd6X
 MiFszy2uJY9I6ek8vow5kWEWUM+waf19CnvS2N0YcNwlG6vpRsdSEtXeAdu4bsk=
X-Received: by 2002:a05:600c:3ac9:b0:418:df23:ae0e with SMTP id
 d9-20020a05600c3ac900b00418df23ae0emr6616904wms.40.1714988628612; 
 Mon, 06 May 2024 02:43:48 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a05600c34c100b0041c130520f3sm19149658wmq.6.2024.05.06.02.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:43:48 -0700 (PDT)
Message-ID: <4717eddc-7564-4bb9-8abf-f42c2253e98e@linaro.org>
Date: Mon, 6 May 2024 11:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/char: Add QOM property for STM32L4x5 USART clock
 frequency
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, Luc Michel <luc@lmichel.fr>,
 Damien Hedde <damien.hedde@dahe.fr>
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
 <20240505140556.373711-4-ines.varhol@telecom-paris.fr>
 <06e98554-3430-49d5-94f3-c5d683327f55@linaro.org>
Content-Language: en-US
In-Reply-To: <06e98554-3430-49d5-94f3-c5d683327f55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: 5AhaNSkM2Zn1

(+Luc & Damien for Clock API)

On 6/5/24 11:34, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 5/5/24 16:05, Inès Varhol wrote:
>> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
>> ---
>>   hw/char/stm32l4x5_usart.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
>> index fc5dcac0c4..ee7727481c 100644
>> --- a/hw/char/stm32l4x5_usart.c
>> +++ b/hw/char/stm32l4x5_usart.c
>> @@ -26,6 +26,7 @@
>>   #include "hw/clock.h"
>>   #include "hw/irq.h"
>>   #include "hw/qdev-clock.h"
>> +#include "qapi/visitor.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/qdev-properties-system.h"
>>   #include "hw/registerfields.h"
>> @@ -523,6 +524,14 @@ static Property stm32l4x5_usart_base_properties[] 
>> = {
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>> +static void clock_freq_get(Object *obj, Visitor *v,
>> +    const char *name, void *opaque, Error **errp)
>> +{
>> +    Stm32l4x5UsartBaseState *s = STM32L4X5_USART_BASE(obj);
>> +    uint32_t clock_freq_hz = clock_get_hz(s->clk);
>> +    visit_type_uint32(v, name, &clock_freq_hz, errp);
>> +}
>> +
>>   static void stm32l4x5_usart_base_init(Object *obj)
>>   {
>>       Stm32l4x5UsartBaseState *s = STM32L4X5_USART_BASE(obj);
>> @@ -534,6 +543,9 @@ static void stm32l4x5_usart_base_init(Object *obj)
>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>>       s->clk = qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
>> +
>> +    object_property_add(obj, "clock-freq-hz", "uint32",
>> +                        clock_freq_get, NULL, NULL, NULL);
> 
> Patch LGTM, but I wonder if registering QOM getter without setter
> is recommended. Perhaps we should encourage parity? In normal HW
> emulation we shouldn't update this clock externally, but thinking
> about testing, this could be interesting to introduce jitter.

Orthogonal to this doubt, we could add the clock properties
directly in qdev_init_clock_in(). Seems useful for the QTest
framework.

> Any opinion on this?
> 
>>   }
>>   static int stm32l4x5_usart_base_post_load(void *opaque, int version_id)
> 

