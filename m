Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp751494wrp;
        Fri, 13 Sep 2019 06:32:10 -0700 (PDT)
X-Received: by 2002:a9d:4003:: with SMTP id m3mr40394257ote.36.1568381530147;
        Fri, 13 Sep 2019 06:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568381530; cv=none;
        d=google.com; s=arc-20160816;
        b=FYRCFYHzrIDNiJDKMv5UYXm6085t2JoQapwXPvbD2zRZhRI4gR0Qxua93D1OEvtG4y
         pX/vUp1rmt+CSXB6a5zTY/p0GviCfQt0LzFLz7WNjgaMDgwAr+KTm4EjQ1snWwuY3hhB
         Zd3/FTCxwr9i8nXdekZznQ1uytKNGwm89FLAejXW2wty8JcXfXT98c4FNIBwSJyry8Gl
         eB5xCHb/PR4SNDYapgg0iGYi2futNuuAF9LAlun4u6CszTU1GmmAIoRQfjftC0yacOGE
         lYrYjpL9U1DfeUEOr8i60Sq27/9CBgV5IqSqwag0Bopy2BuAZjHoRVUClMecKRCp44cw
         FyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7trqVJrmkywyB5GZi7yefpvZK4PlUMzNX3LVdRb2vU=;
        b=IUgaTSYlS0dT6pJW1+hZ5WxXeLz9VwgzS/F1LMnA4W1548rH4CdTEMW06Ks183hc99
         58PUzj/0x8b7rSCSO5j8DgvDpebrp4lXPc2CzVD94z4+xMMVO46ew4ARQSmk30ywS18B
         fSWfZ+hFBOnUcPNWnvpjNBmvsv0LL5f91OzEmaymwLWJ7bp4sjTWfFCEfPXbYxP2L3sz
         laaHKy7WC1QrDx83YJAcFX1SjRNUYb+EygmTLuz8gpMV/22I73WluPL5SYUssnbKsKPv
         XVxnkkNNEFn3ZNulET7w5+3ZOr6KcZCX8wClStN6peXJ5ZFxFdSiLoUICkqSMxkCKlom
         Xu8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0PY2evD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v1sor1272879oiv.140.2019.09.13.06.32.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Sep 2019 06:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0PY2evD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y7trqVJrmkywyB5GZi7yefpvZK4PlUMzNX3LVdRb2vU=;
        b=n0PY2evDPmM7Rp+rbGw3civXogwcVfP6zCrzWPflZjb4FsbZrPlvpwFGf2lsXU61dH
         7tUatyFj3nTW+tnciDjfKlBuqwIUjYux64XTtwsXw1zor6KBG2+u9Vh60f46ezSwba60
         cBOPs3d8+KdVIh8s1YVVTlDcULqLiWkCehsDZ7HlbMvC5ST5xVHpRYwpqLr+dW6AiqlJ
         xGqx2QfUDx00EO6fz9PXNKD7HBBzkbYHGVyhadCc5KarL2SGOppDyxMXiHYSivrlrPWw
         5/1MMVCDUrTDEDZmAQUcgNHo1oaVU/aYVY4XqLAZRrg99UYnJ04Bw6PtYMpz2/PxtUxd
         Wg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y7trqVJrmkywyB5GZi7yefpvZK4PlUMzNX3LVdRb2vU=;
        b=tRgk44e8ZBCIkAW6SMOXCAE77sCbAutCDUuZDuWWl6eHEWZsEcZFTAS8kTdtQfvJyx
         CQ8zdyaY7j34uPXMq6KKuvySrE0s0yDS8lV5Rd534NnsWiVxFTMwfhDMWSxDUKx5sDZx
         ORafvOoPuR84rXj5GctruYfRhLOJ71q28NOwy5J7LVXJTCNhwvI+vLDVQTYLNw+l5IL+
         /+XyF2uRYwz/xQ7rShndNfwdcpX7R/wujsK8CIK4z1GZHCq25RfXjuj8EqHVSzj1QH/o
         2l8fMPK1mUpUwK+DHKpoWYGDWbbxOOFwejSN4cWfBlSw9jvqDOdqzQ2YmVkHr2lygDQ0
         ogrw==
X-Gm-Message-State: APjAAAXdJKv/OcD4x1zNsIUXFh4Tbd6/eeod2M+GyO6Fsm57XoVe3rDI
	lu2OcXD30+0JBxsqy1UoXzcukOa1v4rLfay/2yWoJblX9saReQ==
X-Google-Smtp-Source: APXvYqyZHOCDoFSlU3MrtHG9XVV7t6SnTiFaA2Q91nDOiN3DbdT/zLj8rEOXIYWnyiCZL2wSQYVWAMFJ8RInJX3xnvc=
X-Received: by 2002:aca:281a:: with SMTP id 26mr2326684oix.163.1568381529533;
 Fri, 13 Sep 2019 06:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190911164959.11003-1-alex.bennee@linaro.org>
 <20190911164959.11003-3-alex.bennee@linaro.org> <CAFEAcA8NsdpEMOH1MFDta0LUswyqSDHCgtOh6g5k3+EU0FVuHA@mail.gmail.com>
 <875zlwz5o1.fsf@linaro.org>
In-Reply-To: <875zlwz5o1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 14:31:58 +0100
Message-ID: <CAFEAcA-6BmxkFND4nZBFs70nVPEFzSFrE6RMQ1O3ftqozYYoBA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] target/arm: handle M-profile semihosting at
 translate time
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vDW3G2MZLiX0

On Fri, 13 Sep 2019 at 14:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > This is still disabling semihosting for the linux-user-mode
> > build for M-profile, isn't it ?
>
> Sure - as rth suggested. But m-profile doesn't run Linux so why would we
> support it in linux-user?

(a) Linux does support Cortex-M, since it has no-mmu uCLinux style
support these days
(b) gcc test case binaries, which tend to get run on linux-user
even though in theory they're not actually Linux binaries

thanks
-- PMM
