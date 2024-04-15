Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1106471ejc;
        Mon, 15 Apr 2024 02:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6cnpRVaHgbRkmLcK87nSadEPTFNQV4XE3+saLvW6Sb1xPTH9Zm2IdsE2GHNFG47gSKWUbaKGc2dvbQGQCA8++/5etjbjb
X-Google-Smtp-Source: AGHT+IGuIZzbNdZtXWjVZjs1OCsG4iihYj0NlqMQSNNA81y9BZIrb/AlRFRa8JMGim7YHP6ZIkT8
X-Received: by 2002:ac8:7f14:0:b0:436:a5e2:4c46 with SMTP id f20-20020ac87f14000000b00436a5e24c46mr10276218qtk.43.1713173721181;
        Mon, 15 Apr 2024 02:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713173721; cv=none;
        d=google.com; s=arc-20160816;
        b=rZ76nvB/MuKJBn5zPqA3fscYT+KDqeikFkCgvz9+JtAQeGnd15f94cBsGf3+WXhd+z
         vwG3aoGeTunl7JJ79dylOfcZ1zbRuQpTC/taOhC+iQFy10ICEr4TFilpIKrS1SL1l7EU
         HDIPbuQ0dunQzAE4yeWw/7bg/oHq6go2neqU8kTbdgOBLZwJGWC6T5baL0iVXRxgNTxW
         ELlaZmHCVfrFKOakYGpPSdr4QPs4bcNFMg8EyPiOLuHztRdtkfilppM+/UItZh8uySUf
         TZYGGjkzrGSHR8jbETyCdnrGn4ja/bWZdMIshRTthjeJmd9UMinu3m1VwHcxOFs7qo3C
         UBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qhG/rnNvfjNhkxtTkCh2CAkUhTmJ3GpHHegojnF1Z7s=;
        fh=+mjdKcPji+BHgE4piSpQuOpYF1qs7EEjEXQSrAuqd50=;
        b=NmnGgWjnmEWlAdCt2dWnVwsXpjAW4bHZ5gHHD3Hwjbqva1pEHEsOVAQJdIQWQ8U9Bu
         Raw79jo9nA6d0bh2mdsfTWC7LizeLyyj5pj5AfAdly/rb9ouiJFXmip51euT8IscP6Nd
         wTL/TJYEJMxBxSZGNLn/hq7gUyeZkXMjesdNIyouKNmbNqpCYCSFX13ke2mU/C9Qch7j
         1a6Acdo9dYxmHLKfq0xwaSibL9NIxc+30Vae9FC0QjrYO9xMRqq8VjPO31Ez1dxHLTkz
         shI25vAhNi7RMFReBGTPaVBX489TCFjqdHmDAtuQyyLHGRNmUoqjzcGCPq9HeoVpm5Tc
         UyQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EW2dUXmQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2-20020ac85782000000b0043686a97ad5si7617659qta.789.2024.04.15.02.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 02:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EW2dUXmQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwIk8-0001sL-Bn; Mon, 15 Apr 2024 05:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIk6-0001qm-CB
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:35:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIk4-0004R5-Hp
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:35:14 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4187481e384so1819535e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713173711; x=1713778511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qhG/rnNvfjNhkxtTkCh2CAkUhTmJ3GpHHegojnF1Z7s=;
 b=EW2dUXmQ1xvstX2ucT350vxboJFJaC0ogzI0Btg77uaQkVjQxhpUHIF2+9bUB8+Wup
 F5rKXFClciuj+CWnmdF/ULD1GhtO/vnfjIZ4WM7YsuNYK20fMLPcWdYwQoIZZ0rXl+JA
 Igg4L5nvaz4eS6eMCLyDz2vEav2KG0hM/5UbUamhKwYQrH3JvBUPPjzNXDxcwX2k5lKs
 fCHWaNatXPsrNQ/XPcrdJVwPxOl32AILaXD+S5uk3s1gQX/hqoxQiDYPC/mcMWIa4kMF
 eNLFQURIUK1B4pMemyw8ZAQS9lkNisFXC3PVLv1RaA4cJ04qo1xwowYTxBC24G8KDqsz
 slag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713173711; x=1713778511;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qhG/rnNvfjNhkxtTkCh2CAkUhTmJ3GpHHegojnF1Z7s=;
 b=qMyNM/RjYVmBvjhA1lfstrZ/bReQLQI4BvdrX2OHspgJ0IIYjlqpFS+mIxrZQORcxL
 zzNr3fvwKyzSqB6R+llrPd6MvQok6H1MWjzFa0VoexADp+8xE+TOsg7CbuYtZX4ZEB5d
 c1fqcDq0wpfh9bTvtG2P+Z77KaWpLdG4/VeAWs2D8Big8bmEp5upAhQaxzBwKOG/P8hN
 mBp4NYb27yci0ScSM6mLMWwy4PEaVC9Vc0dzrMtIzmiWbKPqk/OdNfkRuLFG+3ACyUCj
 dDbL6wRfiU5a9nHlrQfs3tXpFoyUxNQwA5m88zqfHQZVLelEIqGbBouwY78x1MwkzomB
 12cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7XCROUsJwpcmp2dOiFVJojufFJbHh3iONgcmGQNdV6Pm2W5FFymUJHlVhtv+gO+TYKHcUetSBkKGL8f4uhEL1fmtp
