Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf633desm76225966b.73.2024.06.28.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:33:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9A2125F7A1;
	Fri, 28 Jun 2024 13:33:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/6] tests/tcg/arm: Fix fcvt result messages
In-Reply-To: <20240627-tcg-v2-1-1690a813348e@daynix.com> (Akihiko Odaki's
	message of "Thu, 27 Jun 2024 22:58:02 +0900")
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
	<20240627-tcg-v2-1-1690a813348e@daynix.com>
Date: Fri, 28 Jun 2024 13:33:46 +0100
Message-ID: <87r0chnt5h.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ENE3h6cX4Rk1

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> The test cases for "converting double-precision to single-precision"
> emits float but the result variable was typed as uint32_t and corrupted
> the printed values. Propertly type it as float.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Fixes: 8ec8a55e3fc9 ("tests/tcg/arm: add fcvt test cases for AArch32/64")
> ---
>  tests/tcg/arm/fcvt.c       |   2 +-
>  tests/tcg/aarch64/fcvt.ref | 604 ++++++++++++++++++++++-----------------=
------
>  2 files changed, 303 insertions(+), 303 deletions(-)

Queued to testing/next, thanks. I'll take the rest of the clang bits
when the remaining cases are ironed out.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
