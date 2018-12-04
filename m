Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7994424wrt;
        Tue, 4 Dec 2018 04:15:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XODSGEuPfN2s+0kpFOXcBC9mcVUjQS4ApL6WwpHZKa054KoYAhvV8OQCBo5EabZCnKv/pB
X-Received: by 2002:a37:5d06:: with SMTP id r6mr18360871qkb.229.1543925742869;
        Tue, 04 Dec 2018 04:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543925742; cv=none;
        d=google.com; s=arc-20160816;
        b=lUs/VxqqOTWKynW/tEHjNkKelC+Dg2TUOiTqMqrygKpzIghho9eQVjpQcshJMIPjaH
         1jjyayssuAvkyaKWfwrf5uAfLtsx6Z0b7Gpsi4ljWPOWKSumHwFTKLsfMrERKdv1zCvO
         uHdwbfJckb0+SbpdyvevAkiX5VzknJTpgOSJiX9aVrFiPCHN3dEG7U3f98gz6d1YRZp0
         9QfYLNUfR7U5FVNzlnv6niBjdMybwUEomi6bQWocdtF95CBPyaM7qO2ysQY2ZDRTriZE
         GiuSy7tii+a5MGEWqnxUGcgJwMmF6NdNo5JDZzWl78dEPRuIqR59D+w2V/oaqJNZzOoI
         IjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=YZZmn92mqa9JlvXAr83PrZtTO9tyFJQXiBPc4S7x1aM=;
        b=UCK2N/Pnuc54pUf9G4TiSHnj60Tc6dGrOXniyooEzLDCB1+eXZRGX97y7BsNfhCsQc
         HGwVsXvFm94aQai2t1VkQ98Hd22PIkMgY6KdiM4kEZPqT8z7qWDyPQTuZgBCDf2VmMzq
         zu/b5sWbR5AIdhJZaNlX2zlbrJgMMkYfF94pq9zgh805jF6KEL9EF0TsUWZooR/ei90c
         7LUwEBvDIyil2FFoLkClbrM1UakURVnEwnHM/tirp/kBcyGIpKyOm5czgJ0kSHSSOKrF
         rOPf2ySfODMy/gfwSc6qBCW/8M3yL7UtHWSNrZNGeRk8Gdd9woItUFHwOUUXKeDTPhqv
         lU0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e52si3149521qte.213.2018.12.04.04.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 04:15:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gU9c6-0005tq-A3
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 07:15:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gU9bB-0005nS-1z
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 07:14:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gU9Sh-0000hu-7c
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 07:06:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59118)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gU9Se-0000de-1I; Tue, 04 Dec 2018 07:05:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE3AA307D915;
	Tue,  4 Dec 2018 12:05:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 692DA1054FC9;
	Tue,  4 Dec 2018 12:05:49 +0000 (UTC)
Date: Tue, 4 Dec 2018 13:05:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181204120547.x5qa7q6usq6bfgkw@kamzik.brq.redhat.com>
References: <CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<201812040841510784684@zte.com.cn>
	<CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 04 Dec 2018 12:05:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DIrDb0/mhwO4

On Tue, Dec 04, 2018 at 09:40:07AM +0000, Peter Maydell wrote:
> On Tue, 4 Dec 2018 at 00:41, <peng.hao2@zte.com.cn> wrote:
> >
> > >I would still prefer to see a more detailed examination of whether
> > >we can do this with a PCI device before we commit to taking the
> > >MMIO version into the virt board.
> >
> > I'm sorry I thought I had sent an email. yesterday when I wrote an email to
> > explain the reason, I was interrupted and forgot to send it out.
> >
> > Now the pvpanic device is implemented as a mmio device or an ACPI device in the kernel,
> > and only one device can be seen at the same time. If the kernel parses FDT first, then pvpanic
> > is a mmio device. The kernel parses ACPI table first(and virtual machine is configured with ACPI),
> > and pvpanic  is an ACPI device.
> > If pvpanic is implemented as a PCI device, then the PCI device must still be seen when the ACPI table
> > is first parsed by the kernel, because ACPI device relies on the mmio space of the PCI device.
> > Mmio devices can be thought of as just an address space rather than a device in the strict sense.
> 
> I'm afraid I don't understand. If it's a PCI device then
> it does not need to be listed in the device tree or the
> ACPI tables at all, because it is probeable by the guest.
> This also significantly simplifies the changes needed in QEMU.
> 
> > Secondly, I don't want it to be a pluggable device. If the user
> > deletes the device by mistake, it may lead to unpredictable results.
> 
> If the user deletes the PCI device they're using for their
> disk or networking this will also lead to unpredictable
> results. We expect users not to randomly unplug things from
> their system if they want it to continue to work. In any
> case your guest driver can easily handle the unplug: the
> guest would then just lose the ability to notify on panic,
> falling back to as if the pvpanic device had never been
> present.
>

To muddy the waters a bit more, while I'm not opposed to this device
being a PCI device, there is a chance that someone will still want a
platform-mmio version as well. I'm not sure how everything will
eventually fall into place, but I've seen some super minimal guest
configs proposed for the VMs-used-like-containers use cases, even
configs that choose to use virtio-mmio over virtio-pci, and then not
provide a PCI bus at all to the vm.

Maybe this series and the current kernel series can be allowed to
continue as they are, and if later there's a demand for a pci version,
it could just be yet another variant added later?

Thanks,
drew
