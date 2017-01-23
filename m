Received: by 10.103.86.17 with SMTP id k17csp1305942vsb;
        Mon, 23 Jan 2017 09:05:40 -0800 (PST)
X-Received: by 10.55.180.5 with SMTP id d5mr25709433qkf.266.1485191140653;
        Mon, 23 Jan 2017 09:05:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si2691981qte.95.2017.01.23.09.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jan 2017 09:05:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVi3m-0006Na-1T
	for alex.bennee@linaro.org; Mon, 23 Jan 2017 12:05:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cVi3A-0005ta-TH
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 12:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cVi36-0001IM-UY
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 12:05:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cVi36-0001I7-NH; Mon, 23 Jan 2017 12:04:56 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFC8C3D960;
	Mon, 23 Jan 2017 17:04:56 +0000 (UTC)
Received: from redhat.com (dhcp-17-141.bos.redhat.com [10.18.17.141])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v0NH4twq023753; Mon, 23 Jan 2017 12:04:55 -0500
Date: Mon, 23 Jan 2017 19:04:55 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170123190257-mutt-send-email-mst@kernel.org>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
	<20170123180247-mutt-send-email-mst@kernel.org>
	<49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 23 Jan 2017 17:04:56 +0000 (UTC)
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
X-TUID: 4oR5RQhztbD/

On Mon, Jan 23, 2017 at 05:46:47PM +0100, Paolo Bonzini wrote:
> 
> 
> On 23/01/2017 17:07, Michael S. Tsirkin wrote:
> > On Mon, Jan 23, 2017 at 08:55:04AM +0800, Shannon Zhao wrote:
> >> From: Shannon Zhao <shannon.zhao@linaro.org>
> >>
> >> For ARM virt machine, if we use virt-2.7 which will not create ITS node,
> >> the virtio-net can not recieve interrupts so it can't get ip address
> >> through dhcp.
> >> This fixes commit 83d768b(virtio: set ISR on dataplane notifications).
> >>
> >> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> > 
> > Paolo, could you comment on this pls?
> 
> For virtio-blk, my patch moved the setting of ISR from
> virtio_queue_guest_notifier_read to virtio_notify_irqfd.  This is
> because the irqfd emulation only needs to trigger the interrupt.
> Setting the ISR should have been done elsewhere.
> 
> Can vhost set ISR (I thought it couldn't)?  If so, it seems like ARM was
> relying on QEMU's irqfd emulation, as a work around for vhost not
> setting ISR.  But this only works if irqfd is directed to QEMU and not
> to KVM.  So if vhost cannot set ISR, I think vhost should be disabled
> unless MSI is active.
> 
> Am I missing something?
> 
> Paolo

vhost doesn't set ISR ATM.  Without MSI we are always bouncing
interrupts through QEMU in particular in order to set ISR.

Disabling vhost when user requested it was what we did
at some point but this just confused people.


> > 
> >> ---
> >> V2: Factor out a common function instead of duplicating code
> >> ---
> >>  hw/virtio/virtio.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >> index aa4f38f..00e8f74 100644
> >> --- a/hw/virtio/virtio.c
> >> +++ b/hw/virtio/virtio.c
> >> @@ -1441,6 +1441,12 @@ void virtio_notify_irqfd(VirtIODevice *vdev, VirtQueue *vq)
> >>      event_notifier_set(&vq->guest_notifier);
> >>  }
> >>  
> >> +static void virtio_irq(VirtQueue *vq)
> >> +{
> >> +    virtio_set_isr(vq->vdev, 0x1);
> >> +    virtio_notify_vector(vq->vdev, vq->vector);
> >> +}
> >> +
> >>  void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
> >>  {
> >>      if (!virtio_should_notify(vdev, vq)) {
> >> @@ -1448,8 +1454,7 @@ void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
> >>      }
> >>  
> >>      trace_virtio_notify(vdev, vq);
> >> -    virtio_set_isr(vq->vdev, 0x1);
> >> -    virtio_notify_vector(vdev, vq->vector);
> >> +    virtio_irq(vq);
> >>  }
> >>  
> >>  void virtio_notify_config(VirtIODevice *vdev)
> >> @@ -2082,7 +2087,7 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
> >>  {
> >>      VirtQueue *vq = container_of(n, VirtQueue, guest_notifier);
> >>      if (event_notifier_test_and_clear(n)) {
> >> -        virtio_notify_vector(vq->vdev, vq->vector);
> >> +        virtio_irq(vq);
> >>      }
> >>  }
> >>  
> >> -- 
> >> 2.0.4
> >>
