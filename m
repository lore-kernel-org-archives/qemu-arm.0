Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3275572wrv;
        Mon, 29 Jul 2019 08:25:13 -0700 (PDT)
X-Received: by 2002:a9d:390:: with SMTP id f16mr27298404otf.93.1564413913483;
        Mon, 29 Jul 2019 08:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564413913; cv=none;
        d=google.com; s=arc-20160816;
        b=tCZIaRkELf60KIyEVxst/5C8V6ZSNfyb2iJC2y8c4hhMyy63sciKfD0m+fY70sFYvP
         QujRJUoRoqCMQdcISjlt1ICiVH3hOSXPZsnYsJCh+i89yc6Ws1IZpJz3znUNOZMbYFDW
         XSdR51bKo91QQE5K43mvhXiPUj8ZFIb2RbHRl6XdpuxbJ8biPyIARXLrCOT6XKbm5XKE
         3ObR2knoHvZP1RDu8cuXU4J7wwqaZA9cvkxHIhvjlZoVhZ48Pwg7BP8+cfVxBTcyNILj
         F+05/kDo0wnuDtxFGY7wIIlNAFKTKpKeQvZcsCbAV9OCm53if6s7tyJnHe+w4rdFcz4v
         P1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tQYiCRtH26Y87PUAK+IaWA2wqa2SPbVQTyBd7IRKLsk=;
        b=y6XipDyxFZcMfqAB1WjgYMWyaLWMYElFB24kQn/XzPhqzVYRoZFb0Jsl4MA8o4Om/M
         sCKWHp/kE1Iv7LkbilOMxHWFiJoYkX61+pflvYx1H4POGvDWJKtp3TjP1Qh1nfnWZr2T
         SE/AAC7EpruB6QRreD1YZkQncjeHdBuk2HzcDu2DpTWq1isMntJNXk+uSq3GWdzs8FPB
         LYa4Mx0F6lGHvZGbT7MpnDGt0yVZDWstod/rq0wYW5yUmACYwpKxQcJqluZOZ1t5QzzV
         leDx58Ar1FIIa5LgxBbwu94s6OvUboPnw51ci7V+cwtyOYyFE+U5CyBRPbVZ5hqq4B8A
         i3Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLP8Eq80;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x2sor31875601otj.6.2019.07.29.08.25.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 08:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLP8Eq80;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQYiCRtH26Y87PUAK+IaWA2wqa2SPbVQTyBd7IRKLsk=;
        b=oLP8Eq80zZ+LtAyH1PCXM4arflZobiuSFbfAxFMA8wz06KiI3xl7e8uVB/szZKrndI
         C5jFQZLvTZaRylFFXQUt9qw+4tvafpEYLa5pcAq+a9fh5rKY/k7h/MeFYvcfAsHL8MyE
         yVnNwDxhZApMmFWrCUpmGr9HxhU6+MEs2VcmSg08fpCrUpsi8TkigS19ElxZksTeeou5
         yTRS5s5eyT7TdyLDtA+sOwZUWBsnnbd7CcmPFNNYKpSrz0mEGAyodPRmNBJ9nHpnsJH0
         rRPZJQtLNskj0QvfvSai22kSLrzzxrmrea2wt2eKbN3B532VMVYAHbGxaBBfkE7rehs1
         mNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQYiCRtH26Y87PUAK+IaWA2wqa2SPbVQTyBd7IRKLsk=;
        b=CD+akFgjCimQ+fNqu2zD+PD6gEqcMetx6RcJ4Xy8AFpe4CtwYxB4tyAKjleXT6+8q8
         qVq0wpCZ7ZtB2yJSP2PrCIksrCpVewBC2pXVaibm0fL5q0pDDsJgZAuOTagZtWRsbXyw
         BAb7p+i9G8njiKvpTnD13e/+t1+ine4QebB1dovlVV9ZHZbzFofw3sgL8AtFCuyq3CGx
         /VKCJnvJeOO2bVDSCx0h60ST55uiV1ia4I0lU7AUdpCxbn+Tg+fjoV6wLdF+1QN0dL5v
         GfM5MWQ3SXfAmIsl+6CSqoHkUwjwRP59CJFbLmEDd49sPhNFHyiym94vbR2dxK/WIP0t
         HS7Q==
