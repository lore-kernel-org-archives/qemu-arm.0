Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2032359wrx;
        Mon, 18 Feb 2019 00:16:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbnsmDexISpJJf0yGhiAmzFJWPvyz14Wvd2hQ0SCGVithRE3QrJeb2A9UZahr5eHuSwVtX/
X-Received: by 2002:a25:2c2:: with SMTP id 185mr18788429ybc.322.1550477764634;
        Mon, 18 Feb 2019 00:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550477764; cv=none;
        d=google.com; s=arc-20160816;
        b=h5DvvyWUpc3FqEsTP0/xFbisGYHrEOvSW0VjhBD4q+9IozDfjEKBd4H4WmGhxUGryv
         PAvV0oWCnVkcF+7hp3AkfbrOi5Qpljf/GCC1+9WSg7j4xG01SpM9agL9r/YNpzTmHoXW
         ag5AtEzB6sPqu7vwPo4zq/e/VUCFaAgDiEfV5yGcsDs1RgVi9EuUInnxkcPpWNZ5wvHG
         yjBtvECRhL/t5jgCUpfmssfc7OleDeo+zmtgcah5yQDUCNYsJlo1DcEoq2PQaMYsHWQb
         E96RgdGyiQCQyNVK8dMYRS4/wiuQ+M5FO6j92+ClLd5R19MCgZfBTsN5o2785WNE8KpG
         1reg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=o/tIiqE8HxaoOtf+oH2Gf9eYnyIXIo3XLO5kb1T9BuI=;
        b=NI7mTeX6d3exqR+qOrBVDJ370d825zycl2KeYQb2f9BPQkQNkyc5qXZSuJ4f2evVhJ
         7da9SA0sYtn9XqgrNQADJujlCbXC1XghBze3ofweg5JZAngUyiJujiQIgyQtwnv7N2WL
         Rjw3ACd1NzUfka2X/jfoSqFTMlk9EiCBLF5G4TRTIrS3j602M4KXcd2413oqXhQqkHuZ
         +zuGMMeeEYOwTy5rmgCalVecN/WQfjsXe8kQvnZJacp3OjyvkIgiVQ0imqT6ENXW0fzM
         Gg2ztXqvKfBq2okY/2nzHcGd2UtLlRGwz3lbKTQBoWfzyk7cSCQLc9MeYyrlrkrwLKBK
         uIfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si7427163ywc.459.2019.02.18.00.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 00:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gve5s-0004Wj-3H
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 03:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gve5j-0004WP-Ue
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 03:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gve5i-00059W-3D
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 03:15:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gve5a-0004vV-0D; Mon, 18 Feb 2019 03:15:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9D2EC0AC937;
	Mon, 18 Feb 2019 08:15:34 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-41.ams2.redhat.com
	[10.36.112.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E47EB61498;
	Mon, 18 Feb 2019 08:14:59 +0000 (UTC)
Date: Mon, 18 Feb 2019 09:14:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190218091439.198d3aad@Igors-MacBook-Pro.local>
In-Reply-To: <20190205173306.20483-14-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-14-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 18 Feb 2019 08:15:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 13/18] hw/arm/virt-acpi-build: Add PC-DIMM
 in SRAT
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8so/VfwbMXEi

On Tue,  5 Feb 2019 18:33:01 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> Generate Memory Affinity Structures for PC-DIMM ranges.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v5 -> v6:
> - fix mingw compil issue
> 
> v4 -> v5:
> - Align to x86 code and especially
>   "pc: acpi: revert back to 1 SRAT entry for hotpluggable area"
> 
> v3 -> v4:
> - do not use vms->bootinfo.device_memory_start/device_memory_size anymore
> 
> v1 -> v2:
> - build_srat_hotpluggable_memory movedc to aml-build
> ---
>  hw/arm/virt-acpi-build.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 829d2f0035..781eafaf5e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -516,6 +516,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i, srat_start;
>      uint64_t mem_base;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
>      srat_start = table_data->len;
> @@ -541,6 +542,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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

