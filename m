Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s24sm4020238wmh.22.2021.01.27.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 16:42:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 050D81FF7E;
	Thu, 28 Jan 2021 00:42:47 +0000 (GMT)
References: <20200929224355.1224017-1-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, Richard Henderson
 <rth@twiddle.net>
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
Date: Thu, 28 Jan 2021 00:41:50 +0000
In-reply-to: <20200929224355.1224017-1-philmd@redhat.com>
Message-ID: <87r1m5x56h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: leoYU04jO0s3


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Cover from Samuel Ortiz from (part 1) [1]:
>
>   This patchset allows for building and running ARM targets with TCG
>   disabled. [...]
>
>   The rationale behind this work comes from the NEMU project where we're
>   trying to only support x86 and ARM 64-bit architectures, without
>   including the TCG code base. We can only do so if we can build and run
>   ARM binaries with TCG disabled.
>
> v4 almost 2 years later... [2]:
> - Rebased on Meson
> - Addressed Richard review comments
> - Addressed Claudio review comments

Have you re-based recently because I was having a look but ran into
merge conflicts. I'd like to get the merged at some point because I ran
into similar issues with the Xen only build without TCG.

>
> v3 almost 18 months later [3]:
> - Rebased
> - Addressed Thomas review comments
> - Added Travis-CI job to keep building --disable-tcg on ARM
>
> v2 [4]:
> - Addressed review comments from Richard and Thomas from v1 [1]
>
> Regards,
>
> Phil.
>
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
> [4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html
>
> Green CI:
> - https://cirrus-ci.com/build/4572961761918976
> - https://gitlab.com/philmd/qemu/-/pipelines/196047779
> - https://travis-ci.org/github/philmd/qemu/builds/731370972
>
> Based-on: <20200929125609.1088330-1-philmd@redhat.com>
> "hw/arm: Restrict APEI tables generation to the 'virt' machine"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg745792.html
>
> Philippe Mathieu-Daud=C3=A9 (10):
>   accel/tcg: Add stub for cpu_loop_exit()
>   meson: Allow optional target/${ARCH}/Kconfig
>   target/arm: Select SEMIHOSTING if TCG is available
>   target/arm: Restrict ARMv4 cpus to TCG accel
>   target/arm: Restrict ARMv5 cpus to TCG accel
>   target/arm: Restrict ARMv6 cpus to TCG accel
>   target/arm: Restrict ARMv7 R-profile cpus to TCG accel
>   target/arm: Restrict ARMv7 M-profile cpus to TCG accel
>   target/arm: Reorder meson.build rules
>   .travis.yml: Add a KVM-only Aarch64 job
>
> Samuel Ortiz (1):
>   target/arm: Do not build TCG objects when TCG is off
>
> Thomas Huth (1):
>   target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
>
>  default-configs/arm-softmmu.mak |  3 --
>  meson.build                     |  8 +++-
>  target/arm/cpu.h                | 12 ------
>  accel/stubs/tcg-stub.c          |  5 +++
>  target/arm/cpu_tcg.c            |  4 +-
>  target/arm/helper.c             |  7 ----
>  target/arm/m_helper-stub.c      | 73 +++++++++++++++++++++++++++++++++
>  .travis.yml                     | 35 ++++++++++++++++
>  hw/arm/Kconfig                  | 32 +++++++++++++++
>  target/arm/Kconfig              |  4 ++
>  target/arm/meson.build          | 40 +++++++++++-------
>  11 files changed, 184 insertions(+), 39 deletions(-)
>  create mode 100644 target/arm/m_helper-stub.c
>  create mode 100644 target/arm/Kconfig


--=20
Alex Benn=C3=A9e
