Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72451fd535sm427734666b.149.2024.06.26.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:09:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0EAFB5F8AA;
	Wed, 26 Jun 2024 15:09:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] tests/tcg/aarch64: Fix inline assemblies for clang
In-Reply-To: <20240626-tcg-v1-0-0bad656307d8@daynix.com> (Akihiko Odaki's
	message of "Wed, 26 Jun 2024 20:26:21 +0900")
References: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
Date: Wed, 26 Jun 2024 15:09:51 +0100
Message-ID: <878qyrpzgw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QbamfiUSavuF

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Unlike GCC, clang checks if the operands in assembly matches with the
> type in C. It also does not support "x" constraint for AArch64 and
> complains about them.

When are the test cases ever built with clang? Is this for Arm on Arm
testing only?

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Akihiko Odaki (6):
>       tests/tcg/arm: Fix fcvt result messages
>       tests/tcg/aarch64: Fix test architecture specification
>       tests/tcg/aarch64: Explicitly specify register width
>       tests/tcg/aarch64: Fix irg operand type
>       tests/tcg/aarch64: Do not use x constraint
>       tests/tcg/arm: Manually bit-cast half-precision numbers
>
>  tests/tcg/aarch64/bti-1.c         |   6 +-
>  tests/tcg/aarch64/bti-3.c         |   6 +-
>  tests/tcg/aarch64/mte-1.c         |   2 +-
>  tests/tcg/aarch64/sme-smopa-2.c   |   2 +-
>  tests/tcg/arm/fcvt.c              |  20 +-
>  tests/tcg/aarch64/Makefile.target |  12 +-
>  tests/tcg/aarch64/fcvt.ref        | 604 +++++++++++++++++++-------------=
------
>  7 files changed, 331 insertions(+), 321 deletions(-)
> ---
> base-commit: 74abb45dac6979e7ff76172b7f0a24e869405184
> change-id: 20240624-tcg-bf8116e80afa
>
> Best regards,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
