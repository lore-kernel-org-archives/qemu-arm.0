Received: by 10.28.71.155 with SMTP id m27csp774699wmi;
        Fri, 13 Apr 2018 06:44:33 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48PHRFOInfbZfEhzS8JhRf8+KZsjeKZehWCL+MJwbBCtomU2423MZ9SigiUHZVmGuu3Mz03
X-Received: by 10.200.114.194 with SMTP id o2mr570018qtp.112.1523627072984;
        Fri, 13 Apr 2018 06:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627072; cv=none;
        d=google.com; s=arc-20160816;
        b=QWWo2JRgU/MS/VxcIDJzFxr0Vj3v1c+kFZPBpmEPH0ta4lWX60N/xrkvEs+seGN/Kg
         CZwqmPmIkOZhqFSCt9o9S+ugiv7AXC5cvijhsA2GaRdXua23a5jUDPyK45FTTbVRABOL
         xpQ7y85zAHQBUioA6LMgy5uaysd4cKnzpRaqKggA/g/jsnBwtKJZu6acUGNkurTcqeYo
         y7Bq5U4ffFDAi1l/VYB9QiZKgsMtod8KbCrirRIo/36y/E2YL8sr3uS07xglj5pEwNah
         0yqjnMgpBSesU8oMdHkJquhjAfvOpf1W4ELOQtLB62mRedz+b6azRPqMycuIcEnHT6li
         aauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=oYHCzkYVfO2unzn3SrI038mSgws/guWYooKBQVEUuSE=;
        b=utnSXRQ6v6EWsO5B76x79qg87j58y6NCndsaxFkSP8F3nwLnskuTKaG7EPQZOKABqC
         Bo242jCqL4RZrl7PPBMS9uTTLZQ2SYiMSD/yIl2ftT6wltIk45kzmHh45ujHMheBJcSb
         RKmnjXPT9bM5iFZIvjh6MC2Cjgl03t2/ig8YONmD3HGQHQaOSLtKbky9iC/dxd+cHdI2
         LCu3VpIUHYleU3FI6rOWwEP7kPnaKZA2VPnQnqmnzIb0+/1YT+y56uvh4BU3ZI2Qx7Ki
         fmv0s3GQEDCEBPJFn3koMG29yPjprPcB3wIGQn83ppkau46D9kYuhPJiLTbl4Hle/tAg
         BSWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k21si1984149qta.10.2018.04.13.06.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6z0C-0006Tf-Gq
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:44:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6z03-0006Sy-U3
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6yzz-0005gY-1D
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:44:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35178 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6yzy-0005gL-SG; Fri, 13 Apr 2018 09:44:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6017B4040856;
	Fri, 13 Apr 2018 13:44:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F18A215CDC8;
	Fri, 13 Apr 2018 13:44:16 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8sQSuVcYPyE58tjapxxe6FNdD5qcyftYrZeWQ0fbev8w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e2fcd39f-f7f9-f8a2-7ef2-68a626e6bd0f@redhat.com>
Date: Fri, 13 Apr 2018 15:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8sQSuVcYPyE58tjapxxe6FNdD5qcyftYrZeWQ0fbev8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 13 Apr 2018 13:44:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 13 Apr 2018 13:44:18 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 4/8] hw/intc/arm_gicv3: Implement
 register_redist_region API
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
X-TUID: b1x8zRtTuIOv

Hi Peter,
On 13/04/18 15:34, Peter Maydell wrote:
> On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
>> This patch defines and implements the register_redist_region() API
>> for both arm_gicv3 and arm_gicv3_kvm. Virt machine now directly calls
>> the function to set the single redistributor region. The associated
>> memory region init is removed from gicv3_init_irqs_and_mmio.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c                      |  6 +++++-
>>  hw/intc/arm_gicv3.c                | 21 +++++++++++++++++++++
>>  hw/intc/arm_gicv3_common.c         | 10 ++++++----
>>  hw/intc/arm_gicv3_kvm.c            | 38 +++++++++++++++++++++++++++++++++++---
>>  include/hw/intc/arm_gicv3_common.h |  5 +++--
>>  5 files changed, 70 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 94dcb12..0eef6aa 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -526,7 +526,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>>      sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
>>      if (type == 3) {
>> -        sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
>> +        ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_GET_CLASS(gicdev);
>> +
>> +        agcc->register_redist_region((GICv3State *)gicdev,
>> +                                 vms->memmap[VIRT_GIC_REDIST].base,
>> +                                 vms->memmap[VIRT_GIC_REDIST].size >> 17);
> 
> What is this magic number 
I meant size / (64kB *2) to match the # of redistributors within the region
> 
>>      } else {
>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>>      }
>> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
>> index 479c667..37f7564 100644
>> --- a/hw/intc/arm_gicv3.c
>> +++ b/hw/intc/arm_gicv3.c
>> @@ -378,6 +378,26 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>>      gicv3_init_cpuif(s);
>>  }
>>
>> +static int arm_gicv3_register_redist_region(GICv3State *s, hwaddr base,
>> +                                            uint32_t count)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
>> +
>> +    if (s->nb_redist_regions > 0) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    s->redist_region[s->nb_redist_regions].base = base;
>> +    s->redist_region[s->nb_redist_regions].count = count;
>> +    memory_region_init_io(&s->redist_region[s->nb_redist_regions].mr, OBJECT(s),
>> +                          gic_ops, s, "gicv3_redist", 0x20000 * count);
>> +    sysbus_init_mmio(sbd, &s->redist_region[s->nb_redist_regions].mr);
>> +    sysbus_mmio_map(sbd, 1, base);
> 
> Devices should never call sysbus_mmio_map() -- they should
> just provide sysbus MMIO regions, and let the board code map
> them in the right places. More generally the device code
> shouldn't be told where in the memory map it is. kvm_arm_register_device()
> goes to some lengths to maintain this abstraction (by setting
> up a notifier to tell the kernel where things are only once
> everything has been created and mapped).
> 
> Similar remarks apply to other changes in this patch (and
> I suspect will need some restructuring to address).

Actually this is an API provided to the machine and not the device
itself directly playing with the mapping.

If not acceptable, I need to match the existing notifier framework and
do something similar taking into account the new GROUP/ATTR address
semantics here.
> 
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index 3cf132f..549ccc3 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -220,6 +220,7 @@ struct GICv3State {
>>      MemoryRegion iomem_dist; /* Distributor */
>>      GICv3RDISTRegion redist_region[GICV3_MAX_RDIST_REGIONS];
>>      uint32_t nb_redist_regions;
>> +    bool support_multiple_redist_regions;
>>
>>      uint32_t num_cpu;
>>      uint32_t num_irq;
>> @@ -297,8 +298,8 @@ typedef struct ARMGICv3CommonClass {
>>
>>      void (*pre_save)(GICv3State *s);
>>      void (*post_load)(GICv3State *s);
>> -    /* register an RDIST region at @base, containing @pfns 64kB pages */
>> -    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t pfns);
>> +    /* register an RDIST region at @base, containing @count redistributors */
>> +    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t count);
> 
> This looks like a change that should have been folded into a
> previous patch.
definitively

Thanks

Eric
> 
>>  } ARMGICv3CommonClass;
>>
>>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>> --
>> 2.5.5
> 
> thanks
> -- PMM
> 
