Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t14sm8473241wrr.33.2019.06.17.07.08.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:08:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5EDD91FF87;
	Mon, 17 Jun 2019 15:08:23 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-11-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 10/23] target/arm: Move the v7-M Security State helpers to v7m_helper
In-reply-to: <20190615154352.26824-11-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:08:23 +0100
Message-ID: <87sgs89ueg.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /b7Oc9AKerMI


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c     | 73 -----------------------------------------
>  target/arm/v7m_helper.c | 73 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+), 73 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b4fd9b42d7..cf76010ea1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7885,79 +7885,6 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *en=
v)
>       */
>  }
>
> -/*
> - * Write to v7M CONTROL.SPSEL bit for the specified security bank.
> - * This may change the current stack pointer between Main and Process
> - * stack pointers if it is done for the CONTROL register for the current
> - * security state.
> - */
> -void write_v7m_control_spsel_for_secstate(CPUARMState *env,
> -                                          bool new_spsel,
> -                                          bool secstate)
> -{
> -    bool old_is_psp =3D v7m_using_psp(env);
> -
> -    env->v7m.control[secstate] =3D
> -        deposit32(env->v7m.control[secstate],
> -                  R_V7M_CONTROL_SPSEL_SHIFT,
> -                  R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
> -
> -    if (secstate =3D=3D env->v7m.secure) {
> -        bool new_is_psp =3D v7m_using_psp(env);
> -        uint32_t tmp;
> -
> -        if (old_is_psp !=3D new_is_psp) {
> -            tmp =3D env->v7m.other_sp;
> -            env->v7m.other_sp =3D env->regs[13];
> -            env->regs[13] =3D tmp;
> -        }
> -    }
> -}
> -
> -/*
> - * Write to v7M CONTROL.SPSEL bit. This may change the current
> - * stack pointer between Main and Process stack pointers.
> - */
> -void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
> -{
> -    write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
> -}
> -
> -/* Switch M profile security state between NS and S */
> -void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
> -{
> -    uint32_t new_ss_msp, new_ss_psp;
> -
> -    if (env->v7m.secure =3D=3D new_secstate) {
> -        return;
> -    }
> -
> -    /*
> -     * All the banked state is accessed by looking at env->v7m.secure
> -     * except for the stack pointer; rearrange the SP appropriately.
> -     */
> -    new_ss_msp =3D env->v7m.other_ss_msp;
> -    new_ss_psp =3D env->v7m.other_ss_psp;
> -
> -    if (v7m_using_psp(env)) {
> -        env->v7m.other_ss_psp =3D env->regs[13];
> -        env->v7m.other_ss_msp =3D env->v7m.other_sp;
> -    } else {
> -        env->v7m.other_ss_msp =3D env->regs[13];
> -        env->v7m.other_ss_psp =3D env->v7m.other_sp;
> -    }
> -
> -    env->v7m.secure =3D new_secstate;
> -
> -    if (v7m_using_psp(env)) {
> -        env->regs[13] =3D new_ss_psp;
> -        env->v7m.other_sp =3D new_ss_msp;
> -    } else {
> -        env->regs[13] =3D new_ss_msp;
> -        env->v7m.other_sp =3D new_ss_psp;
> -    }
> -}
> -
>  static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool thre=
admode,
>                                  bool spsel)
>  {
> diff --git a/target/arm/v7m_helper.c b/target/arm/v7m_helper.c
> index 321154966e..558e143039 100644
> --- a/target/arm/v7m_helper.c
> +++ b/target/arm/v7m_helper.c
> @@ -88,6 +88,79 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t add=
r, uint32_t op)
>
>  #else
>
> +/*
> + * Write to v7M CONTROL.SPSEL bit for the specified security bank.
> + * This may change the current stack pointer between Main and Process
> + * stack pointers if it is done for the CONTROL register for the current
> + * security state.
> + */
> +void write_v7m_control_spsel_for_secstate(CPUARMState *env,
> +                                          bool new_spsel,
> +                                          bool secstate)
> +{
> +    bool old_is_psp =3D v7m_using_psp(env);
> +
> +    env->v7m.control[secstate] =3D
> +        deposit32(env->v7m.control[secstate],
> +                  R_V7M_CONTROL_SPSEL_SHIFT,
> +                  R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
> +
> +    if (secstate =3D=3D env->v7m.secure) {
> +        bool new_is_psp =3D v7m_using_psp(env);
> +        uint32_t tmp;
> +
> +        if (old_is_psp !=3D new_is_psp) {
> +            tmp =3D env->v7m.other_sp;
> +            env->v7m.other_sp =3D env->regs[13];
> +            env->regs[13] =3D tmp;
> +        }
> +    }
> +}
> +
> +/*
> + * Write to v7M CONTROL.SPSEL bit. This may change the current
> + * stack pointer between Main and Process stack pointers.
> + */
> +void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
> +{
> +    write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
> +}
> +
> +/* Switch M profile security state between NS and S */
> +void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
> +{
> +    uint32_t new_ss_msp, new_ss_psp;
> +
> +    if (env->v7m.secure =3D=3D new_secstate) {
> +        return;
> +    }
> +
> +    /*
> +     * All the banked state is accessed by looking at env->v7m.secure
> +     * except for the stack pointer; rearrange the SP appropriately.
> +     */
> +    new_ss_msp =3D env->v7m.other_ss_msp;
> +    new_ss_psp =3D env->v7m.other_ss_psp;
> +
> +    if (v7m_using_psp(env)) {
> +        env->v7m.other_ss_psp =3D env->regs[13];
> +        env->v7m.other_ss_msp =3D env->v7m.other_sp;
> +    } else {
> +        env->v7m.other_ss_msp =3D env->regs[13];
> +        env->v7m.other_ss_psp =3D env->v7m.other_sp;
> +    }
> +
> +    env->v7m.secure =3D new_secstate;
> +
> +    if (v7m_using_psp(env)) {
> +        env->regs[13] =3D new_ss_psp;
> +        env->v7m.other_sp =3D new_ss_msp;
> +    } else {
> +        env->regs[13] =3D new_ss_msp;
> +        env->v7m.other_sp =3D new_ss_psp;
> +    }
> +}
> +
>  void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>  {
>      /*


--
Alex Benn=C3=A9e
