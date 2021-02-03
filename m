Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp117984lfo;
        Wed, 3 Feb 2021 02:54:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTggfKQDRTXPpeNYM6YHBdB89DI213SbBXEX8/31eULH81rXvuQxkxmV1FEA9iVmnfCL0K
X-Received: by 2002:a25:4c8a:: with SMTP id z132mr3893337yba.350.1612349640671;
        Wed, 03 Feb 2021 02:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612349640; cv=none;
        d=google.com; s=arc-20160816;
        b=gy3LbBRZoGtD9VlVxdpn0YWMpVF58eRa+pH7pgkxsgzRnphaNc2QZ/8FboFC4IPASk
         FT0mo7cVicsEaN7SfNEibNfpkDjFTo0NuTDEGZ84Q7P/3byEY/NwxuD4N1i+5qqj4r4v
         Ux3x1qj1AYztkxHZ2sY7YAT4FtAMD6NhRZbqhE3lkJQ0vx11w3xhYWhENtSKpyJt/i+V
         kHwptMWfbdi1iN94wBbGnNcqwIN5nvevLoDOhaPE4Y8SUehJC5LXHiURnqWRD5RoVsTv
         X/ZcMhy9Pn0P/+9E7gle1iQrvEkLuyOY+ISurqkaFH1Mr1R6RBc2nCxsCT+/nKZv9F7Y
         70tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RZRUhogWzsEZ5Tk8956jY9Z3mL04C9+6EnBRSKg4hb8=;
        b=zuBOwpoSc2LY96J1F9ret8LxpgFRHTEj2oCnwnmVjZznl/9Phkp6I3T982vsYwxZxZ
         d2CFsCt271B/6ZB9/HZfIxsL0nP8vUKg0y8RSqL2uYQwyfPooYRk9U4VTR6cl0pgbHGi
         aeR7LpabXd5NoW3uPWpwy+wLZobZZUDioiHM+1l1Y/4Rs8uG4S1WVCwbsggybDVTgo+V
         ADpe4TCeMivLqmCjKzqh2bFIH5MJZZtAz3teB43qdvK/rCslNPCfpUN5fuuGm33JAqab
         9EXFQWbZA0+ExFWUBQHEWHZh+pvA/n7gfjkBQz2535HW22YSZJiJOvnkeztE38pAunGu
         ZjIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ILozTcJT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si1996287ybz.303.2021.02.03.02.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 02:54:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ILozTcJT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7FnM-00050H-2A
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 05:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Fmc-0004Vu-AR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:53:14 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Fma-0002xq-Gq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:53:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sa23so18637666ejb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RZRUhogWzsEZ5Tk8956jY9Z3mL04C9+6EnBRSKg4hb8=;
 b=ILozTcJT63j6Ebse/4ovbmwc57MdZechSiVT/gB2z4X3TBwVRbHU3f41kWWAzrsl1W
 IO2dnIAs6MtiYl/FyeL9fmvhMv6Z7OQp6EusCOYAkO9qbSvmX7N5wP91khEfy9V88j6h
 iFMDXvSCoPl6qVxsklgvbUnacRqAENS42onBYdw4UBr6ixgZw0P5OXqFVCl9S8gMFpY6
 DyRwgFkrBZkQUJp0obM8KYVkP05U3ATBzfIb4XgCu8Cw9thRRfr+Sr96Jm7g6BcHqWd0
 eNsQALChZPLohIAV8FYXzxbbvVPsMzitHGX2r8BFFivwXFaWPCt5t4rs/ZdHQyCm2FbC
 LkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RZRUhogWzsEZ5Tk8956jY9Z3mL04C9+6EnBRSKg4hb8=;
 b=NDsdrZtIUuKFl2VGGpD4lODOBR550SKo6gctEzFILzUGQC/cUowBE6fmhR5fnXVU8S
 tZoOCSzH0VUEUVmetSiNgoPW4p8mH8q55KMSthWDWiIxrqRrZh1eUPTTbo3JmoIeneSr
 A+R3eHpODSCGBXBo4jASLBXJvH7cUHyjnszMh5jme7T5cY6XMZ4NP1NVaGLTM6GDo76I
 +V6BHz/oGg8HPSzw3hrmFB2DOgHprFtYtavLnTIj9cjx6b8DVbmVyNl3FgAkFdncD4us
 BWAn3Ib9K9GFhW0QRYoVRtEV2MHW1KfycHL6r4qkJ20JmiyXbGmgNczL+MqlJLTVM0++
 DiZA==
X-Gm-Message-State: AOAM530lscRTxzM74pDEFvafzSAt8XCy2djmK1QBGv36Y1DsQuK6N3kY
 DCnrZOoAJ7nA5DKJ6CtXGhk7rbGMqxobU7gV5kU5jQ==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr2574334eji.407.1612349590889; 
 Wed, 03 Feb 2021 02:53:10 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
In-Reply-To: <20210203104920.GE2950@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 10:52:59 +0000
Message-ID: <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ylKa6GgJzrC2

On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> w=
rote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.co=
m> wrote:
> > >
> > > * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> > > > Cc'ing migration team and qemu-arm@ list.
> > >
> > > I'll have to leave the detail of that to the ARM peole; but from a
> > > migration point of view I think we do want the 64 bit ARM migrations =
to
> > > be stable now.  Please tie incompatible changes to machine types.
> >
> > That is the intention, but because there's no upstream testing
> > of migration compat, we never notice if we get it wrong.
> > What is x86 doing to keep cross-version migration working ?
>
> I know there used to be some of our team running Avocado tests for
> compatibility regularly, I'm not sure of the current status.
> It's something we also do regularly around when we do downstream
> releases, so we tend to catch them then, although even on x86 that
> often turns out to be a bit late.

So downstream testing only? I think that unless we either (a) start
doing migration-compat testing consistently upstream or (b) RedHat or
some other downstream start testing and reporting compat issues
to us for aarch64 as they do for x86-64, in practice we're just
not going to have working migration compat despite our best
intentions. (None of the issues Aaron raises were deliberate
compat breaks -- they're all "we made a change we didn't think
affected migration but it turns out that it does".)

thanks
-- PMM
