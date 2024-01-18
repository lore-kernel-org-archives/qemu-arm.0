Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp373126ejg;
        Thu, 18 Jan 2024 08:10:09 -0800 (PST)
X-Received: by 2002:a05:6512:1323:b0:50e:7615:d34e with SMTP id x35-20020a056512132300b0050e7615d34emr856901lfu.22.1705594209203;
        Thu, 18 Jan 2024 08:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705594209; cv=none;
        d=google.com; s=arc-20160816;
        b=VJ/0kuoNSu7m+nQjvOYe/XqZtXDQwKHX/3bdKpImg8x5FerRwChsw9JmbEfRbNwFUL
         B2EOqAOgqU66+0YhQlzLvm7plF0kkfZaEEoNzeTPIFqE1NUT33LhucMygUhMM0RY11oy
         iU72oN9JeC2PYULKvkLtI35GgJJ4JRuUyWjZVHwZXWXT9DjQ5kNO/k+JnAAHMHvDNtHG
         JWYnJa5PRuOJa4tiDpHhpnT6arv1yBxWZFtV0JtJtiJzXQhEADBsEs/pcvBaoZJBojJC
         wdKTVUWhfrchOOSTN/sU2wWqQ5zLIl6lJDY20bmmQ7FnjlOrw1qC7bWNmXx0lbwe+wHB
         QdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DrH0mIYHprZLIUAYPD1cfFK/ZFwG/GspzFaUtL6IKEU=;
        fh=Lavxp0wsjQbdu4un493WSuK1M2imAgN6d0VOr16PHOI=;
        b=qpza+VT5u859Tc8xnmy1fDS7i2/0Ij62d1FvrnfH1Lk20yqkUja6o7Y8vUQoacoP6M
         Nf95yj4HIBnmvaXcL/MI5uCgSEXN3yGZ5QZaTT/w6vG+93KMA+31DES2s0F8EHi8KIJa
         MaI3YlwFYYqpNV5cAg/uKAbKkDeQmN/LLiS2iha4AhFFsPAWEJy5YRcBwvakN/b2iocN
         Xpt8fTVicw+WyIdH6OV7sibS9gp81AxVDCqcKd2I1sexnkxJM1pzwfiQOZA9aT8nS5MD
         7GTZ5YrUReZg8/wL7axXpa1NlpRg2rJffUuOAtirsQK+mxlaJCOhOIRZsGsnRNIuMW16
         9NNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkxPDM8b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u16-20020a05640207d000b00559fdd9a897sor459441edy.2.2024.01.18.08.10.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jan 2024 08:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkxPDM8b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705594209; x=1706199009; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrH0mIYHprZLIUAYPD1cfFK/ZFwG/GspzFaUtL6IKEU=;
        b=NkxPDM8bIGevw/PQpkrJZQPaAxd4gHRTO4wdFmKT0CzXFNdXCHAzrgUk5x/PY8r5Jm
         9GfSVMirbHhY3zgRu1QlqeUzMjdp9PJcS92PXqzLylpnP7vJWkPgJ2ZYqwIGYQ69b5Pi
         8gKRZlnVutJkugFAl8KjUiaVNdnYEreVhgglWin6yKIQhs1a67oNc7yOObabzEerFR7h
         bjHMcJEQQJbT7hfUXgoPZOHgfbflxsrM8yAEAoG104GOAD9nU7FfhMidaDtdWgzBjVIv
         y7Qwl7E/s5TvaDZQ5966ziWqGkrUof+TD2O6Nfd9Z1vG2ISsjliKR1lpkTyMisClUW7i
         hl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705594209; x=1706199009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrH0mIYHprZLIUAYPD1cfFK/ZFwG/GspzFaUtL6IKEU=;
        b=jMIKFgUpdLLltFbgvUBmH9PbATa3nfWDJKbUOeyZI2L08UsUbH18EQouAPD95ZSJ2W
         K+vP+Q/EARvk0jgQTADoVxY7HG2Qo09WU8KjyfjUoEUPx6/sYBK5Vh+n6XujqfTsn/Dh
         4kX+Ngcf+exlHHCylxcwZqC+ZAFC0lV+uFecH3eNfF3O+E4bt0+GS/lfZwjZkigx7kFs
         g5X++NOBYyesM187qoSpBimQ3obLU0bDLOAdRAjeYUeUK6ZkI7bexdgRBdnGTfBhHiKG
         NFAASAleGs3hh4rGdpj8kBm/p4/sIHZBCw9h1JCUYhllffSFu2v4G9QQ36DN6d6XIqpG
         +tRg==
X-Gm-Message-State: AOJu0YwaV/7XGm6jy+a2QkWT8rlvW16j7JcRSxyQ2E70V6KwyNM8YQJg
	lSG3GcbxZ727SVBK60zbkiNidy5Uu5G1a4TXFQ6hBg8biEYmKfmIfZNaBGPbXj9V+Ft4ZKCYnKU
	MtjUmQQ9xcCHIsNpa1DMBPCv9c8U6bR798gN/jWYy
X-Google-Smtp-Source: AGHT+IH35UlaRPe9gIC3Hyx+OoU5WxXX8yK1848nu78r+G2nITCEA9z7MHKXweG0+dmvhUOs+f/sR9EsTeYYzMx4EAs=
X-Received: by 2002:aa7:ca59:0:b0:559:3a84:7fc5 with SMTP id
 j25-20020aa7ca59000000b005593a847fc5mr607451edt.2.1705594208817; Thu, 18 Jan
 2024 08:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20240118131649.2726375-1-peter.maydell@linaro.org>
 <1f34e941-5b0a-4091-95f9-0d0c8e302aa9@linaro.org> <5531b75e-86ef-4543-b62a-1457666d9585@linaro.org>
In-Reply-To: <5531b75e-86ef-4543-b62a-1457666d9585@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jan 2024 16:09:57 +0000
Message-ID: <CAFEAcA8hfdZAkCodJZHxuOF2YAnKp=XR2_SeezJkcyaCAHOMaw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt.c: Remove newline from error_report() string
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: O39T8YR+TZYA

On Thu, 18 Jan 2024 at 15:30, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 18/1/24 16:17, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 18/1/24 14:16, Peter Maydell wrote:
> >> error_report() strings should not include trailing newlines; remove
> >> the newline from the error we print when devices won't fit into the
> >> address space of the CPU.
> >>
> >> This commit also fixes the accidental hardcoded tabs that were in
> >> this line, since we have to touch the line anyway.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>   hw/arm/virt.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> BTW there is another case:
>
> $ spatch \
>    --macro-file scripts/cocci-macro-file.h \
>    --sp-file scripts/coccinelle/err-bad-newline.cocci \
>    --keep-comments --use-gitgrep --dir .
> ./hw/arm/virt.c:1775:38:"Addressing limited to %d bits, but memory
> exceeds it by %llu bytes\n"
> ./ui/gtk.c:1094:56:"gtk: unexpected touch event type\n"
>
> We could run this some of these coccinelle scripts on CI,
> as a new job in .gitlab-ci.d/static_checks.yml or extending
> the check-patch job...

checkpatch catches it, if you read the output, which is
how I noticed this in the first place (I was originally
touching the line to fix the tab damage).

-- PMM
