Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2086905wrx;
        Mon, 18 Feb 2019 01:32:39 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZFbHjY4Ry+2U4ftIwzcDu6tvRugh7fsBsJcBKv08lCpE+taQKNecAu8fZLAAOf4QurFdyQ
X-Received: by 2002:a25:8b8f:: with SMTP id j15mr18149385ybl.373.1550482359062;
        Mon, 18 Feb 2019 01:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550482359; cv=none;
        d=google.com; s=arc-20160816;
        b=aolMsWSZ8BFGS367mlFH+CfNfcv5CpBoaePvKJ3/5jwBtpvX5SNzU1igmLD6W8pBLR
         dB/NSf7wGEozjHwZDUKG4OoZaUwQ0/4SLZjBNWrLeTrmjjG61HlD8IzUBBzj3abklvxz
         oj4cLi7yFPmIuzKCa9ds6znYY35OLqkZTaaYJ04wBTAoWhplGgmJ3nlyXhAk10yvzzp0
         a16ilRrAjO3bB73fBxtBVsWJLoaQJQ9rKVnedxC7Gxf7VQmzNkvafLMZlCB3BQTdtPWl
         GGyvVwlI0JpwjzJLr08FEdf3NkMM3Bcd/5Z3JUY2+eqhxpIuH39AfAx+lumndiFkAVZU
         CQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=fUFR7Ie1MKeU6G/XpoqHhOaW9zZaYAOF/NvkRt+btbI=;
        b=exU7aDHs5HdlwxTG7jiwtH+8JM3vwHzA2vbbxwhvKya8bBsWzkmF9Yfh0YpRvCC4od
         3j0YWr+nNf28ynH93CEWEzoG/VommJHkifGX/QODQlMdPtK54+GIjhO5sGX+N3KnbBps
         tE2qI58OktRDboc62MIJeNBVUcRXQLw7Mh7gzKKyxANX221dTBAHFm8bW5r024FbDMdX
         iRO30NKl6QWlNqPeSwFaSh212uLCmqHgoXNNpsrv0vqHSpHdCe7zYutimjr0Ul+rGtvo
         LhsT5UGszzdaf6p/irtZHKzJ8ncuGBivUY5YsfENiQ3AM0Hrzzaj2HzaM1FnHITD5GCB
         +mOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a36si7449833ybi.494.2019.02.18.01.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 01:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvfHy-0008Bz-Im
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 04:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvfHm-0008AH-Lk
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 04:32:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvfHd-0007z7-Pc
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 04:32:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38375)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gvfHZ-0007wf-SJ; Mon, 18 Feb 2019 04:32:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A27123DE0E;
	Mon, 18 Feb 2019 09:32:12 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-41.ams2.redhat.com
	[10.36.112.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79FDA5ED4F;
	Mon, 18 Feb 2019 09:31:58 +0000 (UTC)
Date: Mon, 18 Feb 2019 10:31:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
In-Reply-To: <20190205173306.20483-15-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 18 Feb 2019 09:32:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 14/18] hw/arm/virt: Allocate
 device_memory
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
X-TUID: gwN5af/3XdCe

On Tue,  5 Feb 2019 18:33:02 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> The device memory region is located after the initial RAM.
> its start/size are 1GB aligned.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> 
> ---
> v4 -> v5:
> - device memory set after the initial RAM
> 
> v3 -> v4:
> - remove bootinfo.device_memory_start/device_memory_size
> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
> ---
>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 783468ba77..b683902991 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -61,6 +61,7 @@
>  #include "hw/arm/smmuv3.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/acpi/acpi.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
>      g_free(nodename);
>  }
>  
> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
> +{
> +    MachineState *ms = MACHINE(vms);
> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;
should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
see enforce_aligned_dimm usage and associated commit for more details

> +    uint64_t align = GiB;
> +
> +    if (!device_memory_size) {
> +        return;
> +    }
> +
> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
> +        error_report("unsupported number of memory slots: %"PRIu64,
> +                     ms->ram_slots);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (QEMU_ALIGN_UP(ms->maxram_size, align) != ms->maxram_size) {
> +        error_report("maximum memory size must be aligned to multiple of 0x%"
> +                     PRIx64, align);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
> +    ms->device_memory->base = QEMU_ALIGN_UP(GiB + ms->ram_size, GiB);
                                               ^^^ where does this come from?


> +
> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
> +                       "device-memory", device_memory_size);
> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
> +                                &ms->device_memory->mr);
> +}
> +
>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  {
>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
> @@ -1569,6 +1601,10 @@ static void machvirt_init(MachineState *machine)
>                                           machine->ram_size);
>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>  
> +    if (vms->extended_memmap) {
> +        create_device_memory(vms, sysmem);
> +    }
> +
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
>      create_gic(vms, pic);

