Received: by 10.25.77.65 with SMTP id a62csp1790107lfb;
        Tue, 24 Jan 2017 06:44:35 -0800 (PST)
X-Received: by 10.55.203.213 with SMTP id u82mr27795862qkl.10.1485269075459;
        Tue, 24 Jan 2017 06:44:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p50si13311582qtc.7.2017.01.24.06.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jan 2017 06:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cW2Kn-0005l4-0z
	for alex.bennee@linaro.org; Tue, 24 Jan 2017 09:44:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cW2KQ-0005Wj-Ta
	for qemu-arm@nongnu.org; Tue, 24 Jan 2017 09:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cW2KK-00081A-Sa
	for qemu-arm@nongnu.org; Tue, 24 Jan 2017 09:44:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cW2KK-00080m-N5; Tue, 24 Jan 2017 09:44:04 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77DCC7FB7E;
	Tue, 24 Jan 2017 14:44:04 +0000 (UTC)
Received: from redhat.com (ovpn-117-58.rdu2.redhat.com [10.10.117.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v0OEi3Nh006972; Tue, 24 Jan 2017 09:44:03 -0500
Date: Tue, 24 Jan 2017 16:44:02 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170124164204-mutt-send-email-mst@kernel.org>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
	<20170123180247-mutt-send-email-mst@kernel.org>
	<49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
	<20170123190257-mutt-send-email-mst@kernel.org>
	<5760ee8c-f567-0dfd-456f-65f8957b22e2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5760ee8c-f567-0dfd-456f-65f8957b22e2@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 24 Jan 2017 14:44:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V2] virtio: Fix no interrupt when not
 creating msi controller
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
	christoffer.dall@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gz7yg87BoDUx

On Tue, Jan 24, 2017 at 10:25:00AM +0100, Paolo Bonzini wrote:
> 
> 
> On 23/01/2017 18:04, Michael S. Tsirkin wrote:
> >> For virtio-blk, my patch moved the setting of ISR from
> >> virtio_queue_guest_notifier_read to virtio_notify_irqfd.  This is
> >> because the irqfd emulation only needs to trigger the interrupt.
> >> Setting the ISR should have been done elsewhere.
> >>
> >> Can vhost set ISR (I thought it couldn't)?  If so, it seems like ARM was
> >> relying on QEMU's irqfd emulation, as a work around for vhost not
> >> setting ISR.  But this only works if irqfd is directed to QEMU and not
> >> to KVM.  So if vhost cannot set ISR, I think vhost should be disabled
> >> unless MSI is active.
> >>
> >> Am I missing something?
> >
> > vhost doesn't set ISR ATM.  Without MSI we are always bouncing
> > interrupts through QEMU in particular in order to set ISR.
> 
> Where is the code that disables KVM irqfd?
> 
> Paolo


This bit in virtio_pci_set_guest_notifiers does the trick I think:


    bool with_irqfd = msix_enabled(&proxy->pci_dev) &&
        kvm_msi_via_irqfd_enabled();

I don't think we ever used irqfd for level interrupts.

> > Disabling vhost when user requested it was what we did
> > at some point but this just confused people.
> > 
> > 
