Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3338371wre;
        Tue, 29 May 2018 02:08:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJJ8u5uO2wRnrpu7hdDsD6uFJIdTqqX91E7eGZy1cXcxWLcwUpoeqVd3wDiXgfGBTV4Yjah
X-Received: by 2002:ac8:26b0:: with SMTP id 45-v6mr15326787qto.318.1527584911978;
        Tue, 29 May 2018 02:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527584911; cv=none;
        d=google.com; s=arc-20160816;
        b=el+QA/p0cw0ktd9YG6zEILail7hLWNARDA9FSMykYjdTsEJKVdbvDTK+B2Q9mT+6Ap
         o1QviJuXB4zbKQOWLlWqwzlGOcLDXx6VyxRudCekILHzNIs7CdoCVjkSLXmixJxyO2Io
         O5dexIZZY2yHXYo+aJWdfV0yE6E5FfoS4RwSFNNjLLe9/Yhw8Egseo+ug/7IZ/ZvA2n7
         01x+knfIGp6X0v1S1CrsdSIy0NDwjjrxt8Vegg4F/mDR0TuquBf1/jA9X/1+dmA+Fj8u
         FdOAmq3Hal1t0rZkd4PfmJKd5O8i7aAVWF5RtS/O+MKF/LE4R8ieaqB91zDzQBYe8pkA
         X2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=CtdgF1SyadIgmDQCaUw+yEO8UkClKHORoxwNgyeXeno=;
        b=wD4YaGLdlBhMWessVg4UNlAyooocLfBRxcCn7Y18vauUOXvrgJXwBJccF/5pQGsT+g
         dJMXNl4pCt8BUD3gZ99b+m53UajoGa5iybN8o5iBD7hnW46l0/DAfji4W7xFGu2hH0D0
         3+VLthMT82rooTZRo+2nUOiWN18miY0afMdQ2y5L1/xu7rV+XeiSyIP04u7SS8mlSbto
         tqNYQMFhSDbXcElCscio/veb3jok5KavMp/85GEbCJ5o6ASads6T95mEHjGJfhT8b+tz
         +RpEfDdzRWUWgLaTddDE1Gqm2L2hvpaX+9fbFcXiLe8JvJBLIXlCU9JnTfUVUV1DcnfN
         VVWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l126-v6si6297988qkb.226.2018.05.29.02.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 02:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNacJ-0000lj-GT
	for alex.bennee@linaro.org; Tue, 29 May 2018 05:08:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNac8-0000gE-R0
	for qemu-arm@nongnu.org; Tue, 29 May 2018 05:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNac2-0003Mf-T1
	for qemu-arm@nongnu.org; Tue, 29 May 2018 05:08:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38328 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNac2-0003LP-N3; Tue, 29 May 2018 05:08:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AC4B7C6C4;
	Tue, 29 May 2018 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF23311166EC;
	Tue, 29 May 2018 09:08:09 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8yo_NKY=mHNYFFTA1+eR-731ePUb5hDum0ubUM2XOxxg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <929ce9c7-afae-7978-ed35-3789fcbf026a@redhat.com>
Date: Tue, 29 May 2018 11:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8yo_NKY=mHNYFFTA1+eR-731ePUb5hDum0ubUM2XOxxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 29 May 2018 09:08:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 29 May 2018 09:08:13 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v2 3/7] hw/intc/arm_gicv3: Introduce
 redist-region-count array property
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5VBprAvwFcF

