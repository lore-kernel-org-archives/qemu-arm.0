Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h190sm5572201wmd.22.2018.04.04.03.50.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Apr 2018 03:50:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4215F3E01DF;
	Wed,  4 Apr 2018 11:50:42 +0100 (BST)
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com> <1521034084-17344-2-git-send-email-abdallah.bouassida@lauterbach.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, khaled.jmal@lauterbach.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v5 1/3] target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo type
In-reply-to: <1521034084-17344-2-git-send-email-abdallah.bouassida@lauterbach.com>
Date: Wed, 04 Apr 2018 11:50:42 +0100
Message-ID: <87k1tnckjh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SAXu80d8WcH8


Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:

> This is a preparation for the coming feature of creating dynamically an X=
ML
> description for the ARM sysregs.
> A register has ARM_CP_NO_GDB enabled will not be shown in the dynamic XML.
> This bit is enabled automatically when creating CP_ANY wildcard aliases.
> This bit could be enabled manually for any register we want to remove fro=
m the
> dynamic XML description.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h    | 3 ++-
>  target/arm/helper.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1e7e1f8..5a6ea24 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1815,10 +1815,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t c=
pregid)
>  #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
>  #define ARM_CP_FPU               0x1000
>  #define ARM_CP_SVE               0x2000
> +#define ARM_CP_NO_GDB            0x4000
>  /* Used only as a terminator for ARMCPRegInfo lists */
>  #define ARM_CP_SENTINEL          0xffff
>  /* Mask of only the flag bits in a type field */
> -#define ARM_CP_FLAG_MASK         0x30ff
> +#define ARM_CP_FLAG_MASK         0x70ff
>
>  /* Valid values for ARMCPRegInfo state field, indicating which of
>   * the AArch32 and AArch64 execution states this register is visible in.
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 09893e3..db8c925 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5664,7 +5664,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, con=
st ARMCPRegInfo *r,
>      if (((r->crm =3D=3D CP_ANY) && crm !=3D 0) ||
>          ((r->opc1 =3D=3D CP_ANY) && opc1 !=3D 0) ||
>          ((r->opc2 =3D=3D CP_ANY) && opc2 !=3D 0)) {
> -        r2->type |=3D ARM_CP_ALIAS;
> +        r2->type |=3D ARM_CP_ALIAS | ARM_CP_NO_GDB;
>      }
>
>      /* Check that raw accesses are either forbidden or handled. Note that


--
Alex Benn=C3=A9e
