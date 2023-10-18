Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p4-20020adfcc84000000b00327de0173f6sm1805357wrj.115.2023.10.18.03.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:32:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 33EA81FFBB;
	Wed, 18 Oct 2023 11:32:42 +0100 (BST)
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
 <2e08cff874b2f9fc4143bdcde87ebba9b70b356c.1697183699.git.manos.pitsidianakis@linaro.org>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Eric Auger <eric.auger@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Richard Henderson
 <richard.henderson@linaro.org>, "open list:ARM SMMU"
 <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 01/78] include/qemu/compiler.h: replace
 QEMU_FALLTHROUGH with fallthrough
Date: Wed, 18 Oct 2023 11:32:14 +0100
In-reply-to: <2e08cff874b2f9fc4143bdcde87ebba9b70b356c.1697183699.git.manos.pitsidianakis@linaro.org>
Message-ID: <871qdsb4qd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: e1EtKWJtqQ2X


Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  audio/pwaudio.c              |  8 ++++----
>  hw/arm/smmuv3.c              |  2 +-
>  include/qemu/compiler.h      | 30 +++++++++++++++++++++++-------
>  include/qemu/osdep.h         |  4 ++--
>  target/loongarch/cpu.c       |  4 ++--
>  target/loongarch/translate.c |  2 +-
>  tcg/optimize.c               |  8 ++++----
>  7 files changed, 37 insertions(+), 21 deletions(-)
>
> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 3ce5f6507b..bf26fadb06 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -1,29 +1,29 @@
>  /*
>   * QEMU PipeWire audio driver
>   *
>   * Copyright (c) 2023 Red Hat Inc.
>   *
>   * Author: Dorinda Bassey       <dbassey@redhat.com>
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>=20=20
> +#include <spa/param/audio/format-utils.h>
> +#include <spa/utils/ringbuffer.h>
> +#include <spa/utils/result.h>
> +#include <spa/param/props.h>
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "audio.h"
>  #include <errno.h>
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -#include <spa/param/audio/format-utils.h>
> -#include <spa/utils/ringbuffer.h>
> -#include <spa/utils/result.h>
> -#include <spa/param/props.h>

Was this an autofmt change sneaking in? osdep.h should always be first
per style.rst.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
