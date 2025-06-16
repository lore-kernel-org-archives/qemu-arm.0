Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224956sm154816575e9.4.2025.06.16.12.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 12:27:17 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CBBBA5F7D7;
	Mon, 16 Jun 2025 20:27:16 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Solomon Tan <root@wjsota.com>
Cc: peter.maydell@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm: Make RETA[AB] UNDEF when pauth is not
 implemented
In-Reply-To: <20250616171549.59190-1-root@wjsota.com> (Solomon Tan's message
	of "Tue, 17 Jun 2025 01:15:46 +0800")
References: <20250616171549.59190-1-root@wjsota.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 16 Jun 2025 20:27:16 +0100
Message-ID: <871prjwkq3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: r/lmDd55j6Zm

Solomon Tan <root@wjsota.com> writes:

> According to the Arm A-profile A64 Instruction Set Architecture,
> RETA[AB] should be decoded as UNDEF if the pauth feature is not
> implemented.
>
> Fixes: 0ebbe9021254f ("target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] t=
o decodetree")
> Signed-off-by: Solomon Tan <root@wjsota.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
