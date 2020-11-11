Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp825333lfb;
        Wed, 11 Nov 2020 14:31:48 -0800 (PST)
X-Received: by 2002:a92:d6cd:: with SMTP id z13mr20924384ilp.38.1605133908129;
        Wed, 11 Nov 2020 14:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605133908; cv=none;
        d=google.com; s=arc-20160816;
        b=xNhU9Lbtlkv9VU86xRoMRts90ccr6kKvAXZFdGfjPA2a4vHy2AnepnS7rNACdRBkme
         oDk5n8gx9E1Z20IheH9w8h5NnnXOjNC0ohefW39YV7/A2kVKEnhSu6QMDnleHKGYvHjr
         7Cah7Ap6IJ7yZxg3FwQNDAaY11OPlB7EMP9mx+xGs7Pes0wfplXBS1loZl5+1+rCe7Kc
         f5Q3NG5DuqcI8T7BgBq/x0unSLG8ggWwij0rICRYGgPR+Bwme1Cp7UX4/QWZDjw/niup
         hD7jGMlYvrKRRzMhb0mjYasMnZwdeHmdvYqZMvcOEEVSZURlXQ60LMELhgKfF4arJNgR
         sInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=anYdYTBDqzl3/OeU0++RZDyAT6ycL6aq/844EfX1P9E=;
        b=VGyrtmsCzAntcl49bqYfWMlgfJZk6ybTySsj/cQdWsD0xVAkod04qHiqNmWdx9GW3F
         2mCmn8TieNb6YQWsy2srXTsvIuM+KWYI+MLyN4d7YxIXcFFLXeIxvVUr8imP+Ma51Oc1
         m168O/TEaUNAtzaRJbqRThTosqhwMmJEsveb80x0nogwJQERZ2Eg6f9zDo0zYyK+cCkQ
         llmQWKN+eekfzr2jWYF7IhFSi0ePEhl+SPk69Un+7F5Sw2//tcb27l0r16tFFv875BUV
         fUshm68/SMg61GHrXznlBcoe6/jMvi8YPKm0DljS8G/cS/n79hzq7+lFW4FPG+gwYufa
         G4bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AFZ+LhxR;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t26sor2926564ioh.51.2020.11.11.14.31.47
        (Google Transport Security);
        Wed, 11 Nov 2020 14:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AFZ+LhxR;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=anYdYTBDqzl3/OeU0++RZDyAT6ycL6aq/844EfX1P9E=;
        b=AFZ+LhxRcFHb/S+TGBSrQHTuoHaRIL2uxiOBJcDClcn7iPPWkgc0G80p4KWN4rVg14
         nNQSJiFhfTfvU/NI7whqVFk7O4T5Cbhrq5pY1Ek6jFQAtNHPMGIn1ngjbV0ZZiUMvKrn
         3crmQir8VRV0fNUtoq3GZGR1DFO1LeVMIiRrRA47mUiywDrKDI47aQ3iek7WEHslzUjI
         WJsoVa2SAWwHTMi4QOtYj2yRxwgrvfqArXBQkqihG+X/2zX63UN27cLA0ccKsFwGTbME
         lT9nuRuYsyJ4mnyj10ddmW56HIqM8qJy+jr5xz4MP8olrma7AYh9KH2z/dlz96cRbhfC
         KQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=anYdYTBDqzl3/OeU0++RZDyAT6ycL6aq/844EfX1P9E=;
        b=JrXG0eyZO2C+Gj1rtYgA4yY5EFQhpZ2RZkaMh0h1aANg4Bzll0sHwfuCXym4KNkWyU
         8dNC7zbhQDifBv60eAxs+rHrInavNcGmHMkHHYyaNLrbknUGkY3gVDNVYI9NRcJYwCfl
         61PH5pCRkoNmgKyZuvo5iBV+MEy9S0YW7qyCqdrwf0ubOhC8lPkrchFbHV3qvo3Ji6by
         RtFzENfp91pC7HkOEWU5eMfE+dUTuRnOGOgNuvZfieQfPAgqrDZRxwaQvBujQJYCfggl
         xeE1V115zo+i2RXWmmp8hQrHj0Q8QQRXYAe50WzZKy5CCRe+GLiI8D/KuMa/gk6gs374
         pbKw==
