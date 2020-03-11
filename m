Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p16sm7468162wmi.40.2020.03.11.06.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:58:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 250861FF7E;
	Wed, 11 Mar 2020 13:58:09 +0000 (GMT)
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
 <20200310213203.18730-11-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v7 10/18] hw/arm/allwinner-h3: add Boot ROM support
In-reply-to: <20200310213203.18730-11-nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 13:58:09 +0000
Message-ID: <87eetzgfim.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mGewq66cnYdO


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> A real Allwinner H3 SoC contains a Boot ROM which is the
> first code that runs right after the SoC is powered on.
> The Boot ROM is responsible for loading user code (e.g. a bootloader)
> from any of the supported external devices and writing the downloaded
> code to internal SRAM. After loading the SoC begins executing the code
> written to SRAM.
>
> This commits adds emulation of the Boot ROM firmware setup functionality
> by loading user code from SD card in the A1 SRAM. While the A1 SRAM is
> 64KiB, we limit the size to 32KiB because the real H3 Boot ROM also rejec=
ts
> sizes larger than 32KiB. For reference, this behaviour is documented
> by the Linux Sunxi project wiki at:
>
>   https://linux-sunxi.org/BROM#U-Boot_SPL_limitations
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  include/hw/arm/allwinner-h3.h | 21 +++++++++++++++++++++
>  hw/arm/allwinner-h3.c         | 18 ++++++++++++++++++
>  hw/arm/orangepi.c             |  5 +++++
>  3 files changed, 44 insertions(+)
>
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index f9b9a02373..d338003724 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -46,6 +46,7 @@
>  #include "hw/sd/allwinner-sdhost.h"
>  #include "hw/net/allwinner-sun8i-emac.h"
>  #include "target/arm/cpu.h"
> +#include "sysemu/block-backend.h"
>=20=20
>  /**
>   * Allwinner H3 device list
> @@ -129,4 +130,24 @@ typedef struct AwH3State {
>      MemoryRegion sram_c;
>  } AwH3State;
>=20=20
> +/**
> + * Emulate Boot ROM firmware setup functionality.
> + *
> + * A real Allwinner H3 SoC contains a Boot ROM
> + * which is the first code that runs right after
> + * the SoC is powered on. The Boot ROM is responsible
> + * for loading user code (e.g. a bootloader) from any
> + * of the supported external devices and writing the
> + * downloaded code to internal SRAM. After loading the SoC
> + * begins executing the code written to SRAM.
> + *
> + * This function emulates the Boot ROM by copying 32 KiB
> + * of data from the given block device and writes it to
> + * the start of the first internal SRAM memory.
> + *
> + * @s: Allwinner H3 state object pointer
> + * @blk: Block backend device object pointer
> + */
> +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk);
> +
>  #endif /* HW_ARM_ALLWINNER_H3_H */
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index d1245d2b01..56b5c563a8 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -29,6 +29,7 @@
>  #include "hw/char/serial.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/usb/hcd-ehci.h"
> +#include "hw/loader.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/arm/allwinner-h3.h"
>=20=20
> @@ -170,6 +171,23 @@ enum {
>      AW_H3_GIC_NUM_SPI       =3D 128
>  };
>=20=20
> +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
> +{
> +    const int64_t rom_size =3D 32 * KiB;
> +    uint8_t *buffer =3D g_new0(uint8_t, rom_size);

There is an opportunity to use g_autofree here so you can skip..

> +    g_free(buffer);
> +}
> +
<snip>

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
