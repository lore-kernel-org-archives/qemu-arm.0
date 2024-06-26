Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7287b7e17asm87340966b.222.2024.06.26.09.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:15:10 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 790D95F8AA;
	Wed, 26 Jun 2024 17:15:09 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org
Subject: Re: [PATCH 2/6] tests/tcg/aarch64: Fix test architecture specification
In-Reply-To: <20240626-tcg-v1-2-0bad656307d8@daynix.com> (Akihiko Odaki's
	message of "Wed, 26 Jun 2024 20:26:23 +0900")
References: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
	<20240626-tcg-v1-2-0bad656307d8@daynix.com>
Date: Wed, 26 Jun 2024 17:15:09 +0100
Message-ID: <87zfr7of3m.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: e3oRHG8kpXVr

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> sme-smopa-2.c requires sme-i16i64 but the compiler option used not to
> specify it. Instead, the extension was specified with the inline
> assembly, resulting in mixing assembly code targeting sme-i1664 and C
> code that does not target sme-i1664.
>
> clang version 18.1.6 does not support such mixing so properly specify
> the extension with the compiler option instead.

Also with gcc on aarch64.ci.qemu.org (Ubuntu 22.04.4 LTS) I get:

  16:05:44 [alex@aarch64:~/l/q/b/all] plugins/next|=E2=9C=9A1=E2=80=A6(+0/-=
0) + make run-tcg-tests-aarch64-linux-user
  ninja: no work to do.
  /home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/meson introspect --targets=
 --tests --benchmarks | /home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/pyth=
on3 -B scripts/mtest2make.py > Makefile.mtest
    BUILD   aarch64-linux-user guest-tests
  tests/tcg/aarch64-linux-user: -march=3Darmv8.1-a+sve detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.1-a+sve2 detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.2-a detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.3-a detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.5-a detected
  tests/tcg/aarch64-linux-user: -mbranch-protection=3Dstandard detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.5-a+memtag detected
  tests/tcg/aarch64-linux-user: -Wa,-march=3Darmv9-a+sme detected
  tests/tcg/aarch64-linux-user: -Wa,-march=3Darmv9-a+sme-i16i64 not detected
  cc1: error: unknown value =E2=80=98armv9-a+sme=E2=80=99 for =E2=80=98-mar=
ch=E2=80=99
  cc1: note: valid arguments are: armv8-a armv8.1-a armv8.2-a armv8.3-a arm=
v8.4-a armv8.5-a armv8.6-a armv8-r native
  make[1]: *** [Makefile:116: sme-outprod1] Error 1
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:50: build-tcg-=
tests-aarch64-linux-user] Error 2
  16:08:32 [alex@aarch64:~/l/q/b/all] plugins/next|=E2=9C=9A1=E2=80=A6(+0/-=
0) 2 +=20
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  tests/tcg/aarch64/sme-smopa-2.c   |  2 +-
>  tests/tcg/aarch64/Makefile.target | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/tests/tcg/aarch64/sme-smopa-2.c b/tests/tcg/aarch64/sme-smop=
a-2.c
> index c9f48c3bfca2..2c9707065992 100644
> --- a/tests/tcg/aarch64/sme-smopa-2.c
> +++ b/tests/tcg/aarch64/sme-smopa-2.c
> @@ -14,7 +14,7 @@ int main()
>      long svl;
>=20=20
>      /* Validate that we have a wide enough vector for 4 elements. */
> -    asm(".arch armv8-r+sme-i64\n\trdsvl %0, #1" : "=3Dr"(svl));
> +    asm("rdsvl %0, #1" : "=3Dr"(svl));
>      if (svl < 32) {
>          return 0;
>      }
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 70d728ae9af7..f53a1d615c21 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -27,7 +27,8 @@ config-cc.mak: Makefile
>  	    $(call cc-option,-march=3Darmv8.5-a,              CROSS_CC_HAS_ARMV=
8_5); \
>  	    $(call cc-option,-mbranch-protection=3Dstandard,  CROSS_CC_HAS_ARMV=
8_BTI); \
>  	    $(call cc-option,-march=3Darmv8.5-a+memtag,       CROSS_CC_HAS_ARMV=
8_MTE); \
> -	    $(call cc-option,-Wa$(COMMA)-march=3Darmv9-a+sme, CROSS_AS_HAS_ARMV=
9_SME)) 3> config-cc.mak
> +	    $(call cc-option,-Wa$(COMMA)-march=3Darmv9-a+sme, CROSS_AS_HAS_ARMV=
9_SME); \
> +	    $(call cc-option,-Wa$(COMMA)-march=3Darmv9-a+sme-i16i64, CROSS_AS_H=
AS_ARMV9_SME_I1664)) 3> config-cc.mak
>  -include config-cc.mak
>=20=20
>  ifneq ($(CROSS_CC_HAS_ARMV8_2),)
> @@ -68,7 +69,14 @@ endif
>=20=20
>  # SME Tests
>  ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
> -AARCH64_TESTS +=3D sme-outprod1 sme-smopa-1 sme-smopa-2
> +AARCH64_TESTS +=3D sme-outprod1 sme-smopa-1
> +sme-%: CFLAGS +=3D -march=3Darmv9-a+sme
> +endif
> +
> +# SME I16I64 Tests
> +ifneq ($(CROSS_AS_HAS_ARMV9_SME_I1664),)
> +AARCH64_TESTS +=3D sme-smopa-2
> +sme-smopa-2: CFLAGS +=3D -march=3Darmv9-a+sme-i16i64+sme
>  endif
>=20=20
>  # System Registers Tests

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
