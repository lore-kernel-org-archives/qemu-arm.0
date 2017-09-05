Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l91sm601798wrc.16.2017.09.05.05.02.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Sep 2017 05:02:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 9402A3E00A0;
	Tue,  5 Sep 2017 13:02:22 +0100 (BST)
References: <20170829063313.10237-1-bobby.prani@gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org, rth@twiddle.net, pbonzini@redhat.com
Subject: Re: [PATCH 1/5] target/arm: Remove stale comment
In-reply-to: <20170829063313.10237-1-bobby.prani@gmail.com>
Date: Tue, 05 Sep 2017 13:02:22 +0100
Message-ID: <87lgltmjzl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ePV2X97xzLSR


Pranith Kumar <bobby.prani@gmail.com> writes:

> Update the comment which is not true since MTTCG.

What happened to the cover letter? We seem to have a mix of patches but
no summary of the overall outcome.

>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  target/arm/translate-a64.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 2200e25be0..f42b155d7d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2012,10 +2012,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>      }
>      tcg_addr = read_cpu_reg_sp(s, rn, 1);
>
> -    /* Note that since TCG is single threaded load-acquire/store-release
> -     * semantics require no extra if (is_lasr) { ... } handling.
> -     */
> -
>      if (is_excl) {
>          if (!is_store) {
>              s->is_ldex = true;


--
Alex Bennée
