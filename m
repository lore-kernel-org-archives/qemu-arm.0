Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a6sm15423797wrr.85.2019.09.12.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:18:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8848C1FF87;
	Thu, 12 Sep 2019 12:18:11 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-7-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 06/13] target/arm/arm-semi: Factor out
 implementation of SYS_WRITE
In-reply-to: <20190910144428.32597-7-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:18:11 +0100
Message-ID: <87lfutzrt8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nFMIvivYCDpg


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out the implementation of SYS_WRITE via the
> new function tables.
>
> The #ifdef around the declaration/initialization of the
> local 'env' variable is unfortunate but necessary, because
> the softmmu-semi.h version of lock_user implicitly uses 'env',
> but the user-only version doesn't need it.

heh - one reason I rewrote a local lock_user_string for semihost.c
although of course it only has to worry about the softmmu case as you
don't have re-direct-able char devices in linux-user.

> Without the ifdefs
> we'd get a warning about the unused variable for the user-only
> compilation.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 53 ++++++++++++++++++++++++++++---------------
>  1 file changed, 35 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index f3e0bf77cd3..0dec4c04e2f 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -345,27 +345,61 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gd=
b_syscall_complete_cb cb,
>   * setting the guest errno if appropriate.
>   */
>  typedef uint32_t sys_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                             target_ulong buf, uint32_t len);
>
>  static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return set_swi_errno(ts, close(gf->hostfd));
>  }
>
> +static uint32_t host_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                             target_ulong buf, uint32_t len)
> +{
> +    uint32_t ret;
> +#ifndef CONFIG_USER_ONLY
> +    CPUARMState *env =3D &cpu->env;
> +#endif
> +    char *s =3D lock_user(VERIFY_READ, buf, len, 1);
> +    if (!s) {
> +        /* Return bytes not written on error */
> +        return len;
> +    }
> +    ret =3D set_swi_errno(ts, write(gf->hostfd, s, len));
> +    unlock_user(s, buf, 0);
> +    if (ret =3D=3D (uint32_t)-1) {
> +        ret =3D 0;
> +    }
> +    /* Return bytes not written */
> +    return len - ret;
> +}
> +
>  static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
>  }
>
> +static uint32_t gdb_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len)
> +{
> +    arm_semi_syscall_len =3D len;
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
> +                           gf->hostfd, buf, len);
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
> +    sys_writefn *writefn;
>  } GuestFDFunctions;
>
>  static const GuestFDFunctions guestfd_fns[] =3D {
>      [GuestFDHost] =3D {
>          .closefn =3D host_closefn,
> +        .writefn =3D host_writefn,
>      },
>      [GuestFDGDB] =3D {
>          .closefn =3D gdb_closefn,
> +        .writefn =3D gdb_writefn,
>      },
>  };
>
> @@ -504,24 +538,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            arm_semi_syscall_len =3D len;
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
> -                                   gf->hostfd, arg1, len);
> -        } else {
> -            s =3D lock_user(VERIFY_READ, arg1, len, 1);
> -            if (!s) {
> -                /* Return bytes not written on error */
> -                return len;
> -            }
> -            ret =3D set_swi_errno(ts, write(gf->hostfd, s, len));
> -            unlock_user(s, arg1, 0);
> -            if (ret =3D=3D (uint32_t)-1) {
> -                ret =3D 0;
> -            }
> -            /* Return bytes not written */
> -            return len - ret;
> -        }
> +        return guestfd_fns[gf->type].writefn(ts, cpu, gf, arg1, len);
>      case TARGET_SYS_READ:
>          GET_ARG(0);
>          GET_ARG(1);


--
Alex Benn=C3=A9e
