Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b26f61fcasm3193419a12.86.2024.07.15.03.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:08:09 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7CD265F8CC;
	Mon, 15 Jul 2024 11:08:08 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  danikhan632@git.sr.ht,  qemu-arm@nongnu.org,
  Daniyal Khan <danikhan632@gmail.com>
Subject: Re: [PATCH 3/3] tests/tcg/aarch64: Add test cases for SME FMOPA
 (widening)
In-Reply-To: <20240715055820.319035-4-richard.henderson@linaro.org> (Richard
	Henderson's message of "Mon, 15 Jul 2024 15:58:20 +1000")
References: <20240715055820.319035-1-richard.henderson@linaro.org>
	<20240715055820.319035-4-richard.henderson@linaro.org>
Date: Mon, 15 Jul 2024 11:08:08 +0100
Message-ID: <87o76zhss7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: m1mos53aXyBM

Richard Henderson <richard.henderson@linaro.org> writes:

> From: Daniyal Khan <danikhan632@gmail.com>
>
> Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
> Message-Id: 172090222034.13953.16888708708822922098-1@git.sr.ht
> [rth: Split test cases to separate patch, tidy assembly.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
