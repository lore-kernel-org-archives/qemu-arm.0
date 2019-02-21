Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5571788wrx;
        Thu, 21 Feb 2019 01:55:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia1cVzXDblIj9KLwGk5YhXmdimpjjwSBxc8jDQflMubWtNEh1+4/7DzSXFJxUAKomIwtHPy
X-Received: by 2002:a81:5845:: with SMTP id m66mr31718923ywb.185.1550742936923;
        Thu, 21 Feb 2019 01:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550742936; cv=none;
        d=google.com; s=arc-20160816;
        b=gmk5zvSwERgQCzsx8yLQW4apmxsFO1Uh7Fh/MoS2Vz+ofP4Qd3qwPOqobe8i5P9FvK
         9uqAHb4mKBYkwuZikrm9F1ZyVMBQSQ2G/RN8jbqq1Sz3krJhLVTr8+iVGL0JakuQHOLT
         lc/Mtn9Hfu1DEu8s/jobQtnReA9LCI711c0MPADt4BKUfW4+M2DK+/iksX6mMdoAXiEF
         yU/qiZhlYr+EBAXrOFxp5HUebKeqhko+B8MtQkAjjx9J/UpNbNPX0znYayg/vwtKkIa/
         TNnJE211qufbKY1CTbej2yVQRtLqAv6PapPzmJZ5PPbyMb6gC/eZXBJ7C7zwb6FcNDiR
         idNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=w3RvVIsj+KitPOxHRqODwcU05UFLKDk6IBW4asCTCQo=;
        b=MZlFjONnxkWDN5r9MLztKwVR8WX/EMrqvydQOjEFdUlaOk6FPeRTAmpUqFMBbgRDc5
         YjDaPIc8JbikIgDsBs9Z0ZqKucyvHxdt/JPzR95asDra9LuDO3xBoJYg8Cy+xpPU/h2z
         J3gZOCnn2ahOmtUYH5c8JehacvO7ETYtAgIEUY58lzzoeLRf5tqiQiIde7NoK88ttLq9
         FwufctRQqyfi/IMnqz4e5ZYEh8UiK8Tk3fa3XCaUPlW7UKMR2zlU8UhrhOymKAWcaF7Z
         m2M1Ilp4t06XQdUnBINIwVcA2bP5fSQmntFXHkQPEgWOC3GDcTz/8YwzgdkotP0dSDN2
         NHoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q32si138987ywa.429.2019.02.21.01.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 01:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwl4q-0001F2-BQ
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 04:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwl4L-0007Tz-Dt
	for qemu-devel@nongnu.org; Thu, 21 Feb 2019 04:55:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwkmu-0005O7-A3
	for qemu-devel@nongnu.org; Thu, 21 Feb 2019 04:37:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gwkmq-0004xG-8V; Thu, 21 Feb 2019 04:37:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0F30308FEC3;
	Thu, 21 Feb 2019 09:36:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E64FE5D9D3;
	Thu, 21 Feb 2019 09:36:11 +0000 (UTC)
Date: Thu, 21 Feb 2019 10:36:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190221103610.0c2add1c@redhat.com>
In-Reply-To: <852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
	<20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
	<852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 21 Feb 2019 09:36:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 14/18] hw/arm/virt: Allocate
 device_memory
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qH6OPai+Afb4

On Tue, 19 Feb 2019 16:53:22 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/18/19 10:31 AM, Igor Mammedov wrote:
> > On Tue,  5 Feb 2019 18:33:02 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> The device memory region is located after the initial RAM.
> >> its start/size are 1GB aligned.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> >>
> >> ---
> >> v4 -> v5:
> >> - device memory set after the initial RAM
> >>
> >> v3 -> v4:
> >> - remove bootinfo.device_memory_start/device_memory_size
> >> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
> >> ---
> >>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 783468ba77..b683902991 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -61,6 +61,7 @@
> >>  #include "hw/arm/smmuv3.h"
> >>  #include "hw/mem/pc-dimm.h"
> >>  #include "hw/mem/nvdimm.h"
> >> +#include "hw/acpi/acpi.h"
> >>  
> >>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> >>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> >> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
> >>      g_free(nodename);
> >>  }
> >>  
> >> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
> >> +{
> >> +    MachineState *ms = MACHINE(vms);
> >> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;  
> > should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
> > see enforce_aligned_dimm usage and associated commit for more details  
> I don't understand the computation done in pc machine. eventually we are
> likely to have more device memory than requested by the user. Why don't
> we check (machine->maxram_size - machine->ram_size) >=
> machine->ram_slots * GiB
> instead of adding 1GiB/slot to the initial user requirements?
> 
> Also machine->maxram_size - machine->ram_size is checked to be aligned
> with TARGET_PAGE_SIZE. Is TARGET_PAGE_SIZE representative of the guest
> PAGE in accelerated mode? Is it valid ro require an alignment on 1GB
> boundary as I do in this patch?
See commit 085f8e88b for explanation,
What we are basically are doing there is sizing hotpluggbale address space
to allow max possible huge page aligned DIMM to be successfully plugged in
even if address space if fragmented.

> 
> >   
> >> +    uint64_t align = GiB;
> >> +
> >> +    if (!device_memory_size) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
> >> +        error_report("unsupported number of memory slots: %"PRIu64,
> >> +                     ms->ram_slots);
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +
> >> +    if (QEMU_ALIGN_UP(ms->maxram_size, align) != ms->maxram_size) {
> >> +        error_report("maximum memory size must be aligned to multiple of 0x%"
> >> +                     PRIx64, align);
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +
> >> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
> >> +    ms->device_memory->base = QEMU_ALIGN_UP(GiB + ms->ram_size, GiB);  
> >                                                ^^^ where does this come from?  
> OK, introduced RAMBASE macro
> 
> Thanks
> 
> Eric
> > 
> >   
> >> +
> >> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
> >> +                       "device-memory", device_memory_size);
> >> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
> >> +                                &ms->device_memory->mr);
> >> +}
> >> +
> >>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> >>  {
> >>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
> >> @@ -1569,6 +1601,10 @@ static void machvirt_init(MachineState *machine)
> >>                                           machine->ram_size);
> >>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> >>  
> >> +    if (vms->extended_memmap) {
> >> +        create_device_memory(vms, sysmem);
> >> +    }
> >> +
> >>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> >>  
> >>      create_gic(vms, pic);  
> >   
> 

