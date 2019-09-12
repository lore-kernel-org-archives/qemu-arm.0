Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u10sm5664673wmm.43.2019.09.12.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 03:39:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AE6E41FF87;
	Thu, 12 Sep 2019 11:39:34 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 01/13] target/arm/arm-semi: Capture errno in
 softmmu version of set_swi_errno()
In-reply-to: <20190910144428.32597-2-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 11:39:34 +0100
Message-ID: <87sgp1ztll.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vwAOw1X9f01g


Peter Maydell <peter.maydell@linaro.org> writes:

> The set_swi_errno() function is called to capture the errno
> from a host system call, so that we can return -1 from the
> semihosting function and later allow the guest to get a more
> specific error code with the SYS_ERRNO function. It comes in
> two versions, one for user-only and one for softmmu. We forgot
> to capture the errno in the softmmu version; fix the error.
>
> (Semihosting calls directed to gdb are unaffected because
> they go through a different code path that captures the
> error return from the gdbstub call in arm_semi_cb() or
> arm_semi_flen_cb().)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB that a later commit will put in some cleanup of TaskState
> that will let us reduce the duplication between the two
> implementations of this function.
> ---
>  target/arm/arm-semi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 90423a35deb..03e60105c05 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -114,8 +114,13 @@ static inline uint32_t set_swi_errno(TaskState *ts, =
uint32_t code)
>      return code;
>  }
>  #else
> +static target_ulong syscall_err;
> +

I appreciate that this is just moving things around but this will be
broken for -smp > 1 if two vCPUs make a syscall at the same time. For
linux-user this information is kept in ts->swi_errno which is
per-thread. Either we need a __thread version or find somewhere in
CPUARMState to store it.

>  static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
>  {
> +    if (code =3D=3D (uint32_t)-1) {
> +        syscall_err =3D errno;
> +    }
>      return code;
>  }
>
> @@ -124,10 +129,6 @@ static inline uint32_t set_swi_errno(CPUARMState *en=
v, uint32_t code)
>
>  static target_ulong arm_semi_syscall_len;
>
> -#if !defined(CONFIG_USER_ONLY)
> -static target_ulong syscall_err;
> -#endif
> -
>  static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);


--
Alex Benn=C3=A9e
