Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp95596njb;
        Thu, 27 Feb 2025 01:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSAYueuVNIyAyic4vmXzEZmqbgJC96zZBCfJ3IkNbPosnYW/upsOvYdGFx6cn+vAs3yQ036hFZlRfgZA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTfkD4xmMIEkpDQKx+EnnxjVSrlad9GuRrXAXROPDPctqF+jDf7dGUUvmfBHtdRManm+79
X-Received: by 2002:a05:620a:2416:b0:7c0:b3cd:9bc5 with SMTP id af79cd13be357-7c0cf8ea715mr3429919485a.32.1740647741620;
        Thu, 27 Feb 2025 01:15:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740647741; cv=none;
        d=google.com; s=arc-20240605;
        b=YmrkoujKXyLJlfnBFlxurciOA4ns7w22q8gGssLo3iJdLBddms0IMxVEZVcIJ1O+KC
         pTFnkEJUtrtoYiwIr+r0Tb5PURvMuZd1nxE1sfBN/TxZV+S8XAIKIr3gUO7Su62ufBz6
         WKSQ14wvcVtyiqpmev9Qf337NODlHYfQIN8S26Pc4wrXeS9+yCcoFTB2vShs7afsJL7Q
         Sz0Ggn7fzrGoKFAPwjPlNE3NsyDX1W79yRENEqnBygHYMXU43vAPweH20g1G7h2Dhxv3
         7V43HxYlcf1fGlrry4gyP14eGowOOORzS6VRTIfM9hFXeWBlcf+BIsMVXcx+pJjqVISj
         RSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :mime-version:date:message-id:dkim-signature:dkim-signature;
        bh=05TWXLxxSWxWzqa01vyGWnLisLLuEypTrNYSHFlkzvI=;
        fh=l+wIeQBZTt6KFGuWRaAJw87gr97xKXD8a3jQIkSXRjc=;
        b=JU2MwAZlEVkfLAI0m0TGwbZ4urR6LvMpep/Nq3EO8IQBLY8K+7T96QdbxdQ7zw6jJ8
         No1an0FBVURDHVtTfdrkIv3xlRj7vO9EXp6HphfEIDIOYyDMb33MPntch8zNQNq+H1ZN
         xIcGYwkF3Ic3LsmW+I861rtGiV7F2N4EE0NQf0TM3iP662I4BO+PQAkrVgEPL6drGEj3
         SChP9YLtuJW8/KVoF3F2YJIfr0jkfyF79cZKgkhwg6I9dtxI36cPGkUFuR1JAhEL3ca1
         av/dtQJVsEBnvFqGMTosLv52ombRkHe/gJZRl7NYCe12K/ltpVFLBdpb0I+cxBE+Ek8B
         y4NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@csclub.uwaterloo.ca header.s=csc header.b=NSQnSJHO;
       dkim=neutral (no key) header.i=@csclub.uwaterloo.ca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csclub.uwaterloo.ca
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378da6797si88737485a.481.2025.02.27.01.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 01:15:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@csclub.uwaterloo.ca header.s=csc header.b=NSQnSJHO;
       dkim=neutral (no key) header.i=@csclub.uwaterloo.ca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csclub.uwaterloo.ca
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnZzS-0006wA-Lb; Thu, 27 Feb 2025 04:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s23adhik@csclub.uwaterloo.ca>)
 id 1tnZzE-0006vH-TI; Thu, 27 Feb 2025 04:15:22 -0500
Received: from mail.csclub.uwaterloo.ca ([2620:101:f000:4901:c5c::5e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <s23adhik@csclub.uwaterloo.ca>)
 id 1tnZzB-0005CH-5X; Thu, 27 Feb 2025 04:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csclub.uwaterloo.ca;
 s=csc; t=1740647712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05TWXLxxSWxWzqa01vyGWnLisLLuEypTrNYSHFlkzvI=;
 b=NSQnSJHObOmkg0NMiWBNDa0/zo+QN26qNhRPINcLIi1IXuehiw/QxkEIfYT+ct/fQ0X7IV
 VBOJtAS3wOezDdUUlmVr1GL8yrg7tAdA1TH0y+4oBfZsZGpVH4yUwS0h9trwXCqnifh0Ps
 4F73yW3AdlTvtgjPd/5wO/AKFWYqHoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=csclub.uwaterloo.ca;
 s=202502e; t=1740647712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05TWXLxxSWxWzqa01vyGWnLisLLuEypTrNYSHFlkzvI=;
 b=W0Kizpd0v24IqcbJ71QmGP6wofLDSzhCBh1u0+nX0ZGncmIQf6nUBQbBNRWPdJgjVVf1mJ
 uEpAcAbIYb73ibAQ==
Message-ID: <aef79501-b99f-4e84-b6fe-14dec1e030e6@csclub.uwaterloo.ca>
Date: Thu, 27 Feb 2025 04:15:11 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] bcm2838: Add GIC-400 timer interupt connections
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
References: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
 <CAFEAcA9kED+fB1repp2+r-zMfZ_5ZeAkZq2ChyxjSUo1j5gAFQ@mail.gmail.com>
