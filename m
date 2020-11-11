Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp831164lfb;
        Wed, 11 Nov 2020 14:41:33 -0800 (PST)
X-Received: by 2002:a5d:8c9a:: with SMTP id g26mr6962143ion.151.1605134493152;
        Wed, 11 Nov 2020 14:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605134493; cv=none;
        d=google.com; s=arc-20160816;
        b=u3/0waIrMg8CahW3Zn5dxXbXJt2IABrFDHa/cIC/oSxc76XuHnC4UewAjw6A59eTWH
         Rsb0oAViJ/8cSYBxzHOAXxXQbqAB8LxBzXbPxlqCeStNfY0Cn9IMMHYvGqlPhCUYn/AV
         EQTn/5novgG6kDB8V6qt4FfohiLgrclaffiX8FWspMs8tCrBB3A197Z1fdCivK33SHVt
         WgSs1III++AKQUhMk/KJwu0DMudCzLN5L9rzogN0278rNPZDdAWPQuMvW/qs9J+Rbj/t
         POnn2x8VivDkksZ61bLH+W3V2hBUWGwYzvNjAvlisuL2jW6EXiBDrX4tWJhwC4zfsr4/
         y/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CEyRFzYGGU0Cpgii7O2FrZp5wcc+7PJ+fppxg7HHN3M=;
        b=l0jAewbpiIjBhE0bOOqAjLt1XHSRx8JKBKiLiT75ru/xB0GkiYiu/JOmJBPfPJFWdY
         oBmJsQye5J3Ixx77LchskvXj6Ac6Yqska4lrDsMaHUPVHACJIt8ahlzNGmt4DaSpcsip
         Ah2jb2+BTBb6j0JaiaXqol09Zv4zoyMrgyQ+cxEjgStgF2+IYzn+6C4V2VaSdCGlwlHc
         JGxlkbSZD2YGy4EJdbjNDA0rsX0Eo+O26B1AgPN81G1JGW+6EZUHj56r73KTeeWsnwvz
         PkDceMruZY+BBfLn6sD36mA/+cRS2AFaSriUdBV1vXXNNv5vpqHo05HXQw3N8+zcjb0C
         2G4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mfVQe0+4;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t85sor2423961ilk.1.2020.11.11.14.41.32
        (Google Transport Security);
        Wed, 11 Nov 2020 14:41:33 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mfVQe0+4;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CEyRFzYGGU0Cpgii7O2FrZp5wcc+7PJ+fppxg7HHN3M=;
        b=mfVQe0+4lf00+1CsDYNfXrZVAHkcQdaAlw9Tx6OuhQgvTYLsMZ2UHYcI8otZF4hu6H
         thEjEYapez+niRhKAIOj6jUcCWeme3FDMjWorSwRZWS/PTS13I5XrI5bWBArBsjkPxZJ
         kUmP1Nb1YFxx4yG6t4MT9XsnmkLMT/duH4XxUjyE3O1xxfiosWTnR+A3Lprm/YE5O+HL
         fYiQsUs8+9MYRzZ8PRqyBC7NbDt428NWmd9zou7IKvHX7kVwD3zqr3TOiqyJw4NZjFu0
         HUgevfkdyLv1ISGiSVZ+Vxm+mEaYIq5z6xQVB8knToLTulUVio3yQfPRvQFQ5L+nGaO6
         KLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CEyRFzYGGU0Cpgii7O2FrZp5wcc+7PJ+fppxg7HHN3M=;
        b=XZ8/1ismhzEVTTfjD0K2sKCpp6irMi+hcaxSrirtnVpfxWuUU1BDKyqFKPyElOgfzN
         71oNuwEC2aCj9/JYdbkeaTPpsXOD/mW1yC2rovtzFbYbPXyKrlKHU6U6zJkiahSdPBAZ
         SFuxs/qxhG9x+wE+nd9SY0o2P9LRRmlW6AX5k0yqfatQFadqLDSw4FTFOcrcYb0g4d0b
         8dKOVZjncG80d1xYhiInhXWia5mSMdql3m/tVhJ3smkiEh+YFBZHYiljU16vWg5THKOJ
         4uNDObzkPKzk2CU5fc/H/agpnVqtmo88s1NdYKFWT7zMEtltZ7A6JE6PCRBGDAJ0flLC
         vymg==
X-Gm-Message-State: AOAM532fH3h4Icn450C8QcK81T45oTJsJPjCl4TOB0yO+occ4Yfl9VbA
	DONXGhAO5rXj5IynrTtvY0dVSuOFNvgSRB1CpLY=
