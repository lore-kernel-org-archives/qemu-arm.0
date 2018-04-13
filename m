Received: by 10.28.71.155 with SMTP id m27csp792771wmi;
        Fri, 13 Apr 2018 07:02:18 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/hHhJKXtb3hve2LXjsWmVNkWjLX111pK3YcJi2oJ5Mz+8aEGGubGx8bQVVEIYW4covf+vS
X-Received: by 2002:a17:902:5902:: with SMTP id o2-v6mr5347113pli.81.1523628138039;
        Fri, 13 Apr 2018 07:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523628137; cv=none;
        d=google.com; s=arc-20160816;
        b=lXqlKVHIi/etMfLbmgP1L2LT4UUzSRSzP1DOW9OvFRIpbS9mdjDrTACIm5zboGyjuj
         xiXbYse4u4lspxICGdwFoSJnimAKPH9t7zRnQDQW8WPi4wyKC0krVdWd13KBMiyv+DhV
         tGkrxZ40MfJwd4Lr2FtdiK4Xry/k1aMkbrYrvDxOIbrFCb21MfzkdR+Y3yrPBL3doNup
         HNodNXTQvpi96he9wdJBzTQ+W8tXGai00td8L16Y60jPGlr0S8WAO6W9cEdie+tNytDg
         p0gLpHsBcLU7bzgpwTJOf4gKriC6qyMz5jt0TVTDgfnStytrWmvjXQmq2q33yTVJkzs6
         QjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=xC4C9/OsVD/AQf669tiD8+AExqqPfAtMLzSY5twCvYo=;
        b=ZEPk7PpanxH+K5GJ19bzYQJiZiVdvo9q8xhmurkBp+OcS8ryNQrnHYptnksHU3DdLa
         /MM/EKgtsZtWTE+2aZ3nwRxoZcC/TKr9DWQniHCgQgfrMU0UDDAmXJs0TLzPwKrWUpvr
         7CteWBRJV0qhIhq8p7BxkOWhwsRnnUuhScs/ApjJtIqTkB37RZu5LZ7NyLOOcqxcKn0X
         FAwtiSaL0pMccyE2XHuqYLdx4BTlaqXawjOVsszLehAwExPPrb6RucjpozaksLH6RlND
         rXMAo+ARf59VPymvvG5efE9j4UEi+jUFJyYTZHpbtQ176qH2VQ2nuMssKuRQS6VDNce8
         hAiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h25si1094662qtn.224.2018.04.13.07.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 07:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zHN-00029A-7Z
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 10:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zH7-00026x-Oh
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:02:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zH1-0008Gs-RS
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:02:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35816 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6zH1-0008GX-Ll; Fri, 13 Apr 2018 10:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B84A4040856;
	Fri, 13 Apr 2018 14:01:55 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB4B215CDC8;
	Fri, 13 Apr 2018 14:01:50 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <57b01152-1179-9735-eb6a-a9dbfc933a6c@redhat.com>
Date: Fri, 13 Apr 2018 16:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 13 Apr 2018 14:01:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 13 Apr 2018 14:01:55 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along
 with KVM VGICv3
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
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lrhhMRwTfKTP

Hi Peter,

On 13/04/18 15:41, Peter Maydell wrote:
> On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
>> With KVM acceleration and if KVM VGICV3 supports to set multiple
>> redistributor regions, we now allow up to 512 vcpus.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c         | 17 ++++++++++++++++-
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 8258f6f..cdb1a75 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -149,8 +149,10 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>> +    /* Allows 512 - 123 additional vcpus (each 2x64kB) */
>> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x30A0000LL },
> 
> Maybe we should make the 2nd redist region go up to a slightly
> rounder address rather than making it exactly big enough to get
> us up to 512 CPUs? (Why 512, by the way?)
> 
>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>> -    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x8000000000ULL, 0x8000000000ULL },
>>  };
>>
>>  static const int a15irqmap[] = {
>> @@ -553,6 +555,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>          agcc->register_redist_region((GICv3State *)gicdev,
>>                                   vms->memmap[VIRT_GIC_REDIST].base,
>>                                   vms->memmap[VIRT_GIC_REDIST].size >> 17);
>> +        if (vms->smp_cpus > 123) {
>> +            agcc->register_redist_region((GICv3State *)gicdev,
>> +                     vms->memmap[VIRT_GIC_REDIST2].base,
>> +                                 vms->memmap[VIRT_GIC_REDIST2].size >> 17);
>> +        }
>>      } else {
>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>>      }
>> @@ -1284,6 +1291,14 @@ static void machvirt_init(MachineState *machine)
>>       */
>>      if (vms->gic_version == 3) {
>>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
>> +        if (kvm_max_vcpus(kvm_state) > 255) {
>> +            /*
>> +             * VGICv3 KVM device capability to set multiple redistributor
>> +             * was introduced at the same time KVM_MAX_VCPUS was bumped
>> +             * from 255 to 512
>> +             */
>> +            virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;
> 
> I think it would be better to explicitly check "do we have
> support for split redistributors" rather than looking at
> KVM_MAX_VCPUS. It's not impossible that a distro kernel
> might have chosen to backport support for one but not the
> other.

The issue is we have race here:
to check whether the new ATTR is supported I need to query the GICV3 KVM
device. This later is created in the GICv3 initialize. But to initialize
the VGIC I need the VCPUs to be created. And to create the VCPUs I need
to check their max number. Or do I miss somethinh?

The KVM device create dry-run mode cannot be used here. I would need to
really create the KVM device and then delete it. The issue is there is
no kvm device DELETE ioctl at kernel level since KVM devices are deleted
on VM deletion if I understand correctly. Adding a KVM device delete at
kernel level may not be straightforward as I suspect some
simplifications could be made in KVM device deletion knowing the VM was
under deletion.

Thanks

Eric
> 
>> +        }
>>      } else {
>>          virt_max_cpus = GIC_NCPU;
>>      }
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index d168291..801a4ad 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -60,6 +60,7 @@ enum {
>>      VIRT_GIC_V2M,
>>      VIRT_GIC_ITS,
>>      VIRT_GIC_REDIST,
>> +    VIRT_GIC_REDIST2,
>>      VIRT_UART,
>>      VIRT_MMIO,
>>      VIRT_RTC,
>> --
>> 2.5.5
> 
> thanks
> -- PMM
> 
