Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7e79sm195185766b.88.2024.07.15.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:03:34 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 86FBB5F8CC;
	Mon, 15 Jul 2024 11:03:33 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  danikhan632@git.sr.ht,  qemu-arm@nongnu.org,
  qemu-stable@nongnu.org,  Daniyal Khan <danikhan632@gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Use FPST_F16 for SME FMOPA (widening)
In-Reply-To: <20240715055820.319035-3-richard.henderson@linaro.org> (Richard
	Henderson's message of "Mon, 15 Jul 2024 15:58:19 +1000")
References: <20240715055820.319035-1-richard.henderson@linaro.org>
	<20240715055820.319035-3-richard.henderson@linaro.org>
Date: Mon, 15 Jul 2024 11:03:33 +0100
Message-ID: <87sewbhszu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JWBAT8y5UKXs

Richard Henderson <richard.henderson@linaro.org> writes:

> This operation has float16 inputs and thus must use
> the FZ16 control not the FZ control.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Daniyal Khan <danikhan632@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2374
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
