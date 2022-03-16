Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g13-20020a1709065d0d00b006df7dfa2a51sm579674ejt.132.2022.03.16.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 04:40:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9EC321FFB7;
	Wed, 16 Mar 2022 11:40:12 +0000 (GMT)
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-2-peter.maydell@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Log M-profile vector table accesses
Date: Wed, 16 Mar 2022 11:40:05 +0000
In-reply-to: <20220315204306.2797684-2-peter.maydell@linaro.org>
Message-ID: <871qz23z37.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +IgvJXUvCCtt


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently the CPU_LOG_INT logging misses some useful information
> about loads from the vector table.  Add logging where we load vector
> table entries.  This is particularly helpful for cases where the user
> has accidentally not put a vector table in their image at all, which
> can result in confusing guest crashes at startup.
>
> Here's an example of the new logging for a case where
> the vector table contains garbage:
>
> Loaded reset SP 0x0 PC 0x0 from vector table
> Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...with CFSR.IACCVIOL
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> ...loading from element 3 of non-secure vector table at 0xc
> ...loaded new PC 0x20000558
> ----------------
> IN:
> 0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}
>
> (The double reset logging is the result of our long-standing
> "CPUs all get reset twice" weirdness; it looks a bit ugly
> but it'll go away if we ever fix that :-))
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
