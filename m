Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1369871lfk;
        Mon, 5 Jul 2021 09:26:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySirV+aGL93tGHf3viWEZSu7l6E4+z0gSK679mTTYx7kj+dLd87WOJJpva+Jchi30B5JYg
X-Received: by 2002:a05:6402:2068:: with SMTP id bd8mr11178356edb.143.1625502390171;
        Mon, 05 Jul 2021 09:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625502390; cv=none;
        d=google.com; s=arc-20160816;
        b=f7EkyVpiQ5T6mdVFwA2vRLqp/IVY6+uehVlzcyLRgGzvJpV1hvXpbntGC8Q6uIPbIf
         j5GzJ/x+oHArUV+GH+B0iedTaXEG/Bq+uPrvdyFkj3NES+oTsCVFQskCR1Ty6dU+Njap
         M2/AA2UUv4diXhLwYZPSW7jkK2dNBN2LD+6KySTqdAInEQLcJU7t0eymeEIWqH9uPrf+
         71dGrb0FGPHz4osThJZQAYuTK5BYMh3/1rwhLHJP1xg1JyLzmKESS22HzJhJbX9ZE6Wh
         W7qM/Oyg/nfViZSm/TlLNAEveDkcnu5AO8BQtn6Tx4XLwIn35VP5U00OyWxIAX2Nw367
         jkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xKqu47CKqwIqE8rX8QIYIgYDfyVbGFuzR4kKF3m9FwI=;
        b=EZgtiFkG0In0kAbATVymARCBnV2N+0vDKTKEiLJr9wOjV56ig1QqHInztsb0vsSnLm
         ErhOaaQqjq+9ZiKm9aNGr7EeAZwDIL58oQ1OM4szVF/RtZLUzVXXSLMbrpXpTR6gZRnR
         S2U31hZsrX9dlWyAy8/UK9wYCpFp0xycGA+MFM0VpUCf5R0TJGqY0/ZKsWMjGJVYL+sf
         CtWvs1WYt4/X7QhEbCRE2+JAN6H8DlnSR1FKDRbf+hNgDpjU+DeSDR4omDkyAtGkVxhk
         p/owceWH+hhmrZHc8SAEvAI5CL0gzGQgJjvoMQF1dKXzJ08Lx0oXTKEonKyn9CUgpmsU
         L4hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zJEn7itC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si11291259ejm.546.2021.07.05.09.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 09:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zJEn7itC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0RQT-0003M0-8a
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 12:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0RQF-0003L1-Al
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 12:26:15 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0RQB-0001nu-DR
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 12:26:15 -0400
Received: by mail-ej1-x631.google.com with SMTP id gb6so13085325ejc.5
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xKqu47CKqwIqE8rX8QIYIgYDfyVbGFuzR4kKF3m9FwI=;
 b=zJEn7itCGpChb72P8X6JkXIVP4EsYGH/ZouM1MxioeyuHAnpS4HpEGBqULM+BJ4SL4
 fVqaIhZOQgeve/5/j22KKrIBhaRRBaLK92MGe/8KQTWE5dVGI+KkuzwgkiS9ID0/jr5z
 eKnDslf7FjmXzEHhgSKkZvEJxt4mbgOWDtJl7SrxXkSsuEdmsFhtIGjPp8XLr8fotk+4
 ZvWpebbyPmwbQoH5zlNq9ah3JoD3GKMnWl12s0Py9nFMnqb0tfWGjIwy9KPymKpAR4Md
 SbtENMjPgBi/0rcZIgnMVh1s0C5n+WjfD2BmlwC5QMEYZ2xQIFvmXCfmMvEHRq00GEAz
 NV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKqu47CKqwIqE8rX8QIYIgYDfyVbGFuzR4kKF3m9FwI=;
 b=s3NOBMgInn3lMc2g+Oo6t3324JprvYFBGQSAR7WRupHP5hi6y/KG+dsjydEquhzenM
 hAnTAunEnrF/4hw4c7qJZfzqdV6kPTO5lIPgm0c/TmQHh2mTCNzJqjfCOsGwx3d6Vwk4
 SesKBe0o+dxCReeKfJtNlbGIS8UyI9oabYyNzgtGFKc4hLZyYPf0Kt7hzjhMfBAsApjM
 lmjndj60R8RJs/+d/G6fdck9EWvnzGmJooBmg+IqrVDSotpxMVS5sABpnxTKcr4GyC0J
 TYqJfvCrKFxNx0OGOUwJLkkurMcNP3h9LehuRlZ8qaEv5X1nb6maI7oiNfWE6yI2nB/M
 6Saw==
X-Gm-Message-State: AOAM532F8pwp7uOOf//eh9jbVqeL6R4xw0MKMFlvs0AYXuOpfqo/xtyQ
 5C8TcmBWuWhBiemq8T2/sS+K9mjmACNZc6+mp5RArw==
X-Received: by 2002:a17:907:7d91:: with SMTP id
 oz17mr14452591ejc.250.1625502369699; 
 Mon, 05 Jul 2021 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
In-Reply-To: <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 17:25:31 +0100
Message-ID: <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: olFCwJAY7ubj

On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
>
> On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > shashi.mallela@linaro.org> wrote:
> > > Added register definitions relevant to ITS,implemented overall
> > > ITS device framework with stubs for ITS control and translater
> > > regions read/write,extended ITS common to handle mmio init between
> > > existing kvm device and newer qemu device.
> > >
> > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > +
> > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > &gicv3_its_translation_ops);
> > > +
> > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> >
> > Can you remind me why we make this check, please? When would we
> > have created an ITS device but not have a GICv3 with LPI support?
> This check applies to GIC's physical LPI support only as against GIC's
> virtual LPI support.

Right, but when would we have a GIC with no physical LPI support
but an ITS is present ?

thanks
-- PMM
