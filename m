Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab74fb5996esm268196266b.106.2025.02.05.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:29:16 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B950A5F90B;
	Wed,  5 Feb 2025 14:29:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 06/14] hw/intc/arm_gicv3_cpuif: Don't downgrade monitor
 traps for AArch32 EL3
In-Reply-To: <20250130182309.717346-7-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 30 Jan 2025 18:23:01 +0000")
References: <20250130182309.717346-1-peter.maydell@linaro.org>
	<20250130182309.717346-7-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 14:29:15 +0000
Message-ID: <87y0yk8nyc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FdeNFHzvV2a4

Peter Maydell <peter.maydell@linaro.org> writes:

> In the gicv3_{irq,fiq,irqfiq}_access() functions, there is a check
> which downgrades a CP_ACCESS_TRAP_EL3 to CP_ACCESS_TRAP if EL3 is not
> AArch64.  This has been there since the GIC was first implemented,
> but it isn't right: if we are trapping because of SCR.IRQ or SCR.FIQ
> then we definitely want to be going to EL3 (doing
> AArch32.TakeMonitorTrapException() in pseudocode terms).  We might
> want to not take a trap at all, but we don't ever want to go to the
> default target EL, because that would mean, for instance, taking a
> trap to Hyp mode if the trapped access was made from Hyp mode.
>
> (This might have been an attempt to work around our failure to
> properly implement Monitor Traps.)
>
> Remove the bogus check.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 359fbe65e01e ("hw/intc/arm_gicv3: Implement GICv3 CPU interface re=
gisters")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
