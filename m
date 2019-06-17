Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a7sm10381899wrs.94.2019.06.17.08.19.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 08:19:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C7C501FF87;
	Mon, 17 Jun 2019 16:19:55 +0100 (BST)
References: <20190531154735.20809-1-philmd@redhat.com> <20190531154735.20809-2-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo <arikalo@wavecomp.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [RFC PATCH 1/2] target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled
In-reply-to: <20190531154735.20809-2-philmd@redhat.com>
Date: Mon, 17 Jun 2019 16:19:55 +0100
Message-ID: <878su09r38.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +d3v61ElRljM


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> If a distribution wants to build QEMU without semihosting support,
> it currently gets this build failure:
>
>   $ ./configure --target-list=3Daarch64-softmmu --without-default-devices
>   $ sed -i s/CONFIG_SEMIHOSTING=3Dy/CONFIG_SEMIHOSTING=3Dn/default-config=
s/arm-softmmu.mak

I'm still not convinced we should be adding support for stuff being done
outside the normal build process... that said...

>   $ make subdir-aarch64-softmmu
>   [...]
>     LINK    aarch64-softmmu/qemu-system-aarch64
>   /usr/bin/ld: target/arm/arm-semi.o: in function `do_arm_semihosting':
>   ./target/arm/arm-semi.c:321: undefined reference to `qemu_semihosting_c=
onsole_out'
>   /usr/bin/ld: ./target/arm/arm-semi.c:318: undefined reference to `qemu_=
semihosting_console_out'
>   collect2: error: ld returned 1 exit status
>   make[1]: *** [Makefile:204: qemu-system-aarch64] Error 1
>   make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2
>
> Fix it by providing a stub when semihosting is disabled.
>
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/Makefile.objs    |  3 ++-
>  target/arm/arm-semi-stubs.c | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/arm-semi-stubs.c
>
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 6bdcc65c2c..39b02b1fa4 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -1,4 +1,5 @@
> -obj-y +=3D arm-semi.o
> +obj-$(CONFIG_SEMIHOSTING) +=3D arm-semi.o
> +obj-$(call lnot,$(CONFIG_SEMIHOSTING)) +=3D arm-semi-stubs.o
>  obj-$(CONFIG_SOFTMMU) +=3D machine.o psci.o arch_dump.o monitor.o
>  obj-$(CONFIG_KVM) +=3D kvm.o
>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
> diff --git a/target/arm/arm-semi-stubs.c b/target/arm/arm-semi-stubs.c
> new file mode 100644
> index 0000000000..a91ecbd9d5
> --- /dev/null
> +++ b/target/arm/arm-semi-stubs.c
> @@ -0,0 +1,21 @@
> +/*
> + *  Arm "Angel" semihosting stubs
> + *
> + * Copyright (c) 2019 Red Hat, Inc.
> + *
> + * Author:
> + *   Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +
> +target_ulong do_arm_semihosting(CPUARMState *env)
> +{
> +    g_assert_not_reached();
> +}

Could this not just be added to arm-semi.c in an

  #ifndef CONFIG_SEMIHOSTING
  target_ulong do_arm_semihosting(CPUARMState *env)
  {
      g_assert_not_reached();
  }
  #else
  ... rest of arm-semi.c....
  #endif


--
Alex Benn=C3=A9e
