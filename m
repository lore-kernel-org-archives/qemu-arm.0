Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp564906wrt;
        Wed, 20 Mar 2019 03:46:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwo/R5ZYHKCgPS1oq8INf8K+OYZncn1kbrZ8NC2tQw2Iao/ZdCeNbj8VIn5QTq591KWIown
X-Received: by 2002:a1c:7a1a:: with SMTP id v26mr7404333wmc.129.1553078809530;
        Wed, 20 Mar 2019 03:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553078809; cv=none;
        d=google.com; s=arc-20160816;
        b=PUWuv3pl4694ZELOHve5V3Ha+/XBHJEpoBX2JVh8lnR4c7fbPv/toX/TL+EKP1TYyR
         iUVkhSInOX4kXlfAfLja+Oo/DBPrVljR0uQSGDyjNKkhihwp/k3Qh++8+suSk6iJ2P4k
         e8Zwg6PfXHvR8CFvpLp+TDXNdotm4XtVefYH2kDMg/KlVm7ztYGzYn1b9PxcweuTEMQC
         voUNTECA2+Qxm6xxemlP9Pls3gx1Ip93vfwW8QsTvrf6bf6NRMVpNgt5fhmJro3SvQLz
         4ndOSOmz3Illy4O2hnI5Xiekx4S8anm0u7L+BxFoBFoJubp/500c5VjVZ7NngeIKrnvs
         mAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/DJvc+N8LMefrtVOcd2kPI3kAn7QT81MhTM5JQSpMu4=;
        b=TWjqU/YjAPNp8U++gpVWwQjT+eX7stp7hzSMetGTp6DwK/ebZufcnk2e+HZT/7ax74
         LhFvsMZqo7hr4foua6oWLfgNJ+0BDmOQulQ/eb8mI3D6UydPWIqYZXAevcuMkbg4Zj+c
         1Bvgd1PY9Nv9FfUR5wGqSSccfefTSeB9uyIL2faVjHHS/kvfkMEyyMq07WeFiv4buzEr
         yBSdyctz4Uhg0Ffz1Bore2XneIbMldX4ca8B04Uwh2n9OOn7VGlr8CLn3w9tMx31F2jF
         UvGjPjX8VBWT5UFpl0RlHhmatPp9+/BjAILsfzrhkw+pifZHqEsGco6BU5L9El+zGQkb
         i0YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qZ1D6IQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63si1188993wmb.172.2019.03.20.03.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 03:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qZ1D6IQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6YkC-0005nw-Ii
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 06:46:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1h6Ygj-0003OT-Jl
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 06:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1h6YRm-00084X-P4
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 06:27:47 -0400
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:34452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1h6YRl-0007qY-U5
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 06:27:46 -0400
Received: by mail-it1-x144.google.com with SMTP id l4so14849581ite.1
	for <qemu-devel@nongnu.org>; Wed, 20 Mar 2019 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/DJvc+N8LMefrtVOcd2kPI3kAn7QT81MhTM5JQSpMu4=;
	b=qZ1D6IQsjAAey6gpcYBklxps0FnANep0Ak7Ng1rdpLcGQY9gh4TzV4+vh46Q6bd+MZ
	qkgqKFhSHFTHYu9q5d+MucDTGZ6ZA00NRmiLcegszkhEAgkWv7LRfmg2/zXUDjfOG0R0
	uJLrB4kOYMou+np69SAfWfmcrtmrw1nmGfuwTn5z+6kLCy334IvC94TbH/xg6gTXXSsI
	646pJjbc5KPFpI1nM4wcsyBfoBUzIRsrMCHUWskltu/l8u1wNcXU/SPe8lblCByHc1uZ
	n15k8e94gNBd1CWyQyHoqE8+5Tja4ojrNzYfxaQ1Unhk0R/EKsNH6wbKHs9D+2oBvLM/
	QSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/DJvc+N8LMefrtVOcd2kPI3kAn7QT81MhTM5JQSpMu4=;
	b=apOL2HVsRyvj1eyiS5bVNZXm2TzhOVVfUuF4VtHIuniJTFr513VBVeH314dGEnPkOX
	AGkSzUivGCx+FJMjB4B2ZkQrEgxTb6rxVnCm8m/gBT9+EcwYn+19BDBAYmx9COxoHwVQ
	AAodBcpHxonOUFLviNmW5je3fAz2fQqq5kCEDT5PfsDBkC4V2P0L3vlzd/NwGDL70Tdf
	ZKgP6pm0x+gnwtTo3CpQ7wOmUa5Q/f1mrmPPAktPjne5a8iHvpwEZRZ1zPUAXGxbLNr9
	lD/27D0E9thxx1pYS9BcAFmrxU/e470TPW4jFDy4bvqeSWviwrYS1AY0cLr4yGRK6XY9
	Tgkg==
X-Gm-Message-State: APjAAAV/303nuxOnHvCFOvZFAmMC1OMj83g3aET0P20mLmpwsSCR6mdU
	2oVxl8kg7cPj2+vVRB3Aoaq11fd8y804l8oT35wl8Q==
X-Received: by 2002:a05:660c:7d1:: with SMTP id
	e17mr202242itl.158.1553077662416; 
	Wed, 20 Mar 2019 03:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
	<1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
	<CAKv+Gu-aZeYwegzFQ7pPqvm28ySR5xC6rZh8FBvQaWiNykgPEg@mail.gmail.com>
	<CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
In-Reply-To: <CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 20 Mar 2019 11:27:31 +0100
Message-ID: <CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-devel] [PATCH v6 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lK+Av5vzsuHh

On Mon, 18 Mar 2019 at 03:39, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> On Fri, 15 Mar 2019 at 18:41, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > On Fri, 15 Mar 2019 at 11:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > >
> > > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > > run on KVM and execute virtualization workloads, but we need an
> > > environment as faithful as possible to physical hardware, for supporting
> > > firmware and OS development for pysical Aarch64 machines.
> > >
> > > This patch introduces new machine type 'sbsa-ref' with main features:
> > >  - Based on 'virt' machine type.
> > >  - A new memory map.
> > >  - CPU type cortex-a57.
> > >  - EL2 and EL3 are enabled.
> > >  - GIC version 3.
> > >  - System bus AHCI controller.
> > >  - System bus EHCI controller.
> >
> > Hello Hongbo,
> >
> > Apologies for bringing this up now, but I seem to remember that the
> > EHCI does not support 64-bit DMA. Did you run into any issues with
> > this? Or was this fixed in QEMU in the mean time?
> >
> Hi Ard,
> Which EHCI do you mean?
> This time I use a newly introduced system bus EHCI, commit 114529f7
> and I only tested USB mouse and key board, didn't test DMA function.
>

The host controller doesn't work without DMA, so if mouse and keyboard
worked for you, and no DRAM exists below the 4 GB mark, this has
apparently been fixed in QEMU.
