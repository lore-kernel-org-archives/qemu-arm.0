Received: by 10.25.21.156 with SMTP id 28csp1364185lfv;
        Fri, 29 Jul 2016 07:14:11 -0700 (PDT)
X-Received: by 10.200.50.82 with SMTP id y18mr63217960qta.29.1469801651291;
        Fri, 29 Jul 2016 07:14:11 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81si986535qks.139.2016.07.29.07.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 07:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT8YE-0000NQ-OO
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 10:14:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bT8XN-0008TY-VQ
	for qemu-devel@nongnu.org; Fri, 29 Jul 2016 10:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bT8XM-0001W2-Lw
	for qemu-devel@nongnu.org; Fri, 29 Jul 2016 10:13:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bT8XG-0001UN-6v; Fri, 29 Jul 2016 10:13:10 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 295DCC04D2AF;
	Fri, 29 Jul 2016 14:13:09 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-58.ams2.redhat.com [10.36.5.58])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u6TED6CX021774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jul 2016 10:13:07 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
	<1467798364-9049-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9zz0Dr4+O02oDfjsjOAo=X1m=C2h48ged8_bDQiQmb6A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c67f4f5e-3beb-2c59-2f7a-46a370343acc@redhat.com>
Date: Fri, 29 Jul 2016 16:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9zz0Dr4+O02oDfjsjOAo=X1m=C2h48ged8_bDQiQmb6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 29 Jul 2016 14:13:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v4 5/6] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Diana Craciun <diana.craciun@freescale.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8V42yVieHXEg

Hi Peter,
On 29/07/2016 15:35, Peter Maydell wrote:
> On 6 July 2016 at 10:46, Eric Auger <eric.auger@redhat.com> wrote:
>> +/**
>> + *
>> + * We currently do not use kvm_arm_register_device to provide
>> + * the kernel with the vITS control frame base address since the
>> + * KVM_DEV_ARM_VGIC_CTRL_INIT init MUST be called after the
>> + * KVM_ARM_SET_DEVICE_ADDR and the kvm_arm_register_device
>> + * infra does not allow this.
>> + */
> 
> So the conclusion on the kvm-arm mailing list was that the
> kernel ought to permit DEVICE_ADDR to be set after INIT,
> the same way it does for the GIC proper, right?
Yes this was indeed evoked but eventually what is in next, right now is
the same implementation where KVM_ARM_SET_DEVICE_ADDR is forbidden once
init is done:

see virt/kvm/arm/vgic/vgic-its.c
its->initialized set by vgic_its_init_its (KVM_DEV_ARM_VGIC_GRP_CTRL)

case KVM_DEV_ARM_VGIC_GRP_ADDR:
../..
                if (its->initialized)
                        return -EBUSY;

Thanks

Eric

> 
> thanks
> -- PMM
> 
