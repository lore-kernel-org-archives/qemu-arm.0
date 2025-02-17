Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp70828njb;
        Mon, 17 Feb 2025 06:30:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9a019aO87PKRJPpchramIjVCqKQTDfTcSKLaWKFYKV30xzvCM9UQ8FBhrURmlaPdC6oA1wdocAXR13Q==@linaro.org
X-Received: by 2002:a05:6902:230f:b0:e58:dbf:ed09 with SMTP id 3f1490d57ef6-e5dc9038eaamr7882437276.3.1739802603477;
        Mon, 17 Feb 2025 06:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739802603; cv=none;
        d=google.com; s=arc-20240605;
        b=T+hN+HmlfDl3kFW7JUlaVYpvMlwElII4EEZHVuf5PeyzsGEKHsTrxOiMnd5T8TOgEe
         plHx7497RC4WUwl1Y+elc+h7whU9Fj4f07EyEswXhsq2RL/GYPERHb1+F9c4UQ3FdrIk
         o9otRpjIG6ZuhtGtFXZ807ri+ZthfZZzu9IGOnX1tQiB/c4pd+mJfIiQr8mR5jGRBCb3
         I244SH8FebtEPpWdrw+vuasIROJsgIkWtFwPi3GDv0oihTm0BNbakgYcPNwNfuwHPpVU
         bAg/6T5iZdmNnPaIr1nfFUvfqbLJQrgaiT/Ar1uT7/HWvKkd2XgemA0ZO8NyRzBCHYyv
         iCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=liAnHmT5fS5HSmio2jxDsDuUAn+/oAc2qvcRTq1qX04=;
        fh=yB6wVEW/cAXtZ2+0h5waUVgrZtdNbnsk7rgZ0K+uUJ4=;
        b=R6xlYehmX6DEIskgTh/pa8D7GPK2124uywk4aELBvV9JPn0VyeY5k6yxeKYjZQWlq1
         752tios7ikUQSPdqw5RXpNuJaOMGyDwlH+CqPZGJoORON6jmIKDSIAnirD+0M26pupdO
         oFKRriiiX7DQl8vNjmSJYk+3fD0qeYHAlbY32O6oq8GHwNut46XCu7c6WDHtYoL4JQ7h
         TYr4V/1Oew7xmyEAiyqlUo6gaLwgrVKzHBdrJa86w6rNwDkBZTKRAyFD60Jtm1PGEz1d
         pVidHGnI0g9fUvhTyCZbmrn3GfMKlFhKQrbSEh7Upqjn9zs1TVyA/HsroIHUMl6+xa+6
         H17A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtCvR0jQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae0a1165sor4059665276.13.2025.02.17.06.30.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:30:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtCvR0jQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739802603; x=1740407403; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liAnHmT5fS5HSmio2jxDsDuUAn+/oAc2qvcRTq1qX04=;
        b=UtCvR0jQkb6+/udV61Rtxjxi3rlaM+uTaSFDoQhIwcDVgDqwuchwkX/7HliWr4+4YX
         2Ko4mIAeNbI/TVsz5RdR5mPyUlDOQiPqsO91RRKO3tHAbAebgNn2kWbcSGTJl7tXfSTU
         F6dQLSXFV98+wfSjLCYbddMzhTtyyjy2b41RNk1SqRbz80ENmRlMN278duGNfzyc/bGh
         HwQ2tv2HhE6ycJA8tBq0b8c/v56c+fgSggCEZBYQP/gROFcZXIJ+dVq4Jn8jzXV6t7Ri
         rBu3EwKWg/+1ebCmlcudn6B5Aetyk1K1nKrrSzoIz5HTOAr6MGLqDfQXSyujRJD1p3TT
         5GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802603; x=1740407403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liAnHmT5fS5HSmio2jxDsDuUAn+/oAc2qvcRTq1qX04=;
        b=nl/Yb5mERiJ9T2xzrH1AUfuURcDImOgfj08+E07M/K6VnnHo5WO5JkCzHGtMq+pw87
         Bp1F74t7T9QY9a6/gSiy11pkqaw3iyYenpWy00GjMUBIrCVm0JKXBBzEDMAwFtJRTOIh
         HqojTkUO+xOcsqUfxltG3PxtECiT+NAXY+XqMUe/PKYz6bS0x93+/pAS25a+p3TP0QtB
         NpG2JBqqxP60ItDq657tQ6NrKmivyQgiM/twbfaV5tulTMjVTKt6YaT6OtXf4jWYnHJY
         TgLD/Y06vGGBoCOwUgYnJYS23hH+R6Y1QwZtUpSK21+GGs3xtTawrSSRe98pOrYsuVMN
         jx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEuPLWiVS55NhFcyn/DOWSNTlB3NVZjPyB3BJCkm01jqylb5sIJHrJvh/pWRHKYcwWoqoPsYc4LWqPbg==@linaro.org
