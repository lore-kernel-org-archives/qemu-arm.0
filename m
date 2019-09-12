Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c3sm35071056wrh.55.2019.09.12.04.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:43:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BF0C91FF87;
	Thu, 12 Sep 2019 12:43:09 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-10-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 09/13] target/arm/arm-semi: Factor out
 implementation of SYS_SEEK
In-reply-to: <20190910144428.32597-10-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:43:09 +0100
Message-ID: <87ef0lzqnm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /PPZNrcUtzYc


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out the implementation of SYS_SEEK via the new function
> tables.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 64ed39fc075..c548ce849e7 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -350,6 +350,8 @@ typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>  typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
>                              target_ulong buf, uint32_t len);
>  typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong offset);
>
>  static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
> @@ -405,6 +407,16 @@ static uint32_t host_isattyfn(TaskState *ts, ARMCPU =
*cpu, GuestFD *gf)
>      return isatty(gf->hostfd);
>  }
>
> +static uint32_t host_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong offset)
> +{
> +    uint32_t ret =3D set_swi_errno(ts, lseek(gf->hostfd, offset, SEEK_SE=
T));
> +    if (ret =3D=3D (uint32_t)-1) {
> +        return -1;
> +    }
> +    return 0;
> +}
> +
>  static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -431,11 +443,19 @@ static uint32_t gdb_isattyfn(TaskState *ts, ARMCPU =
*cpu, GuestFD *gf)
>      return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
>  }
>
> +static uint32_t gdb_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
> +                           target_ulong offset)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
> +                           gf->hostfd, offset);
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
>      sys_writefn *writefn;
>      sys_readfn *readfn;
>      sys_isattyfn *isattyfn;
> +    sys_seekfn *seekfn;
>  } GuestFDFunctions;
>
>  static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -444,12 +464,14 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>          .writefn =3D host_writefn,
>          .readfn =3D host_readfn,
>          .isattyfn =3D host_isattyfn,
> +        .seekfn =3D host_seekfn,
>      },
>      [GuestFDGDB] =3D {
>          .closefn =3D gdb_closefn,
>          .writefn =3D gdb_writefn,
>          .readfn =3D gdb_readfn,
>          .isattyfn =3D gdb_isattyfn,
> +        .seekfn =3D gdb_seekfn,
>      },
>  };
>
> @@ -625,15 +647,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
> -                                   gf->hostfd, arg1);
> -        } else {
> -            ret =3D set_swi_errno(ts, lseek(gf->hostfd, arg1, SEEK_SET));
> -            if (ret =3D=3D (uint32_t)-1)
> -              return -1;
> -            return 0;
> -        }
> +        return guestfd_fns[gf->type].seekfn(ts, cpu, gf, arg1);
>      case TARGET_SYS_FLEN:
>          GET_ARG(0);


--
Alex Benn=C3=A9e
