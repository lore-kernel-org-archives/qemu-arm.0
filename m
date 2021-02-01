Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n193sm21453367wmb.0.2021.02.01.05.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 05:27:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E65CC1FF7E;
	Mon,  1 Feb 2021 13:27:16 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-3-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Richard Henderson
 <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Claudio Fontana <cfontana@suse.de>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 02/11] exec: Restrict TCG specific headers
Date: Mon, 01 Feb 2021 13:24:26 +0000
In-reply-to: <20210131115022.242570-3-f4bug@amsat.org>
Message-ID: <87wnvrvryj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: k7p00A5pLFUc


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Fixes when building with --disable-tcg on ARM:
>
>   In file included from target/arm/helper.c:16:
>   include/exec/helper-proto.h:42:10: fatal error: tcg-runtime.h: No such =
file or directory
>      42 | #include "tcg-runtime.h"
>         |          ^~~~~~~~~~~~~~~

I think the problem here is that we have stuff in helper.c which is
needed by non-TCG builds.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/exec/helper-proto.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index 659f9298e8f..740bff3bb4d 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -39,8 +39,10 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2)=
, dh_ctype(t3), \
>=20=20
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
> +#ifdef CONFIG_TCG
>  #include "tcg-runtime.h"
>  #include "plugin-helpers.h"
> +#endif /* CONFIG_TCG */

If we are including helper-proto.h then we are defining helpers which
are (should be) TCG only.

>=20=20
>  #undef IN_HELPER_PROTO


--=20
Alex Benn=C3=A9e
