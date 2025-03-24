Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm10497915f8f.45.2025.03.24.03.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:32:43 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E824F5F8B9;
	Mon, 24 Mar 2025 10:32:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Markus Armbruster
 <armbru@redhat.com>,  Akihiko Odaki <akihiko.odaki@daynix.com>,
  qemu-ppc@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-s390x@nongnu.org,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  David Hildenbrand <david@redhat.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH v2 04/11] gdbstub: introduce target independent gdb
 register helper
In-Reply-To: <20250324102142.67022-5-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
	message of "Mon, 24 Mar 2025 10:21:35 +0000")
References: <20250324102142.67022-1-alex.bennee@linaro.org>
	<20250324102142.67022-5-alex.bennee@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 24 Mar 2025 10:32:42 +0000
Message-ID: <87ikny4t2t.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: V73QO2q9LIeT

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The current helper.h functions rely on hard coded assumptions about
> target endianess to use the tswap macros. We also end up double
> swapping a bunch of values if the target can run in multiple endianess
> modes. Avoid this by getting the target to pass the endianess and size
> via a MemOp and fixing up appropriately.
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - use unsigned consistently
>   - fix some rouge whitespace
>   - add typed reg32/64 wrappers
>   - pass void * to underlying helper to avoid casting
> ---
>  include/gdbstub/registers.h | 55 +++++++++++++++++++++++++++++++++++++
>  gdbstub/gdbstub.c           | 23 ++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 include/gdbstub/registers.h
>
> diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
> new file mode 100644
> index 0000000000..2220f58efe
> --- /dev/null
> +++ b/include/gdbstub/registers.h
> @@ -0,0 +1,55 @@
> +/*
> + * GDB Common Register Helpers
> + *
> + * Copyright (c) 2025 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef GDB_REGISTERS_H
> +#define GDB_REGISTERS_H
> +
> +#include "exec/memop.h"
> +
> +/**
> + * gdb_get_register_value() - get register value for gdb
> + * mo: size and endian MemOp
> + * buf: GByteArray to store in target order
> + * val: pointer to value in host order
> + *
> + * This replaces the previous legacy read functions with a single
> + * function to handle all sizes. Passing @mo allows the target mode to
> + * be taken into account and avoids using hard coded tswap() macros.
> + *
> + * There are wrapper functions for the common sizes you can use to
> + * keep type checking.
> + *
> + * Returns the number of bytes written to the array.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, void *val);
> +
> +/**
> + * gdb_get_reg32_value() - type checked wrapper for gdb_get_register_val=
ue()
> + * mo: size and endian MemOp
> + * buf: GByteArray to store in target order
> + * val: pointer to uint32_t value in host order
> + */
> +static inline int gdb_get_reg32_value(MemOp op, GByteArray *buf, uint32_=
t *val) {
> +    g_assert((op & MO_SIZE) =3D=3D MO_32);
> +    return gdb_get_register_value(op, buf, val);
> +}
> +
> +/**
> + * gdb_get_reg64_value() - type checked wrapper for gdb_get_register_val=
ue()
> + * mo: size and endian MemOp
> + * buf: GByteArray to store in target order
> + * val: pointer to uint32_t value in host order
> + */
> +static inline int gdb_get_reg64_value(MemOp op, GByteArray *buf, uint64_=
t *val) {
> +    g_assert((op & MO_SIZE) =3D=3D MO_64);
> +    return gdb_get_register_value(op, buf, val);
> +}
> +
> +#endif /* GDB_REGISTERS_H */
> +
> +
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index b6d5e11e03..e799fdc019 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -32,6 +32,7 @@
>  #include "exec/gdbstub.h"
>  #include "gdbstub/commands.h"
>  #include "gdbstub/syscalls.h"
> +#include "gdbstub/registers.h"
>  #ifdef CONFIG_USER_ONLY
>  #include "accel/tcg/vcpu-state.h"
>  #include "gdbstub/user.h"
> @@ -45,6 +46,7 @@
>  #include "system/runstate.h"
>  #include "exec/replay-core.h"
>  #include "exec/hwaddr.h"
> +#include "exec/memop.h"
>=20=20
>  #include "internals.h"
>=20=20
> @@ -551,6 +553,27 @@ static int gdb_write_register(CPUState *cpu, uint8_t=
 *mem_buf, int reg)
>      return 0;
>  }
>=20=20
> +/*
> + * Target helper function to read value into GByteArray, target
> + * supplies the size and target endianess via the MemOp.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, void *val)
> +{
> +    unsigned bytes =3D memop_size(op);
> +
> +    if (op & MO_BSWAP) {
> +        uint8_t *ptr =3D &((uint8_t *) val)[bytes - 1];
> +        for (unsigned i =3D bytes; i > 0; i--) {
> +            g_byte_array_append(buf, ptr--, 1);
> +        };

I forgot to fix this up. Hopefully the following seems a little less
like pointer abuse:

/*
 * Target helper function to read value into GByteArray, target
 * supplies the size and target endianess via the MemOp.
 */
int gdb_get_register_value(MemOp op, GByteArray *buf, void *val)
{
    unsigned bytes =3D memop_size(op);
    uint8_t *data =3D val;

    if (op & MO_BSWAP) {
        uint8_t *ptr =3D &data[bytes - 1];
        do {
            g_byte_array_append(buf, ptr--, 1);
        } while (ptr >=3D data);
    } else {
        g_byte_array_append(buf, val, bytes);
    }

    return bytes;
}


> +    } else {
> +        g_byte_array_append(buf, val, bytes);
> +    }
> +
> +    return bytes;
> +}
> +
> +
>  static void gdb_register_feature(CPUState *cpu, int base_reg,
>                                   gdb_get_reg_cb get_reg, gdb_set_reg_cb =
set_reg,
>                                   const GDBFeature *feature)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
