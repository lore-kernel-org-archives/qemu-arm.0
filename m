Received: by 10.28.71.27 with SMTP id u27csp1349439wma;
        Tue, 13 Feb 2018 06:26:41 -0800 (PST)
X-Received: by 10.157.12.233 with SMTP id o38mr929470otd.343.1518532001521;
        Tue, 13 Feb 2018 06:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518532001; cv=none;
        d=google.com; s=arc-20160816;
        b=J09CSYvDXQGUMQnseA1W564+W+j7xhEHM/B7sDoDm42DxaFY1Y1aeJ6pKQ8Gg1Lvov
         UeMqqSyGa3DtdaeAp62CSnyOmNChC19tWAaSMzHrOWDAIb41Qz/CrnBYwtKUB/IRMoLp
         eCy/KXafG3lPqCqqGGHWEC0Gq5zJWXlkcuvLWsSxjCiWZwCIlIJLYn5TGv4U+CiuWmJ5
         34Vu+WQwWclhPruoIMUVJbsSlkz8U4LWUjNBlgPoM5zZjx3zhTECCx3QzC1wiwaPiWpL
         hCNg6st5nSgDcla6+QKr0AQSaWelH5tP6j4CjxfYH6MyHZvs5HtJvdkelr8BtC/En4s1
         A/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zQcGjOMI6qUC0I5hF13DVrqgyNkN4qnYEP+U0S9eYQ8=;
        b=OUlAr3adWLvWnuO6mVpLz6/RH40s5e6s/svfNH7qEj8cnVWNXAKxZ6lj2ZD+MX1Vhf
         nfVEOPtIFW4vU1hOUHGjYgfnLbNcVBme13pzZCdqXRNiW7cmlpmIRQfN15kE5yJffeNl
         xwDkORKUsG+Kgov2YeKQdu/NNwA+qW9Zcqd2hknppirkhMOBnGplLk9usBknxknyym1p
         Z7xqXL64/hfu/79imGWa8nLO6cXK9sS0Jwl5PiiVzM4khYEyF9kKDe5wb+aVdbF3Vp6H
         GKfsbHXWzRxsJIMTt6sPTVR5SXf4lOtuMNLdXFfrx4UWQUsztJ8KJLdvJVmKxBJL3SoH
         SjbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmDomP+U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f6sor3789105oia.176.2018.02.13.06.26.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Feb 2018 06:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmDomP+U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zQcGjOMI6qUC0I5hF13DVrqgyNkN4qnYEP+U0S9eYQ8=;
        b=OmDomP+UW6qNXbn+BQeFUeoBAdUL/NXyN9OKf2Ar30ZHGRB336yj+FXD/X6GrMsvFU
         vyOJyTJk3C+IjRA8uEqgMenK2EnmUT4+xfKeWm09uBwbIhB/UMxG6xKxnYCoMihlcqRb
         xKOkoZxI7PC9HYJShswdMHNQzbp2gXmCuJgXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zQcGjOMI6qUC0I5hF13DVrqgyNkN4qnYEP+U0S9eYQ8=;
        b=MBXJ4vGjZpW4YCm8m+exY3pePr8EV52roa+h6EmHW/oF0kkwDHBIt9EXeJiEnRnexp
         UTb8yBIertKVjwtUGWlSvHlSe0uIuYJaOhkjF0W/UL6snByfnJlE8XyqgeKGrqafgPT9
         V2a2foTdMSda1KCjBf7xqRrjSsf+3/ouCAmJV36mKjJeJo9WcxWmPb8L/VzF6anNgasL
         JoGbbKIS9Je5DUxTP8ad4kbh2Q1O4NOcz48AuTOSZRwRIPSqksTMoGD74Q/VxJYAOvtB
         OOYs76Wk56AMbpxz6+ajDOndZv3FD5HRgclc+ENnCAVujVWgwe/xsu9OHzcHsuKYn1TL
         XN8w==
X-Gm-Message-State: APf1xPDhnsplBokwGIBXjb+KOh0Z0Hr369PCWLcmgLjWT+ucPmbflVIV
	Bm/YXupaWgQdhYOkPGnA0O7n+e2/HU72X4g3KPxILYnJJ3s=
X-Google-Smtp-Source: AH8x225Dq6pZHQxMqGJH/E8yJNV5PIWg7pjdA0XeOWIdU42BJSInS4k2r5nKbSXnVRrQHYEE9eao5HxKtBhUVmX0DaU=
X-Received: by 10.202.252.68 with SMTP id a65mr941565oii.256.1518532000940;
 Tue, 13 Feb 2018 06:26:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Tue, 13 Feb 2018 06:26:20 -0800 (PST)
In-Reply-To: <20180208173157.24705-4-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org> <20180208173157.24705-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 14:26:20 +0000
Message-ID: <CAFEAcA-=Oh=MgSGoheP70o9dy0hgo64PBtRH5u1u51bjqUAh7A@mail.gmail.com>
Subject: Re: [PATCH v2 03/32] target/arm/cpu64: allow fp16 to be disabled
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Jt3fzOzb03fG

On 8 February 2018 at 17:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> While for CONFIG_USER_ONLY it is policy for the "cpu" to be the most
> capable is can be this does cause problems. For example legacy RISU
> runs would fail as there are a bunch of implemented instructions which
> would have caused failures that now trigger actual calculations.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>  static void aarch64_cpu_initfn(Object *obj)
>  {
>      object_property_add_bool(obj, "aarch64", aarch64_cpu_get_aarch64,
> @@ -283,6 +303,13 @@ static void aarch64_cpu_initfn(Object *obj)
>                                      "Set on/off to enable/disable aarch6=
4 "
>                                      "execution state ",
>                                      NULL);
> +#ifdef CONFIG_USER_ONLY
> +    object_property_add_bool(obj, "fp16", aarch64_cpu_get_fp16,
> +                             aarch64_cpu_set_fp16, NULL);
> +    object_property_set_description(obj, "fp16",
> +                                    "Set on/off to enable/disable FP16 e=
xtensions ",
> +                                    NULL);
> +#endif
>  }

Good news everybody -- this is an opportunity for a naming bikeshed
discussion!

The property names we use here are effectively ABI because they'll
be available to the user on the command line, so we want to get the
right names. This is the first of these, but we can reasonably
assume we'll have more feature switches in the future for various
other optional instruction set extensions.

There are two obvious choices here:
 * use the architecture extension names from the Arm ARM A1.7.4
   (in this case that's "ARMv8.2-FP16", which we could reasonably
   abbreviate to fp16)
 * use the hwcaps names that Linux defines and prints in /proc/cpuinfo
   (in this case that would be a combination of "fphp" and "asimdhp",
   since hwcaps reflects the ID register setup that allows a CPU
   to report support for one and not the other)

Whatever we do, we should have a comment describing our naming
conventions, so we can follow it next time we add one of these...

thanks
-- PMM
