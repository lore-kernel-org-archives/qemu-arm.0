Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u25sm9343422wmc.3.2019.06.17.04.39.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 04:39:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1FB781FF87;
	Mon, 17 Jun 2019 12:39:19 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-6-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Samuel Ortiz
 <sameo@linux.intel.com>, Robert Bradford <robert.bradford@intel.com>
Subject: Re: [Qemu-arm] [PATCH v2 05/23] target/arm: Add copyright boilerplate
In-reply-to: <20190615154352.26824-6-philmd@redhat.com>
Date: Mon, 17 Jun 2019 12:39:19 +0100
Message-ID: <875zp4bfvc.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iFW/tgFAzj9t


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index df4276f5f6..d3f3cb57d5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1,3 +1,10 @@
> +/*
> + * ARM generic helpers.
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "target/arm/idau.h"


--
Alex Benn=C3=A9e
