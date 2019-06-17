Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r2sm11671761wme.30.2019.06.17.07.09.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:09:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AEA121FF87;
	Mon, 17 Jun 2019 15:09:11 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-12-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 11/23] target/arm: Declare v7m_cpacr_pass() publicly
In-reply-to: <20190615154352.26824-12-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:09:11 +0100
Message-ID: <87r27s9ud4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5sM02p5epFlg


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> In the next commit we will move exception handling routines to
> v7m_helper, so this function will be called from 2 different
> files. Declare it inlined in the "internals.h" header.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c    | 19 -------------------
>  target/arm/internals.h | 21 +++++++++++++++++++++
>  2 files changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cf76010ea1..5d05db84d3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7611,25 +7611,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uin=
t32_t excp_idx,
>      return target_el;
>  }
>
> -/*
> - * Return true if the v7M CPACR permits access to the FPU for the specif=
ied
> - * security state and privilege level.
> - */
> -static bool v7m_cpacr_pass(CPUARMState *env, bool is_secure, bool is_pri=
v)
> -{
> -    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
> -    case 0:
> -    case 2: /* UNPREDICTABLE: we treat like 0 */
> -        return false;
> -    case 1:
> -        return is_priv;
> -    case 3:
> -        return true;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
>  /*
>   * What kind of stack write are we doing? This affects how exceptions
>   * generated during the stacking are treated.
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 04711b317a..1d15af3f8b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -891,6 +891,27 @@ static inline uint32_t v7m_sp_limit(CPUARMState *env)
>      }
>  }
>
> +/**
> + * v7m_cpacr_pass:
> + * Return true if the v7M CPACR permits access to the FPU for the specif=
ied
> + * security state and privilege level.
> + */
> +static inline bool v7m_cpacr_pass(CPUARMState *env,
> +                                  bool is_secure, bool is_priv)
> +{
> +    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
> +    case 0:
> +    case 2: /* UNPREDICTABLE: we treat like 0 */
> +        return false;
> +    case 1:
> +        return is_priv;
> +    case 3:
> +        return true;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  /**
>   * aarch32_mode_name(): Return name of the AArch32 CPU mode
>   * @psr: Program Status Register indicating CPU mode


--
Alex Benn=C3=A9e
