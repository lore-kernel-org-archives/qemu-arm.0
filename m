Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf06d487sm1529271f8f.46.2024.10.18.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:21:48 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 25E205F863;
	Fri, 18 Oct 2024 11:21:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH] target/arm: Don't assert in regime_is_user() for E10
 mmuidx values
In-Reply-To: <20241017172331.822587-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 17 Oct 2024 18:23:31 +0100")
References: <20241017172331.822587-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Fri, 18 Oct 2024 11:21:47 +0100
Message-ID: <87plnx90ec.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cHxUMRphQLR0

Peter Maydell <peter.maydell@linaro.org> writes:

> In regime_is_user() we assert if we're passed an ARMMMUIdx_E10_*
> mmuidx value. This used to make sense because we only used this
> function in ptw.c and would never use it on this kind of stage 1+2
> mmuidx, only for an individual stage 1 or stage 2 mmuidx.
>
> However, when we implemented FEAT_E0PD we added a callsite in
> aa64_va_parameters(), which means this can now be called for
> stage 1+2 mmuidx values if the guest sets the TCG_ELX.{E0PD0,E0PD1}
> bits to enable use of the feature. This will then result in
> an assertion failure later, for instance on a TLBI operation:
>
> #6  0x00007ffff6d0e70f in g_assertion_message_expr
>     (domain=3D0x0, file=3D0x55555676eeba "../../target/arm/internals.h", =
line=3D978, func=3D0x555556771d48 <__func__.5> "regime_is_user", expr=3D<op=
timised out>)
>     at ../../../glib/gtestutils.c:3279
> #7  0x0000555555f286d2 in regime_is_user (env=3D0x555557f2fe00, mmu_idx=
=3DARMMMUIdx_E10_0) at ../../target/arm/internals.h:978
> #8  0x0000555555f3e31c in aa64_va_parameters (env=3D0x555557f2fe00, va=3D=
18446744073709551615, mmu_idx=3DARMMMUIdx_E10_0, data=3Dtrue, el1_is_aa32=
=3Dfalse)
>     at ../../target/arm/helper.c:12048
> #9  0x0000555555f3163b in tlbi_aa64_get_range (env=3D0x555557f2fe00, mmui=
dx=3DARMMMUIdx_E10_0, value=3D106721347371041) at ../../target/arm/helper.c=
:5214
> #10 0x0000555555f317e8 in do_rvae_write (env=3D0x555557f2fe00, value=3D10=
6721347371041, idxmap=3D21, synced=3Dtrue) at ../../target/arm/helper.c:5260
> #11 0x0000555555f31925 in tlbi_aa64_rvae1is_write (env=3D0x555557f2fe00, =
ri=3D0x555557fbeae0, value=3D106721347371041) at ../../target/arm/helper.c:=
5302
> #12 0x0000555556036f8f in helper_set_cp_reg64 (env=3D0x555557f2fe00, rip=
=3D0x555557fbeae0, value=3D106721347371041) at ../../target/arm/tcg/op_help=
er.c:965
>
> Since we do know whether these mmuidx values are for usermode
> or not, we can easily make regime_is_user() handle them:
> ARMMMUIdx_E10_0 is user, and the other two are not.
>
> Cc: qemu-stable@nongnu.org
> Fixes: e4c93e44ab103f ("target/arm: Implement FEAT_E0PD")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 299a96a81a7..fd8f7c82aa3 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -963,6 +963,7 @@ static inline uint32_t regime_el(CPUARMState *env, AR=
MMMUIdx mmu_idx)
>  static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
>      switch (mmu_idx) {
> +    case ARMMMUIdx_E10_0:
>      case ARMMMUIdx_E20_0:
>      case ARMMMUIdx_Stage1_E0:
>      case ARMMMUIdx_MUser:
> @@ -972,10 +973,6 @@ static inline bool regime_is_user(CPUARMState *env, =
ARMMMUIdx mmu_idx)
>          return true;
>      default:
>          return false;
> -    case ARMMMUIdx_E10_0:
> -    case ARMMMUIdx_E10_1:
> -    case ARMMMUIdx_E10_1_PAN:
> -        g_assert_not_reached();
>      }
>  }

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
