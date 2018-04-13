Received: by 10.28.71.155 with SMTP id m27csp768542wmi;
        Fri, 13 Apr 2018 06:38:08 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/gcB9ufCskDikt9lxjOqzfXrMEG6VZh/yerpSKSM0G6eEGFgfHdkM94hJAxv4rP5zMCE07
X-Received: by 10.129.152.17 with SMTP id p17mr4677959ywg.163.1523626688009;
        Fri, 13 Apr 2018 06:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523626688; cv=none;
        d=google.com; s=arc-20160816;
        b=JCyEmSSh2lco/wD/IOnu5ITpoRQVZLxvoToVK6ajDsc/M8cJ2MmHXMZ6Y4GU08spBZ
         33VsZ1AL9yeaJ6mZtIfW3qbt2Jdr+Rld1UZAT++j1l0ubKcAGi+lEinHcUo0ZaLZllDK
         h3KlKBWohwf+Urq3UT7/2CKhRzK27GnB6n4HX7oKLUfRzqFRC/ZcjSk+y/Bn3gfYQeD/
         sO5enahDOALo0kEz5Ru7kLYsrbHBzCYeRLaxaJx0uaXL9MGUhvD6vCbGbYv0Y2GsdIbd
         vzlrc6zBClIY+qy13N+aM41NGTSKMTmk3DfMVw0jX5/OfxUGw89HdovAtN2qgldojBs+
         VyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=d8onPAkl5oUjtyhJop0Qv7ylydomb2eICJhUfOy8UUs=;
        b=WHOI3FXDMaE4BKjPICVKScdYCZYvOtHRwF7Dt9hYsZSYouDzc5tuiTLE1My/cBG7J+
         M91enJh//tLcW22eoXQ4iFu+6VFP1j52afdnG13nEVk7ppMrLKaq9kTQn8WnSMLWbmCv
         BWsmM0eOpuD3EZLUrGuLEScvTlhrMIQkEyqRCZHuUW1o7gBC6zVzw73pUHtNDZfqSLCK
         0S6lZ6fxY5FKFYSMyyhypSp3oEQNEBXOyGLcU2s2iY/edL8TEmWhR59o/P/hOjF8dGkS
         77X8OsQ4V7nR3uucQHPmNEE1z612Ntz3MLuhkG/xLcu6pdfgCxPBYWlnZJcENQYRr1cc
         5PHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si27817qkd.298.2018.04.13.06.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6ytz-0000yw-GE
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:38:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6ysM-0008Fu-6z
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6ysH-0000bb-9C
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:36:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45788 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6ysH-0000az-20; Fri, 13 Apr 2018 09:36:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 009648DC3A;
	Fri, 13 Apr 2018 13:36:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F66010F1BF8;
	Fri, 13 Apr 2018 13:36:15 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9nkLs3CF0=52DYWygrprgxexrz1_vf0r5RVfNYMA4H5A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f25aa530-3464-cf3d-a8bb-a143a757be72@redhat.com>
Date: Fri, 13 Apr 2018 15:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nkLs3CF0=52DYWygrprgxexrz1_vf0r5RVfNYMA4H5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Apr 2018 13:36:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Apr 2018 13:36:20 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 2/8] hw/intc/arm_gicv3: Use an array of
 redistributor regions
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
X-TUID: b/dyWdw9yVkP

Hi Peter,

On 13/04/18 15:27, Peter Maydell wrote:
> On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
>> In the prospect to support multiple redistributor regions,
>> let's introduce a GICv3RDISTRegion struct datatype and a
>> statically sized array of those. For the time being, only
>> one redistributor region is used.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/intc/arm_gicv3_common.c         |  5 +++--
>>  hw/intc/arm_gicv3_kvm.c            |  3 ++-
>>  include/hw/intc/arm_gicv3_common.h | 13 ++++++++++++-
>>  3 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 7b54d52..cb4ee0e 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -199,11 +199,12 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>>
>>      memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
>>                            "gicv3_dist", 0x10000);
>> -    memory_region_init_io(&s->iomem_redist, OBJECT(s), ops ? &ops[1] : NULL, s,
>> +    memory_region_init_io(&s->redist_region[0].mr, OBJECT(s),
>> +                          ops ? &ops[1] : NULL, s,
>>                            "gicv3_redist", 0x20000 * s->num_cpu);
>>
>>      sysbus_init_mmio(sbd, &s->iomem_dist);
>> -    sysbus_init_mmio(sbd, &s->iomem_redist);
>> +    sysbus_init_mmio(sbd, &s->redist_region[0].mr);
>>  }
>>
>>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index ec37177..a07bc55 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -755,7 +755,8 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>
>>      kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>>                              KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
>> -    kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>> +    kvm_arm_register_device(&s->redist_region[0].mr, -1,
>> +                            KVM_DEV_ARM_VGIC_GRP_ADDR,
>>                              KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
>>
>>      if (kvm_has_gsi_routing()) {
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index bccdfe1..3cf132f 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -137,12 +137,20 @@ typedef struct GICv3CPUState GICv3CPUState;
>>  #define GICV3_S 0
>>  #define GICV3_NS 1
>>
>> +#define GICV3_MAX_RDIST_REGIONS 8
> 
> Where does 8 come from? Is it a limit in the kernel, or just
> a random number?
Kernel has no limit as the redist regions are handled through a list
there. 8 is purely arbitrate. I thought it was overkill to handle a list
here.
> 
>> +
>>  typedef struct {
>>      int irq;
>>      uint8_t prio;
>>      int grp;
>>  } PendingIrq;
>>
>> +typedef struct GICv3RDISTRegion {
> 
> "GICv3RedistRegion"
> 
>> +    hwaddr base;
>> +    uint32_t count; /* number or redistributors */
> 
> "of"
> 
>> +    MemoryRegion mr;
>> +} GICv3RDISTRegion ;
>> +
>>  struct GICv3CPUState {
>>      GICv3State *gic;
>>      CPUState *cpu;
>> @@ -210,7 +218,8 @@ struct GICv3State {
>>      /*< public >*/
>>
>>      MemoryRegion iomem_dist; /* Distributor */
>> -    MemoryRegion iomem_redist; /* Redistributors */
>> +    GICv3RDISTRegion redist_region[GICV3_MAX_RDIST_REGIONS];
>> +    uint32_t nb_redist_regions;
>>
>>      uint32_t num_cpu;
>>      uint32_t num_irq;
>> @@ -288,6 +297,8 @@ typedef struct ARMGICv3CommonClass {
>>
>>      void (*pre_save)(GICv3State *s);
>>      void (*post_load)(GICv3State *s);
>> +    /* register an RDIST region at @base, containing @pfns 64kB pages */
>> +    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t pfns);
> 
> "pfn" is a kernelism (and I can never remember what it means) -- can you
> use a more comprehensible variable name, please ?
In pratice it has become count (number of redistributors within the
region) but I forgot to update the declaration here, sorry.

Thanks

Eric
> 
>>  } ARMGICv3CommonClass;
>>
>>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>> --
> 
> thanks
> -- PMM
> 
