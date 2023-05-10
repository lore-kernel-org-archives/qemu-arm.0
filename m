Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003f4069417absm20013355wmz.24.2023.05.10.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:43:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 89DEF1FFBB;
	Wed, 10 May 2023 14:43:20 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-21-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 20/30] tcg/loongarch64: Simplify constraints on
 qemu_ld/st
Date: Wed, 10 May 2023 14:43:10 +0100
In-reply-to: <20230506072235.597467-21-richard.henderson@linaro.org>
Message-ID: <87cz387153.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dSCA1t0ePyHx


Richard Henderson <richard.henderson@linaro.org> writes:

> The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