X-Gm-Message-State: APjAAAUUIfFljAJ7CH1eacoih69d+CQ3xArdc93Jwerg+sH4I++Gba6Z
	lgMt/ZJ2VnIuOYpRQ0MzipKIHMlSuwGr79JSWfN3ZJ9gbpI=
X-Google-Smtp-Source: APXvYqyHGBy0o1S+GW/fiyxYO7K36GVf7P4Iggb0dnhOpWtUkK04b1dVFS6YyhoBhvKRlGlRspj1Bffsxx9heghLtWo=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr76836544otj.97.1564413913114;
 Mon, 29 Jul 2019 08:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-14-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 16:25:02 +0100
Message-ID: <CAFEAcA-DG5JXVTT5tz7eJa03VWMxmq4RrujbQTk0R7KO-TAa6w@mail.gmail.com>
Subject: Re: [PATCH 13/67] target/arm: Convert Data Processing (reg,
 reg-shifted-reg, imm)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9+8IvIkYgJzQ

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do these all in one lump because these are all logically intertwined.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 747 ++++++++++++++++++++---------------------
>  target/arm/a32.decode  |  84 +++++
>  target/arm/t32.decode  |  91 +++++
>  3 files changed, 536 insertions(+), 386 deletions(-

I'm afraid this patch is too big for me to digest :-(

I just spent about half an hour trying to figure out whether
the changes just to the thumb dp-immediate insns were right
and didn't manage to work through it all.

> +
> +# Data-processing (immediate)
> +
> +%t32extrot       26:1 12:3 0:8  !function=t32_expandimm_rot
> +%t32extimm       26:1 12:3 0:8  !function=t32_expandimm_imm
> +
> +@s_rri_rot       ....... .... s:1 rn:4 . ... rd:4 ........ \
> +                 &s_rri_rot imm=%t32extimm rot=%t32extrot
> +@s_rxi_rot       ....... .... s:1 .... . ... rd:4 ........ \
> +                 &s_rri_rot imm=%t32extimm rot=%t32extrot rn=0
> +@S_xri_rot       ....... .... .   rn:4 . ... .... ........ \
> +                 &s_rri_rot imm=%t32extimm rot=%t32extrot s=1 rd=0
> +
> +{
> +  TST_rri        1111 0.0 0000 1 .... 0 ... 1111 ........     @S_xri_rot
> +  AND_rri        1111 0.0 0000 . .... 0 ... .... ........     @s_rri_rot
> +}
> +BIC_rri          1111 0.0 0001 . .... 0 ... .... ........     @s_rri_rot
> +{
> +  MOV_rri        1111 0.0 0010 . 1111 0 ... .... ........     @s_rxi_rot
> +  ORR_rri        1111 0.0 0010 . .... 0 ... .... ........     @s_rri_rot
> +}
> +{
> +  MVN_rri        1111 0.0 0011 . 1111 0 ... .... ........     @s_rxi_rot
> +  ORN_rri        1111 0.0 0011 . .... 0 ... .... ........     @s_rri_rot
> +}
> +{
> +  TEQ_rri        1111 0.0 0100 1 .... 0 ... 1111 ........     @S_xri_rot
> +  EOR_rri        1111 0.0 0100 . .... 0 ... .... ........     @s_rri_rot
> +}
> +{
> +  CMN_rri        1111 0.0 1000 1 .... 0 ... 1111 ........     @S_xri_rot
> +  ADD_rri        1111 0.0 1000 . .... 0 ... .... ........     @s_rri_rot
> +}
> +ADC_rri          1111 0.0 1010 . .... 0 ... .... ........     @s_rri_rot
> +SBC_rri          1111 0.0 1011 . .... 0 ... .... ........     @s_rri_rot
> +{
> +  CMP_rri        1111 0.0 1101 1 .... 0 ... 1111 ........     @S_xri_rot
> +  SUB_rri        1111 0.0 1101 . .... 0 ... .... ........     @s_rri_rot
> +}
> +RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
> --

Why do we split it up into all these different kinds of patterns
where some insns have special cases for rn==15 and some have
special cases for rd==15 ?
The legacy decoder doesn't seem to do that -- it treats everything
the same.

thanks
-- PMM
