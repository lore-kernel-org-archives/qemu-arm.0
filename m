Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y14sm39876906wrd.84.2019.09.12.04.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:19:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 535FF1FF87;
	Thu, 12 Sep 2019 12:19:39 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-8-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 07/13] target/arm/arm-semi: Factor out
 implementation of SYS_READ
In-reply-to: <20190910144428.32597-8-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:19:39 +0100
Message-ID: <87k1adzrqs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5X4aGgzM5CEs


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out the implementation of SYS_READ via the
> new function tables.

"As for SYS_WRITE we need env for lock_user in system emulation."?

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 57 ++++++++++++++++++++++++++++---------------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 0dec4c04e2f..48a10dd3c3a 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -347,6 +347,8 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_=
syscall_complete_cb cb,
>  typedef uint32_t sys_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
>  typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
>                               target_ulong buf, uint32_t len);
> +typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len);
>
>  static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
> @@ -374,6 +376,29 @@ static uint32_t host_writefn(TaskState *ts, ARMCPU *=
cpu, GuestFD *gf,
>      return len - ret;
>  }
>
> +static uint32_t host_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len)
> +{
> +    uint32_t ret;
> +#ifndef CONFIG_USER_ONLY
> +    CPUARMState *env =3D &cpu->env;
> +#endif
> +    char *s =3D lock_user(VERIFY_WRITE, buf, len, 0);
> +    if (!s) {
> +        /* return bytes not read */
> +        return len;
> +    }
> +    do {
> +        ret =3D set_swi_errno(ts, read(gf->hostfd, s, len));
> +    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> +    unlock_user(s, buf, len);
> +    if (ret =3D=3D (uint32_t)-1) {
> +        ret =3D 0;
> +    }
> +    /* Return bytes not read */
> +    return len - ret;
> +}
> +
>  static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -387,19 +412,30 @@ static uint32_t gdb_writefn(TaskState *ts, ARMCPU *=
cpu, GuestFD *gf,
>                             gf->hostfd, buf, len);
>  }
>
> +static uint32_t gdb_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                           target_ulong buf, uint32_t len)
> +{
> +    arm_semi_syscall_len =3D len;
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
> +                           gf->hostfd, buf, len);
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
>      sys_writefn *writefn;
> +    sys_readfn *readfn;
>  } GuestFDFunctions;
>
>  static const GuestFDFunctions guestfd_fns[] =3D {
>      [GuestFDHost] =3D {
>          .closefn =3D host_closefn,
>          .writefn =3D host_writefn,
> +        .readfn =3D host_readfn,
>      },
>      [GuestFDGDB] =3D {
>          .closefn =3D gdb_closefn,
>          .writefn =3D gdb_writefn,
> +        .readfn =3D gdb_readfn,
>      },
>  };
>
> @@ -551,26 +587,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            arm_semi_syscall_len =3D len;
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
> -                                   gf->hostfd, arg1, len);
> -        } else {
> -            s =3D lock_user(VERIFY_WRITE, arg1, len, 0);
> -            if (!s) {
> -                /* return bytes not read */
> -                return len;
> -            }
> -            do {
> -                ret =3D set_swi_errno(ts, read(gf->hostfd, s, len));
> -            } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> -            unlock_user(s, arg1, len);
> -            if (ret =3D=3D (uint32_t)-1) {
> -                ret =3D 0;
> -            }
> -            /* Return bytes not read */
> -            return len - ret;
> -        }
> +        return guestfd_fns[gf->type].readfn(ts, cpu, gf, arg1, len);
>      case TARGET_SYS_READC:
>          qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func=
__);
>          return 0;


--
Alex Benn=C3=A9e
