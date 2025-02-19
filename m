Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm642128266b.129.2025.02.19.14.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 14:09:17 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8A10B5F760;
	Wed, 19 Feb 2025 22:09:16 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
  qemu-devel@nongnu.org,
  Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,  Rayhan Faizel
 <rayhan.faizel@gmail.com>,  Luc Michel <luc.michel@amd.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Thomas Huth <huth@tuxfamily.org>,
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH 3/9] hw/char/pl011: Improve RX flow tracing events
In-Reply-To: <20250219210841.94797-4-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 19 Feb 2025 22:08:35
 +0100")
References: <20250219210841.94797-1-philmd@linaro.org>
	<20250219210841.94797-4-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 19 Feb 2025 22:09:16 +0000
Message-ID: <87ikp5k2nn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NrhGacNdWJRo

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Log FIFO use (availability and depth).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
