Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b0031433760a92sm3843950wrq.115.2023.07.03.05.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:13:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5AEDA1FFBB;
	Mon,  3 Jul 2023 13:13:56 +0100 (BST)
References: <20230625212707.1078951-1-fufuyqqqqqq@gmail.com>
 <20230625212707.1078951-10-fufuyqqqqqq@gmail.com>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yeqi Fu <fufuyqqqqqq@gmail.com>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC v3 09/10] target/arm: Add support for native library calls
Date: Mon, 03 Jul 2023 13:13:17 +0100
In-reply-to: <20230625212707.1078951-10-fufuyqqqqqq@gmail.com>
Message-ID: <87cz19i457.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CK07kgbzwg1o


Yeqi Fu <fufuyqqqqqq@gmail.com> writes:

> Upon encountering specialized instructions reserved for native calls,
> store the function id and argument types, then invoke helper.
>
> Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
> ---
>  target/arm/tcg/translate-a64.c | 27 ++++++++++++++++++++++++++-
>  target/arm/tcg/translate.c     | 25 +++++++++++++++++++++++--
>  target/arm/tcg/translate.h     |  6 ++++++
>  3 files changed, 55 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a6=
4.c
> index 741a608739..24a664b928 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
<snip>
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -34,7 +34,7 @@
>  #include "exec/helper-gen.h"
>  #include "exec/log.h"
>  #include "cpregs.h"
> -
> +#include "native/native-defs.h"
>=20=20
>  #define ENABLE_ARCH_4T    arm_dc_feature(s, ARM_FEATURE_V4T)
>  #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
> @@ -58,6 +58,7 @@ TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
>  TCGv_i64 cpu_exclusive_addr;
>  TCGv_i64 cpu_exclusive_val;
>=20=20
> +

stray whitespace which will often make re-basing patches a pain.

>  #include "exec/gen-icount.h"
>=20=20
>  static const char * const regnames[] =3D
> @@ -1147,12 +1148,32 @@ static inline void gen_hlt(DisasContext *s, int i=
mm)
>       * semihosting, to provide some semblance of security
>       * (and for consistency with our 32-bit semihosting).
>       */
> +    if (native_call_enabled() && (!s->native_call_status)) {
> +        s->native_call_status =3D true;
> +        s->native_call_id =3D imm;
> +        return;
> +    } else if (native_call_enabled() && (s->native_call_status)) {
> +        TCGv_i32 arg1 =3D load_reg(s, 0);
> +        TCGv_i32 arg2 =3D load_reg(s, 1);
> +        TCGv_i32 arg3 =3D load_reg(s, 2);
> +
> +        TCGv_i32 abi_map =3D tcg_constant_i32(imm);
> +        TCGv_i32 func_id =3D tcg_constant_i32(s->native_call_id);
> +        TCGv_i32 res =3D tcg_temp_new_i32();
> +        TCGv_i32 mmu_idx =3D tcg_constant_i32(MMU_USER_IDX);
> +        gen_helper_native_call_i32(res, cpu_env, arg1, arg2, arg3,
> +                                    abi_map, func_id, mmu_idx);
> +
> +        store_reg(s, 0, res);
> +        s->native_call_status =3D false;
> +        s->native_call_id =3D 0;
> +        return;
> +    }
>      if (semihosting_enabled(s->current_el =3D=3D 0) &&
>          (imm =3D=3D (s->thumb ? 0x3c : 0xf000))) {
>          gen_exception_internal_insn(s, EXCP_SEMIHOST);
>          return;
>      }
> -

also here.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
