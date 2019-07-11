Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v124sm5754810wmf.23.2019.07.11.06.01.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 06:01:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C6A5B1FF87;
	Thu, 11 Jul 2019 14:01:20 +0100 (BST)
References: <20190711121231.3601-1-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, Christophe Lyon <christophe.lyon@linaro.org>
Subject: Re: [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for arm926 and arm1026
In-reply-to: <20190711121231.3601-1-peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 14:01:20 +0100
Message-ID: <87d0igendr.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: oxZHPrXy4hlW


Peter Maydell <peter.maydell@linaro.org> writes:

> The ARMv5 architecture didn't specify detailed per-feature ID
> registers. Now that we're using the MVFR0 register fields to
> gate the existence of VFP instructions, we need to set up
> the correct values in the cpu->isar structure so that we still
> provide an FPU to the guest.
>
> This fixes a regression in the arm926 and arm1026 CPUs, which
> are the only ones that both have VFP and are ARMv5 or earlier.
> This regression was introduced by the VFP refactoring, and more
> specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
> which accidentally disabled VFP short-vector support and
> double-precision support on these CPUs.
>
> Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 1120827fa182f0e
> Fixes: 266bd25c485597c
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
> ---
> I've followed the existing approach we used for ISAR1 here
> of just filling in the fields we care about, rather than trying
> to set the entire register value.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Do you think we have caught them all now? If we end up removing the
other ARM_FEATURE_foo flags in favour of isar tests we shall have to be
careful not to re-introduce these sort of bugs.

>
>  target/arm/cpu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e75a64a25a4..446dd5163dc 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1666,6 +1666,12 @@ static void arm926_initfn(Object *obj)
>       * set the field to indicate Jazelle support within QEMU.
>       */
>      cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZE=
LLE, 1);
> +    /*
> +     * Similarly, we need to set MVFR0 fields to enable double precision
> +     * and short vector support even though ARMv5 doesn't have this regi=
ster.
> +     */
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
>  }
>
>  static void arm946_initfn(Object *obj)
> @@ -1713,6 +1719,12 @@ static void arm1026_initfn(Object *obj)
>          };
>          define_one_arm_cp_reg(cpu, &ifar);
>      }
> +    /*
> +     * Similarly, we need to set MVFR0 fields to enable double precision
> +     * and short vector support even though ARMv5 doesn't have this regi=
ster.
> +     */
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
>  }
>
>  static void arm1136_r2_initfn(Object *obj)


--
Alex Benn=C3=A9e
