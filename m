Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x11sm3801650wmg.23.2019.06.13.05.53.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 05:53:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EDEC91FF87;
	Thu, 13 Jun 2019 13:53:36 +0100 (BST)
References: <20190516144733.32399-1-peter.maydell@linaro.org> <20190516144733.32399-4-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Mark Rutland <mark.rutland@arm.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 3/4] hw/arm/boot: Avoid placing the initrd on top of the kernel
In-reply-to: <20190516144733.32399-4-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 13:53:36 +0100
Message-ID: <87h88teje7.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ulfUmx6QN3sj


Peter Maydell <peter.maydell@linaro.org> writes:

> We currently put the initrd at the smaller of:
>  * 128MB into RAM
>  * halfway into the RAM
> (with the dtb following it).
>
> However for large kernels this might mean that the kernel
> overlaps the initrd. For some kinds of kernel (self-decompressing
> 32-bit kernels, and ELF images with a BSS section at the end)
> we don't know the exact size, but even there we have a
> minimum size. Put the initrd at least further into RAM than
> that. For image formats that can give us an exact kernel size, this
> will mean that we definitely avoid overlaying kernel and initrd.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  hw/arm/boot.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 935be3b92a5..e441393fdf5 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -999,20 +999,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      if (info->nb_cpus =3D=3D 0)
>          info->nb_cpus =3D 1;
>
> -    /*
> -     * We want to put the initrd far enough into RAM that when the
> -     * kernel is uncompressed it will not clobber the initrd. However
> -     * on boards without much RAM we must ensure that we still leave
> -     * enough room for a decent sized initrd, and on boards with large
> -     * amounts of RAM we must avoid the initrd being so far up in RAM
> -     * that it is outside lowmem and inaccessible to the kernel.
> -     * So for boards with less  than 256MB of RAM we put the initrd
> -     * halfway into RAM, and for boards with 256MB of RAM or more we put
> -     * the initrd at 128MB.
> -     */
> -    info->initrd_start =3D info->loader_start +
> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> -
>      /* Assume that raw images are linux kernels, and ELF images are not.=
  */
>      kernel_size =3D arm_load_elf(info, &elf_entry, &elf_low_addr,
>                                 &elf_high_addr, elf_machine, as);
> @@ -1064,6 +1050,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *c=
pu,
>      }
>
>      info->entry =3D entry;
> +
> +    /*
> +     * We want to put the initrd far enough into RAM that when the
> +     * kernel is uncompressed it will not clobber the initrd. However
> +     * on boards without much RAM we must ensure that we still leave
> +     * enough room for a decent sized initrd, and on boards with large
> +     * amounts of RAM we must avoid the initrd being so far up in RAM
> +     * that it is outside lowmem and inaccessible to the kernel.
> +     * So for boards with less  than 256MB of RAM we put the initrd
> +     * halfway into RAM, and for boards with 256MB of RAM or more we put
> +     * the initrd at 128MB.
> +     * We also refuse to put the initrd somewhere that will definitely
> +     * overlay the kernel we just loaded, though for kernel formats which
> +     * don't tell us their exact size (eg self-decompressing 32-bit kern=
els)
> +     * we might still make a bad choice here.
> +     */
> +    info->initrd_start =3D info->loader_start +
> +        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
> +    info->initrd_start =3D TARGET_PAGE_ALIGN(info->initrd_start);
> +
>      if (is_linux) {
>          uint32_t fixupcontext[FIXUP_MAX];


--
Alex Benn=C3=A9e
