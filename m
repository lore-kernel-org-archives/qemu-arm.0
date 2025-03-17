Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975febsm15595396f8f.59.2025.03.17.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:00:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1685E5F892;
	Mon, 17 Mar 2025 15:00:05 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH for-10.1 3/9] target/arm: Handle AArch64 in TYPE_ARM_CPU
 gdb_arch_name
In-Reply-To: <20250317142819.900029-4-peter.maydell@linaro.org> (Peter
	Maydell's message of "Mon, 17 Mar 2025 14:28:13 +0000")
References: <20250317142819.900029-1-peter.maydell@linaro.org>
	<20250317142819.900029-4-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 17 Mar 2025 15:00:05 +0000
Message-ID: <87cyefog7e.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mRlLc2lPd8z+

Peter Maydell <peter.maydell@linaro.org> writes:

> Instead of having the TYPE_AARCH64_CPU subclass set
> CPUClass::gdb_arch_name to a different function, make the
> TYPE_ARM_CPU implementation of the method handle AArch64.
>
> For the moment we make the "is this AArch64?" function test "is the
> CPU of TYPE_AARCH64_CPU?", so that this produces no behavioural
> change.  When we've moved all the gdbstub related methods across to
> the base class, we will be able to change this to be "does the CPU
> have the ARM_FEATURE_AARCH64 feature?".
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
