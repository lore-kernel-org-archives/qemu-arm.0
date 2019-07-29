Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3110712wrv;
        Mon, 29 Jul 2019 05:44:17 -0700 (PDT)
X-Received: by 2002:a9d:12d1:: with SMTP id g75mr64874277otg.300.1564404257698;
        Mon, 29 Jul 2019 05:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564404257; cv=none;
        d=google.com; s=arc-20160816;
        b=BsWOE7Z+Fl+kU3guJhP2/Csa1H8jRHPf9kqssa84fvr3nmTswY3oN7/zlNT3YoFpMW
         C5YhmpF1yPaoUWMlxBiUKsv5sAWfp2SsHNtFo/D6QVX+BgxcbnUiFlkR+0N0L+pk38bX
         YukhldFo6LaiXihzMVG1z6uUF1facHMGC0d2flcduS0I5nT5HUKHWukFzDlcxbIlIGV3
         +Bv4JsOndEcgHdKKwrmOfCFewyEy9feLS9R5ImWtlC7aoSomny+zDfZLeimtMb0h7JUK
         D2XkpdfYvRhP6CK1DcLEOzUZDNUalpJhMq2hO7wIbZu6QREuLi1X29dWKf8wfLlX9GGV
         FKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axBUDQ/juYdTqJW1DQMakICAGQZ6LrtKnM5P6S7oZps=;
        b=KCOMHIV8kWuSF36KM4KTcqnTkU0GzPbFm/riB9xAm9U7DwHv2ZFu6W0gQlSUmcUEEX
         oX60klVWRjoaJWWLfTqgR08KJKSn7/WjXLLC7tdBgjTszISDb/xLXJdZ3tRL/uVtdnDh
         pkpn73pMK/2vvVzfuTMXwf7gGltI5Hh8by01jhE0LSzfsSMKMZVcPn84QWiQL0MCf8fL
         ewgF7mxeyZkFQsUIRQk2u/8xGQItH8p1CcNp3r5jcGgl5P8ySMoTCJXNXIIzdqOdO1Sk
         5VVh3SC1eUdwpBnS9eaFS/2QGoK5fIHayWo7E59lrzCaOgHzgkirUnTCNB/29lZFsTcR
         VNbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLNgS7CL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 106sor31519573otg.120.2019.07.29.05.44.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 05:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLNgS7CL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=axBUDQ/juYdTqJW1DQMakICAGQZ6LrtKnM5P6S7oZps=;
        b=vLNgS7CLdVg6n80qTAeeMCM6TR96YysizTjetC1BTVkSusLAG5g2VqrV9Mm8GWwpv7
         YQazvJm8sjhPtFwjMG+qnWE6kNbbROOZjHePojR/6l+hyBJETgdFVEXdX6wDt57RJVZU
         Z2rhf6IUcCoXlOlRen8QjHeXEv7FEZIfJbq2HKVenBjfZQYxtf59OFwMtXO/DYmG2OZS
         U6r2zf0RqEoAk5+NdF1POQh2beGtK7WapYC2VeYsvxd3aqPHVykcAShRbADrgPn5K4vd
         GRsahwBoqn7jKr1KGmy2RLKce9uftpbwvhZQGPDsg6+RJ6PEDYASlA4nP527fx3cUijX
         S3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=axBUDQ/juYdTqJW1DQMakICAGQZ6LrtKnM5P6S7oZps=;
        b=I0qFOLPrZVR6AYYbJ5/4eDh7L+4DRpq2cSgEo4+5GouZyUXRhNbbWJOV0NZlr7GFAp
         iKf3oP02i+HkEwxS0BxjBv1gwqW9IWl3E5RmAAyKBtFKa9lQ6/C/Bl19hTsI+MHCYu/W
         LyMV7zzF3mNAbEMSlGNiL0yFN77dh7jHblqr0C9u/U248LFbw7QHWmDG2Gsn1pSqBN2M
         wdWJcaJLaHk8wn8o3wVEZOH/3AU5G+MOtxOqHAgjtEzBPN3aKpxqKmX+aNXvYv71TYOx
         F8XhcVspbPBQlGQz/X9FqJM0+YDUkgAr2qq0XwPGzzH60v6DRXacS9o2apuOScnTwgGt
         YLPw==
X-Gm-Message-State: APjAAAWo0d+PWte54EyH/+y0NRF/Fp72Xa2BQ255JB+4vY+B17g7LzMx
	Zoif3oGnStC4w7dNd3SCSc1Rmcl7DsV4qxZJ5ZoKChJi+p0=
X-Google-Smtp-Source: APXvYqx3x0h2tzqFojssy0RlaJbtAIXWP3juCbAgkaeHGnWUwdpT94f/VmK6yeQXmMPE0NrRndVzo1iV1Hodrm3fSZw=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr32509663otk.221.1564404257124;
 Mon, 29 Jul 2019 05:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190726113950.7499-1-alex.bennee@linaro.org>
In-Reply-To: <20190726113950.7499-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 13:44:06 +0100
Message-ID: <CAFEAcA-N5BCMkHA7Mujyts3Q2WiyAMqZq=+L=tsr=cak2QTzYA@mail.gmail.com>
Subject: Re: [PATCH v5] target/arm: generate a custom MIDR for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WhyOxtWxUu0x

On Fri, 26 Jul 2019 at 12:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While most features are now detected by probing the ID_* registers
> kernels can (and do) use MIDR_EL1 for working out of they have to
> apply errata. This can trip up warnings in the kernel as it tries to
> work out if it should apply workarounds to features that don't
> actually exist in the reported CPU type.
>
> Avoid this problem by synthesising our own MIDR value.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
> v2
>   - don't leak QEMU version into ID reg
> v3
>   - move comment into one block
>   - explicit setting of more fields
> v4
>   - minor reword of comment
> v5
>   - VARIANT->PARTNUM and extra words

Applied to target-arm.next for 4.2, thanks.

-- PMM
