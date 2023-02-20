Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c451000b003dc5b59ed7asm1717903wmo.11.2023.02.20.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:34:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 70CE01FFB7;
	Mon, 20 Feb 2023 15:34:06 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-7-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/8] hw/char/cmsdk-apb-uart: Open-code
 cmsdk_apb_uart_create()
Date: Mon, 20 Feb 2023 15:33:00 +0000
In-reply-to: <20230220115114.25237-7-philmd@linaro.org>
Message-ID: <87cz64s64x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: piEyzLU4uiq/


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> cmsdk_apb_uart_create() is only used twice in the same
> file. Open-code it.

Hmm, you could just as easily make cmsdk_apb_uart_create a private
static function and avoid any copy paste snafus if something needs
changing.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/mps2.c                    | 41 +++++++++++++++++++++-----------
>  include/hw/char/cmsdk-apb-uart.h | 34 --------------------------
>  2 files changed, 27 insertions(+), 48 deletions(-)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index a86a994dba..d92fd60684 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -35,6 +35,7 @@
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/char/cmsdk-apb-uart.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
> @@ -282,6 +283,9 @@ static void mps2_common_init(MachineState *machine)
>          qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12=
));
>=20=20
>          for (i =3D 0; i < 5; i++) {
> +            DeviceState *dev;
> +            SysBusDevice *s;
> +
>              static const hwaddr uartbase[] =3D {0x40004000, 0x40005000,
>                                                0x40006000, 0x40007000,
>                                                0x40009000};
> @@ -294,12 +298,16 @@ static void mps2_common_init(MachineState *machine)
>                  rxovrint =3D qdev_get_gpio_in(orgate_dev, i * 2 + 1);
>              }
>=20=20
> -            cmsdk_apb_uart_create(uartbase[i],
> -                                  qdev_get_gpio_in(armv7m, uartirq[i] + =
1),
> -                                  qdev_get_gpio_in(armv7m, uartirq[i]),
> -                                  txovrint, rxovrint,
> -                                  NULL,
> -                                  serial_hd(i), SYSCLK_FRQ);
> +            dev =3D qdev_new(TYPE_CMSDK_APB_UART);
> +            s =3D SYS_BUS_DEVICE(dev);
> +            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> +            qdev_prop_set_uint32(dev, "pclk-frq", SYSCLK_FRQ);
> +            sysbus_realize_and_unref(s, &error_fatal);
> +            sysbus_mmio_map(s, 0, uartbase[i]);
> +            sysbus_connect_irq(s, 0, qdev_get_gpio_in(armv7m, uartirq[i]=
 + 1));
> +            sysbus_connect_irq(s, 1, qdev_get_gpio_in(armv7m, uartirq[i]=
));
> +            sysbus_connect_irq(s, 2, txovrint);
> +            sysbus_connect_irq(s, 3, rxovrint);
>          }
>          break;
>      }
> @@ -324,7 +332,8 @@ static void mps2_common_init(MachineState *machine)
>                                                0x4002c000, 0x4002d000,
>                                                0x4002e000};
>              Object *txrx_orgate;
> -            DeviceState *txrx_orgate_dev;
> +            DeviceState *txrx_orgate_dev, *dev;
> +            SysBusDevice *s;
>=20=20
>              txrx_orgate =3D object_new(TYPE_OR_IRQ);
>              object_property_set_int(txrx_orgate, "num-lines", 2, &error_=
fatal);
> @@ -332,13 +341,17 @@ static void mps2_common_init(MachineState *machine)
>              txrx_orgate_dev =3D DEVICE(txrx_orgate);
>              qdev_connect_gpio_out(txrx_orgate_dev, 0,
>                                    qdev_get_gpio_in(armv7m, uart_txrx_irq=
no[i]));
> -            cmsdk_apb_uart_create(uartbase[i],
> -                                  qdev_get_gpio_in(txrx_orgate_dev, 0),
> -                                  qdev_get_gpio_in(txrx_orgate_dev, 1),
> -                                  qdev_get_gpio_in(orgate_dev, i * 2),
> -                                  qdev_get_gpio_in(orgate_dev, i * 2 + 1=
),
> -                                  NULL,
> -                                  serial_hd(i), SYSCLK_FRQ);
> +
> +            dev =3D qdev_new(TYPE_CMSDK_APB_UART);
> +            s =3D SYS_BUS_DEVICE(dev);
> +            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> +            qdev_prop_set_uint32(dev, "pclk-frq", SYSCLK_FRQ);
> +            sysbus_realize_and_unref(s, &error_fatal);
> +            sysbus_mmio_map(s, 0, uartbase[i]);
> +            sysbus_connect_irq(s, 0, qdev_get_gpio_in(txrx_orgate_dev, 0=
));
> +            sysbus_connect_irq(s, 1, qdev_get_gpio_in(txrx_orgate_dev, 1=
));
> +            sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2)=
);
> +            sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 =
+ 1));
>          }
>          break;
>      }
> diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb=
-uart.h
> index 64b0a3d534..7de8f8d1b9 100644
> --- a/include/hw/char/cmsdk-apb-uart.h
> +++ b/include/hw/char/cmsdk-apb-uart.h
> @@ -12,10 +12,8 @@
>  #ifndef CMSDK_APB_UART_H
>  #define CMSDK_APB_UART_H
>=20=20
> -#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
> -#include "qapi/error.h"
>  #include "qom/object.h"
>=20=20
>  #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
> @@ -45,36 +43,4 @@ struct CMSDKAPBUART {
>      uint8_t rxbuf;
>  };
>=20=20
> -/**
> - * cmsdk_apb_uart_create - convenience function to create TYPE_CMSDK_APB=
_UART
> - * @addr: location in system memory to map registers
> - * @chr: Chardev backend to connect UART to, or NULL if no backend
> - * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating ba=
ud rate)
> - */
> -static inline DeviceState *cmsdk_apb_uart_create(hwaddr addr,
> -                                                 qemu_irq txint,
> -                                                 qemu_irq rxint,
> -                                                 qemu_irq txovrint,
> -                                                 qemu_irq rxovrint,
> -                                                 qemu_irq uartint,
> -                                                 Chardev *chr,
> -                                                 uint32_t pclk_frq)
> -{
> -    DeviceState *dev;
> -    SysBusDevice *s;
> -
> -    dev =3D qdev_new(TYPE_CMSDK_APB_UART);
> -    s =3D SYS_BUS_DEVICE(dev);
> -    qdev_prop_set_chr(dev, "chardev", chr);
> -    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_mmio_map(s, 0, addr);
> -    sysbus_connect_irq(s, 0, txint);
> -    sysbus_connect_irq(s, 1, rxint);
> -    sysbus_connect_irq(s, 2, txovrint);
> -    sysbus_connect_irq(s, 3, rxovrint);
> -    sysbus_connect_irq(s, 4, uartint);
> -    return dev;
> -}
> -
>  #endif


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
