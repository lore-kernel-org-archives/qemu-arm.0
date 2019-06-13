Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 67sm3144252wmd.38.2019.06.13.05.55.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 05:55:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 61B421FF87;
	Thu, 13 Jun 2019 13:55:27 +0100 (BST)
References: <20190516144733.32399-1-peter.maydell@linaro.org> <20190516144733.32399-5-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 4/4] hw/arm/boot: Honour image size field in AArch64 Image format kernels
In-reply-to: <20190516144733.32399-5-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 13:55:27 +0100
Message-ID: <87ftodejb4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PaHtyibfeoRf


Peter Maydell <peter.maydell@linaro.org> writes:

> Since Linux v3.17, the kernel's Image header includes a field image_size,
> which gives the total size of the kernel including unpopulated data
> sections such as the BSS). If this is present, then return it from
> load_aarch64_image() as the true size of the kernel rather than
> just using the size of the Image file itself. This allows the code
> which calculates where to put the initrd to avoid putting it in
> the kernel's BSS area.
>
> This means that we should be able to reliably load kernel images
> which are larger than 128MB without accidentally putting the
> initrd or dtb in locations that clash with the kernel itself.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1823998
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/boot.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e441393fdf5..fc6f37ba6cf 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -910,6 +910,7 @@ static uint64_t load_aarch64_image(const char *filena=
me, hwaddr mem_base,
>                                     hwaddr *entry, AddressSpace *as)
>  {
>      hwaddr kernel_load_offset =3D KERNEL64_LOAD_ADDR;
> +    uint64_t kernel_size =3D 0;
>      uint8_t *buffer;
>      int size;
>
> @@ -937,7 +938,10 @@ static uint64_t load_aarch64_image(const char *filen=
ame, hwaddr mem_base,
>           * is only valid if the image_size is non-zero.
>           */
>          memcpy(&hdrvals, buffer + ARM64_TEXT_OFFSET_OFFSET, sizeof(hdrva=
ls));
> -        if (hdrvals[1] !=3D 0) {
> +
> +        kernel_size =3D le64_to_cpu(hdrvals[1]);
> +
> +        if (kernel_size !=3D 0) {
>              kernel_load_offset =3D le64_to_cpu(hdrvals[0]);
>
>              /*
> @@ -955,12 +959,21 @@ static uint64_t load_aarch64_image(const char *file=
name, hwaddr mem_base,
>          }
>      }
>
> +    /*
> +     * Kernels before v3.17 don't populate the image_size field, and
> +     * raw images have no header. For those our best guess at the size
> +     * is the size of the Image file itself.
> +     */
> +    if (kernel_size =3D=3D 0) {
> +        kernel_size =3D size;
> +    }
> +
>      *entry =3D mem_base + kernel_load_offset;
>      rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
>
>      g_free(buffer);
>
> -    return size;
> +    return kernel_size;
>  }
>
>  static void arm_setup_direct_kernel_boot(ARMCPU *cpu,


--
Alex Benn=C3=A9e
