Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1858874njb;
        Mon, 29 Jul 2024 08:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQiUNzKXcqreYXF1D0ZW9lVv8Mg0o8I2RBgTEQZapgQwzvmg4w6irWeTp+kuy92Y+2Fa0qwFe2Ypps/Ax1mvRQ6/9YkcNL
X-Received: by 2002:a50:d55c:0:b0:5af:b1d8:f3d5 with SMTP id 4fb4d7f45d1cf-5b018be1558mr7975026a12.12.1722267639269;
        Mon, 29 Jul 2024 08:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722267639; cv=none;
        d=google.com; s=arc-20160816;
        b=ckvg+I9shRGKb+e6KU1F3FXkzxRQxL8eywfxTIoq+arR6JBCppnC82S/jaNDHD5bee
         yJVems6qHA1RLgLR8voXAYivn+5afBtLBMK8HiHk71IJHFGbuNlZe4s34iyHqlKR2NUV
         SYMJ8344TWM5v7tZmlgfoqkAPLgfzOryJOA+ALrTdsZOvjGxqd88jCajZkBHPYRL0mh/
         iDxld+GlSaAw3JqygRzqedky7ya51qasZQDjMbtSD2aB0b7Y1zLusPJWDsVxNHvZcTgS
         sesaWLf4YIpSfKjyxY0vEXu2VMhJurLoxmqDFWSKB5GcUdp8qhLuQH+zJv3EBQE5YQXD
         vd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zhPhz1WyFr6OWCnHNW2ET2Pv9i0NlzcL37aFa5r18w=;
        fh=qRDrBwH1/DzebC9nDPfNc8tRYqQYq/Ep83hlUhUygdg=;
        b=lKyzjcM5qynVq/fD1EXlgjXbkcNLiokeC1V4XRSSv/Dv0c76DRTs4i0+t8uneg6MU7
         uFfmmnnD0EPkkuSkwFbz6ZgP6YXbY4kE4qijkFri9p/K3bMV7PujmJPLNEoOadd22TL5
         IfF34oqFEV1dM4Qsc2itynEdFW63UhrPOOc1cXa19S+uRDhMYfT1vbjNm2QTMYNvVX2x
         kWixPRDnGYwL7X+8GZ8oJDpZCktWvtG1VoH8FDBwaYuCuoIjMI7vL7suvwPd95RJBSva
         wbnrrGLubt5gdcGROcVcAWcNaFen7+tJFwN4mI+iCNdAtitFNEk2L+tTN9+d53qzpQdq
         jkgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hPusNoz8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ac47a3e39dsor3511618a12.0.2024.07.29.08.40.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hPusNoz8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722267639; x=1722872439; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zhPhz1WyFr6OWCnHNW2ET2Pv9i0NlzcL37aFa5r18w=;
        b=hPusNoz8KHpBbHk1YU0QpmTKDOkTvblob/2QvNe5/IhmO19q4kjNyV5Qdh8fa0EUd8
         Ox/MQdSkUh8FqHlnbky0KH56+DzhJqihbyjyU3ObC7tLygl4XBg4sIngXy0Tm5nOfXUA
         r5ER6UunKuyNAXvj7RlyojRNwI9Sjgd/QdZwGBKlgmuHUnchIaU7fj62Gxv4G7ZhRKi0
         kQhiLONfJKfrUgO57XFy2qY7YyXpBtGhjJIAC02oz8DXlQAlTFBrPlJojIsnFt9EQdOr
         nY2aoplTwmqOTx7MZdRufQkkN5QTZNE/iqApklmNyhRMxhqLjn+WTq9NDlB5wF9h4wAB
         Uv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722267639; x=1722872439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zhPhz1WyFr6OWCnHNW2ET2Pv9i0NlzcL37aFa5r18w=;
        b=AdwxaIUTHs1bMSxHzYXzE6mt6Gkc2j49j/6LJPY5ZBS9HnEkCkQqOGyr9sY7X77P3T
         awtfUIXbOMvmoNgKgtiW1aeLMj/9A+UOaANxA9OgIxgTjVPePbBzb3rRiFAFf2CG9adG
         N5FqvZCTl4/eiFdwIN2VZVL8b5tjK2VGdMRpeKammT+v9jyzr/FfmFjYb2s/nrJXuhed
         CF6WXj/GyPYl5S6I7xO/KqYviSVSu1g+2AUkMp4kmQblPJIUmdNrnmEl9uUe7b7BCR83
         bjPV8LWA9k0bTmudkDRUYeRDiQJzAFCMjr8RwxXLBBlwKsjZChZwOBwJWvyWkteL1uEI
         FgeA==
X-Forwarded-Encrypted: i=1; AJvYcCUwR/2CD/SLV5Rmd7nP/d6AMDvJOrTkC0oRCOCP0S7zVcMS/Z6RgmZdW1EP0uAiDpWuNYLW4PJyKjVqIwfbE4qEV3Yl9Olv
X-Gm-Message-State: AOJu0YyTotzQ4B58hEIf0QijBhQpG50948YyoINuKEYzJuLw3FlJLGYg
	FpYgTt5qzWAES8hSK+7y4BHEde5rm2t+48nOtiReD6y8VeYNUGqU058gTG2ldjPGFakvVbrHK4I
	lIlspwFitE0ozGi2JZJuSDuDB3eayL89O5MBMMXNQ
X-Google-Smtp-Source: AGHT+IEoT0tvTEpK+85ua9qidRo75KoESF2Khtw47/eR1YKy+iffuzZxjqEE5WIl4PlU4A9O/Hi1ChFn1ZPNi2vsqnY=
X-Received: by 2002:a50:8755:0:b0:582:7394:a83d with SMTP id
 4fb4d7f45d1cf-5b018be38a5mr7475620a12.12.1722267638615; Mon, 29 Jul 2024
 08:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240719181041.49545-1-philmd@linaro.org> <20240719181041.49545-5-philmd@linaro.org>
In-Reply-To: <20240719181041.49545-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:40:27 +0100
Message-ID: <CAFEAcA9z61Wrvk45hVGuE134fOCJs2kr5hs5m6c9MEaarHm1NQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/16] hw/char/pl011: Move pl011_loopback_enabled|tx() around
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nQ36BCtbkxGo

On Fri, 19 Jul 2024 at 19:11, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> We'll soon use pl011_loopback_enabled() and pl011_loopback_tx()
> from functions defined before their declarations. In order to
> avoid forward-declaring them, move them around.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/char/pl011.c | 66 ++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
