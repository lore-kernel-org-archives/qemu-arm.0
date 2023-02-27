Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c20-20020a7bc854000000b003dd1bd66e0dsm8737471wml.3.2023.02.27.03.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:18:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C5FDB1FFB7;
	Mon, 27 Feb 2023 11:18:48 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-18-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 17/24] hw/ide: Declare
 ide_get_[geometry/bios_chs_trans] in 'hw/ide/internal.h'
Date: Mon, 27 Feb 2023 11:17:03 +0000
In-reply-to: <20230220091358.17038-18-philmd@linaro.org>
Message-ID: <87edqbicfb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cX9zWg/wAx9w


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> ide_get_geometry() and ide_get_bios_chs_trans() are only
> used by the TYPE_PC_MACHINE.
> "hw/ide.h" is a mixed bag of lost IDE declarations. In order
> to remove this (almost) pointless header soon, move these
> declarations to "hw/ide/internal.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/pc.c              | 3 ++-
>  include/hw/ide.h          | 4 ----
>  include/hw/ide/internal.h | 4 ++++
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..79297a6ecd 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -34,7 +34,8 @@
>  #include "hw/i386/vmport.h"
>  #include "sysemu/cpus.h"
>  #include "hw/block/fdc.h"
> -#include "hw/ide.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/isa.h"

I do kind of wonder why hw/ide/internal.h isn't in the appropriate
subdir (e.g. hw/ide and included as #include "internal.h") rather than
the "public" include directory. However QEMU isn't super consistent with
that:

  =E2=9E=9C  find . -iname "internal.h"
  ./accel/tcg/internal.h
  ./target/ppc/internal.h
  ./target/mips/internal.h
  ./target/hexagon/internal.h
  ./include/hw/ide/internal.h
  =F0=9F=95=9911:15:58 alex@zen:qemu.git  on =EE=82=A0 review/qom-housekeep=
ing-v2 [$?] took 7s=20
  =E2=9E=9C  find . -iname "internals.h"
  ./tests/fp/berkeley-softfloat-3/source/include/internals.h
  ./target/arm/internals.h
  ./target/riscv/internals.h
  ./target/loongarch/internals.h
  ./gdbstub/internals.h

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
