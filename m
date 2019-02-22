Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6978652wrx;
        Fri, 22 Feb 2019 05:53:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZfUETMEe1MyZzm2+SiihSc08knTymFmhFoGd+OgeGW6HOs3gVwL6ID+v76p+zr22wC+Q24
X-Received: by 2002:a25:8e11:: with SMTP id p17mr3452783ybl.39.1550843604231;
        Fri, 22 Feb 2019 05:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550843604; cv=none;
        d=google.com; s=arc-20160816;
        b=kYlA94zIcapoCpSvgFDZ9n3381wJA0vMuoejz2AS+dR+mx64OYOlxmdTx2zW99HKA6
         tXjoQ5LfSSX4e0vRgaJKcYfTUUhjM7c9Yg/oySEcqlZ+XP9A2iVe0JcnoeRlT6CZfKEj
         OclSKYobwuqIEcv+tWT+MDpW4IJuCGUKk75ytOsSe36wQXbLrFWyME0/QhkCS2Ra+Bmo
         bgZpAG2ngWHaTh6AodyfJMMgHL8uGnLiTNjYp3MYYpRX5gfSbJ6R7ofREprn3zQNmRz3
         KHhsjx/F8dv27N7b5rlMpEllmQ92Gb9bgsUCTsrolLOP4plH+QIsw2Pa3YWuBZf+DjOb
         RaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=rB9nducMN6fCt47p/mU3by3nmda0IT0N9QPoimmJoOc=;
        b=p0SSi1nD4JyI7q/jOzXzweOrKklLUg+5Q7+cQOAcC2PNxUnUGnaaYqMcvEJuK9te1A
         3VVV56T6iDSwMByK+oMpnLbXGBSGqhaXu95sG/KUqFD0dwoyttWehhAJ2z90wEWzj0Ce
         qXrLlezd9pHVY0V60Fp+iPbTFxISwFN8ws7SFTuKYeZVvpziopIp5nj4y6psLFKBoIz9
         LIwvccNXr8a1Je/Sn517qZXKVh70VEKJzWPYA/giLUf+Fz53C4b32u9eqg/xtiuOaQUH
         wH564DhWHFHg1MvVNWX1ArGyPXVFIFCmF60ScVoLvK7MmcZT21PQztGVnVoEdTM88yCc
         pQ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s66si912122ywc.5.2019.02.22.05.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 05:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxBGV-0002rx-LP
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 08:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxBCY-0008B3-OE
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 08:49:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxBCX-00039L-7N
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 08:49:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxBCW-0002bZ-Cg; Fri, 22 Feb 2019 08:49:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A53DE2D802;
	Fri, 22 Feb 2019 13:48:54 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D43D66080;
	Fri, 22 Feb 2019 13:48:47 +0000 (UTC)
Date: Fri, 22 Feb 2019 14:48:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222144846.0a891948@redhat.com>
In-Reply-To: <20190220224003.4420-14-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-14-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 22 Feb 2019 13:48:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 13/17] hw/arm/virt: Allocate device_memory
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
X-TUID: E3v+sENxhUfu

On Wed, 20 Feb 2019 23:39:59 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> The device memory region is located after the initial RAM.
> its start/size are 1GB aligned.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> 
> ---
> v6 -> v7:
> - check the device memory top does not wrap
> - check the device memory can fit the slots
> 
> v4 -> v5:
> - device memory set after the initial RAM
> 
> v3 -> v4:
> - remove bootinfo.device_memory_start/device_memory_size
> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
> ---
>  hw/arm/virt.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 470ca0ce2d..33ad9b3f63 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -62,6 +62,7 @@
>  #include "target/arm/internals.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/acpi/acpi.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1263,6 +1264,34 @@ static void create_secure_ram(VirtMachineState *vms,
>      g_free(nodename);
>  }
>  
> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
> +{
> +    MachineState *ms = MACHINE(vms);
> +
> +    if (!vms->device_memory_size) {
having vms->device_memory_size seems like duplicate, why not to reuse
memory_region_size(MachineState::device_memory::mr) like we do elsewhere.

Also it would be better to all device_memory allocation/initialization
compact and close to each other like it's done in pc/spapr.

> +        return;
> +    }
> +
> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
> +        error_report("unsupported number of memory slots: %"PRIu64,
> +                     ms->ram_slots);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (QEMU_ALIGN_UP(ms->maxram_size, GiB) != ms->maxram_size) {
> +        error_report("maximum memory size must be GiB aligned");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
> +    ms->device_memory->base = vms->device_memory_base;
> +
> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
> +                       "device-memory", vms->device_memory_size);
> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
> +                                &ms->device_memory->mr);
> +}
> +
>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  {
>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
> @@ -1610,6 +1639,10 @@ static void machvirt_init(MachineState *machine)
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

