Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e12sm1073012366b.40.2025.07.02.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:47:32 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D84445F8BE;
	Wed, 02 Jul 2025 14:47:31 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org
Subject: Re: [PATCH v3 10/10] target/arm: Remove CPUARMState.vfp.scratch
In-Reply-To: <20250702122213.758588-11-richard.henderson@linaro.org> (Richard
	Henderson's message of "Wed, 2 Jul 2025 06:22:13 -0600")
References: <20250702122213.758588-1-richard.henderson@linaro.org>
	<20250702122213.758588-11-richard.henderson@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 02 Jul 2025 14:47:31 +0100
Message-ID: <8734beembw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8p8/oj8oZe18

Richard Henderson <richard.henderson@linaro.org> writes:

> The last use of this field was removed in b2fc7be972b9.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
