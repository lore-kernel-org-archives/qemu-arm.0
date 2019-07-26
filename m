Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z5sm36048241wmf.48.2019.07.26.03.04.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:04:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CC6FD1FF87;
	Fri, 26 Jul 2019 11:04:17 +0100 (BST)
References: <20190722151804.25467-1-peter.maydell@linaro.org>
 <20190722151804.25467-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Mark Rutland <mark.rutland@arm.com>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-arm] [PATCH for-4.1? 1/2] hw/arm/boot: Rename elf_{low,
 high}_addr to image_{low, high}_addr
In-reply-to: <20190722151804.25467-2-peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 11:04:17 +0100
Message-ID: <87zhl1gli6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QAerJrMJR6UT


Peter Maydell <peter.maydell@linaro.org> writes:

> Rename the elf_low_addr and elf_high_addr variables to image_low_addr
> and image_high_addr -- in the next commit we will extend them to
> be set for other kinds of image file and not just ELF files.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/boot.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1fb24fbef27..b7b31753aca 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -986,7 +986,9 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      int kernel_size;
>      int initrd_size;
>      int is_linux =3D 0;
> -    uint64_t elf_entry, elf_low_addr, elf_high_addr;
> +    uint64_t elf_entry;
> +    /* Addresses of first byte used and first byte not used by the image=
 */
> +    uint64_t image_low_addr, image_high_addr;
>      int elf_machine;
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
> @@ -1014,24 +1016,24 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>          info->nb_cpus =3D 1;
>
>      /* Assume that raw images are linux kernels, and ELF images are not.=
  */
> -    kernel_size =3D arm_load_elf(info, &elf_entry, &elf_low_addr,
> -                               &elf_high_addr, elf_machine, as);
> +    kernel_size =3D arm_load_elf(info, &elf_entry, &image_low_addr,
> +                               &image_high_addr, elf_machine, as);
>      if (kernel_size > 0 && have_dtb(info)) {
>          /*
>           * If there is still some room left at the base of RAM, try and =
put
>           * the DTB there like we do for images loaded with -bios or -pfl=
ash.
>           */
> -        if (elf_low_addr > info->loader_start
> -            || elf_high_addr < info->loader_start) {
> +        if (image_low_addr > info->loader_start
> +            || image_high_addr < info->loader_start) {
>              /*
> -             * Set elf_low_addr as address limit for arm_load_dtb if it =
may be
> +             * Set image_low_addr as address limit for arm_load_dtb if i=
t may be
>               * pointing into RAM, otherwise pass '0' (no limit)
>               */
> -            if (elf_low_addr < info->loader_start) {
> -                elf_low_addr =3D 0;
> +            if (image_low_addr < info->loader_start) {
> +                image_low_addr =3D 0;
>              }
>              info->dtb_start =3D info->loader_start;
> -            info->dtb_limit =3D elf_low_addr;
> +            info->dtb_limit =3D image_low_addr;
>          }
>      }
>      entry =3D elf_entry;


--
Alex Benn=C3=A9e
