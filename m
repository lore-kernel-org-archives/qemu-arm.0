Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6214595lff;
        Tue, 17 Dec 2019 08:08:24 -0800 (PST)
X-Received: by 2002:a9d:754a:: with SMTP id b10mr1079969otl.273.1576598900021;
        Tue, 17 Dec 2019 08:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576598900; cv=none;
        d=google.com; s=arc-20160816;
        b=CqvojCCxJr4gU/cMKrsHYJw2m+f2wv8KMUmEKRgj+9xw3EjD8YHjMdEGyTd+iE+A+o
         vwFLMgBRkfcWLGM5q5zuQi5le0G/a25VluhxVxYOSDTFUxLHuNiSyzbtLiYoI3e7Km6n
         n7awx9jg/FXPZJRNEXZks0b9PsjDmSXnrwaQWBBQPGZjQu4LfZUSGVQovcInFplQMKjf
         /O07QIxLogT4Gop4im7MC0LnSMqRBzzs6DSZKkw1ZhaOf6rYnTuQ1/oim+X69shtrpr6
         HNtgXPDTaXUPXk3t5vpicX/5ih1MTMAUENaczlG9OAPC9vDKlnFK//eTnPpNoHKpQl6r
         DIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=quqEcBZm6ZgH7nO7zteu3tS9msScNxiSze5l+g6Ih0s=;
        b=l+1oAlGJ/K4ZAvI8TYtZnM7NszWLliywrKcNdKfvKinC3NyO+RBLmxVR56WkB6SZh0
         PnKH19GXVzTgIF7TfBqSpOhKlxOWQ6bti1sANFUscysggRMDc7Y+rH9cOkpakD0MWtRl
         GcNWLtcK1zEKiJZu5F/O2suZ3nl5Eq9zIf9yzlXTvKADQsLmS7Hpqk0KWXNBQxCAT+J9
         fOBg3crAv39uy8hydGyXme5IhDjPkCMR3k1V36wINJH5rUxyddDC98SfwxhZePQShTz8
         ccrKyNOMTLhhI/9AfXHKJzADhdKJkcwou6iMJo3HND2qh56DgFnHidU0abbb6Q/Ufo/B
         fi3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=thbUYW6z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z107sor11360680otb.175.2019.12.17.08.08.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2019 08:08:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=thbUYW6z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=quqEcBZm6ZgH7nO7zteu3tS9msScNxiSze5l+g6Ih0s=;
        b=thbUYW6z3+m5Mb/+UCGDLkQYDETFM2hu7mD54159R36+SJxuQaHh+0pwixvIb859zn
         D4/GpaiHGtTb6SIsM6n1+B5g73qpAWKmP2lhhfZUqwWWXa+x9qrCZNJTnGJ3gL960Cr6
         GmnNcd1c8EDiOD762zh75QETdVp7Xw1D8QLFEAGWd5r9pzvlwgK5gDTrzp9llGDt+VmJ
         pGNpQwQg8r/ueAC1AVlHVY/vyNagTGFZIQUKbKP1hT5p34R45HRPsTc/KSoj2zkO/bEq
         kS5RM2buHs8HnqokwsnXmLLqBTE0yTLNsvospMcsEL27V/eNHYDPdb4mY1oubS2shpeC
         69Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=quqEcBZm6ZgH7nO7zteu3tS9msScNxiSze5l+g6Ih0s=;
        b=gLbM5enywWxnXmDXrcxpv62B/d4Pqf4dAVP/Y23QRbRMcfFht8q0jQJ+a4vsaGnePZ
         pbmq2FZabThvYzbAfCyfBULDE0AGtwhED/8Ijk1A4zizh1sMWSJt2mYAZzRqYyOwAw3i
         /4NmiKcW5g/ThnCPh6PDcAY81tIx7sn2IIVGLBlv0ODra/UX/lSMrfHAg5vBySmNGS7k
         PMa9pe8HZm1VHnVmJry3FRCtYi9P1RQmMjMRfauKyP3lw9pxJhpALSuDxrTrXVBVxf9j
         DpXI8hCEBvUWmVU7fLH/OawtaHhZ8VvDAS5c/KiJZWmsCsjLaWYx0Ztk5OnXH+CjknVi
         c/zQ==
X-Gm-Message-State: APjAAAXdtU4/mXV3X7jynPgB2wLYIrnX87CY8ABPslfZ4Bulif5lTLKw
	YCeZO596HDLSrOVvGumnmg4lN3p2DutB73uWzkdlGCjY
X-Google-Smtp-Source: APXvYqykcXklOc7RDYpkUhPnXIsOB5/MahrIm4DlsnpzKF726qk5Bs4tPFjqvu5WrXrB7xVIlzJPoS25S/Pb5hOAEPU=
X-Received: by 2002:a05:6830:13d3:: with SMTP id e19mr38870538otq.135.1576598899525;
 Tue, 17 Dec 2019 08:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20191209134552.27733-1-philmd@redhat.com> <CAFXwXrmi=AqO9djosRt7vEGm5XDmnBt7KhHn9AQAWbVPLp+QkA@mail.gmail.com>
In-Reply-To: <CAFXwXrmi=AqO9djosRt7vEGm5XDmnBt7KhHn9AQAWbVPLp+QkA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2019 16:08:08 +0000
Message-ID: <CAFEAcA9cOr03j9H1Z7YPyFKDViG5hS2mv4ATnWWWoWoKa9fb5Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: bFOFCfVHj7BD

On Tue, 17 Dec 2019 at 16:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On Mon, 9 Dec 2019 at 03:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
> >
> > Instead of crashing in a confuse way, give some hint to the user
> > about why we aborted. He might report the issue without having
> > to use a debugger.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  target/arm/helper.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
