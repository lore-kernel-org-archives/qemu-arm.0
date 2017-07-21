Received: by 10.25.44.15 with SMTP id s15csp573136lfs;
        Fri, 21 Jul 2017 05:01:32 -0700 (PDT)
X-Received: by 10.200.49.7 with SMTP id g7mr9488661qtb.118.1500638492071;
        Fri, 21 Jul 2017 05:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500638492; cv=none;
        d=google.com; s=arc-20160816;
        b=KsHBqdJhJlNylElfOQzcnporveSaF+RQkoJGh8gJk9sgtbbIQnDpQFPW9pTrLwOrj2
         SCKFYwt57h2UbWRYvqX4421dH7tvCkC8CgdiNEOEtGwPCT8Uf9niei9rxWJQSuzsXXMg
         YtD4j/aE1qEXW0tDd4g1dmU2IVyeF7cKY3wIo5uTQKbt/swJqgoeJhAiEp4ti6G67Dbg
         +IFyiYtieIs1cOT61otjxnsbwuxQg/gfbMtaMfNYdFMsH4nsGUev09z4ISA8+mCYV0As
         UhgfAR5NJbKd9zfwseariLx/qji3FJ7WYmZg/2Jc1orj1NWvfcb6VUN9NVvmKjD1R1sV
         crjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=jL8Tw4OvbMggE35eSp6xV5i8M1c6E+Ilb+uxSUXyFDQ=;
        b=es17LO75KY9UnmpFp43ywwcarURzDILruG1y4xje/bWuJrq3elcFpKJcFpJABvXP+g
         jC76JL4K4QVVrQUn/K7EBPG8aMBO0+yF55xKYxX7h4X7Y6Zl0X/UbOeSu4WDf80dlten
         iGA1rmuHv8SPIDy3BGOr/9SgZjSPDn5mvW4fYVM0qBHM2bGHPECSyDCXRIgQDQWqL8Fh
         EiMxHNwWofdhsLmO+2LKxKNylJNtLa8UG4OwAjJ8V7m/FRn6U+AKBrk0TaSOdMDtYW6O
         HfeEtfvnEevZCUJeJ1wrfVRmH5NRL6T1EUl0WEduuoVzbRIGp3XxDYxtAwmj9qC5zOsl
         lW6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Sd5bYDnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i127si3590756qkc.370.2017.07.21.05.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 05:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Sd5bYDnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYWcb-0001Aq-F2
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 08:01:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYWcQ-00018I-Du
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 08:01:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYWcN-0002td-CI
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 08:01:18 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:37386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cdall@linaro.org>) id 1dYWcN-0002tE-5h
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 08:01:15 -0400
Received: by mail-wm0-x229.google.com with SMTP id e131so12108965wme.0
	for <qemu-arm@nongnu.org>; Fri, 21 Jul 2017 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jL8Tw4OvbMggE35eSp6xV5i8M1c6E+Ilb+uxSUXyFDQ=;
	b=Sd5bYDnEDb1jSjzMMx1KnLrrNTJwdZrT2ieGZ4p3IRBGkDIVFvbz5IGcTzTYIo4C2F
	/mc3yjDTRF+gowSkLi4XAHee86ejR/14x/j3Qr7KOwOtREGTY82oVwdmqkYVTWzuGnRN
	bKx3FZyQ2iWSxZZbyhYy51hscRdiNY5qSW4gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jL8Tw4OvbMggE35eSp6xV5i8M1c6E+Ilb+uxSUXyFDQ=;
	b=nzcqqtyBRQqxelQNKKoUugc6FsWwNXo3JB1sWLLiMG4vXFt0Fkl6yrCogsWpZcTrpQ
	W0DNa1XhA4p7BkBoZEMy1CbWU13HeXU7bDI6oLKUqme7XymUl/0ZxhKNScpSdn00G4H/
	+3QQBOvqO8+E+aPDxqZ9XcT9yoffmhj20GEQHA4VTaaLqpHQSiXBC5RV88YoNjHHCpob
	blgikd3XMzJEjtKdPbP55WtFsa1nAWXlRqsxJ6QHgkvOmDMmzQNQKgnR2b8SeyeT22WM
	GShS530E+769YnzkBebFDIP7VewxvqGmjogPaAulYE2MQoxkW/W1khGB0m8vrhrjmvAo
	dyJQ==
X-Gm-Message-State: AIVw113OSke99frB0YiHumIiqZ+DbAmrOprAL5/XhhTbwX8fjGFE0SxD
	qnpz81q63REHkCpflvfc7w==
X-Received: by 10.80.172.166 with SMTP id x35mr5796917edc.209.1500638473826;
	Fri, 21 Jul 2017 05:01:13 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
	by smtp.gmail.com with ESMTPSA id b6sm3059309ede.23.2017.07.21.05.01.13
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 05:01:13 -0700 (PDT)
Date: Fri, 21 Jul 2017 14:01:13 +0200
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170721120113.GA16354@cbox>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-2-git-send-email-drjones@redhat.com>
	<20170721111607.GA16350@cbox>
	<20170721113546.detxu6cmlsiatky6@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170721113546.detxu6cmlsiatky6@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/4] hw/arm/virt: add pmu
 interrupt state
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J76tvfHC4qbm

On Fri, Jul 21, 2017 at 01:35:46PM +0200, Andrew Jones wrote:
> On Fri, Jul 21, 2017 at 01:16:07PM +0200, Christoffer Dall wrote:
> > On Wed, Jul 19, 2017 at 09:39:54AM -0400, Andrew Jones wrote:
> > > Mimicking gicv3-maintenance-interrupt, add the PMU's interrupt to
> > > CPU state.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/arm/virt.c    | 3 +++
> > >  target/arm/cpu.c | 2 ++
> > >  target/arm/cpu.h | 2 ++
> > >  3 files changed, 7 insertions(+)
> > > 
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 31739d75a3e0..ea26f0c473c2 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -610,6 +610,9 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
> > >          qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
> > >                                      qdev_get_gpio_in(gicdev, ppibase
> > >                                                       + ARCH_GICV3_MAINT_IRQ));
> > > +        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> > > +                                    qdev_get_gpio_in(gicdev, ppibase
> > > +                                                     + VIRTUAL_PMU_IRQ));
> > 
> > I know Peter reviewed this, but isn't it a bit strange to create the
> > pmu-interrupt when creating the gic (as this isn't an output from the
> > GIC like the maintenance interrupt is) ?
> >
> 
> Above the gic maintenance interrupt connection the timer irqs are also
> connected. So, while the function name implies we only create the gic,
> its function appears to be both its creation and the wiring up of CPU
> inputs and outputs.
> 

ok, I didn't see that.

Otherwise this patch looks good to me.

-Christoffer
