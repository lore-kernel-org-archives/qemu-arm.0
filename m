Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c1sm113811536wrh.1.2019.07.26.03.23.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:23:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 097981FF87;
	Fri, 26 Jul 2019 11:23:31 +0100 (BST)
References: <20190722151804.25467-1-peter.maydell@linaro.org>
 <20190722151804.25467-3-peter.maydell@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-devel] [PATCH for-4.1? 2/2] hw/arm/boot: Further improve
 initrd positioning code
In-reply-to: <20190722151804.25467-3-peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 11:23:30 +0100
Message-ID: <87wog5gkm5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2g8Po1j56H2s


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit e6b2b20d9735d4ef we made the boot loader code try to avoid
> putting the initrd on top of the kernel.  However the expression used
> to calculate the start of the initrd:
>
>     info->initrd_start =3D info->loader_start +
>         MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
>
> incorrectly uses 'kernel_size' as the offset within RAM of the
> highest address to avoid.  This is incorrect because the kernel
> doesn't start at address 0, but slightly higher than that.  This
> means that we can still incorrectly end up overlaying the initrd on
> the kernel in some cases, for example:
>
> * The kernel's image_size is 0x0a7a8000
> * The kernel was loaded at   0x40080000
> * The end of the kernel is   0x4A828000
> * The DTB was loaded at      0x4a800000
>
> To get this right we need to track the actual highest address used
> by the kernel and use that rather than kernel_size. We already
> set image_low_addr and image_high_addr for ELF images; set them
> also for the various other image types we support, and then use
> image_high_addr as the lowest allowed address for the initrd.
> (We don't use image_low_addr, but we set it for consistency
> with the existing code path for ELF files.)
>
> Fixes: e6b2b20d9735d4ef
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/boot.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index b7b31753aca..c2b89b3bb9b 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -988,7 +988,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      int is_linux =3D 0;
>      uint64_t elf_entry;
>      /* Addresses of first byte used and first byte not used by the image=
 */
> -    uint64_t image_low_addr, image_high_addr;
> +    uint64_t image_low_addr =3D 0, image_high_addr =3D 0;
>      int elf_machine;
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
> @@ -1041,17 +1041,29 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>          uint64_t loadaddr =3D info->loader_start + KERNEL_NOLOAD_ADDR;
>          kernel_size =3D load_uimage_as(info->kernel_filename, &entry, &l=
oadaddr,
>                                       &is_linux, NULL, NULL, as);
> +        if (kernel_size >=3D 0) {
> +            image_low_addr =3D loadaddr;
> +            image_high_addr =3D image_low_addr + kernel_size;
> +        }
>      }
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
>          kernel_size =3D load_aarch64_image(info->kernel_filename,
>                                           info->loader_start, &entry, as);
>          is_linux =3D 1;
> +        if (kernel_size >=3D 0) {
> +            image_low_addr =3D entry;
> +            image_high_addr =3D image_low_addr + kernel_size;
> +        }
>      } else if (kernel_size < 0) {
>          /* 32-bit ARM */
>          entry =3D info->loader_start + KERNEL_LOAD_ADDR;
>          kernel_size =3D load_image_targphys_as(info->kernel_filename, en=
try,
>                                               ram_end - KERNEL_LOAD_ADDR,=
 as);
>          is_linux =3D 1;
> +        if (kernel_size >=3D 0) {
> +            image_low_addr =3D entry;
> +            image_high_addr =3D image_low_addr + kernel_size;
> +        }
>      }
>      if (kernel_size < 0) {
>          error_report("could not load kernel '%s'", info->kernel_filename=
);
> @@ -1083,7 +1095,10 @@ static void arm_setup_direct_kernel_boot(ARMCPU *c=
pu,
>       * we might still make a bad choice here.
>       */
>      info->initrd_start =3D info->loader_start +
> -        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
> +        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> +    if (image_high_addr) {
> +        info->initrd_start =3D MAX(info->initrd_start, image_high_addr);
> +    }
>      info->initrd_start =3D TARGET_PAGE_ALIGN(info->initrd_start);
>
>      if (is_linux) {


--
Alex Benn=C3=A9e
