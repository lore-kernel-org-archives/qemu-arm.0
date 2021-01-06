Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp979139lfq;
        Wed, 6 Jan 2021 08:37:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya/xilR+QyzgqqlgeVm5R3CPaeATc09kKkIl81Sc1Ta1jyzXP8zrbhm9U+nMl6FHnxJ4Gt
X-Received: by 2002:a25:60d4:: with SMTP id u203mr6736393ybb.197.1609951063375;
        Wed, 06 Jan 2021 08:37:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609951063; cv=none;
        d=google.com; s=arc-20160816;
        b=IDWtZGC8hbYj2Owq9PgDK/e3bL4X05L6OFwlqodCDZbfNftUZvcfoj96oU8427tHXG
         JvXtp/CpsNm9SrNix2aABlIwXWXk/21+Hy/ZwMWeUpIz0jZ4bRhLseiRXHgb1h0sIvc3
         Po0ibxdyYwkfAPK6OPUF3CtdefCSitbW3piyvH8xje+maKzBppWXGtY0bSMgqMFP8wqd
         I8ZLaTRJ0MOFC7B20aob57puY7pf9Jx8YHK/zOC4/XNAcucuIzggM45VrIY9d07vWV2h
         onZko6f/XXvyXMpLPmJHvmJeZk8b9uo1zPq8dmcr2gK6GPPAUp8LQ6v3HYiSrsYH5QzL
         W02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ffb+X+NHgNBHv5+5luuXnUQ32C/ziSJZje4HKbF1kak=;
        b=EKjEDCWFtREyG3yA7CDvFJX1mt+zCYPEQtkq28C7DHQNdRzy33p6QSyOWl+RaXgmZx
         CDfbFGxXSazbNmoOPj8AtKjFMWQIMJZunrI5ukOdRdE7bYv5ajTu6yqj67xyK3OCFGY1
         Y4GRHHI2kL+np18VIDSfhR3bKKNCR+fNNb+e/mCvWB2MG7CyPEaSWzD5ljLVsdmkV0Qv
         m/jnswyVLH3bYPN5HcI/qR19TX9zVbfTJ3T7zHXd5VtFleyTiUankLYjDxXqTtxm5WpA
         bQyymHVvefWdx+kZKbQPQ+hWO7TR9YvQTRhbtrwcfs/AqhDgsd4zKBUu8dqc+NlpDIef
         iqDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nXfTIrqh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s23si3575433ybc.142.2021.01.06.08.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jan 2021 08:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nXfTIrqh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxBoc-000726-MX
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 11:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kxBnr-0006Zm-Gw
 for qemu-arm@nongnu.org; Wed, 06 Jan 2021 11:36:56 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kxBnp-00019y-H9
 for qemu-arm@nongnu.org; Wed, 06 Jan 2021 11:36:55 -0500
Received: by mail-pl1-x629.google.com with SMTP id s15so1791703plr.9
 for <qemu-arm@nongnu.org>; Wed, 06 Jan 2021 08:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ffb+X+NHgNBHv5+5luuXnUQ32C/ziSJZje4HKbF1kak=;
 b=nXfTIrqhq6U1SAxi6oQJEomojGkBpWceWsv6WwOhR6FakHmHAMj02yhs7IAwxXa/O5
 3ZR0B0RyDGD2XT+O/J2YenLgW8qVCn03gxJ8L7DYob/VDIm7ySl8oxrZwCkaWQBv4nSX
 LswudI1/h039UEkFleqFTgWjzeWFaZKPc3QzUhV4HY7tjYXbzResNjVHICOknTx0BCtX
 Bq7r/Xm5b14NX1y42VTFO9qOOehcd//X4Wk6jFc8siSfQtyIcdIKrBTAHzXAVL0Pz3QX
 WvxtP6+GElwn5U/4QHP/zR6HYj/8onVetPZqrIKSUGkstswur5EC+eRlUKQVRpZ6s2Yk
 5V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ffb+X+NHgNBHv5+5luuXnUQ32C/ziSJZje4HKbF1kak=;
 b=WTPSQSgSOvhH88W1ZxU5EVK5zm4fU2d4F1C0cjbTLZUIRBFOD6VQ7Ieg5mvNbp9v1k
 9D78I+VSbSQYYdPI9qxr3i1okqx08VhtYkv0iwPexdU5weO7KL9dfBQ8BkM2s6Yf1cpQ
 Q+TAtSNUTz2FTZ8jfR8REs2HTv5vuLt5+E1v7jys7jTIAfXK+5FN+2x0Y+cUk2mLHdkN
 IycgEDhfHmoW2ZlToinrM7g4ykSFxoHqoIsfi9feeQXRowaaIjQqNPw7JyuzSZwrKcR6
 5MUblhxbdaXLZ1Xf46zh7LT1MYhOH3t079O7P2Ki1SJaeRqi3dUYSw39n7mQHephStYP
 lcuA==
