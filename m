Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b0040eabc7cfacsm5209276wmb.16.2024.01.22.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:43:55 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 502AC5F7AE;
	Mon, 22 Jan 2024 15:43:55 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  David Hildenbrand <david@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  qemu-s390x@nongnu.org
Subject: Re: [PATCH v3 3/3] tests/tcg: Add the PROT_NONE gdbstub test
In-Reply-To: <20240116003551.75168-4-iii@linux.ibm.com> (Ilya Leoshkevich's
	message of "Tue, 16 Jan 2024 01:31:42 +0100")
References: <20240116003551.75168-1-iii@linux.ibm.com>
	<20240116003551.75168-4-iii@linux.ibm.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 22 Jan 2024 15:43:55 +0000
Message-ID: <877ck1nzk4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1K2o4jYwKXYT

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Make sure that qemu gdbstub, like gdbserver, allows reading from and
> writing to PROT_NONE pages.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Hmm I'm seeing the test hang and drop to the interactive python shell:

    TEST    basic gdbstub support on aarch64
  Failed to read a valid object file image from memory.
  qemu-aarch64: QEMU: Terminated via GDBstub
    TEST    basic gdbstub qXfer:auxv:read support on aarch64
  Failed to read a valid object file image from memory.
  qemu-aarch64: QEMU: Terminated via GDBstub
    TEST    proc mappings support on aarch64
  Failed to read a valid object file image from memory.
  qemu-aarch64: QEMU: Terminated via GDBstub
    TEST    hitting a breakpoint on non-main thread on aarch64
  Failed to read a valid object file image from memory.
  qemu-aarch64: QEMU: Terminated via GDBstub
    TEST    checking register enumeration on aarch64
  Failed to read a valid object file image from memory.
  qemu-aarch64: QEMU: Terminated via GDBstub
    TEST    accessing PROT_NONE memory on aarch64
  Failed to read a valid object file image from memory.
  Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  (InteractiveConsole)

> ---
>  tests/tcg/multiarch/Makefile.target      |  9 +++++-
>  tests/tcg/multiarch/gdbstub/prot-none.py | 22 +++++++++++++
>  tests/tcg/multiarch/prot-none.c          | 40 ++++++++++++++++++++++++
>  3 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
>  create mode 100644 tests/tcg/multiarch/prot-none.c
>
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Ma=
kefile.target
> index d31ba8d6ae4..315a2e13588 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -101,13 +101,20 @@ run-gdbstub-registers: sha512
>  		--bin $< --test $(MULTIARCH_SRC)/gdbstub/registers.py, \
>  	checking register enumeration)
>=20=20
> +run-gdbstub-prot-none: prot-none
> +	$(call run-test, $@, env PROT_NONE_PY=3D1 $(GDB_SCRIPT) \
> +		--gdb $(GDB) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/prot-none.py, \
> +	accessing PROT_NONE memory)
> +
>  else
>  run-gdbstub-%:
>  	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst =
-%,,$(TARGET_NAME)) support")
>  endif
>  EXTRA_RUNS +=3D run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
>  	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint \
> -	      run-gdbstub-registers
> +	      run-gdbstub-registers run-gdbstub-prot-none
>=20=20
>  # ARM Compatible Semi Hosting Tests
>  #
> diff --git a/tests/tcg/multiarch/gdbstub/prot-none.py b/tests/tcg/multiar=
ch/gdbstub/prot-none.py
> new file mode 100644
> index 00000000000..f1f1dd82cbe
> --- /dev/null
> +++ b/tests/tcg/multiarch/gdbstub/prot-none.py
> @@ -0,0 +1,22 @@
> +"""Test that GDB can access PROT_NONE pages.
> +
> +This runs as a sourced script (via -x, via run-test.py).
> +
> +SPDX-License-Identifier: GPL-2.0-or-later
> +"""
> +from test_gdbstub import main, report
> +
> +
> +def run_test():
> +    """Run through the tests one by one"""
> +    gdb.Breakpoint("break_here")
> +    gdb.execute("continue")
> +    val =3D gdb.parse_and_eval("*(char[2] *)q").string()
> +    report(val =3D=3D "42", "{} =3D=3D 42".format(val))
> +    gdb.execute("set *(char[3] *)q =3D \"24\"")
> +    gdb.execute("continue")
> +    exitcode =3D int(gdb.parse_and_eval("$_exitcode"))
> +    report(exitcode =3D=3D 0, "{} =3D=3D 0".format(exitcode))
> +
> +
> +main(run_test)
> diff --git a/tests/tcg/multiarch/prot-none.c b/tests/tcg/multiarch/prot-n=
one.c
> new file mode 100644
> index 00000000000..dc56aadb3c5
> --- /dev/null
> +++ b/tests/tcg/multiarch/prot-none.c
> @@ -0,0 +1,40 @@
> +/*
> + * Test that GDB can access PROT_NONE pages.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <assert.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +void break_here(void *q)
> +{
> +}
> +
> +int main(void)
> +{
> +    long pagesize =3D sysconf(_SC_PAGESIZE);
> +    void *p, *q;
> +    int err;
> +
> +    p =3D mmap(NULL, pagesize * 2, PROT_READ | PROT_WRITE,
> +             MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    assert(p !=3D MAP_FAILED);
> +    q =3D p + pagesize - 1;
> +    strcpy(q, "42");
> +
> +    err =3D mprotect(p, pagesize * 2, PROT_NONE);
> +    assert(err =3D=3D 0);
> +
> +    break_here(q);
> +
> +    err =3D mprotect(p, pagesize * 2, PROT_READ);
> +    assert(err =3D=3D 0);
> +    if (getenv("PROT_NONE_PY")) {
> +        assert(strcmp(q, "24") =3D=3D 0);
> +    }
> +
> +    return EXIT_SUCCESS;
> +}

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