X-Gm-Message-State: AOJu0YxrMi3GIKnFcIieWuRbVre6Ml7AWy5PJX+SmPIKgVM2CDpa0uZI
	Au4G+gzc8mDFUmj0v2hz9sPiRuoGXbflwPp5O+9VAABZjvNotE0vbU65wcez7SuwDc3hGFCBNtt
	6RNYhg9xKPyGiGBR+BoelKqh59wGgTUFzj26ZQcep
X-Gm-Gg: ASbGnctI4Vi7xVZ0jL4/Kw6eJEzIHsTgQYkJwdP8m9EREeOfi1qDXgyjmcZWBqzTDtf
	S6dsVIANlx8Ic8go68zKH2eMt3jQMY6VNn7sJ0fyXedhkeMR8rt62wC5ylOkZdEMoCWnUSYhu1w
	==
X-Google-Smtp-Source: AGHT+IG50ql8EQiHUVNWvGjBgvI5c/kmmunIki99/t0huXXueWLxUaVzQfeucE+X8qbvWvU20j9f8DIEnbY6JZ91IME=
X-Received: by 2002:a05:6902:2283:b0:e5d:d514:3b5e with SMTP id
 3f1490d57ef6-e5dd5143c3cmr3965017276.37.1739802603061; Mon, 17 Feb 2025
 06:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-6-philmd@linaro.org>
In-Reply-To: <20250208163911.54522-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:29:51 +0000
X-Gm-Features: AWEUYZnUxAf4Ru77U3xAqCkMj9tdTGm2v0XTUscKEcCf_6EjA_UYhitmEbbzrx0
Message-ID: <CAFEAcA8ZSSD=TxCier0Ji8+DVDspgqKQeKJyVDZ+LEBy=j9=Lw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] hw/char/pl011: Consider TX FIFO overrun error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: L387ckrD+3vr

On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When transmission is disabled, characters are still queued
> to the FIFO which eventually overruns. Report that error
> condition in the status register.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/char/pl011.c      | 20 ++++++++++++++++++++
>  hw/char/trace-events |  2 ++
>  2 files changed, 22 insertions(+)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 447f185e2d5..ef39ab666a2 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -61,6 +61,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Ch=
ardev *chr)
>  /* Data Register, UARTDR */
>  #define DR_BE   (1 << 10)
>
> +/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
> +#define RSR_OE  (1 << 3)
> +
>  /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
>  #define INT_OE (1 << 10)
>  #define INT_BE (1 << 9)
> @@ -158,6 +161,16 @@ static inline unsigned pl011_get_fifo_depth(PL011Sta=
te *s)
>      return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
>  }
>
> +static bool pl011_is_tx_fifo_full(PL011State *s)
> +{
> +    if (pl011_is_fifo_enabled(s)) {
> +        trace_pl011_fifo_tx_is_full("FIFO", fifo8_is_full(&s->xmit_fifo)=
);
> +        return fifo8_is_full(&s->xmit_fifo);
> +    }
> +    trace_pl011_fifo_tx_is_full("CHAR", !fifo8_is_empty(&s->xmit_fifo));
> +    return !fifo8_is_empty(&s->xmit_fifo);

More repetition of expressions, but anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
