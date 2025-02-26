Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5329besm13777935e9.15.2025.02.26.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 01:05:03 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E54605F87C;
	Wed, 26 Feb 2025 09:05:01 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 2/9] target/arm: Don't apply CNTVOFF_EL2 for EL2_VIRT
 timer
In-Reply-To: <20250204125009.2281315-3-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 4 Feb 2025 12:50:02 +0000")
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
	<20250204125009.2281315-3-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 26 Feb 2025 09:05:01 +0000
Message-ID: <87o6yp3wle.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zog5aMS1DYSN

Peter Maydell <peter.maydell@linaro.org> writes:

> The CNTVOFF_EL2 offset register should only be applied for accessses
> to CNTVCT_EL0 and for the EL1 virtual timer (CNTV_*).  We were
> incorrectly applying it for the EL2 virtual timer (CNTHV_*).
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
