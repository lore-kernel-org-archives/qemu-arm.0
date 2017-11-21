Received: by 10.223.159.82 with SMTP id f18csp905249wrg;
        Tue, 21 Nov 2017 08:51:37 -0800 (PST)
X-Received: by 10.202.240.65 with SMTP id o62mr1845972oih.300.1511283097496;
        Tue, 21 Nov 2017 08:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511283097; cv=none;
        d=google.com; s=arc-20160816;
        b=wDj7dn0fAtDK3d3PrsbslY3nI5mLslGozTFI8+QVEa246drIBZLdCAT96/3pVLyrfS
         97ozs6saCQYJRLKK6SvjoVV5V6C66Jq1GEkfQmOZ5Ps5FJupk6y0ESdVdK9weCVyM2aX
         DYMFVg3YL0NLTMmHXSydwyxXehWXcZ5yXgXNZDXFUj1pqhgMe4OZoY39vwrrF6EIiIjj
         vTHYkz+qIFt3Xr952dDcubW7jCzY+Rmb8WTOnNSXcbO845Bj+VeslgjlXZwk54ATfIRn
         xoOOKeIxiq7lXNIzhlrwM+EbrnDDmqSX0up4pJ4l4A+xaRLQfclCLyGo4NVZ+BD4SkM6
         Q/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XkpICOBwQkplJWGtbJ+BFNZ6zrrBCdjoSMt9MGjDclw=;
        b=L9fgFbcC4zim0teULNDgVq7MZLA9lR4zuhz3tm4aK/bx0kw6xi0yN4+t+qgPZE/ZIu
         0EnnbcKOvKdyW/XPfgioFWe++bYqzQQBvH1VLlV0Rx7FnaqyfAWzyVVBz/Ig+nPos7pN
         4na/rMuD9Vfio5sPDhYWmh8LzvSLNHVRlkwxJazvpTrBW6MNbxJ74y5Qf/ErhnBOOW6q
         fzWBxTq5hfaJ/0+GswFrulviBjNevP4zFzwdEBr2KlCCJL2tiJ02V7kcZjE/h5mqQdQf
         MA17xiSmMZMagLt/FdqcnhDFYIF4jjKbEqJJAj452c7sHq8VYRYHa+PY8q/5TTQJoix2
         wh+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZHoEOSH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j81sor4496984oih.116.2017.11.21.08.51.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Nov 2017 08:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZHoEOSH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XkpICOBwQkplJWGtbJ+BFNZ6zrrBCdjoSMt9MGjDclw=;
        b=hZHoEOSH6NQA+mdwmI64UGo0D4nT+jzScz7eNkzVDaMSmY0JA4VCDJyCzh1mlBwVnj
         5Qf5qFwsH5tsF70q/Ibml8C/NMyt4JOtjd3SBv4BI4ZAPmmSmpY/6au4hxsytpMjgdvY
         3mtF5Q/1U5kqA7rKVB6234yx+P039B9V9z1R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XkpICOBwQkplJWGtbJ+BFNZ6zrrBCdjoSMt9MGjDclw=;
        b=hql7Gc3Qyn/IYPHhDm3LPBvfm+/4f9mIpmF7EKRBAKXS8GokubeJbOgvyixm9f8DUh
         LI8NzXfiWfpl2cBC2Bj8e2cShKxdwCk7By8njRbcsuvxupW0b9b+fjLuMqktQx9pMiLx
         OnFRCQvUgMOvjMnHKI3rA/UieNumhcwAI5tf5Ik7oatC3wnR27DMcMJhToG6yVdt+Y/z
         JEOyPiaEZOHwV3KUYIB1AL6B0Mty7axqlp8cEhLmmZzbNcxBNBtjU4sJJ2aBTlnHpS2Z
         ls7XJ7LIZGqVwVUizFDSg84P19Qz+MYDI1MdrNy5fAg76q3PiQKNlfGG37/HFw4nMQqA
         l1CA==
X-Gm-Message-State: AJaThX61eWjYWjAEN11yGpqK7OQaICRYv/4floUba+SXkQQ2mdbalGNT
	pgOydJ9pM/4F7NLNEIwtNcdeOcFBmBdKpbZMqQrpQCCt74k=
X-Google-Smtp-Source: AGs4zMaL3/6Wde24MB2fmPq92Fm5mMGEu9RindvkKs6PscRMZ2QfdKYi33gw6o1vmdrm1bMUu821UH9LQXsqiqKPkxI=
X-Received: by 10.202.114.22 with SMTP id p22mr10699606oic.327.1511283096838;
 Tue, 21 Nov 2017 08:51:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 08:51:16 -0800 (PST)
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 16:51:16 +0000
Message-ID: <CAFEAcA8-kyLTiaJxfwmWx-85qZ2W31V8whqLot9hPX5AizCZng@mail.gmail.com>
Subject: Re: [RISU PATCH 00/10] Initial support for SVE
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Dave P Martin <Dave.Martin@arm.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: N5ZcOZLf+Biw

On 7 November 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Hi,
>
> These patches apply on-top of the last clean-up series:
>
>   Subject: [RISU PATCH 0/7] Add @Group support and some aarch64.risu clea=
nups
>   Date: Tue, 31 Oct 2017 14:54:37 +0000
>   Message-Id: <20171031145444.13766-1-alex.bennee@linaro.org>
>
> This series adds support for SVE to RISU. Most of the initial patches
> are plumbing changes to better support arch specific option flags
> (cleaning up a TODO in the process). I also needed to ensure configure
> actually honoured CPPFLAGS so it could be passed yet to be released
> headers.
>
> The actual guts of the SVE support is in 3 patches. One to risugen so
> it can generate random values for the vector registers. If this isn't
> done you get inconsistent runs because of left over junk in the
> registers. The remaining two patches add support for copying the SVE
> vectors from the signal context and dumping any differences found.
>
> To test this I ran on the Foundation model with:
>
>   ${RTSM_MODEL} --no-secure-memory --gicv3 --data=3D${BL1_FIRMWARE}@0x0 -=
-data=3D${FIP_FIRMWARE}@0x8000000 \
>                 --semihost --network nat --network-nat-ports=3D8022=3D22 =
--block-device ${DISK_IMAGE}
>
> With my hacked up copy of secure firmware to ensure SVE is enabled.
> You also need a kernel with SVE support:
>
>   Subject: [PATCH v5 00/30] ARM Scalable Vector Extension (SVE)
>   Date: Tue, 31 Oct 2017 15:50:52 +0000
>   Message-Id: <1509465082-30427-1-git-send-email-Dave.Martin@arm.com>
>
> My testing so far has been to ensure that each run on the foundation
> model is deterministic (same m5sum on each trace) and that differences
> are printed out when the user-space vector length is tweaked
> (/proc/sys/abi/sve_default_vector_length).
>
>
> Alex Benn=C3=A9e (10):
>   build-all-arches: drop -t (for tty) from docker invocation
>   risu.c: split out setting up options
>   risu.c: add missing --trace longopt
>   risu: move optional args to each architecture
>   configure: allow repeated invocation of configure in build dir
>   configure: support CPPFLAGS
>   risugen: add --sve support
>   aarch64.risu: initial SVE instruction
>   risu_reginfo_aarch64: add reginfo_copy_sve
>   risu_reginfo_aarch64: add SVE support to reginfo_dump_mismatch

I've applied patches 1, 2, 3, 5, 6 to risu master.

thanks
-- PMM
