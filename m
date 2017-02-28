Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o143sm2872219wmd.3.2017.02.28.06.10.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Feb 2017 06:10:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 09B783E0092;
	Tue, 28 Feb 2017 14:10:00 +0000 (GMT)
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org> <1487604965-23220-12-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Alistair Francis <alistair23@gmail.com>, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 11/11] stm32f205: Rename 'nvic' local to 'armv7m'
In-reply-to: <1487604965-23220-12-git-send-email-peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 14:10:00 +0000
Message-ID: <878toq2ypz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 9AtbAqal3qvP


Peter Maydell <peter.maydell@linaro.org> writes:

> The local variable 'nvic' in stm32f205_soc_realize() no longer
> holds a direct pointer to the NVIC device; it is a pointer to
> the ARMv7M container object. Rename it 'armv7m' accordingly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/arm/stm32f205_soc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index e6bd73a..6e1260d 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -85,7 +85,7 @@ static void stm32f205_soc_initfn(Object *obj)
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      STM32F205State *s = STM32F205_SOC(dev_soc);
> -    DeviceState *dev, *nvic;
> +    DeviceState *dev, *armv7m;
>      SysBusDevice *busdev;
>      Error *err = NULL;
>      int i;
> @@ -113,9 +113,9 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      vmstate_register_ram_global(sram);
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>
> -    nvic = DEVICE(&s->armv7m);
> -    qdev_prop_set_uint32(nvic, "num-irq", 96);
> -    qdev_prop_set_string(nvic, "cpu-model", s->cpu_model);
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
> +    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>                                       "memory", &error_abort);
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> @@ -133,7 +133,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      busdev = SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, 0x40013800);
> -    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, 71));
> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, 71));
>
>      /* Attach UART (uses USART registers) and USART controllers */
>      for (i = 0; i < STM_NUM_USARTS; i++) {
> @@ -147,7 +147,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>          busdev = SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, usart_addr[i]);
> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, usart_irq[i]));
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq[i]));
>      }
>
>      /* Timer 2 to 5 */
> @@ -161,7 +161,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>          busdev = SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, timer_addr[i]);
> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, timer_irq[i]));
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer_irq[i]));
>      }
>
>      /* ADC 1 to 3 */
> @@ -173,7 +173,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          return;
>      }
>      qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
> -                          qdev_get_gpio_in(nvic, ADC_IRQ));
> +                          qdev_get_gpio_in(armv7m, ADC_IRQ));
>
>      for (i = 0; i < STM_NUM_ADCS; i++) {
>          dev = DEVICE(&(s->adc[i]));
> @@ -198,7 +198,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>          busdev = SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, spi_addr[i]);
> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, spi_irq[i]));
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
>      }
>  }


--
Alex Bennée
