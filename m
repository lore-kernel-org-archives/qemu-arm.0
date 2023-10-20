Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1095400ejb;
        Fri, 20 Oct 2023 02:42:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG407989cwpocY9hdhoBsIz1mplzmRdOkjNa1FzsJ6BJ0XAvUrrDgQEdL2LtNj6FoqJ2jGZ
X-Received: by 2002:a05:690c:d81:b0:5a7:bde8:51d5 with SMTP id da1-20020a05690c0d8100b005a7bde851d5mr1886047ywb.32.1697794958688;
        Fri, 20 Oct 2023 02:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697794958; cv=none;
        d=google.com; s=arc-20160816;
        b=gIOIZhT1cUlazfoKWyrvJb2KGPOUun3mPEmuoZhgj+bC4RDas6X+BoFv5Ehpm1/vTC
         vcgtMPhGlvO57dHdZ8BqpuZvuiuxGK9RtPKnAbwFKf8lyvnYltPm0SyM7V1G6uKa49K0
         ZAoI5hXG0JklVuj9p0jmz8gfudLAb1kH1IYfVxPZ7Jqnf4b2pUWjNrNXV7B10EPl6Pom
         Y8ib85KXyZinJu7E3WOUv4Ze70/2DSEmEu+fzkTDJ9sEOy3lHrIQmC1chFhWDux5aK96
         PMn6ALlxnPuIlMq5HVhMf2fZhSWqmuY2Kt9GXsMso0JZeX8ZVv6t03vM2IYTESWj2lpH
         js7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YMn2rh6OV3qGjuaQmaohJ4fHx7mahKsjDzRImXo7FVw=;
        fh=epjZ0P8DnFBaCz1gInDFuxIDimcPVIoGdAxoXS3FBIE=;
        b=MEcf7Xh7YCS//PokcUHzgUv6tfRZVIsNK/5LSV8mVqtKLZ98SBQWxPXrryGp0zvuxy
         WpkzNOZ5II40A1MYVZsb4/HF6i9lTAEpDXHcQEWZePgJFKW+RIH9LbzHikWctxalQbKD
         IQ9qz+5OKPRmDLDHRhs09m6Ws/GBDiFYqDZ38ZrehTMwiFYup+Yq9bUSTkfAwuuiRx/L
         JnVrAZKSoaJLWz7MMWF73E6xl5MfkUhr1jDkPU6xfy9i3la6v4Hu2HWTNoGrOHXBnQQc
         YkCb/GgaUCRd4Ksz5VBlNb9r9N+9p9/P2qsOVI7pADnoq8hIab2uY9fYOXUuxYDJRnMu
         lzjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xzMO3u4P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020ad44d4b000000b0066d0153ff33si1067592qvm.587.2023.10.20.02.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xzMO3u4P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtm1T-0000cg-0R; Fri, 20 Oct 2023 05:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtm1Q-0000Ps-Uh
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:42:24 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtm1O-0007H4-W7
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:42:24 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so95141766b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697794940; x=1698399740; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YMn2rh6OV3qGjuaQmaohJ4fHx7mahKsjDzRImXo7FVw=;
 b=xzMO3u4Pxk1EdGTRmmAntcmCl3R2dXHJ4nPLB2oGTo6bcbwu33KiunZtQJovx7v8dA
 7vfpc/8jLjTDuV6ug4YeP52Kiy+ICKUcSdsI7QaKrEQKo0JP52alvrsqgGyHizCLN97R
 AbOOQ9svlKkwaW6+lA5BuMK1DaIXOcX4L9JGORnEWqNQ/+dq+PNV1/CpGlFDe+XmkEpt
 uZmZKkUbXGID7HhHzxQOHz6mNJV1opYogq9+JLuQFrp4SVhYeA4L7pueHfBKeCokIAcV
 2gyrGSaEWzIf28oTcVFs1lPIimYLz/gcEsgTlK19oBRyEKzVtTr74+cvJZ58DbWMoNn6
 FVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697794940; x=1698399740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YMn2rh6OV3qGjuaQmaohJ4fHx7mahKsjDzRImXo7FVw=;
 b=fWR7XwLMLFr/gU+NADrd+U/1QcW9nki44WpoK1jrVEvUQ42yoWCOlnAjCz83o6hKyg
 Yn/9GiVS+Ic5kGuVXq4UsoCyfVgMNQva4Eixj62iHuFxcAyC1UbvabPxJvsR8Y+1rlig
 izSy3XGlLfQpYurepLfQAM9ljMakIhJfkkUugNfsMf9e+R5NQ50K3WXjuCJOrhVCXJfj
 Tl8WPAcBMaayQZSUoGlAwjvAVtmD69yd+x39Y1im5WtFJGpp6WKcnTGz0jS/jZrj/8Ml
 QkooyCc+CQTBLbPLhOu+IHhw4BLR/k2XKXS4AAQPZslrN2eCHOZl+jVFr7r1wTWLmqI1
 wp+Q==
