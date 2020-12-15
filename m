Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3665884lfq;
        Tue, 15 Dec 2020 08:49:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTUNOICBh6CCmM4+cKSl5twdQPqmxFXZVLXMxzPo5yy+/M23OwjVeABdfPiMqtWQqTU6X0
X-Received: by 2002:a25:73c3:: with SMTP id o186mr39713718ybc.182.1608050960563;
        Tue, 15 Dec 2020 08:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608050960; cv=none;
        d=google.com; s=arc-20160816;
        b=DhVL+nN2KLMP7gDT4Cy4zGTGt1bbVZV2PXSGfrI8EDkwzlGIWX2wudVV/SOj5vn52g
         aoEAJ0naKKiRb2+Q+VVYYrS6SLPp6QMnigiVkM7b/ZPHDtX/Z64yLWDCTBwDPHnDKqhR
         wYJzfp46oemw81hOvDvC5wVUvPGmOQ3+xE3hAfeM4L/tefoJ5Dx9ozcNJ2tCpMRTvsxY
         Xse56rGkNJu5yJfq/AY7utxp1pgXXFF36vIJds6fssmMTxcW2GDuJxox2MA7hBlRjrfC
         cHgb0iNjIMx4o6gSODfXnpxBsMqXJDXheVrskMB63m/bZF2GjB+wcRPHAPE5iGdRdqTe
         Np4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=WNNqnZnfqs8OvXv038kS/0J0X5bejNls4QjbquwZHlA=;
        b=qCRm8AoFvO7+cT/vbpQGpXkbFQiJygX1PJcpilDbOcXHeiTcHOv9Bx8k4cExrYMlmg
         yvB9JeM2sYcqkwa+/ZMtYFc7cJMzMC5GW8201nUImcYsnCqAtuH9f55DqvOg6AcKagGJ
         UHzA8d0rSG4Q6EyTKZ3P/3tnizEpHFVMukAGvAeH81ursDGdpROcWA84sRdwwEMfvpLb
         0vW7ww0J+EdeYGAUgWCkxzKxnqYBG6vQRliaXM7LpvEfdNH4W31YkyPH6krlP4wfQ7aQ
         9NahQx+pJ8ezK+oTn9tXjX5BkhFuyaKlnf9Bx/vKHWp/ku7LJR6MD5iUhAQhJakI3Kzs
         JHfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=I7IWYCCY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si20692887yby.158.2020.12.15.08.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 08:49:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=I7IWYCCY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpDVn-0000i2-U1
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 11:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kpDVf-0000hk-4f
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 11:49:11 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kpDVc-00073H-TP
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 11:49:10 -0500
Received: by mail-wm1-x343.google.com with SMTP id y23so19183595wmi.1
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 08:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WNNqnZnfqs8OvXv038kS/0J0X5bejNls4QjbquwZHlA=;
 b=I7IWYCCYZfh+7FB6mMuFVur1b2+4bpEu2QGhHUhEYGivOIqc7O3SqMXJilBvpNWAXI
 Lh73IttAsWIkeDOQjp8k9A998IiCCOR+j67K0l/cn9rOkWqz0zngHd8bEXeXAHgD7PO0
 UBsdpoiTpx9jAFnexpHl86Lkf+eLeDPyAb4w8P5nmjtxnfdVhqkl/GM5Oxyx24TWeodh
 NuyfSRp/N3NqjCDyiToyCJL3AyGMqOs5XgQmp6CiZtLMN68xRgdHPg14MHognvZX01ez
 IPdl3YDKfDFm49Df7GBqdDVlLSFVZofOrDwPNAipiqhSGuZos5AHFrr5PlzIpp9bF/S+
 gn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WNNqnZnfqs8OvXv038kS/0J0X5bejNls4QjbquwZHlA=;
 b=b9JZV4L1vJHnplH4cSW0W+HZhONO/HT0hk1cYBF9TyrB3BNOrtKobmv6ksIZ8aKtrZ
 XgcFaUXyVMUDeZWwo2LKiBXMMNgBHbcUJIs+gaM5s1IVsKFSyqoc6dqaqZ1OXSOOi6Jc
 NC4sA40X2h4NoTRW/YLYizMJV5n0/f/+nnc9fOj685+N2xKcUOCZmkqyQnEl6JAMwVzo
 3bK9Q8V1/H/KJ4h3NaB/+NDRwZhgUl077fpZnCh3O60/2CadT8KWp2+MGul1wxwOVlUI
 PG1z3DbRK7cXlHveN0n9UDKMrb68hO0av063NorOcHBrC36NkYqdjYUZ2yGtbETMGDvL
 1JGw==
X-Gm-Message-State: AOAM530hGrVvICwGj5ZsKuY/MTTvwoEfCn4vB784fv+IuNodMoxovMle
 OWoAC7Zhv+g/oU9MqGiQvIBdvQ==
X-Received: by 2002:a1c:a9c8:: with SMTP id s191mr4883546wme.89.1608050947008; 
 Tue, 15 Dec 2020 08:49:07 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id i8sm37133779wma.32.2020.12.15.08.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:49:06 -0800 (PST)
Date: Tue, 15 Dec 2020 16:49:04 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201215164904.GY1664@vanye>
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1GhbNjS18mxP

On Tue, Dec 15, 2020 at 13:23:58 +0100, Laurent Desnogues wrote:
> Hello,
> 
> On Tue, Dec 15, 2020 at 12:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >  target/arm/cpu.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index fadd1a47df..90ba707b64 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
> >  /*
> >   * System register ID fields.
> >   */
> > +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> > +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> > +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> > +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> > +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> > +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> > +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> > +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> > +FIELD(CLIDR_EL1, LOC, 24, 3)
> > +FIELD(CLIDR_EL1, LOUU, 27, 3)
> > +FIELD(CLIDR_EL1, ICB, 30, 3)
> > +
> > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
> > +FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
> 
> The positions and sizes of the ASSOCIATIVITY and NUMSETS CCSIDR fields
> depend on whether the ARMv8.3-CCIDX extension is implemented or not.
> If we really want to define the fields this way, we perhaps should
> define two sets.  Or at the very least, add a comment stating this
> definition is for ARMv8.3-CCIDX.

Urgh, sorry for this.
I added the fields only to make the CPU definition more readable, so I
think we don't need to worry about runtime handling of this?
But I don't think it makes sense to add only the one form.
Should I use CCIDX_CCSIDR_EL1 for these ones and add

/* When FEAT_CCIDX is not implemented */
FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
FIELD(CCSIDR_EL1, NUMSETS, 13, 15)

with a comment that
/* When FEAT_CCIDX is implemented */
for the former set
?

> > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > +FIELD(CTR_EL0,  ERG, 20, 4)
> > +FIELD(CTR_EL0,  CWG, 24, 4)
> > +FIELD(CTR_EL0,  IDC, 28, 1)
> > +FIELD(CTR_EL0,  DIC, 29, 1)
> 
> There's a missing field:  TminLine which starts at bit 32.

Ack, oops.

> If
> implemented, that would require to make ctr a 64-bit integer.

As far as I can tell, this will be safe with existing code - should I
fold in a patch extending the register?

Regards,

Leif

> Thanks,
> 
> Laurent
> 
> > +
> >  FIELD(MIDR_EL1, REVISION, 0, 4)
> >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> > --
> > 2.20.1
> >
> >
