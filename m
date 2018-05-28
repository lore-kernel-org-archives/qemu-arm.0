Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2675796wre;
        Mon, 28 May 2018 10:02:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIJm88Xg4jhoySjPxwb0AObde1k51PMvofZfSKNd7TxaBqeeWVPiiMpramLlj9mm8YdB/rN
X-Received: by 2002:a37:7346:: with SMTP id o67-v6mr4396045qkc.137.1527526968644;
        Mon, 28 May 2018 10:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527526968; cv=none;
        d=google.com; s=arc-20160816;
        b=nYS/AD2C+icx3/m186AGcVX1c8ooel+zgk0cGXOfa8WXF461n2jhSGeyLXhjYyUkTV
         c93IItbrO7YLURbZ0340mbPTUAEME03pK7SIdb+Khcot/SYOThr8CONWVdvE0ojfrLkT
         mn+ps3ap8wHhAofYpDmuwq5gL2E6KFgbTZDW5Euc4u4BCx8Bt/GKcfpsKvtUK3jSgsaH
         IFxv5m6g7WeokTBPTL+SPmifHrcV7NfRRAjsvsRFx3zz8wZgXi7oh9aagnEgg5x+Ol7j
         ygWfmZ59SFNw0npJnph0HP6vk4u+Dp4SVc8zp6RNwMR3JVmzcPk0M9Jcxm1r3TfZLFM7
         3k/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=+8LqV6Y+x0k9GNqa1oo6QYBGArHpJ5uLrtnZE8IdObE=;
        b=SO2aEd6GpVs4bV5u8Aq/t5Y2t8PRuMW2V8xvqTsJnvtUP2rG7bFsnR57CU//pqxYgc
         njMx1sjuvyut2PsC0r2U85VkDrH5j9t23heqOb7uKg0Jq01LMWBdi80JB7mFqpGFFHm+
         9b0MuRHme6qHULN5VvUv/whQMWol5C/BXbe4c9P8GM+Vj7miojyam31l94gl9xLVuyDJ
         mjo3K+yYWBRBJQkmTu71HpdrfFpCq21cJCmTrYI+XW2qA/kmF31OXTApCZ0VH45tgbG0
         fIaiatUCgQqqtheT+AAwxqF0k+8BgQhk8W5TOurMDgVxq4JhtSxwcVNCw/aYEHjihHiT
         Zj+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si2835215qtb.265.2018.05.28.10.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 10:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNLXk-0003sN-6R
	for alex.bennee@linaro.org; Mon, 28 May 2018 13:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fNLXW-0003s3-G8
	for qemu-arm@nongnu.org; Mon, 28 May 2018 13:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fNLXT-0006Re-5T
	for qemu-arm@nongnu.org; Mon, 28 May 2018 13:02:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55674 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fNLXS-0006RH-Vz; Mon, 28 May 2018 13:02:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43B094070481;
	Mon, 28 May 2018 17:02:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B17502026609;
	Mon, 28 May 2018 17:02:28 +0000 (UTC)
Date: Mon, 28 May 2018 19:02:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20180528170226.3ynif3r34yejf7tp@kamzik.brq.redhat.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 28 May 2018 17:02:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 28 May 2018 17:02:30 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes
 to accommodate non-contiguous mem
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
Cc: peter.maydell@linaro.org, zhaoshenglong@huawei.com, linuxarm@huawei.com,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KkhDW9pj1Gcg

On Wed, May 16, 2018 at 04:20:25PM +0100, Shameer Kolothum wrote:
> This is in preparation for the next patch where initial ram is split
> into a non-pluggable chunk and a pc-dimm modeled mem if  the vaild
> iova regions are non-contiguous.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c7c6a57..8d17b40 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -488,7 +488,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiSratProcessorGiccAffinity *core;
>      AcpiSratMemoryAffinity *numamem;
>      int i, srat_start;
> -    uint64_t mem_base;
> +    uint64_t mem_base, mem_sz, mem_len;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
> @@ -505,12 +505,28 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          core->flags = cpu_to_le32(1);
>      }
>  
> -    mem_base = vms->memmap[VIRT_MEM].base;
> +    mem_base = vms->bootinfo.loader_start;
> +    mem_sz = vms->bootinfo.loader_start;

mem_sz = vms->bootinfo.ram_size;

Assuming the DT generator was correct, meaning bootinfo.ram_size will
be the size of the non-pluggable dimm.


>      for (i = 0; i < nb_numa_nodes; ++i) {
>          numamem = acpi_data_push(table_data, sizeof(*numamem));
> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> +        mem_len = MIN(numa_info[i].node_mem, mem_sz);
> +        build_srat_memory(numamem, mem_base, mem_len, i,
>                            MEM_AFFINITY_ENABLED);
> -        mem_base += numa_info[i].node_mem;
> +        mem_base += mem_len;
> +        mem_sz -= mem_len;
> +        if (!mem_sz) {
> +            break;
> +        }
> +    }
> +
> +    /* Create table for initial pc-dimm ram, if any */
> +    if (vms->bootinfo.dimm_mem) {
> +        numamem = acpi_data_push(table_data, sizeof(*numamem));
> +        build_srat_memory(numamem, vms->bootinfo.dimm_mem->base,
> +                          vms->bootinfo.dimm_mem->size,
> +                          vms->bootinfo.dimm_mem->node,
> +                          MEM_AFFINITY_ENABLED);
> +
>      }
>  
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
> -- 
> 2.7.4
> 
> 
> 
