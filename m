Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3a5acsm81582866b.137.2025.06.06.01.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 01:44:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CDBFA5F7E1;
	Fri, 06 Jun 2025 09:44:52 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  Glenn Miles
 <milesg@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Stefan Berger <stefanb@linux.vnet.ibm.com>,
  Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/4] system: Forbid alloca()
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Jun 2025 21:35:36
 +0200")
References: <20250605193540.59874-1-philmd@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 06 Jun 2025 09:44:52 +0100
Message-ID: <87h60t5ke3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DK8DkLpOOO35

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Eradicate alloca() uses on system code, then enable
> -Walloca to prevent new ones to creep back in.

Should we also mention it in style.rst:

  Use of the ``malloc/free/realloc/calloc/valloc/memalign/posix_memalign``
  APIs is not allowed in the QEMU codebase. Instead of these routines,

>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/gpio/pca9552: Avoid using g_newa()
>   backends/tpmL Avoid using g_alloca()
>   tests/unit/test-char: Avoid using g_alloca()
>   buildsys: Prohibit alloca() use on system code
>
>  meson.build                 | 4 ++++
>  backends/tpm/tpm_emulator.c | 4 ++--
>  hw/gpio/pca9552.c           | 2 +-
>  tests/unit/test-char.c      | 3 +--
>  4 files changed, 8 insertions(+), 5 deletions(-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
