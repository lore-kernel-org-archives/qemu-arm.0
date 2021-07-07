Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2687533lfk;
        Tue, 6 Jul 2021 19:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbXImqu4lCT6A/AZbsGZYsriH97qrv0Vfq0tSgkZ8lg9x/qgvVBgcVdWzuKNI4D9ld6hbg
X-Received: by 2002:ab0:48d1:: with SMTP id y17mr19827357uac.96.1625623866229;
        Tue, 06 Jul 2021 19:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625623866; cv=none;
        d=google.com; s=arc-20160816;
        b=jQ7X0/BXgEIlpCJCBKfTV2+hfrQ9yS2FSc1tiFb2RdsrAUH6SUTLKPFNPz9G5IvVgT
         CTkK6VZv6yjrScA0Rf+CJNuHA2S1MosuAgS/iLOOPjkilTlYkLbJphZMkmdiFMC6XUyO
         OzRNugOYJ0MFb8hGrl6629+FtD9vTEF+siMCst+6as0HMhRt+fPalLBK2Cr860lQEa4M
         3Ce2W2PmjZftjtMzhdTqDW5g1ZlBV1KU5KNlnH5d1nXAFJBcYN5yIohdnI5vhFztwTIO
         63OZDpyuqsdXsoTUFYIF+XK1Jfys8pz+ltxiHH2dVt9NpNbOvnMR4eX1hU/P7WBb4COn
         vlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=LXvQ0SaPTMV5jCaR3hdFzAiZekRi5YGsoyJErSSd5mw=;
        b=LHIbPgn8DQCh8KnnvSKpPcZkfzwDchUebvxWu/pw6IxqhkHfM0sd2wc13B/sogV/+j
         KhAHCjt6RDOLBG1bowy0FO40hp4TMRgD/rX0FgYthLfNwd0CY6TIvshi0NStkpCTwC+z
         yVzhFJpR5NJziSV+0HTWXBQrb6PbAtu2odMtBBbsbKB09vk94ptIl5KVGJB0jXNwS+gF
         RCeotIrvNCCZaKS2E64wpWqycV9TIPboBKZxuY0Z+u7sXxgtzRTr+PNXfQwSRTM6r6Ky
         AycICxsw3dtVkVOoEZjmaQLLkUF/TyTmUceCAig4q91OFNPEYKAANJuO7GDx/EiVxaUZ
         i68A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SA25Sj7P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay33si2335811uab.242.2021.07.06.19.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SA25Sj7P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0x1l-0006J0-Dk
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wzo-0004HZ-RP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:09:04 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:37741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wzl-0000es-JM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:09:04 -0400
Received: by mail-qk1-x72e.google.com with SMTP id a6so466887qka.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXvQ0SaPTMV5jCaR3hdFzAiZekRi5YGsoyJErSSd5mw=;
 b=SA25Sj7P2HxoY6gNUzt6dnKfstQ3UONtrkVASNnsGNgo/HMMHj/JMAziVATJ/RfLrK
 qbCTuNh8N1LgMPK+Q4Jdy7Jogxvc2LV1CsEv65Ob4ueW9umCCBJD/H8dGcCkv1PHJ+P0
 wz0BrizZhqc34ke211+a+FWOZBBtc8kEkjodvNq//wAHjL/D00/6w2f9xG6/EXWNQm8o
 U4z/Py+glHD0+AHaFMgbj256EakSA8n7S+MbY72K7XU2kDwmXuHiA7iX3PfCZJiTK+Dk
 +t94Bsz2+cQsfQFmf3mSzQAroMfpllgQuczWm2+HNjoN/qIQucMjKjNqj9JIvcBBqSeO
 jjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXvQ0SaPTMV5jCaR3hdFzAiZekRi5YGsoyJErSSd5mw=;
 b=FzED/4kN9loAZWB3wfnBRsGPoN/ksEFAYf2WcqDQkvHV1fuzLobbFVxjcbzAMuenFz
 NbMMHicFnaTLZNU5lWSAn6gXI7Kt36IaE3BjXoKZC5ENuppCPNYpC7E7ZsBVunZaEOZ4
 f5gNDa7nmq1XUp99X1De847CiIlBKHixQx6+ni05mDDAJ6JcL2zOp4jamS76WqUsoN4o
 HMD2s7jPy/3Km7K6zfljfRYjik8icIBP2Kl8SrGXvV9DY7aNTSw43xtU2J4oOXmJCnh6
 F+LG3rQReYW1lZcQOYqmtzaEv7RqqHM0gx9SqtDVoph9qfP/Ju5/2CMTLuNCSwvKgnUI
 1WeA==
