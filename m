Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z21sm5800564wmf.30.2019.09.12.04.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:42:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D26A41FF87;
	Thu, 12 Sep 2019 12:42:53 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-5-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 04/13] target/arm/arm-semi: clean up
 TaskState* usage in non-user-only code
In-reply-to: <20190910144428.32597-5-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:42:53 +0100
Message-ID: <87ftl1zqo2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vUMUyAI1KzlD


Peter Maydell <peter.maydell@linaro.org> writes:

> The semihosting code has to build for both user-only and softmmu;
> for user-only it needs access to the TaskState struct that holds
> per-thread information. For softmmu we don't need it.
>
> Currently the softmmu set_swi_errno() takes a CPUARMState *,
> which it doesn't use, and the 'ts' variable in do_arm_semihosting()
> is set to either be a TaskState* or a CPUARMState* depending on
> whether CONFIG_USER_ONLY is set, so that the callsite always
> passes 'ts'. Since we don't actually need the CPUARMState *,
> we can instead make set_swi_errno() always take a TaskState*,
> by providing a local-to-this-file dummy typedef for the softmmu
> case and setting ts to NULL for softmmu.
>
> This will make it easier to have other functions which pass
> through the TaskState*, because now they can have the same
> prototype regardless of whether they're CONFIG_USER_ONLY or not.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 48 ++++++++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 05491bf5248..ce3ba554bef 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -36,6 +36,13 @@
>  #else
>  #include "exec/gdbstub.h"
>  #include "qemu/cutils.h"
> +
> +/*
> + * Dummy typedef so that we can have functions that take
> + * a TaskState* even if we're building for softmmu; in that
> + * case the argument will always be NULL.
> + */
> +typedef void TaskState;
>  #endif
>
>  #define TARGET_SYS_OPEN        0x01
> @@ -213,27 +220,24 @@ static GuestFD *get_guestfd(int guestfd)
>      return gf;
>  }
>
> -#ifdef CONFIG_USER_ONLY
> -static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
> -{
> -    if (code =3D=3D (uint32_t)-1)
> -        ts->swi_errno =3D errno;
> -    return code;
> -}
> -#else
> +#ifndef CONFIG_USER_ONLY
>  static target_ulong syscall_err;
>
> -static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
> -{
> -    if (code =3D=3D (uint32_t)-1) {
> -        syscall_err =3D errno;
> -    }
> -    return code;
> -}
> -
>  #include "exec/softmmu-semi.h"
>  #endif
>
> +static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
> +{
> +    if (code =3D=3D (uint32_t)-1) {
> +#ifdef CONFIG_USER_ONLY
> +        ts->swi_errno =3D errno;
> +#else
> +        syscall_err =3D errno;
> +#endif
> +    }
> +    return code;
> +}
> +
>  static target_ulong arm_semi_syscall_len;
>
>  static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
> @@ -374,13 +378,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>      int nr;
>      uint32_t ret;
>      uint32_t len;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D cs->opaque;
> -#else
> -    CPUARMState *ts =3D env;
> -#endif
> +    TaskState *ts;
>      GuestFD *gf;
>
> +#ifdef CONFIG_USER_ONLY
> +    ts =3D cs->opaque;
> +#else
> +    ts =3D NULL;
> +#endif

Why not pass cs to set_swi_errno and deal with all the differences in
the helper?

> +
>      if (is_a64(env)) {
>          /* Note that the syscall number is in W0, not X0 */
>          nr =3D env->xregs[0] & 0xffffffffU;


--
Alex Benn=C3=A9e
