Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b003047ae72b14sm17529458wrq.82.2023.05.10.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:50:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 07BAF1FFBB;
	Wed, 10 May 2023 14:50:00 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-23-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 22/30] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Wed, 10 May 2023 14:49:51 +0100
In-reply-to: <20230506072235.597467-23-richard.henderson@linaro.org>
Message-ID: <874jok70u0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6u/iPCYuSLs0


Richard Henderson <richard.henderson@linaro.org> writes:

> Compare the address vs the tlb entry with sign-extended values.
> This simplifies the page+alignment mask constant, and the
> generation of the last byte address for the misaligned test.
>
> Move the tlb addend load up, and the zero-extension down.
>
> This frees up a register, which allows us use TMP3 as the returned base
> address register instead of A0, which we were using as a 5th temporary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
