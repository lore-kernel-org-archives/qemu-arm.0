Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q192sm8122126wme.23.2019.09.12.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:13:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 431171FF87;
	Thu, 12 Sep 2019 12:13:04 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-6-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 05/13] target/arm/arm-semi: Factor out
 implementation of SYS_CLOSE
In-reply-to: <20190910144428.32597-6-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:13:04 +0100
Message-ID: <87muf9zs1r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5qYXsk141Tug


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently for the semihosting calls which take a file descriptor
> (SYS_CLOSE, SYS_WRITE, SYS_READ, SYS_ISTTY, SYS_SEEK, SYS_FLEN)
> we have effectively two implementations, one for real host files
> and one for when we indirect via the gdbstub. We want to add a
> third one to deal with the magic :semihosting-features file.
>
> Instead of having a three-way if statement in each of these
> cases, factor out the implementation of the calls to separate
> functions which we dispatch to via function pointers selected
> via the GuestFDType for the guest fd.
>
> In this commit, we set up the framework for the dispatch,
> and convert the SYS_CLOSE call to use it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 42 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index ce3ba554bef..f3e0bf77cd3 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -116,6 +116,7 @@ static int open_modeflags[12] =3D {
>  typedef enum GuestFDType {
>      GuestFDUnused =3D 0,
>      GuestFDHost =3D 1,
> +    GuestFDGDB =3D 2,
>  } GuestFDType;
>
>  /*
> @@ -179,14 +180,14 @@ static GuestFD *do_get_guestfd(int guestfd)
>  /*
>   * Associate the specified guest fd (which must have been
>   * allocated via alloc_fd() and not previously used) with
> - * the specified host fd.
> + * the specified host/gdb fd.
>   */
>  static void associate_guestfd(int guestfd, int hostfd)
>  {
>      GuestFD *gf =3D do_get_guestfd(guestfd);
>
>      assert(gf);
> -    gf->type =3D GuestFDHost;
> +    gf->type =3D use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
>      gf->hostfd =3D hostfd;
>  }
>
> @@ -337,6 +338,37 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb=
_syscall_complete_cb cb,
>      return is_a64(env) ? env->xregs[0] : env->regs[0];
>  }
>
> +/*
> + * Types for functions implementing various semihosting calls
> + * for specific types of guest file descriptor. These must all
> + * do the work and return the required return value for the guest,
> + * setting the guest errno if appropriate.
> + */
> +typedef uint32_t sys_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
> +
> +static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return set_swi_errno(ts, close(gf->hostfd));
> +}
> +
> +static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> +}
> +
> +typedef struct GuestFDFunctions {
> +    sys_closefn *closefn;
> +} GuestFDFunctions;
> +
> +static const GuestFDFunctions guestfd_fns[] =3D {
> +    [GuestFDHost] =3D {
> +        .closefn =3D host_closefn,
> +    },
> +    [GuestFDGDB] =3D {
> +        .closefn =3D gdb_closefn,
> +    },
> +};
> +
>  /* Read the input value from the argument block; fail the semihosting
>   * call if the memory read fails.
>   */
> @@ -452,11 +484,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            ret =3D arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->ho=
stfd);
> -        } else {
> -            ret =3D set_swi_errno(ts, close(gf->hostfd));
> -        }
> +        ret =3D guestfd_fns[gf->type].closefn(ts, cpu, gf);
>          dealloc_guestfd(arg0);
>          return ret;
>      case TARGET_SYS_WRITEC:


--
Alex Benn=C3=A9e
