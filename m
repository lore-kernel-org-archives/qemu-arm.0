Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f6-20020adff986000000b002e52dfb9256sm6682692wrr.41.2023.04.11.00.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 00:32:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5AFE01FFB7;
	Tue, 11 Apr 2023 08:32:56 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-5-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Date: Tue, 11 Apr 2023 08:31:27 +0100
In-reply-to: <20230405160454.97436-5-philmd@linaro.org>
Message-ID: <87r0sqrhzr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xOrhLkwh79rq


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> "hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).
>
> arm_gic_common_reset_irq_state() calls its second argument
> 'first_cpu', producing a build failure when "hw/core/cpu.h"
> is included:
>
>   hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name i=
n a function definition is a C2x extension [-Wc2x-extensions]
>     static inline void arm_gic_common_reset_irq_state(GICState *s, int fi=
rst_cpu,
>                                                                        ^
>   include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
>     #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
>                              ^
>
> KISS, rename the function argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/intc/arm_gic_common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 9702197856..889327a8cf 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -235,12 +235,13 @@ static void arm_gic_common_realize(DeviceState *dev=
, Error **errp)
>      }
>  }
>=20=20
> -static inline void arm_gic_common_reset_irq_state(GICState *s, int first=
_cpu,
> +static inline void arm_gic_common_reset_irq_state(GICState *s,
> +                                                  int
> first_cpu_index,

I'd have gone for a shorter name like cidx maybe, naming things is hard.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>                                                    int resetprio)
>  {
>      int i, j;
>=20=20
> -    for (i =3D first_cpu; i < first_cpu + s->num_cpu; i++) {
> +    for (i =3D first_cpu_index; i < first_cpu_index + s->num_cpu; i++) {
>          if (s->revision =3D=3D REV_11MPCORE) {
>              s->priority_mask[i] =3D 0xf0;
>          } else {


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
