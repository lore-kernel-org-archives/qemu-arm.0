Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y186sm6225902wmd.26.2019.10.08.04.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 04:32:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BDE2F1FF87;
	Tue,  8 Oct 2019 12:32:12 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-8-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti
 <bztemail@gmail.com>, Laurent Bonnans <laurent.bonnans@here.com>, Esteban
 Bosse <estebanbosse@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 07/19] hw/misc/bcm2835_mbox: Add trace events
In-reply-to: <20190926173428.10713-8-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 12:32:12 +0100
Message-ID: <87wodfiibn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z7jxaHIX1pOE


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Add trace events for read/write accesses and IRQ.
>
> Properties are structures used for the ARM particular MBOX.
> Since one call in bcm2835_property.c concerns the mbox block,
> name this trace event in the same bcm2835_mbox* namespace.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/misc/bcm2835_mbox.c     | 5 +++++
>  hw/misc/bcm2835_property.c | 2 ++
>  hw/misc/trace-events       | 6 ++++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 77285624c9..77d2d80706 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -15,6 +15,7 @@
>  #include "migration/vmstate.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "trace.h"
>
>  #define MAIL0_PEEK   0x90
>  #define MAIL0_SENDER 0x94
> @@ -123,6 +124,7 @@ static void bcm2835_mbox_update(BCM2835MboxState *s)
>              set =3D true;
>          }
>      }
> +    trace_bcm2835_mbox_irq(set);
>      qemu_set_irq(s->arm_irq, set);

I'm kind surprised we don't have a common trace point for all IRQs.

>  }
>
> @@ -178,8 +180,10 @@ static uint64_t bcm2835_mbox_read(void *opaque, hwad=
dr offset, unsigned size)
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx=
"\n",
>                        __func__, offset);
> +        trace_bcm2835_mbox_read(size, offset, res);
>          return 0;
>      }
> +    trace_bcm2835_mbox_read(size, offset, res);
>
>      bcm2835_mbox_update(s);
>
> @@ -195,6 +199,7 @@ static void bcm2835_mbox_write(void *opaque, hwaddr o=
ffset,
>
>      offset &=3D 0xff;
>
> +    trace_bcm2835_mbox_write(size, offset, value);
>      switch (offset) {
>      case MAIL0_SENDER:
>          break;
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 43a5465c5d..0eea2e20f7 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -13,6 +13,7 @@
>  #include "sysemu/dma.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "trace.h"
>
>  /* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interfa=
ce */
>
> @@ -283,6 +284,7 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>              break;
>          }
>
> +        trace_bcm2835_mbox_property(tag, bufsize, resplen);
>          if (tag =3D=3D 0) {
>              break;
>          }
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 74276225f8..1deb1d08c1 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -143,3 +143,9 @@ armsse_mhu_write(uint64_t offset, uint64_t data, unsi=
gned size) "SSE-200 MHU wri
>
>  # aspeed_xdma.c
>  aspeed_xdma_write(uint64_t offset, uint64_t data) "XDMA write: offset 0x=
%" PRIx64 " data 0x%" PRIx64
> +
> +# bcm2835_mbox.c
> +bcm2835_mbox_write(unsigned int size, uint64_t addr, uint64_t value) "mb=
ox write sz:%u addr:0x%"PRIx64" data:0x%"PRIx64
> +bcm2835_mbox_read(unsigned int size, uint64_t addr, uint64_t value) "mbo=
x read sz:%u addr:0x%"PRIx64" data:0x%"PRIx64
> +bcm2835_mbox_irq(unsigned level) "mbox irq:ARM level:%u"
> +bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "m=
box property tag:0x%08x in_sz:%u out_sz:%zu"

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e
