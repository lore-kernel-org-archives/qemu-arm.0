Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1914026ejb;
        Sat, 3 Jun 2023 11:08:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5r/9abgbvBCeGKQt7+qdTVkrRAbUSq55BpkgUdQEcTXRO6qk65G5AvUjto/aZ5OxVQkyAM
X-Received: by 2002:a05:620a:4388:b0:75b:23a0:deb9 with SMTP id a8-20020a05620a438800b0075b23a0deb9mr18132580qkp.55.1685815693950;
        Sat, 03 Jun 2023 11:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685815693; cv=none;
        d=google.com; s=arc-20160816;
        b=05kn/7y4Ul13kFA4J9UCTqocrKRb/NBD6/popiK64aoOL5c9jwHzP3fCvOibcDYCCd
         /2IsdGd/CWL7Jvh/qXnDpoBT1C7+pfN+qumtGghA2IyG5+10Oy40eWKoqX4v57Z9IMY6
         aBlDbOWkz0DJn70koHxLeqUVxFVdVYq3jsBAyJxQjvbNe6LlECSepz4Nj8Tgx3yXx8kk
         5iESoLeaXaFVSFEGEy7uhn+1nM6lK/8lJ54KxiZPrYKYiXJi+sWZ2nqLxG0F2bRh/tzO
         4Avlh25agnvxeUhHWo9oGfQ/do9UyEpTKbHMbVx3Q6UJHyZfHh6zxpDsgv6Xt92S1X3R
         uuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HoFoGlbNWvE3fD/8Od+RwLKMQdi8Rs+d9ocymh5kADI=;
        b=JOb5uSrFGHJeifYQ2iAKpN2P0c8Fr40jFbphHBM8qzYsOhJhVsueVrWzSahsHdfuQH
         ymPWSXFcD8I09b9UdQARsgo9TgMuc90vDQNTA7dExwu6tXEH+K1Mzm4S9bOpnHnp6CNS
         xbrhHDvj3i7sSNoid+onzJoFNGZD7wbEUikCr0z6ub+KWCWpT0CzS8CoeeTiiXkTPSli
         2uE9L6c8TQNx0hmw63plj0M1IHnIgrdukWANlvoxeXL69Xq9SPyV19ZeBrID9rMohCKy
         mBOLpFDDCQrOk5/Ygqhlaai8ffGTULHoN1e4Bsoe7gWYaLbRgmummyuCStwx5OOYjDc5
         IcyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=uXeu2Xe5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020a05620a079300b007595b353edcsi2363787qka.520.2023.06.03.11.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 11:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=uXeu2Xe5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5VfY-0008Am-UU; Sat, 03 Jun 2023 14:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1q5VfX-0008AN-Ne; Sat, 03 Jun 2023 14:08:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1q5VfV-0004gy-P7; Sat, 03 Jun 2023 14:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HoFoGlbNWvE3fD/8Od+RwLKMQdi8Rs+d9ocymh5kADI=; b=uXeu2Xe56pps3N4BH/qofF92hI
 jvs8uhvKppjmlLcsEQCw/10U6nyQLB/4XplAHKtyWMRgzKR4PByQ+DsdQcpg+ndEeZL3E8kFCdZze
 AIWs/+xUvyGgUwjM+gdF56RXDGnoudfG8gdx0dndrNhD2L8Sle3cg4XsmSnNFAYzpwSHwchi405wy
 vZbHbnuPhLbAdt8mT+q2vSCd3v5QC5Bb8VKi3YGW8vdzTGjedxiGJaqxXiknIpYGDh94sZ1Ptt6Wk
 x6+/QKYx9Py/fC3TjUPlmeMQhuqJoU0ZCVcecwdBM0V7xq4n2qhN7M/tBUFuzotjXQR+H4PVvKumd
 33a/jJQu4sieMlgcO7+RO40ICPQS3XGkFqy8WEsjHF4MHcuKkXQikH1+VTW3y/mwjM6tJZBDjn2UA
 toRdwNnrZ8bfJcVfQcEAFLtyeWXMLNwxbCSXuCMwkgGQh1EfTSEPire3B2wKiwP9LG7/Mjb1XC8ma
 fqjoGlNCvEDYK8gTfy6tpPY8EwMy7RLs9ve1FjrblvBGPaymyMQfNxbjzvrCuiyFf84p4V8uTYQb8
 RnrLx1RgecwRPIvl9/IiUOMWJRjou2Li0vJmCY36cuxMHnJET7fpMEdHiEYIRhI9aSSktaxSuwrQL
 z2cjrkD9lZxoi3aTH65K5Z19fSEKIeQQiEBUSwwcA=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1q5VfH-0000Oi-TB; Sat, 03 Jun 2023 19:07:51 +0100
