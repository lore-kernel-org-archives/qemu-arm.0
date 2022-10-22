Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t189-20020a1c46c6000000b003c701c12a17sm3316354wma.12.2022.10.22.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 11:47:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 37AC81FFB7;
	Sat, 22 Oct 2022 19:47:37 +0100 (BST)
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 01/14] target/arm: Introduce regime_is_stage2
Date: Sat, 22 Oct 2022 19:47:31 +0100
In-reply-to: <20221020223548.2310496-2-richard.henderson@linaro.org>
Message-ID: <875ygbae5z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z6uANj8apVtb


Richard Henderson <richard.henderson@linaro.org> writes:

> Reduce the amount of typing required for this check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
