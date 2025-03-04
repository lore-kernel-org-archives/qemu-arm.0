Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbb15841dsm93424975e9.1.2025.03.04.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:44:46 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5E6555F93C;
	Tue,  4 Mar 2025 13:44:45 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Brian Cain
 <brian.cain@oss.qualcomm.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on
 sha1.c
In-Reply-To: <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
	(Peter Maydell's message of "Tue, 4 Mar 2025 12:51:34 +0000")
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
	<87o6yh57r2.fsf@draig.linaro.org>
	<CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Mar 2025 13:44:45 +0000
Message-ID: <87ikoo6hbm.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kHrTyB6YLFma

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 4 Mar 2025 at 11:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > +# GCC versions 12/13/14/15 at least incorrectly complain about
>> > +# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the=
 gcc bug
>> > +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106709
>> > +# Since this is just a standard piece of library code we've borrowed =
for a
>> > +# TCG test case, suppress the warning rather than trying to modify the
>> > +# code to work around the compiler.
>> > +sha1: CFLAGS+=3D-Wno-stringop-overread
>> > +
>>
>> Sadly this breaks the hexagon compiler:
>>
>>   error: unknown warning option '-Wno-stringop-overread' [-Werror,-Wunkn=
own-warning-option]
>>   Traceback (most recent call last):
>>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 683, in=
 <module>
>>       sys.exit(main())
>>                ^^^^^^
>>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 679, in=
 main
>>       return args.cmdobj.run(args, argv)
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 657, in=
 run
>>       return Docker().run(cmd, False, quiet=3Dargs.quiet,
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 370, in=
 run
>>       ret =3D self._do_check(["run", "--rm", "--label",
>>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 247, in=
 _do_check
>>       return subprocess.check_call(self._command + cmd, **kwargs)
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>     File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
>>       raise CalledProcessError(retcode, cmd)
>>   subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--l=
abel', 'com.qemu.instance.uuid=3D5bbb7b6ed2ea4377b9b6d646859ec4ea', '--user=
ns=3Dkeep-id', '-u', '1000', '-w', '/home/alex/lsrc/qemu.git/builds/all/tes=
ts/tcg/hexagon-linux-user', '-v', '/home/alex/lsrc/qemu.git/builds/all/test=
s/tcg/hexagon-linux-user:/home/alex/lsrc/qemu.git/builds/all/tests/tcg/hexa=
gon-linux-user:rw', '-v', '/home/alex/lsrc/qemu.git:/home/alex/lsrc/qemu.gi=
t:ro,z', 'qemu/debian-hexagon-cross', 'hexagon-unknown-linux-musl-clang', '=
-Wno-incompatible-pointer-types', '-Wno-undefined-internal', '-fno-unroll-l=
oops', '-fno-stack-protector', '-Wall', '-Werror', '-O0', '-g', '-fno-stric=
t-aliasing', '-Wno-stringop-overread', '-mv73', '-O2', '-static', '/home/al=
ex/lsrc/qemu.git/tests/tcg/multiarch/sha1.c', '-o', 'sha1', '-static']' ret=
urned non-zero exit status 1.
>>   filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D5bbb7b6ed2ea4377b=
9b6d646859ec4ea
>>   make[1]: *** [Makefile:122: sha1] Error 1
>>   make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build-t=
cg-tests-hexagon-linux-user] Error 2
>>
>> Is it that new an option?
>
> I think it's new-ish (gcc 11?). On the other hand
> -Wno-unknown-warning-option is quite old, and would suppress
> this error. If we do
>  CFLAGS+=3D-Wno-unknown-warning-option -Wno-stringop-overread
>
> does that work?

Yes, I did:

modified   tests/tcg/hexagon/Makefile.target
@@ -18,7 +18,7 @@
 # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
 EXTRA_RUNS =3D
=20
-CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal
+CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal -Wno-u=
nknown-warning-option
 CFLAGS +=3D -fno-unroll-loops -fno-stack-protector


>
> (Meson has cc.get_supported_arguments() that we can use to
> filter out -Wfoo/-Wno-foo options that the compiler doesn't
> support, but since this is built via a makefile rather than
> by meson that's not conveniently accessible.)
>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
