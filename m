Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89514esm1110967666b.74.2024.12.27.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:37:03 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC22C5F8BF;
	Fri, 27 Dec 2024 12:37:02 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Tigran Sogomonian <tsogomonian@astralinux.ru>
Cc: peter.maydell@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,
  sdl.qemu@linuxtesting.org
Subject: Re: [PATCH v2] hw/misc: use extract64 instead of 1 << i
In-Reply-To: <20241227104618.2526-1-tsogomonian@astralinux.ru> (Tigran
	Sogomonian's message of "Fri, 27 Dec 2024 13:46:18 +0300")
References: <20241227104618.2526-1-tsogomonian@astralinux.ru>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 27 Dec 2024 12:37:02 +0000
Message-ID: <87h66pl2tt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rLPXu0P3NdeM

Tigran Sogomonian <tsogomonian@astralinux.ru> writes:

> 1 << i is casted to uint64_t while bitwise and with val.
> So this value may become 0xffffffff80000000 but only
> 31th "start" bit is required.
> Use the bitfield extract() API instead.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
