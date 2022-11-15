Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3772547ejx;
        Tue, 15 Nov 2022 08:43:18 -0800 (PST)
X-Received: by 2002:a17:90b:3118:b0:213:2913:3870 with SMTP id gc24-20020a17090b311800b0021329133870mr1376786pjb.119.1668530597888;
        Tue, 15 Nov 2022 08:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668530597; cv=none;
        d=google.com; s=arc-20160816;
        b=mgSpVdVQG5cdRNoZN+xPxT60Py6fXxMD0o6cUBGNirT7Ttsg/JmxO+2Wpk5TNLUQOm
         uXVnCZfv+p+gm/nvInWdVTV6ywJmfV0CTF8iAd49Je1OMoA5QhUFFmNn2nLcFZDkTrfC
         mNvKMrd6LWLlaxwkpSdYtInyfGRI0nOaPXbXtwQM6K7g/F0w/bOJD7Ymb+v5m3BsrvRJ
         IQdfVamOqEx+rxyLpfuaLgefOH0fuAbNUTkfmmQWVmpzPYz4KJn9xJt0aXkW2cIWogKy
         ZqHfm1KtefzirL3tct/cde01Bh4Ufqz/RRZX1L7YKRBB2GivLAlv6EQu6szLZQe8jb7v
         ru+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VSkEv28B8tpClWEg54VGYRbqRTVzZ7xyp6z7qVm9u4=;
        b=xKHSmxHe0pVNcZcoAtW1In+YQnPTPcoDm3AJ5MyV0Opztfi9BjBvMg+s+/MZQYRAb7
         Pt765Tw0hhWV013bDTmYsODQ5X3K3yFLUPd3XWfyjL6WH9LGQXJnboX2le8hRYGUM8FS
         9Qp/jH+ntax1wOZmj+KHzBLtVqGLeCTQpdy2z495mA4lJx/S/JzLxzAU02acdJLpoltZ
         IgmZkoh7g6lab4XN/lgAO5msUtGmoAOh/fjca+vU+gAmktkrgXvIQCoiSw7GtQvKZNmx
         uVmtn5CszQB8qe6TGNjPZFfWxk+fO3zMad6FHMmSheyBHggqGj9qD/4f00wy+veff1S3
         IJzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JQsAJox7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10-20020aa79e4a000000b0056211aadc27sor6620778pfq.33.2022.11.15.08.43.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Nov 2022 08:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JQsAJox7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VSkEv28B8tpClWEg54VGYRbqRTVzZ7xyp6z7qVm9u4=;
        b=JQsAJox7qOt1RsL9sqAMyGPuip2qW0ieLvOyZPFdU+7yewD7f9lvTYnmIqHZ34+92m
         WjKW7eJRQwQx2RRICJhAOCrBBZ7Aw5RyZIrFugntqNgY9QxUQCdN7wGJpBSK+fTFmpEE
         JOGSU6VGjkUYDm2K97pna5dLM1DWhMNNchbSIYnsZdT88OQqGWombVSmhkdH/gmYIIal
         RI9qCfqLLQ02JQHkb5b4LoF1tEugdMxR0HlodfflHWIB0v2WOPJXBog1M7RGHAhQhL34
         RG49LJcT2BmyPFtJHfp9Z4cpkkBbocvEninQK3NzmIm8HBYGSjiVJZVFWeMs07ej4mfu
         EI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VSkEv28B8tpClWEg54VGYRbqRTVzZ7xyp6z7qVm9u4=;
        b=XSulMcBTT8MMdTRKFhJmClXyrTPNZc2zt3khV8hKhAu99oSapv4l1pusrv0fg1Gdkv
         I3otlI7OC/7gsDzf8reXrPeNUJksitFVkah5Byb96H+0fBAeNPdz6zpSceptf3JK1JmY
         7IB8INn8V/QuYmVxFJ1094Szkf0FwDyMfkdxfQD+5y3bmtFRSKhD+9SNy5lXpwYjO813
         6lwzUH225dG64JtSHqgi1u955VG8pxrNpteP9m19kxTzhZVqn7OBcdarvW7fbaRh8u06
         a0FMzwld9ziZA3m8s39Fp50WQO1RYnmMgoo1y8eci1lGgLqouRDwiu2IjM0krTYNm4dn
         CE3Q==
X-Gm-Message-State: ANoB5pl0Zej3/555cmxw0u4NtYbXhU43E0/ci7Cr33YWF65xFDp8qYeV
	PyAk50vdj5qs3TR2rbW+4Z9ZAfHTssN46aw/Fhq4p5vU
X-Google-Smtp-Source: AA0mqf7S4x7huFcA4Z83QeCr84AFGO20SDPWHWyEzAx5+91YtST/sLhijFe/or6YTfzg6PxsDD0IjAyIfq0LFm1ZlbU=
X-Received: by 2002:a05:6a00:4199:b0:56b:bb06:7dd5 with SMTP id
 ca25-20020a056a00419900b0056bbb067dd5mr19411929pfb.3.1668530597428; Tue, 15
 Nov 2022 08:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
 <20221115161736.2425584-3-alex.bennee@linaro.org> <8900f3f8-0993-b479-8080-0276d20b0c4b@linaro.org>
In-Reply-To: <8900f3f8-0993-b479-8080-0276d20b0c4b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 16:43:05 +0000
Message-ID: <CAFEAcA-LSU+io9HokYvgcj6AfEo_zYru521PiAY=0k2_+z7mVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MZiGtIwvEaYI

On Tue, 15 Nov 2022 at 16:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> Possible future cleanup, define JEP106_ID_ARM:
>
> $ git grep 0x43b
> hw/intc/arm_gic.c:1671:            *data =3D (s->revision << 16) | 0x43b;
> hw/intc/gicv3_internal.h:743:    return 0x43b;
> hw/misc/armv7m_ras.c:26:        *data =3D 0x43b;

I think that's probably not worthwhile, because the datasheet gives
you the hex value of the ID register for the device, and if we
hide that behind a #define then now to check that the value is
right you need to go look at the #define line.

Put another way, the important thing is "this register holds the
value 0x43b", and it's just a point of information that that happens
to correspond to a JEP-106 manufacturer ID code value.

thanks
-- PMM
