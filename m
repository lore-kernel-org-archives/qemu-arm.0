Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t140sm6040929wmt.0.2019.06.13.05.48.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 05:48:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D14631FF87;
	Thu, 13 Jun 2019 13:47:59 +0100 (BST)
References: <20190516144733.32399-1-peter.maydell@linaro.org> <20190516144733.32399-3-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/4] hw/arm/boot: Diagnose layouts that put initrd or DTB off the end of RAM
In-reply-to: <20190516144733.32399-3-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 13:47:59 +0100
Message-ID: <87imt9ejnk.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: THNrQtBu2t4T


Peter Maydell <peter.maydell@linaro.org> writes:

> We calculate the locations in memory where we want to put the
> initrd and the DTB based on the size of the kernel, since they
> come after it. Add some explicit checks that these aren't off the
> end of RAM entirely.
>
> (At the moment the way we calculate the initrd_start means that
> it can't ever be off the end of RAM, but that will change with
> the next commit.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/boot.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 0bb9a7d5b5c..935be3b92a5 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1055,11 +1055,25 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>          error_report("could not load kernel '%s'", info->kernel_filename=
);
>          exit(1);
>      }
> +
> +    if (kernel_size > info->ram_size) {
> +        error_report("kernel '%s' is too large to fit in RAM "
> +                     "(kernel size %d, RAM size %" PRId64 ")",
> +                     info->kernel_filename, kernel_size, info->ram_size);
> +        exit(1);
> +    }
> +
>      info->entry =3D entry;
>      if (is_linux) {
>          uint32_t fixupcontext[FIXUP_MAX];
>
>          if (info->initrd_filename) {
> +
> +            if (info->initrd_start >=3D ram_end) {
> +                error_report("not enough space after kernel to load init=
rd");
> +                exit(1);
> +            }
> +
>              initrd_size =3D load_ramdisk_as(info->initrd_filename,
>                                            info->initrd_start,
>                                            ram_end - info->initrd_start, =
as);
> @@ -1075,6 +1089,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *c=
pu,
>                               info->initrd_filename);
>                  exit(1);
>              }
> +            if (info->initrd_start + initrd_size > info->ram_size) {
> +                error_report("could not load initrd '%s': "
> +                             "too big to fit into RAM after the kernel",
> +                             info->initrd_filename);
> +            }
>          } else {
>              initrd_size =3D 0;
>          }
> @@ -1110,6 +1129,10 @@ static void arm_setup_direct_kernel_boot(ARMCPU *c=
pu,
>              /* Place the DTB after the initrd in memory with alignment. =
*/
>              info->dtb_start =3D QEMU_ALIGN_UP(info->initrd_start + initr=
d_size,
>                                             align);
> +            if (info->dtb_start >=3D ram_end) {
> +                error_report("Not enough space for DTB after kernel/init=
rd");
> +                exit(1);
> +            }
>              fixupcontext[FIXUP_ARGPTR_LO] =3D info->dtb_start;
>              fixupcontext[FIXUP_ARGPTR_HI] =3D info->dtb_start >> 32;
>          } else {


--
Alex Benn=C3=A9e
