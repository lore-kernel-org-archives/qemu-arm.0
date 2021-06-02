Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f14sm5927989wry.40.2021.06.02.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 02:14:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3DCE41FF7E;
	Wed,  2 Jun 2021 10:14:22 +0100 (BST)
References: <20210602020720.47679-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Mark LDS{MIN,MAX} as signed operations
Date: Wed, 02 Jun 2021 10:14:17 +0100
In-reply-to: <20210602020720.47679-1-richard.henderson@linaro.org>
Message-ID: <87k0ncbpch.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: i88RZ43K4yVs


Richard Henderson <richard.henderson@linaro.org> writes:

> The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
> be signed, so that the inputs are properly extended.
> Zero extend the result afterward, as needed.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
