Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n133sm1099787wmd.9.2017.09.08.02.30.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Sep 2017 02:30:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BA02E3E00A6;
	Fri,  8 Sep 2017 10:30:43 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org> <20170817230114.3655-7-richard.henderson@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 6/8] tcg: Add INDEX_op_invalid
In-reply-to: <20170817230114.3655-7-richard.henderson@linaro.org>
Date: Fri, 08 Sep 2017 10:30:43 +0100
Message-ID: <8760ctilks.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Wy6n7oqsaLCg


Richard Henderson <richard.henderson@linaro.org> writes:

> Add with value 0 so that structure zero initialization can
> indicate that the field is not present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tcg/tcg-opc.h | 2 ++
>  tcg/tcg.c     | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
> index 9162125fac..b1445a4c24 100644
> --- a/tcg/tcg-opc.h
> +++ b/tcg/tcg-opc.h
> @@ -26,6 +26,8 @@
>   * DEF(name, oargs, iargs, cargs, flags)
>   */
>
> +DEF(invalid, 0, 0, 0, TCG_OPF_NOT_PRESENT)
> +
>  /* predefined ops */
>  DEF(discard, 1, 0, 0, TCG_OPF_NOT_PRESENT)
>  DEF(set_label, 0, 0, 1, TCG_OPF_BB_END | TCG_OPF_NOT_PRESENT)
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 3c3cdda938..879b29e81f 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -756,6 +756,9 @@ int tcg_check_temp_count(void)
>  bool tcg_op_supported(TCGOpcode op)
>  {
>      switch (op) {
> +    case INDEX_op_invalid:
> +        return false;
> +
>      case INDEX_op_discard:
>      case INDEX_op_set_label:
>      case INDEX_op_call:


--
Alex Bennée
