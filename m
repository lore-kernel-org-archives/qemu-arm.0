Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x7sm5049962wrq.41.2020.01.08.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 11:55:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3F3281FF87;
	Wed,  8 Jan 2020 19:55:58 +0000 (GMT)
References: <20200108150252.6216-1-alex.bennee@linaro.org>
 <20200108150252.6216-7-alex.bennee@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, keithp@keithp.com, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH  v3 6/6] tests/tcg: add user version of dumb-as-bricks
 semiconsole test
In-reply-to: <20200108150252.6216-7-alex.bennee@linaro.org>
Date: Wed, 08 Jan 2020 19:55:58 +0000
Message-ID: <87a76xk9ip.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xfiQMUk+Rc9b


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> There are linux-user users of semihosting so we'd better check things
> work for them as well.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v3
>   - include aarch64 version
> v4
>   - use common semicall.h, test thumb & arm
> ---
>  tests/tcg/arm/semiconsole.c       | 27 +++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  7 +++++++
>  tests/tcg/arm/Makefile.target     | 19 +++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 tests/tcg/arm/semiconsole.c
>
> diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/arm/semiconsole.c
> new file mode 100644
> index 00000000000..6ef0bd24500
> --- /dev/null
> +++ b/tests/tcg/arm/semiconsole.c
> @@ -0,0 +1,27 @@
> +/*
> + * linux-user semihosting console
> + *
> + * Copyright (c) 2019
> + * Written by Alex Benn=C3=A9e <alex.bennee@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-3.0-or-later
> + */
> +
> +#include <stdio.h>
> +#include <stdint.h>
> +#include "semicall.h"
> +
> +int main(void)
> +{
> +    char c;
> +
> +    printf("Semihosting Console Test\n");
> +    printf("hit X to exit:");
> +
> +    do {
> +        c =3D __semi_call(SYS_READC, 0);
> +        printf("got '%c'\n", c);
> +    } while (c !=3D 'X');
> +
> +    return 0;
> +}
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 96d2321045a..4281c766419 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -32,4 +32,11 @@ run-plugin-semihosting-with-%:
>  		 $(call strip-plugin,$<) 2> $<.err, \
>  		"$< on $(TARGET_NAME) with $*")
>=20=20
> +AARCH64_TESTS +=3D semiconsole
> +run-semiconsole: semiconsole
> +	$(call skip-test, $<, "MANUAL ONLY")
> +
> +run-semiconsole-with-%:

this should be run-plugin-semiconsole-with-%

<snip>
> +run-semiconsole-with-%:
<snip>
> +run-semiconsole-arm-with-%:

ditto for these


--=20
Alex Benn=C3=A9e
