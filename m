Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b203sm17210506wmd.41.2019.06.17.07.11.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:11:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 43FA81FF87;
	Mon, 17 Jun 2019 15:11:20 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-14-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 13/23] target/arm: Make the v7-M Security State routines
In-reply-to: <20190615154352.26824-14-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:11:20 +0100
Message-ID: <87o92w9u9j.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: j8Orp8yauTrH


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The Security State helpers are now only called within v7m_helper.c.
> Remove them from "internals.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This does seem a little round the houses, but whatever:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  target/arm/internals.h  |  8 --------
>  target/arm/v7m_helper.c | 10 +++++-----
>  2 files changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1d15af3f8b..fe9e4665e2 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1043,12 +1043,4 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
>                         int *prot, bool *is_subpage,
>                         ARMMMUFaultInfo *fi, uint32_t *mregion);
>
> -void write_v7m_control_spsel_for_secstate(CPUARMState *env,
> -                                          bool new_spsel,
> -                                          bool secstate);
> -
> -void write_v7m_control_spsel(CPUARMState *env, bool new_spsel);
> -
> -void switch_v7m_security_state(CPUARMState *env, bool new_secstate);
> -
>  #endif
> diff --git a/target/arm/v7m_helper.c b/target/arm/v7m_helper.c
> index b50bb98e06..aa6a08e326 100644
> --- a/target/arm/v7m_helper.c
> +++ b/target/arm/v7m_helper.c
> @@ -94,9 +94,9 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr=
, uint32_t op)
>   * stack pointers if it is done for the CONTROL register for the current
>   * security state.
>   */
> -void write_v7m_control_spsel_for_secstate(CPUARMState *env,
> -                                          bool new_spsel,
> -                                          bool secstate)
> +static void write_v7m_control_spsel_for_secstate(CPUARMState *env,
> +                                                 bool new_spsel,
> +                                                 bool secstate)
>  {
>      bool old_is_psp =3D v7m_using_psp(env);
>
> @@ -121,13 +121,13 @@ void write_v7m_control_spsel_for_secstate(CPUARMSta=
te *env,
>   * Write to v7M CONTROL.SPSEL bit. This may change the current
>   * stack pointer between Main and Process stack pointers.
>   */
> -void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
> +static void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
>  {
>      write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
>  }
>
>  /* Switch M profile security state between NS and S */
> -void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
> +static void switch_v7m_security_state(CPUARMState *env, bool new_secstat=
e)
>  {
>      uint32_t new_ss_msp, new_ss_psp;


--
Alex Benn=C3=A9e
