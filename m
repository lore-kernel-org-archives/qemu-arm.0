Received: by 10.25.44.15 with SMTP id s15csp5953761lfs;
        Tue, 18 Jul 2017 05:58:38 -0700 (PDT)
X-Received: by 10.200.47.152 with SMTP id l24mr1837692qta.153.1500382717967;
        Tue, 18 Jul 2017 05:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500382717; cv=none;
        d=google.com; s=arc-20160816;
        b=nLDiEVbkptEOzf9ngUosWBrOcDG4nQ2fQWNX51Hh4HlrHP233QX4b65QCyNyxpdcyq
         Jr7r8gjYvnV/PzsVLzy6m2KtjsCQbOJ3yYoe+BcoQgvkw6ZubSptkyKqe67QsJoT510m
         4XykfMegbTtmgsFt/IMxUjXbX/oiTRMn9r/CEg+4mrseOwJuUKCoaIY0/hs/UNx/lOie
         PSr2ehpM0MkpWDn97imfa6h5LzsUQ5G7iL6HaWg4+HP+wPDEide/DzB2fdzNhtVRCoId
         RrS4TpErPMVyPnQFZNIKpQ7geYhjiiqsoKdeXah8r5RIfy9CsRQRcNRsXcGdb3GkYK0H
         IuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=FfbvjiOplma/XLUx/Hq+fe33Fhym3nAN0/IoIfdoNgQ=;
        b=vRIYasP8y8JfhTXFWFkdSjp/hhFLNiafd2xrKwwkDHOMejl2DxIFmXLxSaS3bRYgFR
         LUB9jzE4oYtdWzMaf9PEIx0BD4hBq5U/QVgWXRJnTPqOHSVL8rd1wuAHzqxl/b7NQ5ee
         Pl41HK5ab/PZUF2/mxu8L7gOKb6uUPqBwjA726QZAd5siuaZn3jMZL0cWqnAMmlj1irt
         xwmOM0ZOB/E4D4dUiil3sjNYfayrsM/TI4vLOtd9M2eiOY4h881U7y2vvaxU8Cl/jvHF
         ipGwUmxD8t+FVoxwo4LYO0DJhrQkIrpIyWBzY1AnFx9ACK7jdDm/CioBdMOO/Aa1f7Oi
         0itg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5si1934906qtd.309.2017.07.18.05.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Jul 2017 05:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXS5D-0004sG-72
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 08:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXS55-0004rx-Ga
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 08:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXS50-00040d-Lr
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 08:58:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXS50-00040V-Cd; Tue, 18 Jul 2017 08:58:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21A01C04B939;
	Tue, 18 Jul 2017 12:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 21A01C04B939
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 21A01C04B939
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15A127F7F2;
	Tue, 18 Jul 2017 12:58:19 +0000 (UTC)
Date: Tue, 18 Jul 2017 14:58:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170718125817.bf4u5ml7idjftlw3@kamzik.brq.redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
	<1498927637-14496-3-git-send-email-drjones@redhat.com>
	<CAFEAcA-CQm1FuF7eyveSbSchRD1PkB-PDVNyMQhVny+bmWWAvg@mail.gmail.com>
	<20170718123845.c2g3t4m4pyqofk2l@kamzik.brq.redhat.com>
	<CAFEAcA_6XronVOOCbWgJXctx6bp+nYys+cCsjUmtCiuaBjUb-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_6XronVOOCbWgJXctx6bp+nYys+cCsjUmtCiuaBjUb-g@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Jul 2017 12:58:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] target/arm/kvm: split pmu
 init from creation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: on4oiWfcfiFL

On Tue, Jul 18, 2017 at 01:44:34PM +0100, Peter Maydell wrote:
> On 18 July 2017 at 13:38, Andrew Jones <drjones@redhat.com> wrote:
> > On Mon, Jul 10, 2017 at 04:27:35PM +0100, Peter Maydell wrote:
> >> On 1 July 2017 at 17:47, Andrew Jones <drjones@redhat.com> wrote:
> >> > When adding a PMU with a userspace irqchip we only do the INIT
> >> > stage of the device creation.
> >>
> >> Can you explain why? My assumption would be that either
> >> (a) we don't need the kernel's PMU, in which case don't
> >> create it at all, or
> >> (b) we do need the kernel's PMU, so we should both create
> >> and INIT it.
> >>
> >> If we do one but not the other then we've left a half
> >> created and unusable PMU device in the kernel, haven't we?
> >>
> >
> > I should have renamed the 'create' function to 'set_irq', then
> > it would make sense, because after the split done by this patch
> > 'create' only sets the irq, which can only be done with an
> > in-kernel irqchip. Both irqchip types still require INIT though,
> > see kernel doc Documentation/virtual/kvm/devices/vcpu.txt.
> 
> Oh, I see, I read the commit message as "we only do the
> INIT stage when adding a PMU with a userspace irqchip",
> which isn't the same meaning as what you actually wrote.
> (perhaps "When adding a PMU with a userspace irqchip we
> skip the set-irq stage of device creation" would be clearer?)
> 
> > I'll send a v2 that renames the create function. But, before I do,
> > assuming the rename, do you have another comments on this or the
> > next patch? We might as well batch all the changes :-)
> 
> I think they looked mostly OK. A minor nit:
> 
> +        if (kvm_enabled() &&
> +            !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
> +            return;
> +        }
> +        if (kvm_enabled() && !kvm_arm_pmu_init(cpu)) {
>              return;
>          }
> 
> might be better as
>        if (kvm_enabled()) {
>            if (!kvm_arm_pmu_create(...)) {
>                /* error handling */
>            }
>            if (!kvm_arm_pmu_init(...)) {
>                /* error handling */
>            }
>        }

With the top version I was setting things up for a one-liner
change in the next patch, as only the first condition needs
to have s/kvm_enabled/kvm_irqchip_in_kernel/ done to it.

> 
> (and I'm not sure "silently return" is really the right error
> handling, but that is what we do currently, so whatever.)

I'll give the error handling a bit of thought before respinning.

Thanks,
drew
