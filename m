Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp848511wrp;
        Wed, 11 Sep 2019 06:14:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLlgxuxngVfU3F7UUqzZhnP8ZEnTrAVj/6ZaCVGlIu0Bs0nSiOfXaF6FJXPwzrxTCNijhD
X-Received: by 2002:a37:591:: with SMTP id 139mr34634827qkf.162.1568207698495;
        Wed, 11 Sep 2019 06:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568207698; cv=none;
        d=google.com; s=arc-20160816;
        b=neVPL9LfIiG2KeZq/J5YlqF3JGfflBSaWd0WI/b6cgTyDB1pBLGtoMOJ0/d4b4vOEf
         bB3lIkRtomg2Fvijm3rHWfjk8Ipu45hyqjiNJhw9R65jeeSm3IAyO2CXWiOdJcw/hNJQ
         7TPkJjz0IzfKRnGGDSJrm/WNDtIwpyEuYq0llraYLyeWnTaCJlpXMZEIITjmJb3iVq84
         yjbaEOJMECbsdJiNllGXE61aPQubLbgs+IzZEjFsj3CvtN7rcDIO8V/zc5ni/p5JSLSe
         tUevIm5VACZM+WpqcFnNyJ0OYUMjwsFFB1LwR5zA4Vdc1aOuyS5sr29AVmL3peTEXAgF
         vsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Oy7f9StnlLT6Qm8ctDsdV8+w9AIEy+wJpQNNIYOcje8=;
        b=LNEdXlyP7Wg5mLMnQXMf5702Ks5rnzmjDtHwy7iR/i90cO52yPnpiuqW/pF1y+hx8+
         xXB2fdJ1JCCydCI0A4guCqjcLLO6OsuxuUYd2iZcP/OtSiFF8HhxkNCzhKU8TQNfWMs7
         jgcu3QUjk8I+cChkUyFSrBGmMZwAi54Pa6cR+Z0jGG6oHkv2L8XtaVfhLfOahzNTbNOM
         An7Zzk7OfyJF78bcn2LIiZWFuNvo92eAAzVpUuhO4Y/6JvYLs/lkTzIxeAIH1asKsQY2
         ZV8p0TlUwkSS1AFu32+jTVhwYNI5ghVGKIbSN0z7rDY1GFlo0E5MHpvsTERzBs7xMzYi
         D4jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s46si16132602qvs.131.2019.09.11.06.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 06:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i82SX-0001Po-Uv
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 09:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i82SQ-0001PP-07
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i82SO-0003FK-IF
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:14:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i82SO-0003F7-AZ; Wed, 11 Sep 2019 09:14:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 443AE368FF;
 Wed, 11 Sep 2019 13:14:47 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA4A5D9E2;
 Wed, 11 Sep 2019 13:14:41 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:14:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190911151439.5417fe38@redhat.com>
In-Reply-To: <20190904085629.13872-7-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-7-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 11 Sep 2019 13:14:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v10 06/11]
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
X-TUID: viYJHejSOTFO

On Wed, 4 Sep 2019 09:56:24 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Generate Memory Affinity Structures for PC-DIMM ranges.
> 
> Also, Linux and Windows need ACPI SRAT table to make memory hotplug
> work properly, however currently QEMU doesn't create SRAT table if
> numa options aren't present on CLI. Hence add support(>=4.2) to
> create numa node automatically (auto_enable_numa_with_memhp) when
> QEMU is started with memory hotplug enabled but without '-numa'
> options on CLI.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

this patch needs rebase (due changes in numa code)


> ---
> v8 --> v9
>  - Added auto_enable_numa_with_memhp support.
> ---
>  hw/arm/virt-acpi-build.c | 9 +++++++++
>  hw/arm/virt.c            | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5063f28812..a4872a0b00 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -519,6 +519,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i, srat_start;
>      uint64_t mem_base;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
>      srat_start = table_data->len;
> @@ -544,6 +545,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 29bc2837ce..95accc28f1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2053,6 +2053,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->plug = virt_machine_device_plug_cb;
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
>      mc->numa_mem_supported = true;
> +    mc->auto_enable_numa_with_memhp = true;
>  }
>  
>  static void virt_instance_init(Object *obj)
> @@ -2158,6 +2159,7 @@ static void virt_machine_4_1_options(MachineClass *mc)
>      virt_machine_4_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
>      vmc->no_ged = true;
> +    mc->auto_enable_numa_with_memhp = false;
>  }
>  DEFINE_VIRT_MACHINE(4, 1)
>  

