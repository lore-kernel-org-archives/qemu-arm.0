Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ab36sm13084330f8f.49.2025.01.21.04.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:43:09 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6545D5F756;
	Tue, 21 Jan 2025 12:43:08 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org
Subject: Re: [PATCH 06/11] gdbstub: Prefer cached CpuClass over
 CPU_GET_CLASS() macro
In-Reply-To: <20250121114056.53949-7-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 21 Jan 2025 12:40:51
 +0100")
References: <20250121114056.53949-1-philmd@linaro.org>
	<20250121114056.53949-7-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 21 Jan 2025 12:43:08 +0000
Message-ID: <878qr4pcbn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cRLiZt9Jjoi2

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
