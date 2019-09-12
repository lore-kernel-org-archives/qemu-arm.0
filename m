Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p19sm5347203wmg.31.2019.09.12.03.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 03:42:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0B8891FF87;
	Thu, 12 Sep 2019 11:42:29 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-3-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 02/13] target/arm/arm-semi: Always set some
 kind of errno for failed calls
In-reply-to: <20190910144428.32597-3-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 11:42:29 +0100
Message-ID: <87r24lztgq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PzSym7BhMMK7


Peter Maydell <peter.maydell@linaro.org> writes:

> If we fail a semihosting call we should always set the
> semihosting errno to something; we were failing to do
> this for some of the "check inputs for sanity" cases.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

although:

> ---
>  target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 03e60105c05..51b55816faf 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gd=
b_syscall_complete_cb cb,
>  #define GET_ARG(n) do {                                 \
>      if (is_a64(env)) {                                  \
>          if (get_user_u64(arg ## n, args + (n) * 8)) {   \
> -            return -1;                                  \
> +            errno =3D EFAULT;                             \
> +            return set_swi_errno(ts, -1);               \

This looks a little queasy given ts is NULL for the softmmu version. I
wonder (depending on your approach to -smp for 1/13) if we should just
pass the ARMCPU down to the helper?

--
Alex Benn=C3=A9e