X-Gm-Message-State: AOAM532pPJfcnQE1zuPboEJHwSrJmBh6v4a45ncUSJJFP7kXyLXemYZe
 RxHsTWD11OUSk2b24wbaKMno5g==
X-Received: by 2002:a05:620a:988:: with SMTP id
 x8mr5426637qkx.97.1625623740820; 
 Tue, 06 Jul 2021 19:09:00 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id z6sm7758851qke.24.2021.07.06.19.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:09:00 -0700 (PDT)
Message-ID: <cce17ddb37749aa8528e1d7f01a1bfda19053b16.camel@linaro.org>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 06 Jul 2021 22:08:59 -0400
In-Reply-To: <CAFEAcA_s+8DGZ0pJ2pj4-BT2W07UXGUEGcWjTSYk9DRdgX6rEg@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
 <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
 <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
 <CAFEAcA_s+8DGZ0pJ2pj4-BT2W07UXGUEGcWjTSYk9DRdgX6rEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56+g2wPez2hG

On Mon, 2021-07-05 at 19:58 +0100, Peter Maydell wrote:
> On Mon, 5 Jul 2021 at 18:04, <shashi.mallela@linaro.org> wrote:
> > On Mon, 2021-07-05 at 17:25 +0100, Peter Maydell wrote:
> > > On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
> > > > On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > > > > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > > > > shashi.mallela@linaro.org> wrote:
> > > > > > Added register definitions relevant to ITS,implemented
> > > > > > overall
> > > > > > ITS device framework with stubs for ITS control and
> > > > > > translater
> > > > > > regions read/write,extended ITS common to handle mmio init
> > > > > > between
> > > > > > existing kvm device and newer qemu device.
> > > > > > 
> > > > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > > > +static void gicv3_arm_its_realize(DeviceState *dev, Error
> > > > > > **errp)
> > > > > > +{
> > > > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > > > +
> > > > > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > > > > &gicv3_its_translation_ops);
> > > > > > +
> > > > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > > > 
> > > > > Can you remind me why we make this check, please? When would
> > > > > we
> > > > > have created an ITS device but not have a GICv3 with LPI
> > > > > support?
> > > > This check applies to GIC's physical LPI support only as
> > > > against
> > > > GIC's
> > > > virtual LPI support.
> > > 
> > > Right, but when would we have a GIC with no physical LPI support
> > > but an ITS is present ?
> > If we only support Direct injection of virtual interrupts (which
> > can
> > have their own vPEID and the vPE table),then the ITS present could
> > havejust virtual LPI support
> 
> This patchset does not support a virtual-LPI-only ITS, though:
> it doesn't support virtual LPIs at all.
> If you use it with CPUs without physical LPI support , this code will
> skip
> entirely setting GITS_TYPER and will make reset do nothing, and then
> the
> rest of the ITS implementation will misbehave.
> 
> I think what we should do is:
>  * in realize, check every CPU to make sure its redistributor
>    supports physical LPIs, and return an error from realize if not
>  * in reset, don't check anything
Done
> 
> If we add virtual-LPI-only ITS support later, we can always update
> this code appropriately.
> 
> thanks
> -- PMM

