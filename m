Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp241977lff;
        Tue, 17 Dec 2019 20:14:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5pggogqdf1YNzn5j2qqw+yNk8ZcXPX8UmsxZ7wR5ebAWNLv1aDpRhPdIO9ViEp6upkIxJ
X-Received: by 2002:aca:d6c4:: with SMTP id n187mr3512oig.29.1576642479060;
        Tue, 17 Dec 2019 20:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576642479; cv=none;
        d=google.com; s=arc-20160816;
        b=HnUHdwYlrndpIwktTkdawU4P16SHzrMbOUrrjMjwRl1yErzdNKvE7UiSgt2vngFG+r
         6Y8z+8CRies4Bn7kjxgDSLWnOmmZg+YrUbDDB8WxcYlOcwFVhkeEhWxLgQcaBKu9PsDz
         VgPfih17DmjDafQ+gQHqjhvB9DwPOCiGD3hVCnTBQeg+vGxgNcWwJMy+802hoL0Fd7Uc
         VFpkPoMXQjv/6tBv6fZFfDz9jLrYafnLXEw0eIzzrgN9dbEznQxEQGalLX+udyzr1asR
         sQrZ1O2uhYz/biEojpag8agngfOmY5cmZ7n5Qk6/wq8LJ+ywggY78bDmC5X3b4GBAEJR
         d/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqJcASg9fWaiY51VT0yBYeRUW0LCqDwhoxU/57LYi1o=;
        b=Ui0k32GHlmUqUCKrlkldLBJEpU/7dkdZJpy00XjtJEm2VVee0Vt4g/cJG0+LMEsm9H
         q8KqlKxoARCl/DhXJe5QVH4vyOacbJMkxqYZGnNtyeXqs3sZLWDRVgzeeaQHc9eWEu95
         j3ASIkFWDI0GZNn0g0W04Vd5vVlkOVbxOanWBKE3bG6pcdLacogD2lCcUXhdae1S84Z3
         SAaDNEsbVtAu+4yWiI21ZF3TxvXqY6qmaH3hGPMKIfROSJjroHjuh5bGw3iuKiwC5PNe
         131NtetNusJCB7gxR1HfeWFGJcBl45CGwKKhhd2C1Hm7405h+Lr8Pc1bWosOeGoHEaQo
         NJBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pnvPTOs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s139si684999oih.17.2019.12.17.20.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 20:14:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pnvPTOs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihQjO-0002jm-6f
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 23:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1ihQjF-0002hL-Tj
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 23:14:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1ihQjE-0006Zi-Vm
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 23:14:29 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:33497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1ihQjC-0006WO-CZ; Tue, 17 Dec 2019 23:14:26 -0500
Received: by mail-lf1-x141.google.com with SMTP id n25so642654lfl.0;
 Tue, 17 Dec 2019 20:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqJcASg9fWaiY51VT0yBYeRUW0LCqDwhoxU/57LYi1o=;
 b=pnvPTOs4gOnztIMN0fnJF90cWRS0Th7ouPshuUe/KKtG/pNJUIW97L7nJW8sq6UJW5
 kFxSaRDrmTRhPYpgYYpezy8SoYosnvY0udgAHAuqp/pOwL2upagPqAhR7RCKfuP/1CDp
 hG+KLus61eWTSZu4MZVYqNf5qHs3OJNUh9p6JkxPnncSmF6NbZWX3vy31iiU4+R7nix6
 Lf0pS67oBxxG37Tf6m65TtbAKfdRJG3LYKYaCwODJzIIY/nRWnoG5///SveSdpvYFaXL
 jLVW9uxhqhC7OAw5M6yU581kDP6OCDnXerW8BejpNPdY7SMqvtT3n2O47gmi5dEUhHmS
 3N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqJcASg9fWaiY51VT0yBYeRUW0LCqDwhoxU/57LYi1o=;
 b=S3mFHaH5NQtjk0q6YeRF+tBiTT6ZDOa5NNuU0613q8hWR1mwH7qFIkI9+sor52SJ6B
 0bLmBlj9niTW3fWIbk/A78Yk37ddWk/EB+LHhoNB8FC3e3rz0adwbg/qZGxY4ViX9Pwq
 6aBRL8rcuKRX7MJ/D5zhJL4CVrxW7GEF0rpB7IsqnY2bFT3FvMlkzGJzErSo6uVysKjn
 yIq/RUq5lU/hCEXUhAjiJO6XE7HmTBOUSsDFM3gDanXIW3malcFy6KRxI7Aic0eymYtu
 +pdEa//aXpTI95yu36iIkcPV5ZX8MEzh49kj+mSyRSz50CHwiE/eAPsorRrNf80ZuzTd
 mDdg==
X-Gm-Message-State: APjAAAUgzgCF3cwrkyCM4XMTsnKqBdVTyE+D5UCpyg49QVDrjL5TJ4KN
 IeyYONs/w3e47FJ026pcKMI4fxibEyni7j0szjI=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr284247lfi.93.1576642464995;
 Tue, 17 Dec 2019 20:14:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576227325.git.alistair@alistair23.me>
 <40f97ae32a6f21d8184c1cc46fad2defb302238d.1576227325.git.alistair@alistair23.me>
 <CAFEAcA8rZtJQsUXJ1E1gOAXzrHihzYvMoodgHhpro1Jd7jkVUg@mail.gmail.com>
In-Reply-To: <CAFEAcA8rZtJQsUXJ1E1gOAXzrHihzYvMoodgHhpro1Jd7jkVUg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Dec 2019 20:13:55 -0800
Message-ID: <CAKmqyKOb05HRUGw=h76dM_X9Ke1WT24kJn6Mh0XuRJFYkQ1aQA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] hw/arm: Add the Netduino Plus 2
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cKrtM8MzoKo1

On Tue, Dec 17, 2019 at 8:03 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 14 Dec 2019 at 02:44, Alistair Francis <alistair@alistair23.me> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  MAINTAINERS            |  6 +++++
> >  hw/arm/Kconfig         |  3 +++
> >  hw/arm/Makefile.objs   |  1 +
> >  hw/arm/netduinoplus2.c | 52 ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 62 insertions(+)
> >  create mode 100644 hw/arm/netduinoplus2.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 7bfdc3a7ac..881e7f56e7 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -105,6 +105,9 @@ config NETDUINOPLUS2
> >      bool
> >      select STM32F405_SOC
> >
> > +config NETDUINOPLUS2
> > +    bool
> > +
> >  config NSERIES
> >      bool
> >      select OMAP
>
> Something odd has happened here -- your patch 1/4 already
> had a stanza:
>
> +config NETDUINOPLUS2
> +    bool
> +    select STM32F405_SOC
>
> so either that should be in this patch or this fragment here
> should just be deleted.

Good catch.

It kind of makes sense to have that fragment in this patch, but then I
don't see a nice way to build the flies as they are added, so I
removed the fragment from this patch.

>
> Assuming you sort that out,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks Peter

Alistair

>
> thanks
> -- PMM
