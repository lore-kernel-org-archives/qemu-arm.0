Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g22-20020a7bc4d6000000b003f049a42689sm21845194wmk.25.2023.05.10.01.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:44:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C97971FFBB;
	Wed, 10 May 2023 09:44:29 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-3-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 02/30] tcg/i386: Use indexed addressing for softmmu
 fast path
Date: Wed, 10 May 2023 09:44:18 +0100
In-reply-to: <20230506072235.597467-3-richard.henderson@linaro.org>
Message-ID: <87r0roa842.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jfTUYJqqnGrB


Richard Henderson <richard.henderson@linaro.org> writes:

> Since tcg_out_{ld,st}_helper_args, the slow path no longer requires
> the address argument to be set up by the tlb load sequence.  Use a
> plain load for the addend and indexed addressing with the original
> input address register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
