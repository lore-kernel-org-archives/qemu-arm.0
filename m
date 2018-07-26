Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp234831wru;
        Thu, 26 Jul 2018 04:02:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfv0eyGwEsBqwJL+l1XXFjeL+VvNyDduBqeIOiWLMzyZVqIDCbwLvGLak90FON7vD3Xk/AN
X-Received: by 2002:ac8:3209:: with SMTP id x9-v6mr1285261qta.128.1532602961165;
        Thu, 26 Jul 2018 04:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532602961; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzUKQgvbG1FCEL31vHvXwW8TMiX8T9kyteGd8x3PNMlBP397r1S6Ql8tsb1au20Anw
         Dh0S3ZQCj6s0a07O6APIKt/5wfv9ihSXmw6YVR/t/8SoiGSlJ+pkoaQmcupWN/0+nTc5
         pFtMWxFOB5Ntatfsrs6+MXpvnq3Iqxwagv4mRIUwUj9ajSyMU+0Q6BmqMkWb+XpWO84h
         RsgAaX430vJmnTv8sbgJdC8SYH5D4tpdgOpJi4HT7fjrzT4i7nFkXDpIwSf99jHKy4t3
         WphyblvwebE9hqRnIhS+DPkZxTHfZusXjIdeRWIemD1dXQrRnz+PTNPhy807khsa5TZJ
         GwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=ve3vDgps6I2Wc5U9Vbt5wefYVncTephoiQ92acXrZmE=;
        b=yG1yYpC09tpFu6C6mO072EA7rQf9J+9pEhaDYJ0itKqGi4G3ApNwWAf2zBnRf0mGDY
         hQPE8PPlpyf2ztPST5IKAekWSnZXSTh5BuR8pnvaYJqXQ3fiaIPv6pLBNiOGbdDq/A+X
         8fBmr1DF2hluUZof8WIDUttv13MNXF0LUIBtbf6Kt2s0BCAuMtXJguAmSObrFveATd/0
         AJfulnPwUz8joll6dwoaShMZIIzwbeZY+aiTvzEi5/2/aqX6jbg7zDGxMv6n6k8Cs9Rm
         HLNkNsnYoUr+KCEDX39Gqrq/hN/kKsBGoMJNit+AUSlps1deIy2bFNTt+8t7MS7Sql/x
         aUdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=PqWnp32r;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=PqWnp32r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65-v6si990972qkf.79.2018.07.26.04.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jul 2018 04:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=PqWnp32r;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=PqWnp32r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fie2a-0004N2-EM
	for alex.bennee@linaro.org; Thu, 26 Jul 2018 07:02:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1fie1W-00043D-C8
	for qemu-devel@nongnu.org; Thu, 26 Jul 2018 07:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1fie1T-0002Bq-E9
	for qemu-devel@nongnu.org; Thu, 26 Jul 2018 07:01:34 -0400
Received: from fallback21.mail.ru ([94.100.176.131]:51086)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jusual@mail.ru>)
	id 1fie1S-0002B5-UR; Thu, 26 Jul 2018 07:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ve3vDgps6I2Wc5U9Vbt5wefYVncTephoiQ92acXrZmE=; 
	b=PqWnp32rfDRQxou0xRw35LEaRhRozxyOFaoJ7ikCO7hC0itekMlbFQeyMZ/b9pjAS+UQ9nYS33FZ9dV1WC1A+ThBjbX8Bc8CCeISGf0QRQdy6zg/2gjvyxltYZJBYusRnnIv9QCOv6p8rHzuPI6O48Wp0btSmkqnNODZ9jQTKr0=;
Received: from [10.161.64.40] (port=58802 helo=smtp32.i.mail.ru)
	by fallback21.m.smailru.net with esmtp (envelope-from <jusual@mail.ru>)
	id 1fie1N-0005Si-Oi; Thu, 26 Jul 2018 14:01:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ve3vDgps6I2Wc5U9Vbt5wefYVncTephoiQ92acXrZmE=; 
	b=PqWnp32rfDRQxou0xRw35LEaRhRozxyOFaoJ7ikCO7hC0itekMlbFQeyMZ/b9pjAS+UQ9nYS33FZ9dV1WC1A+ThBjbX8Bc8CCeISGf0QRQdy6zg/2gjvyxltYZJBYusRnnIv9QCOv6p8rHzuPI6O48Wp0btSmkqnNODZ9jQTKr0=;
Received: by smtp32.i.mail.ru with esmtpa (envelope-from <jusual@mail.ru>)
	id 1fie1D-0007WY-4K; Thu, 26 Jul 2018 14:01:15 +0300
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180726023645.13927-1-joel@jms.id.au>
	<20180726023645.13927-3-joel@jms.id.au>
