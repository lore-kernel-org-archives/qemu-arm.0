Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t5sm4751750wmg.43.2019.02.13.08.59.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 08:59:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DBDED1FF80;
	Wed, 13 Feb 2019 16:59:38 +0000 (UTC)
References: <20190205190224.2198-1-alex.bennee@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH  v2 0/6] HWCAP_CPUID registers for aarch64
In-reply-to: <20190205190224.2198-1-alex.bennee@linaro.org>
Date: Wed, 13 Feb 2019 16:59:38 +0000
Message-ID: <87d0nvipz9.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NtHXXzL8YkrP


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> I've re-spun the cpuid patches with the changes suggested by Peter's
> review. The biggest change is the squashing of bits is now all data
> driven with ARMCPRegUserSpaceInfo being used to control how bits are
> altered for userspace presentation. This includes using glob matching
> to set whole bunches to RAZ.

Ping (+ CC'd which I missed on the submission)

>
> The testcase isn't as comprehensive as it could be because you need a
> fairly new compiler (binutils) to emit all the various system register
> id's to test. I did look into upgrading debian-arm64-cross with Buster
> but I managed to find a bug in Debian's dependencies which rules out
> upgrading for now.

We have a newer compiler so I can add more on the next re-spin, reviews
pending.

>
> checkpatch is complaining about the _m macro I used to group together
> words in the masks I defined. I'm not sure adding the spaces makes it
> as readable though.
>
> The following patches need review:
>  patch 0001/target arm relax permission checks for HWCAP_CPUI.patch
>  patch 0002/target arm expose CPUID registers to userspace.patch
>  patch 0003/target arm expose MPIDR_EL1 to userspace.patch
>  patch 0004/target arm expose remaining CPUID registers as RA.patch
>  patch 0006/tests tcg aarch64 userspace system register test.patch
>
>
> Alex Benn=C3=A9e (6):
>   target/arm: relax permission checks for HWCAP_CPUID registers
>   target/arm: expose CPUID registers to userspace
>   target/arm: expose MPIDR_EL1 to userspace
>   target/arm: expose remaining CPUID registers as RAZ
>   linux-user/elfload: enable HWCAP_CPUID for AArch64
>   tests/tcg/aarch64: userspace system register test
>
>  linux-user/elfload.c              |   1 +
>  target/arm/cpu.h                  |  36 +++++++
>  target/arm/helper.c               | 106 ++++++++++++++++--
>  tests/tcg/aarch64/Makefile.target |   4 +-
>  tests/tcg/aarch64/sysregs.c       | 172 ++++++++++++++++++++++++++++++
>  5 files changed, 310 insertions(+), 9 deletions(-)
>  create mode 100644 tests/tcg/aarch64/sysregs.c


--
Alex Benn=C3=A9e
