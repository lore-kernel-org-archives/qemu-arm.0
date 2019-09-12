Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y72sm9235897wmc.26.2019.09.12.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:20:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9A0AC1FF87;
	Thu, 12 Sep 2019 12:20:11 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-9-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 08/13] target/arm/arm-semi: Factor out
 implementation of SYS_ISTTY
In-reply-to: <20190910144428.32597-9-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:20:11 +0100
Message-ID: <87impxzrpw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZyaIud1Ded/c


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out the implementation of SYS_ISTTY via the new function
> tables.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 48a10dd3c3a..64ed39fc075 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -349,6 +349,7 @@ typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>                               target_ulong buf, uint32_t len);
>  typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
>                              target_ulong buf, uint32_t len);
> +typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
>
>  static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
> @@ -399,6 +400,11 @@ static uint32_t host_readfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>      return len - ret;
>  }
>
> +static uint32_t host_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return isatty(gf->hostfd);
> +}
> +
>  static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -420,10 +426,16 @@ static uint32_t gdb_readfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>                             gf->hostfd, buf, len);
>  }
>
> +static uint32_t gdb_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
>      sys_writefn *writefn;
>      sys_readfn *readfn;
> +    sys_isattyfn *isattyfn;
>  } GuestFDFunctions;
>
>  static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -431,11 +443,13 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>          .closefn =3D host_closefn,
>          .writefn =3D host_writefn,
>          .readfn =3D host_readfn,
> +        .isattyfn =3D host_isattyfn,
>      },
>      [GuestFDGDB] =3D {
>          .closefn =3D gdb_closefn,
>          .writefn =3D gdb_writefn,
>          .readfn =3D gdb_readfn,
> +        .isattyfn =3D gdb_isattyfn,
>      },
>  };
>
> @@ -600,11 +614,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->ho=
stfd);
> -        } else {
> -            return isatty(gf->hostfd);
> -        }
> +        return guestfd_fns[gf->type].isattyfn(ts, cpu, gf);
>      case TARGET_SYS_SEEK:
>          GET_ARG(0);
>          GET_ARG(1);


--
Alex Benn=C3=A9e