Message-ID: <94bc2d11-7916-bc4e-02d8-da62e3ed303b@mail.ru>
Date: Thu, 26 Jul 2018 14:01:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180726023645.13927-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-7FA49CB5: 0D63561A33F958A5667D1056A30611AAF96441F860454A3A454361BA526142620A6AB1C7CE11FEE3B2DECCBDF547A30576E601842F6C81A1F004C906525384306FED454B719173D6725E5C173C3A84C37952320C71F5F8670F113A61C73AE939B7122A4C44A4E42FC4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F9A3D58A9A349F5073B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: 3BB5BBD942886723B37B16224A9CF35EE060C0AF5051814A53D6385715191C30CD254E74BFB65C42F47EA7097ACE9B7FFB559BB5D741EB963BB91581D3AD5D250F2DC73CC0BFB1A30DA7A0AF5A3A8387
X-Mras: OK
X-7FA49CB5: 0D63561A33F958A582C92DA92EF0EC9C005082C7C6B7C3595CA165A3D94BA238462275124DF8B9C975FAC89DD1A0FDCBE5BFE6E7EFDEDCD789D4C264860C145E
X-Mailru-Sender: A5480F10D64C9005ECC5D0D0AB7E92B5C7A27AB35BEB8E88E362F79760824594A360F5E8E28B2E747C4160E8B47E48163DDE9B364B0DF2898CB68AF7A628805D594FB4C9F0DBF412AE208404248635DF
X-Mras: OK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 94.100.176.131
Subject: Re: [Qemu-devel] [PATCH v3 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Julia Suvorova via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Julia Suvorova <jusual@mail.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zaEecPs8pwr1

On 26.07.2018 05:36, Joel Stanley wrote:
> The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
> plus other common ARM SoC peripherals.
> 
>   http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf
> 
> This defines a basic model of the CPU and memory, with no peripherals
> implemented at this stage.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>    put memory as struct fileds in state structure
>    pass OBJECT(s) as owner, not NULL
>    Add missing addresses for ficr
>    Fix flash and sram sizes for microbit
>    Embed cpu object in state object an initalise it without use of armv7m_init
>    Link to datasheet
> v3:
>    rebase nrf51 on m0 changes
>    remove unused kernel_filename
>    clarify flash and sram size
>    make flash and sram size properties of the soc state
> ---
>   default-configs/arm-softmmu.mak |   1 +
>   hw/arm/Makefile.objs            |   1 +
>   hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
>   include/hw/arm/nrf51_soc.h      |  42 +++++++++++
>   4 files changed, 163 insertions(+)
>   create mode 100644 hw/arm/nrf51_soc.c
>   create mode 100644 include/hw/arm/nrf51_soc.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index e704cb6e34d7..3432721d7d08 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -102,6 +102,7 @@ CONFIG_STM32F2XX_SYSCFG=y
>   CONFIG_STM32F2XX_ADC=y
>   CONFIG_STM32F2XX_SPI=y
>   CONFIG_STM32F205_SOC=y
> +CONFIG_NRF51_SOC=y
>   
>   CONFIG_CMSDK_APB_TIMER=y
>   CONFIG_CMSDK_APB_UART=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index b1e4f8f006aa..e31875ec69bc 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -36,3 +36,4 @@ obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
>   obj-$(CONFIG_IOTKIT) += iotkit.o
>   obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>   obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
> +obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> new file mode 100644
> index 000000000000..03fa1dfc7456
> --- /dev/null
> +++ b/hw/arm/nrf51_soc.c
> @@ -0,0 +1,119 @@
> +/*
> + * Nordic Semiconductor nRF51 SoC
> + * http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.1.pdf
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/arm/arm.h"
> +#include "hw/sysbus.h"
> +#include "hw/boards.h"
> +#include "hw/devices.h"
> +#include "hw/misc/unimp.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +
> +#include "hw/arm/nrf51_soc.h"
> +
> +#define IOMEM_BASE      0x40000000
> +#define IOMEM_SIZE      0x20000000
> +
> +#define FICR_BASE       0x10000000
> +#define FICR_SIZE       0x000000fc
> +
> +#define FLASH_BASE      0x00000000
> +#define SRAM_BASE       0x20000000
> +
> +/* The size and base is for the NRF51822 part. If other parts
> + * are supported in the future, add a sub-class of NRF51SoC for
> + * the specific variants */
> +#define NRF51822_FLASH_SIZE     (256 * 1024)
> +#define NRF51822_SRAM_SIZE      (16 * 1024)
> +
> +static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    NRF51State *s = NRF51_SOC(dev_soc);
> +    Error *err = NULL;
> +
> +    if (!s->board_memory) {
> +        error_setg(errp, "memory property was not set");
> +        return;
> +    }
> +
> +    object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "memory",
> +            &err);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +
> +    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
> +
> +    memory_region_init_ram(&s->flash, OBJECT(s), "nrf51.flash", s->flash_size,
> +            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_set_readonly(&s->flash, true);
> +    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
> +
> +    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
> +
> +    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> +    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> +    create_unimplemented_device("nrf51_soc.private", 0xF0000000, 0x10000000);
> +}
> +
> +static void nrf51_soc_init(Object *obj)
> +{
> +    NRF51State *s = NRF51_SOC(obj);
> +
> +    memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
> +
> +    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARM_M_PROFILE);
> +    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu), &error_abort);
> +    qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
> +    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME("cortex-m0"));
> +    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 96);

Where did this number come from? ARMv6-M NVIC supports only 32 interrupts.

Best regards, Julia Suvorova.
