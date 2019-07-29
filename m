Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3172669wrv;
        Mon, 29 Jul 2019 06:44:06 -0700 (PDT)
X-Received: by 2002:a05:6830:11d7:: with SMTP id v23mr13162319otq.58.1564407846731;
        Mon, 29 Jul 2019 06:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564407846; cv=none;
        d=google.com; s=arc-20160816;
        b=V4Sfp0pBfd19ylqFdNDF7pgenGPNILHho6teSjnb4KI4U4eJmZ+NzQl9zizWj3lda9
         TKL5jWN1Hz/Bxfn+GMkqzMqMOWe+IdAvqQ4UG2Pn7IPJOymddez6MjyhtKwzt1/7ggex
         4wSE5i5fYsD46lu/FfP68LIMRRKRSRmk+Z6KOX0EHiHhkEFkoUBgauVzrdmQkBir22lT
         Jvgs6wiRl04qcqtwWBRUss9dwHiDxiz7QoUbJayktiLdpyHT07UEZzk6GrDTcpYde735
         M3HNEFMMqi9q/gH0iP7JLvl0YgKBCxL46Xpw+Qd5tiwYZ8ys4FT5AcjJ3h+o395wxVl0
         rGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fBRho2ZxX35dY1+0Rwc1Vnwv30CpcZZPcmmUFuHJQnQ=;
        b=sCPp8Bkiw3/aD3feMNaZ1ZRQnmcTSxMoyphH/HdBAN+6IvUKhtwaRM2RTtVACrD1lj
         dtEJMHd71bxALGXcqQxIMWRpo2OyMM1gmLLmXJRXIJ88RA8825pmbSdgOGnAK7OmMX0d
         8Z61XYvtV8cayfVDy4EozmPrCEiaGJCXaOx7wYyzBLxKtDVTX5Xa6RY2eZmlrmHruPp4
         +pmY3ybvxiH22rOJAFL9uoMFSDkusRaj+mV/waJ33FSaM6wisHEjyyukQr1cduZfiyBn
         LW8jQvP3GNYyMzgrqmhMKRPmpPOguPgPZ3xCG7gtUDhkMOkVKJw0OCXBwfiwhw6cO5Oj
         9nGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aiKoKlCU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u189sor28045477oig.149.2019.07.29.06.44.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 06:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aiKoKlCU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBRho2ZxX35dY1+0Rwc1Vnwv30CpcZZPcmmUFuHJQnQ=;
        b=aiKoKlCUEwGmwFOsEYs33dOtjSnnm1j/9i8RNv0zvcscxIgAkouoK1wqGNdvnG629j
         pKoF5kcCL1wSibLnAtnn0PotVVY4+QSpjeNUL3YKENjz08nxpr/BOExvs0I8Rz96DxZK
         yWHIE+mL2u0bXRh0C7BBSh5TQIVfqV+i6+4eatf4H06C8WX2V01q+q18hoFt2BsMZAZC
         qfYDlDyLkKOYGOyQ4K9q4xMkNGTNbjoe9z5JBT6xCOmcwpquJxN3rtmequRrAHC6ZTFk
         HlgWsLwVSQkCFXk2n7ZzQfYUYySnqIMVw2pv7lPmovRuv0jPnJKM8zwSEXyt/jFQjMiF
         +rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBRho2ZxX35dY1+0Rwc1Vnwv30CpcZZPcmmUFuHJQnQ=;
        b=EjhE+IGuigW+N3Q8joe/7S1VDRLutkuJdfzUKufQCV2WGNrv7y/saAtYMDXDp+8VdG
         LJYqgZlvl2xJMdJlq9+q486gPdt+G4WBtFerdtaRCVaeSJvdsGq1QbW76tyQZh3xJwtD
         yuDYPhB5aXQfk/J4Cmzof87h2NZe3ffebtHLAZZRmAtVQOn3jfYawqGLCIi1Hp9xJs5k
         Ysfo8v/dH/XYzKFd3YEl3ZSfQTzfNgHW32ceWuJkg0hW5dWTvjqoEmHEHphdI3POBwIR
         k6Vc1nyVzM5Q/BkUNPp+ZVBQj9cU1zGDCgx+HG7OXvPAzTI7Tav6lE/te4CWov5D3sJv
         4cNQ==
X-Gm-Message-State: APjAAAVHgmPZnmZwa0IhakpQnDGWkKmZ5I+QYV0+QVckFYIdr7wHR6pR
	lJ04vOdxwYZN+UOkE2jGbb6q4yuN7jikP9uPFiuhj+TJI0g=
X-Google-Smtp-Source: APXvYqzjqTpQOMphl/YT/BIAuMhylLXvDBMi/BB7jSsGXWCus34qJZJ8aIe/ri3agcVT0Bd62OlgWDSzN/hehqi9I1w=
X-Received: by 2002:a05:6808:d4:: with SMTP id t20mr34722294oic.170.1564407846310;
 Mon, 29 Jul 2019 06:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-2-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:43:55 +0100
Message-ID: <CAFEAcA-+PfEMDE9QJZJ+_yqV0KYY6ih2yxA8c_w1bmrz7GtUkA@mail.gmail.com>
Subject: Re: [PATCH 01/67] decodetree: Allow !function with no input bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nRwv2vqUSjBq

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With this, we can have the function return a value from the DisasContext.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/decodetree.py             | 5 ++++-
>  tests/decode/succ_function.decode | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 tests/decode/succ_function.decode
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index d7a59d63ac..4259d87a95 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -195,7 +195,10 @@ class MultiField:
>      """Class representing a compound instruction field"""
>      def __init__(self, subs, mask):
>          self.subs = subs
> -        self.sign = subs[0].sign
> +        if len(subs):
> +            self.sign = subs[0].sign
> +        else:
> +            self.sign = 0
>          self.mask = mask
>
>      def __str__(self):
> diff --git a/tests/decode/succ_function.decode b/tests/decode/succ_function.decode
> new file mode 100644
> index 0000000000..632a9de252
> --- /dev/null
> +++ b/tests/decode/succ_function.decode
> @@ -0,0 +1,2 @@
> +%foo  !function=foo
> +foo   00000000000000000000000000000000 %foo
> --
> 2.17.1

Could you also update the documentation in docs/devel/decodetree.rst ?

This code change looks like it also now allows definitions
of fields that specify nothing at all (ie there's no check
that a field definition with no "unnamed_field" parts has
a !function specifier) -- what do they do, or should they
be made syntax errors ?

Is one of these functions which just returns a constant
from no input bits still a "static int func(DisasContext *s, int x)"
taking a pointless input argument, or is it now a
"static int func(DisasContext *s)" ? I guess from the fact
this code doesn't change the way a call is output that it
is the former, but would the latter be cleaner ?
(This would probably be implemented something like allowing
FunctionField to be passed a base == None instead of
allowing MultiFields with len(subs) == 0.)

thanks
-- PMM
