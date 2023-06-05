Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2688941ejb;
        Mon, 5 Jun 2023 03:16:38 -0700 (PDT)
X-Received: by 2002:a1c:f60b:0:b0:3f7:5d:49ff with SMTP id w11-20020a1cf60b000000b003f7005d49ffmr7744859wmc.1.1685960198500;
        Mon, 05 Jun 2023 03:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685960198; cv=none;
        d=google.com; s=arc-20160816;
        b=Hil5o2JFm/a8Qdn5R/Txd2OCBIWYCGRgfWiJJYXUBG+tZI27+pP8zZFF25rZ41xqlJ
         bRLH+Pn6BYdP5Ok5dLaKT2PIyi5/U9q/FdvjBqTJCmM7Uj3culVApBBa7wVrk70y5XC2
         pz0lzcmYue1Ey5icb4LlIgOpZqY/FFW7eP398/6JU+MdMaVlv4YiweMiVIq1904Z8zE5
         YsFvV/V7ykxMw/zA8NxTvdb2iUPkethnhMENrWx+jO9NdxNjWYVqloXZSn9y0/u33zQt
         m/W5Jj/vshLMLcmtLiMM8jF384t+g38kcg7Nqmpzj5BspfyVYO5ypTo45GaJRyBI8iFc
         5GGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7go8rNNqx+hVATnyYQ8Zd/VCap0oO2FBclO+5M2vqJc=;
        b=XMz9fHGVeN9Q7/z4sEraBqWQqVRu55Fo+RJdLXbmhFlXu0DapF3Wqc9BGwqTXTa5Zf
         e9tHDOMqs9XHP0ndxI+dtsOq3bGASr0SOdkRLrb2RVhd0H2WfzjKxj36vCNlPfvmQz3a
         WYkZl0zJevLNr9zRw6PVZLsZIsQ+yv5ORIkHLywoQE0wHbbdnw2xdxPZZ+ykJkwkDnCw
         R0hrCqocCGpRW8CzuneuTj35zosZzdtkuDWNl4usJa5nl8OjOK56B7XXov0Sez4K9X2U
         BIFTvd3+DZfbSpvW9cSaiEbttx/0cDSi3mmmJGkgwIquf5MKKjwzUh9SBaYrj2ckf33x
         SK5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o6raho6F;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5-20020a05600c228500b003f733c31a57sor1368058wmf.3.2023.06.05.03.16.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Jun 2023 03:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o6raho6F;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685960198; x=1688552198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7go8rNNqx+hVATnyYQ8Zd/VCap0oO2FBclO+5M2vqJc=;
        b=o6raho6FyLt4DmvWDnkZiWijw1AS9VC1ruWh0rZEo+EAIip3lP8yrstzaiOcpj5RIs
         VcrrMXeUwlbnGn0DViC9cBx3Z8JtfXnuqgQHFvp4RPx4VDZKLKVib/JTJNhWWHg5jNc6
         sJiYHzgSerur92zO/BTZG0xhce4URCzWXG/AvQK03segCUlNycrEbDagJmcfyIBYbSzg
         HhJHP8WLgebuhIRb1EqUIEBWEEQ0jEHCwSmwp+JV+XPN/H9+VDzdY5O8BRcVXnK0yb2H
         Id2Sd1RMgO/QXUNWa/+pAT8LYRN5ylHoRfxFO7DPv3svBH4NIh+KndPbB/eza5yOOnEu
         mKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685960198; x=1688552198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7go8rNNqx+hVATnyYQ8Zd/VCap0oO2FBclO+5M2vqJc=;
        b=GIZeXu0FHCzWEco/QwzbrkiYCdiQQYE28WxoMfC/+dbSY4JmBdYdrdV0380Sl36TNf
         8F3tIiic/7+q/U6hX0oMqeV8MO1fn1HRCc3dMNZZjTofxfuYCkvDQtc/0fCulaMhEpkv
         2BMXGZ7RBFQjS5c2ClFrJhfjN4AL2Zwuckx1QjxSgpRQbKvdoeji6xarz1/jqF9kOsaC
         uJB/FaLIsjOhTL0t+cCaQgntf7rDBqgEWZAWcF9rtfk/AP1x51NLz2Dkky6NN3U3oZtD
         2dtgzOvJn5k0rxPM9zbqZqYLzqgBKTXbLyXSm8Axi+tF2TqLLKeW+JkXAHTEM09n4ygs
         KTRw==
