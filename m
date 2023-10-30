Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h17-20020adff4d1000000b0032f78feb826sm6824497wrp.104.2023.10.30.12.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 12:29:46 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9B172656E5;
	Mon, 30 Oct 2023 19:29:45 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH] target/arm: Fix SVE STR increment
In-Reply-To: <20231030190354.94671-1-richard.henderson@linaro.org> (Richard
	Henderson's message of "Mon, 30 Oct 2023 12:03:54 -0700")
User-Agent: mu4e 1.11.23; emacs 29.1
Date: Mon, 30 Oct 2023 19:29:45 +0000
Message-ID: <87ttq7vrh2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dsfrfcftNadH

Richard Henderson <richard.henderson@linaro.org> writes:

> The previous change missed updating one of the increments.
>
> Cc: qemu-stable@nongnu.org
> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sv=
e_{ld, st}r")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
