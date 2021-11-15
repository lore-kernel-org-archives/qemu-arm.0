Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5669735lfk;
        Mon, 15 Nov 2021 02:46:41 -0800 (PST)
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr43740330wrn.318.1636973201538;
        Mon, 15 Nov 2021 02:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636973201; cv=none;
        d=google.com; s=arc-20160816;
        b=cLWiIZzuJ1mvyQIrQAG5XUfmVJPvHkPnFWIdH0d8iT+MhJRCZuHV2sDuxNtxrEpFZ5
         w5M3f7a6hLELDtdjlA2x4mW6/iFwTzMWT8NASE7UOsy3gtbo3N3ggHAEgtDn4RA4gJZr
         +Wi0U7iL/7LqgUG47NhYtUpe0bCgyd10ONvp7otbwHWk7pxwYW80X0Jnfkv6Hg/DewJC
         kq6xq22/CK3rY2zQvkzAcNAqDPpJ90mOAF3vo6jV7FmPUvSN9wsPiW5lsCtTce/O7bey
         cB/KDhncZC/NHr2qbrateusFSaFdjuhJlodj6exZH5kAf/f+GGuB3493NC8qudSXgnG8
         6icA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8EJG14aFip/4vbpZSE2jJAwy2phleNBO8/XT+k2kP3g=;
        b=Sf34o98TBfXwqdZt+bMGAuuToGdtWdpDFaH8lUUxOhGFLabChRJ1VcgyUxqrIaczkl
         vMZiNLBMQ7pOJsMM8lvuj5qFcIijbWEZk42VNnqJNH3w27ypIzWnL7dFpwgBVIyU12X7
         /ivhv/OwA/TF9N2eUPcYj6tNnssWgyy1r7ymUoqmmd9wOh8K8CCVVYS/8v4d33q7skhE
         yUK9ABroCOc77vkmWu09/KztMaNVNBr17zCnfmG8yNkM1+OKm1iBPZMl5jfNhVDeHHIF
         29yHsYocktMNaK8tgBTivh2O57D14k1PuCndKpmpvrW1kHJK5vQ356KgcgDuksBCvgf/
         ei1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCFZRjRF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v12sor8200787wrm.50.2021.11.15.02.46.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Nov 2021 02:46:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCFZRjRF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8EJG14aFip/4vbpZSE2jJAwy2phleNBO8/XT+k2kP3g=;
        b=pCFZRjRFEyiJGUdw8kVFO4MyCflGf/oT7152aQUm/mYNav3wCf/KIp+dDD3ycSvy+I
         Lc2bnCgOEvagADqGnaL1HV+ny+OSExbouPRMAff/k4kIyy+lGRdgA80LmZ8yrQDol+Vu
         FiZ0vtN3zuOezkSAkQGpBt71KR/m9RU5Qme0BT+i2RlNWygCLMuVlgUNHf7qkYscXyo8
         nOLRBbmkiOB4eCSi9v4zIMEDm9AkEMNS4363L1lou3PtHQHxjNmHQrKjPc2bN71uAcCv
         qK6y1kEbaPfHkSkDRXTZan//TFDtoFyskrPVlRnI/G0BpTtWPKVlJJwBCxPaeYiidl7+
         UVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8EJG14aFip/4vbpZSE2jJAwy2phleNBO8/XT+k2kP3g=;
        b=i4R6C7jmnooLC/GLM08M6r639DY1TW2QIt34dbwZJHtYUD1emFZ91Ndd8t+JIi59Jg
         IJg8pCgABwjcAGLWwMevUISEgdOz8c0lefnMuicWXsCCD4PbOMH62kzkxhmUYGZF0/Ar
         WufTr+d+O3ytQiT9EgNHJlMxvBGerJYq+FhxPnaKT13qvPkoYTFiIzm4y3xW9qBDrSZr
         aaGTLS+lJFHcdoUUiIySHYIw7it6CyNywObDz9mnqTFPyHmptVnNIvF95wDaZwEabi96
         i0FdTN+H80zvYVF3iyAX2vzH2M5araiNQaLxX5ZllcAns0OscxdM6kjeCHRIhIMbwDKv
         amEQ==
X-Gm-Message-State: AOAM5323Db1Y2NgV0PwkowBVbx6qRNyb+h38wc+3kxxCZ2nZg0MZNbaD
	Ahno2BRPcRkeO70ythqZOrRfqlLSnIyKCHsykWYDxfRm
X-Google-Smtp-Source: ABdhPJypmN7jH0I/LsD4hcdgmVyI37Kku5pUL57WailFpJqY+l7W1NNq8928wXHpAqML6U2VA8wrFzqx1s7kFsxvROk=
X-Received: by 2002:adf:e984:: with SMTP id h4mr46566631wrm.149.1636973201245;
 Mon, 15 Nov 2021 02:46:41 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
In-Reply-To: <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 10:46:30 +0000
Message-ID: <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Andrei Warkentin <andrey.warkentin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: MOR6jAyIQlxP

On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>
>
>
> > Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
> > This is tricky, because we use the cpu->isar values to determine whether
> > we should be emulating things. So this change means we now create an
> > inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
> > bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
> > unset), and depending on which of the two "do we have EL3?" methods
> > any bit of the TCG code is using will give different results...
>
> Do you think it would be sufficient to go through all readers of the isar bits and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy to do so then! :)

That would be a big reverse-course on a design choice we made that
the preference is to look at the ID registers and phase out the
use of ARM_FEATURE bits where possible.

-- PMM
