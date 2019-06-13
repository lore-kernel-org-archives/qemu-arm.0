Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s12sm2618649wmh.34.2019.06.13.05.44.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 05:44:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7E1EC1FF87;
	Thu, 13 Jun 2019 13:44:21 +0100 (BST)
References: <20190516144733.32399-1-peter.maydell@linaro.org> <20190516144733.32399-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 1/4] hw/arm/boot: Don't assume RAM starts at address zero
In-reply-to: <20190516144733.32399-2-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 13:44:21 +0100
Message-ID: <87k1dpejtm.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fc/nVUV0KZ1e


Peter Maydell <peter.maydell@linaro.org> writes:

> In the Arm kernel/initrd loading code, in some places we make the
> incorrect assumption that info->ram_size can be treated as the
> address of the end of RAM, as for instance when we calculate the
> available space for the initrd using "info->ram_size - info->initrd_start=
".
> This is wrong, because many Arm boards (including "virt") specify
> a non-zero info->loader_start to indicate that their RAM area
> starts at a non-zero physical address.
>
> Correct the places which make this incorrect assumption.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/boot.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index a830655e1af..0bb9a7d5b5c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -976,6 +976,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      int elf_machine;
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
> +    uint64_t ram_end =3D info->loader_start + info->ram_size;
>
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          primary_loader =3D bootloader_aarch64;
> @@ -1047,8 +1048,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
>          /* 32-bit ARM */
>          entry =3D info->loader_start + KERNEL_LOAD_ADDR;
>          kernel_size =3D load_image_targphys_as(info->kernel_filename, en=
try,
> -                                             info->ram_size - KERNEL_LOA=
D_ADDR,
> -                                             as);
> +                                             ram_end - KERNEL_LOAD_ADDR,=
 as);
>          is_linux =3D 1;
>      }
>      if (kernel_size < 0) {
> @@ -1062,12 +1062,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>          if (info->initrd_filename) {
>              initrd_size =3D load_ramdisk_as(info->initrd_filename,
>                                            info->initrd_start,
> -                                          info->ram_size - info->initrd_=
start,
> -                                          as);
> +                                          ram_end - info->initrd_start, =
as);
>              if (initrd_size < 0) {
>                  initrd_size =3D load_image_targphys_as(info->initrd_file=
name,
>                                                       info->initrd_start,
> -                                                     info->ram_size -
> +                                                     ram_end -
>                                                       info->initrd_start,
>                                                       as);
>              }


--
Alex Benn=C3=A9e
