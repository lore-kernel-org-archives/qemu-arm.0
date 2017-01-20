Received: by 10.25.77.65 with SMTP id a62csp82461lfb;
        Fri, 20 Jan 2017 09:00:51 -0800 (PST)
X-Received: by 10.55.88.195 with SMTP id m186mr8779687qkb.173.1484931651704;
        Fri, 20 Jan 2017 09:00:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si5255728qkd.140.2017.01.20.09.00.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 09:00:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUcYS-0000Gg-Sv
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 12:00:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cUcQ4-0001x7-TT
	for qemu-devel@nongnu.org; Fri, 20 Jan 2017 11:52:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cUcQ1-0000dm-TR
	for qemu-devel@nongnu.org; Fri, 20 Jan 2017 11:52:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cUcPt-0000XK-Q0; Fri, 20 Jan 2017 11:51:57 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E40AD624A8;
	Fri, 20 Jan 2017 16:51:56 +0000 (UTC)
Received: from redhat.com (ovpn-117-73.phx2.redhat.com [10.3.117.73])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v0KGptAZ013140; Fri, 20 Jan 2017 11:51:56 -0500
Date: Fri, 20 Jan 2017 18:51:54 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20170120185017-mutt-send-email-mst@kernel.org>
References: <1484880649-12600-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484880649-12600-1-git-send-email-zhaoshenglong@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 20 Jan 2017 16:51:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] virtio: Fix no interrupt when not creating
 msi controller
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, pbonzini@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KJpGCfESuuvp

On Fri, Jan 20, 2017 at 10:50:49AM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> For ARM virt machine, if we use virt-2.7 which will not create ITS node,
> the virtio-net can not recieve interrupts so it can't get ip address
> through dhcp.
> This fixes commit 83d768b(virtio: set ISR on dataplane notifications).
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index aa4f38f..709b718 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2082,6 +2082,7 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
>  {
>      VirtQueue *vq = container_of(n, VirtQueue, guest_notifier);
>      if (event_notifier_test_and_clear(n)) {
> +        virtio_set_isr(vq->vdev, 0x1);
>          virtio_notify_vector(vq->vdev, vq->vector);
>      }
>  }

Then you should bring back virtio_irq, to avoid duplicating
code from virtio_notify.



> -- 
> 2.0.4
> 
