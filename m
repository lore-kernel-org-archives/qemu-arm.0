Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1466651lfk;
        Mon, 5 Jul 2021 11:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKhrML2uL0XZ+KuJ4n4YIEgY56WZJTqEuvHPSYHM8uD9mAHu46rd9Xbd+Om7RgBZ4bg/ss
X-Received: by 2002:a5e:a70e:: with SMTP id b14mr12541414iod.194.1625511570002;
        Mon, 05 Jul 2021 11:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625511569; cv=none;
        d=google.com; s=arc-20160816;
        b=tFfYzRodm5fX9q4aeuy2aSwNDslxU5hPRlfJYgoKDY2MM8OSfZXquRbhCF1khkO0/w
         N66SGUKr9caWIRF6zkP06rdKbBfVORSYL/jGP3G67RgkQwjWqOqSoWTrhepVfhFKWgjF
         bgYjMhcYCZs9hCxInymNmMEVceLScJ2ii++yOLNviFXfzhBVfMOcoCvh/rXN32uy7bl1
         0cFck47ONENFWc4Gohl6qJt9RX2Z2GFP3cWPIxE/NpoRcUHGmVF+sMD4LE/LTzCLoeLo
         0diiDRxBnEW3FzOEbYPIzqTUhASrMmuaUNRNnP2eFYJQyKdeDjjD1HWw4ZE0Nl3+IWdV
         pReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cacRlNpMicAiVr7jihNhSfqcJbPgUQl99Kfl1OiWAsI=;
        b=ywIu+mImItEWfdX/6pqux14wu5jWTDVCJZkEQAob6hVamAaEo9jTuC56fiPcd4WUp8
         G+PVs6VU+Ice6S9GvhuSt7G2+G+MO3fjYpcgBoRVlv9HrvFs06dgAuA+qG15b+zaDDOk
         3QZ9hL6DO7mDjUh0t2kAvaAOt+lclgCnXYV5PDc+SCw1GnNPGS5WjQSHpITiSMvphUmF
         r2bbllqoq/GFIR8U1JBQxKcAnjfB9nIVhWfQsrvusu+1//ys7zMuv+I1/nvOTUVUgI/J
         xWniziAf/QczqwS81CGiWO5Ju+dMZu3gY8Ikq0U2SWXTGn5Rbqs5AluBuVAjiwKaY6rJ
         lpPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rducqz2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si14290400ilq.115.2021.07.05.11.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 11:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rducqz2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0ToX-0007HE-B5
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 14:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ToO-0007F0-BY
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 14:59:20 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ToM-0007I9-4c
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 14:59:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id v20so30251333eji.10
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cacRlNpMicAiVr7jihNhSfqcJbPgUQl99Kfl1OiWAsI=;
 b=Rducqz2jFKrr2l5HI8PxE5urFDYodn5R0Kpk33Eh/vlw/Egs6ecpqKMaSNrDDXeejM
 olEQMUh+dkkGsQemqVKJ38PrA5VqDpvMEXSFUjcD+3OXoUDwM1eA6jgkeerjJ9+1uMvV
 XCI3wK+pCJLs3j37pFA5hGZLoivqoIW9ZeN/KfFo0zfKGxX/VrkYXOwsBtsuMoyMPbrO
 +Mvw2WUQKulNfREFsT3dNZ1gE7bNn9oytu5JJTOk/aT7qnrwWF09FiEqCIBKg7wa4Qm2
 /b7k+0k5fZ2JO9G2O1Tutm2AtOMszAOFIgpR7641bgnODlkRbm1zxfRaQPIwH1dU9OoZ
 vfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cacRlNpMicAiVr7jihNhSfqcJbPgUQl99Kfl1OiWAsI=;
 b=kZQ+63nVJ8nOyCzqo8LtcASfO8Ivag0A/R6EslZ6oZjYIPaF2OpSdZOcMnawbpREin
 DCWHS4roqFGflLDd1p/hJafBHnwtLlCEvxVZaB9JNXkM0Jjz6oCs3Ai4XcKbp705GaAz
 qW/jMnp10ojBXIXzyzm+Wcja60nmzjV2zW/q73bLwdY0Z/vgXm+ECV54Fv5FXxArnHET
 v6cHov+ZMmb5nUD2l5t/TJDjYeTR3Gilx4MZ19MUtWvtgn2yDewgker42rtxbWHH/1zt
 XS+BnFt32iWa0BhcGh2lqbdpKV4c5qEvF4OSS021zRvZcPPmLSYQ3+rrSPba2ncE7Ffi
 ODvg==
X-Gm-Message-State: AOAM5303wXA1AfnFfdic13k72Ps30xWym2iwFPURKYtfJH+mVXqLE4QV
 cM7yRcOlRcuOjKny87Nt+94v0NrVnMjqWpBQ2xUJFQ==
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr3306376ejc.56.1625511555904; 
 Mon, 05 Jul 2021 11:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
 <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
 <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
In-Reply-To: <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 19:58:37 +0100
Message-ID: <CAFEAcA_s+8DGZ0pJ2pj4-BT2W07UXGUEGcWjTSYk9DRdgX6rEg@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: byM9rRM9s6iB

On Mon, 5 Jul 2021 at 18:04, <shashi.mallela@linaro.org> wrote:
>
> On Mon, 2021-07-05 at 17:25 +0100, Peter Maydell wrote:
> > On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
> > > On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > > > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > > > shashi.mallela@linaro.org> wrote:
> > > > > Added register definitions relevant to ITS,implemented overall
> > > > > ITS device framework with stubs for ITS control and translater
> > > > > regions read/write,extended ITS common to handle mmio init
> > > > > between
> > > > > existing kvm device and newer qemu device.
> > > > >
> > > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > > +static void gicv3_arm_its_realize(DeviceState *dev, Error
> > > > > **errp)
> > > > > +{
> > > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > > +
> > > > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > > > &gicv3_its_translation_ops);
> > > > > +
> > > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > >
> > > > Can you remind me why we make this check, please? When would we
> > > > have created an ITS device but not have a GICv3 with LPI support?
> > > This check applies to GIC's physical LPI support only as against
> > > GIC's
> > > virtual LPI support.
> >
> > Right, but when would we have a GIC with no physical LPI support
> > but an ITS is present ?
> If we only support Direct injection of virtual interrupts (which can
> have their own vPEID and the vPE table),then the ITS present could havejust virtual LPI support

This patchset does not support a virtual-LPI-only ITS, though:
it doesn't support virtual LPIs at all.
If you use it with CPUs without physical LPI support , this code will skip
entirely setting GITS_TYPER and will make reset do nothing, and then the
rest of the ITS implementation will misbehave.

I think what we should do is:
 * in realize, check every CPU to make sure its redistributor
   supports physical LPIs, and return an error from realize if not
 * in reset, don't check anything

If we add virtual-LPI-only ITS support later, we can always update
this code appropriately.

thanks
-- PMM
