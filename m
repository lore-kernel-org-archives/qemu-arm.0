Received: by 10.28.4.212 with SMTP id 203csp978567wme;
        Thu, 10 May 2018 05:55:28 -0700 (PDT)
X-Received: by 2002:a9d:3844:: with SMTP id r4-v6mr787825otd.13.1525956928112;
        Thu, 10 May 2018 05:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525956928; cv=none;
        d=google.com; s=arc-20160816;
        b=yd8UmOjwyJvfHVYsQHs+JeqqweKvQHMOmTnIOZZaaC14jTVWkM55fpgUuFND/BVx/x
         N/HBfJbvhxCjk7KUK9U7JwuI+FeeWYvHdmfmQk62BVc/X4RnYV7G11ieXCjhIQaYRKCn
         B8GtEZJ2fv6IO/ml6itUvp6AT3USQeVF1ZkNXybsncbrRyvn8S3hfaODXV3dxYUdPfxk
         397BAq5CYyfEsvcX+zGDTvSiJImjKnP5qgaLdgM/mkOj62QB/KQEZs+LxgNOdngOwVIq
         burdRN68KtYi/7n547JtK9T/Fh9NgZwIPaqr3s8Mjn2nUF96IeETdeSuiaoWJUjD7a/+
         3NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yiossOY1l66cAXnGN58jkmqepv3r/Gj2YH2xWkywEdI=;
        b=kGVDcXD2UfS5NRr1hQ3fmdQR/zZ5ylvMraSgnYdRX6xCU6JH1CyrOt96/BxVhCghal
         JIF53PhiBcg3XSYjF8S1yfyz0w1COng/wYUTWT/wuByl3B3VAdyRutJMr0V+ojHXrsQq
         1W/2uxeZu2Y5tUuF6F/M0qvfqg3/kx02xTA8YG67jiNz2ipgLYOzkl8qT5T2c02ftDyF
         p0nlSSh+ojKCaatltDUObdIRTtr0AhbvFMLGlx7zXnUGqxKUwp1+thVywL8DXlEydVrT
         y/CPqXfwO0i27OAcEq2w6L9sQDwo/A3AO3PVl9NhRV89HWNaL+G0v679cpRgQhmAa0PT
         ZRjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hFConCnx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i35-v6sor313506ote.325.2018.05.10.05.55.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 05:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hFConCnx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yiossOY1l66cAXnGN58jkmqepv3r/Gj2YH2xWkywEdI=;
        b=hFConCnxS703da0I2M+aHMuFjxaJ8oMpzvI47ChrwAUDyN3nHL/A1uI4FrdVYSPfcv
         mFXnDBb6UH7mgzTGY+/++CQ8V2ft9f+x4MgtJT9PqX27pDaJ+7Av2DOV5knfXGXKh4A9
         l4t+kguSTVjbJUgDhT5V6Or+GkCF/crTkyH1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yiossOY1l66cAXnGN58jkmqepv3r/Gj2YH2xWkywEdI=;
        b=ta5XseOXChhWz6y4fX9jB98OAvwSKiD7ws+LQfZ92JOtAYM4ysRocBeyw9SftuHvKT
         +On6655vylYQJUUG/jzdqkNzU+EJ+KQTM8cBNZYiquGTF+N+NKBxFJEjQErfksCHfqSL
         2LD9pJaFikoLaf1p24yyGlRq4IvPLvSTXAdnzK2garNI75rjRVYRBapjtrmhvkfldEmy
         NUqHKMr/HJtp2ilVHY+qzDZqCKPwEyOQK+4ddQJAp82ymLIWydXEP/lQTPVM4ygIkrBj
         PKyCJA4wQUu7IuUmbrmTwd5gdrBX2iKB6XhaRCJEzNRKmc7kXDiEpcAkPmwfzepe4tE1
         avGg==
X-Gm-Message-State: ALKqPwe8I2ER0PP/GQuWCukP3WAOz+1f1amsM2BEkrsBW4wBIhCH6XgX
	6mJvDEANLCUgwksOSyvT9OFDCsSVGZbLetwg3cVWwVi/OBs=
X-Google-Smtp-Source: AB8JxZr6/thYBh/7bdjJuAksKSH5ByrpVv2nmum8Yta7IBgBsijB4fBKZSMCcs9jl4bKetPSiIN/XKgAf5AKxQyi7Ro=
X-Received: by 2002:a9d:2625:: with SMTP id a34-v6mr884846otb.308.1525956927496;
 Thu, 10 May 2018 05:55:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 05:55:07
 -0700 (PDT)
In-Reply-To: <20180510094206.15354-1-alex.bennee@linaro.org>
References: <20180510094206.15354-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 13:55:07 +0100
Message-ID: <CAFEAcA88-EFYN3y-sU=YbzeT-eXCBk7md-y2rEQfpJtZ+MF-wQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] refactor float-to-float and fix AHP
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: bO4Mfau1nf0v

On 10 May 2018 at 10:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Hi,
>
> Hi,
>
> I've not included the test case in the series but you can find it in
> my TCG fixup branch:
>
>   https://github.com/stsquad/qemu/blob/testing/tcg-tests-revival-v4/tests=
/tcg/arm/fcvt.c
>
> Some of the ARMv7 versions are commented out as they where not
> supported until later revs. I do have a build that includes that but
> unfortunately the Debian compiler it too old to build it.
>
> : patch 0001/fpu softfloat int_to_float ensure r fully initial.patch need=
s review
> : patch 0004/target arm convert conversion helpers to fpst ahp.patch need=
s review
> : patch 0005/target arm squash FZ16 behaviour for conversions.patch needs=
 review

This still seems to regress the NaN conversion case I mentioned
in review of the previous series:

(3) Here's a NaN case we get wrong now: 64 to IEEE-16 conversion,
input is 0x7ff0000000000001 (an SNaN), we produce
0x7c00 (infinity) but should produce 0x7e00 (a QNaN).

thanks
-- PMM
