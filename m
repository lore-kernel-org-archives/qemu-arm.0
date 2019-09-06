Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp658583wrp;
        Fri, 6 Sep 2019 05:54:35 -0700 (PDT)
X-Received: by 2002:aca:4797:: with SMTP id u145mr6901639oia.19.1567774475750;
        Fri, 06 Sep 2019 05:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567774475; cv=none;
        d=google.com; s=arc-20160816;
        b=xVSsU088kwy+zNC4/givAQZdYcL3l1zZKhORpv4WOqBmiO+W4UtIa54n+avLYSYaGU
         vMSmnLGqu154N+cIJmbd348u9ifm9Xc3U7Ri+yPPTRFpXbVX3sMWt+tDr+j21F6J4p9q
         0h+eI890tU+g8zpr3Klb9SXxaucGa1fq1R9sqJv/+YWvtT81NF/3qwqdwXzmqhNwi+ZM
         IHc2+L6iHU1TLj+RQAx691/a+DtttabNKAH2lm7XGP7OHX6rHcdZYNF01AfVICg1SH0e
         X7AswtRArNPy/N6xKjtda7CyYWduHz81W7rXs7VQLuSxmr9Y9W5qaehagxlYn3nlVr1O
         J8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99kRWFcUQPb4CAJhJZA1o6dq5nYip7uaNgoR+RUnZrQ=;
        b=t85fMbtYvk41W+P8JU38Jhkn7gp8toLcpyDZewa0VfYD6SZAeiBSJ6hKrWxg+SdK0r
         HmGx7KBSjHtJVxSX4koNnPLhU8aqRHuForCZvxIYgYnfFf3n8bVJ+8TYjtPOqFFwDkeD
         eklQ6mXxgiUBJM0jrrb7WCKq1hseByvdCW+hgZDeAvxzKgd16MzOg5CAAccMvCSi1oIE
         kGAaKbEuJNPnrW5M1OE6fcigOAtRfkBQxhcn0M+WiNEyypyvKGJ4usx177tIksJH5CeC
         FHXXUbn0WAp2HebvmuwAda2Jc5d157BUD7OPgA1kHLiYcoMdd+ePQyRsXf7sY4IiFZYS
         Tx6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2Jh6Ndc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q12sor2864343otc.151.2019.09.06.05.54.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2019 05:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2Jh6Ndc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=99kRWFcUQPb4CAJhJZA1o6dq5nYip7uaNgoR+RUnZrQ=;
        b=t2Jh6Ndc4C3GEe70MSXP7LygU06U8OWHdpT4kC3NFd+YfzkDTVkbQF1Mv4i1slxPD6
         SEM4mXCeqJ0ax9IlSYxBP089SicXIfLqr89DgY6ciJ4vzIHoHVRgNj06R2A5CHHhmD4/
         x29x4MIHc3gh0VoCr+0e0fl9q8jk0uSnTfZyT3KXfi+1QTik9V8NvqLSAIPieWmyKzGn
         t+z57BwxfjXMZ9CidhYt+4yZkQXqPra6RcQYrhHl63DQdxURBHVde7WHuvOqAJnw5zob
         HI1IH18bdyy6U6YML/Q0syCJ8ysxDN0D6mYd2JRazsEv2qNpV3dfl9oOrUFohR6BHGz5
         or+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=99kRWFcUQPb4CAJhJZA1o6dq5nYip7uaNgoR+RUnZrQ=;
        b=URheKfmjAlIUyrXS3pqzegrDKpMWVAYpJLtZ2tf6tbmnficZjbJ/p3TjxkOtbS1kPP
         /KUlVJnjaKmXZ5yptBL0N6U2GRv/wFg2hdYUbyblbajeFjBnRO7pmo7nP9affthZp6kH
         1EpFwZAxl3R1F+FC04GdKyhcI+9OQwNVl1QO+NhHAmqmsDbZYPEmePTUozd7tMLKqxNd
         QLhr+aEy7TKeGHPSAMipLzmO4jUl5Gbe6hup8jAX5J/uW8dKsvcmehVq7tj9cE1nvp7p
         pnGYKk6GZVvkF/JJ49XH5SqXg4ubTJwwzyrNyW5pRPBSC/exDujGyGsQywgo2yfONNPT
         NDDg==
X-Gm-Message-State: APjAAAWuKeybRM0Ftnh25ewPFsbO1DFwgGQ1rzKWaUK6gKOuEzmAOLIi
	nhEE9Hc+RsOduPxPcqkkSZhLiE3KbBFW08BnkqZ5thkVMFu2lQ==
X-Google-Smtp-Source: APXvYqwePGp+uC8QK2lkl3OYZ58/AESKxdudkcMFlBu4HcbUOa1szORlGsm6pgEPqda+OF4RBsnTovoL3y3xlEVaHDA=
X-Received: by 2002:a9d:65cb:: with SMTP id z11mr3879997oth.232.1567774475085;
 Fri, 06 Sep 2019 05:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190906124706.19145-1-alex.bennee@linaro.org> <20190906124706.19145-3-alex.bennee@linaro.org>
In-Reply-To: <20190906124706.19145-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 13:54:23 +0100
Message-ID: <CAFEAcA84VXqw+ZGP9Nv=Wy069ZU_C0WkVdv0h28GVbnzyx6w6w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] target/arm: handle A-profile semihosting at
 translate time
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZE5EcPifoWSg

On Fri, 6 Sep 2019 at 13:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> As for the other semihosting calls we can resolve this at translate
> time.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - update for change to gen_exception_internal_insn API
> v3
>   - update for decode tree, merge T32 & A32 commits
>   - dropped r-b due to changes
> ---
>  target/arm/translate.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4cda7812bcb..ed4a97cfb44 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10222,14 +10222,25 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ =
*a)
>  }
>
>  /*
> - * Supervisor call
> + * Supervisor call - both T32 & A32 come here so we need to check
> + * which mode we are in when checking for semihosting.
>   */
>
>  static bool trans_SVC(DisasContext *s, arg_SVC *a)
>  {
> -    gen_set_pc_im(s, s->base.pc_next);
> -    s->svc_imm =3D a->imm;
> -    s->base.is_jmp =3D DISAS_SWI;
> +    const uint32_t semihost_imm =3D s->thumb ? 0xab : 0x123456;
> +
> +    if (semihosting_enabled() &&
> +#ifndef CONFIG_USER_ONLY
> +        s->current_el !=3D 0 &&
> +#endif
> +        (a->imm =3D=3D semihost_imm)) {
> +        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
> +    } else {
> +        gen_set_pc_im(s, s->base.pc_next);
> +        s->svc_imm =3D a->imm;
> +        s->base.is_jmp =3D DISAS_SWI;
> +    }
>      return true;
>  }

Doesn't this accidentally enable semihosting via SVC for
M-profile ?

thanks
-- PMM