X-Google-Smtp-Source: ABdhPJydseR7ij0kBsvQt7cJIzeaHthDlOoJ6ZsVmP4AuAgKtamomqidyKOgZHGhzNEIz2wA1G9DKg6Z0gv+Pu3cysk=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr21908390ilg.131.1605134492365;
 Wed, 11 Nov 2020 14:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20201028185722.2783532-1-keithp@keithp.com> <20201028185722.2783532-4-keithp@keithp.com>
In-Reply-To: <20201028185722.2783532-4-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 14:29:28 -0800
Message-ID: <CAKmqyKP5JpriojRqDNy=SqqkXtg=y39P5xNoMrSsoWhfz8xeaw@mail.gmail.com>
Subject: Re: [PATCH 3/4] semihosting: Change internal common-semi interfaces
 to use CPUState *
To: Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: EVEjzxOiu/tP

On Wed, Oct 28, 2020 at 12:00 PM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> This makes all of the internal interfaces architecture-independent and
> renames the internal functions to use the 'common_semi' prefix instead
> of 'arm' or 'arm_semi'.
>
> To do this, some new architecture-specific internal helper functions
> were created:
>
>     static inline target_ulong
>     common_semi_arg(CPUState *cs, int argno)
>
>         Returns the argno'th semihosting argument, where argno can be
>         either 0 or 1.
>
>     static inline void
>     common_semi_set_ret(CPUState *cs, target_ulong ret)
>
>         Sets the semihosting return value.
>
>     static inline bool
>     common_semi_sys_exit_extended(CPUState *cs, int nr)
>
>         This detects whether the specified semihosting call, which
>         is either TARGET_SYS_EXIT or TARGET_SYS_EXIT_EXTENDED should
>         be executed using the TARGET_SYS_EXIT_EXTENDED semantics.
>
> In addition, several existing functions have been changed to flag
> areas of code which are architecture specific:
>
>     static target_ulong
>     common_semi_flen_buf(CPUState *cs)
>
>         Returns the current stack pointer minus 64, which is
>         where a stat structure will be placed on the stack
>
>     #define GET_ARG(n)
>
>         This fetches arguments from the semihosting command's argument
>         block. The address of this is available implicitly through the
>         local 'args' variable. This is *mostly* architecture
>         independent, but does depend on the current ABI's notion of
>         the size of a 'long' parameter, which may need run-time checks
>         (as it does on AARCH64)
>
>     #define SET_ARG(n, val)
>
>         This mirrors GET_ARG and stores data back into the argument
>         block.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

