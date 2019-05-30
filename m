Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp707460pjq;
        Thu, 30 May 2019 04:34:44 -0700 (PDT)
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr2072719otf.314.1559216084281;
        Thu, 30 May 2019 04:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559216084; cv=none;
        d=google.com; s=arc-20160816;
        b=xRce6ZAIJn3YeRuTUofGJ3pxyUTiAN9f93GLOKIQYMj6ZA2gZoEn/eisj95ZFzrJl3
         1D1fYPY0CA9+JS6tV1zQEL6NU9uQg977lcOQQP59/vyriaevBARz6RvIPEjBelKgSYxm
         ctr4mmJXrdUi4jN5c+BwS9HLt5uClpLwkeIDZnS4gqBfhbcg7beTMjs/OKZyczqSk+tT
         s5lftbzWc4cQdihdEO58ebQtrt2Djhrax3jt2ElcrtYxFxthD1BQ18YVOZdTsy1Vo7xB
         prSr7bTtlck6MwbGNiqgq12+kbIOazyv0pRtaH0DG2QpULglKwRzzXNy5PFKxY2kwO7h
         2lew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQQweUR61HlqBxToyidtRoqbK7HpyTAc26D60BK/KNM=;
        b=KYMdLDwa0ii86winSFzf0NonfDEKdwbcau+Nfcg64mhMN9FAcz3RTNeTP0kyJh9+hx
         5gBWRKvrtVmw/qO8JszLBlneGhLuy43M2ntQC21udI+oCUkALlsAJU1W6kBkR1NPxvq0
         A4kPKBdCoBoYsPoK1smFii0R5DgGwVhRSubLviXUy9xiMzs7V5sUh9MP6ju0lqvZl9W6
         cXmegFMJvRJMn/VMBIyLk/U9DA2TNYviO+Rhmi9lHUH9T05d6RFilDP7nozp9fbLtrH9
         7aVD/mT4JcdyM5+DOgg0pnsYph8vdwHS7xCCoq8il9Q1VLk98lIRBhE18MLK957etJsL
         ruvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mQR/+oXG";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t195sor873290oih.161.2019.05.30.04.34.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 May 2019 04:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mQR/+oXG";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AQQweUR61HlqBxToyidtRoqbK7HpyTAc26D60BK/KNM=;
        b=mQR/+oXGrmQn0rrzLOYrA0tF6jYJflsEZJvhyPlX8fqzoZZpBpwpl/PqfP68a7fd5F
         twVCqqeZfVm5K1Yc0rpzUnYE/nUFf67ZN+eAY8amvKYzcqdIapdhQf/RT+6/hKv4BPFm
         9qJKt3cpiq3HZNmYWmVtCwhLc2sCgFiFs2pbf5JU9bzOqvHEEDlFzF4PfURwZI1VtUDG
         Z1H57fekXyi7WF8m9/tyl5bqXruqEPhQEU+jgpgaL96fIft2qo/onixvUT/gw9F8yoBg
         9KP4/pPGjztfOUQJNVlQnT8BFUuaqY6MdB4j8NdO91XEeaNbmIiC6olSMoH3Ze4g+fu2
         F96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AQQweUR61HlqBxToyidtRoqbK7HpyTAc26D60BK/KNM=;
        b=S4N4jwr4lzuDjkspAwgrxVy0XbzCCzkwx4YKg5kskVwRR9nbABe1cnOBIaI9w8pCYN
         0jPI5HehX8LnbkQSVbvJPhynbchdwAJnTi1r7IMPI+YTMSb3or3ibDkC9F2lAFye/6Xg
         aERKTHREIPTXU2gXAMeohOtDsmvSVA/BzVM3ovdpp3DEbyJZI0dcanAesDZolzcrdmze
         ijsuTz1YLTAh+vSiLBUWHCMr2BihsdYP/a2aHS4svhdi6IG4FnHvppCLEvIQKf/4GMtR
         mzGitL4HX8LNeBmwzoeAy5P9LITtyMaQd21TKGCoN32f7g1N6u2chuaYqxG8rQ9/fkxJ
         t03g==
X-Gm-Message-State: APjAAAUmI+y+w50lYxdHkoCxtoeZ2POyKyfsNVHAjAMfnFXrhyTzQkhy
	uHDWafx4pkadoSjjax9pOgO38P2O8H82/9U3iSJe91QZf9fc/w==
X-Google-Smtp-Source: APXvYqySyrh1aQ8SZPPPiGXNcOAd7j26H51wFDWhJVReMnwJDoWMEu3SWxlvJWVl4XgmcUw+EnSVb7LGU1X2mPdwqow=
X-Received: by 2002:aca:b1c1:: with SMTP id a184mr2186236oif.98.1559216083834;
 Thu, 30 May 2019 04:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190528094953.14898-1-alex.bennee@linaro.org> <20190528094953.14898-7-alex.bennee@linaro.org>
In-Reply-To: <20190528094953.14898-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2019 12:34:32 +0100
Message-ID: <CAFEAcA8Azc9g7MfWE1_WbRQCMejHXpE62bYojRw+B9maAX=+hQ@mail.gmail.com>
Subject: Re: [PULL 06/28] target/arm: use the common interface for
 WRITE0/WRITEC in arm-semi
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: U7YVHQb0Xvi3

On Tue, 28 May 2019 at 10:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Now we have a common semihosting console interface use that for our
> string output. However ARM is currently unique in also supporting
> semihosting for linux-user so we need to replicate the API in
> linux-user. If other architectures gain this support we can move the
> file later.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Hi; Coverity points out an issue in this function (CID 1401700):


> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, i=
nt len)
> +{
> +    void *s =3D lock_user_string(addr);
> +    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
> +    unlock_user(s, addr, 0);
> +    return len;
> +}

We call lock_user_string(), which can fail and return NULL
if the memory pointed to by addr isn't actually readable.
But we don't check for the error, so we can pass a NULL
pointer to write().

Also it looks a bit dodgy that we are passed in a
specific length value but we then go and look at the length
of the string, but we trust the specific length value over
the length of the string. If len is larger than the real
length of the string (including terminating NUL) then the
write() will read off the end of the string.

thanks
-- PMM