Hi Peter,
On 05/22/2018 02:27 PM, Peter Maydell wrote:
> On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
>> To prepare for multiple redistributor regions, we introduce
>> an array of uint32_t properties that stores the redistributor
>> count of each redistributor region.
>>
>> Non accelerated VGICv3 only supports a single redistributor region.
>> The capacity of all redist regions is checked against the number of
>> vcpus.
>>
>> Machvirt is updated to set the count to 123 vcpus for the unique
>> redistributor region we currently have.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c                      |  6 ++++++
>>  hw/intc/arm_gicv3.c                | 11 ++++++++++-
>>  hw/intc/arm_gicv3_common.c         | 35 ++++++++++++++++++++++++++++++-----
>>  hw/intc/arm_gicv3_kvm.c            |  9 +++++++--
>>  include/hw/intc/arm_gicv3_common.h |  6 ++++--
>>  5 files changed, 57 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 11b9f59..c9d842d 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -525,6 +525,12 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>      if (!kvm_irqchip_in_kernel()) {
>>          qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
>>      }
>> +
>> +    if (type == 3) {
>> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
>> +        qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
>> +                             vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
> 
> We used to create a region which had num_cpu redistributors in it;
> won't this cause us to create one which has as many redistributors
> as will fit in the space ?
Is that an issue? From a machine perspective the whole region is
reserved for rdist. dt and ACPI will expose this whole region and the
device will use a subset of it? I agree I need to document this change
in the commit message though.
> 
>> +    }
>>      qdev_init_nofail(gicdev);
>>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>>      sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
>> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
>> index 479c667..38d57ac 100644
>> --- a/hw/intc/arm_gicv3.c
>> +++ b/hw/intc/arm_gicv3.c
>> @@ -373,7 +373,16 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>
>> -    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
>> +    if (s->nb_redist_regions != 1) {
>> +        error_setg(errp, "VGICv3 redist region number(%d) not equal to 1",
>> +                   s->nb_redist_regions);
> 
> Missing 'return' ?
yes!
> 
>> +    }
>> +
>> +    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>
>>      gicv3_init_cpuif(s);
>>  }
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 7b54d52..f405ae1 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -169,9 +169,10 @@ static const VMStateDescription vmstate_gicv3 = {
>>  };
>>
>>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>> -                              const MemoryRegionOps *ops)
>> +                              const MemoryRegionOps *ops, Error **errp)
>>  {
>>      SysBusDevice *sbd = SYS_BUS_DEVICE(s);
>> +    int rdist_capacity = 0;
>>      int i;
>>
>>      /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
>> @@ -199,11 +200,25 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>>
>>      memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
>>                            "gicv3_dist", 0x10000);
>> -    memory_region_init_io(&s->iomem_redist, OBJECT(s), ops ? &ops[1] : NULL, s,
>> -                          "gicv3_redist", 0x20000 * s->num_cpu);
>> -
>>      sysbus_init_mmio(sbd, &s->iomem_dist);
>> -    sysbus_init_mmio(sbd, &s->iomem_redist);
>> +
>> +    s->iomem_redist = g_new0(MemoryRegion, s->nb_redist_regions);
>> +    for (i = 0; i < s->nb_redist_regions; i++) {
>> +        char *name = g_strdup_printf("gicv3_redist_region[%d]", i);
>> +
>> +        memory_region_init_io(&s->iomem_redist[i], OBJECT(s),
>> +                              ops ? &ops[1] : NULL, s,
>> +                              name, 0x20000 * s->redist_region_count[i]);
>> +        sysbus_init_mmio(sbd, &s->iomem_redist[i]);
>> +        rdist_capacity += s->redist_region_count[i];
>> +        g_free(name);
>> +    }
>> +    if (rdist_capacity < s->num_cpu) {
>> +        error_setg(errp, "Capacity of the redist regions(%d) "
>> +                   "is less than number of vcpus(%d)",
>> +                   rdist_capacity, s->num_cpu);
> 
> It would be better to make this check before we create a lot of
> memory regions, I think. (Though I'm very unsure of the rules about
> how to unwind what you've done in a realize method that's about to fail;
> we probably get it wrong a lot and don't care because realize failure
> is fatal for most uses of most devices.)
I moved the rdist_capacity computation and check at the beginning of the
function. Anyway if the num_cpu rdists cannot fit in the rdist regions,
this is fatal. virt calls qdev_init_nofail(gicdev);

Thanks

Eric
> 
>> +    }
>> +
>>  }
>>
>>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
> 
> thanks
> -- PMM
> 
