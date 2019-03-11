Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp739249wrt;
        Mon, 11 Mar 2019 07:57:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxppO0RPlf6tdGox1wRs4u4uDjLObm00Oe745yvwI+atMyRYMWW7vBvOv+Zu9K/WVpDR4/c
X-Received: by 2002:a81:4985:: with SMTP id w127mr5487993ywa.368.1552316244923;
        Mon, 11 Mar 2019 07:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552316244; cv=none;
        d=google.com; s=arc-20160816;
        b=w+XnABg5/xWUQeUru69muZqnBb0q3OW8cBLAcOe0byZ0XwqQ7h4NsBHQSXKSGlHbxu
         /7Yn6GhgX6vwMEMEk0yuqlG9VwtR11UxN7G9649NOUX+SL/RA5waRtBbOYMSZvGkHvAw
         o5qtDaP4uF+TSrwOH1jKc5J6Tx8Ae0RrJag2lxRKHM+LINnXKD+W8TPgniDrjyF81DZU
         h8cT9xRmrAS4CJyMcvHE+Gq2tATSYxziF/vP850Ar66BbCj2h+vjxXkggRyeaL2bwAlx
         WfFk+PfTLMsN20+YlyHKAzKXmIwcBHuyQbXbfJsJlNTlPKcpZ3rEj0stYoEbjRLBMTTM
         JYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=G5dcqSQt6KqbfTfYXb3YcfyYy6VGE1hnCc3ghGCHIzE=;
        b=JG7YDsj2ObgK9Nk0JaE17Hk+y0sgBqCDXBfe+AsjROaC3BETVkS3JmJTC1KA6TfDhA
         qxyNA1+ni75XRHN1coTJhTSKuQBpfFdI2OkHzbV8lGCD99fTzm9ZKqBwJj3aDhMlG+J6
         VkZSO+1O1fNq7syjAD0yh5SBqwnQA+RNAn05hT+Bt2tJXSAoUIGKYIVSSF2tsWrD2CEE
         dxtUftu2VLrj2KJg6RtNWtLW77xmJcyv5l4pkVUlwJd0qvxjnPkBYhg2pp+12vhqsqQi
         s/XisJPmLTonDvBKYkLpHSvJ7sNfK1SJJ9xzdRwdlwhldx4PN5jAes750UtnAjzjWrow
         XNug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si3153299ywc.76.2019.03.11.07.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 07:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3MMm-0004mo-CJ
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 10:57:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3MMT-0004j8-U2
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 10:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3MKm-00016a-7K
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 10:55:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3MKl-00016T-U2; Mon, 11 Mar 2019 10:55:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10722C002962;
	Mon, 11 Mar 2019 14:55:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E1A15DD6B;
	Mon, 11 Mar 2019 14:55:14 +0000 (UTC)
Date: Mon, 11 Mar 2019 15:55:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190311155513.14320cd2@redhat.com>
In-Reply-To: <20190308114218.26692-8-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-8-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 11 Mar 2019 14:55:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, sebastien.boeuf@intel.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8V0CbVoRSb0k

On Fri, 8 Mar 2019 11:42:14 +0000
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
> index 87d66da..6cb7263 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -524,6 +524,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i, srat_start;
>      uint64_t mem_base;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
>      srat_start = table_data->len;
> @@ -549,6 +550,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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

do we care about 'Windows' guests?
if yes then we should drop this patch,
see commit for reasoning dbb6da8ba7e

>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>  }