Content-Language: en-US
From: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
In-Reply-To: <CAFEAcA9kED+fB1repp2+r-zMfZ_5ZeAkZq2ChyxjSUo1j5gAFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2620:101:f000:4901:c5c::5e2d;
 envelope-from=s23adhik@csclub.uwaterloo.ca; helo=mail.csclub.uwaterloo.ca
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: ecRGD2EVCg3f

Hello, thank you for taking the time to review the patch,
and tell us what we could improve.

> The values passed to qdev_get_gpio_in(DEVICE(&s->gic), ...)
> should be GIC_SPI_INTERRUPT_* values, which we define in
> include/hw/arm/bcm2838_peripherals.h. You can add new ones for
> the four timers.
>
Hm, I'll make those changes (hopefully) by Wednesday next week.
I'm a bit busy, so it might take a bit of time to do it.

> The systmr INTERRUPT_TIMER0..3 sysbus IRQ outputs are already
> being wired up in the function bcm_soc_peripherals_common_realize()
> in hw/arm/bcm2835_peripherals.c (to the TYPE_BCM2835_IC
> interrupt controller), and it isn't valid to wire one input
> directly to multiple outputs.
>
> In fact it looks like we are currently getting this wrong for
> all of the interrupts that need to be wired to both the
> "legacy interrupt controller" and the GIC. I think at the moment
> what happens is that the wiring to the GIC will happen last
> and this overrides the earlier wiring to the legacy interrupt
> controller, so code using the latter won't work correctly.
I'll try reading through the relevant sections and send an
updated patch later next week. From what I can tell it falls
under the bcm2835_pheripherals.c file, right?


On 2025-02-24 08:22, Peter Maydell wrote:
> On Sun, 16 Feb 2025 at 03:54, Sourojeet Adhikari
> <s23adhik@csclub.uwaterloo.ca> wrote:
>> Hello everyone,
>>
>> This patch adds support for the system timer interrupts
>> in QEMU's BCM2838 model. It defines a new constant
>> called GIC400_TIMER_INT, and connects 4 timer interupts
>> to the GIC-400.
>> Previously timer interupts were not being routed to the
>> interupt controller, causing scheduling, and some other
>> stuff to have issues (me and a few friends bumped into
>> this, and that's why this was written lol).
>>
>> Signed-off-by: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
> Hi; thanks for sending this patch, but I'm afraid this doesn't
> look like a correct fix for the bug you've run into.
>
>> ---
>>    hw/arm/bcm2838.c | 11 +++++++++++
>>    1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
>> index ddb7c5f..0a4179f 100644
>> --- a/hw/arm/bcm2838.c
>> +++ b/hw/arm/bcm2838.c
>> @@ -21,6 +21,8 @@
>>    #define GIC400_TIMER_S_EL1_IRQ      13
>>    #define GIC400_TIMER_NS_EL1_IRQ     14
>>    #define GIC400_LEGACY_IRQ           15
>> +#define GIC400_TIMER_INT            (96 - 32)
>> +
>>
>>    /* Number of external interrupt lines to configure the GIC with */
>>    #define GIC_NUM_IRQS                192
>> @@ -176,6 +178,15 @@ static void bcm2838_realize(DeviceState *dev, Error
>> **errp)
>>                        qdev_get_gpio_in(gicdev, PPI(n, VIRTUAL_PMU_IRQ)));
>>        }
>>
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 0,
>> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
>> INTERRUPT_TIMER0));
> The values passed to qdev_get_gpio_in(DEVICE(&s->gic), ...)
> should be GIC_SPI_INTERRUPT_* values, which we define in
> include/hw/arm/bcm2838_peripherals.h. You can add new ones for
> the four timers.
>
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 1,
>> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
>> INTERRUPT_TIMER1));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 2,
>> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
>> INTERRUPT_TIMER2));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 3,
>> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
>> INTERRUPT_TIMER3));
> The systmr INTERRUPT_TIMER0..3 sysbus IRQ outputs are already
> being wired up in the function bcm_soc_peripherals_common_realize()
> in hw/arm/bcm2835_peripherals.c (to the TYPE_BCM2835_IC
> interrupt controller), and it isn't valid to wire one input
> directly to multiple outputs.
>
> In fact it looks like we are currently getting this wrong for
> all of the interrupts that need to be wired to both the
> "legacy interrupt controller" and the GIC. I think at the moment
> what happens is that the wiring to the GIC will happen last
> and this overrides the earlier wiring to the legacy interrupt
> controller, so code using the latter won't work correctly.
>
> thanks
> -- PMM
