Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6400933lfp;
        Tue, 18 Feb 2020 10:26:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJoWtjWA0gjn2NNxJoeKlkXKwnhwnlILl6+S11R32/YRfV6uKASTx8m1hiMR7O4usnJtOG
X-Received: by 2002:a05:6214:176e:: with SMTP id et14mr17257242qvb.133.1582050370274;
        Tue, 18 Feb 2020 10:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582050370; cv=none;
        d=google.com; s=arc-20160816;
        b=macntZi3Ir1lYtKt+GbxLsGyiIgN9T53MS6767kRLlSjw44dslSEgGNlHLCq/Ws9ua
         nuYSCsUJhSbgnGLIclYLWFQxsuovCHgQf1HwsbygoiCnsYWRPIcyztrWh+P/lmkC37Tg
         ePgmZIxwqHkxPt4fzNYrBzlgY1S8Wn0RwK6a+8ZiQui3/KfxP7jvRQaArGVaHnFQoTzQ
         7yo4NjjB6+s9JKIMKml57uz4UmnAtNIjpAeFpCb0UP4zVkJoNLr5FvLYfZgn+GfpCKc9
         88UI6/D749ACDnCGPNnFstXXUXmFLVyTT3p4vpAcVl7LM0p9cH7cQqd4YtQQSbCIW3HP
         aUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcvSQoAsUL9C5Aq1ofm643zj+vq9wM/Vam8GdBtyzPM=;
        b=UAJY3wvnwu/IrxcdZ2cSxDO2HXA/Mc/Z7yBmx+fVr3Y4xHyrQYd0RxTs4Xp5PH8YyZ
         QNJqAle0PkRdPAbDi736cRBBFaGgleHvwNGueVfWSgxCv6JV26s5k/+/uzenJdUzbNWg
         PYTLl3hqxw9cCeBg2m7evbQ2y74Z2KlKzHzLy7ZUJQNwXszBTii/bWr1NPffthLQOAPD
         ESFqTsKE/LIZI0Rq7Oh8m7JcE4gBXQXeFS3hr8y60Or1A93foVdys5UCT/2ePK1J5njP
         NA2GwbfhKqApPhlcY1+dr7xianBYZe/hcCs3Y8beyZflz1l/qzAQ0l8UuNsAUMxO6yb0
         rLgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=syrsSzcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j194si2341334qke.294.2020.02.18.10.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 10:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=syrsSzcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j47ZR-0005SH-Om
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 13:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j47ZI-0005S1-Qd
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j47ZH-0000hF-CE
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:26:00 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j47ZG-0000fb-5M
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:25:59 -0500
Received: by mail-ot1-x344.google.com with SMTP id w23so4055914otj.4
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 10:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dcvSQoAsUL9C5Aq1ofm643zj+vq9wM/Vam8GdBtyzPM=;
 b=syrsSzcQKVlBcC4d1Rcsd5/4t0RaqvNT83RQbH0e9qu3biyh4kETK5t9dacw9Ja9yZ
 POl3cMCdmEQb1aN9pMIW2ydt6WPgnA/Lkir/9kPIuGyjch80ZwnIfIXBxS1LOgGGfRgc
 SgNRUsUKZ8EcmYzidpP2h6frvqaS5rnBFDZuxs8bKciLmWbERaht8LLVIRJOvpGsZaMn
 Jod+f4SRzQceLm/np5nDjIodtiGaIyqn9bd2OaSa4KvIxWt5L7BVI+oYyoCyjPz2dQpY
 z3MKisFrgsV0UYsAafJ8FpDPk+yfizX89nOFtGmLM3d1YK7sKzYultaoCWSOfYzbErn4
 bDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dcvSQoAsUL9C5Aq1ofm643zj+vq9wM/Vam8GdBtyzPM=;
 b=rFxjoXtcmdCDALTPTGEdjuMAhD6U3oCEDWQqxwD62xk9g33ru6SFES9eVcl0vwvpks
 4X5SRA1K2dbd3fZf/gfxEkqmSxtw0RZyQNBcB36VTmEnK1FYrRzpNObHAxlgHEfCqliN
 AeX2CNmnoeo4sxfn1lqwT2yn4mAOInBzD+ZIBPC5fmJ+p/0JQ2bGIY7+b6xFNsCDKEWD
 x2tKk2gGPNf9YS+ueXG7RktwlB73hGfvJQKbfMy2lcSPr7tjwW3Tb0Buig/tdlFcmGES
 pKLHS6DBS+HJJWZBjCkKzgzgYy9u80cMLI7lug4p1XcYzOyTtDkqEPFqOoyWxGkzOeB4
 ZCAg==
