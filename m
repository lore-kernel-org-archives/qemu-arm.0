Received: by 10.25.77.65 with SMTP id a62csp1801553lfb;
        Tue, 24 Jan 2017 07:09:02 -0800 (PST)
X-Received: by 10.55.191.6 with SMTP id p6mr8671007qkf.79.1485270542277;
        Tue, 24 Jan 2017 07:09:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d54si13338961qta.72.2017.01.24.07.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jan 2017 07:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cW2iR-0001BP-AT
	for alex.bennee@linaro.org; Tue, 24 Jan 2017 10:08:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cW2aq-0003QN-By
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 10:01:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cW2ak-000637-IS
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 10:01:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cW2ai-00060L-Dw; Tue, 24 Jan 2017 10:01:00 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A9A87FE80;
	Tue, 24 Jan 2017 15:00:59 +0000 (UTC)
Received: from [10.36.116.246] (ovpn-116-246.ams2.redhat.com [10.36.116.246])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0OF0u2p031884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2017 10:00:57 -0500
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
	<20170123180247-mutt-send-email-mst@kernel.org>
	<49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
	<20170123190257-mutt-send-email-mst@kernel.org>
	<5760ee8c-f567-0dfd-456f-65f8957b22e2@redhat.com>
	<20170124164204-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9a61e616-9bf8-b4ff-43b9-68f1c908b910@redhat.com>
Date: Tue, 24 Jan 2017 16:00:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170124164204-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 24 Jan 2017 15:00:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V2] virtio: Fix no interrupt when not
 creating msi controller
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	christoffer.dall@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5wTP5Gb0lvEl



On 24/01/2017 15:44, Michael S. Tsirkin wrote:
> On Tue, Jan 24, 2017 at 10:25:00AM +0100, Paolo Bonzini wrote:
>>
>>
>> On 23/01/2017 18:04, Michael S. Tsirkin wrote:
>>>> For virtio-blk, my patch moved the setting of ISR from
>>>> virtio_queue_guest_notifier_read to virtio_notify_irqfd.  This is
>>>> because the irqfd emulation only needs to trigger the interrupt.
>>>> Setting the ISR should have been done elsewhere.
>>>>
>>>> Can vhost set ISR (I thought it couldn't)?  If so, it seems like ARM=
 was
>>>> relying on QEMU's irqfd emulation, as a work around for vhost not
>>>> setting ISR.  But this only works if irqfd is directed to QEMU and n=
ot
>>>> to KVM.  So if vhost cannot set ISR, I think vhost should be disable=
d
>>>> unless MSI is active.
>>>>
>>>> Am I missing something?
>>>
>>> vhost doesn't set ISR ATM.  Without MSI we are always bouncing
>>> interrupts through QEMU in particular in order to set ISR.
>>
>> Where is the code that disables KVM irqfd?
>
> This bit in virtio_pci_set_guest_notifiers does the trick I think:
>=20
>=20
>     bool with_irqfd =3D msix_enabled(&proxy->pci_dev) &&
>         kvm_msi_via_irqfd_enabled();
>=20
> I don't think we ever used irqfd for level interrupts.

Ok, thanks!

So we have four cases:

- assign with emulated irqfd + ISR
- assign with emulated irqfd
- assign with irqfd
- deassign

Currently we don't distinguish the first two, so (which I don't like)
Shannon's patch ends up setting ISR twice.  The only (ugly) solution
that comes to mind is making with_irqfd an enum...

Paolo
