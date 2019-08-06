Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5257695wrv;
        Tue, 6 Aug 2019 06:21:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykdQXDg94xZT5PaO592sW4Tmbllu+wC1lVOAt+btWtExT/5hvZRcY13TFUN2uDcP9Z8MAH
X-Received: by 2002:a17:906:3497:: with SMTP id g23mr3205343ejb.70.1565097712369;
        Tue, 06 Aug 2019 06:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565097712; cv=none;
        d=google.com; s=arc-20160816;
        b=G2ujpdGGzJvqSNWBM18QtZ89VcXS81JYqzcY6fXu5tg2rlZEUoEm1kZnD0gXbEiiR8
         NQ/W5bzhrofzFuqbbKqpdAXf6lNgp6GLFThEAF523m+pCJEVJdDzLQvv2ss5VHVeg/uU
         psjx41xiPzAm0KLPszhN1d+1ueQBv1RkmNU+djxzS22gkv/Jd5NQkBjcHXORfpao8DiY
         f0NSOO6nTJ5i/URwBie97sBTtisjYYopZBxtGfo70Aq3pupgoJu39BmG3ZWvSZ/gqNc3
         S8f4vAeCWUPDxuEVLr7BZaNz2kfTOzZa/cuu/rPu6tgfR5I1GrodAx/vQkGN4olWbE0G
         MhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=W4w5HcQm8a40iTitjFzOPqUv0BqFpYieDaeBIhezv6A=;
        b=ktQn4p2gSbER+Vv9/eH/Ve0ZVmtpCOzu2IVbZqPmORxmIFlS+Ny3rZkM1/uEpAK3Tv
         IROWXgtOrXSKRn43ui/3hknasw/aSay7BIXqLlzt8TXxJzdpmP1/C+baHBdbIpCRBtqB
         QFF+gg5v0+inK+rTLjvECeS3lKN6trQBZhAKOD/nwcptHXIMZtvSIu4+xOan8ZfeRO8o
         H40wn4fraRixj9UJYLEiTtMl++ue8cheDj0Y3SN1kYIBryAXHVVUnL8BELygThdgizRk
         TiTfqLSkuRLEruNRz7qMWhspyGUoDxSMWCy9hYE8RAZ5D4v3vyKsko6/TuRDLJHMRlu1
         mqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21si27800946ejr.112.2019.08.06.06.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 06:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1huzPT-0003Lq-Gu
	for alex.bennee@linaro.org; Tue, 06 Aug 2019 09:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1huzPN-0003LX-Pl
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 09:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1huzPM-0001vW-Lb
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 09:21:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1huzPM-0001v9-Fx; Tue, 06 Aug 2019 09:21:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C115B8E92E;
 Tue,  6 Aug 2019 13:21:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2761419C78;
 Tue,  6 Aug 2019 13:21:38 +0000 (UTC)
Date: Tue, 6 Aug 2019 15:21:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190806152136.3afbfb4b@redhat.com>
In-Reply-To: <20190726104519.23812-8-shameerali.kolothum.thodi@huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-8-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 06 Aug 2019 13:21:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v8 7/9]
 hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AzAQ8hSduVtZ

On Fri, 26 Jul 2019 11:45:17 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Generate Memory Affinity Structures for PC-DIMM ranges.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 018b1e326d..75657caa36 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -518,6 +518,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i, srat_start;
>      uint64_t mem_base;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
>      srat_start = table_data->len;
> @@ -543,6 +544,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>      }
>  
> +    if (ms->device_memory) {
> +        numamem = acpi_data_push(table_data, sizeof *numamem);
> +        build_srat_memory(numamem, ms->device_memory->base,
> +                          memory_region_size(&ms->device_memory->mr),
> +                          nb_numa_nodes - 1,
> +                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
> +    }
> +
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>  }

missing entry in
  tests/bios-tables-test-allowed-diff.h

PS:
I don't really know what ARM guest kernel expects but on x86 we had to enable numa
for guest to figure out max_possible_pfn
(see: in linux.git: 8dd330300197 / ec941c5ffede).

It's worth to check if we might need a patch for turning on NUMA
(how to do it in QEMU see: auto_enable_numa_with_memhp)
