Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bca26676esm36213035e9.8.2025.03.04.03.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 03:56:49 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0D93A5F93C;
	Tue,  4 Mar 2025 11:56:49 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org, Brian Cain
 <brian.cain@oss.qualcomm.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on
 sha1.c
In-Reply-To: <20250227141343.1675415-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 27 Feb 2025 14:13:43 +0000")
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Mar 2025 11:56:49 +0000
Message-ID: <87o6yh57r2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LrPUc2iho1S7

Peter Maydell <peter.maydell@linaro.org> writes:

> GCC versions at least 12 through 15 incorrectly report a warning
> about code in sha1.c:
>
> tests/tcg/multiarch/sha1.c:161:13: warning: =E2=80=98SHA1Transform=E2=80=
=99 reading 64 bytes from a region of size 0 [-Wstringop-overread]
>   161 |             SHA1Transform(context->state, &data[i]);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This is a piece of stock library code for doing SHA1 which we've
> simply copied, rather than writing ourselves. The bug has been
> reported to upstream GCC (about a different library's use of this
> code):
>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106709
>
> For our test case, since this isn't our original code and there isn't
> actually a bug in it, suppress the incorrect warning rather than
> trying to modify the code to work around the compiler issue.
<snip>
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -45,6 +45,14 @@ vma-pthread: LDFLAGS+=3D-pthread
>  sigreturn-sigmask: CFLAGS+=3D-pthread
>  sigreturn-sigmask: LDFLAGS+=3D-pthread
>=20=20
> +# GCC versions 12/13/14/15 at least incorrectly complain about
> +# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the gc=
c bug
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106709
> +# Since this is just a standard piece of library code we've borrowed for=
 a
> +# TCG test case, suppress the warning rather than trying to modify the
> +# code to work around the compiler.
> +sha1: CFLAGS+=3D-Wno-stringop-overread
> +

Sadly this breaks the hexagon compiler:

  error: unknown warning option '-Wno-stringop-overread' [-Werror,-Wunknown=
-warning-option]
  Traceback (most recent call last):
    File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 683, in <m=
odule>
      sys.exit(main())
               ^^^^^^
    File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 679, in ma=
in
      return args.cmdobj.run(args, argv)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 657, in run
      return Docker().run(cmd, False, quiet=3Dargs.quiet,
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 370, in run
      ret =3D self._do_check(["run", "--rm", "--label",
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 247, in _d=
o_check
      return subprocess.check_call(self._command + cmd, **kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
      raise CalledProcessError(retcode, cmd)
  subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--labe=
l', 'com.qemu.instance.uuid=3D5bbb7b6ed2ea4377b9b6d646859ec4ea', '--userns=
=3Dkeep-id', '-u', '1000', '-w', '/home/alex/lsrc/qemu.git/builds/all/tests=
/tcg/hexagon-linux-user', '-v', '/home/alex/lsrc/qemu.git/builds/all/tests/=
tcg/hexagon-linux-user:/home/alex/lsrc/qemu.git/builds/all/tests/tcg/hexago=
n-linux-user:rw', '-v', '/home/alex/lsrc/qemu.git:/home/alex/lsrc/qemu.git:=
ro,z', 'qemu/debian-hexagon-cross', 'hexagon-unknown-linux-musl-clang', '-W=
no-incompatible-pointer-types', '-Wno-undefined-internal', '-fno-unroll-loo=
ps', '-fno-stack-protector', '-Wall', '-Werror', '-O0', '-g', '-fno-strict-=
aliasing', '-Wno-stringop-overread', '-mv73', '-O2', '-static', '/home/alex=
/lsrc/qemu.git/tests/tcg/multiarch/sha1.c', '-o', 'sha1', '-static']' retur=
ned non-zero exit status 1.
  filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D5bbb7b6ed2ea4377b9b6=
d646859ec4ea
  make[1]: *** [Makefile:122: sha1] Error 1
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build-tcg-=
tests-hexagon-linux-user] Error 2

Is it that new an option?

>  # The vma-pthread seems very sensitive on gitlab and we currently
>  # don't know if its exposing a real bug or the test is flaky.
>  ifneq ($(GITLAB_CI),)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
