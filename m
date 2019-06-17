Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o13sm23733433wra.92.2019.06.17.07.07.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:07:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BCDC51FF87;
	Mon, 17 Jun 2019 15:07:58 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-10-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 09/23] target/arm: Move code around
In-reply-to: <20190615154352.26824-10-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:07:58 +0100
Message-ID: <87tvco9uf5.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ENsoTN05M0DS


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> To ease the review of the next commit, move the
> write_v7m_exception() function around.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a829086c6d..b4fd9b42d7 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7923,26 +7923,6 @@ void write_v7m_control_spsel(CPUARMState *env, boo=
l new_spsel)
>      write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
>  }
>
> -void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
> -{
> -    /*
> -     * Write a new value to v7m.exception, thus transitioning into or out
> -     * of Handler mode; this may result in a change of active stack poin=
ter.
> -     */
> -    bool new_is_psp, old_is_psp =3D v7m_using_psp(env);
> -    uint32_t tmp;
> -
> -    env->v7m.exception =3D new_exc;
> -
> -    new_is_psp =3D v7m_using_psp(env);
> -
> -    if (old_is_psp !=3D new_is_psp) {
> -        tmp =3D env->v7m.other_sp;
> -        env->v7m.other_sp =3D env->regs[13];
> -        env->regs[13] =3D tmp;
> -    }
> -}
> -
>  /* Switch M profile security state between NS and S */
>  void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
>  {
> @@ -9247,6 +9227,26 @@ static bool do_v7m_function_return(ARMCPU *cpu)
>      return true;
>  }
>
> +void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
> +{
> +    /*
> +     * Write a new value to v7m.exception, thus transitioning into or out
> +     * of Handler mode; this may result in a change of active stack poin=
ter.
> +     */
> +    bool new_is_psp, old_is_psp =3D v7m_using_psp(env);
> +    uint32_t tmp;
> +
> +    env->v7m.exception =3D new_exc;
> +
> +    new_is_psp =3D v7m_using_psp(env);
> +
> +    if (old_is_psp !=3D new_is_psp) {
> +        tmp =3D env->v7m.other_sp;
> +        env->v7m.other_sp =3D env->regs[13];
> +        env->regs[13] =3D tmp;
> +    }
> +}
> +
>  void arm_log_exception(int idx)
>  {
>      if (qemu_loglevel_mask(CPU_LOG_INT)) {


--
Alex Benn=C3=A9e
