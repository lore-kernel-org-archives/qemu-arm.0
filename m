Received: by 10.28.71.27 with SMTP id u27csp3243882wma;
        Thu, 15 Feb 2018 14:35:50 -0800 (PST)
X-Google-Smtp-Source: AH8x226ESmNibYW1KRZi+IyO3YEM3jywCDU18PiQoeGE7xcJXUM2vvRIPG+XRg9pOSVVmIuUuXFe
X-Received: by 10.37.198.81 with SMTP id k78mr2295324ybf.132.1518734150731;
        Thu, 15 Feb 2018 14:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518734150; cv=none;
        d=google.com; s=arc-20160816;
        b=yZUwbg2ktmzWSw353kSiSX7K1u8eBaILSv78FFp0OB5+Hy+1bKZgDlSE5EhCNO0BZE
         mk4C/gRsYaWp/fcPut7TOs0jx8haucb3zY7/E5vuQNteuHQKOuyL/ARupAHeSDvM3VLs
         lBG/zWcrh5tlbF68IdOM0wacdfnUkRJaijWU4+GIW4rSowhVeYvQKdVAeIQV7qEFi7lT
         MWDn3+HRJ7EynQHOJmxHEU5X7ytIzRMUAVzHtQ5v9o7jpuo2qMt+r7aywjPSYb0FGbvK
         ivFmZjPrGxzAUY0Yvb7Mgs/06JOmcIQSnQdBdB5MyxL3jQ0v8HETaJscI9gIlQhtMSdN
         TuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=GrKmLBIfhcmxMYSKylvuw/B34TTrbySM49dllfjv5Gc=;
        b=pRIGUOfASxphQvhqeKdWGZbu0SmL6/oiqgdVSsHfWr2Z0XzdQic78JBghhpOINg8lC
         8MtCs6UhY4eTC8TEiFaZuEVt925UldGja/QyUgHGnb3c1QAFgz8FS3+e6YMKKVr1nfEs
         JlFCDiFeKt78bkHTbkzzmrZDWNbMR2BFripqsQtnsWqdGBE9KRO6MaqLxEPo5YSGDLFh
         Q3b9T0zerzlSuRT1j8/wcyC8tqchD7nzgtcC0MvNLkCbtGLghH0MgSY2bOaHDBCRflpw
         ihqkRmLxsDN9fnKjx3wir7mrkTFQ6kXfopbrRd/stnyI8bK54U0e7eAgRwDkHDfSYl/X
         gWyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D95Ge9VJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x40si2958631ywj.576.2018.02.15.14.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 14:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D95Ge9VJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emS85-00037Q-Qo
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 17:35:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1emS4f-0008Tl-An
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 17:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1emS4d-00009G-6D
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 17:32:17 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1emS4c-00008m-P5; Thu, 15 Feb 2018 17:32:15 -0500
Received: by mail-lf0-x243.google.com with SMTP id j193so1716623lfe.0;
	Thu, 15 Feb 2018 14:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=GrKmLBIfhcmxMYSKylvuw/B34TTrbySM49dllfjv5Gc=;
	b=D95Ge9VJPAJvnKobN8r3zkC2pMo04aTY+iypPF3F4A3y7aTdVTzJnDkX5ipIypvRKO
	q/hHcJ+V0n5Hssul/evNcgDaR+y/Gn/bPkIyFnkBZaGGiBLzVxb0NO7wGDhwe7w1jRq4
	CC9AOi1BzULc4TubHS/JS5MwSG48lsS2xySkiLsL1d3YTVitDwLT4u1hnOmQ0NmVeyGm
	qKhGivULiqQ8L4TJdjvjRZ816qzWf49ry0MhnrP1cLX8O+nSgBXT6cHyrM7LLIMb2doJ
	aYvdIcYRHp4zFlOdzdEWlQWFz7ljsGFcZrIarodVR/hs9b/a8Zr7IIv+D+aaSxqESBMy
	1eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=GrKmLBIfhcmxMYSKylvuw/B34TTrbySM49dllfjv5Gc=;
	b=f/eXS4ggM58kIlVp2PUY2RXr/UsEh0tKSeIbWzVmC6j1E2E0Tt7BDJ43lx/uVyUBDO
	Lgl+okl4ABhTHM8nSBoQMILEvHAeDZM/W5yukLcaWU9sfvtnVrXp9/R0d7rv9uUqjdqX
	MPo4D5KHxy7IwJL+wgSE+KlrXR/hnxgS0EAQNrWwOR5bzQumXHNOPW9APNwu6zbL2FHE
	XNFAT0hfoG35JrWf1ax6O1mhQLKNmsSAPVUVizN0h4FNkliFVWIhlFxvT2VmWwHsUEb8
	hR1LTc04Z1Av1TGTWgnZVRQYGkR8Huq/qg/9w11Blc3jgKrEz85z6HQY3h9Nv79hiQck
	t/+g==
