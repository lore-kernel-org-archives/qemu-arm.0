Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff775sm199031066b.171.2024.07.15.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 02:34:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6A7625F8CC;
	Mon, 15 Jul 2024 10:34:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  danikhan632@git.sr.ht,  qemu-arm@nongnu.org,
  Daniyal Khan <danikhan632@gmail.com>,  qemu-stable@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: Use float_status copy in sme_fmopa_s
In-Reply-To: <20240715055820.319035-2-richard.henderson@linaro.org> (Richard
	Henderson's message of "Mon, 15 Jul 2024 15:58:18 +1000")
References: <20240715055820.319035-1-richard.henderson@linaro.org>
	<20240715055820.319035-2-richard.henderson@linaro.org>
Date: Mon, 15 Jul 2024 10:34:23 +0100
Message-ID: <87wmlnhucg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dqn53SeYZPSj

Richard Henderson <richard.henderson@linaro.org> writes:

> From: Daniyal Khan <danikhan632@gmail.com>
>
> We made a copy above because the fp exception flags
> are not propagated back to the FPST register, but
> then failed to use the copy.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 558e956c719 ("target/arm: Implement FMOPA, FMOPS (non-widening)")
> Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
> [rth: Split from a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
