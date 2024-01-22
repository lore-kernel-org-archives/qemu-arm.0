Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q20-20020a05600c46d400b0040e395cd20bsm44319389wmo.7.2024.01.22.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 15:19:05 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 81C005F794;
	Mon, 22 Jan 2024 23:19:05 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  David Hildenbrand <david@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  qemu-s390x@nongnu.org
Subject: Re: [PATCH v3 3/3] tests/tcg: Add the PROT_NONE gdbstub test
In-Reply-To: <aybsdiscvgcl5kici5lfupjtykvkyw4u5g3bdncmv3wufzwgou@r42zm6labldl>
	(Ilya Leoshkevich's message of "Mon, 22 Jan 2024 22:31:08 +0100")
References: <20240116003551.75168-1-iii@linux.ibm.com>
	<20240116003551.75168-4-iii@linux.ibm.com>
	<871qa9nz2f.fsf@draig.linaro.org>
	<aybsdiscvgcl5kici5lfupjtykvkyw4u5g3bdncmv3wufzwgou@r42zm6labldl>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 22 Jan 2024 23:19:05 +0000
Message-ID: <87jzo1lzx2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LFMiyjnW80v9

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On Mon, Jan 22, 2024 at 03:54:32PM +0000, Alex Benn=C3=A9e wrote:
>> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>>=20
>> > Make sure that qemu gdbstub, like gdbserver, allows reading from and
>> > writing to PROT_NONE pages.
>> >
>> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> > ---
>> >  tests/tcg/multiarch/Makefile.target      |  9 +++++-
>> >  tests/tcg/multiarch/gdbstub/prot-none.py | 22 +++++++++++++
>> >  tests/tcg/multiarch/prot-none.c          | 40 ++++++++++++++++++++++++
>> >  3 files changed, 70 insertions(+), 1 deletion(-)
>> >  create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
>> >  create mode 100644 tests/tcg/multiarch/prot-none.c
>
> [...]
>
>> > +def run_test():
>> > +    """Run through the tests one by one"""
>> > +    gdb.Breakpoint("break_here")
>> > +    gdb.execute("continue")
>> > +    val =3D gdb.parse_and_eval("*(char[2] *)q").string()
>>=20
>> Better traceback:
>>=20
>>   Breakpoint 1, break_here (q=3D0x400000802fff) at /home/alex/lsrc/qemu.=
git/tests/tcg/multiarch/prot-none.c:14
>>   14      }
>>   GDB Exception:
>>   Traceback (most recent call last):
>>     File "/home/alex/lsrc/qemu.git/tests/guest-debug/test_gdbstub.py", l=
ine 42, in main
>>       test()
>>     File "./tests/tcg/multiarch/gdbstub/prot-none.py", line 14, in run_t=
est
>>       val =3D gdb.parse_and_eval("*(char[2] *)q").string()
>>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   gdb.MemoryError: Cannot access memory at address 0x400000802fff
>>   Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
>>   Type "help", "copyright", "credits" or "license" for more information.
>>   (InteractiveConsole)
>>   >>>=20
>
> Thanks for the debug output. This shows that the feature being tested
> doesn't work (the value of `q` looks sane to me). May I ask what host
> distro is this? I tried on x86_64 Fedora 38 and x86_64 Ubuntu 22.04 so
> far, and the test was successful.

Debian Bookworm (x86_64) with gdb-multiarch installed.
>
> [...]

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
