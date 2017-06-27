Received: by 10.25.227.6 with SMTP id a6csp1831380lfh;
        Tue, 27 Jun 2017 07:30:43 -0700 (PDT)
X-Received: by 10.200.51.235 with SMTP id d40mr6960893qtb.151.1498573843348;
        Tue, 27 Jun 2017 07:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498573843; cv=none;
        d=google.com; s=arc-20160816;
        b=CW+fXpjo2x81eUcdDQJ2U1BgkKqC29iG7ZvSAptt10nY8WYJgSHil4exSRTo55N4xb
         empCfjekcR3bd6tG1YibSe+uqmUeqcuNcN33Ftg0hjZVPY80KKj/zlDbym8wi2Gzlnyk
         ba6G4jIS19iH7omCXYdYFfrb/JQfZwOhxlavYFvRSIZsQbobdqEZMNNmuK/vR/imkZAh
         LpdiTqzFHzU1Px242NFn6EvaOHGMQzmMXCnlxrao+kT3uSECcla5SUnKxAjlakG05v3I
         oeo0Q9d8rkvmhSM6/ip1xUqZeO5qwi3KrMFe6zlfFn/3EOU0BeysmMD7eyzN12KIhAt9
         jJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=oRuPnCbPMTuOsMufcc+NUoNvGuwmen7lMZqqGfK3tVY=;
        b=oqy4bWaT7GeQcYX+kC2Waz+ZxP2fIBUhcygL75ksXrYhlgQUIqgjaf0PhWjzfTcpgC
         3SjpUlpbqkAuQg9pKE0X4qhuszeP358tDluYAV76Ztt6NlnnmwCM5CLf+fLD7nyv8L0i
         +ZclI/AF5hV5CSjPUR1irzM32b7Tc/zr61FScJCaWHnOQaOcT8YXflrn2kz7GAdk8x69
         XMAzMlQP8lT+l00kSc0zZ/9SpM+iNw7GTJorT1HliL7rJQO9EhRYIxHEVakNGigN8G8m
         fYvi4iflkDzmBH4xonTNwsBW9H/pfMdpIUR+XJD3SdyquSInmB6FvUc77GTsAzTMxLzG
         0aVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si2843662qtm.342.2017.06.27.07.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Jun 2017 07:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPrVo-00060o-J4
	for alex.bennee@linaro.org; Tue, 27 Jun 2017 10:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dPrVi-0005yw-Oo
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 10:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dPrVf-0008Au-Fp
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 10:30:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dPrVf-00088c-AK; Tue, 27 Jun 2017 10:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53CD7C04D292;
	Tue, 27 Jun 2017 14:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 53CD7C04D292
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 53CD7C04D292
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C283485A47;
	Tue, 27 Jun 2017 14:30:28 +0000 (UTC)
Date: Tue, 27 Jun 2017 16:30:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alexander Graf <agraf@suse.de>
Message-ID: <20170627143026.3k5gno27afem33v6@kamzik.brq.redhat.com>
References: <1498512656-75289-1-git-send-email-agraf@suse.de>
	<20170627123718.mdfn3o7heu6v7x6n@kamzik.brq.redhat.com>
	<b627df63-9ac1-49ff-931d-74c88d9d7ed5@suse.de>
	<20170627135951.ztukjadpnervqoly@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170627135951.ztukjadpnervqoly@kamzik.brq.redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 27 Jun 2017 14:30:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] ARM: KVM: Enable in-kernel
 timers with user space gic
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
	cdall@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KPboJ2yuDzw3

On Tue, Jun 27, 2017 at 03:59:51PM +0200, Andrew Jones wrote:
> On Tue, Jun 27, 2017 at 03:00:10PM +0200, Alexander Graf wrote:
> > > > +        /* XXX PMU IRQ is missing */
> > > 
> > > So I was wondering why you chose not to wire up the PMU in order to finish
> > 
> > Because the PMU IRQ is only available from the machine file, so it'll need
> > some more plumbing to get the qemu_irq object available from kvm.c.
> 
> OK, I just wrote a patch based on this patch for the PMU and will post it
> in a second.
> 
> > 
> > > this off, since I knew KVM has commit 3dbbdf78636e "KVM: arm/arm64: Report
> > > PMU overflow interrupts to userspace irqchip", which I presume should
> > > allow the PMU to work too. However, attempting to start a guest with
> > > -machine virt,accel=kvm,kernel-irqchip=off -cpu host,pmu=on doesn't provide
> > > it a PMU. AFAICT, that's only because KVM still has
> > > 
> > >          /*
> > >           * We currently require an in-kernel VGIC to use the PMU emulation,
> > >           * because we do not support forwarding PMU overflow interrupts to
> > >           * userspace yet.
> > >           */
> > >          if (!irqchip_in_kernel(vcpu->kvm) || !vgic_initialized(vcpu->kvm))
> > >                  return -ENODEV;
> > > 
> > > in kvm_arm_pmu_v3_init(). Anyone know why that wasn't removed with
> > > 3dbbdf78636e?

Eh, I missed a2befacf5094 "KVM: arm64: Allow creating the PMU without the
in-kernel GIC", which is still in kvmarm/queue, not yet in Linus master.
I'll have to revisit the QEMU patch I wrote to make sure it still makes
sense.

drew
