Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp361965ejb;
        Mon, 13 Feb 2023 08:49:20 -0800 (PST)
X-Received: by 2002:a17:903:1206:b0:196:15af:e6de with SMTP id l6-20020a170903120600b0019615afe6demr28728425plh.68.1676306959916;
        Mon, 13 Feb 2023 08:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676306959; cv=none;
        d=google.com; s=arc-20160816;
        b=yAqpcSf+N5PdBJpCoLqcdVGxnjCOMRHxuSsMr0alH6GNJiSWfQK+WUe0UAXbKFMeVa
         Y9m6d4bm5h3GPybRNTAfGzlWO6nAELn3doZGr3+YhcnXm0yhG8Bqo4VqM6OgCk8G1/Jx
         EITGuIm8ysg0lf5uW82BLfxHi1uiJJzWNkBVelMVqxano/gMaZoUnusei3HOSCkL8whL
         6MgmMr6chGS193J1OSZpOuHJCbRoyhC8Oa1uFNgGH6MKHur3zxZBfsN4/k+EoDY2BdrZ
         whJZrbv+Wc5kUvQliAmfO2vXUsnnuXUQIx2FW7j47+25kee5QvuEnOPBOhb8LjMEShiu
         divw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9oSxE1vrVPxPfrXG19eGEaiD7f9wQZsVVjsf5M3zrgg=;
        b=BNpeRIZ0/tLsnwnRr7cGR5TNAC6TXsz8bcGrZL/082sowxythBdaw2xmk7gtmT/U5K
         i2zKQWoXmjtdd5mSOsVZEprtRWmTNQ4Z0EHN2Htbie+P7VIsYlKBTkp30UKNZp4fykD7
         NzC+Q/8OGGEjhfLnrgFcDvO/qyRLPXt4e3umNtVy7r7Pt4fylHyI7JGIQ1LAaA75Rn+3
         ALzpaBxxrk01UDyWL4ZktoHccJrjsMyNvhzgPrhsm2UnrDws6tbZFgbjzzz5WOwYz2KC
         hUW8Xxt228CQkhWX2NpD4/+KqQHtoG2TN96GsLHafi5J2oE/7TAhdhBgQ2o4Fhb7pe/t
         SuwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HEi9A8Sl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b1-20020a1709027e0100b001967afdbc96sor5328125plm.96.2023.02.13.08.49.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HEi9A8Sl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676306959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9oSxE1vrVPxPfrXG19eGEaiD7f9wQZsVVjsf5M3zrgg=;
        b=HEi9A8SljVcUTnQFEUq0rMe6tVvSLzR8BxxZqk056R9aAitm/obZWzgfNvVmq4x1EP
         8FBNq+XgZktArqivciPtN8nVm4afRnYZVKkFGYRvjLILhG5FIOUSKEBGixtb4pHmbo4G
         PP+hrUL7Yhj+dlHQfZO4D27NTeH5pwojfClb65JpgFWc0BwS58d87S5euHYtX5sNwB0h
         SXQRM/RtdbMvuh9u9olcJnqz0qwgYjLf3fwkG0NNIwX8NQpop483T34WbD8CpAUFq4b2
         gLxZVeEGpKTyBGTUCs2gIL+Rjjy+6YKTTHa4KEgwY9ynskNxmw7OJ0sYhMbJ9OC5yFhU
         JEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676306959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oSxE1vrVPxPfrXG19eGEaiD7f9wQZsVVjsf5M3zrgg=;
        b=gO4dboDkVfip1BehSbhbkRwst66x0aTLiW0qnmQzJgQQshm6wCu+KMKaGNL+UZyv5W
         l5leR9tE8k8GQKL4ozFA3agEnBQLhFdTdMipF9PP8BGXA/BXDkCwpcA4jORejPIEQRgX
         Uh3KHQPpZK/N2t47257Rr4WV/z6ucP807v5EBq8LhQ+VNyrLfdLGthZ9WV41q4l3EyVv
         IYXr57icuYerzyYZPCqrNK/GSQq1DOSddVqOsJXTS8Ex3iT3VSBhakrYY2T2arDtX84U
         YC14ujP0EYNzpmOdgt1uiutkoW0bdsFDiiTemknUPQNADfC70/roj5uMU0XtWpF7qYUA
         h+Zg==
X-Gm-Message-State: AO0yUKUNWgTLms+YsjnA02PaonTGyhg8gftiuWWIzw40nJGV6elQfdP+
	Zgroq1mXDOREK8BvIdJiviw+OE59RUPdua5tnhQr2R/x
X-Google-Smtp-Source: AK7set9VkRN8veRSF8/3GGHS45PRmOGMBwlvFSXSCFUt/Kk2fv72qKQIoPKF2jngG9p8FAYV1If/sbPVOUwukv8Y07s=
X-Received: by 2002:a17:902:7884:b0:19a:721b:bce1 with SMTP id
 q4-20020a170902788400b0019a721bbce1mr2709678pll.23.1676306959430; Mon, 13 Feb
 2023 08:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-5-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-5-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:49:08 +0000
Message-ID: <CAFEAcA9ohkUpSbgwW=GdZBuMP4ArbnVa5hrOaxGzmXsRdAAVRg@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Implement v8.3 Pauth2
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NH234+4IOA+4

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index a83956652f..6ebf6df75c 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -349,7 +349,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>      if (test != 0 && test != -1) {
>          if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
>              pac = 0;
> -        } else {
> +        } else if (! cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {

I think we should write this set of conditions as:

     if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
         /* No action required */
     } else if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
         pac = 0;
     } else {
         /* Note that etc etc */
         pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
     }

I know this isn't the way round the pseudocode does it, but if we do
it this way it means we don't need to have the weird special case
where we do an == check instead of >= in the epac isar_feature test
function.

>              /*
>               * Note that our top_bit is one greater than the pseudocode's
>               * version, hence "- 2" here.
> @@ -362,6 +362,8 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>       * Preserve the determination between upper and lower at bit 55,
>       * and insert pointer authentication code.
>       */
> +    if (cpu_isar_feature(aa64_pauth2, env_archcpu(env)))
> +        pac ^= ptr;

All if statements need braces, even one-line ones.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
