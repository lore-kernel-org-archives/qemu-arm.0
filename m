Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q20sm18745523wmj.5.2020.09.14.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:42:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 82A491FF7E;
	Mon, 14 Sep 2020 14:42:03 +0100 (BST)
References: <20200901162046.32670-1-peter.maydell@linaro.org>
 <20200901162046.32670-2-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] arm.risu: Correct VLDR/VSTR U=0 patterns
In-reply-to: <20200901162046.32670-2-peter.maydell@linaro.org>
Date: Mon, 14 Sep 2020 14:42:03 +0100
Message-ID: <87bli81nmc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Vmxtay2qb5vf


Peter Maydell <peter.maydell@linaro.org> writes:

> Correct the VLDR and VSTR patterns, which claimed to be setting U=3D0
> but in fact left it identical to the U=3D1 pattern due to a
> cut-and-paste error.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Somehow the pre-generated test binaries I have from Alex have
> U=3D0 insns in them -- I suspect this got fixed locally but never
> made it upstream ?

Hmm my current set of aarch32 test patterns have U=3D1 throughout. So if
it did get fixed locally it also got lost.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
