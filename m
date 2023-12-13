Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1775652ejo;
        Wed, 13 Dec 2023 09:17:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS11RBIKhzdpdy3uU6WgBw0fnTBf7x0rpGduI7ZXFp6AgyS4mkLbNKJNAcSB3qPCPOq66R
X-Received: by 2002:a05:6358:2c93:b0:170:c991:d419 with SMTP id l19-20020a0563582c9300b00170c991d419mr8996349rwm.48.1702487862080;
        Wed, 13 Dec 2023 09:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702487862; cv=none;
        d=google.com; s=arc-20160816;
        b=KSX+4q6L48ZXnSbbcCoBiu6X1GcqIJC1c+wx9yCBm2bpEFbe0LCSnhcyUJn0a13ZUJ
         D/mgN+HIAr19DLgUHEpHX9ThRrtsvz2+ElI9uCywCuXYGtpw590Tj+CwFHebuzY1Uw4Z
         COhc07Dx7WibIkcV5oZOFTRpTx/97ItlxJ832t2JiGQCC9HzzkMDAzcxOZqngMz6HfgA
         TPFn4gceQesF+/iL6txwWH4t8CwPZXN+X14caB688lCxdS2GjWZ7wzkGRP8bV7EySLMw
         VVDhQCIcp2MkUK2Wr/kDPR0UxwKaona4/yHkj6LAQSwNJWbKVflSI/YldpnMpmLWC2qE
         +YwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YV1aVfliO0h/9ZxH/04CNNXbjdLWJq9x+ewRR5BBe3s=;
        fh=Pn1kcjPeQmoy+eLS3V71nlRaBtDJZlUiJuKKBZMpsWU=;
        b=lmGIc2CZ+97/42uVrh8e1olEgDd9c9R4a8KHIRHNxrDKwXCS5vjYz+t233l8VzIibh
         5Hh5REkHsdUVI2yYAMSys3cxIVMJta1NF8avGpgGuLUOJFpTknNHn3Ke50KUgRsE3mH5
         CdEGfR3mAhbSk0jcK1PmbKeX8DFrWhvs+mY7J3A26p8rzMkZ2uTGo/YUU6+uYdmI+gB7
         ovdUvkGFIsbX0jdbfNVpzchpeeelFX6BJfNaYh2cPOPQOpiv/FrwBhr4H7eg1NURen8y
         ca31kvwIpMMfOMUtJuFUhk/qqJMAsfZoGxAHG8esT2/amWGAKwhAM0AYswplpyvPFr6y
         gwMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8+smenE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020ad450cf000000b0067aa11dedf1si3949163qvq.333.2023.12.13.09.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 09:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8+smenE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDSrF-0004LE-8x; Wed, 13 Dec 2023 12:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDSrD-0004Kp-TH
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 12:17:15 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDSrC-0000Hc-4r
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 12:17:15 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so170228866b.0
 for <qemu-arm@nongnu.org>; Wed, 13 Dec 2023 09:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702487832; x=1703092632; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YV1aVfliO0h/9ZxH/04CNNXbjdLWJq9x+ewRR5BBe3s=;
 b=a8+smenEAgwtYwlBoopgfeOlrn8v4nNBM7RzdX7nYM3NjdBAAugKShbPJ1ojDi6SGF
 6Ai/qRjS+ChMCOlzGkHFCto0hLHXTXEzgEfO5F1EOTrjDceeE43dF7KqWPjLJSviAWIX
 8k/hlCwJikgvXb95x4vqs0Qq0UM/DV0KFy6U0b8YBKmgGoYBkbheklMkGHADTJVfPoCM
 3sAB7QfaZwIezc0bIesCUrTE7+IPO4UmC4L/hPV+n+urbmTNdwEexYroGfaoyfYPIZ47
 B5fSCBgb2p6vE/tfeOgsZ9hh03mnHOiXmwEPm+GT5xaKlwf5FGBT6LwSxv6yzYN+J3k4
 HHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702487832; x=1703092632;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YV1aVfliO0h/9ZxH/04CNNXbjdLWJq9x+ewRR5BBe3s=;
 b=R+XeYxR/uW4qItSZQusylEzmdBWDetuIPddG857HyFccU6OAxr7oqv7qNGU+fQECtk
 BTIxhGtJToMuxSoXJky9C7BQQtMx7bBXbmnuzIAVJYmAljd0U1klVKEabU9kkP5YPFbg
 8gqvScleohYgyZ68dCji5coo7zYqvHtgs9TW0Kga+LnZ/Qq8uq3HpA3ZRe6+HzAOvPP+
 seVxubvJUaAi8dx4Kdrt6gs/ThiNg//Go4K3YJAtgE6aCtM5EFFiUEqTGO3ss3ELaQZz
 qkMNpey8sifaaJ/vWKzSUcxdVSfgrhiW3u+ATIEM596rMuHH8cZi+czdgTj2dCwYE7Ik
 uFTg==
