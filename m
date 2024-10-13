Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99ef8c4d50sm202868166b.11.2024.10.13.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 08:27:06 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B6E115F8BA;
	Sun, 13 Oct 2024 16:27:05 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Guenter Roeck <linux@roeck-us.net>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,
  qemu-arm@nongnu.org
Subject: Re: [PATCH 00/17] Convert the Avocado tuxrun tests into new
 functional tests
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com> (Thomas Huth's message
	of "Fri, 11 Oct 2024 15:19:17 +0200")
References: <20241011131937.377223-1-thuth@redhat.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Sun, 13 Oct 2024 16:27:05 +0100
Message-ID: <87bjzoaura.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6I2A2AuA8UhI

Thomas Huth <thuth@redhat.com> writes:

> This patch series converts the tests/avocado/tuxrun_baselines.py
> to the new functional test framework. While converting the sh4 test,
> I noticed that the Avocado test was completely broken, so I included
> a fix (revert) for that problem in this series, too.

How can I run them from meson? I don't see them in list (but make
check-functional works). Shouldn't I be able to do:

  ./pyvenv/bin/meson test qemu:func-thorough

?
>
> Thomas Huth (17):
>   tests/functional: Add a base class for the TuxRun tests
>   tests/functional: Convert the Avocado ppc64 tuxrun tests
>   tests/functional: Convert the Avocado aarch64 tuxrun tests
>   tests/functional: Convert the Avocado sparc64 tuxrun test
>   tests/functional: Convert the Avocado s390x tuxrun test
>   tests/functional: Convert the Avocado arm tuxrun tests
>   tests/functional: Convert the Avocado riscv32 tuxrun tests
>   tests/functional: Convert the Avocado riscv64 tuxrun tests
>   tests/functional: Convert the Avocado i386 tuxrun test
>   tests/functional: Convert the Avocado x86_64 tuxrun test
>   tests/functional: Convert the Avocado mips tuxrun test
>   tests/functional: Convert the Avocado mipsel tuxrun test
>   tests/functional: Convert the Avocado mips64 tuxrun test
>   tests/functional: Convert the Avocado mips64el tuxrun test
>   tests/functional: Convert the Avocado ppc32 tuxrun test
>   Revert "hw/sh4/r2d: Realize IDE controller before accessing it"
>   tests/functional: Convert the Avocado sh4 tuxrun test
>
>  MAINTAINERS                              |   4 +-
>  hw/sh4/r2d.c                             |   2 +-
>  tests/avocado/tuxrun_baselines.py        | 620 -----------------------
>  tests/functional/meson.build             |  28 +
>  tests/functional/qemu_test/tuxruntest.py | 158 ++++++
>  tests/functional/test_aarch64_tuxrun.py  |  50 ++
>  tests/functional/test_arm_tuxrun.py      |  70 +++
>  tests/functional/test_i386_tuxrun.py     |  35 ++
>  tests/functional/test_mips64_tuxrun.py   |  35 ++
>  tests/functional/test_mips64el_tuxrun.py |  35 ++
>  tests/functional/test_mips_tuxrun.py     |  36 ++
>  tests/functional/test_mipsel_tuxrun.py   |  36 ++
>  tests/functional/test_ppc64_tuxrun.py    | 110 ++++
>  tests/functional/test_ppc_tuxrun.py      |  35 ++
>  tests/functional/test_riscv32_tuxrun.py  |  38 ++
>  tests/functional/test_riscv64_tuxrun.py  |  38 ++
>  tests/functional/test_s390x_tuxrun.py    |  34 ++
>  tests/functional/test_sh4_tuxrun.py      |  57 +++
>  tests/functional/test_sparc64_tuxrun.py  |  34 ++
>  tests/functional/test_x86_64_tuxrun.py   |  36 ++
>  20 files changed, 869 insertions(+), 622 deletions(-)
>  delete mode 100644 tests/avocado/tuxrun_baselines.py
>  create mode 100644 tests/functional/qemu_test/tuxruntest.py
>  create mode 100755 tests/functional/test_aarch64_tuxrun.py
>  create mode 100755 tests/functional/test_arm_tuxrun.py
>  create mode 100755 tests/functional/test_i386_tuxrun.py
>  create mode 100755 tests/functional/test_mips64_tuxrun.py
>  create mode 100755 tests/functional/test_mips64el_tuxrun.py
>  create mode 100755 tests/functional/test_mips_tuxrun.py
>  create mode 100755 tests/functional/test_mipsel_tuxrun.py
>  create mode 100755 tests/functional/test_ppc64_tuxrun.py
>  create mode 100755 tests/functional/test_ppc_tuxrun.py
>  create mode 100755 tests/functional/test_riscv32_tuxrun.py
>  create mode 100755 tests/functional/test_riscv64_tuxrun.py
>  create mode 100755 tests/functional/test_s390x_tuxrun.py
>  create mode 100755 tests/functional/test_sh4_tuxrun.py
>  create mode 100755 tests/functional/test_sparc64_tuxrun.py
>  create mode 100755 tests/functional/test_x86_64_tuxrun.py

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