X-Gm-Message-State: APjAAAUh5YfQ3mkafTqaBUKln1gkmflGL9MhckuvTDdDzwfcz5+sxHkF
 z2ukDbcVM3kSmXJ1yzA4+AuJbUA3rMHIzOfTWMJ0iw==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr15663627otq.97.1582050357188; 
 Tue, 18 Feb 2020 10:25:57 -0800 (PST)
MIME-Version: 1.0
References: <1581686212-9625-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1581686212-9625-3-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA9Bs9VuZNstbpF6Q2=MhVDN_HHMnUdwfOJSf7Qm9to2nw@mail.gmail.com>
In-Reply-To: <CAFEAcA9Bs9VuZNstbpF6Q2=MhVDN_HHMnUdwfOJSf7Qm9to2nw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 18:25:46 +0000
Message-ID: <CAFEAcA88+k9nhpCsb38qaf3KnrfVKhp_2eVFToGqO+eLGTE7rQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] cpu/a9mpcore: Add num priority bits property
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9FEwivebVs4L

On Tue, 18 Feb 2020 at 18:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 14 Feb 2020 at 13:21, Sai Pavan Boddu
> <sai.pavan.boddu@xilinx.com> wrote:
> >
> > Set number of priority bits property of gic as guided by machine
> > configuration.
> >
> > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> > ---
> >  hw/cpu/a9mpcore.c         | 2 ++
> >  include/hw/cpu/a9mpcore.h | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
> > index 1f8bc8a..eb1e752 100644
> > --- a/hw/cpu/a9mpcore.c
> > +++ b/hw/cpu/a9mpcore.c
> > @@ -68,6 +68,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
> >      gicdev = DEVICE(&s->gic);
> >      qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
> >      qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
> > +    qdev_prop_set_uint32(gicdev, "num-prio-bits", s->n_prio_bits);
> >
> >      /* Make the GIC's TZ support match the CPUs. We assume that
> >       * either all the CPUs have TZ, or none do.
> > @@ -167,6 +168,7 @@ static Property a9mp_priv_properties[] = {
> >       * Other boards may differ and should set this property appropriately.
> >       */
> >      DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 96),
> > +    DEFINE_PROP_UINT32("num-priority-bits", A9MPPrivState, n_prio_bits, 8),
> >      DEFINE_PROP_END_OF_LIST(),
>
> You should be able to just directly pass through the property
> from the GIC object by calling
>     object_property_add_alias(obj, "num-priority-bits", OBJECT(&s->gic),
>                               "num-priority-bits", &error_abort);
> at the end of a9mp_priv_initfn().

On second thoughts, and having checked the manual:

All A9 CPUs have a GIC with 5 bits of priority. So we should
just set the num-priority-bits on the GIC object in a9mpcore.c,
and not expose it as a property of this container device.

That will be a behaviour change for:
 - exynos4210 boards
 - fsl-imx6 boards
 - highbank
 - realview
 - vexpress
as well as xilinx, but it is a bug fix, and I have enough test
images for those to check it doesn't completely break them.
So we should just go ahead and implement them correctly.

Similarly, the 11MPCore GIC always has 4 bits of priority,
so we could get the behaviour right for the 'realview-eb-mpcore'
board too.

thanks
-- PMM
