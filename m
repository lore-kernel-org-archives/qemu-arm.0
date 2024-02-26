Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2175727ejf;
        Mon, 26 Feb 2024 08:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoAvV36smJLQJfXpWlQ/RaIVEh61wUDqAtB5xjITzvD/7X2H0bgVE9azx8UiGDrtbUhHFz/9eDwYzD/xT6xR09YJJ5w4GW
X-Google-Smtp-Source: AGHT+IHVQU6++nVYOx+BV3VF2qIoSkicZ44oY8r8zmCsXamhAm3sTnUiqlj10TXtZRkZlT42n+h8
X-Received: by 2002:a05:620a:1917:b0:787:c4bd:2460 with SMTP id bj23-20020a05620a191700b00787c4bd2460mr8363373qkb.36.1708966368398;
        Mon, 26 Feb 2024 08:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708966368; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXy6QcBY2U0CG+DdhJ2rUro1/4wCmiouShnCDNoTTUEdXywviXs+CFKveLDJX8reqz
         QrNppDZnu/4dzcssWwzp29TqKGXBUNrsjD5CG0bMjZcNlPYVEg2nkCz6iy5XSbbwfHDX
         UPHxolYiX3bzuS7dZfmp0N9Z2gUbXsj+5ND5GMkAPxOVRg+pmeET1jb6LWXrPquhdCsQ
         iaC+tNzJeZqenm2WxtumxJxvLqoZKjVPlmJ6Dkl6dwZ7+rADd5Nw1as4YWEjhy0hV2sV
         1fIJgvYPkSjQ8r5mENrRKxfEWkZXNFoER2C0BKVvNUrHWVqcV83PLT2HpbadnTZdcBuy
         3E6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tSU6Tsgy9/9NrFLddBu3RNWmoRCIbFiXaAJyrof4SeI=;
        fh=3FiVhYo259EWoBJD4GRIbtzsmjp4m1vtj/yzKOlPYtU=;
        b=rpFPJTn22iT7+3SKoNqWg5mAKquy4MU3U95ZZf8MRABtycwwD5Ua1i4iuVCuq6Eo2c
         LOEF6Fc9mja9A2KaRXlzyr6NOxyHb5oL9ueV0xJlYYoGEnsxNFFdfghLj7cZinVeG/x4
         xbMKSiPihywHWJoOBYVtV+N4vZEz2gCY8+xzBMlrAMjsUGsMaXkVKxUcBcYf6wOc5f2f
         iUruEwj5/mlvVBb1mQJY2yn9MIe6YlI23DOO7ihf7MddZNkrI0cuRBgR+h0iqzfvrmXb
         /pBNF1FcZ3WVlxqiyp8/L/HGTal5b4tms7b3ufqQBA8RGHysfCot0wzBVneH9W5sH3hI
         S5Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIXRqK10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27-20020a05620a20db00b00787a61b4023si5477110qka.252.2024.02.26.08.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIXRqK10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reeDY-0001rC-5i; Mon, 26 Feb 2024 11:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reeDW-0001oc-5G
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:52:38 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reeDU-0006ul-Ie
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:52:37 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412a14299a4so13853275e9.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708966355; x=1709571155; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tSU6Tsgy9/9NrFLddBu3RNWmoRCIbFiXaAJyrof4SeI=;
 b=OIXRqK10idLsS7BY8GbznHT2guS70WOdbuCi/d/+eeoWE445BP9m6YMqEbdDbPdWod
 M74VUyBXqkL/TlOz6aIvNQh87BUSDEUqqUrCnf2VBlJE3+nv7SnPz+/CD4Dzs6Hvu81J
 tEcko0I+U378SzL8/wKBx255817NnFq2NjYfqa42cY/JGtUi/gHxxDQjVypV8jHc6r1Z
 WTqDjRM53A2A4oCZOKeSSQXrNtaiuY9TG7N/ZNAmcYRdF5z1hgn2onM8m+Hdwod7q3pl
 2KGqY+3XqjF85tBVDjLwjj2Uh8FMX7j15N8z1DhKELu1dfFAvmAXO1ROVmOb4AJyrwSR
 Uzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966355; x=1709571155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tSU6Tsgy9/9NrFLddBu3RNWmoRCIbFiXaAJyrof4SeI=;
 b=r334rNMGIxYnCX1t7W3rQq3ludXrZJkutCHAE0ipuyiiafTHwQ4BmBZw3odq54N8Pg
 sVguZZWQHY4AWJEe9uu2Mc8rZfpskHKmzPs52ULIRCXsvVjDKK6sUCdUKcjqm0UeLxwi
 iai1JWh+PL3UF+0bNwlspQfqqdlb/cSTOf3wc1DAcG8PYRrYdWsCFumskOi+rX/yBhgz
 WgiV7bO9HpOPJCsaw4lhZwXgrO1DM1g+b8vFfnW+7OsvZljj97CaurxDXIbU33SyZ2Ga
 A1HS/xTRxccn89vEfYE58B3JcAR9Yu3RPbR8ws8BOpZ9C/S3TTQbzar1PDq7mBzGFOMN
 udOQ==
