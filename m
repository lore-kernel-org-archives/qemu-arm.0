Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 5sm18806219wrk.86.2019.10.14.11.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:51:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A50EA1FF87;
	Mon, 14 Oct 2019 19:51:25 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-15-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 14/20] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
In-reply-to: <20191011155546.14342-15-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 19:51:25 +0100
Message-ID: <87blujma8i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kpv6jjpWj8Ii


Richard Henderson <richard.henderson@linaro.org> writes:

> By performing this store early, we avoid having to save and restore
> the register holding the address around any function calls.

Been peeking at the assembly again ;-)

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f7d3f257d..37424e3d4d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11225,6 +11225,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>  {
>      uint32_t flags, pstate_for_ss;
>
> +    *cs_base =3D 0;
>      flags =3D rebuild_hflags_internal(env);
>
>      if (is_a64(env)) {
> @@ -11298,7 +11299,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>      }
>
>      *pflags =3D flags;
> -    *cs_base =3D 0;
>  }
>
>  #ifdef TARGET_AARCH64


--
Alex Benn=C3=A9e
