Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r63sm5271431wmg.13.2017.11.13.09.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2017 09:16:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 62F6A3E009E;
	Mon, 13 Nov 2017 17:16:57 +0000 (GMT)
References: <20171004184325.24157-1-richard.henderson@linaro.org>
User-agent: mu4e 1.0-alpha2; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v1 00/12] ARM v8.1 simd + v8.3 complex insns
In-reply-to: <20171004184325.24157-1-richard.henderson@linaro.org>
Date: Mon, 13 Nov 2017 17:16:57 +0000
Message-ID: <87mv3q9jzq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hkEu/+zBoGCi


Richard Henderson <richard.henderson@linaro.org> writes:

> This patch set depends on v3 of native-vector-registers;
> for ease of review the whole tree is at
>
>   git://github.com/rth7680/qemu.git tgt-arm-cplx
>
> I have successfully tested all insns for AArch64 via RISU.
> I have successfully tested everything but VCMLA for AArch32.
>
> The insn that doesn't match up is
>
>   fef3c848  vcmla.f32  q14, <illegal reg q1.5>, d8[0], #270
>
> for which FoundationModel is *not* signalling illegal insn.
> I'm not really sure what it is doing -- perhaps treating the
> insn as a coprocessor 8 nop?  I'll have to investigate further.
>
> In the meantime, it's surely time for a round 1 review.

OK I'm done with round 1 review, I skipped past the later complex
instructions as I don't have access to the 8.3 ARM ARM yet (although the
instructions are in the ASL HTML dumps).

>
>
> r~
>
>
> Richard Henderson (12):
>   HACK: use objdump disas
>   target/arm: Add ARM_FEATURE_V8_1_SIMD
>   target/arm: Decode aa64 armv8.1 scalar three same extra
>   target/arm: Decode aa64 armv8.1 three same extra
>   target/arm: Decode aa64 armv8.1 scalar/vector x indexed element
>   target/arm: Decode aa32 armv8.1 three same
>   target/arm: Decode aa32 armv8.1 two reg and a scalar
>   target/arm: Add ARM_FEATURE_V8_FCMA
>   target/arm: Decode aa64 armv8.3 fcadd
>   target/arm: Decode aa64 armv8.3 fcmla
>   target/arm: Decode aa32 armv8.3 3-same
>   target/arm: Decode aa32 armv8.3 2-reg-index
>
>  target/arm/cpu.h            |   2 +
>  target/arm/helper.h         |  26 ++++
>  disas.c                     |   2 +-
>  linux-user/elfload.c        |  10 ++
>  target/arm/advsimd_helper.c | 331 ++++++++++++++++++++++++++++++++++++++=
+++
>  target/arm/cpu.c            |   2 +
>  target/arm/cpu64.c          |   2 +
>  target/arm/translate-a64.c  | 350 ++++++++++++++++++++++++++++++++++++++=
+-----
>  target/arm/translate.c      | 241 +++++++++++++++++++++++++++---
>  target/arm/Makefile.objs    |   2 +-
>  10 files changed, 912 insertions(+), 56 deletions(-)
>  create mode 100644 target/arm/advsimd_helper.c


--
Alex Benn=C3=A9e
