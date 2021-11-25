Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp279417lfk;
        Thu, 25 Nov 2021 07:48:15 -0800 (PST)
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr7517053wrw.319.1637855295187;
        Thu, 25 Nov 2021 07:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637855295; cv=none;
        d=google.com; s=arc-20160816;
        b=BM+Evu79sCt6/MfkRncOomi2xmDZBDp6RC8XTE0g07AWwF7HrskMYa5mHolS8zOrNt
         TPi0pLrkR3SuI5rIae7TyHi8JlCrm0iTcdLGG7XI+tps6ld4rcvUvAIaJgGRQjcRgj0u
         /H10eSliDc7FpP7QHzujIOt2NtkRoKP0k8Q1R6/YudDuoTjIhxuo4vw2VNMpzMtVG8wV
         qW7uHb+g+DBEgitqvFhIoC37OKjOdOI9l8qQCcMgTkxi6IZxUJLYvbTTMfpjXCAepjlC
         pCl+i8sTmbndk0r4wM2ed7jGJtHHew4K5iRanS9CDyN/hJgvun2GVsNFak1RY/VCcF7H
         Wvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ZiiAdoMXvpwVANGKUlqfPUaqJC3IGe25PRTFgj1iI8=;
        b=qOJyWw6zEdzJhDduTdSL/nRPC9RqDZseOJH5YNfB2+XYgpXNSBVoVY0wg7s7PT2W8K
         2AVTL6wrgR9SHFUJcen/FDyj00XNRdCNxFlKnomG04gTGX6tbTlEbXdw250lvSRLnyDl
         lSxdWWlBBs0n95NxIHbvFE/1VmbOaRM69S3GjOraXD1ChmtO7mMXg9D1ij1T1nsgHCGN
         1J+wQpltlhkHouwGNVQ5YyshEUiTq0+J4BQCgKznJCL6xiUi8Moczz6f1j9thzxjdzZa
         8IEx5BBdFK4GbN9huxofOIRn0sj9nj8tXkvQoEoDcCArFbMxgHdOdN9z0An7EGqPBt3s
         J/6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sMR3fOuB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1sor2222202wmq.12.2021.11.25.07.48.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Nov 2021 07:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sMR3fOuB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/ZiiAdoMXvpwVANGKUlqfPUaqJC3IGe25PRTFgj1iI8=;
        b=sMR3fOuByG0vt0k/ubQEkC8qUSFtgO9yCkGZn8tmlGJ/JKpdz+hMZTkbjSrUhLdMh3
         H/UG8I7Gbs5hreEY3TLymLCcjocwty/9FVMkDwH6mIuEpAzO5ZfUn6dKBhm8afc+jMzW
         8uBG0v+KRBy16UaGstuNc7fyQTyOSzK1qAYRB67wrSjQ9vIBqy/4gClO60D8gCZUNS+e
         /3lVGAwCQyFMM8KDDg52Dp4aMtM9kCHbgO5e70Gox9aKZYXaonAQ16hSqJ9gxpY/p4o8
         YTc1a4VKHQHjVMebFVLpHVoDN9oibDpj9qn/E0sfQdA/ddIRmDBHF0c8MSHVJU0FIUIK
         XvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/ZiiAdoMXvpwVANGKUlqfPUaqJC3IGe25PRTFgj1iI8=;
        b=RvB34RtGt5i7uwq44aG07D+WrJXdcflQqTuoUvaBPZEyPJD38b9DPGx781CDuS3y0b
         NcIGOd1hgviQ/0NFZhIBqVN8kDLW6EvYHfLQS7aF0he3wy+wbuaHji3xrIZ+k3cldADF
         gJvr967UbIGKDq+ImtlfenywcZupSI+aREs+MfGIx2IeBTZvIcdc2EmTGthDRVZbnfo8
         W+OLEdfQosZdEOO9L9/hI1CwYdlxhCVbMOHzZMm4YI6EA0y9KyklBJOOE7kh4udTl77p
         yIKOP8pSuHtTJABJfryckJA2Y3JJekYawI1AhU/txdPkrEEuXW07xZyoZjFszJqh4mLR
         fMFw==
X-Gm-Message-State: AOAM532rAoqat1STrlcczdFX+pry5SslYskMWYQTWzYIru23HQw+V4hx
	sHmSkDTtJy8YPJ6Uwcl7l3ZbPs/MuBhuBwZhX35x/qNkL9TkZwV8
X-Google-Smtp-Source: ABdhPJzGMKGjXupe0MipChIplC8vTMBglf9Gjw8agYQXdXvBTctBNjuWnJ2LI6aGrkJsHzu+V9whMw96XTF8zi53gJ0=
X-Received: by 2002:a05:600c:22d0:: with SMTP id 16mr8492061wmg.37.1637855294918;
 Thu, 25 Nov 2021 07:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20211124182246.67691-1-shashi.mallela@linaro.org> <87v90gfejs.fsf@linaro.org>
In-Reply-To: <87v90gfejs.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Nov 2021 15:48:04 +0000
Message-ID: <CAFEAcA9OgVksrLHZ8m_aub_tUN1zp6y6_Ev06+Xo2zDpJaLJxw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, leif@nuviainc.com, rad@semihalf.com, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3yldDj5vkf23

On Thu, 25 Nov 2021 at 15:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Shashi Mallela <shashi.mallela@linaro.org> writes:
>
> > When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> > to be enabled.This patch fixes the issue.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> in so far as it doesn't break the kvm-unit-tests but it also doesn't
> solve the:
>
>   irq 55: nobody cared (try booting with the "irqpoll" option)

For the fix to that try
https://patchew.org/QEMU/20211124202005.989935-1-peter.maydell@linaro.org/

-- PMM