X-Gm-Message-State: AOJu0YxGivzeLNsESin40zjod/HqXpYI53JgF+hKTYdzNXAAZ0j451DE
 qVUi0qQ6+QlaN1gVW627uE3cDNiZ6afkNn4cSVE=
X-Received: by 2002:a17:907:26c8:b0:9bf:4e0b:fb05 with SMTP id
 bp8-20020a17090726c800b009bf4e0bfb05mr910404ejc.11.1697794940397; 
 Fri, 20 Oct 2023 02:42:20 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 s19-20020a170906bc5300b009b957d5237asm1130015ejv.80.2023.10.20.02.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 02:42:19 -0700 (PDT)
Message-ID: <01edf713-6bec-adec-5fa5-5195b5dd4273@linaro.org>
Date: Fri, 20 Oct 2023 11:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] misc/pca9552: Fix inverted input status
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, f4bug@amsat.org
References: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
 <20231019204011.3174115-2-milesg@linux.vnet.ibm.com>
 <e0f36ef6336df26d5c123c5861d6a779c94e3eb9.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e0f36ef6336df26d5c123c5861d6a779c94e3eb9.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: C3bwcSNpZNKq

On 20/10/23 04:51, Andrew Jeffery wrote:
> On Thu, 2023-10-19 at 15:40 -0500, Glenn Miles wrote:
>>> The pca9552 INPUT0 and INPUT1 registers are supposed to
>>> hold the logical values of the LED pins.  A logical 0
>>> should be seen in the INPUT0/1 registers for a pin when
>>> its corresponding LSn bits are set to 0, which is also
>>> the state needed for turning on an LED in a typical
>>> usage scenario.  Existing code was doing the opposite
>>> and setting INPUT0/1 bit to a 1 when the LSn bit was
>>> set to 0, so this commit fixes that.
>>>
>>> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
>>> ---
>>>
>>> Changes from prior version:
>>>      - Added comment regarding pca953X
>>>      - Added cover letter
>>>
>>>   hw/misc/pca9552.c          | 18 +++++++++++++-----
>>>   tests/qtest/pca9552-test.c |  6 +++---
>>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
>>> index fff19e369a..445f56a9e8 100644
>>> --- a/hw/misc/pca9552.c
>>> +++ b/hw/misc/pca9552.c
>>> @@ -36,7 +36,10 @@ typedef struct PCA955xClass PCA955xClass;
>>>   
>>>   DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
>>>                          TYPE_PCA955X)
>>> -
>>> +/*
>>> + * Note:  The LED_ON and LED_OFF configuration values for the PCA955X
>>> + *        chips are the reverse of the PCA953X family of chips.
>>> + */
>>>   #define PCA9552_LED_ON   0x0
>>>   #define PCA9552_LED_OFF  0x1
>>>   #define PCA9552_LED_PWM0 0x2
>>> @@ -112,13 +115,18 @@ static void pca955x_update_pin_input(PCA955xState *s)
>>>   
>>>           switch (config) {
>>>           case PCA9552_LED_ON:
>>> -            qemu_set_irq(s->gpio[i], 1);
>>> -            s->regs[input_reg] |= 1 << input_shift;
>>> -            break;
>>> -        case PCA9552_LED_OFF:
>>> +            /* Pin is set to 0V to turn on LED */
>>>               qemu_set_irq(s->gpio[i], 0);
>>>               s->regs[input_reg] &= ~(1 << input_shift);
>>>               break;
>>> +        case PCA9552_LED_OFF:
>>> +            /*
>>> +             * Pin is set to Hi-Z to turn off LED and
>>> +             * pullup sets it to a logical 1.
>>> +             */
>>> +            qemu_set_irq(s->gpio[i], 1);
>>> +            s->regs[input_reg] |= 1 << input_shift;
>>> +            break;
> 
> So the witherspoon-bmc machine was a user of the PCA9552 outputs as
> LEDs. I guess its LEDs were in the wrong state the whole time? That
> looks like the only user though, and shouldn't be negatively affected.

Usually GPIO polarity is a machine/board property, not a device
one.

We could use the LED API (hw/misc/led.h) which initialize each
output with GpioPolarity.

