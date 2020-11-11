Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp818502lfb;
        Wed, 11 Nov 2020 14:21:03 -0800 (PST)
X-Received: by 2002:a92:2a01:: with SMTP id r1mr395440ile.22.1605133262913;
        Wed, 11 Nov 2020 14:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605133262; cv=none;
        d=google.com; s=arc-20160816;
        b=urjjka++M4/R+a7jhhLR+JZ9/KrRgsUuFjQI5D50SX1J2FXt5ix+djSeDsW80j12Mh
         fFKoT+/Icxaq0sveOufDaolT9Tl+tYN0itkABdOuVubxQjiLkltq0x+jRKYmaejjLqv0
         X5TKHp60D1TYebMDac8nv8LPZi0OVjCnauBhQyQ3Gwcc7qUCNBixo3vJ5K8KpJgOXm07
         c5UetxhBIK/99uD4EEXAifEDpt/s1sjIoRuzAK43JcbGZzfLTo7i25BfzN99bBGOUVfB
         q/wiijoOH1d6m35Zn/cl+pdY4HiLJ4c8/P2s/qdsVfs8P9K/UpPaxwx2PMIcg7SXelBv
         MhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z+ossysa86t8Oy0X4ZXJPdQQ6GnoQz/DabcMQ6JDW38=;
        b=V45xyu3qegHNZMCv+fH/Uq+EYv4msMJ0mP2hpmoFRebfwvsMFGld0KciB2vw1oKZRr
         eU7nw4xODr+uxOEUQ3gkB8Q4fs7QhxnH6nM+C6+RFFVitUwwRUrGQybmoD2cZYZLe0bj
         JzG1KPY7SokdXxZ5xfKcvxC9iIRVwoJYpN63lMnfn8zkgW4fpJckI0nQihlpqe4KvnKc
         taFRJNTMotuBu+DbQg1lQqX3WpZOLXlJY5NBtt81RmRSv1XAU22NTl+BFoLVuXBHh9tm
         s9z+5tJMQ97NOyvmPumkQYknnwvesT4sI/yHoC+6slyqNNiFPSJSPZneYeBE6WVstY2D
         HPeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QoYEiDa3;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x8sor2817557iop.44.2020.11.11.14.21.02
        (Google Transport Security);
        Wed, 11 Nov 2020 14:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QoYEiDa3;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z+ossysa86t8Oy0X4ZXJPdQQ6GnoQz/DabcMQ6JDW38=;
        b=QoYEiDa3VurhlbIUyY0qKIUVdeYeLvffkwI1EFK9KxCO8yuyGwD/yJI60hPh/zXjE8
         9hRUN69OCvHePkXBJMVAntuvcAKIU0JVBIlhDt8IRNrT0F/nf3gDyUcQECdl5biBtZ/D
         r2UVGzr1sKbY1C/I2bnn74UJaXjlG7UbcJ2xUl3kjdJvY/EAiiPnbxQAPfSHwTf7lr7S
         OVE0djOcpz6DIDgPrY03lRkxwYHjS58AfAXc2jH83O0i3uLQn9gb5WZnAg8oro6kWq6C
         GC7XPQZKsbTIF78xCs31qxEoA7SRoTN/Ez5SiHPa99o+lqUGtVkZ2yWjojovUzwQOkv/
         i9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z+ossysa86t8Oy0X4ZXJPdQQ6GnoQz/DabcMQ6JDW38=;
        b=pIADiHAwaI0JOq5nftUJb2sQJ1f3b4GhwKdAf3uNn1+OSYJ/oyhQycPg/4icQObZac
         1pBRjjhn+eIWOHro64RPTY4jYw4V7chKGhKFbRxMi8XSnjHaWg11GC+82Lcnjop7Lxb+
         rFZlUiZLZS3AShtwhYx4SYJ1XyR4qYGJG+uB+kcB07qDkQNeSnxbYS/MzfrhObaw8jK7
         TjQ3da2xkVRONtfUl+qzvGxpoFwFOy83z7ckA8tlMKZjv2wObLQ4hQJHodlSshOW8pFc
         w0OZKmYe/k5o5lkWMyeZ3xrEBGFS6OoQYhBxcgMWPJgwhj2WcelgSy9YyM6urkWaZ0QO
         J56w==