X-Gm-Message-State: AC+VfDyCSVDOrCzIjgiBgyGngHMVNdZtjEwL7/KUrFOVGLSYUhXqGGtv
	LzIesaTNSAXr3fsyM3DAJUfhKiT9
X-Google-Smtp-Source: ACHHUZ6PB14bDgeJ1okMYbNnxO8lNxqJReGGwg7CxLJLmy5EO+chYx8BoICRU+X7o4Ysojma4MNssA==
X-Received: by 2002:a05:600c:b43:b0:3f5:ffe2:91c0 with SMTP id k3-20020a05600c0b4300b003f5ffe291c0mr8051926wmr.0.1685960198141;
        Mon, 05 Jun 2023 03:16:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.217.157])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003f080b2f9f4sm13833767wmi.27.2023.06.05.03.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 03:16:37 -0700 (PDT)
Message-ID: <596a040e-8d92-571f-5c18-618c707b6340@linaro.org>
Date: Mon, 5 Jun 2023 12:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 15/15] hw/timer/arm_timer: QOM'ify ARM_TIMER
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-16-philmd@linaro.org>
 <43f014f5-6dd7-7c46-eea4-ed9cffe8ec48@ilande.co.uk>
 <eae9ddaa-a914-b4f2-7fea-0f1731ab0706@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eae9ddaa-a914-b4f2-7fea-0f1731ab0706@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: COVLpyN2dlPK

On 3/6/23 20:12, Mark Cave-Ayland wrote:
> On 03/06/2023 19:07, Mark Cave-Ayland wrote:
> 
>> On 31/05/2023 21:35, Philippe Mathieu-Daudé wrote:
>>
>>> Introduce the ARM_TIMER sysbus device.
>>>
>>> arm_timer_new() is converted as QOM instance init()/finalize()
>>> handlers. Note in arm_timer_finalize() we release a ptimer handle
>>> which was previously leaked.
>>>
>>> ArmTimerState is directly embedded into SP804State/IcpPitState,
>>> and is initialized as a QOM child.
>>>
>>> Since the timer frequency belongs to ARM_TIMER, have it hold the
>>> QOM property. SP804State/IcpPitState directly access it.
>>>
>>> Similarly the SP804State/IcpPitState input IRQ becomes the
>>> ARM_TIMER sysbus output IRQ.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/timer/arm_timer.c | 109 +++++++++++++++++++++++++++----------------
>>>   1 file changed, 70 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
>>> index 82123b40c0..a929fbba62 100644
>>> --- a/hw/timer/arm_timer.c
>>> +++ b/hw/timer/arm_timer.c
>>> @@ -17,6 +17,7 @@
>>>   #include "qemu/module.h"
>>>   #include "qemu/log.h"
>>>   #include "qom/object.h"
>>> +#include "qapi/error.h"
>>>   /* Common timer implementation.  */
>>> @@ -29,14 +30,18 @@
>>>   #define TIMER_CTRL_PERIODIC     (1 << 6)
>>>   #define TIMER_CTRL_ENABLE       (1 << 7)
>>> -typedef struct {
>>> +#define TYPE_ARM_TIMER "arm-timer"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(ArmTimerState, ARM_TIMER)
>>
>> As per our QOM guidelines ArmTimerState and the OBJECT_* macro should 
>> live in a separate header file.
> 
> Ah wait: does "ArmTimerState is directly embedded into 
> SP804State/IcpPitState, and is initialized as a QOM child." mean that 
> ARM_TIMER is never instantiated externally?

Correct, while the type is exposed as any QOM type, it is internal to
the two devices, thus local to this unit.

I don't mind exposing the state to have a consistent QOM style.

What was discussed with Alex is:
- We don't need to convert all non-QOM devices, but
- Heterogeneous machines must contain only QOM devices;

- If a non-QOM device forces incorrect API use or abuses,
   better convert it.

>>> +struct ArmTimerState {
>>> +    SysBusDevice parent_obj;
>>
>> And don't forget to add a blank line here too.

OK.

>>>       ptimer_state *timer;
>>>       uint32_t control;
>>>       uint32_t limit;
>>>       uint32_t freq;
>>>       int int_level;
>>>       qemu_irq irq;
>>> -} ArmTimerState;
>>> +};
