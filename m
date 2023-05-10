Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r15-20020a5d694f000000b00306415ac69asm17425567wrw.15.2023.05.10.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:54:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A25C11FFBB;
	Wed, 10 May 2023 14:54:22 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-28-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 27/30] tcg/ppc: Remove unused constraint J
Date: Wed, 10 May 2023 14:53:30 +0100
In-reply-to: <20230506072235.597467-28-richard.henderson@linaro.org>
Message-ID: <87ild05m29.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OBFkilbzQDh7


Richard Henderson <richard.henderson@linaro.org> writes:

> Never used since its introduction.
>
> Fixes: 3d582c6179c ("tcg-ppc64: Rearrange integer constant constraints")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target-con-str.h | 1 -
>  tcg/ppc/tcg-target.c.inc     | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
> index 9dcbc3df50..094613cbcb 100644
> --- a/tcg/ppc/tcg-target-con-str.h
> +++ b/tcg/ppc/tcg-target-con-str.h
> @@ -16,7 +16,6 @@ REGS('v', ALL_VECTOR_REGS)
>   * CONST(letter, TCG_CT_CONST_* bit set)
>   */
>  CONST('I', TCG_CT_CONST_S16)
> -CONST('J', TCG_CT_CONST_U16)
>  CONST('M', TCG_CT_CONST_MONE)
>  CONST('T', TCG_CT_CONST_S32)
>  CONST('U', TCG_CT_CONST_U32)
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 5a4ec0470a..0a14c3e997 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -83,7 +83,6 @@
>  #define SZR  (TCG_TARGET_REG_BITS / 8)
>=20=20
>  #define TCG_CT_CONST_S16  0x100
> -#define TCG_CT_CONST_U16  0x200

Arguably you could tidy up the bit masks to make it easier to add a
constraint later. But anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
