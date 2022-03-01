Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp222557lfo;
        Tue, 1 Mar 2022 14:21:00 -0800 (PST)
X-Received: by 2002:a81:1e42:0:b0:2d7:1e37:cc26 with SMTP id e63-20020a811e42000000b002d71e37cc26mr26871306ywe.139.1646173260111;
        Tue, 01 Mar 2022 14:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646173260; cv=none;
        d=google.com; s=arc-20160816;
        b=TqFX5EjYH6IbbdAewnyWcu0wSBHn+xbiVEIgK8/0m6Eiq7rfFQn+rDklJ9gQsp6LQH
         nVLZ+UI2yOxoN2Kb6NOfUENbZ+GZx+JQ54fqvkFmKtN9iBywMv6Mafuej8zG7tN6wNoD
         mMk9uDILOCs846QwAynBfhip2oOq7rAPW88FyKO1K6q+m3v3D4viDrzNG77/T75+FdHW
         tKjeHWGYdy7nxuv0izdFJzaoeuetl5UgAsujQgVksH8h98pM7oWBJeCT1NpCTZM5a4V3
         RN+BZtweBrj/U+HzyzRqS6uLEyRBnMGUXG/TSt3XWa1IrHfdtX5tP46XFt0skEtKaJEd
         qxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dhAeB3XS+OL/ga59IIf1XT2CF6fYk7bEx44MdL8Yl+c=;
        b=U0w7Ct4kbdQcYbXhsVEGV0jvCQdNnTa/5nZY0o7vWxCVQJfmmh8VbdXo6BdYhjYVmf
         ZigS8Rq/AjAdy3+H5oVKMlo99qHE1KKiJxcCB2U5+hZRwjs1jGXcs3csUDNGmhD0pyON
         MaOq0MQy04RZ2QcQEsWE4Q3EH0l89nZc7KVuM56mcF9SyK9a5oKTos1h/9WutgA+fxEp
         cs7medw7Nkb+2qtOUNRYbhU8skFXrTmistj0fRMUSnR/Q2ZNdbgzLVQQ40zxjTQc3njs
         whJpLBYXYUVxvivNxlD/OUXPHnLKfpzeQActccC8XJaMPAolAbO7VfMbv3BUygPVbhFg
         jL1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rh6Ks4gd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd20-20020a05690c011400b002d82aab9878sor3413367ywb.12.2022.03.01.14.20.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:21:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rh6Ks4gd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhAeB3XS+OL/ga59IIf1XT2CF6fYk7bEx44MdL8Yl+c=;
        b=rh6Ks4gdfOc3rgVWdiSXU3uDOFBlTD1wOoZG5A9Jb/OTgbPMLJBz3Nuob5tCg8vkKn
         zE2T3sKcasmzpmHdCA0irCFOK1eFEOrFk4e/ZTYi4Id0utNAO1n8bBqCfF35QoVDOk08
         jXk3A6JiGoDC0GQhnLeEhXoar/jjwbVWE2PKds2D69rhix/wUQAzgwa10KKlGZXp0/50
         PoZyOQ6OAnfcETbsGnSmYNV9ofEbxH9DOXeNYds2M9Qm8iKfRRJZEaOQfIcHUpuvlOOY
         8TpjmANjxNPsXml9JXGg0UHA1YGKwldbvBus4NrIVPlvJW65IzknNKeLXMIbMsAluv1s
         KN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhAeB3XS+OL/ga59IIf1XT2CF6fYk7bEx44MdL8Yl+c=;
        b=JKdVCZm3rs75ssjs8h3VdxCVpjcHWq4p+DWTigfQTezDC03AJN6PqyrG8fXXryK6Lr
         KsmfTkJza9JJXgxdAlrkN+q/H/DC4px+gZM0D/DzzKhgQnq5hs5OKyWiASGpjbp9b9Ww
         Ir2zJf3aoe67IiDoeNORJwjj+7fb9dPIL1rHrOmKxJz/gaW4QguGnMMAjsfcuPmPNJRe
         7EmGrE6s0rIP8Ip6EDW4nvvzOLoo+KvnRcBkE7jLIzvLYZFRCL6fb+4qz2JhHFluk/XS
         h0hh+qEshxzcaZW3IQApv/AQRtO1q3bgLMcJCi3dv19CviKSwPQn7No6Ro/WsfHmKFPn
         0Hsg==
X-Gm-Message-State: AOAM5338zBnWVhBIhM0vq+S1829cTsTNM9yNRX6cB+tBkPZ75HEHln8S
	HWVhIi4nSUyKErZl30npxcgsxbexJvbUObE+oYbXSrq5mg8jPw==
X-Google-Smtp-Source: ABdhPJw61hcDv0GMmlt0ZB3J0pnozlAupxUqiz6/CHM1cJ3/oxr3L4f+/QeLZClp3upxXvOwvj4GYPsIIyF4wJJm0dE=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr28413307ywf.469.1646173259749; Tue, 01
 Mar 2022 14:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org> <20220301215958.157011-16-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 22:20:48 +0000
Message-ID: <CAFEAcA_wybTgyAW6wrqeNhG7wOZp3Hxr0qN-V+yEovJmJhcXtQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] target/arm: Advertise all page sizes for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: /kPeDQsDz6ge

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We support 16k pages, but do not advertize that in ID_AA64MMFR0.
>
> The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
> to the same support as stage1 lookups.  This setting is deprecated, so
> indicate support for all stage2 page sizes directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d88662cef6..2fdc16bf18 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
>
>      t = cpu->isar.id_aa64mmfr0;
>      t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
> +    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
>      cpu->isar.id_aa64mmfr0 = t;
>
>      t = cpu->isar.id_aa64mmfr1;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
