Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp587500qvb;
        Fri, 5 Feb 2021 11:34:55 -0800 (PST)
X-Received: by 2002:a17:906:3805:: with SMTP id v5mr5290560ejc.508.1612553695735;
        Fri, 05 Feb 2021 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612553695; cv=none;
        d=google.com; s=arc-20160816;
        b=GkgU72+NuDIwHPdls0KvSuz1IyIX/eeUhHWvZZlCwYK84h0evoIOAzZgH0e7WhbAlt
         6BYU3gE3FR9WI7pwEPDVriMseqCkW3OCVfltEN1CiKDx+yKA1j2Fzh3nHOvgvoc9NXKa
         u+0ruonw93nHZDjDEzCya+jv1Xu974UpD7tNsSeW/PjfM/vdc+gbwaI/LglmMmi0OkID
         DUsqF/cPemm6WIG1FKXL6Wrp+xoTe9WS0OL66Je6QjUTFQJhxHtdtR6VRShgIIORaQBD
         iF8zJw57qgEtUUJX9o5EV5Ro0ujhbhj1bIMHfWNFHmkYt6WImeG/jmu4WdOh405HAUHz
         lFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dCxr8zy1x0m9bDA9JbC6bPiaGbp4UMX+EfGqQQhAQJo=;
        b=EQog/pwY9b1ablcaOmn8fXR/NQh5HtsSqI8ddKeB60HjJyYtsIGbA44ToKxr0sbw5a
         IMk1UQzwU1RkKcp41ZELLM2yg2Cgt990Iv/tHMWxecKrh/6AiTVeR6GdD9M3ArW0IM9y
         nEjs4Ot8DbEt9VSoZZg5RYqNulrooyO4+JT4Vx2IhRt/xCbl4FyivbkAJ6fDknaz6rzd
         MtPWoqKGEdOKdSURS2TxRLBfXeV8Tk6YM7bNKqpQbMurFA3Gmhzl/NnVbDfg9UNNTjZy
         OqSC8R2p8vE5QJnwlRcobx1a9LxZqpsHG3MGPzub+UuXGNyWlHhlgTemeRHDJ+2X89p3
         a7ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+Ewhcy3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e1sor2117835edj.10.2021.02.05.11.34.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Feb 2021 11:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+Ewhcy3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dCxr8zy1x0m9bDA9JbC6bPiaGbp4UMX+EfGqQQhAQJo=;
        b=I+Ewhcy3lybe1ahdXG/gXKB1+E0Jv8JTP7Adp7yUKERlw2r/P0zNwOa61W5hrSxvkL
         0NbP5PzCYQSDW/0Z4b77p589H8c6g1Mw8f8sxh2FAPeo6lEAX/LPuR1qPKmCClApdu6g
         CbBCoDxVq9t7JJ7PCKOWzopTog6xC7EAbu91Tfe6Jaff7iZO7WLPsukDDgu7fFGHq1B6
         ovOZQsYxxJIZBaphqygdwMNPGDy4C1RFN/YGn2G6O3co038XCQm1KJol560qsZwl1Ida
         4u0Q8StH4M0zHjK5Nr38M19lwIV1kH6Piu/iBrFos6r/7t3ZolT6FaH/oUZl2t/RfqC9
         8tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dCxr8zy1x0m9bDA9JbC6bPiaGbp4UMX+EfGqQQhAQJo=;
        b=qHv/QREOAcnQZxMKRnr+XElFU+7rRkD2p6AWxzcSzsE96KuCM83pa/ZzDBCrdf7daU
         c5905adbbOw6s3y0p6OzdvWCITtqZjkYXSrvwCOF2qOU3n9cI3A84FQVi5Kicyp+hCzI
         LHL6ND461M2VKylqNw2c3+y4EdjItYjp9IkhKUwRY5k0t0DK4KTIUkg8eOvdPi7Jnl8M
         VC76J8ooNQDdwcKHBTHfJycHRgpPjQB+EqIqIzXwGL/z+z0hA4tjXUqIxv0IYo+Kh8BG
         H9X294yhulnn412ltrMEeDwbbzs36EISsv3L/egKlWzXplnuGp16y8K+LHiB0NjXZmzw
         S6RQ==
X-Gm-Message-State: AOAM530h4609Y1RxNayph5ieheAO/StB+DhNPpYTlprEwSvjYWXtzxeQ
	zJr9vqU3S46GNKVJjYZVCGjVYb9PyznSx2gQzJf+5oQNEks+pw==
X-Google-Smtp-Source: ABdhPJw7jIES3smr2MdokpF4AnJ2wHzhNHTJeYXfUgJSdlMfcr/nH+4fI5ryc4b1Txao1AbjWE+UM40+UYg+zahU+Zw=
X-Received: by 2002:a05:6402:5107:: with SMTP id m7mr5109713edd.52.1612553695346;
 Fri, 05 Feb 2021 11:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org> <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
 <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
In-Reply-To: <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:34:44 +0000
Message-ID: <CAFEAcA9vvfC_DOnrzSxftXPydfUnucqN6VQtRcpP7LEm+Wy+qA@mail.gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Daniel P . Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +SGD9BH+LbGP

On Fri, 5 Feb 2021 at 19:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On Fri, Feb 5, 2021 at 8:21 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> > > On 2/5/21 5:59 PM, Peter Maydell wrote:
> > > > (The selftest is part of the AN524
> > > > download so it's behind a EULA click-through and we can't put it
> > > > into an acceptance test. We might be able to get something
> > > > based on Zephyr or Arm TFM.)
> > >
> > > Wondering about that... If anyone can go/click/accepts the EULA and
> > > download artifacts, then I'd like these tests to be committed to the
> > > repository, with a comment containing the download link, and the test
> > > can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
> > > binary I downloaded is the same you used for your test.
> >
> > I would rather not get into that. The selftest doesn't actually
> > exercise as much of the emulation as you might think anyway.
>
> This was clear from the previous paragraph, I was asking about the possib=
ility
> to have developers/maintainers individually accept EULA to download artif=
acts
> for integration testing.

Yes, and that is the thing I would rather we didn't get into.
We should just have suitably redistributable acceptance tests
where we can.

-- PMM
