Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u14sm18051328wrm.58.2022.02.02.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 15:17:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1B6EB1FFB7;
	Wed,  2 Feb 2022 23:17:17 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [RFC PATCH  0/4] improve coverage of vector backend
Date: Wed, 02 Feb 2022 23:16:27 +0000
In-reply-to: <20220202191242.652607-1-alex.bennee@linaro.org>
Message-ID: <87k0ecvoxu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Mt8hfvA+0eFi


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi Richard,
>
> While reviewing the TCG vector clean-ups I tried to improve the
> range of instructions we tested. I couldn't get the existing hacky
> sha1 test to vectorise nicely so I snarfed the sha512 algorithm from
> CCAN. The sha512 test is good because it is all purely integer so we
> should be able to use native code on the backend. The test also has
> the nice property of validating behaviour.

Hi Taylor,

You might want to check this out:

=E2=9C=97  ./qemu-hexagon ./tests/tcg/hexagon-linux-user/sha512
1..10
not ok 1 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 2 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 3 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 4 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 5 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 6 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 7 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 8 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 9 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 10 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
# Looks like you failed 10 tests of 10.

Which makes me think either the translation or compiler are wrong.

>
> I did toy with the idea of incorporating CCAN as a submodule because
> there is quite a lot of nice stuff in there we could use for further
> tests. However for now witness the glory of a cut and paste job.
>
> What do you think?
>
>
> Alex Benn=C3=A9e (4):
>   tests/tcg: cleanup sha1 source code
>   tests/tcg: build sha1-vector for SVE and compare
>   tests/tcg: add sha512 test
>   tests/tcg: add vectorised sha512 versions
>
>  tests/tcg/multiarch/sha1.c        |  67 +-
>  tests/tcg/multiarch/sha512.c      | 990 ++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  23 +
>  tests/tcg/i386/Makefile.target    |   6 +
>  tests/tcg/ppc64le/Makefile.target |   5 +-
>  tests/tcg/s390x/Makefile.target   |   9 +
>  tests/tcg/x86_64/Makefile.target  |   7 +
>  7 files changed, 1056 insertions(+), 51 deletions(-)
>  create mode 100644 tests/tcg/multiarch/sha512.c


--=20
Alex Benn=C3=A9e
