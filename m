Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275556sm17656999f8f.72.2025.01.22.13.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 13:34:36 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1859B5FA4B;
	Wed, 22 Jan 2025 21:34:36 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/10] gdbstub: Prefer cached CpuClass over
 CPU_GET_CLASS() macro
In-Reply-To: <20250122093028.52416-9-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 22 Jan 2025 10:30:26
 +0100")
References: <20250122093028.52416-1-philmd@linaro.org>
	<20250122093028.52416-9-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 21:34:36 +0000
Message-ID: <87wmemlehf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: r4YluzToczYq

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
