Received: by 10.25.0.144 with SMTP id 138csp1115257lfa;
        Sun, 16 Apr 2017 20:18:34 -0700 (PDT)
X-Received: by 10.55.156.133 with SMTP id f127mr7627550qke.8.1492399114055;
        Sun, 16 Apr 2017 20:18:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l29si9608543qta.242.2017.04.16.20.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 20:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxBR-0002AR-Gs
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 23:18:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxBH-00028V-PS
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:18:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxBG-0002qw-EZ
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:18:23 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxB9-0002p2-QV; Sun, 16 Apr 2017 23:18:15 -0400
Received: by mail-qk0-x242.google.com with SMTP id p68so17989874qke.1;
	Sun, 16 Apr 2017 20:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ur6DGKM3gIqt7wR0xbf2wphklTvTRvRL6h1Ib+T4NuA=;
	b=lJWqHYQVSyH88UIUAKk1i+RyzEZU3ssJM3vL6JH7v3iT/3y03LFPZCoRac4nDxO8TT
	P3594aOYtXkFWPbT+pKex0gVycRolpwX2nixN+vwp9pamARmYkB6c2vCsYsB1IyBDCiA
	G4f7galniGUtaZ1hDb/5VHfSKJhTLX3BrhtYKsuD7qUGpmBa7fmMqxls6OgsuabxMQ2z
	jQ5YFCnEi5+hLkRw2W8zBAHtJJIj7oAw0cpMD17UnWQi8UplBGtqm/cmWTH+xeXVoVcs
	1+4oY1aepZnX/nfcnNftRBZ187S5gamA/TF7LHr6MFTR7PoZDqL4g3kNEUQTQgNgTPHs
	u3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ur6DGKM3gIqt7wR0xbf2wphklTvTRvRL6h1Ib+T4NuA=;
	b=JbhxdqFqtuXUrODnWKCf3radt50q2AXrIWjfT0N1n7dqYD8jJXZMTrxWQfa1DeV5cS
	HPj3eVeQFrExCYbG5ORucZDrx7g4B/iPl+SPNF3rfr3nKfI50tDs3H92pqqoTlm9cA/6
	Dd9Um/Rv1uIyzN9J6QGnRQZkP6xN4ByNK3bjGYg/EYohLHGqIAmc63u2t3L1CWp9Uu05
	GmFuh7EMNhm8bviwwnX9nYRDwP8IGHg6jM3IdpBP034+k76zgsibq7DZzk75AMU7fQI1
	ym79RZGbA5qAYGFhw1tLixLgFIiEwFxtBSZSwJ51fq6vQ58mnfUiSUepJBm5MxPMh0N0
	7O4g==
X-Gm-Message-State: AN3rC/6zAlxXMQnC7cGrFRbJWAOR75ZQ5OpOOGmxXr96MrrWmW3CH6kn
	i3Q/EYM9mQnK9g==
X-Received: by 10.55.55.67 with SMTP id e64mr6754673qka.262.1492399095103;
	Sun, 16 Apr 2017 20:18:15 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	a19sm6358385qta.48.2017.04.16.20.18.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 20:18:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26f455de-55c3-9429-0b32-ee06ae43603f@amsat.org>
Date: Mon, 17 Apr 2017 00:18:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH 03/11] armv7m: QOMify the armv7m container
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SIhgPbIevcSg

