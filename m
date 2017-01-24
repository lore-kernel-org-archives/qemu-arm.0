Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o143sm27289285wmd.3.2017.01.24.08.43.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 08:43:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 73EB73E0133;
	Tue, 24 Jan 2017 16:43:55 +0000 (GMT)
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org> <1484937883-1068-5-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 4/6] hw/registerfields.h: Pull FIELD etc macros out of hw/register.h
In-reply-to: <1484937883-1068-5-git-send-email-peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:43:55 +0000
Message-ID: <87sho89zn8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: t45oFOF4NMum


Peter Maydell <peter.maydell@linaro.org> writes:

> hw/register.h provides macros like FIELD which make it easy to define
> shift, mask and length constants for the fields within a register.
> Unfortunately register.h also includes a lot of other things, some
> of which will only compile in the softmmu build.
>
> Pull the FIELD macro and friends out into a separate header file,
> so they can be used in places like target/arm files which also
> get built in the user-only configs.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/register.h       | 47 +----------------------------------
>  include/hw/registerfields.h | 60 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 46 deletions(-)
>  create mode 100644 include/hw/registerfields.h
>
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 8c12233..8bff5fb 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -13,6 +13,7 @@
>
>  #include "hw/qdev-core.h"
>  #include "exec/memory.h"
> +#include "hw/registerfields.h"
>
>  typedef struct RegisterInfo RegisterInfo;
>  typedef struct RegisterAccessInfo RegisterAccessInfo;
> @@ -206,50 +207,4 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
>
>  void register_finalize_block(RegisterInfoArray *r_array);
>
> -/* Define constants for a 32 bit register */
> -
> -/* This macro will define A_FOO, for the byte address of a register
> - * as well as R_FOO for the uint32_t[] register number (A_FOO / 4).
> - */
> -#define REG32(reg, addr)                                                  \
> -    enum { A_ ## reg = (addr) };                                          \
> -    enum { R_ ## reg = (addr) / 4 };
> -
> -/* Define SHIFT, LENGTH and MASK constants for a field within a register */
> -
> -/* This macro will define FOO_BAR_MASK, FOO_BAR_SHIFT and FOO_BAR_LENGTH
> - * constants for field BAR in register FOO.
> - */
> -#define FIELD(reg, field, shift, length)                                  \
> -    enum { R_ ## reg ## _ ## field ## _SHIFT = (shift)};                  \
> -    enum { R_ ## reg ## _ ## field ## _LENGTH = (length)};                \
> -    enum { R_ ## reg ## _ ## field ## _MASK =                             \
> -                                        MAKE_64BIT_MASK(shift, length)};
> -
> -/* Extract a field from a register */
> -#define FIELD_EX32(storage, reg, field)                                   \
> -    extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
> -              R_ ## reg ## _ ## field ## _LENGTH)
> -
> -/* Extract a field from an array of registers */
> -#define ARRAY_FIELD_EX32(regs, reg, field)                                \
> -    FIELD_EX32((regs)[R_ ## reg], reg, field)
> -
> -/* Deposit a register field.
> - * Assigning values larger then the target field will result in
> - * compilation warnings.
> - */
> -#define FIELD_DP32(storage, reg, field, val) ({                           \
> -    struct {                                                              \
> -        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
> -    } v = { .v = val };                                                   \
> -    uint32_t d;                                                           \
> -    d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
> -                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
> -    d; })
> -
> -/* Deposit a field to array of registers.  */
> -#define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
> -    (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
> -
>  #endif
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> new file mode 100644
> index 0000000..af101d5
> --- /dev/null
> +++ b/include/hw/registerfields.h
> @@ -0,0 +1,60 @@
> +/*
> + * Register Definition API: field macros
> + *
> + * Copyright (c) 2016 Xilinx Inc.
> + * Copyright (c) 2013 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef REGISTERFIELDS_H
> +#define REGISTERFIELDS_H
> +
> +/* Define constants for a 32 bit register */
> +
> +/* This macro will define A_FOO, for the byte address of a register
> + * as well as R_FOO for the uint32_t[] register number (A_FOO / 4).
> + */
> +#define REG32(reg, addr)                                                  \
> +    enum { A_ ## reg = (addr) };                                          \
> +    enum { R_ ## reg = (addr) / 4 };
> +
> +/* Define SHIFT, LENGTH and MASK constants for a field within a register */
> +
> +/* This macro will define FOO_BAR_MASK, FOO_BAR_SHIFT and FOO_BAR_LENGTH
> + * constants for field BAR in register FOO.
> + */
> +#define FIELD(reg, field, shift, length)                                  \
> +    enum { R_ ## reg ## _ ## field ## _SHIFT = (shift)};                  \
> +    enum { R_ ## reg ## _ ## field ## _LENGTH = (length)};                \
> +    enum { R_ ## reg ## _ ## field ## _MASK =                             \
> +                                        MAKE_64BIT_MASK(shift, length)};
> +
> +/* Extract a field from a register */
> +#define FIELD_EX32(storage, reg, field)                                   \
> +    extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
> +              R_ ## reg ## _ ## field ## _LENGTH)
> +
> +/* Extract a field from an array of registers */
> +#define ARRAY_FIELD_EX32(regs, reg, field)                                \
> +    FIELD_EX32((regs)[R_ ## reg], reg, field)
> +
> +/* Deposit a register field.
> + * Assigning values larger then the target field will result in
> + * compilation warnings.
> + */
> +#define FIELD_DP32(storage, reg, field, val) ({                           \
> +    struct {                                                              \
> +        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
> +    } v = { .v = val };                                                   \
> +    uint32_t d;                                                           \
> +    d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
> +    d; })
> +
> +/* Deposit a field to array of registers.  */
> +#define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
> +    (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
> +
> +#endif


Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
