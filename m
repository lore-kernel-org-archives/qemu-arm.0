Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c8sm7551068wrr.49.2019.09.11.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 01:20:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C015E1FF87;
	Wed, 11 Sep 2019 09:20:17 +0100 (BST)
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-4-alex.bennee@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH  v1 3/4] elf: move elf_ops.h into include/elf/ and rename
In-reply-to: <20190910193408.28917-4-alex.bennee@linaro.org>
Date: Wed, 11 Sep 2019 09:20:17 +0100
Message-ID: <878sqv1by6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PMsfzV/M745h


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Lets keep all the Elf manipulation bits together. Also rename the file
> to better reflect how it is used and add a little header to the file.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/core/loader.c                            | 4 ++--

It is arguable this could be a private header in hw/core as it is only
included in one place.

>  include/{hw/elf_ops.h =3D> elf/elf_ops.inc.h} | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
>  rename include/{hw/elf_ops.h =3D> elf/elf_ops.inc.h} (98%)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index e0c6563e643..886179a4947 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -302,7 +302,7 @@ static void *load_at(int fd, off_t offset, size_t siz=
e)
>  #define elf_word        uint32_t
>  #define elf_sword        int32_t
>  #define bswapSZs	bswap32s
> -#include "hw/elf_ops.h"
> +#include "elf/elf_ops.inc.h"
>
>  #undef elfhdr
>  #undef elf_phdr
> @@ -324,7 +324,7 @@ static void *load_at(int fd, off_t offset, size_t siz=
e)
>  #define elf_sword        int64_t
>  #define bswapSZs	bswap64s
>  #define SZ		64
> -#include "hw/elf_ops.h"
> +#include "elf/elf_ops.inc.h"
>
>  const char *load_elf_strerror(int error)
>  {
> diff --git a/include/hw/elf_ops.h b/include/elf/elf_ops.inc.h
> similarity index 98%
> rename from include/hw/elf_ops.h
> rename to include/elf/elf_ops.inc.h
> index 1496d7e7536..a820bd821d5 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/elf/elf_ops.inc.h
> @@ -1,3 +1,12 @@
> +/*
> + * Macro expansions for Elf operations. This is included in a
> + * compilation unit with appropriate definitions for SZ and elf
> + * headers to generate utility functions for reading 32 and 64 bit elf
> + * headers.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
>  static void glue(bswap_ehdr, SZ)(struct elfhdr *ehdr)
>  {
>      bswap16s(&ehdr->e_type);			/* Object file type */


--
Alex Benn=C3=A9e