X-Gm-Message-State: AOJu0Yx9WzBYF8o5rXhb337eaIlt1OpWkRkfELIJoBW7csuvc12hdwUO
 wZ1hr3SCFiH4zcb++yIgkAtsMRr/Af7HlN+9YJJ34Jb6/gT/TE8+vtA6BMhUd8E=
X-Received: by 2002:a05:600c:3514:b0:412:69da:e9d5 with SMTP id
 h20-20020a05600c351400b0041269dae9d5mr5135698wmq.5.1708966354888; 
 Mon, 26 Feb 2024 08:52:34 -0800 (PST)
Received: from [192.168.69.100] ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b004129860d532sm8865188wmo.2.2024.02.26.08.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:52:34 -0800 (PST)
Message-ID: <37c4bf08-c3df-4311-9f3c-a4a5c9da215d@linaro.org>
Date: Mon, 26 Feb 2024 17:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 41/41] Add RPi4B to raspi.rst
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-42-sergey.kambalin@auriga.com>
 <CAFEAcA_xdowvZkxFC7ypEFRJSTLDkdx+9E3_fwPNY=S2sK5=UA@mail.gmail.com>
 <CAFEAcA88NqshmyH5czz8ZC0Kbb81_-8VHRMCSQDbpHrPwm6AWA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA88NqshmyH5czz8ZC0Kbb81_-8VHRMCSQDbpHrPwm6AWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: u6d6n/l4Kc67

On 26/2/24 17:43, Peter Maydell wrote:
> On Mon, 26 Feb 2024 at 16:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 26 Feb 2024 at 00:03, Sergey Kambalin <serg.oker@gmail.com> wrote:
>>>
>>> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   docs/system/arm/raspi.rst | 11 +++++++----
>>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
>>> index d0a6f08b2b..c21b27744e 100644
>>> --- a/docs/system/arm/raspi.rst
>>> +++ b/docs/system/arm/raspi.rst
>>> @@ -1,5 +1,5 @@
>>> -Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
>>> -======================================================================================
>>> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``, ``raspi4b-2g``)
>>> +======================================================================================================
>>>
>>>
>>>   QEMU provides models of the following Raspberry Pi boards:
>>> @@ -12,12 +12,13 @@ QEMU provides models of the following Raspberry Pi boards:
>>>     Cortex-A53 (4 cores), 512 MiB of RAM
>>>   ``raspi3b``
>>>     Cortex-A53 (4 cores), 1 GiB of RAM
>>> -
>>> +``raspi4b-2g``
>>> +  Cortex-A72 (4 cores), 2 GiB of RAM
>>>
>>>   Implemented devices
>>>   -------------------
>>>
>>> - * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
>>> + * ARM1176JZF-S, Cortex-A7, Cortex-A53 or Cortex-A72 CPU
>>>    * Interrupt controller
>>>    * DMA controller
>>>    * Clock and reset controller (CPRMAN)
>>> @@ -34,6 +35,8 @@ Implemented devices
>>>    * MailBox controller (MBOX)
>>>    * VideoCore firmware (property)
>>>    * Peripheral SPI controller (SPI)
>>> + * PCIE Root Port (raspi4b-2g)
>>> + * GENET Ethernet Controller (raspi4b-2g)
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> For the "no PCI/no ethernet" initial version, I'll drop these last
>> two lines; we can add them in when we land the pci and ethernet
>> patches.
> 
> ...better, I'll move them to "missing devices":
> 
> --- a/docs/system/arm/raspi.rst
> +++ b/docs/system/arm/raspi.rst
> @@ -35,12 +35,11 @@ Implemented devices
>    * MailBox controller (MBOX)
>    * VideoCore firmware (property)
>    * Peripheral SPI controller (SPI)
> - * PCIE Root Port (raspi4b-2g)
> - * GENET Ethernet Controller (raspi4b-2g)

When we add them back, no need to precise "raspi4b-2g" IMO.

>   Missing devices
>   ---------------
> 
>    * Analog to Digital Converter (ADC)
>    * Pulse Width Modulation (PWM)
> + * PCIE Root Port (raspi4b-2g)
> + * GENET Ethernet Controller (raspi4b-2g)
> 
> -- PMM
> 

