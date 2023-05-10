Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600010cd00b00306299be5a2sm17682967wrx.72.2023.05.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:52:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7D7381FFBB;
	Wed, 10 May 2023 14:52:10 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-26-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 25/30] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Wed, 10 May 2023 14:51:59 +0100
In-reply-to: <20230506072235.597467-26-richard.henderson@linaro.org>
Message-ID: <87r0ro5m5x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KKN0bZCtuwe9


Richard Henderson <richard.henderson@linaro.org> writes:

> The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
> available registers.  Now that we handle overlap betwen inputs and
> helper arguments, we can allow any allocatable reg.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
