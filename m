Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2166858lfk;
        Tue, 6 Jul 2021 06:28:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzb7QBU/BQOq0wfcw8EL8LAugj+J7ca76eA9gk2D1GmNsxb7WQAyHvYQwiDGx73JQi8grC
X-Received: by 2002:a17:907:3c81:: with SMTP id gl1mr18890811ejc.136.1625578123122;
        Tue, 06 Jul 2021 06:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625578123; cv=none;
        d=google.com; s=arc-20160816;
        b=OB2lkkMOGQ2hM2OYVNnXCR4EjJ4CZjVq8/O1DF49wiz6Ix9HOQioN7ZoFwXvmwl4st
         672902zRPWmCkjBUiB9RcYQiguZZYFnnzJgEhgayIrTGAM/SEeqWw+oGgdBwklyyYIQu
         VMRfR+xcoMUJVBpkOVQ7oZ4d49ZAIJcpmzvBaSEnTeD3nis8LxPNYzGZ9rOTd17h6uTW
         IaKcjmDpdxLGHKIA1/YA2bj8o5VR8z9UVdwzcrTl8AHYYSTZeXT1PNdu6VrSAqvLEqAN
         69BdJjEr7Zeu546ciEwGj79YBhbyw8fRDOG3L0N1KcrQt/tSpLrC6+QIlyBSnmuHyhoW
         7QLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vQCG2ZwuHYOWFzJCHW9Je7k2DFJ9whQ7aysA7MIu8ik=;
        b=z6wrKtnU/ZCZPCdAXH5+m+vIXujQ1fBFhRPyn3zSbsm6MEKtTJgSNOvrBxOphKDsMb
         xdU5WfOkm/qNuqeLsLMsE3nFtVE2frcVQt5PzIiI0qjMkdGQOEzf5Jaja30Z6QMNUHxZ
         khsQTEHkAePZ4fuoiTkWftNY+t8cjqm9aVBd4eveAYUL8/RmbzCF3GP6ot5/GZ9kI3rA
         3mUVuHlwxhTx5uCrGtm+sRWBjXLfriQdpakZaQdYQswIracUmOZnzQa5dSqyfeMFEDlB
         AVMMfMH6ESV2DG0A/a9OYLnrEHH0hyNwQGLyKH84fBBoGvvw1chLcr9UfZuAh1K9svRb
         RPpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=apFT4xoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id er22si14699148ejc.499.2021.07.06.06.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 06:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=apFT4xoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0l7y-0001SV-9c
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 09:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0l7e-0001R5-Em
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 09:28:23 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0l7V-0004US-RF
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 09:28:22 -0400
Received: by mail-ed1-x534.google.com with SMTP id x12so27990806eds.5
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQCG2ZwuHYOWFzJCHW9Je7k2DFJ9whQ7aysA7MIu8ik=;
 b=apFT4xoG+BK0dsLHCeVxJVxPED0PNhsuvd+Gjlk1dH5J58T74wgoAwElkvDrTZoi7F
 4uhb1kdlWuDf33fXBGqOzrLzqQ7fOQCGoT5rQxTbj6mNbRuwhmjuCBiAthLkJ0VvFRWM
 r+vTTOlzfsW5jr2EoTEwnVuV/iPqYh/hEqmwNmI4l3S0bsvS9XnEcc4qT7ay9XhuAUHb
 jQw2e8cs3UpeWDvX4CW9vr7+ltyjSqUydVUBSBd8ioOXOfj+lYzIj3wyfKVji66eS3YS
 /CcpNGmRcNAX9Acos+gMKEY2p5A5XucquVQXfB+M7DbUq5RsFkWF+j6SV2b6VIMU/fLc
 Wk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQCG2ZwuHYOWFzJCHW9Je7k2DFJ9whQ7aysA7MIu8ik=;
 b=dAd4sfbWxY3mw5HwlrzFoOEJ+2W89F4xzRGhmei1+K/dsptMJRe9lUhDwrcZmeKLsn
 ejH2MMg+PmpCxWb8ZrxqH2PX2UzwkE/+C93TpV6p+KIXMCl/SCxJLurfkKh0TCODxzDx
 QkM+VcLTrHgy4MbeYKYGFAOxlUsvG4CJXBrB8uPnd8RvPQ29bDu5yV8JYed6Z3HwM+p/
 C5EucmgseiqcAw3JKXnZC/HDOU06dEBUqjedXAZXhwsH8hQssVjR2JhsXvAjSpqVkL+/
 dkl5ImUwQtnGDq99qxmYA7kN1aqwjVATXzHe7uDEziAl4WgYWLHr4yMXw+IlwQ3Jb+NV
 fLMQ==
X-Gm-Message-State: AOAM531nZFKkUt8Sx/mme3KdFvCcUrpxbCDq/GgI0fcE+pwBqPJYYA9b
 OZF+cH4F3w1oY09vDe+jkG5xDKF2c5azstyrAbx4ag==
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr22883440edz.36.1625578091760; 
 Tue, 06 Jul 2021 06:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
 <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
In-Reply-To: <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 14:27:33 +0100
Message-ID: <CAFEAcA-+JxmqNrOSaMsZCkwOsPQn6SUOO9a_bGhzGqCr9GUvJA@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9c+Ag9BQPMFg

On Tue, 6 Jul 2021 at 13:46, <shashi.mallela@linaro.org> wrote:
>
> On Tue, 2021-07-06 at 10:19 +0100, Peter Maydell wrote:
> > On Tue, 6 Jul 2021 at 04:25, <shashi.mallela@linaro.org> wrote:
> >
> > But the pseudocode for MAPTI does not say anywhere that we should
> > be checking the pIntID against any CPU's GICR_PROPBASER field.
> > It is checked only by the checks in LPIOutOfRange(), which tests:
> >  * is it larger than permitted by GICD_TYPER.IDbits
> >  * is it not in the LPI range and not 1023
> >
> > Checking whether the intID is too big and would cause us to index
> > off the end of the redistributor's configuration table should be done
> > later, only when the ITS actually sends the interrupt to a particular
> > redistributor, I think.
> >
> > (You can't rely on the guest having done the MAPC before the MAPTI;
> > and in any case the guest could choose to do a MAPC to a different
> > redistributor after it's done the MAPTI.)

> We already have the "intID too big check" in place within the
> redistributor processing when ITS sends the interrupt trigger.
> "the LPI range and not 1023" is also handled in this function,but for
> validating "is it larger than permitted by GICD_TYPER.IDbits",the
> source of GICD_TYPER.IDbits is GICR_PROPBASER because we pick up min of
> GICR_PROPBASER.IDbits and GICD_TYPER.IDBits.
>
> If we are to not use gicr_propbaser,then are we good to just accept the
> intID value here since we are validating the same during interrupt
> processing?

You should check the things the pseudocode says you should check.
When processing MAPTI, that's GICD_TYPER.IDbits. GICR_PROPBASER.IDbits
is not the same thing because the guest can set it to a smaller value.

thanks
-- PMM