X-Gm-Message-State: AOJu0Ywriej99G4ijoAu3fV0Da1UEhyUJ1H3rDwFpVIpa83egw/M+VSA
 t9VHUuu3vCXoa+RKCT7+bq2P4QYnOjHHPqRrOttglXa0UQHh+IVUJjG1YXXrVZs=
X-Received: by 2002:a05:600c:5251:b0:418:1a49:81f with SMTP id
 fc17-20020a05600c525100b004181a49081fmr5736581wmb.10.1713173710750; 
 Mon, 15 Apr 2024 02:35:10 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.132.126])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c4d0200b0041668053ca9sm12402551wmp.0.2024.04.15.02.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 02:35:10 -0700 (PDT)
Message-ID: <d0ec7672-8604-4a9e-9a4a-90fd89e419b6@linaro.org>
Date: Mon, 15 Apr 2024 11:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] hw/arm : Pass STM32L4x5 SYSCFG gpios to STM32L4x5
 SoC
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240414130604.182059-1-ines.varhol@telecom-paris.fr>
 <20240414130604.182059-3-ines.varhol@telecom-paris.fr>
 <11343bd1-1f0d-4654-a50d-f3b19fabf9e8@linaro.org>
Content-Language: en-US
In-Reply-To: <11343bd1-1f0d-4654-a50d-f3b19fabf9e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: BjpidZGP6X4Z

On 15/4/24 11:29, Philippe Mathieu-Daudé wrote:
> Hi Inès,
> 
> On 14/4/24 15:05, Inès Varhol wrote:
>> Exposing SYSCFG inputs to the SoC is practical in order to wire the SoC
>> to the optional DM163 display from the board code (GPIOs outputs need
>> to be connected to both SYSCFG inputs and DM163 inputs).
>>
>> STM32L4x5 SYSCFG in-irq interception needed to be changed accordingly.
>>
>> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
>> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
>> ---
>>   hw/arm/stm32l4x5_soc.c              |  6 ++++--
>>   tests/qtest/stm32l4x5_gpio-test.c   | 12 +++++++-----
>>   tests/qtest/stm32l4x5_syscfg-test.c | 16 +++++++++-------
>>   3 files changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
>> index 40e294f838..c4b45e6956 100644
>> --- a/hw/arm/stm32l4x5_soc.c
>> +++ b/hw/arm/stm32l4x5_soc.c
>> @@ -1,8 +1,8 @@
>>   /*
>>    * STM32L4x5 SoC family
>>    *
>> - * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
>> - * Copyright (c) 2023 Inès Varhol <ines.varhol@telecom-paris.fr>
>> + * Copyright (c) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
>> + * Copyright (c) 2024 Inès Varhol <ines.varhol@telecom-paris.fr>
> 
> You can keep 2023-2024.
> 
>>    *
>>    * SPDX-License-Identifier: GPL-2.0-or-later
>>    *
>> @@ -221,6 +221,8 @@ static void stm32l4x5_soc_realize(DeviceState 
>> *dev_soc, Error **errp)
>>           }
>>       }
>> +    qdev_pass_gpios(DEVICE(&s->syscfg), dev_soc, NULL);
>> +
>>       /* EXTI device */
>>       busdev = SYS_BUS_DEVICE(&s->exti);
>>       if (!sysbus_realize(busdev, errp)) {
>> diff --git a/tests/qtest/stm32l4x5_gpio-test.c 
>> b/tests/qtest/stm32l4x5_gpio-test.c
>> index 0f6bda54d3..495a6fc413 100644
>> --- a/tests/qtest/stm32l4x5_gpio-test.c
>> +++ b/tests/qtest/stm32l4x5_gpio-test.c
>> @@ -43,6 +43,8 @@
>>   #define OTYPER_PUSH_PULL 0
>>   #define OTYPER_OPEN_DRAIN 1
>> +#define SYSCFG "/machine/soc"
> 
> Can we have a comment such /* SoC forwards GPIOs to SysCfg */?
> 
> (Similar comments for stm32l4x5_syscfg-test.c).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


