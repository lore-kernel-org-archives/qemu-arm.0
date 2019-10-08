Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j11sm24033886wrw.86.2019.10.08.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 08:32:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 11AF71FF87;
	Tue,  8 Oct 2019 16:32:36 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-14-f4bug@amsat.org>
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
Subject: Re: [PATCH 13/19] hw/arm/raspi: Define various blocks base addresses
In-reply-to: <20190926173428.10713-14-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 16:32:36 +0100
Message-ID: <87pnj7i76z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: smgy/Ceg+ck0


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The Raspberry firmware is closed-source. While running it, it
> accesses various I/O registers. Logging these accesses as UNIMP
> (unimplemented) help to understand what the firmware is doing
> (ideally we want it able to boot a Linux kernel).
>
> Document various blocks we might use later.
>
> Adresses and names based on:
> https://github.com/hermanhermitage/videocoreiv/wiki/MMIO-Register-map

I'd put this link in the header as well to save diving into the git
record to find this out.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Now the header is incorrect, should I add that in another file or
> update the header?
>
>  * These definitions are derived from those in Raspbian Linux at
>  * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
>  * where they carry the following notice:

"Some of these definitions..."

"additional definitions from..."

will be fine I think. The links are out of date w.r.t. current kernel
master anyway so they could do with being fixed up.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>  *
>  * Copyright (C) 2010 Broadcom
> ---
>  include/hw/arm/raspi_platform.h | 47 +++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platf=
orm.h
> index 61b04a1bd4..8bcf1c7c93 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -26,14 +26,19 @@
>  #define HW_ARM_RASPI_PLATFORM_H
>
>  #define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
> -#define IC0_OFFSET              0x2000
> +#define CCPT_OFFSET             0x1000   /* Compact Camera Port 2 TX */
> +#define INTE_OFFSET             0x2000   /* VC Interrupt controller */
>  #define ST_OFFSET               0x3000   /* System Timer */
> +#define TXP_OFFSET              0x4000
> +#define JPEG_OFFSET             0x5000
>  #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host =
Intf. */
>  #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-1=
4 */
> -#define ARM_OFFSET              0xB000   /* BCM2708 ARM control block */
> +#define ARBA_OFFSET             0x9000
> +#define BRDG_OFFSET             0xa000
> +#define ARM_OFFSET              0xB000   /* ARM control block */
>  #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
>  #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt contro=
ller */
> -#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
> +#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 (S=
P804) */
>  #define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Sem=
aphores
>                                                        * Doorbells & Mail=
boxes */
>  #define CPRMAN_OFFSET           0x100000 /* Power Management, Watchdog */
> @@ -42,24 +47,50 @@
>  #define AVS_OFFSET              0x103000 /* Audio Video Standard */
>  #define RNG_OFFSET              0x104000
>  #define GPIO_OFFSET             0x200000
> -#define UART0_OFFSET            0x201000
> -#define MMCI0_OFFSET            0x202000
> -#define I2S_OFFSET              0x203000
> -#define SPI0_OFFSET             0x204000
> +#define UART0_OFFSET            0x201000 /* PL011 */
> +#define MMCI0_OFFSET            0x202000 /* Legacy MMC */
> +#define I2S_OFFSET              0x203000 /* PCM */
> +#define SPI0_OFFSET             0x204000 /* SPI master */
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> +#define PIXV0_OFFSET            0x206000
> +#define PIXV1_OFFSET            0x207000
> +#define DPI_OFFSET              0x208000
> +#define DSI0_OFFSET             0x209000 /* Display Serial Interface */
> +#define PWM_OFFSET              0x20c000
> +#define PERM_OFFSET             0x20d000
> +#define TEC_OFFSET              0x20e000
>  #define OTP_OFFSET              0x20f000
> +#define SLIM_OFFSET             0x210000 /* SLIMbus */
> +#define CPG_OFFSET              0x211000
>  #define THERMAL_OFFSET          0x212000
> -#define BSC_SL_OFFSET           0x214000 /* SPI slave */
> +#define AVSP_OFFSET             0x213000
> +#define BSC_SL_OFFSET           0x214000 /* SPI slave (bootrom) */
>  #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
>  #define EMMC1_OFFSET            0x300000
> +#define EMMC2_OFFSET            0x340000
> +#define HVS_OFFSET              0x400000
>  #define SMI_OFFSET              0x600000
> +#define DSI1_OFFSET             0x700000
> +#define UCAM_OFFSET             0x800000
> +#define CMI_OFFSET              0x802000
>  #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
>  #define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
> +#define VECA_OFFSET             0x806000
> +#define PIXV2_OFFSET            0x807000
> +#define HDMI_OFFSET             0x808000
> +#define HDCP_OFFSET             0x809000
> +#define ARBR0_OFFSET            0x80a000
>  #define DBUS_OFFSET             0x900000
>  #define AVE0_OFFSET             0x910000
>  #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
> +#define V3D_OFFSET              0xc00000
>  #define SDRAMC_OFFSET           0xe00000
> +#define L2CC_OFFSET             0xe01000 /* Level 2 Cache controller */
> +#define L1CC_OFFSET             0xe02000 /* Level 1 Cache controller */
> +#define ARBR1_OFFSET            0xe04000
>  #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
> +#define DCRC_OFFSET             0xe07000
> +#define AXIP_OFFSET             0xe08000
>
>  /* GPU interrupts */
>  #define INTERRUPT_TIMER0               0


--
Alex Benn=C3=A9e
