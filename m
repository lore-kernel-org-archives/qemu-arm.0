Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b002c71b4d476asm17629555wrp.106.2023.05.10.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:52:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D6EBB1FFBB;
	Wed, 10 May 2023 14:52:28 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-27-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 26/30] tcg/ppc: Remove unused constraints A, B, C, D
Date: Wed, 10 May 2023 14:52:19 +0100
In-reply-to: <20230506072235.597467-27-richard.henderson@linaro.org>
Message-ID: <87mt2c5m5f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KEGuqWyLH/zS


Richard Henderson <richard.henderson@linaro.org> writes:

> These constraints have not been used for quite some time.
>
> Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