X-Gm-Message-State: AOAM530YL1j8B59JgaCmtRp68lZVlsofud3WwkL5yHZg8JsjRKFiqGrG
	/Lr8vBGqG6nMPAD0fhZjq5ZJeN/yH9uBc9t6kbo=
X-Google-Smtp-Source: ABdhPJxtWCIQWem8PDNzuTG6mu4qGleakYIlKo8uxUqwouXBzw2XfKeH/cCDdLQS5CXtPIph8g/Zs117zWhr8bugxe4=
X-Received: by 2002:a6b:b30b:: with SMTP id c11mr20041413iof.175.1605133907507;
 Wed, 11 Nov 2020 14:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20201028185722.2783532-1-keithp@keithp.com> <20201028185722.2783532-5-keithp@keithp.com>
In-Reply-To: <20201028185722.2783532-5-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 14:19:43 -0800
Message-ID: <CAKmqyKPGLzEdj_GyQstPD1qUz_zRtAeXCc=pj4CjmxDn3UcTyg@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: Add semihosting support [v11]
To: Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: LM7qVzmAKyW0

On Wed, Oct 28, 2020 at 12:04 PM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> Adapt the arm semihosting support code for RISCV. This implementation
> is based on the standard for RISC-V semihosting version 0.2 as
> documented in
>
>    https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
>
> ---
>
> v2:
>         Update PC after exception is handled to follow
>         change in the ARM version for SYS_READC
>
> v3:
>         Disallow semihosting in user mode; report a regular
>         breakpoint in that case.
>
> v4:
>         Fix errors reported by checkpatch
>
> v5:
>         Reference current RISC-V semihosting specification
>
> v6:
>         Add support for semihosting in riscv64-linux-user and
>         riscv32-linux-user
>
> v7:
>         Add meson build support
>
> v8:
>         Fix errors reported by checkpatch that crept in.
>
> v9:
>         Changes suggested by Alistair Francis <alistair23@gmail.com>:
>         Don't add me to the MAINTAINERS file.
>         Remove duplicate #include in target/riscv/cpu.h
>         Reference RISC-V semihosting spec in target/riscv/riscv-semi.c
>
> v10:
>         Use common semihosting implementation instead of a separate copy.
>
>         Make sure addresses of the three breakpoint-signaling
>         instructions all lie within the same page. Change suggested by
>         Richard Henderson <richard.henderson@linaro.org>
>
> v11:
>         Use CONFIG_ARM_COMPATIBLE_SEMIHOSTING
> ---
>  default-configs/devices/riscv32-softmmu.mak   |  2 +
>  default-configs/devices/riscv64-softmmu.mak   |  2 +
>  .../targets/riscv32-linux-user.mak            |  1 +
>  .../targets/riscv64-linux-user.mak            |  1 +
>  hw/semihosting/common-semi.c                  | 51 ++++++++++++++++++-
>  hw/semihosting/common-semi.h                  |  5 +-
>  linux-user/qemu.h                             |  4 +-
>  linux-user/semihost.c                         |  8 +--
>  qemu-options.hx                               | 10 ++--
>  target/riscv/cpu_bits.h                       |  1 +
>  target/riscv/cpu_helper.c                     | 10 ++++
>  .../riscv/insn_trans/trans_privileged.c.inc   | 37 +++++++++++++-
>  target/riscv/translate.c                      | 11 ++++
>  13 files changed, 131 insertions(+), 12 deletions(-)
>
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> index 94a236c9c2..d847bd5692 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,6 +3,8 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> +CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index 76b6195648..d5eec75f05 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,6 +3,8 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> +CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>
>  # Boards:
>  #
> diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-configs/targets/riscv32-linux-user.mak
> index dfb259e8aa..6a9d1b1bc1 100644
> --- a/default-configs/targets/riscv32-linux-user.mak
> +++ b/default-configs/targets/riscv32-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=riscv32
>  TARGET_BASE_ARCH=riscv
>  TARGET_ABI_DIR=riscv
>  TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-configs/targets/riscv64-linux-user.mak
> index b13895f3b0..0a92849a1b 100644
> --- a/default-configs/targets/riscv64-linux-user.mak
> +++ b/default-configs/targets/riscv64-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=riscv64
>  TARGET_BASE_ARCH=riscv
>  TARGET_ABI_DIR=riscv
>  TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
> index c77fb21bec..8675934a71 100644
> --- a/hw/semihosting/common-semi.c
> +++ b/hw/semihosting/common-semi.c
> @@ -1,6 +1,6 @@
>  /*
>   *  Semihosting support for systems modeled on the Arm "Angel"
> - *  semihosting syscalls design.
> + *  semihosting syscalls design. This includes Arm and RISC-V processors
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
>   *  Copyright (c) 2019 Linaro
> @@ -25,6 +25,10 @@
>   *  ARM Semihosting is documented in:
>   *     Semihosting for AArch32 and AArch64 Release 2.0
>   *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> + *
> + *  RISC-V Semihosting is documented in:
> + *     RISC-V Semihosting
> + *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
>   */
>
>  #include "qemu/osdep.h"
> @@ -163,6 +167,30 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>  }
>  #endif /* TARGET_ARM */
>
> +#ifdef TARGET_RISCV
> +static inline target_ulong
> +common_semi_arg(CPUState *cs, int argno)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    return env->gpr[xA0 + argno];
> +}
> +
> +static inline void
> +common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    env->gpr[xA0] = ret;
> +}
> +
> +static inline bool
> +common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 0);

