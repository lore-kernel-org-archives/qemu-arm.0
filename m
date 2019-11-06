Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 189sm3864326wmc.7.2019.11.06.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 06:18:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2223F1FF87;
	Wed,  6 Nov 2019 14:18:10 +0000 (GMT)
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-4-beata.michalska@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Beata Michalska <beata.michalska@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, pbonzini@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, eric.auger@redhat.com,
 shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 3/4] migration: ram: Switch to ram block writeback
In-reply-to: <20191105234100.22052-4-beata.michalska@linaro.org>
Date: Wed, 06 Nov 2019 14:18:10 +0000
Message-ID: <87lfsthyvx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3ABivj4iqNYj


Beata Michalska <beata.michalska@linaro.org> writes:

> Switch to ram block writeback for pmem migration.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  migration/ram.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 5078f94..38070f1 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -33,7 +33,6 @@
>  #include "qemu/bitops.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/main-loop.h"
> -#include "qemu/pmem.h"
>  #include "xbzrle.h"
>  #include "ram.h"
>  #include "migration.h"
> @@ -3981,9 +3980,7 @@ static int ram_load_cleanup(void *opaque)
>      RAMBlock *rb;
>
>      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> -        if (ramblock_is_pmem(rb)) {
> -            pmem_persist(rb->host, rb->used_length);
> -        }
> +        qemu_ram_block_writeback(rb);
>      }
>
>      xbzrle_load_cleanup();


--
Alex Benn=C3=A9e