X-Gm-Message-State: AOAM5307QC2+drHiUoMvvp3RZS1+K0z0ueIVyKx7yOC5ZkG7z0koFveF
	s0QZqRX91gFhRElEkgW9MMx2gU2TxYOSIpPnjeE=
X-Google-Smtp-Source: ABdhPJztP/CwAFgk9xphfNJkyeSzS8ao3JkliCy9Nnlmg5q6ev++NaOAZP9AwFhwt3rcCFcnq0hkwb4Wy81A+eSEDAw=
X-Received: by 2002:a5d:9a8d:: with SMTP id c13mr19430944iom.176.1605133262420;
 Wed, 11 Nov 2020 14:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20201028185722.2783532-1-keithp@keithp.com> <20201028185722.2783532-3-keithp@keithp.com>
In-Reply-To: <20201028185722.2783532-3-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 14:08:58 -0800
Message-ID: <CAKmqyKP-F_nGgSvFWCW41cKqRF5RmB=RhEuQAUOjEUecUfeKgA@mail.gmail.com>
Subject: Re: [PATCH 2/4] semihosting: Change common-semi API to be architecture-independent
To: Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: UMQUgHf1VAFn

On Wed, Oct 28, 2020 at 12:01 PM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> The public API is now defined in
> hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
> instead of CPUARMState *. All internal functions have been renamed
> common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
> there are no functional changes in this patch.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/semihosting/common-semi.c  | 16 ++++++++++------
>  hw/semihosting/common-semi.h  | 36 +++++++++++++++++++++++++++++++++++
>  linux-user/aarch64/cpu_loop.c |  3 ++-
>  linux-user/arm/cpu_loop.c     |  3 ++-
>  target/arm/cpu.h              |  8 --------
>  target/arm/helper.c           |  5 +++--
>  target/arm/m_helper.c         |  7 ++++++-
>  7 files changed, 59 insertions(+), 19 deletions(-)
>  create mode 100644 hw/semihosting/common-semi.h
>
> diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
> index 8718fd0194..e0c59bc599 100644
> --- a/hw/semihosting/common-semi.c
> +++ b/hw/semihosting/common-semi.c
> @@ -1,10 +1,14 @@
>  /*
> - *  Arm "Angel" semihosting syscalls
> + *  Semihosting support for systems modeled on the Arm "Angel"
> + *  semihosting syscalls design.
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
>   *  Copyright (c) 2019 Linaro
>   *  Written by Paul Brook.
>   *
> + *  Copyright =C2=A9 2020 by Keith Packard <keithp@keithp.com>
> + *  Adapted for systems other than ARM, including RISC-V, by Keith Packa=
rd
> + *
>   *  This program is free software; you can redistribute it and/or modify
>   *  it under the terms of the GNU General Public License as published by
>   *  the Free Software Foundation; either version 2 of the License, or
> @@ -371,12 +375,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gd=
b_syscall_complete_cb cb,
>       * do anything with its return value, because it is not necessarily
>       * the result of the syscall, but could just be the old value of X0.
>       * The only thing safe to do with this is that the callers of
> -     * do_arm_semihosting() will write it straight back into X0.
> +     * do_common_semihosting() will write it straight back into X0.
>       * (In linux-user mode, the callback will have happened before
>       * gdb_do_syscallv() returns.)
>       *
>       * We should tidy this up so neither this function nor
> -     * do_arm_semihosting() return a value, so the mistake of
> +     * do_common_semihosting() return a value, so the mistake of
>       * doing something with the return value is not possible to make.
>       */
>
> @@ -673,10 +677,10 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>   * leave the register unchanged. We use 0xdeadbeef as the return value
>   * when there isn't a defined return value for the call.
>   */
> -target_ulong do_arm_semihosting(CPUARMState *env)
> +target_ulong do_common_semihosting(CPUState *cs)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> -    CPUState *cs =3D env_cpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>      target_ulong args;
>      target_ulong arg0, arg1, arg2, arg3;
>      char * s;
> diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
> new file mode 100644
> index 0000000000..bc53e92c79
> --- /dev/null
> +++ b/hw/semihosting/common-semi.h
> @@ -0,0 +1,36 @@
> +/*
> + *  Semihosting support for systems modeled on the Arm "Angel"
> + *  semihosting syscalls design.
> + *
> + *  Copyright (c) 2005, 2007 CodeSourcery.
> + *  Copyright (c) 2019 Linaro
> + *  Written by Paul Brook.
> + *
> + *  Copyright =C2=A9 2020 by Keith Packard <keithp@keithp.com>
> + *  Adapted for systems other than ARM, including RISC-V, by Keith Packa=
rd
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> + *
> + */
> +
> +#ifndef COMMON_SEMI_H
> +#define COMMON_SEMI_H
> +
> +target_ulong do_common_semihosting(CPUState *cs);
> +
> +#endif /* COMMON_SEMI_H */
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.=
c
> index bbe9fefca8..42b9c15f53 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -22,6 +22,7 @@
>  #include "qemu.h"
>  #include "cpu_loop-common.h"
>  #include "qemu/guest-random.h"
> +#include "hw/semihosting/common-semi.h"
>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r =3D get_user_u32((x), (gaddr));       \
> @@ -129,7 +130,7 @@ void cpu_loop(CPUARMState *env)
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
>          case EXCP_SEMIHOST:
> -            env->xregs[0] =3D do_arm_semihosting(env);
> +            env->xregs[0] =3D do_common_semihosting(cs);
>              env->pc +=3D 4;
>              break;
>          case EXCP_YIELD:
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 13629ee1f6..31dbb4d1af 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -22,6 +22,7 @@
>  #include "qemu.h"
>  #include "elf.h"
>  #include "cpu_loop-common.h"
> +#include "hw/semihosting/common-semi.h"
>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r =3D get_user_u32((x), (gaddr));       \
> @@ -393,7 +394,7 @@ void cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_SEMIHOST:
> -            env->regs[0] =3D do_arm_semihosting(env);
> +            env->regs[0] =3D do_common_semihosting(cs);
>              env->regs[15] +=3D env->thumb ? 2 : 4;
>              break;
>          case EXCP_INTERRUPT:
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 49cd5cabcf..c7ece27c56 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1068,14 +1068,6 @@ static inline void aarch64_sve_change_el(CPUARMSta=
te *env, int o,
>  static inline void aarch64_add_sve_properties(Object *obj) { }
>  #endif
>
> -#if !defined(CONFIG_TCG)
> -static inline target_ulong do_arm_semihosting(CPUARMState *env)
> -{
> -    g_assert_not_reached();
> -}
> -#else
> -target_ulong do_arm_semihosting(CPUARMState *env);
> -#endif
>  void aarch64_sync_32_to_64(CPUARMState *env);
>  void aarch64_sync_64_to_32(CPUARMState *env);
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 97bb6b8c01..8dbb0ef5d3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -34,6 +34,7 @@
>  #ifdef CONFIG_TCG
>  #include "arm_ldst.h"
>  #include "exec/cpu_ldst.h"
> +#include "hw/semihosting/common-semi.h"
>  #endif
>
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
> @@ -9889,13 +9890,13 @@ static void handle_semihosting(CPUState *cs)
>          qemu_log_mask(CPU_LOG_INT,
>                        "...handling as semihosting call 0x%" PRIx64 "\n",
>                        env->xregs[0]);
> -        env->xregs[0] =3D do_arm_semihosting(env);
> +        env->xregs[0] =3D do_common_semihosting(cs);
>          env->pc +=3D 4;
>      } else {
>          qemu_log_mask(CPU_LOG_INT,
>                        "...handling as semihosting call 0x%x\n",
>                        env->regs[0]);
> -        env->regs[0] =3D do_arm_semihosting(env);
> +        env->regs[0] =3D do_common_semihosting(cs);
>          env->regs[15] +=3D env->thumb ? 2 : 4;
>      }
>  }
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 036454234c..ef897382de 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -31,6 +31,7 @@
>  #ifdef CONFIG_TCG
>  #include "arm_ldst.h"
>  #include "exec/cpu_ldst.h"
> +#include "hw/semihosting/common-semi.h"
>  #endif
>
>  static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
> @@ -2188,7 +2189,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          qemu_log_mask(CPU_LOG_INT,
>                        "...handling as semihosting call 0x%x\n",
>                        env->regs[0]);
> -        env->regs[0] =3D do_arm_semihosting(env);
> +#ifdef CONFIG_TCG
> +        env->regs[0] =3D do_common_semihosting(cs);
> +#else
> +        g_assert_not_reached();
> +#endif
>          env->regs[15] +=3D env->thumb ? 2 : 4;
>          return;
>      case EXCP_BKPT:
> --
> 2.28.0
>
>
