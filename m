Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6966546wrw;
        Thu, 15 Nov 2018 04:50:42 -0800 (PST)
X-Google-Smtp-Source: AJdET5ej8pgK2V7b+Un4nzXM3lnxj9tdAPYmPtO6fkJmp2GR1aMawEj7ya63R2WTnnyyPgMKmqXy
X-Received: by 2002:a37:611:: with SMTP id 17mr5789702qkg.123.1542286242551;
        Thu, 15 Nov 2018 04:50:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542286242; cv=none;
        d=google.com; s=arc-20160816;
        b=XN/dPIDsLZNj94g4LCoDxv/vEY2eEV1VhP7Fd/fV6wb9H727mhDdsGgRQ4N8M/H08v
         /lBetmam40ZbWvhjr9+ZuxcZe1T2SAW1GbCEC+wyVk7AqCsWBnjJ/m9cTw+hIRg8MC0y
         bC0QDH4rF1mCeNJiJQFvyZe2ThgbKeQql5HFYuqkML854cTlcaTqHGjuo1oO8BZXBWDj
         8e6DMTBQc2bknG1CbylWLmgpEBLL07i7zN5FRXJ/5bBnwySJ7DITAScsNrEprg/uWX+J
         eLq9OLvZ2noTzKMYj8r/djRjx5Zw6Ugdfqqc1xTmsfq0mjhRgU+AurdRCK9nRYqtwYKP
         to7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=H+q5J11Ci8FHn8PWTYDuwv5eyLAMcFw6YoJYjQ/GdvI=;
        b=Q/nfvvjiKl7T7QY8D7aR2gxZbJjhOLH2YQXWd8o4smFfaRKndsN7pBLqdKiAEC9TE2
         lpgx+vhRTrp/F6ovwg0Ixwr/xHikBWjwqoHbBuK0KzYhAqThlkmSLQ+52LKrsxpoz8Pr
         yR+RUcDqNctswPRlo5mmOyOGWRLFwUg2Z6UEPYUM5UP44z9HZDsD0lGntRGPI6LY2fKs
         N8CwKDZSJXQJHdwSNczvuvi7uRR6aoXk9JXaszDprzYLatGu5uAZA3swbE1wom6FK88w
         AAMfII/vbyRbJrMKhh8zqvjzJ6l0H8EqOCY+nC4jcTWVXrli6LFs/fRqEzPeCETnrRyA
         pmnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si1010703qve.150.2018.11.15.04.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 04:50:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNH6X-00031R-WF
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 07:50:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNH6I-00030Z-J5
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 07:50:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNH63-0004uK-LT
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 07:50:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3500)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNH62-0004tT-A8; Thu, 15 Nov 2018 07:50:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D00E7300C231;
	Thu, 15 Nov 2018 12:50:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55ED7105B212;
	Thu, 15 Nov 2018 12:49:51 +0000 (UTC)
Date: Thu, 15 Nov 2018 13:49:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181115134949.7767589d@redhat.com>
In-Reply-To: <20181105014047.26447-15-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-15-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 15 Nov 2018 12:50:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 14/24] hw: i386: Make the hotpluggable
 memory size property more generic
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5ejYlWnipye

On Mon,  5 Nov 2018 02:40:37 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> This property is currently defined under i386/pc while it only describes
> a region size that's eventually fetched from the AML ACPI code.
> 
> We can make it more generic and shareable across machine types by moving
> it to memory-device.h instead.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
not sure it belong to this series, but regardless where it end-ups

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/pc.h           | 1 -
>  include/hw/mem/memory-device.h | 2 ++
>  hw/i386/acpi-build.c           | 2 +-
>  hw/i386/pc.c                   | 3 ++-
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index bbbdb33ea3..44cb6bf3f3 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -62,7 +62,6 @@ struct PCMachineState {
>  };
>  
>  #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
> -#define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
>  #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>  #define PC_MACHINE_VMPORT           "vmport"
>  #define PC_MACHINE_SMM              "smm"
> diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
> index e904e194d5..d9a4fc7c3e 100644
> --- a/include/hw/mem/memory-device.h
> +++ b/include/hw/mem/memory-device.h
> @@ -97,6 +97,8 @@ typedef struct MemoryDeviceClass {
>                               MemoryDeviceInfo *info);
>  } MemoryDeviceClass;
>  
> +#define MEMORY_DEVICE_REGION_SIZE "memory-device-region-size"
> +
>  MemoryDeviceInfoList *qmp_memory_device_list(void);
>  uint64_t get_plugged_memory_size(void);
>  void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d8bba16776..1ef1a38441 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1628,7 +1628,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
>      ram_addr_t hotplugabble_address_space_size =
> -        object_property_get_int(OBJECT(machine), PC_MACHINE_DEVMEM_REGION_SIZE,
> +        object_property_get_int(OBJECT(machine), MEMORY_DEVICE_REGION_SIZE,
>                                  NULL);
>  
>      srat_start = table_data->len;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 090f969933..c9ffc8cff6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -67,6 +67,7 @@
>  #include "hw/boards.h"
>  #include "acpi-build.h"
>  #include "hw/mem/pc-dimm.h"
> +#include "hw/mem/memory-device.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "qapi/visitor.h"
> @@ -2443,7 +2444,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      nc->nmi_monitor_handler = x86_nmi;
>      mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
>  
> -    object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
> +    object_class_property_add(oc, MEMORY_DEVICE_REGION_SIZE, "int",
>          pc_machine_get_device_memory_region_size, NULL,
>          NULL, NULL, &error_abort);
>  

