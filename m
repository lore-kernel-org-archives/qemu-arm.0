Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc8857d60esm8848060a12.41.2025.02.05.04.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:05:31 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 542665F90B;
	Wed,  5 Feb 2025 12:05:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 04/14] target/arm: Report correct syndrome for UNDEFINED
 LOR sysregs when NS=0
In-Reply-To: <20250130182309.717346-5-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 30 Jan 2025 18:22:59 +0000")
References: <20250130182309.717346-1-peter.maydell@linaro.org>
	<20250130182309.717346-5-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 12:05:29 +0000
Message-ID: <87frksa96e.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: C5RyZY/+GKfi

Peter Maydell <peter.maydell@linaro.org> writes:

> The pseudocode for the accessors for the LOR sysregs says they
> are UNDEFINED if SCR_EL3.NS is 0. We were reporting the wrong
> syndrome value here; use CP_ACCESS_TRAP_UNCATEGORIZED.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 2d7137c10faf ("target/arm: Implement the ARMv8.1-LOR extension")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