X-Gm-Message-State: APf1xPBi32jqGdSW17Cb9nkywXVfeEuN9ammjeVnnSo/l6J6FBbKqxfD
	ST30tFIV3COfvZzgOjiVFIMO9eqWmjOvumnEhiQ=
X-Received: by 10.46.2.199 with SMTP id y68mr2605900lje.39.1518733933299; Thu,
	15 Feb 2018 14:32:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.16.79 with HTTP; Thu, 15 Feb 2018 14:31:42 -0800 (PST)
In-Reply-To: <20180215042900.16078-8-f4bug@amsat.org>
References: <20180215042900.16078-1-f4bug@amsat.org>
	<20180215042900.16078-8-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 15 Feb 2018 14:31:42 -0800
X-Google-Sender-Auth: nkduthPr8PTDmigRL_UuNwPjHQ4
Message-ID: <CAKmqyKM6veqM7d=h+OKk9TpyJWFZuUGHnX5+gUcM3P6RAzYgHQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [PATCH 07/30] hw/arm: use the BYTE-based
 definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OnoTJan5oAD9

On Wed, Feb 14, 2018 at 8:28 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> It ease code review, unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The logic looks good.

Did you do this automatically? If so you should include the commands
in the commit message.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  include/hw/arm/stm32f205_soc.h |  4 ++--
>  hw/arm/boot.c                  |  6 +++---
>  hw/arm/collie.c                |  4 ++--
>  hw/arm/digic_boards.c          |  6 +++---
>  hw/arm/gumstix.c               |  2 +-
>  hw/arm/integratorcp.c          |  2 +-
>  hw/arm/mainstone.c             |  2 +-
>  hw/arm/musicpal.c              |  8 ++++----
>  hw/arm/omap_sx1.c              |  8 ++++----
>  hw/arm/raspi.c                 |  2 +-
>  hw/arm/stellaris.c             |  4 ++--
>  hw/arm/versatilepb.c           |  4 ++--
>  hw/arm/vexpress.c              |  6 +++---
>  hw/arm/virt.c                  |  4 ++--
>  hw/arm/xilinx_zynq.c           |  4 ++--
>  hw/misc/aspeed_sdmc.c          |  8 ++++----
>  hw/misc/imx7_gpr.c             |  2 +-
>  hw/misc/omap_gpmc.c            |  4 ++--
>  hw/ssi/aspeed_smc.c            | 28 ++++++++++++++--------------
>  19 files changed, 54 insertions(+), 54 deletions(-)
>
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_so=
c.h
> index 922a733f88..e30ae33c65 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -43,9 +43,9 @@
>  #define STM_NUM_SPIS 3
>
>  #define FLASH_BASE_ADDRESS 0x08000000
> -#define FLASH_SIZE (1024 * 1024)
> +#define FLASH_SIZE (1 * M_BYTE)
>  #define SRAM_BASE_ADDRESS 0x20000000
> -#define SRAM_SIZE (128 * 1024)
> +#define SRAM_SIZE (128 * K_BYTE)
>
>  typedef struct STM32F205State {
>      /*< private >*/
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 05108bc42f..0552284d57 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -984,7 +984,7 @@ static void arm_load_kernel_notify(Notifier *notifier=
, void *data)
>       * the initrd at 128MB.
>       */
>      info->initrd_start =3D info->loader_start +
> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> +        MIN(info->ram_size / 2, 128 * M_BYTE);
>
>      /* Assume that raw images are linux kernels, and ELF images are not.=
  */
>      kernel_size =3D arm_load_elf(info, &elf_entry, &elf_low_addr,
> @@ -1069,13 +1069,13 @@ static void arm_load_kernel_notify(Notifier *noti=
fier, void *data)
>                   *
>                   * Let's play safe and prealign it to 2MB to give us som=
e space.
>                   */
> -                align =3D 2 * 1024 * 1024;
> +                align =3D 2 * M_BYTE;
>              } else {
>                  /*
>                   * Some 32bit kernels will trash anything in the 4K page=
 the
>                   * initrd ends in, so make sure the DTB isn't caught up =
in that.
>                   */
> -                align =3D 4096;
> +                align =3D 4 * K_BYTE;
>              }
>
>              /* Place the DTB after the initrd in memory with alignment. =
*/
> diff --git a/hw/arm/collie.c b/hw/arm/collie.c
> index f8c566e2e5..1695863629 100644
> --- a/hw/arm/collie.c
> +++ b/hw/arm/collie.c
> @@ -39,12 +39,12 @@ static void collie_init(MachineState *machine)
>      dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      pflash_cfi01_register(SA_CS0, NULL, "collie.fl1", 0x02000000,
>                      dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                    (64 * 1024), 512, 4, 0x00, 0x00, 0x00, 0x00, 0);
> +                    64 * K_BYTE, 512, 4, 0x00, 0x00, 0x00, 0x00, 0);
>
>      dinfo =3D drive_get(IF_PFLASH, 0, 1);
>      pflash_cfi01_register(SA_CS1, NULL, "collie.fl2", 0x02000000,
>                      dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                    (64 * 1024), 512, 4, 0x00, 0x00, 0x00, 0x00, 0);
> +                    64 * K_BYTE, 512, 4, 0x00, 0x00, 0x00, 0x00, 0);
>
>      sysbus_create_simple("scoop", 0x40800000, NULL);
>
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 9f11dcd11f..04e52e776f 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -126,8 +126,8 @@ static void digic_load_rom(DigicBoardState *s, hwaddr=
 addr,
>  static void digic4_add_k8p3215uqb_rom(DigicBoardState *s, hwaddr addr,
>                                        const char *def_filename)
>  {
> -#define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
> -#define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
> +#define FLASH_K8P3215UQB_SIZE (4 * M_BYTE)
> +#define FLASH_K8P3215UQB_SECTOR_SIZE (64 * K_BYTE)
>
>      pflash_cfi02_register(addr, NULL, "pflash", FLASH_K8P3215UQB_SIZE,
>                            NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
> @@ -141,7 +141,7 @@ static void digic4_add_k8p3215uqb_rom(DigicBoardState=
 *s, hwaddr addr,
>  }
>
>  static DigicBoard digic4_board_canon_a1100 =3D {
> -    .ram_size =3D 64 * 1024 * 1024,
> +    .ram_size =3D 64 * M_BYTE,
>      .add_rom1 =3D digic4_add_k8p3215uqb_rom,
>      .rom1_def_filename =3D "canon-a1100-rom1.bin",
>  };
> diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
> index ea2a3c532d..fc15df1d12 100644
> --- a/hw/arm/gumstix.c
> +++ b/hw/arm/gumstix.c
> @@ -47,7 +47,7 @@
>  #include "sysemu/qtest.h"
>  #include "cpu.h"
>
> -static const int sector_len =3D 128 * 1024;
> +static const int sector_len =3D 128 * K_BYTE;
>
>  static void connex_init(MachineState *machine)
>  {
> diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
> index e8303b83be..4e711194ef 100644
> --- a/hw/arm/integratorcp.c
> +++ b/hw/arm/integratorcp.c
> @@ -609,7 +609,7 @@ static void integratorcp_init(MachineState *machine)
>      memory_region_add_subregion(address_space_mem, 0x80000000, ram_alias=
);
>
>      dev =3D qdev_create(NULL, TYPE_INTEGRATOR_CM);
> -    qdev_prop_set_uint32(dev, "memsz", ram_size >> 20);
> +    qdev_prop_set_uint32(dev, "memsz", ram_size / M_BYTE);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map((SysBusDevice *)dev, 0, 0x10000000);
>
> diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
> index 4215c025fc..37c21ed6d0 100644
> --- a/hw/arm/mainstone.c
> +++ b/hw/arm/mainstone.c
> @@ -115,7 +115,7 @@ static void mainstone_common_init(MemoryRegion *addre=
ss_space_mem,
>                                    MachineState *machine,
>                                    enum mainstone_model_e model, int arm_=
id)
>  {
> -    uint32_t sector_len =3D 256 * 1024;
> +    uint32_t sector_len =3D 256 * K_BYTE;
>      hwaddr mainstone_flash_base[] =3D { MST_FLASH_0, MST_FLASH_1 };
>      PXA2xxState *mpu;
>      DeviceState *mst_irq;
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 38d7322a19..d6d1ce75c5 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -62,8 +62,8 @@
>  #define MP_SRAM_BASE            0xC0000000
>  #define MP_SRAM_SIZE            0x00020000
>
> -#define MP_RAM_DEFAULT_SIZE     32*1024*1024
> -#define MP_FLASH_SIZE_MAX       32*1024*1024
> +#define MP_RAM_DEFAULT_SIZE     (32 * M_BYTE)
> +#define MP_FLASH_SIZE_MAX       (32 * M_BYTE)
>
>  #define MP_TIMER1_IRQ           4
>  #define MP_TIMER2_IRQ           5
> @@ -1625,8 +1625,8 @@ static void musicpal_init(MachineState *machine)
>          BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>
>          flash_size =3D blk_getlength(blk);
> -        if (flash_size !=3D 8*1024*1024 && flash_size !=3D 16*1024*1024 =
&&
> -            flash_size !=3D 32*1024*1024) {
> +        if (flash_size !=3D 8 * M_BYTE && flash_size !=3D 16 * M_BYTE &&
> +            flash_size !=3D 32 * M_BYTE) {
>              error_report("Invalid flash image size");
>              exit(1);
>          }
> diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
> index eccc19c77b..729af8bb80 100644
> --- a/hw/arm/omap_sx1.c
> +++ b/hw/arm/omap_sx1.c
> @@ -88,10 +88,10 @@ static const MemoryRegionOps static_ops =3D {
>  };
>
>  #define sdram_size     0x02000000
> -#define sector_size    (128 * 1024)
> -#define flash0_size    (16 * 1024 * 1024)
> -#define flash1_size    ( 8 * 1024 * 1024)
> -#define flash2_size    (32 * 1024 * 1024)
> +#define sector_size (128 * K_BYTE)
> +#define flash0_size (16 * M_BYTE)
> +#define flash1_size (8 * M_BYTE)
> +#define flash2_size (32 * M_BYTE)
>  #define total_ram_v1   (sdram_size + flash0_size + flash1_size + OMAP15X=
X_SRAM_SIZE)
>  #define total_ram_v2   (sdram_size + flash2_size + OMAP15XX_SRAM_SIZE)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index cd5fa8c3dc..091d07ff86 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -169,7 +169,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM2836_NCPUS;
>      mc->min_cpus =3D BCM2836_NCPUS;
>      mc->default_cpus =3D BCM2836_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * G_BYTE;
>      mc->ignore_memory_transaction_failures =3D true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index de7c0fc4a6..8ff7567126 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1284,8 +1284,8 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>      MemoryRegion *flash =3D g_new(MemoryRegion, 1);
>      MemoryRegion *system_memory =3D get_system_memory();
>
> -    flash_size =3D (((board->dc0 & 0xffff) + 1) << 1) * 1024;
> -    sram_size =3D ((board->dc0 >> 18) + 1) * 1024;
> +    flash_size =3D (((board->dc0 & 0xffff) + 1) << 1) * K_BYTE;
> +    sram_size =3D ((board->dc0 >> 18) + 1) * K_BYTE;
>
>      /* Flash programming is done via the SCU, so pretend it is ROM.  */
>      memory_region_init_ram(flash, NULL, "stellaris.flash", flash_size,
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index 418792cd02..041f12beb7 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -26,8 +26,8 @@
>  #include "hw/char/pl011.h"
>
>  #define VERSATILE_FLASH_ADDR 0x34000000
> -#define VERSATILE_FLASH_SIZE (64 * 1024 * 1024)
> -#define VERSATILE_FLASH_SECT_SIZE (256 * 1024)
> +#define VERSATILE_FLASH_SIZE (64 * M_BYTE)
> +#define VERSATILE_FLASH_SECT_SIZE (256 * K_BYTE)
>
>  /* Primary interrupt controller.  */
>
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index dc5928ae1a..d48b6d60c6 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -44,8 +44,8 @@
>  #include "hw/cpu/a15mpcore.h"
>
>  #define VEXPRESS_BOARD_ID 0x8e0
> -#define VEXPRESS_FLASH_SIZE (64 * 1024 * 1024)
> -#define VEXPRESS_FLASH_SECT_SIZE (256 * 1024)
> +#define VEXPRESS_FLASH_SIZE (64 * M_BYTE)
> +#define VEXPRESS_FLASH_SECT_SIZE (256 * K_BYTE)
>
>  /* Number of virtio transports to create (0..8; limited by
>   * number of available IRQ lines).
> @@ -354,7 +354,7 @@ static void a15_daughterboard_init(const VexpressMach=
ineState *vms,
>           * warning if we are on a host where ram_addr_t is 32 bits.
>           */
>          uint64_t rsz =3D ram_size;
> -        if (rsz > (30ULL * 1024 * 1024 * 1024)) {
> +        if (rsz > 30 * G_BYTE) {
>              error_report("vexpress-a15: cannot model more than 30GB RAM"=
);
>              exit(1);
>          }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index dbb3c8036a..8202a428e0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -110,7 +110,7 @@ static ARMPlatformBusSystemParams platform_bus_params=
;
>   * terabyte of physical address space.)
>   */
>  #define RAMLIMIT_GB 255
> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> +#define RAMLIMIT_BYTES (RAMLIMIT_GB * G_BYTE)
>
>  /* Addresses and sizes of our components.
>   * 0..128MB is space for a flash device so we can run bootrom code such =
as UEFI.
> @@ -783,7 +783,7 @@ static void create_one_flash(const char *name, hwaddr=
 flashbase,
>      DriveInfo *dinfo =3D drive_get_next(IF_PFLASH);
>      DeviceState *dev =3D qdev_create(NULL, "cfi.pflash01");
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> -    const uint64_t sectorlength =3D 256 * 1024;
> +    const uint64_t sectorlength =3D 256 * K_BYTE;
>
>      if (dinfo) {
>          qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 0f76333770..7a68503e68 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -40,8 +40,8 @@
>  #define NUM_QSPI_FLASHES 2
>  #define NUM_QSPI_BUSSES 2
>
> -#define FLASH_SIZE (64 * 1024 * 1024)
> -#define FLASH_SECTOR_SIZE (128 * 1024)
> +#define FLASH_SIZE (64 * M_BYTE)
> +#define FLASH_SECTOR_SIZE (128 * K_BYTE)
>
>  #define IRQ_OFFSET 32 /* pic interrupts start from index 32 */
>
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index f0b3053fae..d312f67528 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -143,7 +143,7 @@ static const MemoryRegionOps aspeed_sdmc_ops =3D {
>
>  static int ast2400_rambits(AspeedSDMCState *s)
>  {
> -    switch (s->ram_size >> 20) {
> +    switch (s->ram_size / M_BYTE) {
>      case 64:
>          return ASPEED_SDMC_DRAM_64MB;
>      case 128:
> @@ -159,13 +159,13 @@ static int ast2400_rambits(AspeedSDMCState *s)
>      /* use a common default */
>      warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 256M",
>                  s->ram_size);
> -    s->ram_size =3D 256 << 20;
> +    s->ram_size =3D 256 * M_BYTE;
>      return ASPEED_SDMC_DRAM_256MB;
>  }
>
>  static int ast2500_rambits(AspeedSDMCState *s)
>  {
> -    switch (s->ram_size >> 20) {
> +    switch (s->ram_size / M_BYTE) {
>      case 128:
>          return ASPEED_SDMC_AST2500_128MB;
>      case 256:
> @@ -181,7 +181,7 @@ static int ast2500_rambits(AspeedSDMCState *s)
>      /* use a common default */
>      warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
>                  s->ram_size);
> -    s->ram_size =3D 512 << 20;
> +    s->ram_size =3D 512 * M_BYTE;
>      return ASPEED_SDMC_AST2500_512MB;
>  }
>
> diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
> index c2a9df29c6..3d46bdbd09 100644
> --- a/hw/misc/imx7_gpr.c
> +++ b/hw/misc/imx7_gpr.c
> @@ -98,7 +98,7 @@ static void imx7_gpr_init(Object *obj)
>      IMX7GPRState *s =3D IMX7_GPR(obj);
>
>      memory_region_init_io(&s->mmio, obj, &imx7_gpr_ops, s,
> -                          TYPE_IMX7_GPR, 64 * 1024);
> +                          TYPE_IMX7_GPR, 64 * K_BYTE);
>      sysbus_init_mmio(sd, &s->mmio);
>  }
>
> diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
> index 84f9e4c612..af6b620e3e 100644
> --- a/hw/misc/omap_gpmc.c
> +++ b/hw/misc/omap_gpmc.c
> @@ -850,11 +850,11 @@ struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_=
state_s *mpu,
>                                &omap_nand_ops,
>                                &s->cs_file[cs],
>                                "omap-nand",
> -                              256 * 1024 * 1024);
> +                              256 * M_BYTE);
>      }
>
>      memory_region_init_io(&s->prefetch.iomem, NULL, &omap_prefetch_ops, =
s,
> -                          "omap-gpmc-prefetch", 256 * 1024 * 1024);
> +                          "omap-gpmc-prefetch", 256 * M_BYTE);
>      return s;
>  }
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 5059396bc6..b51cb6c0a9 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -149,35 +149,35 @@
>   * Segment Address Registers.
>   */
>  static const AspeedSegments aspeed_segments_legacy[] =3D {
> -    { 0x10000000, 32 * 1024 * 1024 },
> +    { 0x10000000, 32 * M_BYTE },
>  };
>
>  static const AspeedSegments aspeed_segments_fmc[] =3D {
> -    { 0x20000000, 64 * 1024 * 1024 }, /* start address is readonly */
> -    { 0x24000000, 32 * 1024 * 1024 },
> -    { 0x26000000, 32 * 1024 * 1024 },
> -    { 0x28000000, 32 * 1024 * 1024 },
> -    { 0x2A000000, 32 * 1024 * 1024 }
> +    { 0x20000000,  64 * M_BYTE }, /* start address is readonly */
> +    { 0x24000000,  32 * M_BYTE },
> +    { 0x26000000,  32 * M_BYTE },
> +    { 0x28000000,  32 * M_BYTE },
> +    { 0x2A000000,  32 * M_BYTE }
>  };
>
>  static const AspeedSegments aspeed_segments_spi[] =3D {
> -    { 0x30000000, 64 * 1024 * 1024 },
> +    { 0x30000000,  64 * M_BYTE },
>  };
>
>  static const AspeedSegments aspeed_segments_ast2500_fmc[] =3D {
> -    { 0x20000000, 128 * 1024 * 1024 }, /* start address is readonly */
> -    { 0x28000000,  32 * 1024 * 1024 },
> -    { 0x2A000000,  32 * 1024 * 1024 },
> +    { 0x20000000, 128 * M_BYTE }, /* start address is readonly */
> +    { 0x28000000,  32 * M_BYTE },
> +    { 0x2A000000,  32 * M_BYTE },
>  };
>
>  static const AspeedSegments aspeed_segments_ast2500_spi1[] =3D {
> -    { 0x30000000, 32 * 1024 * 1024 }, /* start address is readonly */
> -    { 0x32000000, 96 * 1024 * 1024 }, /* end address is readonly */
> +    { 0x30000000,  32 * M_BYTE }, /* start address is readonly */
> +    { 0x32000000,  96 * M_BYTE }, /* end address is readonly */
>  };
>
>  static const AspeedSegments aspeed_segments_ast2500_spi2[] =3D {
> -    { 0x38000000, 32 * 1024 * 1024 }, /* start address is readonly */
> -    { 0x3A000000, 96 * 1024 * 1024 }, /* end address is readonly */
> +    { 0x38000000,  32 * M_BYTE }, /* start address is readonly */
> +    { 0x3A000000,  96 * M_BYTE }, /* end address is readonly */
>  };
>
>  static const AspeedSMCController controllers[] =3D {
> --
> 2.16.1
>
>
