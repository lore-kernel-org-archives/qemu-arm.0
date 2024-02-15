Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ay14-20020a5d6f0e000000b0033b2799815csm2673475wrb.86.2024.02.15.09.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 09:53:40 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 80EC35F77B;
	Thu, 15 Feb 2024 17:53:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 09/13] hw/arm/mps3r: Add CPUs, GIC, and per-CPU RAM
In-Reply-To: <20240206132931.38376-10-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 6 Feb 2024 13:29:27 +0000")
References: <20240206132931.38376-1-peter.maydell@linaro.org>
	<20240206132931.38376-10-peter.maydell@linaro.org>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Thu, 15 Feb 2024 17:53:40 +0000
Message-ID: <87r0hd62cb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cD9eSF8f4YMe

Peter Maydell <peter.maydell@linaro.org> writes:

> Create the CPUs, the GIC, and the per-CPU RAM block for
> the mps3-an536 board.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
