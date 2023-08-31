Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d688c000000b0031ae2a7adb5sm2253802wru.85.2023.08.31.06.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 06:43:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 707851FFBB;
	Thu, 31 Aug 2023 14:43:54 +0100 (BST)
References: <20230831131348.69032-1-philmd@linaro.org>
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, Shashi Mallela <shashi.mallela@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/intc/arm_gicv3_its: Avoid maybe-uninitialized error
 in get_vte()
Date: Thu, 31 Aug 2023 14:43:49 +0100
In-reply-to: <20230831131348.69032-1-philmd@linaro.org>
Message-ID: <87zg27nx7p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 226zJSTms4Mr


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Fix when using GCC v11.4 (Ubuntu 11.4.0-1ubuntu1~22.04) with CFLAGS=3D-Og:
>
>   [4/6] Compiling C object libcommon.fa.p/hw_intc_arm_gicv3_its.c.o
>   FAILED: libcommon.fa.p/hw_intc_arm_gicv3_its.c.o
>       inlined from =E2=80=98lookup_vte=E2=80=99 at hw/intc/arm_gicv3_its.=
c:453:9,
>       inlined from =E2=80=98vmovp_callback=E2=80=99 at hw/intc/arm_gicv3_=
its.c:1039:14:
>   hw/intc/arm_gicv3_its.c:347:9: error: =E2=80=98vte.rdbase=E2=80=99 may =
be used uninitialized [-Werror=3Dmaybe-uninitialized]
>     347 |         trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsiz=
e,
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>     348 |                                  vte->vptaddr, vte->rdbase);
>         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/intc/arm_gicv3_its.c: In function =E2=80=98vmovp_callback=E2=80=99:
>   hw/intc/arm_gicv3_its.c:1036:13: note: =E2=80=98vte=E2=80=99 declared h=
ere
>    1036 |     VTEntry vte;
>         |             ^~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
