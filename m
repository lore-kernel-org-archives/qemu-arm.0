Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3217762wrv;
        Mon, 29 Jul 2019 07:28:07 -0700 (PDT)
X-Received: by 2002:a9d:6e8a:: with SMTP id a10mr59719005otr.295.1564410487276;
        Mon, 29 Jul 2019 07:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564410487; cv=none;
        d=google.com; s=arc-20160816;
        b=wmddeomrncMNERduRBmSOnEcuBQDDJqMGZdnOTJ2d1M1aWHNiom4WGZmWc2PzlSJ23
         nQSvfbZNVRHCvi7ZZFZ8Gd8RHIz/uYgss/vwqW0FQgBqKVbZPq8U5AV25HiEgIManUWL
         el/3eDaDp3IpVEe6mkDgANfu5Qt4EyFX0509V17/P4LmXtmdqNE/GoSwpk2XG+pXQTWV
         QPnBVXKogkuLI3HHjXDNHgaEsoIaZOzeDRdefyN+xeVMOuARYhhC1wGr+X8WZnNIuo6E
         EKY/a61qNPWySIW4svugXw0j23g9cCcDpjUnHPu4CpgiFn6Fdt6kEmkVzHEnMpI84F3o
         A08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G/BuWzqNtq5jAyvfb8olfDJnA/QVrRW3asuSmhAdjVk=;
        b=DfRFnYuOWzdAwMEiHYEEV1vZFDWW/4ivKwLUvo7b+RgnkrrgjNbA1Of5EFxcrbjBUI
         ADspLZJ6hUyYbwWjZkIONZzx3nXH1t4p/9zVIh5iXU4gXvMY9w1S7b5zSNToDVa4LOuG
         9RpmQmq+jytWINHh7V/mg2wuuS1x0U9mS/dYRAFr1yVljT3hKH19ARmBe4MMMSjMzoUj
         j9L9JDX52JD98lSt/X085uWaYcu/DfGsFuZi8cGWjIBj9U9p8SocV7FJGRGsRft4WpAo
         yw61QCF2ICZUNLJCy3EMuBEqsFc2Gbom8yNcKFT1v/zFAZJRWWcowuCEE05gg8s31zfN
         QzIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/q1rwsS";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r136sor27925795oie.105.2019.07.29.07.28.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:28:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/q1rwsS";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G/BuWzqNtq5jAyvfb8olfDJnA/QVrRW3asuSmhAdjVk=;
        b=y/q1rwsSc1GgE6sPP+McQtxnVvMxtv/pmc7hx4RgUCz1BhaG8GxI99e0eBjHTd3HFG
         AI49eVzL/YT3B2bku/0QLYfcvgF9g19QVrBkKntfgMfrIoRwuHlwoeHyk4e8zAufVmE5
         b/CrKmFIZENIk3AhGRlWJ9O/2W1EyuKgqQFKfP64UjYPbrCzEubmzUnuoe33ONwU/idW
         36l22JQ4PXhJ7eNu1WJ8gcdnTcLcbiTJ+kH+aMJIzT1I9EYya7nncVYzv1JMIlDranVl
         sW9eUA2tAu4lfBmG6U4+qTP2maPhvCRFXx4VS52NEwIG/T+7sY62nrA3WIej8XLrXIcg
         92LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G/BuWzqNtq5jAyvfb8olfDJnA/QVrRW3asuSmhAdjVk=;
        b=Z8uYbGxShCzodw32pqPXDrflZr90birMDlYDomA2oEdXeTw7QOWWIHJDQD2VHGHBoo
         2fRW6XuKczelZoxMpNfS1W17j5hRZC+KZ8qhsobtpqZW38ZDd0KKu6RTTg6XGlV/9tBS
         umpmtzogxsHb9U8QpIEK5a4lwL85rQPcRcP5cd5IRQqEvoN5Aaoy/eYCL+gA8cGR0Ony
         qjzYtjTgFdlqyVyf7BZL0OXGifY2Zed+QEOdPeHs+04bgtCD3XLnNOHQXtGiYt8iijbG
         tGOnPpa40cQeLRDJUBbPzgf9UIg7sldZp2NvZkqdIJaDE/4/YifwIMQz7dv+zQDk63CZ
         0I5A==
X-Gm-Message-State: APjAAAWC3PgdHCbDCd38mrm6PxdhYe/3I2V8h8nhIzv7WBkfv7hUwbM0
	Bm5dqTucDtkFfi2ZKJtfGeNRcGIYoWQS5dlMg3mWBxVemmo=
X-Google-Smtp-Source: APXvYqxBsYHtIwQHZcthHeTtum77cnojxokSbK5cLQ2JxwOoOixjI3jSICIA4pyfoW3kLJjMJ0PStRsFRHlRJie4qGs=
X-Received: by 2002:aca:6185:: with SMTP id v127mr55776444oib.163.1564410486916;
 Mon, 29 Jul 2019 07:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-10-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:27:56 +0100
Message-ID: <CAFEAcA-H-EsfZHHBp9Q6aFRWA2oK27AihTQDSGO4g_gWudC4wQ@mail.gmail.com>
Subject: Re: [PATCH 09/67] target/arm: Fold a pc load into load_reg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ajWISdtf+NyS

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index e316eeb312..53c46fcdc4 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9161,11 +9161,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                              }
>                          } else {
>                              /* store */
> -                            if (i == 15) {
> -                                /* special case: r15 = PC + 8 */
> -                                tmp = tcg_temp_new_i32();
> -                                tcg_gen_movi_i32(tmp, s->pc_read);
> -                            } else if (user) {
> +                            if (user && i != 15) {
>                                  tmp = tcg_temp_new_i32();
>                                  tmp2 = tcg_const_i32(i);
>                                  gen_helper_get_user_reg(tmp, cpu_env, tmp2);
> --
> 2.17.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