How would sizeof(target_ulong) == 0 ?

Otherwise this looks good.

Alistair

> +}
> +#endif
> +
>  /*
>   * Allocate a new guest file descriptor and return it; if we
>   * couldn't allocate a new fd then return -1.
> @@ -339,6 +367,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
>          sp = env->regs[13];
>      }
>  #endif
> +#ifdef TARGET_RISCV
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    sp = env->gpr[xSP];
> +#endif
>
>      return sp - 64;
>  }
> @@ -678,6 +712,18 @@ static const GuestFDFunctions guestfd_fns[] = {
>       put_user_u32(val, args + (n) * 4))
>  #endif
>
> +#ifdef TARGET_RISCV
> +#define GET_ARG(n) do {                                                 \
> +        if (get_user_ual(arg ## n, args + (n) * sizeof(target_ulong))) { \
> +            errno = EFAULT;                                             \
> +            return set_swi_errno(cs, -1);                              \
> +        }                                                               \
> +    } while (0)
> +
> +#define SET_ARG(n, val)                                 \
> +    put_user_ual(val, args + (n) * sizeof(target_ulong))
> +#endif
> +
>  /*
>   * Do a semihosting call.
>   *
> @@ -1112,6 +1158,9 @@ target_ulong do_common_semihosting(CPUState *cs)
>          if (is_a64(cs->env_ptr)) {
>              return 0;
>          }
> +#endif
> +#ifdef TARGET_RISCV
> +        return 0;
>  #endif
>          /* fall through -- invalid for A32/T32 */
>      default:
> diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
> index bc53e92c79..0bfab1c669 100644
> --- a/hw/semihosting/common-semi.h
> +++ b/hw/semihosting/common-semi.h
> @@ -1,6 +1,6 @@
>  /*
>   *  Semihosting support for systems modeled on the Arm "Angel"
> - *  semihosting syscalls design.
> + *  semihosting syscalls design. This includes Arm and RISC-V processors
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
>   *  Copyright (c) 2019 Linaro
> @@ -26,6 +26,9 @@
>   *     Semihosting for AArch32 and AArch64 Release 2.0
>   *     https://static.docs.arm.com/100863/0200/semihosting.pdf
>   *
> + *  RISC-V Semihosting is documented in:
> + *     RISC-V Semihosting
> + *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
>   */
>
>  #ifndef COMMON_SEMI_H
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 941ca99722..faeaab9614 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -105,6 +105,8 @@ typedef struct TaskState {
>      /* FPA state */
>      FPA11 fpa;
>  # endif
> +#endif
> +#if defined(TARGET_ARM) || defined(TARGET_RISCV)
>      int swi_errno;
>  #endif
>  #if defined(TARGET_I386) && !defined(TARGET_X86_64)
> @@ -118,7 +120,7 @@ typedef struct TaskState {
>  #ifdef TARGET_M68K
>      abi_ulong tp_value;
>  #endif
> -#if defined(TARGET_ARM) || defined(TARGET_M68K)
> +#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
>      /* Extra fields for semihosted binaries.  */
>      abi_ulong heap_base;
>      abi_ulong heap_limit;
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index a1f0f6050e..c0015ee7f6 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -1,11 +1,11 @@
>  /*
> - * ARM Semihosting Console Support
> + * ARM Compatible Semihosting Console Support.
>   *
>   * Copyright (c) 2019 Linaro Ltd
>   *
> - * Currently ARM is unique in having support for semihosting support
> - * in linux-user. So for now we implement the common console API but
> - * just for arm linux-user.
> + * Currently ARM and RISC-V are unique in having support for
> + * semihosting support in linux-user. So for now we implement the
> + * common console API but just for arm and risc-v linux-user.
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2c83390504..9a606946c4 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4184,10 +4184,10 @@ ERST
>  DEF("semihosting", 0, QEMU_OPTION_semihosting,
>      "-semihosting    semihosting mode\n",
>      QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
> +    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
>
>      Note that this allows guest direct access to the host filesystem, so
>      should only be used with a trusted guest OS.
> @@ -4199,10 +4199,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
>      "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
>      "                semihosting configuration\n",
>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
> +    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
>      only).
>
>      Note that this allows guest direct access to the host filesystem, so
> @@ -4217,6 +4217,8 @@ SRST
>      open/read/write/seek/select. Tensilica baremetal libc for ISS and
>      linux platform "sim" use this interface.
>
> +    On RISC-V this implements the standard semihosting API, version 0.2.
> +
>      ``target=native|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU
>          (``native``) or to GDB (``gdb``). The default is ``auto``, which
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index bd36062877..26a60b9e27 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -556,6 +556,7 @@
>  #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
>  #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
>  #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
> +#define RISCV_EXCP_SEMIHOST                      0x10
>  #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
>  #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
>  #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4652082df1..d71611ec02 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/exec-all.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
> +#include "hw/semihosting/common-semi.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
> @@ -875,6 +876,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong htval = 0;
>      target_ulong mtval2 = 0;
>
> +    if  (cause == RISCV_EXCP_SEMIHOST) {
> +        if (env->priv >= PRV_S) {
> +            env->gpr[xA0] = do_common_semihosting(cs);
> +            env->pc += 4;
> +            return;
> +        }
> +        cause = RISCV_EXCP_BREAKPOINT;
> +    }
> +
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 2a61a853bf..32312be202 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
>
>  static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>  {
> -    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    target_ulong    ebreak_addr = ctx->base.pc_next;
> +    target_ulong    pre_addr = ebreak_addr - 4;
> +    target_ulong    post_addr = ebreak_addr + 4;
> +    uint32_t pre    = 0;
> +    uint32_t ebreak = 0;
> +    uint32_t post   = 0;
> +
> +    /*
> +     * The RISC-V semihosting spec specifies the following
> +     * three-instruction sequence to flag a semihosting call:
> +     *
> +     *      slli zero, zero, 0x1f       0x01f01013
> +     *      ebreak                      0x00100073
> +     *      srai zero, zero, 0x7        0x40705013
> +     *
> +     * The two shift operations on the zero register are no-ops, used
> +     * here to signify a semihosting exception, rather than a breakpoint.
> +     *
> +     * Uncompressed instructions are required so that the sequence is easy
> +     * to validate.
> +     *
> +     * The three instructions are required to lie in the same page so
> +     * that no exception will be raised when fetching them.
> +     */
> +
> +    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
> +        pre    = opcode_at(&ctx->base, pre_addr);
> +        ebreak = opcode_at(&ctx->base, ebreak_addr);
> +        post   = opcode_at(&ctx->base, post_addr);
> +    }
> +
> +    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
> +        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
> +    } else {
> +        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    }
>      exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 79dca2291b..ecf594babc 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -63,6 +63,7 @@ typedef struct DisasContext {
>      uint16_t vlen;
>      uint16_t mlen;
>      bool vl_eq_vlmax;
> +    CPUState *cs;
>  } DisasContext;
>
>  #ifdef TARGET_RISCV64
> @@ -746,6 +747,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>      return true;
>  }
>
> +static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +
> +    return cpu_ldl_code(env, pc);
> +}
> +
>  /* Include insn module translation function */
>  #include "insn_trans/trans_rvi.c.inc"
>  #include "insn_trans/trans_rvm.c.inc"
> @@ -812,6 +822,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->cs = cs;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.28.0
>
>
