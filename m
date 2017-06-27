Received: by 10.25.227.6 with SMTP id a6csp1798513lfh;
        Tue, 27 Jun 2017 07:00:12 -0700 (PDT)
X-Received: by 10.200.48.237 with SMTP id w42mr6350423qta.54.1498572012728;
        Tue, 27 Jun 2017 07:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498572012; cv=none;
        d=google.com; s=arc-20160816;
        b=ERKbYBWTMYq/RkTXMkv90VfFZUQx25VOG2YoJmBCXwUeHcG33sCVBUHuKvneBgEUKW
         xayKyReT0Zr2/NL3QlGMFUh0JayGFHD/UEKvkcoGLo7rSn0Xxp7mVGiZe1whS/rDJBM1
         wnZqRiLj2Be0h7Bl53TMsSRnK2WIfV/SHJBm61k4I156KU2VjFEhO9tEYjlWCfFuq7hf
         hGFanJpTgjH7w9xx1IdJ1DRaOtYlt9d9zCD5zsoIz4fUG0gjqYQe8/nWh5ZawKyokjGv
         7FoIq74ym9hDl9Q4KLok6/KDXZLwpnGfmITHWAATIeq+prc53jZ8khVeU+SQRu3yxy3G
         +Tww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=39ppZlfcLV+Q3FiiKAwml4pk6SlVgsY8Xkni8xYprtc=;
        b=FS7/w8tf5yoJbXzfcI36128uXCDN3fr3fS7uNZTEBLu2CTijhrEqXhPlR8RMbA+txs
         fZ/WcDvtcCu/MfZRFV1my01SWvn3N4hlUJe+vxmq5nJAnSaq26EDxeXUYKCs0mwQ/ecV
         lovGUsyrksZZ42EhcVB5XxgEc7EoYsIiqWMfNE/EP9jm/6za5qs5aEvOZ8Uga+18nkpV
         JIRMKc9jVM6rvgv+v4NEofRUWG71y4q+C22SqYUmkGHUxvK0bmmZccSBQSFej2d2D68L
         ghnPyf2Rx5XKb1+aYEbMqG9MYo5Lb4A/g/YchfsYXKbT4A9QW5JEyIyHPFmAmefucP0W
         PuhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l57si2890043qta.111.2017.06.27.07.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Jun 2017 07:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPr2I-0003vL-38
	for alex.bennee@linaro.org; Tue, 27 Jun 2017 10:00:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dPr2A-0003sp-32
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 10:00:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dPr25-0006cc-5d
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 10:00:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dPr24-0006bF-VW; Tue, 27 Jun 2017 09:59:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8395C04D2A4;
	Tue, 27 Jun 2017 13:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D8395C04D2A4
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D8395C04D2A4
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00F7B7F631;
	Tue, 27 Jun 2017 13:59:53 +0000 (UTC)
Date: Tue, 27 Jun 2017 15:59:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alexander Graf <agraf@suse.de>
Message-ID: <20170627135951.ztukjadpnervqoly@kamzik.brq.redhat.com>
References: <1498512656-75289-1-git-send-email-agraf@suse.de>
	<20170627123718.mdfn3o7heu6v7x6n@kamzik.brq.redhat.com>
	<b627df63-9ac1-49ff-931d-74c88d9d7ed5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b627df63-9ac1-49ff-931d-74c88d9d7ed5@suse.de>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 27 Jun 2017 13:59:56 +0000 (UTC)
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
X-TUID: Jq86ROEEKTgN

On Tue, Jun 27, 2017 at 03:00:10PM +0200, Alexander Graf wrote:
> > > +        /* XXX PMU IRQ is missing */
> > 
> > So I was wondering why you chose not to wire up the PMU in order to finish
> 
> Because the PMU IRQ is only available from the machine file, so it'll need
> some more plumbing to get the qemu_irq object available from kvm.c.

OK, I just wrote a patch based on this patch for the PMU and will post it
in a second.

> 
> > this off, since I knew KVM has commit 3dbbdf78636e "KVM: arm/arm64: Report
> > PMU overflow interrupts to userspace irqchip", which I presume should
> > allow the PMU to work too. However, attempting to start a guest with
> > -machine virt,accel=kvm,kernel-irqchip=off -cpu host,pmu=on doesn't provide
> > it a PMU. AFAICT, that's only because KVM still has
> > 
> >          /*
> >           * We currently require an in-kernel VGIC to use the PMU emulation,
> >           * because we do not support forwarding PMU overflow interrupts to
> >           * userspace yet.
> >           */
> >          if (!irqchip_in_kernel(vcpu->kvm) || !vgic_initialized(vcpu->kvm))
> >                  return -ENODEV;
> > 
> > in kvm_arm_pmu_v3_init(). Anyone know why that wasn't removed with
> > 3dbbdf78636e?
> 
> I guess it should get removed when the PMU sync works?

OK, I'll post the KVM patch at the same time.


I noticed another thing while testing with a virtio-scsi disk; I get
this on output when booting with userspace irqchip

 virtio-scsi: Failed to set guest notifiers (-11), ensure -enable-kvm is set
 qemu-system-aarch64: virtio_bus_start_ioeventfd: failed. Fallback to userspace (slower).

Just a warning, but I guess it should be removed, at least when the
user has explicitly asked for a userspace irqchip with kernel-irqchip=no.

Thanks,
drew
