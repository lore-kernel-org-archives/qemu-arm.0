Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3222390wrv;
        Mon, 29 Jul 2019 07:32:47 -0700 (PDT)
X-Received: by 2002:a9d:4703:: with SMTP id a3mr13104872otf.183.1564410767669;
        Mon, 29 Jul 2019 07:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564410767; cv=none;
        d=google.com; s=arc-20160816;
        b=RSEIWdtxJYKZnzYSJmDsFVnvXCN5eF8kh9iFIW6S02NTe8IcnSWqNNIwAzIbb+55Pa
         7KYFaelo4ZOuOmFNhbSYILo0TB7JifJlHAaK0M8i1qDM6WLPFztCvKqt9X9edfkBzo2w
         xBHjxah5u6PFoj0sKLqbV9f2q2mBUR0ODFRzwXCr4wpntZnz1WJtQLp8OnWpl27oBJqK
         2RBdvQwOnfJiilEa2LKQyRIqfHOQkUs1q5Af1o6vmOop04ShDjhKCrQ0NrJiX1KRoscP
         WRklN5AV30nj8teZ2GnzvixKXk3lz9Y4bUCgGJdLNg0B0RlgsY6FUf68o/QVpsWQgU2+
         0Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4uTZe1iLPCTbwbv7JO1AauwerbUATMzGm0b+xtEgu4=;
        b=veC3fdGMzi9k0UmIhLZOvhiHLc/fcnvg37KVzHzGCtwhUoS39Afy8j0eiihgE3WBg0
         FMZovqzOxgHrrcG35wBABhly1vWg6Cs+KBYWmJwZLroEHX58DeD0MwkSEtPMVBHTnpR7
         lYQHO8Y+TxZhpY74jcq4eSQnRZ6zocyj97eW2L+tbvPGdxZ336D1JX+nbgLcSxRMyPUj
         Ie7CF6Utlw0A9zSOglnT+356u5P2xMrrlhpIhMQDkWP7Atkn/AVLO2bfX3YDd/UwJ3YA
         OvuJuBVyPd3DCcHEclZYZCH5ncSBGKQ4DVB2Jg0EbVJ3VeLSckucKfj+GyEm5dBkRMKZ
         E/ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/FjCcYj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l40sor32438614ota.55.2019.07.29.07.32.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/FjCcYj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y4uTZe1iLPCTbwbv7JO1AauwerbUATMzGm0b+xtEgu4=;
        b=C/FjCcYjLkaiNRDktm/1scMIFuzOARlTrLpt/sPnglsobEQlEQxD/mhLen1M6u83BB
         Pj9FFjrEe3KYQvzUyj7RV1eFdxiHdOliNuVi+UtheMXbySEcv9ptbWbrLs7yY5xy84RF
         8GFi6Z15v83HxFMB/HejHgatV6k5Uq6G35bTVKxi65WYqOyWx6flGv9mjKxyOAQzy0EP
         23XBxnUl4XGTDneOJtyCWnqr8IYNkzAzoadwcdbfTOj24GAu0ettZTKCttMHxGb6lFIN
         rBnvDjjHv6n+5AjvQKfJ1iyjitRgZPrEwfBaH+2KlDyR4v2qgEM8llSOO85jdibBMgj1
         WLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y4uTZe1iLPCTbwbv7JO1AauwerbUATMzGm0b+xtEgu4=;
        b=pfGZ10vO9gBbWzv7hr9knbpArhDVqlj4D3pybEAMEohK6Mq5PB8jP9BcYzM6MyTEOd
         L4poz/TFq5Gc/ZHKJHIiCGR/bumebJbEKe7K/R6wUA+tfmLt3AC4AWxxRi+9JfdTL0zF
         IzGOhsBn7tDMYZ81J0Zvh2jkAX0BHBFwkUi8yqR2Ic+UCoX/tFkv+x54nUF6ZiX4XlO6
         IqaW6TjozOZ7QqlngoqprBq2WNxzzAXlh4+gYuQdfu93ods1A27Lo53x1rqrLFrHGw2i
         1nSDESZfnrmBOGOvjxtSfJ4FmWSezpedf4Qxe1Dtma+2Kms/SZZ4oCLB+E1NhZB8M+G0
         DrRA==
X-Gm-Message-State: APjAAAXiqV3QPyl5B8oXoANhbChG6I9s5lcyLT8PcxYDev8MfV24ITlo
	rtVr81YfQMFhmM9mTUDkiC6GLvYuRTZU8lUMef1ND8Oc9J0=
X-Google-Smtp-Source: APXvYqyzKuoiX99/Bp+1oZQ1A181XulahGQTDbpbna1CJQGe2t2zkqjn+/dcdrIqjtE8KnzVHOPbC2rZ4CfdMa1m8Nk=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr52414428otn.135.1564410766876;
 Mon, 29 Jul 2019 07:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-11-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:32:36 +0100
Message-ID: <CAFEAcA83GM6wgWs1xGygmqCoir=CXtFXYkzPBMdUeb638kCzmw@mail.gmail.com>
Subject: Re: [PATCH 10/67] target/arm: Move test for AL into arm_skip_unless
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9OYlWQm3t6pv

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly be calling this function much more often.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 53c46fcdc4..36419025db 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7705,8 +7705,14 @@ static void arm_gen_condlabel(DisasContext *s)
>  /* Skip this instruction if the ARM condition is false */
>  static void arm_skip_unless(DisasContext *s, uint32_t cond)
>  {
> -    arm_gen_condlabel(s);
> -    arm_gen_test_cc(cond ^ 1, s->condlabel);
> +    /*
> +     * Conditionally skip the insn. Note that both 0xe and 0xf mean
> +     * "always"; 0xf is not "never".
> +     */
> +    if (cond < 0xe) {
> +        arm_gen_condlabel(s);
> +        arm_gen_test_cc(cond ^ 1, s->condlabel);
> +    }
>  }
>
>  static void disas_arm_insn(DisasContext *s, unsigned int insn)
> @@ -7944,11 +7950,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>          }
>          goto illegal_op;
>      }
> -    if (cond != 0xe) {
> -        /* if not always execute, we generate a conditional jump to
> -           next instruction */
> -        arm_skip_unless(s, cond);
> -    }
> +
> +    arm_skip_unless(s, cond);
> +
>      if ((insn & 0x0f900000) == 0x03000000) {
>          if ((insn & (1 << 21)) == 0) {
>              ARCH(6T2);
> @@ -12095,15 +12099,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      dc->insn = insn;
>
>      if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
> -        uint32_t cond = dc->condexec_cond;
> -
> -        /*
> -         * Conditionally skip the insn. Note that both 0xe and 0xf mean
> -         * "always"; 0xf is not "never".
> -         */
> -        if (cond < 0x0e) {
> -            arm_skip_unless(dc, cond);
> -        }
> +        arm_skip_unless(dc, dc->condexec_cond);
>      }

In the other callsites for arm_skip_unless() the cond argument
can never be 0xe or 0xf.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