I'm not sure common is the right name here, as it is really just ARM
and RISC-V, but I don't have a better name to use.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/semihosting/common-semi.c | 326 ++++++++++++++++++-----------------
>  1 file changed, 164 insertions(+), 162 deletions(-)
>
> diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
> index e0c59bc599..c77fb21bec 100644
> --- a/hw/semihosting/common-semi.c
> +++ b/hw/semihosting/common-semi.c
> @@ -32,11 +32,12 @@
>  #include "cpu.h"
>  #include "hw/semihosting/semihost.h"
>  #include "hw/semihosting/console.h"
> +#include "hw/semihosting/common-semi.h"
>  #include "qemu/log.h"
>  #ifdef CONFIG_USER_ONLY
>  #include "qemu.h"
>
> -#define ARM_ANGEL_HEAP_SIZE (128 * 1024 * 1024)
> +#define COMMON_SEMI_HEAP_SIZE (128 * 1024 * 1024)
>  #else
>  #include "exec/gdbstub.h"
>  #include "qemu/cutils.h"
> @@ -132,6 +133,36 @@ typedef struct GuestFD {
>
>  static GArray *guestfd_array;
>
> +#ifdef TARGET_ARM
> +static inline target_ulong
> +common_semi_arg(CPUState *cs, int argno)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    if (is_a64(env))
> +        return env->xregs[argno];
> +    else
> +        return env->regs[argno];
> +}
> +
> +static inline void
> +common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    if (is_a64(env))
> +        env->xregs[0] = ret;
> +    else
> +        env->regs[0] = ret;
> +}
> +
> +static inline bool
> +common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
> +}
> +#endif /* TARGET_ARM */
> +
>  /*
>   * Allocate a new guest file descriptor and return it; if we
>   * couldn't allocate a new fd then return -1.
> @@ -237,11 +268,10 @@ static target_ulong syscall_err;
>  #include "exec/softmmu-semi.h"
>  #endif
>
> -static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
> +static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
>  {
>      if (code == (uint32_t)-1) {
>  #ifdef CONFIG_USER_ONLY
> -        CPUState *cs = env_cpu(env);
>          TaskState *ts = cs->opaque;
>
>          ts->swi_errno = errno;
> @@ -252,10 +282,9 @@ static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
>      return code;
>  }
>
> -static inline uint32_t get_swi_errno(CPUARMState *env)
> +static inline uint32_t get_swi_errno(CPUState *cs)
>  {
>  #ifdef CONFIG_USER_ONLY
> -    CPUState *cs = env_cpu(env);
>      TaskState *ts = cs->opaque;
>
>      return ts->swi_errno;
> @@ -264,24 +293,22 @@ static inline uint32_t get_swi_errno(CPUARMState *env)
>  #endif
>  }
>
> -static target_ulong arm_semi_syscall_len;
> +static target_ulong common_semi_syscall_len;
>
> -static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
> +static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    target_ulong reg0 = is_a64(env) ? env->xregs[0] : env->regs[0];
> +    target_ulong reg0 = common_semi_arg(cs, 0);
>
>      if (ret == (target_ulong)-1) {
>          errno = err;
> -        set_swi_errno(env, -1);
> +        set_swi_errno(cs, -1);
>          reg0 = ret;
>      } else {
>          /* Fixup syscalls that use nonstardard return conventions.  */
>          switch (reg0) {
>          case TARGET_SYS_WRITE:
>          case TARGET_SYS_READ:
> -            reg0 = arm_semi_syscall_len - ret;
> +            reg0 = common_semi_syscall_len - ret;
>              break;
>          case TARGET_SYS_SEEK:
>              reg0 = 0;
> @@ -291,77 +318,62 @@ static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>              break;
>          }
>      }
> -    if (is_a64(env)) {
> -        env->xregs[0] = reg0;
> -    } else {
> -        env->regs[0] = reg0;
> -    }
> +    common_semi_set_ret(cs, reg0);
>  }
>
> -static target_ulong arm_flen_buf(ARMCPU *cpu)
> +static target_ulong common_semi_flen_buf(CPUState *cs)
>  {
> +    target_ulong sp;
> +#ifdef TARGET_ARM
>      /* Return an address in target memory of 64 bytes where the remote
>       * gdb should write its stat struct. (The format of this structure
>       * is defined by GDB's remote protocol and is not target-specific.)
>       * We put this on the guest's stack just below SP.
>       */
> +    ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> -    target_ulong sp;
>
>      if (is_a64(env)) {
>          sp = env->xregs[31];
>      } else {
>          sp = env->regs[13];
>      }
> +#endif
>
>      return sp - 64;
>  }
>
> -static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
> +static void common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
>      /* The size is always stored in big-endian order, extract
>         the value. We assume the size always fit in 32 bits.  */
>      uint32_t size;
> -    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, (uint8_t *)&size, 4, 0);
> +    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32, (uint8_t *)&size, 4, 0);
>      size = be32_to_cpu(size);
> -    if (is_a64(env)) {
> -        env->xregs[0] = size;
> -    } else {
> -        env->regs[0] = size;
> -    }
> +    common_semi_set_ret(cs, size);
>      errno = err;
> -    set_swi_errno(env, -1);
> +    set_swi_errno(cs, -1);
>  }
>
> -static int arm_semi_open_guestfd;
> +static int common_semi_open_guestfd;
>
> -static void arm_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
> +static void common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
>      if (ret == (target_ulong)-1) {
>          errno = err;
> -        set_swi_errno(env, -1);
> -        dealloc_guestfd(arm_semi_open_guestfd);
> -    } else {
> -        associate_guestfd(arm_semi_open_guestfd, ret);
> -        ret = arm_semi_open_guestfd;
> -    }
> -
> -    if (is_a64(env)) {
> -        env->xregs[0] = ret;
> +        set_swi_errno(cs, -1);
> +        dealloc_guestfd(common_semi_open_guestfd);
>      } else {
> -        env->regs[0] = ret;
> +        associate_guestfd(common_semi_open_guestfd, ret);
> +        ret = common_semi_open_guestfd;
>      }
> +    common_semi_set_ret(cs, ret);
>  }
>
> -static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
> -                                    const char *fmt, ...)
> +static target_ulong common_semi_gdb_syscall(CPUState *cs, gdb_syscall_complete_cb cb,
> +                                            const char *fmt, ...)
>  {
>      va_list va;
> -    CPUARMState *env = &cpu->env;
>
>      va_start(va, fmt);
>      gdb_do_syscallv(cb, fmt, va);
> @@ -384,7 +396,7 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
>       * doing something with the return value is not possible to make.
>       */
>
> -    return is_a64(env) ? env->xregs[0] : env->regs[0];
> +    return common_semi_arg(cs, 0);
>  }
>
>  /*
> @@ -393,20 +405,18 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
>   * do the work and return the required return value for the guest,
>   * setting the guest errno if appropriate.
>   */
> -typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
> -typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
> +typedef uint32_t sys_closefn(CPUState *cs, GuestFD *gf);
> +typedef uint32_t sys_writefn(CPUState *cs, GuestFD *gf,
>                               target_ulong buf, uint32_t len);
> -typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
> +typedef uint32_t sys_readfn(CPUState *cs, GuestFD *gf,
>                              target_ulong buf, uint32_t len);
> -typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
> -typedef uint32_t sys_seekfn(ARMCPU *cpu, GuestFD *gf,
> +typedef uint32_t sys_isattyfn(CPUState *cs, GuestFD *gf);
> +typedef uint32_t sys_seekfn(CPUState *cs, GuestFD *gf,
>                              target_ulong offset);
> -typedef uint32_t sys_flenfn(ARMCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_flenfn(CPUState *cs, GuestFD *gf);
>
> -static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t host_closefn(CPUState *cs, GuestFD *gf)
>  {
> -    CPUARMState *env = &cpu->env;
> -
>      /*
>       * Only close the underlying host fd if it's one we opened on behalf
>       * of the guest in SYS_OPEN.
> @@ -416,20 +426,21 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
>          gf->hostfd == STDERR_FILENO) {
>          return 0;
>      }
> -    return set_swi_errno(env, close(gf->hostfd));
> +    return set_swi_errno(cs, close(gf->hostfd));
>  }
>
> -static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t host_writefn(CPUState *cs, GuestFD *gf,
>                               target_ulong buf, uint32_t len)
>  {
> +    CPUArchState *env = cs->env_ptr;
>      uint32_t ret;
> -    CPUARMState *env = &cpu->env;
>      char *s = lock_user(VERIFY_READ, buf, len, 1);
> +    (void) env; /* Used in arm softmmu lock_user implicitly */
>      if (!s) {
>          /* Return bytes not written on error */
>          return len;
>      }
> -    ret = set_swi_errno(env, write(gf->hostfd, s, len));
> +    ret = set_swi_errno(cs, write(gf->hostfd, s, len));
>      unlock_user(s, buf, 0);
>      if (ret == (uint32_t)-1) {
>          ret = 0;
> @@ -438,18 +449,19 @@ static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
>      return len - ret;
>  }
>
> -static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t host_readfn(CPUState *cs, GuestFD *gf,
>                              target_ulong buf, uint32_t len)
>  {
> +    CPUArchState *env = cs->env_ptr;
>      uint32_t ret;
> -    CPUARMState *env = &cpu->env;
>      char *s = lock_user(VERIFY_WRITE, buf, len, 0);
> +    (void) env; /* Used in arm softmmu lock_user implicitly */
>      if (!s) {
>          /* return bytes not read */
>          return len;
>      }
>      do {
> -        ret = set_swi_errno(env, read(gf->hostfd, s, len));
> +        ret = set_swi_errno(cs, read(gf->hostfd, s, len));
>      } while (ret == -1 && errno == EINTR);
>      unlock_user(s, buf, len);
>      if (ret == (uint32_t)-1) {
> @@ -459,68 +471,66 @@ static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
>      return len - ret;
>  }
>
> -static uint32_t host_isattyfn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t host_isattyfn(CPUState *cs, GuestFD *gf)
>  {
>      return isatty(gf->hostfd);
>  }
>
> -static uint32_t host_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
> +static uint32_t host_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
>  {
> -    CPUARMState *env = &cpu->env;
> -    uint32_t ret = set_swi_errno(env, lseek(gf->hostfd, offset, SEEK_SET));
> +    uint32_t ret = set_swi_errno(cs, lseek(gf->hostfd, offset, SEEK_SET));
>      if (ret == (uint32_t)-1) {
>          return -1;
>      }
>      return 0;
>  }
>
> -static uint32_t host_flenfn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t host_flenfn(CPUState *cs, GuestFD *gf)
>  {
> -    CPUARMState *env = &cpu->env;
>      struct stat buf;
> -    uint32_t ret = set_swi_errno(env, fstat(gf->hostfd, &buf));
> +    uint32_t ret = set_swi_errno(cs, fstat(gf->hostfd, &buf));
>      if (ret == (uint32_t)-1) {
>          return -1;
>      }
>      return buf.st_size;
>  }
>
> -static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t gdb_closefn(CPUState *cs, GuestFD *gf)
>  {
> -    return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> +    return common_semi_gdb_syscall(cs, common_semi_cb, "close,%x", gf->hostfd);
>  }
>
> -static uint32_t gdb_writefn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t gdb_writefn(CPUState *cs, GuestFD *gf,
>                              target_ulong buf, uint32_t len)
>  {
> -    arm_semi_syscall_len = len;
> -    return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
> -                           gf->hostfd, buf, len);
> +    common_semi_syscall_len = len;
> +    return common_semi_gdb_syscall(cs, common_semi_cb, "write,%x,%x,%x",
> +                                   gf->hostfd, buf, len);
>  }
>
> -static uint32_t gdb_readfn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t gdb_readfn(CPUState *cs, GuestFD *gf,
>                             target_ulong buf, uint32_t len)
>  {
> -    arm_semi_syscall_len = len;
> -    return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
> -                           gf->hostfd, buf, len);
> +    common_semi_syscall_len = len;
> +    return common_semi_gdb_syscall(cs, common_semi_cb, "read,%x,%x,%x",
> +                                   gf->hostfd, buf, len);
>  }
>
> -static uint32_t gdb_isattyfn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t gdb_isattyfn(CPUState *cs, GuestFD *gf)
>  {
> -    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
> +    return common_semi_gdb_syscall(cs, common_semi_cb, "isatty,%x", gf->hostfd);
>  }
>
> -static uint32_t gdb_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
> +static uint32_t gdb_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
>  {
> -    return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
> -                           gf->hostfd, offset);
> +    return common_semi_gdb_syscall(cs, common_semi_cb, "lseek,%x,%x,0",
> +                                   gf->hostfd, offset);
>  }
>
> -static uint32_t gdb_flenfn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t gdb_flenfn(CPUState *cs, GuestFD *gf)
>  {
> -    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
> -                           gf->hostfd, arm_flen_buf(cpu));
> +    return common_semi_gdb_syscall(cs, common_semi_flen_cb, "fstat,%x,%x",
> +                                   gf->hostfd, common_semi_flen_buf(cs));
>  }
>
>  #define SHFB_MAGIC_0 0x53
> @@ -549,31 +559,29 @@ static void init_featurefile_guestfd(int guestfd)
>      gf->featurefile_offset = 0;
>  }
>
> -static uint32_t featurefile_closefn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t featurefile_closefn(CPUState *cs, GuestFD *gf)
>  {
>      /* Nothing to do */
>      return 0;
>  }
>
> -static uint32_t featurefile_writefn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
>                                      target_ulong buf, uint32_t len)
>  {
>      /* This fd can never be open for writing */
> -    CPUARMState *env = &cpu->env;
>
>      errno = EBADF;
> -    return set_swi_errno(env, -1);
> +    return set_swi_errno(cs, -1);
>  }
>
> -static uint32_t featurefile_readfn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
>                                     target_ulong buf, uint32_t len)
>  {
> +    CPUArchState *env = cs->env_ptr;
>      uint32_t i;
> -#ifndef CONFIG_USER_ONLY
> -    CPUARMState *env = &cpu->env;
> -#endif
>      char *s;
>
> +    (void) env; /* Used in arm softmmu lock_user implicitly */
>      s = lock_user(VERIFY_WRITE, buf, len, 0);
>      if (!s) {
>          return len;
> @@ -593,19 +601,19 @@ static uint32_t featurefile_readfn(ARMCPU *cpu, GuestFD *gf,
>      return len - i;
>  }
>
> -static uint32_t featurefile_isattyfn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t featurefile_isattyfn(CPUState *cs, GuestFD *gf)
>  {
>      return 0;
>  }
>
> -static uint32_t featurefile_seekfn(ARMCPU *cpu, GuestFD *gf,
> +static uint32_t featurefile_seekfn(CPUState *cs, GuestFD *gf,
>                                     target_ulong offset)
>  {
>      gf->featurefile_offset = offset;
>      return 0;
>  }
>
> -static uint32_t featurefile_flenfn(ARMCPU *cpu, GuestFD *gf)
> +static uint32_t featurefile_flenfn(CPUState *cs, GuestFD *gf)
>  {
>      return sizeof(featurefile_data);
>  }
> @@ -649,16 +657,17 @@ static const GuestFDFunctions guestfd_fns[] = {
>  /* Read the input value from the argument block; fail the semihosting
>   * call if the memory read fails.
>   */
> +#ifdef TARGET_ARM
>  #define GET_ARG(n) do {                                 \
>      if (is_a64(env)) {                                  \
>          if (get_user_u64(arg ## n, args + (n) * 8)) {   \
>              errno = EFAULT;                             \
> -            return set_swi_errno(env, -1);              \
> +            return set_swi_errno(cs, -1);              \
>          }                                               \
>      } else {                                            \
>          if (get_user_u32(arg ## n, args + (n) * 4)) {   \
>              errno = EFAULT;                             \
> -            return set_swi_errno(env, -1);              \
> +            return set_swi_errno(cs, -1);              \
>          }                                               \
>      }                                                   \
>  } while (0)
> @@ -667,6 +676,7 @@ static const GuestFDFunctions guestfd_fns[] = {
>      (is_a64(env) ?                                      \
>       put_user_u64(val, args + (n) * 8) :                \
>       put_user_u32(val, args + (n) * 4))
> +#endif
>
>  /*
>   * Do a semihosting call.
> @@ -679,8 +689,7 @@ static const GuestFDFunctions guestfd_fns[] = {
>   */
>  target_ulong do_common_semihosting(CPUState *cs)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> +    CPUArchState *env = cs->env_ptr;
>      target_ulong args;
>      target_ulong arg0, arg1, arg2, arg3;
>      char * s;
> @@ -689,14 +698,9 @@ target_ulong do_common_semihosting(CPUState *cs)
>      uint32_t len;
>      GuestFD *gf;
>
> -    if (is_a64(env)) {
> -        /* Note that the syscall number is in W0, not X0 */
> -        nr = env->xregs[0] & 0xffffffffU;
> -        args = env->xregs[1];
> -    } else {
> -        nr = env->regs[0];
> -        args = env->regs[1];
> -    }
> +    (void) env; /* Used implicitly by arm lock_user macro */
> +    nr = common_semi_arg(cs, 0) & 0xffffffffU;
> +    args = common_semi_arg(cs, 1);
>
>      switch (nr) {
>      case TARGET_SYS_OPEN:
> @@ -709,19 +713,19 @@ target_ulong do_common_semihosting(CPUState *cs)
>          s = lock_user_string(arg0);
>          if (!s) {
>              errno = EFAULT;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>          if (arg1 >= 12) {
>              unlock_user(s, arg0, 0);
>              errno = EINVAL;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
>          guestfd = alloc_guestfd();
>          if (guestfd < 0) {
>              unlock_user(s, arg0, 0);
>              errno = EMFILE;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
>          if (strcmp(s, ":tt") == 0) {
> @@ -750,18 +754,18 @@ target_ulong do_common_semihosting(CPUState *cs)
>              if (arg1 != 0 && arg1 != 1) {
>                  dealloc_guestfd(guestfd);
>                  errno = EACCES;
> -                return set_swi_errno(env, -1);
> +                return set_swi_errno(cs, -1);
>              }
>              init_featurefile_guestfd(guestfd);
>              return guestfd;
>          }
>
>          if (use_gdb_syscalls()) {
> -            arm_semi_open_guestfd = guestfd;
> -            ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
> -                                  (int)arg2+1, gdb_open_modeflags[arg1]);
> +            common_semi_open_guestfd = guestfd;
> +            ret = common_semi_gdb_syscall(cs, common_semi_open_cb, "open,%s,%x,1a4", arg0,
> +                                          (int)arg2+1, gdb_open_modeflags[arg1]);
>          } else {
> -            ret = set_swi_errno(env, open(s, open_modeflags[arg1], 0644));
> +            ret = set_swi_errno(cs, open(s, open_modeflags[arg1], 0644));
>              if (ret == (uint32_t)-1) {
>                  dealloc_guestfd(guestfd);
>              } else {
> @@ -778,17 +782,17 @@ target_ulong do_common_semihosting(CPUState *cs)
>          gf = get_guestfd(arg0);
>          if (!gf) {
>              errno = EBADF;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
> -        ret = guestfd_fns[gf->type].closefn(cpu, gf);
> +        ret = guestfd_fns[gf->type].closefn(cs, gf);
>          dealloc_guestfd(arg0);
>          return ret;
>      case TARGET_SYS_WRITEC:
> -        qemu_semihosting_console_outc(env, args);
> +        qemu_semihosting_console_outc(cs->env_ptr, args);
>          return 0xdeadbeef;
>      case TARGET_SYS_WRITE0:
> -        return qemu_semihosting_console_outs(env, args);
> +        return qemu_semihosting_console_outs(cs->env_ptr, args);
>      case TARGET_SYS_WRITE:
>          GET_ARG(0);
>          GET_ARG(1);
> @@ -798,10 +802,10 @@ target_ulong do_common_semihosting(CPUState *cs)
>          gf = get_guestfd(arg0);
>          if (!gf) {
>              errno = EBADF;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
> -        return guestfd_fns[gf->type].writefn(cpu, gf, arg1, len);
> +        return guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
>      case TARGET_SYS_READ:
>          GET_ARG(0);
>          GET_ARG(1);
> @@ -811,22 +815,22 @@ target_ulong do_common_semihosting(CPUState *cs)
>          gf = get_guestfd(arg0);
>          if (!gf) {
>              errno = EBADF;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
> -        return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
> +        return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
>      case TARGET_SYS_READC:
> -        return qemu_semihosting_console_inc(env);
> +        return qemu_semihosting_console_inc(cs->env_ptr);
>      case TARGET_SYS_ISTTY:
>          GET_ARG(0);
>
>          gf = get_guestfd(arg0);
>          if (!gf) {
>              errno = EBADF;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
> -        return guestfd_fns[gf->type].isattyfn(cpu, gf);
> +        return guestfd_fns[gf->type].isattyfn(cs, gf);
>      case TARGET_SYS_SEEK:
>          GET_ARG(0);
>          GET_ARG(1);
> @@ -834,20 +838,20 @@ target_ulong do_common_semihosting(CPUState *cs)
>          gf = get_guestfd(arg0);
>          if (!gf) {
>              errno = EBADF;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
> -        return guestfd_fns[gf->type].seekfn(cpu, gf, arg1);
> +        return guestfd_fns[gf->type].seekfn(cs, gf, arg1);
>      case TARGET_SYS_FLEN:
>          GET_ARG(0);
>
>          gf = get_guestfd(arg0);
>          if (!gf) {
>              errno = EBADF;
> -            return set_swi_errno(env, -1);
> +            return set_swi_errno(cs, -1);
>          }
>
> -        return guestfd_fns[gf->type].flenfn(cpu, gf);
> +        return guestfd_fns[gf->type].flenfn(cs, gf);
>      case TARGET_SYS_TMPNAM:
>          qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
>          return -1;
> @@ -855,15 +859,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>          GET_ARG(0);
>          GET_ARG(1);
>          if (use_gdb_syscalls()) {
> -            ret = arm_gdb_syscall(cpu, arm_semi_cb, "unlink,%s",
> -                                  arg0, (int)arg1+1);
> +            ret = common_semi_gdb_syscall(cs, common_semi_cb, "unlink,%s",
> +                                          arg0, (int)arg1+1);
>          } else {
>              s = lock_user_string(arg0);
>              if (!s) {
>                  errno = EFAULT;
> -                return set_swi_errno(env, -1);
> +                return set_swi_errno(cs, -1);
>              }
> -            ret =  set_swi_errno(env, remove(s));
> +            ret =  set_swi_errno(cs, remove(s));
>              unlock_user(s, arg0, 0);
>          }
>          return ret;
> @@ -873,17 +877,17 @@ target_ulong do_common_semihosting(CPUState *cs)
>          GET_ARG(2);
>          GET_ARG(3);
>          if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "rename,%s,%s",
> -                                   arg0, (int)arg1+1, arg2, (int)arg3+1);
> +            return common_semi_gdb_syscall(cs, common_semi_cb, "rename,%s,%s",
> +                                           arg0, (int)arg1+1, arg2, (int)arg3+1);
>          } else {
>              char *s2;
>              s = lock_user_string(arg0);
>              s2 = lock_user_string(arg2);
>              if (!s || !s2) {
>                  errno = EFAULT;
> -                ret = set_swi_errno(env, -1);
> +                ret = set_swi_errno(cs, -1);
>              } else {
> -                ret = set_swi_errno(env, rename(s, s2));
> +                ret = set_swi_errno(cs, rename(s, s2));
>              }
>              if (s2)
>                  unlock_user(s2, arg2, 0);
> @@ -894,25 +898,25 @@ target_ulong do_common_semihosting(CPUState *cs)
>      case TARGET_SYS_CLOCK:
>          return clock() / (CLOCKS_PER_SEC / 100);
>      case TARGET_SYS_TIME:
> -        return set_swi_errno(env, time(NULL));
> +        return set_swi_errno(cs, time(NULL));
>      case TARGET_SYS_SYSTEM:
>          GET_ARG(0);
>          GET_ARG(1);
>          if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "system,%s",
> -                                   arg0, (int)arg1+1);
> +            return common_semi_gdb_syscall(cs, common_semi_cb, "system,%s",
> +                                           arg0, (int)arg1+1);
>          } else {
>              s = lock_user_string(arg0);
>              if (!s) {
>                  errno = EFAULT;
> -                return set_swi_errno(env, -1);
> +                return set_swi_errno(cs, -1);
>              }
> -            ret = set_swi_errno(env, system(s));
> +            ret = set_swi_errno(cs, system(s));
>              unlock_user(s, arg0, 0);
>              return ret;
>          }
>      case TARGET_SYS_ERRNO:
> -        return get_swi_errno(env);
> +        return get_swi_errno(cs);
>      case TARGET_SYS_GET_CMDLINE:
>          {
>              /* Build a command-line from the original argv.
> @@ -964,21 +968,21 @@ target_ulong do_common_semihosting(CPUState *cs)
>              if (output_size > input_size) {
>                  /* Not enough space to store command-line arguments.  */
>                  errno = E2BIG;
> -                return set_swi_errno(env, -1);
> +                return set_swi_errno(cs, -1);
>              }
>
>              /* Adjust the command-line length.  */
>              if (SET_ARG(1, output_size - 1)) {
>                  /* Couldn't write back to argument block */
>                  errno = EFAULT;
> -                return set_swi_errno(env, -1);
> +                return set_swi_errno(cs, -1);
>              }
>
>              /* Lock the buffer on the ARM side.  */
>              output_buffer = lock_user(VERIFY_WRITE, arg0, output_size, 0);
>              if (!output_buffer) {
>                  errno = EFAULT;
> -                return set_swi_errno(env, -1);
> +                return set_swi_errno(cs, -1);
>              }
>
>              /* Copy the command-line arguments.  */
> @@ -994,7 +998,7 @@ target_ulong do_common_semihosting(CPUState *cs)
>              if (copy_from_user(output_buffer, ts->info->arg_start,
>                                 output_size)) {
>                  errno = EFAULT;
> -                status = set_swi_errno(env, -1);
> +                status = set_swi_errno(cs, -1);
>                  goto out;
>              }
>
> @@ -1031,7 +1035,7 @@ target_ulong do_common_semihosting(CPUState *cs)
>                  abi_ulong ret;
>
>                  ts->heap_base = do_brk(0);
> -                limit = ts->heap_base + ARM_ANGEL_HEAP_SIZE;
> +                limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
>                  /* Try a big heap, and reduce the size if that fails.  */
>                  for (;;) {
>                      ret = do_brk(limit);
> @@ -1059,23 +1063,19 @@ target_ulong do_common_semihosting(CPUState *cs)
>              for (i = 0; i < ARRAY_SIZE(retvals); i++) {
>                  bool fail;
>
> -                if (is_a64(env)) {
> -                    fail = put_user_u64(retvals[i], arg0 + i * 8);
> -                } else {
> -                    fail = put_user_u32(retvals[i], arg0 + i * 4);
> -                }
> +                fail = SET_ARG(i, retvals[i]);
>
>                  if (fail) {
>                      /* Couldn't write back to argument block */
>                      errno = EFAULT;
> -                    return set_swi_errno(env, -1);
> +                    return set_swi_errno(cs, -1);
>                  }
>              }
>              return 0;
>          }
>      case TARGET_SYS_EXIT:
>      case TARGET_SYS_EXIT_EXTENDED:
> -        if (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(env)) {
> +        if (common_semi_sys_exit_extended(cs, nr)) {
>              /*
>               * The A64 version of SYS_EXIT takes a parameter block,
>               * so the application-exit type can return a subcode which
> @@ -1100,7 +1100,7 @@ target_ulong do_common_semihosting(CPUState *cs)
>               */
>              ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
>          }
> -        gdb_exit(env, ret);
> +        gdb_exit(cs->env_ptr, ret);
>          exit(ret);
>      case TARGET_SYS_SYNCCACHE:
>          /*
> @@ -1108,9 +1108,11 @@ target_ulong do_common_semihosting(CPUState *cs)
>           * virtual address range. This is a nop for us since we don't
>           * implement caches. This is only present on A64.
>           */
> -        if (is_a64(env)) {
> +#ifdef TARGET_ARM
> +        if (is_a64(cs->env_ptr)) {
>              return 0;
>          }
> +#endif
>          /* fall through -- invalid for A32/T32 */
>      default:
>          fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
> --
> 2.28.0
>
>
