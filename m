Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e3sm2579747wme.39.2019.10.08.02.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 02:00:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D5ACC1FF87;
	Tue,  8 Oct 2019 10:00:57 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-3-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti <bztemail@gmail.com>, Laurent Bonnans
 <laurent.bonnans@here.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <f4bug@amsat.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, BALATON
 Zoltan <balaton@eik.bme.hu>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 02/19] hw/arm/bcm2835_peripherals: Improve logging
In-reply-to: <20190926173428.10713-3-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 10:00:57 +0100
Message-ID: <874l0jk3w6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MxXlmqId04jT


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Various logging improvements as once:
> - Use 0x prefix for hex numbers

You can use "%#"PRIxNN"" as an alternative I believe but anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> - Display value written during write accesses
> - Move some logs from GUEST_ERROR to UNIMP
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Use PRIx64 format (pm215)
> ---
>  hw/char/bcm2835_aux.c      |  5 +++--
>  hw/dma/bcm2835_dma.c       |  8 ++++----
>  hw/intc/bcm2836_control.c  |  7 ++++---
>  hw/misc/bcm2835_mbox.c     |  7 ++++---
>  hw/misc/bcm2835_property.c | 16 ++++++++++------
>  5 files changed, 25 insertions(+), 18 deletions(-)
>
> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
> index 3f855196e3..a6fc1bf152 100644
> --- a/hw/char/bcm2835_aux.c
> +++ b/hw/char/bcm2835_aux.c
> @@ -162,8 +162,9 @@ static void bcm2835_aux_write(void *opaque, hwaddr of=
fset, uint64_t value,
>      switch (offset) {
>      case AUX_ENABLES:
>          if (value !=3D 1) {
> -            qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable =
SPI "
> -                          "or disable UART\n", __func__);
> +            qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable =
SPI"
> +                                     " or disable UART: 0x%"PRIx64"\n",
> +                          __func__, value);
>          }
>          break;
>
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 192bd377a0..6acc2b644e 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -180,7 +180,7 @@ static uint64_t bcm2835_dma_read(BCM2835DMAState *s, =
hwaddr offset,
>          res =3D ch->debug;
>          break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\=
n",
>                        __func__, offset);
>          break;
>      }
> @@ -228,7 +228,7 @@ static void bcm2835_dma_write(BCM2835DMAState *s, hwa=
ddr offset,
>          ch->debug =3D value;
>          break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\=
n",
>                        __func__, offset);
>          break;
>      }
> @@ -247,7 +247,7 @@ static uint64_t bcm2835_dma0_read(void *opaque, hwadd=
r offset, unsigned size)
>          case BCM2708_DMA_ENABLE:
>              return s->enable;
>          default:
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx=
"\n",
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PR=
Ix"\n",
>                            __func__, offset);
>              return 0;
>          }
> @@ -274,7 +274,7 @@ static void bcm2835_dma0_write(void *opaque, hwaddr o=
ffset, uint64_t value,
>              s->enable =3D (value & 0xffff);
>              break;
>          default:
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx=
"\n",
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PR=
Ix"\n",
>                            __func__, offset);
>          }
>      }
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> index 04229b8a17..61f884ff9e 100644
> --- a/hw/intc/bcm2836_control.c
> +++ b/hw/intc/bcm2836_control.c
> @@ -264,7 +264,7 @@ static uint64_t bcm2836_control_read(void *opaque, hw=
addr offset, unsigned size)
>      } else if (offset >=3D REG_MBOX0_RDCLR && offset < REG_LIMIT) {
>          return s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2];
>      } else {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx=
"\n",
>                        __func__, offset);
>          return 0;
>      }
> @@ -293,8 +293,9 @@ static void bcm2836_control_write(void *opaque, hwadd=
r offset,
>      } else if (offset >=3D REG_MBOX0_RDCLR && offset < REG_LIMIT) {
>          s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2] &=3D ~val;
>      } else {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> -                      __func__, offset);
> +        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx
> +                                 " value 0x%"PRIx64"\n",
> +                      __func__, offset, val);
>          return;
>      }
>
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 79bad11631..7690b9afaf 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -176,7 +176,7 @@ static uint64_t bcm2835_mbox_read(void *opaque, hwadd=
r offset, unsigned size)
>          break;
>
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx=
"\n",
>                        __func__, offset);
>          return 0;
>      }
> @@ -228,8 +228,9 @@ static void bcm2835_mbox_write(void *opaque, hwaddr o=
ffset,
>          break;
>
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> -                      __func__, offset);
> +        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx
> +                                 " value 0x%"PRIx64"\n",
> +                      __func__, offset, value);
>          return;
>      }
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index d86d510572..0a1a3eb5d9 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -56,7 +56,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyS=
tate *s, uint32_t value)
>              break;
>          case 0x00010001: /* Get board model */
>              qemu_log_mask(LOG_UNIMP,
> -                          "bcm2835_property: %x get board model NYI\n", =
tag);
> +                          "bcm2835_property: 0x%08x get board model NYI\=
n",
> +                          tag);
>              resplen =3D 4;
>              break;
>          case 0x00010002: /* Get board revision */
> @@ -69,7 +70,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyS=
tate *s, uint32_t value)
>              break;
>          case 0x00010004: /* Get board serial */
>              qemu_log_mask(LOG_UNIMP,
> -                          "bcm2835_property: %x get board serial NYI\n",=
 tag);
> +                          "bcm2835_property: 0x%08x get board serial NYI=
\n",
> +                          tag);
>              resplen =3D 8;
>              break;
>          case 0x00010005: /* Get ARM memory */
> @@ -104,7 +106,8 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>
>          case 0x00038001: /* Set clock state */
>              qemu_log_mask(LOG_UNIMP,
> -                          "bcm2835_property: %x set clock state NYI\n", =
tag);
> +                          "bcm2835_property: 0x%08x set clock state NYI\=
n",
> +                          tag);
>              resplen =3D 8;
>              break;
>
> @@ -129,7 +132,8 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>          case 0x00038004: /* Set max clock rate */
>          case 0x00038007: /* Set min clock rate */
>              qemu_log_mask(LOG_UNIMP,
> -                          "bcm2835_property: %x set clock rates NYI\n", =
tag);
> +                          "bcm2835_property: 0x%08x set clock rate NYI\n=
",
> +                          tag);
>              resplen =3D 8;
>              break;
>
> @@ -274,8 +278,8 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>              break;
>
>          default:
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "bcm2835_property: unhandled tag %08x\n", tag);
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: unhandled tag 0x%08x\n", ta=
g);
>              break;
>          }


--
Alex Benn=C3=A9e
