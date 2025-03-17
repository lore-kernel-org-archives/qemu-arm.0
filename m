Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe524ccsm107485935e9.0.2025.03.17.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 07:58:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 90B4F5F892;
	Mon, 17 Mar 2025 14:58:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH for-10.1 1/9] core/cpu.h: gdb_arch_name string should
 not be freed
In-Reply-To: <20250317142819.900029-2-peter.maydell@linaro.org> (Peter
	Maydell's message of "Mon, 17 Mar 2025 14:28:11 +0000")
References: <20250317142819.900029-1-peter.maydell@linaro.org>
	<20250317142819.900029-2-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 17 Mar 2025 14:58:17 +0000
Message-ID: <87o6xzogae.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IDeenP1ROjDX

Peter Maydell <peter.maydell@linaro.org> writes:

> The documentation for the CPUClass::gdb_arch_name method claims that
> the returned string should be freed with g_free().  This is not
> correct: in commit a650683871ba728 we changed this method to
> instead return a simple constant string, but forgot to update
> the documentation.
>
> Make the documentation match the new semantics.
>
> Fixes: a650683871ba728 ("hw/core/cpu: Return static value with gdb_arch_n=
ame()")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
