Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa3bsm9867128a12.16.2025.03.05.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:56:50 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7592B5F932;
	Wed,  5 Mar 2025 16:56:48 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on
 sha1.c
In-Reply-To: <2de21adf-204b-4417-aa2b-2d16d22148f8@oss.qualcomm.com> (Brian
	Cain's message of "Wed, 5 Mar 2025 08:56:26 -0600")
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
	<87o6yh57r2.fsf@draig.linaro.org>
	<CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
	<2de21adf-204b-4417-aa2b-2d16d22148f8@oss.qualcomm.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 05 Mar 2025 16:56:48 +0000
Message-ID: <87ikon4drj.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PMFCdtU++J4G

Brian Cain <brian.cain@oss.qualcomm.com> writes:

> On 3/4/2025 6:51 AM, Peter Maydell wrote:
>> On Tue, 4 Mar 2025 at 11:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>> +# GCC versions 12/13/14/15 at least incorrectly complain about
>>>> +# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the=
 gcc bug
>>>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106709
>>>> +# Since this is just a standard piece of library code we've borrowed =
for a
>>>> +# TCG test case, suppress the warning rather than trying to modify the
>>>> +# code to work around the compiler.
>>>> +sha1: CFLAGS+=3D-Wno-stringop-overread
>>>> +
>>> Sadly this breaks the hexagon compiler:
>>>
>>>    error: unknown warning option '-Wno-stringop-overread' [-Werror,-Wun=
known-warning-option]
>>>    Traceback (most recent call last):
>>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 683, =
in <module>
>>>        sys.exit(main())
>>>                 ^^^^^^
>>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 679, =
in main
>>>        return args.cmdobj.run(args, argv)
>>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 657, =
in run
>>>        return Docker().run(cmd, False, quiet=3Dargs.quiet,
>>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 370, =
in run
>>>        ret =3D self._do_check(["run", "--rm", "--label",
>>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 247, =
in _do_check
>>>        return subprocess.check_call(self._command + cmd, **kwargs)
>>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>      File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
>>>        raise CalledProcessError(retcode, cmd)
>>>    subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '-=
-label', 'com.qemu.instance.uuid=3D5bbb7b6ed2ea4377b9b6d646859ec4ea', '--us=
erns=3Dkeep-id', '-u', '1000', '-w', '/home/alex/lsrc/qemu.git/builds/all/t=
ests/tcg/hexagon-linux-user', '-v', '/home/alex/lsrc/qemu.git/builds/all/te=
sts/tcg/hexagon-linux-user:/home/alex/lsrc/qemu.git/builds/all/tests/tcg/he=
xagon-linux-user:rw', '-v', '/home/alex/lsrc/qemu.git:/home/alex/lsrc/qemu.=
git:ro,z', 'qemu/debian-hexagon-cross', 'hexagon-unknown-linux-musl-clang',=
 '-Wno-incompatible-pointer-types', '-Wno-undefined-internal', '-fno-unroll=
-loops', '-fno-stack-protector', '-Wall', '-Werror', '-O0', '-g', '-fno-str=
ict-aliasing', '-Wno-stringop-overread', '-mv73', '-O2', '-static', '/home/=
alex/lsrc/qemu.git/tests/tcg/multiarch/sha1.c', '-o', 'sha1', '-static']' r=
eturned non-zero exit status 1.
>>>    filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D5bbb7b6ed2ea437=
7b9b6d646859ec4ea
>>>    make[1]: *** [Makefile:122: sha1] Error 1
>>>    make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build=
-tcg-tests-hexagon-linux-user] Error 2
>>>
>>> Is it that new an option?
>> I think it's new-ish (gcc 11?). On the other hand
>
>
> I was going to volunteer to update the toolchain used for hexagon to
> address this.=C2=A0 But unfortunately this warning is still not supported
> in clang 21.
>
> https://github.com/llvm/llvm-project/issues/72455 sounds like it's not
> very likely to arrive any time soon.
>
>
> So "-Wno-unknown-warning-option" does indeed seem like a good workaround.
>
>
>> -Wno-unknown-warning-option is quite old, and would suppress
>> this error. If we do
>>   CFLAGS+=3D-Wno-unknown-warning-option -Wno-stringop-overread

Workaround is fine for the time being then.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