On 02/20/2017 12:35 PM, Peter Maydell wrote:
> Create a proper QOM object for the armv7m container, which
> holds the CPU, the NVIC and the bitband regions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/armv7m.h |  51 ++++++++++++++++++
>  hw/arm/armv7m.c         | 140 +++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 179 insertions(+), 12 deletions(-)
>  create mode 100644 include/hw/arm/armv7m.h
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> new file mode 100644
> index 0000000..193ad71
> --- /dev/null
> +++ b/include/hw/arm/armv7m.h
> @@ -0,0 +1,51 @@
> +/*
> + * ARMv7M CPU object
> + *
> + * Copyright (c) 2017 Linaro Ltd
> + * Written by Peter Maydell <peter.maydell@linaro.org>
> + *
> + * This code is licensed under the GPL version 2 or later.
> + */
> +
> +#ifndef HW_ARM_ARMV7M_H
> +#define HW_ARM_ARMV7M_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/arm/armv7m_nvic.h"
> +
> +#define TYPE_BITBAND "ARM,bitband-memory"
> +#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    MemoryRegion iomem;
> +    uint32_t base;
> +} BitBandState;
> +
> +#define TYPE_ARMV7M "armv7m"
> +#define ARMV7M(obj) OBJECT_CHECK(ARMv7MState, (obj), TYPE_ARMV7M)
> +
> +#define ARMV7M_NUM_BITBANDS 2
> +
> +/* ARMv7M container object.
> + * + Unnamed GPIO input lines: external IRQ lines for the NVIC
> + * + Named GPIO output SYSRESETREQ: signalled for guest AIRCR.SYSRESETREQ
> + * + Property "cpu-model": CPU model to instantiate
> + * + Property "num-irq": number of external IRQ lines
> + */
> +typedef struct ARMv7MState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +    NVICState nvic;
> +    BitBandState bitband[ARMV7M_NUM_BITBANDS];
> +    ARMCPU *cpu;
> +
> +    /* Properties */
> +    char *cpu_model;
> +} ARMv7MState;
> +
> +#endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index b2cc6e9..56d02d4 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "hw/arm/armv7m.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -120,18 +121,6 @@ static const MemoryRegionOps bitband_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -#define TYPE_BITBAND "ARM,bitband-memory"
> -#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> -
> -typedef struct {
> -    /*< private >*/
> -    SysBusDevice parent_obj;
> -    /*< public >*/
> -
> -    MemoryRegion iomem;
> -    uint32_t base;
> -} BitBandState;
> -
>  static void bitband_init(Object *obj)
>  {
>      BitBandState *s = BITBAND(obj);
> @@ -159,6 +148,132 @@ static void armv7m_bitband_init(void)
>
>  /* Board init.  */
>
> +static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
> +    0x20000000, 0x40000000
> +};
> +
> +static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
> +    0x22000000, 0x42000000
> +};
> +
> +static void armv7m_instance_init(Object *obj)
> +{
> +    ARMv7MState *s = ARMV7M(obj);
> +    int i;
> +
> +    /* Can't init the cpu here, we don't yet know which model to use */
> +
> +    object_initialize(&s->nvic, sizeof(s->nvic), "armv7m_nvic");
> +    qdev_set_parent_bus(DEVICE(&s->nvic), sysbus_get_default());
> +    object_property_add_alias(obj, "num-irq",
> +                              OBJECT(&s->nvic), "num-irq", &error_abort);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +        object_initialize(&s->bitband[i], sizeof(s->bitband[i]), TYPE_BITBAND);
> +        qdev_set_parent_bus(DEVICE(&s->bitband[i]), sysbus_get_default());
> +    }
> +}
> +
> +static void armv7m_realize(DeviceState *dev, Error **errp)
> +{
> +    /* here realize our children */
> +    ARMv7MState *s = ARMV7M(dev);
> +    Error *err = NULL;
> +    int i;
> +    char **cpustr;
> +    ObjectClass *oc;
> +    const char *typename;
> +    CPUClass *cc;
> +
> +    cpustr = g_strsplit(s->cpu_model, ",", 2);
> +
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> +    if (!oc) {
> +        error_setg(errp, "Unknown CPU model %s", cpustr[0]);
> +        g_strfreev(cpustr);
> +        return;
> +    }
> +
> +    cc = CPU_CLASS(oc);
> +    typename = object_class_get_name(oc);
> +    cc->parse_features(typename, cpustr[1], &err);
> +    g_strfreev(cpustr);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    s->cpu = ARM_CPU(object_new(typename));
> +    if (!s->cpu) {
> +        error_setg(errp, "Unknown CPU model %s", s->cpu_model);
> +        return;
> +    }
> +
> +    object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Note that we must realize the NVIC after the CPU */
> +    object_property_set_bool(OBJECT(&s->nvic), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Alias the NVIC's input and output GPIOs as our own so the board
> +     * code can wire them up. (We do this in realize because the
> +     * NVIC doesn't create the input GPIO array until realize.)
> +     */
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
> +
> +    /* Wire the NVIC up to the CPU */
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nvic), 0,
> +                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
> +    s->cpu->env.nvic = &s->nvic;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +        Object *obj = OBJECT(&s->bitband[i]);
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> +
> +        object_property_set_int(obj, bitband_input_addr[i], "base", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        object_property_set_bool(obj, true, "realized", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        sysbus_mmio_map(sbd, 0, bitband_output_addr[i]);
> +    }
> +}
> +
> +static Property armv7m_properties[] = {
> +    DEFINE_PROP_STRING("cpu-model", ARMv7MState, cpu_model),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void armv7m_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = armv7m_realize;
> +    dc->props = armv7m_properties;
> +}
> +
> +static const TypeInfo armv7m_info = {
> +    .name = TYPE_ARMV7M,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ARMv7MState),
> +    .instance_init = armv7m_instance_init,
> +    .class_init = armv7m_class_init,
> +};
> +
>  static void armv7m_reset(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> @@ -264,6 +379,7 @@ static const TypeInfo bitband_info = {
>  static void armv7m_register_types(void)
>  {
>      type_register_static(&bitband_info);
> +    type_register_static(&armv7m_info);
>  }
>
>  type_init(armv7m_register_types)
>
