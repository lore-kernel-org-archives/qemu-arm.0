Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1241320lff;
        Sun, 13 Jun 2021 07:59:30 -0700 (PDT)
X-Received: by 2002:a17:906:c241:: with SMTP id bl1mr11568770ejb.536.1623596370634;
        Sun, 13 Jun 2021 07:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623596370; cv=none;
        d=google.com; s=arc-20160816;
        b=03jwU5VbfNL6RwjBgDVfPhIVyOhC6P6TiD6xE6hv9A7QkoT459YnYz1cFwtVadoVZQ
         Om10JkSJLVWY4Mkp7W2wwNj9QxZe+NVFb2FajysPYjf/o0zoi/JQ/rINsGjLLWAvsQVk
         ysHmFlPB/WtCr0nzw3/EuqZUxDLf//J7uHS5/QdLfvXWnfFKdXYMa07mx3U0iAKBUYj1
         obdeF+AmeMxC1nhUeHyWupsewMJAPptuJSIA96x0u7fVxUO92TwgsfVG4ErcnunshibJ
         tbLA44p7ykmoE1DrhWlVbxJuftx+uhLPDVj33qGgeTluCYL7KnqCSOuKmo48AuBSAVRt
         DmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XjLbT5u3oKhPCm2UyhPCyfvMV4Fd/Q8rCkoQ2pdglOw=;
        b=pPvcjCxnO5Fw+Vwgfaa4YX7iuscclPheljYWxAHLEPs00VtzVy/0gRr5R94najytBQ
         p896oOoJkDc9viC0H8TGBCViFDbvIh+6WtobslY/6H2MqomPHF3h+J91cjQCo6EjMOfp
         txYLCG7tQGu6X7MQ0j7unh9pfemUWbxjQYh2dCqtOgc/VtZ0MsvqC3Ac02QGSpavA2s4
         axEpv3oUP9l3nb2zutGnj93CzJHPgNemyrFmdICkTIotXNPaf2Umu4sA9YRs/60jZ7Pl
         6SQnRzRd2Zy5iCq5MpXSEgoEi42dbXTRTcV3dXqcmWIZmVEdceCB450RhLkmarA0KHfd
         eDpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXf8STEb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m7sor10721447edq.12.2021.06.13.07.59.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 13 Jun 2021 07:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXf8STEb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XjLbT5u3oKhPCm2UyhPCyfvMV4Fd/Q8rCkoQ2pdglOw=;
        b=wXf8STEbpcI3MTmRsJ6f6FmiLfQf6v7dPpwC8A0OAiaRLNR6pkh5dnv0Xpoqp+Q2xx
         3CIliCq0lQ/AH7Q1Jyitq0ixYxApn1qQ1EwmC9y048UEdMiulUEyFyb+ZYgLnyeSJtgI
         vFG37Qh0c0vjZfAlECd490ngBND0PiwochrVXa5Vlg6mOv0ySKJZLNDHZXFvYoOOli6C
         025zoFE5tAC8UkPAzX7VfGZkhQhX7MufSB3GU3mtVGDcmr2wYl0+PkE2eqIEiMWxa2zV
         QZko7yPIeTLLxdqQMgF9nUBeNp5RqCjOxnj+/ScDOkNoz2s8VGCWnVP4C6RTaFduY7/1
         OiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XjLbT5u3oKhPCm2UyhPCyfvMV4Fd/Q8rCkoQ2pdglOw=;
        b=X77kEPs0Liq3AEWGxNkaIPfp3MD+pmtP0L9r8U8IgMOaGKXHlvIawS0JysrM41QgOb
         uiIPGr+CbI4uE3k862GaFFPCsryoO2I1Ziy+FGL6b28jc/ovXldkLmAQrZUj/oVuNlxM
         Cb5+GtQ7AjHMlP+yzQw9FSc3sQPN+jKfw4bAHi6NuqIYt9JaaxVHxo9YmYs1kvyh9sOE
         E07ngKjw6Ud+3eJlITux5SIJVK2N66JgGZCpK2YPFtYw54O+F7f8vUuQCn8sfdnJFG6b
         AkgFvbwsaKWgD+qRpOx1mNfigehD72DMd+cvhxfjyPuLeKFhWHzDKn/T3flR1tO+PF3q
         HSOw==
X-Gm-Message-State: AOAM533d2LmtELgxySscne/SL61ugg3hD6gej1InmJMF5fSb+jZpvLsR
	njA5dLdCo4me0OW7TBaXa1ceczC+YKT4YP3PiTjodI9Sd8+QTw==
X-Google-Smtp-Source: ABdhPJzsqoCe5DznGFaE+trE3byJyruSJjdz67n7UprU2z3D0d/+Bhmr3Wr1CNav1m+mifXzd0R6bmUU88qiket3XME=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr12867098edt.100.1623596370327;
 Sun, 13 Jun 2021 07:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
 <87im2liz4x.fsf@linaro.org> <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
 <87y2bggwqd.fsf@linaro.org>
In-Reply-To: <87y2bggwqd.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Jun 2021 15:58:56 +0100
Message-ID: <CAFEAcA_NPtRT1YdcyuRYpa8bDuWTt53a0-QyJz8CEb4FnAXsgg@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Andrew Strauss <astrauss11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: QJoM2zYK/x6H

On Fri, 11 Jun 2021 at 18:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 10 Jun 2021 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> >  (2) find the largest contiguous extent of that RAM which
> >> >      is not covered by a ROM blob, by iterating through the
> >> >      ROM blob data. (This sounds like one of those slightly
> >> >      irritating but entirely tractable algorithms questions :-))
> >>
> >> Does that assume that any rom blob (so anything from -kernel, -pflash =
or
> >> -generic-loader?) will have also included space for guest data and bss=
?
> >
> > Yes; the elf loader code creates rom blobs whose rom->romsize
> > covers both initialized data from the ELF file and space to
> > be zeroed.
>
> Hmm I'm not seeing the RAM get bifurcated by the loader. The flatview
> only has one RAM block in my test case and it covers the whole of RAM.

I dunno what you're tracing here, but rom blobs do not affect
the MemoryRegion setup (which can be rom, ram,the romd "writes
go to callbacks, reads are host memory" hybrid, or whatever).
ROM blobs are just a list of "write this data into memory at
this address", which gets iterated through on reset to write
the data into the RAM/ROM/whatever.

-- PMM
