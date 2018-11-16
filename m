Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp225016wrw;
        Fri, 16 Nov 2018 02:52:26 -0800 (PST)
X-Received: by 2002:a19:ae03:: with SMTP id f3mr5718299lfc.86.1542365546895;
        Fri, 16 Nov 2018 02:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542365546; cv=none;
        d=google.com; s=arc-20160816;
        b=x97i0b2LcyMnrVzEvkg6BOPIFxxNU7YU0tRn1e+yhkEN2+OhJRfYlUPI8lrASjXd76
         W82Pu/vGwd7qvufI5mzATo4U1Hg4N7nrimdGhf3mYwPEdWjwv9mtJHqSJARs1QDx2ZMQ
         rk35Zu3L6FeoiX6Jb+Sh1ei21/3IsREG744nnK7VzDfTo/+Kwcg9JOYTs8q73qiGxuZp
         xwJOoYBbxYAe+r67tbmuZLjGnprANlgDNMLXrfCyJuM3Anqk1H1Oh34TJUgYczzMamBL
         YijnsJCAsw2ns79tnyl6+nIOcFAtXSRw8qrXDDTXzb9dTP5JOwNE2Z21zVYyvemYsW33
         FKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AAqrQ0sXzOesBygNY6JWBqmH9djmQxCpJWadV+uiyYY=;
        b=PcyoxUH2zsKf1llEpDlqATIUtB+SB1kDzAbd5nfjlcJdlkn6mkPg1mkl1cmvwtBTVk
         hq2dO1PxLRiY8h+6rwQQ0pcizq4SMRyEiF7G5tAAShQN7y5auAKkVVc6q7TeIH/hGVQv
         HjTXaiV0rBMFqFD8FLUD9v4TPAWIoRAgQzuiWCJ5Qm/C1ExgTv4uIUj2FYYPK1h/bWSq
         aozwOLr+oqcMH0Ib6qFY5cjkcobSXe4w8sSnkAlt16YG6pt5ZggQvZoUaRV/BgLplzP1
         87EEJ1WKK4ty8r+Hh3K4KwzUOOVDZCeoVYPx9s77/zHu21F7SCRgTqXB8tre1lMk+7QN
         mQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WOJeBjU9;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a66-v6sor15224939ljf.31.2018.11.16.02.52.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Nov 2018 02:52:26 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WOJeBjU9;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAqrQ0sXzOesBygNY6JWBqmH9djmQxCpJWadV+uiyYY=;
        b=WOJeBjU9WLnYBaNOjEOsYcovAPBu8K+C6wUuSbqozZys5ehFD9ga88PHUm7x/MWR43
         L0BsW3cL39gZqBJYUMrv8M/kA4A9GFowgWgaPolgMVBV/DoMC0U+br/acwh19RwkoEra
         c3PotUg5aLgPCTXaQMoj4PfH3YMSTElWSqa7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAqrQ0sXzOesBygNY6JWBqmH9djmQxCpJWadV+uiyYY=;
        b=IXunjd4RIHHydQYFhXLBhsgm3tErmHhhjGqR1rS6WpnYbJw7i4FzMoj/LOqExZKItc
         Amv3k4JPM2LXE9OZcWsVO0RCfQYjXSSS2LC8dGG2MuSdkjOAginnqvy8t+ONrQdqHaVh
         AKKWNazasJCmQHgEC7irrRHVcnHopfosz34DvWWKZjiuJyJpvU2G7MgVbeUcp+cmVOzU
         lcr0Jh8jn/ctaU1c/cXvXy/70bvsGl4zFTZDPsVUzhlQD3XxXqhtHw4F1Z/PLhSauy1l
         LBOBGCyt6Ow2JQJsJxDQN4cXKQAxy15bEEqd7qugPxWgkzMT2xMgkkAS2eM73E3AOh8v
         o6Kw==
X-Gm-Message-State: AGRZ1gKlN0p1tNbzghf+Zn5ZYraefnq7RfUW8j3Wz7ubkxrrZnZ/0Aut
	E7W4Km9s+lcCfFd6iZQebeI5MfZo6KJzCGw/ucEYNs7M
X-Google-Smtp-Source: AJdET5ckihaXYKzcCELZ6KKS220BeC7O1OXOYT4P4aZ6dMnC2j10P90We+Tq7hvRqyibxpol/rzlgwvbubg6FZHBN18=
X-Received: by 2002:a2e:2b85:: with SMTP id r5-v6mr5637366ljr.91.1542365546522;
 Fri, 16 Nov 2018 02:52:26 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com>
 <CAHmQWvA7fyCFz-qE2_B1SHH+29gns5m_tccLSwF_GTs52LV9Lw@mail.gmail.com> <CAFEAcA8601qTOVRJiMpe84w62ObpzvM-jeq5hLxhs9OFTvCskQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8601qTOVRJiMpe84w62ObpzvM-jeq5hLxhs9OFTvCskQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 16 Nov 2018 18:52:15 +0800
Message-ID: <CAHmQWvBjPR6498BZL1_BUiCtYFL-4cudixWHMf0_nUq1Upj_+A@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: /8DmOwH29l4S

On Fri, 16 Nov 2018 at 17:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On 16 November 2018 at 08:23, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > Well, for the SMP booting, when GICv2 used, there is no problem, max
> > CPU number 8 can be booted, including all the three cases: kernel
> > only, UEFI+kernel and ATF+UEFI+kernel.
> >
> > But when GICv3 used, these two cases still work: kernel only, and
> > UEFI+kernel, but ATF+UEFI+kernel fails booting more than 4 cores with
> > GICv3.
> > The original ATF didn't support GICv3, so I added the support:
> > http://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=sbsa_gicv3
> >
> > Root cause of failing to boot more than 4 cores with ATF+UEFI+kernel
> > with my GICv3 enabled is due to this:
> > In QEMU, we have this defination
> > #define ARM_DEFAULT_CPUS_PER_CLUSTER 8
> > But in ATF, the defination is
> > #define PLATFORM_MAX_CPUS_PER_CLUSTER 4
> > So when we pass smp=6 for example, QEMU generates MPIDR showing all
> > the 6 cores are at cluster 0, but when ATF parses such MPIDR, the
> > function plat_core_pos_by_mpidr() in plat/qemu/topology.c returns
> > error since there should be no more cores than 4.
> >
> > I think we should change the definition in QEMU to 4, instead of
> > changing the ATF's, because I checked Cortext a57/a72/a73/a75 spec, it
> > says there are 4 cores max at one cluster.
>
> Architecturally 8 per cluster is entirely legal. This is
> an ATF limitation and there's an argument for fixing it there.
> However, since for this board we're trying to match what real
> hardware with these CPUs would look like, it does make sense
> to use the same number of CPUs per cluster as the hardware.
> If you want your board to instantiate 4 per cluster this is possible,
> and you don't need to change ARM_DEFAULT_CPUS_PER_CLUSTER.
> This value is only used if the board code does not set the
> cpu->mp_affinity value itself (it is the default, as the
> name suggests). So you can just make your board code set
> the mp_affinity up however you like, after the CPU object
> is created but before it is realized.
>
Get it, thanks.

> thanks
> -- PMM
