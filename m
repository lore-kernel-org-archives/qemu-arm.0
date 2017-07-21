Received: by 10.25.44.15 with SMTP id s15csp549552lfs;
        Fri, 21 Jul 2017 04:36:04 -0700 (PDT)
X-Received: by 10.55.165.204 with SMTP id o195mr8564266qke.11.1500636964731;
        Fri, 21 Jul 2017 04:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500636964; cv=none;
        d=google.com; s=arc-20160816;
        b=hgEPx/k20k7MVCy4vGAxFq8G+ZZBlTV4IyMjf5Og/f69RlKCJRlXfZj9zPmSQU902K
         hbjRlidvIanVv6FcWGP2XmStgUNkWvM1XHK/rnGmgdC9ApYevohe1ZAEH46txgegwbCi
         edP4t31yEjN6dTgGTT1ifq520K1vnF83n0QCB9SeReaZOyA5+JQOY+GLNaLGrHmL0zfj
         RAO6SVjiuN1phYNaAR8whJmYnNMQtxYm5DE/dZcACW7bYrJjhLI1GbTktY9Qtq648GG0
         1dAQFMdBjAfzt8qlnPBoJCWzkEysaDOTIU9QdcNJgvSxmtHp8LZxD9y28QnjaUXdMYCj
         bWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=6UMJcSwutW7zvyw4IV/lww+EHpV2W7fezKon5AoDWj8=;
        b=aF/Zq51u3BEp6Lr4iaMfwu79X27C3hUF59roKg2DqbjXxag6fRMtZAvPliFJMLL6Nl
         UzXUorEiylChgbJyTfdsjRr6ZD6a2Fop/OrbOGPe8rsQ/TPuif9ssLMoyAdD1r3aMNT+
         6J56J2fuSd9L/WxuJRzpkwbVMagHqATwsj68XA2Wbu2Bu9VaB64ztpz4l6D++KO1fWoI
         KDMwosEuH+B9F4dVoeMj/q+htekvCRIt5sUAHTs2PMKzxWBR+f5rq339Fkxvbe4j376/
         Wwo8/DmTeoX4c8wH0qBRz1PpSmNtLc9FXHRKdwDV2wJwdElTiGb2u4sYRNhZDkaM4bm4
         3njA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f41si3564494qtf.332.2017.07.21.04.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 04:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYWDy-0002Y1-40
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 07:36:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dYWDu-0002Xu-Ex
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dYWDp-0007ot-Of
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:35:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dYWDp-0007nz-IH; Fri, 21 Jul 2017 07:35:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 924647D0F0;
	Fri, 21 Jul 2017 11:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 924647D0F0
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 924647D0F0
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C44D88858;
	Fri, 21 Jul 2017 11:35:49 +0000 (UTC)
Date: Fri, 21 Jul 2017 13:35:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Christoffer Dall <cdall@linaro.org>
Message-ID: <20170721113546.detxu6cmlsiatky6@kamzik.brq.redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-2-git-send-email-drjones@redhat.com>
	<20170721111607.GA16350@cbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170721111607.GA16350@cbox>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 21 Jul 2017 11:35:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: 4GZUcDczPQwQ

On Fri, Jul 21, 2017 at 01:16:07PM +0200, Christoffer Dall wrote:
> On Wed, Jul 19, 2017 at 09:39:54AM -0400, Andrew Jones wrote:
> > Mimicking gicv3-maintenance-interrupt, add the PMU's interrupt to
> > CPU state.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/virt.c    | 3 +++
> >  target/arm/cpu.c | 2 ++
> >  target/arm/cpu.h | 2 ++
> >  3 files changed, 7 insertions(+)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 31739d75a3e0..ea26f0c473c2 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -610,6 +610,9 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
> >          qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
> >                                      qdev_get_gpio_in(gicdev, ppibase
> >                                                       + ARCH_GICV3_MAINT_IRQ));
> > +        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> > +                                    qdev_get_gpio_in(gicdev, ppibase
> > +                                                     + VIRTUAL_PMU_IRQ));
> 
> I know Peter reviewed this, but isn't it a bit strange to create the
> pmu-interrupt when creating the gic (as this isn't an output from the
> GIC like the maintenance interrupt is) ?
>

Above the gic maintenance interrupt connection the timer irqs are also
connected. So, while the function name implies we only create the gic,
its function appears to be both its creation and the wiring up of CPU
inputs and outputs.

Thanks,
drew