X-Gm-Message-State: AOJu0YxRsXJ5XQtbQ53UkgMQ2IOLL4i4XLDO+//0ciyV8fztLtHdjQqf
 6L0yGfMmXK+VsOTpRh689qEP/Q==
X-Received: by 2002:a17:906:1c9:b0:a1d:1fb9:da08 with SMTP id
 9-20020a17090601c900b00a1d1fb9da08mr6949578ejj.8.1702487832405; 
 Wed, 13 Dec 2023 09:17:12 -0800 (PST)
Received: from [192.168.79.175] ([93.23.251.22])
 by smtp.gmail.com with ESMTPSA id
 li18-20020a170907199200b009fd77d78f7fsm8047804ejc.116.2023.12.13.09.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 09:17:12 -0800 (PST)
Message-ID: <fbab82ef-bb45-417a-932e-99089dd4d4a5@linaro.org>
Date: Wed, 13 Dec 2023 18:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsl-imx: Add simple RTC emulation for i.MX6 and i.MX7
 boards
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20231112092232.131-1-n.ostrenkov@gmail.com>
 <CAFEAcA8A8sGjknad1QpeJ8qank-mWWw+gRvR4PVBHk2zAHrEnQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8A8sGjknad1QpeJ8qank-mWWw+gRvR4PVBHk2zAHrEnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hu9GJNj8BIHO

Hi Peter,

On 12/12/23 15:18, Peter Maydell wrote:
> On Sun, 12 Nov 2023 at 09:22, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
> 
> Hi; thanks for this patch, and sorry I haven't got round
> to reviewing it earlier.
> 
>> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
>> ---
>>   hw/misc/imx7_snvs.c         | 59 ++++++++++++++++++++++++++++++++-----
>>   hw/misc/trace-events        |  4 +--
>>   include/hw/misc/imx7_snvs.h | 14 ++++++++-
>>   3 files changed, 67 insertions(+), 10 deletions(-)


>> @@ -31,6 +33,16 @@ struct IMX7SNVSState {
>>       SysBusDevice parent_obj;
>>
>>       MemoryRegion mmio;
>> +
>> +    /*
>> +     * Needed to preserve the tick_count across migration, even if the
>> +     * absolute value of the rtc_clock is different on the source and
>> +     * destination.
>> +     */
>> +    int64_t tick_offset_vmstate;
> 
> You don't need tick_offset_vmstate -- it is only in the p031
> RTC device as a backwards-compatibility thing for older versions
> of QEMU. Migrating tick_offset alone is sufficient in a new
> device. (It seems to have been unfortunately copied-and-pasted
> into the goldfish RTC device; we should probably fix that bug.)
> 
>> +    int64_t tick_offset;
>> +
>> +    uint64_t lpcr;
> 
> We've now added state to this device, which means that it needs
> a VMState structure to handle migration, and it needs a reset
> function.

I just noticed your v1 review after reviewing v2. Indeed
'tick_offset' need to be migrated. Now about reset(), RTC
are somehow different. When resetting a machine in the same
QEMU process I'd expect the RTC offset to not be reset.

Could this be clarified by adding a reset handler with no
code but a comment /* RTC state is usually kept by CMOS
battery and is not reset */ maybe?

> 
>>   };
>>
>>   #endif /* IMX7_SNVS_H */
>> --
> 
> thanks
> -- PMM
> 

