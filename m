Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f577sm1018292466b.18.2024.12.26.14.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 14:49:26 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 333E45F8BF;
	Thu, 26 Dec 2024 22:49:25 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Tigran Sogomonian <tsogomonian@astralinux.ru>
Cc: peter.maydell@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,
  sdl.qemu@linuxtesting.org
Subject: Re: [PATCH] hw/misc: cast nand_getio value to uint64_t
In-Reply-To: <20241226141626.28722-1-tsogomonian@astralinux.ru> (Tigran
	Sogomonian's message of "Thu, 26 Dec 2024 17:16:26 +0300")
References: <20241226141626.28722-1-tsogomonian@astralinux.ru>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 26 Dec 2024 22:49:25 +0000
Message-ID: <87msgikqkq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JpbiA8i9It1N

Tigran Sogomonian <tsogomonian@astralinux.ru> writes:

> s->buswidth =3D nand_flash_ids[s->chip_id].width >> 3;
> <=3D 16 >> 3 <=3D 2.
> x <=3D s->ioaddr[offset] << (s->buswidth << 3)
> <=3D max_uint8_t << 16
> With x << 24 overflow is possible.
> Other cases are similar.
> Thus, need to cast return value to uint64_t.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>

This code was removed in 192f75ad11 (hw/misc: Remove omap_gpmc)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
