Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab7220asm49227125e9.6.2024.11.15.02.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:33:10 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1D3625F7A2;
	Fri, 15 Nov 2024 10:33:09 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  Anton Johansson <anjo@rev.ng>,  Bernhard
 Beschow <shentey@gmail.com>,  Alistair Francis <alistair@alistair23.me>,
  Paolo Bonzini <pbonzini@redhat.com>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RESEND v2 19/19] hw/net/xilinx_ethlite: Map RESERVED I/O
 as unimplemented
In-Reply-To: <20241114210010.34502-20-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 14 Nov 2024 22:00:10
 +0100")
References: <20241114210010.34502-1-philmd@linaro.org>
	<20241114210010.34502-20-philmd@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 15 Nov 2024 10:33:09 +0000
Message-ID: <8734jsss62.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Z5G//JUut/rt

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> In order to track access to reserved I/O space, use yet
> another UnimplementedDevice covering the whole device
> memory range. Mapped with lower priority (-1).
>
> The memory flat view becomes:
>
>   (qemu) info mtree -f
>   FlatView #0
>    Root memory region: system
>     0000000081000000-00000000810007e3 (prio 0, ram): ethlite.tx[0]buf
>     00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
>     00000000810007f4-00000000810007ff (prio 0, i/o): ethlite.tx[0]io
>     0000000081000800-0000000081000fe3 (prio 0, ram): ethlite.tx[1]buf
>     0000000081000fe4-0000000081000ff3 (prio -1, i/o): ethlite.reserved @0=
000000000000fe4
>     0000000081000ff4-0000000081000fff (prio 0, i/o): ethlite.tx[1]io
>     0000000081001000-00000000810017e3 (prio 0, ram): ethlite.rx[0]buf
>     00000000810017e4-00000000810017fb (prio -1, i/o): ethlite.reserved @0=
0000000000017e4
>     00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
>     0000000081001800-0000000081001fe3 (prio 0, ram): ethlite.rx[1]buf
>     0000000081001fe4-0000000081001ffb (prio -1, i/o): ethlite.reserved @0=
000000000001fe4
>     0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/net/xilinx_ethlite.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 5f1ff7b712..1be38c44dd 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -95,6 +95,7 @@ struct XlnxXpsEthLite
>      uint32_t c_rx_pingpong;
>      unsigned int port_index; /* dual port RAM index */
>=20=20
> +    UnimplementedDeviceState rsvd;
>      UnimplementedDeviceState mdio;
>      XlnxXpsEthLitePort port[2];
>  };
> @@ -304,6 +305,16 @@ static void xilinx_ethlite_realize(DeviceState *dev,=
 Error **errp)
>      memory_region_init(&s->container, OBJECT(dev),
>                         "xlnx.xps-ethernetlite", 0x2000);
>=20=20
> +    object_initialize_child(OBJECT(dev), "ethlite.reserved", &s->rsvd,
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    qdev_prop_set_string(DEVICE(&s->rsvd), "name", "ethlite.reserved");
> +    qdev_prop_set_uint64(DEVICE(&s->rsvd), "size",
> +                         memory_region_size(&s->container));
> +    sysbus_realize(SYS_BUS_DEVICE(&s->rsvd), &error_fatal);
> +    memory_region_add_subregion_overlap(&s->container, 0,
> +                           sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rsv=
d), 0),
> +                           -1);
> +
>      object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
>                              TYPE_UNIMPLEMENTED_DEVICE);
>      qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
