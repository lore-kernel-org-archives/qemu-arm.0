Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1213501njc;
        Mon, 10 Mar 2025 07:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPpZxs+XldTzxuS2Zn2mu4rKBFTy7nA7XbTSyIeR9nCt3daYjgK+9cigxd2pDcMkpPzBNQT0KkOrySCw==@linaro.org
X-Received: by 2002:a05:6902:124c:b0:e5d:d340:b046 with SMTP id 3f1490d57ef6-e635c1d663fmr17154922276.31.1741617788310;
        Mon, 10 Mar 2025 07:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741617788; cv=none;
        d=google.com; s=arc-20240605;
        b=i2hA6C9nhp38eZRZ6VAaZuVlB1gorhIgb4s29z+ErOb/WfaNjlSLsVhp22DeumxHO5
         A7bN5feY8JUiHTT/zqDcyCVSjHXoN2DBR3NFeWQUqf/hVPIX9zsZjtsYUPiuFc/q3UAs
         njBuf3B6HMaKh5Z5YwTSapniSqG6sXvw288DNFBhWnatbg4+nav5FluOmbCbnGF5d1g7
         fUSd9Ct6hkyG04Zudc9dXtv9JXCrTwwMJyoygidZycnv4LKrIlErDtHIz2l3LWUdnMsf
         q/el83XSLJW3V+nupv0D1rJcsQbGRD6HHa+yF1LcVmaRo/iXVwxCf8AgD62sbo4hwSBd
         XJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AK4GAtrIkICur9775qYB5WW7gfZBTN0oWrIaeShpZNI=;
        fh=foElHh/ypLwYF1vQWdOqE/d9dmtnRyxThvuP2t+XFkw=;
        b=Zk7R2nZdrsrec+L2VwB6cwOJsYDmlSE20ydpe3Wpy4nkUS70jXbmuicVFi5ALr8yeO
         JVy6AS8UL1aq+VCvhwgPr1i2dwORfSC/nRb7XtK2dEvP655x9mg5I+3qSPy0WTI6eBb7
         xzPDiCm4yv+JDNMbFK9+6YazW1Q52LTjgJz0c1k+9TLIaCg9KQTBI80pPVPv/dW4xOQB
         Ru0Fw69xfvL2ra1OwROL9UM6M+WdV49s0aXMCU6uOOJlnhlXh9fQdh9w5Uc1M0J+aVJ4
         0cAfZzm+prz0UDkU4YL14vMPPLwURe02z9PexzsryIuTIzrgWDFvso0rnnpSRSps1NIj
         kRrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r2RZn4Pl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e634b842803sor4984849276.8.2025.03.10.07.43.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Mar 2025 07:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r2RZn4Pl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741617788; x=1742222588; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK4GAtrIkICur9775qYB5WW7gfZBTN0oWrIaeShpZNI=;
        b=r2RZn4PloCFtFTX5NuqfpO5LTUsdxKxGzOnBc4Qoy6N3WA3u03OwVv7NlCzyeHByJd
         1XVaN9jUo8Wa6Xu74c62Ok8F7s987j7E28hM6IBqRDBKW9Q67Y2jwyizEgJ36nUFxQHo
         nEfxXtRLI9XCwCpkhaMWNy7PpguLjiYd7woGc8ZvCbHXURQg2zBt4F+Dix4PqW9poAgX
         jn5aiD+DIzGKk8wFb+CiBzrtu00JyOS3FlA8oGt4WR+FAvAPS5RIWZg+H7yLHpCgNWWB
         bBUyfSpNOUW4xEwSF8HNfVyowV6G/h3yvEo6Niw+L8Fa55XHyxaHaWWNwkDk/msR+69V
         BXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617788; x=1742222588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK4GAtrIkICur9775qYB5WW7gfZBTN0oWrIaeShpZNI=;
        b=ib09Ww+jPWv2Cmt514OaESJPApSINukrfz3wf/mEZXJhZkARSu/7GRNVjQssTHgLQt
         A0OJfMQD0VAz6JOoJHk1coKeh1ixlzSm2PBH4vTFEAA16RV4MYUPaFTwsFpfHzaMozrV
         ZD4lFSMc5yLbUTGWj4pa3LmljWDb2PjhNsUY6MFCc0qYFZiRq2Wv/2MazzClNSpbKaO8
         CZnkI5BmbjyOrN/j97ZSqPWExYLEvrXPOV9P6jNhWLFNth/akTGIANr7qzTuP+MvGpsT
         z/bLV3x+bieSr5JPZF37qiIoe9lvCzjsmE2jBk1ZHNPkzYmRFaPf+rGqsaesd/jdk5Il
         ymVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmFYxFetV/NsWRJ9gDvPWsOMGxFC30eZsAa+3Ii3jqzaVrJBfHPbCevVtTCviPkLNwHkQ70G6eNgsnRA==@linaro.org
X-Gm-Message-State: AOJu0Yxzb4YA7L6EWIQyd0396rMrT5gzDO0Bj7NftItBMah7stq/8mNW
	GzupECwwTkmPsdgNEzNJf9UIQYHJ72FwatL9pnU9C8SIbrKdU4XMoPxPc+QRrQxE2qImCaKBmXi
	rDcUqPxb+j3TiYpHBaK/uFsgOlwHm714fR9OXw3le
X-Gm-Gg: ASbGncsAGVBwoFsDpcb+MMPDmdrVJJ3hWWyzwbozzg3QCSlfmPSELeXFrYb6zKwZr5J
	IAFJyrO1Oz+ERl9f3zcv1U3NaJY45/3elCVgaXogzIheks6Unr4jU1YyXS6wLCHwWW1r5IMbD4Q
	0TB3eeU3NArGzSe9GRmC/mEZRMY+Y=
X-Google-Smtp-Source: AGHT+IHY7zT8K9MZdjKo3TYvRYnCH8XHMqyqLke+H1jbGAUdZ4kJg+oNGaEOL2T4GPyc4bE1nhTEn14wyRhxyDMXRNQ=
X-Received: by 2002:a05:6902:320c:b0:e5a:b05e:4da8 with SMTP id
 3f1490d57ef6-e635c1ec1fbmr16504436276.42.1741617787810; Mon, 10 Mar 2025
 07:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250310012825.79614-1-philmd@linaro.org>
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 14:42:56 +0000
X-Gm-Features: AQ5f1Jo09qEstp32yf_C1bFj3a84fYZNtSzWFtDVSb6pKdObc6b5Ugwzd67mpI0
Message-ID: <CAFEAcA_fRWgntwbiFiDJqAkthR8vBzrkLOLkp5GeHD9O8xTMCA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Ib4FRLatJsW0

On Mon, 10 Mar 2025 at 01:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi,
>
> This series add support for (async) FIFO on the transmit path
> of the PL011 UART.

This hasn't made the last pre-softfreeze arm pullreq, but
I think we can reasonably call "don't do blocking I/O"
enough of a bugfix for it to be ok to go in early in the
freeze cycle for rc0.

I've applied it to target-arm.next.

thanks
-- PMM
