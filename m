Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s188sm12550457wmf.40.2019.06.17.07.07.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:07:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9EE0C1FF87;
	Mon, 17 Jun 2019 15:07:18 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-23-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH v2 22/23] target/arm: Restrict semi-hosting to TCG
In-reply-to: <20190615154352.26824-23-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:07:18 +0100
Message-ID: <87wohk9ug9.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JQxPJSzzBPtG


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Per Peter Maydell:
>
>   semihosting hooks either SVC or HLT instructions, and inside KVM
>   both of those go to EL1, ie to the guest, and can't be trapped to
>   KVM.
>
> Let check_for_semihosting() return False when not running on TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8b7ce0561b..a3843a5508 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -20,7 +20,6 @@
>  #include "qemu/crc32c.h"
>  #include "qemu/qemu-print.h"
>  #include "exec/exec-all.h"
> -#include "arm_ldst.h"
>  #include <zlib.h> /* For crc32 */
>  #include "hw/semihosting/semihost.h"
>  #include "sysemu/cpus.h"
> @@ -30,6 +29,9 @@
>  #include "qapi/qapi-commands-target.h"
>  #include "qapi/error.h"
>  #include "qemu/guest-random.h"
> +#ifdef CONFIG_TCG
> +#include "arm_ldst.h"
> +#endif
>
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
>
> @@ -8270,6 +8272,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *=
cs)
>
>  static inline bool check_for_semihosting(CPUState *cs)
>  {
> +#ifdef CONFIG_TCG
>      /* Check whether this exception is a semihosting call; if so
>       * then handle it and return true; otherwise return false.
>       */
> @@ -8345,6 +8348,9 @@ static inline bool check_for_semihosting(CPUState *=
cs)
>          env->regs[0] =3D do_arm_semihosting(env);
>          return true;
>      }
> +#else
> +    return false;
> +#endif
>  }
>
>  /* Handle a CPU exception for A and R profile CPUs.


--
Alex Benn=C3=A9e
