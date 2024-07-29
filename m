Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1863678njb;
        Mon, 29 Jul 2024 08:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU82Mj20gBNW5sVnYK/gg3subinkuY86lj1WYNYh+G8ezrulGJqIpH5P+oYd8jxMv944McLbFYsKWWQCH8hTtT7F36NXegQ
X-Received: by 2002:a19:914f:0:b0:52e:9958:1a66 with SMTP id 2adb3069b0e04-5309b27a4bcmr5135563e87.23.1722268300283;
        Mon, 29 Jul 2024 08:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722268300; cv=none;
        d=google.com; s=arc-20160816;
        b=VAzgmOV5qOyayE1rU7CE3TL3U7NrrpLIh7l14YUTzipGnHH9QvjCgqnz7TDDPxx23m
         m+IdDZAYAJba/ZP40NuSEI1XWQodG96c8yzwDJ6968ZWV9v5jvk0LXPoh635QFK8kPMG
         6C5vMG8HJrUZETLGQVRR6SkY/qy0VKi7I1UbhsBAKCJ6doHSHQFBRxXgiPrKdyFjhu0i
         Y0rUkPV3Hy8tXB8D9EU1jp42RPw7tMxBgRFM5Q2z0jFw/BCvqQ+ltBpTRuyhBZ+tIKwI
         jBQ7KvzXhRKawTxT09kumTsKJ4t42D/IAXc5JxJV62U9mBq7pI0Gu14xyhzfGvCz/uBv
         cwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVeYyd38oI4ymekSrtGt52u8IpbVV/D3aJ4+z1VG4jc=;
        fh=UPba4BVPwmdksGPiD8jYA1wbpVbsVJNxniyeeHlstVU=;
        b=NhHlSMuiJz2ZtadBIbR7PHh8Nh492KgkhPzVJ904jY/j2wVifjqXwzKHrgLoMT9NHT
         ikAahEkGz0hUU1cpd2PGUl0f9JrFjYJw9ojHtcc5osEGShxQCXg6vs5DgoczluKBx71x
         QocKn3guSIB35oy4rLprD7hFWuM+NHhO66y0i6+LqyNz9CiaWuytUbU/eSOr5ZZ+r4sK
         mA8F6aMr9s4t2fGC5hYMyVprXcRctJoXbrr9Tpcycvwt5H4qB4HHuFNnUjIg1OwbJV5Q
         Vo7T4VARUEApGttYlqyfqR4crTsRDeRcDpw9dwkbc6gWiLtPaWdq1NhetFYqxox0im7R
         od7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cLQFcQyn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52fd5beee8fsor3107309e87.30.2024.07.29.08.51.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cLQFcQyn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722268300; x=1722873100; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVeYyd38oI4ymekSrtGt52u8IpbVV/D3aJ4+z1VG4jc=;
        b=cLQFcQynlAj5sAec1XCkNnZ6/uLcezyYSsIeV/ru2l3xUP3mbhzWQIZxtgOmj3ameC
         6HTYIVCi7MIN2wRIb+vOk67IPIRJ3p42RM38kvwF3QLigUGSnvYIeWzX903TvU0tJIFe
         vmGV5+uB00Nuwi9417rVgTA4BTsLpVX5mO51NwLgPqrzNJWbklNqJNs3Bu0Z4pZ8PbIE
         byUDTrYn+CL7u1xt+mxsXKs349+1O7XLY9cF4RmH0kJMvC8BQ/klIaBwkZ0Ezr7jUPCu
         iIz0F+70QETM6heMWlrb1PcRCO7w+paA0VFTWQJOJPYUzZ//HtXo6mJvcnCWkQxV36P3
         86BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268300; x=1722873100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVeYyd38oI4ymekSrtGt52u8IpbVV/D3aJ4+z1VG4jc=;
        b=lLcEhBMG2pT+Pmgs1ks5Ng8czn/6vug61Wz0EC/Y7n4EZQrx2blbbQtgniPUiuo8eP
         dk6TuJxcOp+92+uvjAthxtM4sEBl9QSIjytNzzKDG9YwqHY/Tu0HF8ww5O5v6GFcKo12
         JTxUW1qXltE3xo3JkOC276h6UA0sXwjBjah57WQdcxzq8RJHoKSJdhgxZqXF+maaq+Op
         pK3UgvNeywX/Wc44DZTQaf7Vv269oH06W0TKxYciUtSZEaibYuOoRdm5ufR4Mad/1k7O
         cQBn++mAOJwG12RHLis4jBarNSH8a9MgoE8SkXSh+q6X/XWiFJOVCGZZQTJTxbhNa+1J
         oxvw==
X-Forwarded-Encrypted: i=1; AJvYcCW2shdUL4sU71WMnifjkL6OsKfuOw7fTV1BRAly6PNV1fQ1nSH4+1/U6js94N9mhHcWS9Qgpb0bqdERBYjHXUn6F3KlqJoS
X-Gm-Message-State: AOJu0YxVeZB51AQyKV0RITV8HDnsQru08PB3tfRX8Yj3O69wnW4YVbFM
	ztHAvVKCG+P/8yLrBz2YyycQl0yQdjwsouYLQowSU03/osOnDqZu7geCZ7/DuRclJYFwos6Uemq
	+kO1a51D8lt5NYBb/CTCLohbdHYDkdKkZTCsg33Hw
X-Google-Smtp-Source: AGHT+IGgfLNaGF2nDylIei4IZk1IQfK8UJMfLyn/o4nGYkGfmSUAIZA0oVrrVrdpRtREQq2C77aP60y0NFmiV4Vt0IE=
X-Received: by 2002:a2e:9903:0:b0:2ec:5b17:29a2 with SMTP id
 38308e7fff4ca-2f12ee423c1mr55661621fa.32.1722268299607; Mon, 29 Jul 2024
 08:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240719181041.49545-1-philmd@linaro.org> <20240719181041.49545-11-philmd@linaro.org>
In-Reply-To: <20240719181041.49545-11-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:51:28 +0100
Message-ID: <CAFEAcA-ibEzUWFCxA3iQLUoHwZeGnD5kM6c4Ni3BbgaoAs1gKA@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] hw/char/pl011: Check if receiver is enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DJ0XP5ZrPjkC

On Fri, 19 Jul 2024 at 19:11, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Do not receive characters when UART or receiver are disabled.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/char/pl011.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c76283dccf..0ce91c13d3 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -85,6 +85,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Ch=
ardev *chr)
>  #define CR_OUT1     (1 << 12)
>  #define CR_RTS      (1 << 11)
>  #define CR_DTR      (1 << 10)
> +#define CR_RXE      (1 << 9)
>  #define CR_TXE      (1 << 8)
>  #define CR_LBE      (1 << 7)
>  #define CR_UARTEN   (1 << 0)
> @@ -481,9 +482,11 @@ static void pl011_write(void *opaque, hwaddr offset,
>  static int pl011_can_receive(void *opaque)
>  {
>      PL011State *s =3D (PL011State *)opaque;
> -    int r;
> +    int r =3D 0;
>
> -    r =3D s->read_count < pl011_get_fifo_depth(s);
> +    if ((s->cr & CR_UARTEN) && (s->cr & CR_RXE)) {
> +        r =3D s->read_count < pl011_get_fifo_depth(s);
> +    }
>      trace_pl011_can_receive(s->lcr, s->read_count, r);
>      return r;

I have a vague recollection of a previous conversation
where we discussed whether tightening up the UART-enable
checks would break existing only-tested-on-QEMU baremetal
simple example code. But I can't find it in my email
archive -- do you remember a discussion about this or
am I misremembering?

thanks
-- PMM
