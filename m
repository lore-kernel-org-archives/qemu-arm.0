Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf88esm1056076066b.46.2025.02.05.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:59:22 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 35DE55F90B;
	Wed,  5 Feb 2025 08:59:22 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 01/14] target/arm: Report correct syndrome for UNDEFINED
 CNTPS_*_EL1 from EL2 and NS EL1
In-Reply-To: <20250130182309.717346-2-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 30 Jan 2025 18:22:56 +0000")
References: <20250130182309.717346-1-peter.maydell@linaro.org>
	<20250130182309.717346-2-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 08:59:22 +0000
Message-ID: <87ldukahsl.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2o3Ojyjtkse6

Peter Maydell <peter.maydell@linaro.org> writes:

> The access pseudocode for the CNTPS_TVAL_EL1, CNTPS_CTL_EL1 and
> CNTPS_CVAL_EL1 secure timer registers says that they are UNDEFINED
> from EL2 or NS EL1.  We incorrectly return CP_ACCESS_TRAP from the
> access function in these cases, which means that we report the wrong
> syndrome value to the target EL.
>
> Use CP_ACCESS_TRAP_UNCATEGORIZED, which reports the correct syndrome
> value for an UNDEFINED instruction.
>
> Cc: qemu-stable@nongnu.org
> Fixes: b4d3978c2fd ("target-arm: Add the AArch64 view of the Secure physi=
cal timer")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
