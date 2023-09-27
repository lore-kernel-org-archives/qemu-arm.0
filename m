Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c464300b0040536dcec17sm16523256wmo.27.2023.09.27.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:58:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 724461FFBB;
	Wed, 27 Sep 2023 11:58:22 +0100 (BST)
References: <20230927101853.39288-1-peter.maydell@linaro.org>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Permit T32 LDM with single register
Date: Wed, 27 Sep 2023 11:58:16 +0100
In-reply-to: <20230927101853.39288-1-peter.maydell@linaro.org>
Message-ID: <878r8rrigh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gy5kLSW4upHq


Peter Maydell <peter.maydell@linaro.org> writes:

> For the Thumb T32 encoding of LDM, if only a single register is
> specified in the register list this instruction is UNPREDICTABLE,
> with the following choices:
>  * instruction UNDEFs
>  * instruction is a NOP
>  * instruction loads a single register
>  * instruction loads an unspecified set of registers
>
> Currently we choose to UNDEF (a behaviour chosen in commit
> 4b222545dbf30 in 2019; previously we treated it as "load the
> specified single register").
>
> Unfortunately there is real world code out there (which shipped in at
> least Android 11, 12 and 13) which incorrectly uses this
> UNPREDICTABLE insn on the assumption that it does a single register
> load, which is (presumably) what it happens to do on real hardware,
> and is also what it does on the equivalent A32 encoding.
>
> Revert to the pre-4b222545dbf30 behaviour of not UNDEFing
> for this T32 encoding.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1799
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