X-Gm-Message-State: AOAM530rpf5AHSAsrdVOSrbV/ThYh8Z22SjHaHkwZ9wsdP4d7PrXPGQy
 ++JzRwsC+31pJV02U0KsQ+bbtcLB3/DH/+T+Ws8+/H0R8I8=
X-Received: by 2002:a17:90a:3989:: with SMTP id
 z9mr5116381pjb.198.1609951011714; 
 Wed, 06 Jan 2021 08:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20210106163426.9971-1-maxim.uvarov@linaro.org>
In-Reply-To: <20210106163426.9971-1-maxim.uvarov@linaro.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Wed, 6 Jan 2021 19:36:40 +0300
Message-ID: <CAD8XO3ZkRtGTu7vbqN4H3SHwCaMC78cehbp8ewAuQ7vEBXHkNA@mail.gmail.com>
Subject: Re: [PATCHv3] arm-virt: add secure pl061 for reset/power down
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Jose Marinho <Jose.Marinho@arm.com>, tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4DQfq4r2ENLs

Please skip v2 and use v3. I had to check that one line change code
compiles. qemu_log() requires include header for that function.

Best regards,
Maxim.

On Wed, 6 Jan 2021 at 19:34, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware).
> Use the same gpio 3 and gpio 4 which were used by
> non acpi variant of linux power control gpios.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  v3: added missed include qemu/log.h for qemu_log(..
>  v2: replace printf with qemu_log (Philippe Mathieu-Daud=C3=A9)
>
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 24 ++++++++++++
>  hw/gpio/Kconfig       |  3 ++
>  hw/gpio/gpio_pwr.c    | 85 +++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build   |  1 +
>  include/hw/arm/virt.h |  1 +
>  6 files changed, 115 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0a242e4c5d..13cc42dcc8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM_VIRT
>      select PL011 # UART
>      select PL031 # RTC
>      select PL061 # GPIO
> +    select GPIO_PWR
>      select PLATFORM_BUS
>      select SMBIOS
>      select VIRTIO_MMIO
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 96985917d3..eff0345303 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -147,6 +147,7 @@ static const MemMapEntry base_memmap[] =3D {
>      [VIRT_RTC] =3D                { 0x09010000, 0x00001000 },
>      [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
>      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
> +    [VIRT_SECURE_GPIO] =3D        { 0x09031000, 0x00001000 },
>      [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
>      [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
> @@ -189,6 +190,7 @@ static const int a15irqmap[] =3D {
>      [VIRT_GPIO] =3D 7,
>      [VIRT_SECURE_UART] =3D 8,
>      [VIRT_ACPI_GED] =3D 9,
> +    [VIRT_SECURE_GPIO] =3D 10,
>      [VIRT_MMIO] =3D 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] =3D 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_SMMU] =3D 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
> @@ -864,6 +866,24 @@ static void create_gpio(const VirtMachineState *vms)
>      g_free(nodename);
>  }
>
> +static void create_gpio_secure(const VirtMachineState *vms)
> +{
> +    DeviceState *pl061_dev;
> +    static DeviceState *gpio_pwr_dev;
> +
> +    hwaddr base =3D vms->memmap[VIRT_SECURE_GPIO].base;
> +    int irq =3D vms->irqmap[VIRT_SECURE_GPIO];
> +
> +    pl061_dev =3D sysbus_create_simple("pl061", base,
> +                                     qdev_get_gpio_in(vms->gic, irq));
> +
> +    gpio_pwr_dev =3D sysbus_create_simple("gpio-pwr", -1,
> +                                        qdev_get_gpio_in(pl061_dev, 3));
> +
> +    qdev_connect_gpio_out(pl061_dev, 3, qdev_get_gpio_in(gpio_pwr_dev, 3=
));
> +    qdev_connect_gpio_out(pl061_dev, 4, qdev_get_gpio_in(gpio_pwr_dev, 4=
));
> +}
> +
>  static void create_virtio_devices(const VirtMachineState *vms)
>  {
>      int i;
> @@ -1993,6 +2013,10 @@ static void machvirt_init(MachineState *machine)
>          create_gpio(vms);
>      }
>
> +    if (vms->secure) {
> +        create_gpio_secure(vms);
> +    }
> +
>       /* connect powerdown request */
>       vms->powerdown_notifier.notify =3D virt_powerdown_req;
>       qemu_register_powerdown_notifier(&vms->powerdown_notifier);
> diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
> index b6fdaa2586..f0e7405f6e 100644
> --- a/hw/gpio/Kconfig
> +++ b/hw/gpio/Kconfig
> @@ -8,5 +8,8 @@ config PL061
>  config GPIO_KEY
>      bool
>
> +config GPIO_PWR
> +    bool
> +
>  config SIFIVE_GPIO
>      bool
> diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> new file mode 100644
> index 0000000000..0d0680c9f7
> --- /dev/null
> +++ b/hw/gpio/gpio_pwr.c
> @@ -0,0 +1,85 @@
> +/*
> + * GPIO qemu power controller
> + *
> + * Copyright (c) 2020 Linaro Limited
> + *
> + * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
> + *
> + * Virtual gpio driver which can be used on top of pl061
> + * to reboot and shutdown qemu virtual machine. One of use
> + * case is gpio driver for secure world application (ARM
> + * Trusted Firmware.).
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/runstate.h"
> +
> +#define TYPE_GPIOPWR "gpio-pwr"
> +OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)
> +
> +struct GPIO_PWR_State {
> +    SysBusDevice parent_obj;
> +    qemu_irq irq;
> +};
> +
> +static void gpio_pwr_set_irq(void *opaque, int irq, int level)
> +{
> +    GPIO_PWR_State *s =3D (GPIO_PWR_State *)opaque;
> +
> +    qemu_set_irq(s->irq, 1);
> +
> +    if (level) {
> +        return;
> +    }
> +
> +    switch (irq) {
> +    case 3:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        break;
> +    case 4:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "qemu; gpio_pwr: unknown interrupt %d lvl %d\n",
> +                      irq, level);
> +    }
> +}
> +
> +
> +static void gpio_pwr_realize(DeviceState *dev, Error **errp)
> +{
> +    GPIO_PWR_State *s =3D GPIOPWR(dev);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +    qdev_init_gpio_in(dev, gpio_pwr_set_irq, 8);
> +}
> +
> +static void gpio_pwr_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D gpio_pwr_realize;
> +}
> +
> +static const TypeInfo gpio_pwr_info =3D {
> +    .name          =3D TYPE_GPIOPWR,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(GPIO_PWR_State),
> +    .class_init    =3D gpio_pwr_class_init,
> +};
> +
> +static void gpio_pwr_register_types(void)
> +{
> +    type_register_static(&gpio_pwr_info);
> +}
> +
> +type_init(gpio_pwr_register_types)
> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> index 5c0a7d7b95..79568f00ce 100644
> --- a/hw/gpio/meson.build
> +++ b/hw/gpio/meson.build
> @@ -1,5 +1,6 @@
>  softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
>  softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
> +softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
>  softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
>  softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index abf54fab49..77a4523cc7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -81,6 +81,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_SECURE_GPIO,
>      VIRT_PCDIMM_ACPI,
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
> --
> 2.17.1
>