Message-ID: <43f014f5-6dd7-7c46-eea4-ed9cffe8ec48@ilande.co.uk>
Date: Sat, 3 Jun 2023 19:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-16-philmd@linaro.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230531203559.29140-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 15/15] hw/timer/arm_timer: QOM'ify ARM_TIMER
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LG04c0VntwgJ

On 31/05/2023 21:35, Philippe Mathieu-Daudé wrote:

> Introduce the ARM_TIMER sysbus device.
> 
> arm_timer_new() is converted as QOM instance init()/finalize()
> handlers. Note in arm_timer_finalize() we release a ptimer handle
> which was previously leaked.
> 
> ArmTimerState is directly embedded into SP804State/IcpPitState,
> and is initialized as a QOM child.
> 
> Since the timer frequency belongs to ARM_TIMER, have it hold the
> QOM property. SP804State/IcpPitState directly access it.
> 
> Similarly the SP804State/IcpPitState input IRQ becomes the
> ARM_TIMER sysbus output IRQ.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 109 +++++++++++++++++++++++++++----------------
>   1 file changed, 70 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 82123b40c0..a929fbba62 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -17,6 +17,7 @@
>   #include "qemu/module.h"
>   #include "qemu/log.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
>   
>   /* Common timer implementation.  */
>   
> @@ -29,14 +30,18 @@
>   #define TIMER_CTRL_PERIODIC     (1 << 6)
>   #define TIMER_CTRL_ENABLE       (1 << 7)
>   
> -typedef struct {
> +#define TYPE_ARM_TIMER "arm-timer"
> +OBJECT_DECLARE_SIMPLE_TYPE(ArmTimerState, ARM_TIMER)

As per our QOM guidelines ArmTimerState and the OBJECT_* macro should live in a 
separate header file.

> +struct ArmTimerState {
> +    SysBusDevice parent_obj;

And don't forget to add a blank line here too.

>       ptimer_state *timer;
>       uint32_t control;
>       uint32_t limit;
>       uint32_t freq;
>       int int_level;
>       qemu_irq irq;
> -} ArmTimerState;
> +};
>   
>   /* Check all active timers, and schedule the next timer interrupt.  */
>   
> @@ -172,23 +177,42 @@ static const VMStateDescription vmstate_arm_timer = {
>       }
>   };
>   
> -static void arm_timer_reset(ArmTimerState *s)
> +static void arm_timer_reset(DeviceState *dev)
>   {
> +    ArmTimerState *s = ARM_TIMER(dev);
> +
>       s->control = TIMER_CTRL_IE;
>   }

If you're currently set up to test the ARM timers with these changes, is it worth 
considering converting this to use the Resettable interface at the same time?

