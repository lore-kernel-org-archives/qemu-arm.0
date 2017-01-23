Received: by 10.25.77.65 with SMTP id a62csp1268607lfb;
        Mon, 23 Jan 2017 08:10:28 -0800 (PST)
X-Received: by 10.200.52.197 with SMTP id x5mr25715857qtb.31.1485187828829;
        Mon, 23 Jan 2017 08:10:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15si11072290qtg.276.2017.01.23.08.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jan 2017 08:10:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVhCM-0006LM-3V
	for alex.bennee@linaro.org; Mon, 23 Jan 2017 11:10:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cVh9u-0004Um-9d
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 11:07:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cVh9p-0000cS-Gu
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 11:07:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cVh9p-0000bn-Az; Mon, 23 Jan 2017 11:07:49 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C59C15567;
	Mon, 23 Jan 2017 16:07:49 +0000 (UTC)
Received: from redhat.com (dhcp-17-141.bos.redhat.com [10.18.17.141])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9A15784D19;
	Mon, 23 Jan 2017 16:07:48 +0000 (UTC)
Date: Mon, 23 Jan 2017 18:07:48 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20170123180247-mutt-send-email-mst@kernel.org>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 23 Jan 2017 16:07:49 +0000 (UTC)
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
	christoffer.dall@linaro.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6PrLEpw5x+rf

On Mon, Jan 23, 2017 at 08:55:04AM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> For ARM virt machine, if we use virt-2.7 which will not create ITS node,
> the virtio-net can not recieve interrupts so it can't get ip address
> through dhcp.
> This fixes commit 83d768b(virtio: set ISR on dataplane notifications).
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

Paolo, could you comment on this pls?


> ---
> V2: Factor out a common function instead of duplicating code
> ---
>  hw/virtio/virtio.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index aa4f38f..00e8f74 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1441,6 +1441,12 @@ void virtio_notify_irqfd(VirtIODevice *vdev, VirtQueue *vq)
>      event_notifier_set(&vq->guest_notifier);
>  }
>  
> +static void virtio_irq(VirtQueue *vq)
> +{
> +    virtio_set_isr(vq->vdev, 0x1);
> +    virtio_notify_vector(vq->vdev, vq->vector);
> +}
> +
>  void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      if (!virtio_should_notify(vdev, vq)) {
> @@ -1448,8 +1454,7 @@ void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
>      }
>  
>      trace_virtio_notify(vdev, vq);
> -    virtio_set_isr(vq->vdev, 0x1);
> -    virtio_notify_vector(vdev, vq->vector);
> +    virtio_irq(vq);
>  }
>  
>  void virtio_notify_config(VirtIODevice *vdev)
> @@ -2082,7 +2087,7 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
>  {
>      VirtQueue *vq = container_of(n, VirtQueue, guest_notifier);
>      if (event_notifier_test_and_clear(n)) {
> -        virtio_notify_vector(vq->vdev, vq->vector);
> +        virtio_irq(vq);
>      }
>  }
>  
> -- 
> 2.0.4
> 
