Received: by 10.223.150.237 with SMTP id u100csp3689663wrb;
        Tue, 14 Nov 2017 06:53:53 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbnD67C4OHZ/0xr93i/GE2LHoLrJuAIIEwfAZDLhUpiri3MW1K1LVNuvbDk5l2HXrrzwrei
X-Received: by 10.129.159.196 with SMTP id w187mr6246590ywg.129.1510671233005;
        Tue, 14 Nov 2017 06:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510671233; cv=none;
        d=google.com; s=arc-20160816;
        b=UEfz2Xvl6TWiQkwEEHRGejHH7+P8KWJazOQ3FcBOQG2kI2YQF8vJVO9o8GinS6r3Fr
         8Zwgt/4oZuj8XjFYA5wVD7WeHdsbCRvjuEPZ2N8/acRcfMHrqpVIIwnPGfzeB6PQFLMi
         qRnyIv7y9uFFXaf5MBdK4peUG+2rpWjOClrRoFD1vdZyaYoWCwmQeI0WlAccUaPECndd
         8t3MjfZblAB/z8PVlO0dVkbECoMDPE9UXbqWY3ld+zVN4reJi5WnmpEyhuexBuiC1PVu
         wgUQVTpd/8qArkMajIlK8AtxdeNegqPsZHk+qJ1aFKB2zYLiZZTQT4CSw9U/q1+XlAsi
         vRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=+nTiJzTgx/oLDcqsjlouMLs3VP4LLvDsge8bORghGpw=;
        b=cPvrNjpfEsBHonaR07K/GGgBrp0EEZ84/K+Tmw5Nr7CrlLB0Lm+mAKBodO8KHdWpFQ
         VqYQFtUI0Q7M2zpf0rwmCIVq+IM+nVNc+3X5zzEcut57KQyiHpPpNzZVjwkxZHO9hpkP
         pQOqtDpE6TzD4zQ+krg7JK0infpHsaZdMJadxDPYe80qnC6k+qeBNJ61HsgOBrXN2eSF
         U0AHoDZWXWcDABcTTwzn/3F9B2I8GtuSpANlIxWqlo+u5BkuxGb+vyDoaz4X6Aojgr6P
         dCSCmeRIzjHsrYm59m6Z/0KidHiSr6wNlCWC/qoidN6WQoVGnQDP8JsSys6WV581tz49
         p9mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w125si4023697yba.290.2017.11.14.06.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 06:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEcb2-0006Kh-Er
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 09:53:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcZO-0005Gr-3d
	for qemu-devel@nongnu.org; Tue, 14 Nov 2017 09:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcZM-000191-Py
	for qemu-devel@nongnu.org; Tue, 14 Nov 2017 09:52:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eEcZG-0000yi-Fg; Tue, 14 Nov 2017 09:52:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D29D916AB;
	Tue, 14 Nov 2017 14:52:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40B588B175;
	Tue, 14 Nov 2017 14:51:53 +0000 (UTC)
Date: Tue, 14 Nov 2017 15:51:50 +0100
From: Andrew Jones <drjones@redhat.com>
To: zhuyijun@huawei.com
Message-ID: <20171114145150.wydvirgrrcbicvz4@kamzik.brq.redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-6-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510622154-17224-6-git-send-email-zhuyijun@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 Nov 2017 14:52:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 5/5] hw/arm/virt-acpi-build: Build srat table
 according to mem_list
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wRV1sCkYQKnO

On Tue, Nov 14, 2017 at 09:15:54AM +0800, zhuyijun@huawei.com wrote:
> From: Zhu Yijun <zhuyijun@huawei.com>
> 
> In case of accessing memory holes, we build srat table by
> traversing mem_list.
> 
> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 40 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3d78ff6..e8dd7c9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -487,7 +487,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiSratProcessorGiccAffinity *core;
>      AcpiSratMemoryAffinity *numamem;
>      int i, srat_start;
> -    uint64_t mem_base;
> +    hwaddr region_offset = 0;       /* region base addr offset */
> +    hwaddr region_eat_size = 0;     /* region consumed size */
> +    hwaddr node_mem_size = 0;
> +    RAMRegion *begin_search_region = QLIST_FIRST(&vms->bootinfo.mem_list);
> +    RAMRegion *reg;
> +
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
> @@ -504,12 +509,37 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          core->flags = cpu_to_le32(1);
>      }
>  
> -    mem_base = vms->memmap[VIRT_MEM].base;
>      for (i = 0; i < nb_numa_nodes; ++i) {
>          numamem = acpi_data_push(table_data, sizeof(*numamem));
> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> -                          MEM_AFFINITY_ENABLED);
> -        mem_base += numa_info[i].node_mem;
> +        node_mem_size = numa_info[i].node_mem;
> +        QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
> +            if (reg->base != begin_search_region->base) {
> +                continue;
> +            }
> +
> +            if (node_mem_size >= (reg->size - region_offset)) {
> +                region_eat_size = reg->size - region_offset;
> +            } else {
> +                region_eat_size = node_mem_size;
> +            }
> +
> +            build_srat_memory(numamem, reg->base + region_offset,
> +                              region_eat_size, i, MEM_AFFINITY_ENABLED);
> +
> +            node_mem_size -= region_eat_size;
> +            region_offset += region_eat_size;
> +            begin_search_region = reg;
> +
> +            /* The region is depleted */
> +            if (reg->size == region_offset) {
> +                region_offset = 0;
> +                begin_search_region = QLIST_NEXT(reg, next);
> +            }
> +
> +            if (node_mem_size == 0) {
> +                break;
> +            }
> +        }
>      }
>  
>      build_header(linker, table_data, (void *)srat, "SRAT",
> -- 
> 1.8.3.1
> 
> 
>

Same pc-dimm assigning to NUMA node comment from last patch applies to this
one.

Thanks,
drew 
