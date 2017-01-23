Received: by 10.25.77.65 with SMTP id a62csp1285556lfb;
        Mon, 23 Jan 2017 08:48:59 -0800 (PST)
X-Received: by 10.237.35.84 with SMTP id i20mr26443358qtc.247.1485190139801;
        Mon, 23 Jan 2017 08:48:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187si4809234qkb.170.2017.01.23.08.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jan 2017 08:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVhnd-0006yS-2F
	for alex.bennee@linaro.org; Mon, 23 Jan 2017 11:48:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cVhlj-0005ji-CA
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 11:47:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cVhle-0004wm-MI
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 11:46:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cVhle-0004wc-Dq; Mon, 23 Jan 2017 11:46:54 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AD3661BBE;
	Mon, 23 Jan 2017 16:46:54 +0000 (UTC)
Received: from [10.36.117.84] (ovpn-117-84.ams2.redhat.com [10.36.117.84])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0NGkoMs006285
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 23 Jan 2017 11:46:52 -0500
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
	<20170123180247-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
Date: Mon, 23 Jan 2017 17:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170123180247-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 23 Jan 2017 16:46:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAzd1mOiVwB7



On 23/01/2017 17:07, Michael S. Tsirkin wrote:
> On Mon, Jan 23, 2017 at 08:55:04AM +0800, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> For ARM virt machine, if we use virt-2.7 which will not create ITS nod=
e,
>> the virtio-net can not recieve interrupts so it can't get ip address
>> through dhcp.
>> This fixes commit 83d768b(virtio: set ISR on dataplane notifications).
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>=20
> Paolo, could you comment on this pls?

For virtio-blk, my patch moved the setting of ISR from
virtio_queue_guest_notifier_read to virtio_notify_irqfd.  This is
because the irqfd emulation only needs to trigger the interrupt.
Setting the ISR should have been done elsewhere.

Can vhost set ISR (I thought it couldn't)?  If so, it seems like ARM was
relying on QEMU's irqfd emulation, as a work around for vhost not
setting ISR.  But this only works if irqfd is directed to QEMU and not
to KVM.  So if vhost cannot set ISR, I think vhost should be disabled
unless MSI is active.

Am I missing something?

Paolo

>=20
>> ---
>> V2: Factor out a common function instead of duplicating code
>> ---
>>  hw/virtio/virtio.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index aa4f38f..00e8f74 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -1441,6 +1441,12 @@ void virtio_notify_irqfd(VirtIODevice *vdev, Vi=
rtQueue *vq)
>>      event_notifier_set(&vq->guest_notifier);
>>  }
>> =20
>> +static void virtio_irq(VirtQueue *vq)
>> +{
>> +    virtio_set_isr(vq->vdev, 0x1);
>> +    virtio_notify_vector(vq->vdev, vq->vector);
>> +}
>> +
>>  void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
>>  {
>>      if (!virtio_should_notify(vdev, vq)) {
>> @@ -1448,8 +1454,7 @@ void virtio_notify(VirtIODevice *vdev, VirtQueue=
 *vq)
>>      }
>> =20
>>      trace_virtio_notify(vdev, vq);
>> -    virtio_set_isr(vq->vdev, 0x1);
>> -    virtio_notify_vector(vdev, vq->vector);
>> +    virtio_irq(vq);
>>  }
>> =20
>>  void virtio_notify_config(VirtIODevice *vdev)
>> @@ -2082,7 +2087,7 @@ static void virtio_queue_guest_notifier_read(Eve=
ntNotifier *n)
>>  {
>>      VirtQueue *vq =3D container_of(n, VirtQueue, guest_notifier);
>>      if (event_notifier_test_and_clear(n)) {
>> -        virtio_notify_vector(vq->vdev, vq->vector);
>> +        virtio_irq(vq);
>>      }
>>  }
>> =20
>> --=20
>> 2.0.4
>>
