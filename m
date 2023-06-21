Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s10-20020a5d69ca000000b003047ea78b42sm4065316wrw.43.2023.06.21.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:24:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5102C1FFBB;
	Wed, 21 Jun 2023 11:24:21 +0100 (BST)
References: <20230606132743.1386003-1-iii@linux.ibm.com>
 <20230606132743.1386003-9-iii@linux.ibm.com>
User-agent: mu4e 1.11.6; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v3 8/8] tests/tcg: Add a test for info proc mappings
Date: Wed, 21 Jun 2023 11:21:54 +0100
In-reply-to: <20230606132743.1386003-9-iii@linux.ibm.com>
Message-ID: <87legdglka.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: EcZSQjNWOHxL


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Add a small test to prevent regressions.
> Since there are issues with how GDB interprets QEMU's target.xml,
> enable the test only on aarch64 and s390x for now.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/aarch64/Makefile.target             |  3 +-
>  tests/tcg/multiarch/Makefile.target           |  7 +++
>  .../multiarch/gdbstub/test-proc-mappings.py   | 55 +++++++++++++++++++
>  tests/tcg/s390x/Makefile.target               |  2 +-
>  4 files changed, 65 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py
>
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 03157954871..38402b0ba1f 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -97,7 +97,8 @@ run-gdbstub-sve-ioctls: sve-ioctls
>  		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
>  	basic gdbstub SVE ZLEN support)
>=20=20
> -EXTRA_RUNS +=3D run-gdbstub-sysregs run-gdbstub-sve-ioctls
> +EXTRA_RUNS +=3D run-gdbstub-sysregs run-gdbstub-sve-ioctls \
> +              run-gdbstub-proc-mappings
>  endif
>  endif
>=20=20
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Ma=
kefile.target
> index 373db696481..cbc0b75787a 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -81,6 +81,13 @@ run-gdbstub-qxfer-auxv-read: sha1
>  		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
>  	basic gdbstub qXfer:auxv:read support)
>=20=20
> +run-gdbstub-proc-mappings: sha1
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-proc-mappings.py, \
> +	proc mappings support)
> +

I wondered if it makes more sense to keep the extra test configuration
logic in multiarch:

  run-gdbstub-proc-mappings: sha1
          $(call run-test, $@, $(GDB_SCRIPT) \
                  --gdb $(HAVE_GDB_BIN) \
                  --qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
                  --bin $< --test $(MULTIARCH_SRC)/gdbstub/test-proc-mappin=
gs.py, \
          proc mappings support)

  # only enable for s390x and aarch64 for now
  ifneq (,$(findstring aarch64,$(TARGET_NAME)))
  EXTRA_RUNS +=3D run-gdbstub-proc-mappings
  else ifneq (,$(findstring s390x,$(TARGET_NAME)))
  EXTRA_RUNS +=3D run-gdbstub-proc-mappings
  endif

but it still ends up pretty ugly. Is the gdb handling fixed for other
arches in other versions. Maybe we could probe gdb for support and wrap
the whole stanza in something like:

  ifeq ($(HOST_GDB_SUPPORTS_PROC_MAPPING),y)
  ...
  endif

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