> -static ArmTimerState *arm_timer_new(uint32_t freq, qemu_irq irq_out)
> +static void arm_timer_init(Object *obj)
>   {
> -    ArmTimerState *s;
> +    ArmTimerState *s = ARM_TIMER(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>   
> -    s = g_new0(ArmTimerState, 1);
> -    s->freq = freq;
> -    arm_timer_reset(s);
> -
> -    s->irq = irq_out;
>       s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
> -    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
> -    return s;
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static void arm_timer_finalize(Object *obj)
> +{
> +    ArmTimerState *s = ARM_TIMER(obj);
> +
> +    ptimer_free(s->timer);
> +}
> +
> +static Property arm_timer_properties[] = {
> +    DEFINE_PROP_UINT32("freq", ArmTimerState, freq, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void arm_timer_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->reset = arm_timer_reset;
> +    dc->vmsd = &vmstate_arm_timer;
> +    device_class_set_props(dc, arm_timer_properties);
>   }
>   
>   /*
> @@ -204,11 +228,9 @@ struct SP804State {
>       SysBusDevice parent_obj;
>   
>       MemoryRegion iomem;
> -    ArmTimerState *timer[2];
> -    uint32_t freq[2];
> +    ArmTimerState timer[2];
>       int level[2];
>       qemu_irq irq;
> -    qemu_irq irq_in[2];
>   };
>   
>   static const uint8_t sp804_ids[] = {
> @@ -233,10 +255,10 @@ static uint64_t sp804_read(void *opaque, hwaddr offset,
>       SP804State *s = opaque;
>   
>       if (offset < 0x20) {
> -        return arm_timer_read(s->timer[0], offset);
> +        return arm_timer_read(&s->timer[0], offset);
>       }
>       if (offset < 0x40) {
> -        return arm_timer_read(s->timer[1], offset - 0x20);
> +        return arm_timer_read(&s->timer[1], offset - 0x20);
>       }
>   
>       /* TimerPeriphID */
> @@ -265,12 +287,12 @@ static void sp804_write(void *opaque, hwaddr offset,
>       SP804State *s = opaque;
>   
>       if (offset < 0x20) {
> -        arm_timer_write(s->timer[0], offset, value);
> +        arm_timer_write(&s->timer[0], offset, value);
>           return;
>       }
>   
>       if (offset < 0x40) {
> -        arm_timer_write(s->timer[1], offset - 0x20, value);
> +        arm_timer_write(&s->timer[1], offset - 0x20, value);
>           return;
>       }
>   
> @@ -304,6 +326,12 @@ static void sp804_init(Object *obj)
>       memory_region_init_io(&s->iomem, obj, &sp804_ops, s,
>                             "sp804", 0x1000);
>       sysbus_init_mmio(sbd, &s->iomem);
> +
> +    qdev_init_gpio_in_named(DEVICE(obj), sp804_set_irq,
> +                            "timer-in", ARRAY_SIZE(s->timer));
> +    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
> +        object_initialize_child(obj, "timer[*]", &s->timer[i], TYPE_ARM_TIMER);
> +    }
>   }
>   
>   static void sp804_realize(DeviceState *dev, Error **errp)
> @@ -311,23 +339,17 @@ static void sp804_realize(DeviceState *dev, Error **errp)
>       SP804State *s = SP804(dev);
>   
>       for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
> -        s->irq_in[i] = qemu_allocate_irq(sp804_set_irq, s, i);
> -        s->timer[i] = arm_timer_new(s->freq[i], s->irq_in[i]);
> -    }
> -}
> -
> -static void sp804_unrealize(DeviceState *dev)
> -{
> -    SP804State *s = SP804(dev);
> -
> -    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
> -        qemu_free_irq(s->irq_in[i]);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer[i]), errp)) {
> +            return;
> +        }
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0,
> +                           qdev_get_gpio_in_named(dev, "timer-in", i));
>       }
>   }
>   
>   static Property sp804_properties[] = {
> -    DEFINE_PROP_UINT32("freq0", SP804State, freq[0], 1000000),
> -    DEFINE_PROP_UINT32("freq1", SP804State, freq[1], 1000000),
> +    DEFINE_PROP_UINT32("freq0", SP804State, timer[0].freq, 1000000),
> +    DEFINE_PROP_UINT32("freq1", SP804State, timer[1].freq, 1000000),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -336,7 +358,6 @@ static void sp804_class_init(ObjectClass *klass, void *data)
>       DeviceClass *k = DEVICE_CLASS(klass);
>   
>       k->realize = sp804_realize;
> -    k->unrealize = sp804_unrealize;
>       device_class_set_props(k, sp804_properties);
>       k->vmsd = &vmstate_sp804;
>   }
> @@ -350,8 +371,7 @@ struct IntegratorPitState {
>       SysBusDevice parent_obj;
>   
>       MemoryRegion iomem;
> -    ArmTimerState *timer[3];
> -    qemu_irq irq_in[3];
> +    ArmTimerState timer[3];
>       qemu_irq irq[3];
>   };
>   
> @@ -368,7 +388,7 @@ static uint64_t icp_pit_read(void *opaque, hwaddr offset,
>           return 0;
>       }
>   
> -    return arm_timer_read(s->timer[n], offset & 0xff);
> +    return arm_timer_read(&s->timer[n], offset & 0xff);
>   }
>   
>   static void icp_pit_write(void *opaque, hwaddr offset,
> @@ -383,7 +403,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
>           return;
>       }
>   
> -    arm_timer_write(s->timer[n], offset & 0xff, value);
> +    arm_timer_write(&s->timer[n], offset & 0xff, value);
>   }
>   
>   static const MemoryRegionOps icp_pit_ops = {
> @@ -414,7 +434,8 @@ static void icp_pit_init(Object *obj)
>                               "timer-in", ARRAY_SIZE(s->timer));
>   
>       for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
> -        s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
> +        object_initialize_child(obj, "timer[*]", &s->timer[i], TYPE_ARM_TIMER);
> +        qdev_prop_set_uint32(DEVICE(&s->timer[i]), "freq", tmr_freq[i]);
>           sysbus_init_irq(dev, &s->irq[i]);
>       }
>   
> @@ -430,7 +451,10 @@ static void icp_pit_realize(DeviceState *dev, Error **errp)
>       IntegratorPitState *s = INTEGRATOR_PIT(dev);
>   
>       for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
> -        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer[i]), errp)) {
> +            return;
> +        }
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0,
>                              qdev_get_gpio_in_named(dev, "timer-in", i));
>       }
>   }
> @@ -444,6 +468,13 @@ static void icp_pit_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo arm_timer_types[] = {
>       {
> +        .name           = TYPE_ARM_TIMER,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(ArmTimerState),
> +        .instance_init  = arm_timer_init,
> +        .instance_finalize = arm_timer_finalize,
> +        .class_init     = arm_timer_class_init,
> +    }, {
>           .name           = TYPE_INTEGRATOR_PIT,
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(IntegratorPitState),


ATB,

Mark.

