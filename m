Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id be3-20020a05600c1e8300b0040644e699a0sm640447wmb.45.2023.10.13.10.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:07:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0DF501FFBB;
	Fri, 13 Oct 2023 18:07:57 +0100 (BST)
References: <20231013141131.1531-1-philmd@linaro.org>
 <20231013141131.1531-10-philmd@linaro.org>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Evgeny
 Iakovlev <eiakovlev@linux.microsoft.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 9/10] hw/char/pl011: Add transmit FIFO to PL011State
Date: Fri, 13 Oct 2023 18:05:05 +0100
In-reply-to: <20231013141131.1531-10-philmd@linaro.org>
Message-ID: <87edhylac2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /WUmPfVufXuj


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> In order to make the next commit easier to review,
> introduce the transmit FIFO, but do not yet use it.

might be worth mentioning the migration bits here as well.

>
> Uninline pl011_reset_tx_fifo().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/char/pl011.h |  2 ++
>  hw/char/pl011.c         | 35 +++++++++++++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
> index d853802132..20898f43a6 100644
> --- a/include/hw/char/pl011.h
> +++ b/include/hw/char/pl011.h
> @@ -18,6 +18,7 @@
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
>  #include "qom/object.h"
> +#include "qemu/fifo8.h"
>=20=20
>  #define TYPE_PL011 "pl011"
>  OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
> @@ -53,6 +54,7 @@ struct PL011State {
>      Clock *clk;
>      bool migrate_clk;
>      const unsigned char *id;
> +    Fifo8 xmit_fifo;
>  };
>=20=20
>  DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 727decd428..9d98bd8f9a 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -147,11 +147,13 @@ static inline void pl011_reset_rx_fifo(PL011State *=
s)
>      s->flags |=3D PL011_FLAG_RXFE;
>  }
>=20=20
> -static inline void pl011_reset_tx_fifo(PL011State *s)
> +static void pl011_reset_tx_fifo(PL011State *s)
>  {
>      /* Reset FIFO flags */
>      s->flags &=3D ~PL011_FLAG_TXFF;
>      s->flags |=3D PL011_FLAG_TXFE;
> +
> +    fifo8_reset(&s->xmit_fifo);
>  }
>=20=20
>  static void pl011_write_txdata(PL011State *s, uint8_t data)
> @@ -436,6 +438,22 @@ static const VMStateDescription vmstate_pl011_clock =
=3D {
>      }
>  };
>=20=20
> +static bool pl011_xmit_fifo_state_needed(void *opaque)
> +{
> +    return false;
> +}
> +
> +static const VMStateDescription vmstate_pl011_xmit_fifo =3D {
> +    .name =3D "pl011/xmit_fifo",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D pl011_xmit_fifo_state_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_FIFO8(xmit_fifo, PL011State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static int pl011_post_load(void *opaque, int version_id)
>  {
>      PL011State* s =3D opaque;
> @@ -487,7 +505,11 @@ static const VMStateDescription vmstate_pl011 =3D {
>      .subsections =3D (const VMStateDescription * []) {
>          &vmstate_pl011_clock,
>          NULL
> -    }
> +    },
> +    .subsections =3D (const VMStateDescription * []) {
> +        &vmstate_pl011_xmit_fifo,
> +        NULL
> +    },
>  };

Doesn't this necessitate the bumping of the migration version data or
do we not worry about new -> old migrations?

>=20=20
>  static Property pl011_properties[] =3D {
> @@ -502,6 +524,7 @@ static void pl011_init(Object *obj)
>      PL011State *s =3D PL011(obj);
>      int i;
>=20=20
> +    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
>      memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", =
0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      for (i =3D 0; i < ARRAY_SIZE(s->irq); i++) {
> @@ -514,6 +537,13 @@ static void pl011_init(Object *obj)
>      s->id =3D pl011_id_arm;
>  }
>=20=20
> +static void pl011_finalize(Object *obj)
> +{
> +    PL011State *s =3D PL011(obj);
> +
> +    fifo8_destroy(&s->xmit_fifo);
> +}
> +
>  static void pl011_realize(DeviceState *dev, Error **errp)
>  {
>      PL011State *s =3D PL011(dev);
> @@ -557,6 +587,7 @@ static const TypeInfo pl011_arm_info =3D {
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(PL011State),
>      .instance_init =3D pl011_init,
> +    .instance_finalize =3D pl011_finalize,
>      .class_init    =3D pl011_class_init,
>  };

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
