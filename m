Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b003f173419e7asm22680787wme.43.2023.05.10.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 07:02:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C0B31FFBB;
	Wed, 10 May 2023 15:02:45 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-31-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 30/30] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Wed, 10 May 2023 15:02:36 +0100
In-reply-to: <20230506072235.597467-31-richard.henderson@linaro.org>
Message-ID: <875y905loa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FXTsdHUuawie


Richard Henderson <richard.henderson@linaro.org> writes:

> Adjust the softmmu tlb to use R0+R1, not any of the normally available
> registers.  Since we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
