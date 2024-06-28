Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf61f4dsm75794566b.71.2024.06.28.05.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:30:50 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7DA815F7A1;
	Fri, 28 Jun 2024 13:30:49 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/6] tests/tcg/aarch64: Fix inline assemblies for clang
In-Reply-To: <20240627-tcg-v2-0-1690a813348e@daynix.com> (Akihiko Odaki's
	message of "Thu, 27 Jun 2024 22:58:01 +0900")
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
Date: Fri, 28 Jun 2024 13:30:49 +0100
Message-ID: <87v81tntae.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jwoXu33VFreJ

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Unlike GCC, clang checks if the operands in assembly matches with the
> type in C. It also does not support "x" constraint for AArch64 and
> complains about them.

I guess there are more needed:

  ninja: no work to do.
  /home/alex/lsrc/qemu.git/builds/all.clang/pyvenv/bin/meson introspect --t=
argets --tests --benchmarks | /home/alex/lsrc/qemu.git/builds/all.clang/pyv=
env/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
    BUILD   aarch64-linux-user guest-tests
  tests/tcg/aarch64-linux-user: -march=3Darmv8.1-a+sve detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.1-a+sve2 detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.2-a detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.3-a detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.5-a detected
  tests/tcg/aarch64-linux-user: -mbranch-protection=3Dstandard detected
  tests/tcg/aarch64-linux-user: -march=3Darmv8.5-a+memtag detected
  tests/tcg/aarch64-linux-user: -Wa,-march=3Darmv9-a+sme detected
  tests/tcg/aarch64-linux-user: -march=3Darmv9-a+sme-i16i64 not detected
  <inline asm>:11:2: error: instruction requires: sve or sme
          ptrue p0.s, vl4
          ^
  <inline asm>:12:2: error: instruction requires: sve or sme
          fmov z0.s, #1.0
          ^
  <inline asm>:20:2: error: instruction requires: sve or sme
          st1w {z0.s}, p0, [x0]
          ^
  <inline asm>:22:2: error: instruction requires: sve or sme
          st1w {z1.s}, p0, [x0]
          ^
  <inline asm>:24:2: error: instruction requires: sve or sme
          st1w {z2.s}, p0, [x0]
          ^
  <inline asm>:26:2: error: instruction requires: sve or sme
          st1w {z3.s}, p0, [x0]
          ^
  6 errors generated.
  make[1]: *** [Makefile:116: sme-outprod1] Error 1
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:50: build-tcg-=
tests-aarch64-linux-user] Error 2

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Changes in v2:
> - Removed spurious a compiler flag change for normal SME tests.
> - Fixed sme-i16i64 detection.
> - Link to v1: https://lore.kernel.org/r/20240626-tcg-v1-0-0bad656307d8@da=
ynix.com
>
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
>  tests/tcg/aarch64/Makefile.target |  11 +-
>  tests/tcg/aarch64/fcvt.ref        | 604 +++++++++++++++++++-------------=
------
>  7 files changed, 330 insertions(+), 321 deletions(-)
> ---
> base-commit: 046a64b9801343e2e89eef10c7a48eec8d8c0d4f
> change-id: 20240624-tcg-bf8116e80afa
>
> Best regards,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
