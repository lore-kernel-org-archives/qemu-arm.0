Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t203sm9516261wmf.42.2019.09.12.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:43:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A19EB1FF87;
	Thu, 12 Sep 2019 12:43:44 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-11-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 10/13] target/arm/arm-semi: Factor out
 implementation of SYS_FLEN
In-reply-to: <20190910144428.32597-11-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:43:44 +0100
Message-ID: <87d0g5zqmn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: app4pAwV7kCa


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out the implementation of SYS_FLEN via the new
> function tables.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index c548ce849e7..f9019b00b8d 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -352,6 +352,7 @@ typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cp=
u, GuestFD *gf,
>  typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
>  typedef uint32_t sys_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
>                              target_ulong offset);
> +typedef uint32_t sys_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
>
>  static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
> @@ -417,6 +418,16 @@ static uint32_t host_seekfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>      return 0;
>  }
>
> +static uint32_t host_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    struct stat buf;
> +    uint32_t ret =3D set_swi_errno(ts, fstat(gf->hostfd, &buf));
> +    if (ret =3D=3D (uint32_t)-1) {
> +        return -1;
> +    }
> +    return buf.st_size;
> +}
> +
>  static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -450,12 +461,19 @@ static uint32_t gdb_seekfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>                             gf->hostfd, offset);
>  }
>
> +static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
> +                           gf->hostfd, arm_flen_buf(cpu));
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
>      sys_writefn *writefn;
>      sys_readfn *readfn;
>      sys_isattyfn *isattyfn;
>      sys_seekfn *seekfn;
> +    sys_flenfn *flenfn;
>  } GuestFDFunctions;
>
>  static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -465,6 +483,7 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>          .readfn =3D host_readfn,
>          .isattyfn =3D host_isattyfn,
>          .seekfn =3D host_seekfn,
> +        .flenfn =3D host_flenfn,
>      },
>      [GuestFDGDB] =3D {
>          .closefn =3D gdb_closefn,
> @@ -472,6 +491,7 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>          .readfn =3D gdb_readfn,
>          .isattyfn =3D gdb_isattyfn,
>          .seekfn =3D gdb_seekfn,
> +        .flenfn =3D gdb_flenfn,
>      },
>  };
>
> @@ -657,16 +677,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
> -                                   gf->hostfd, arm_flen_buf(cpu));
> -        } else {
> -            struct stat buf;
> -            ret =3D set_swi_errno(ts, fstat(gf->hostfd, &buf));
> -            if (ret =3D=3D (uint32_t)-1)
> -                return -1;
> -            return buf.st_size;
> -        }
> +        return guestfd_fns[gf->type].flenfn(ts, cpu, gf);
>      case TARGET_SYS_TMPNAM:
>          qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __fun=
c__);
>          return -1;


--
Alex Benn=C3=A9e
