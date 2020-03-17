Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1564467lfe;
        Tue, 17 Mar 2020 06:40:31 -0700 (PDT)
X-Received: by 2002:a7b:c148:: with SMTP id z8mr5286186wmi.174.1584452431192;
        Tue, 17 Mar 2020 06:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584452431; cv=none;
        d=google.com; s=arc-20160816;
        b=iXQmjjSb9IZ45/3cjveH0F47DEnbRpP/uQqM4UQ4K0p9/oiQKXggD+7C3oA8wumGLv
         eE71JurIhTyIGw9hT46dqszX6WbMstA7ZoefvODYsh7Zwm/vewT2Op1FYd+hy5uL28zV
         WAbXUYJtRlrBAjQAB39wW86XEPPlHy4jbC8dGtOgzA0n5N3GXESHHlGUUbFOIUYNbMFK
         hyeZq7YbmKWiIxLK/fDB0WooYRteDduBF5l5UDjC7Z4X/PmAFiqrjYw10onBcgqNaj+a
         SHZsdWbPYCFkKWk+aOFyHDXA5H+6uH3OJ79QRzvsWsRMYNIqy8RXO+eu58aXkfXST3XM
         Lirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gHz5sI1z9ZOayv0KlbJkvhXH6M2nXHRZkzOTpi8kNw=;
        b=pmO7kiTDkgkjOJiT05MPwqVpbCA0/I3V74dnaU5mKtCfg6zSsf54G7gk1joRPhdwj0
         85NjLRVlOs6iKQoWphCUkP0UhOQR8HanH3IGotbY3Syt1cO/PdsW1bYsTd72NpcMDspU
         OGA0ZQ8lhFUH8Y/8563ycNO3z0AGv3fn9gaLE0vgvCbE3HalrRekaCvbEgCFtJLovKsU
         EOc/7y7a4Ou5iONrzRMse7t+HOGU3ORWX1eVl9dPPLv/GH5PrAJI+giBO+Q/PbS+ntGv
         38Gy/8UDFA7qllb3erY02UOLfoOjQcRDohVW0rHf4tn35vYR8IZ1o6KfOOOHks7DMNaE
         AIIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cOB5HICd;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.qemu.devel@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p1sor670770wrt.56.2020.03.17.06.40.30
        (Google Transport Security);
        Tue, 17 Mar 2020 06:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cOB5HICd;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9gHz5sI1z9ZOayv0KlbJkvhXH6M2nXHRZkzOTpi8kNw=;
        b=cOB5HICdJ12suirZFoxFXDcphClMM1z7+KrZ9DKfUVkuE+WU7P6MBSm1cP+yrIFtTx
         yavT6D3fG8LHXRJEHiuE9PeEcE4G8UzQkPOKvwwST0AguAz5U0XgWC03rzDEz0f8g4+Y
         xq2k0+mACriJibfw4Fh7XNK1+b38B58E9TkULEGZXD1bOkAuWk4JCEMqW//1Fmqibjp4
         poSCbXtfLjcYIiijHcZDwWdvZY7V94T/6ku8xb2CtIL3ZKBdslRQ4PzZw9iyiToAtaNs
         l96nt/EvProTnFjIDy0Ov3J8F3LCnRfkgGzXQbx24Qhew9Lpz1LQTg5Pl9ibthXmVxO6
         gmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9gHz5sI1z9ZOayv0KlbJkvhXH6M2nXHRZkzOTpi8kNw=;
        b=fnCzZz3z5HcEouoITZp0UVfsRhgmVn3Xo/zKk1hAL080EN7YijJ2G/RGuntVdOdbU9
         fyK0/BLyXbdrZO7IU5bQnJTuEGtfNoSDsescfN4pR0t0t1tV/i06LRP+DuGGZZXZbSHs
         ZGLv6zFnkFRTcCBi9M4P0l5K7CBpOVuricd4WED1u0zv6BKdA9BJlqOS1OlEAdeT96nQ
         5dp6mt7uiMHBreRQUK8Oiz9XtJQLrQd4KdjgA/1Yd9bj7eO84/Gxf72YbEfJG9mf/sBp
         Xn1UjRTd9K7siffN3/R0pdncsnW1o3hpLlpD99ErtouFY/QWUMM5OiTetvpNb1ghubGy
         BXfg==
X-Gm-Message-State: ANhLgQ1CtNg+5KGuAgkxJ2yeorDrfWhcN64v6gASzlWQmE8ihh3RDWJf
	1zxTFsxkA1YAHN7X5YRMReuOzSbsEvp1MFqkAGB/rp3H
X-Google-Smtp-Source: ADFU+vuFpxKAIWvRFkRAkeAELLidx4QrvfJu+DRzoXlK2YfkEUlUjd0uH5a7EOy9hH7IcCT7IWX8SHS/cfd8OHDnrkk=
X-Received: by 2002:adf:e9cc:: with SMTP id l12mr6098752wrn.420.1584452430646;
 Tue, 17 Mar 2020 06:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200316172155.971-1-alex.bennee@linaro.org> <20200316172155.971-25-alex.bennee@linaro.org>
 <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com>
In-Reply-To: <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Tue, 17 Mar 2020 14:40:19 +0100
Message-ID: <CAHiYmc4rPZrLkXP8D33yzvfb1Xn1CjMJHDXYA+W93R=Oe+RF6g@mail.gmail.com>
Subject: Re: [PATCH v1 24/28] tests/tcg/aarch64: add SVE iotcl test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: V8zk+xtoUyCy

>
> On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> > This is a fairly bare-bones test of setting the various vector sizes...

The title contains a typo "iotcl" (you meant "ioctl"), but in any case,
as I wrote in another mail, "prctl" is the right choice.

> > for SVE which will only fail if the PR_SVE_SET_VL can't reduce the
> > user-space vector length by powers of 2.
> >
> > However we will also be able to use it in a future test which
> > exercises the GDB stub.
> >

That is interesting. Could you elaborate more on future tests,
I suppose based on GDB, and their integration with this test?
(if not in the commit message, than in the response, right in
this email thread)

Thanks,
Aleksandar

> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
