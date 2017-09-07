Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e34sm253520wre.15.2017.09.07.11.18.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Sep 2017 11:18:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6875C3E019F;
	Thu,  7 Sep 2017 19:18:26 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org> <20170817230114.3655-4-richard.henderson@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 3/8] tcg: Add types for host vectors
In-reply-to: <20170817230114.3655-4-richard.henderson@linaro.org>
Date: Thu, 07 Sep 2017 19:18:26 +0100
Message-ID: <8760cumky5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Ry2q8HqbVakC


Richard Henderson <richard.henderson@linaro.org> writes:

> Nothing uses or enables them yet.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tcg/tcg.h | 5 +++++
>  tcg/tcg.c | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index dd97095af5..1277caed3d 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -256,6 +256,11 @@ typedef struct TCGPool {
>  typedef enum TCGType {
>      TCG_TYPE_I32,
>      TCG_TYPE_I64,
> +
> +    TCG_TYPE_V64,
> +    TCG_TYPE_V128,
> +    TCG_TYPE_V256,
> +
>      TCG_TYPE_COUNT, /* number of different types */
>
>      /* An alias for the size of the host register.  */
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 787c8ba0f7..ea78d47fad 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -118,7 +118,7 @@ static TCGReg tcg_reg_alloc_new(TCGContext *s, TCGType t)
>  static bool tcg_out_ldst_finalize(TCGContext *s);
>  #endif
>
> -static TCGRegSet tcg_target_available_regs[2];
> +static TCGRegSet tcg_target_available_regs[TCG_TYPE_COUNT];
>  static TCGRegSet tcg_target_call_clobber_regs;
>
>  #if TCG_TARGET_INSN_UNIT_SIZE == 1


--
Alex Bennée
