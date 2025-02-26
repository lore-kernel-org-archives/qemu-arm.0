Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba543ebfsm13825485e9.25.2025.02.26.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 01:04:42 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A24225F87C;
	Wed, 26 Feb 2025 09:04:41 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 1/9] target/arm: Apply correct timer offset when
 calculating deadlines
In-Reply-To: <20250204125009.2281315-2-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 4 Feb 2025 12:50:01 +0000")
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
	<20250204125009.2281315-2-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 26 Feb 2025 09:04:41 +0000
Message-ID: <87tt8h3wly.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nFt7dp+6//nM

Peter Maydell <peter.maydell@linaro.org> writes:

> When we are calculating timer deadlines, the correct definition of
> whether or not to apply an offset to the physical count is described
> in the Arm ARM DDI4087 rev L.a section D12.2.4.1.  This is different
> from when the offset should be applied for a direct read of the
> counter sysreg.
>
> We got this right for the EL1 physical timer and for the EL1 virtual
> timer, but got all the rest wrong: they should be using a zero offset
> always.
>
> Factor the offset calculation out into a function that has a comment
> documenting exactly which offset it is calculating and which gets the
> HYP, SEC, and HYPVIRT cases right.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
