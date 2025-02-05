Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff3e4sm1107392666b.110.2025.02.05.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:42:05 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9727D5F90B;
	Wed,  5 Feb 2025 14:42:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 08/14] hw/intc/arm_gicv3_cpuif(): Remove redundant tests
 of is_a64()
In-Reply-To: <20250130182309.717346-9-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 30 Jan 2025 18:23:03 +0000")
References: <20250130182309.717346-1-peter.maydell@linaro.org>
	<20250130182309.717346-9-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 14:42:04 +0000
Message-ID: <87msf08ncz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nwZxgpMcRmLl

Peter Maydell <peter.maydell@linaro.org> writes:

> In the gicv3_{irq,fiq,irqfiq}_access() functions, in the
> arm_current_el(env) =3D=3D 3 case we do the following test:
>     if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
>         r =3D CP_ACCESS_TRAP_EL3;
>     }
>
> In this check, the "!is_a64(env)" is redundant, because if
> we are at EL3 and in AArch64 then arm_is_el3_or_mon() will
> return true and we will skip the if() body anyway.
>
> Remove the unnecessary tests.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
