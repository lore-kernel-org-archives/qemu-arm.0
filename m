Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp361348wrx;
        Mon, 1 Apr 2019 05:58:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9muY0PfeSO51AT/9HpaD98qREuE4LxWwDHmJs5x+fJJE3fidNc2jM0tIMVEtek65r990j
X-Received: by 2002:a0d:dc05:: with SMTP id f5mr53014522ywe.406.1554123524879;
        Mon, 01 Apr 2019 05:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554123524; cv=none;
        d=google.com; s=arc-20160816;
        b=0bcbXjmQerjFiO+ioQd7Q6Vd3loVbtJwGAH63H0BoLx8Qm9z5Ht0FOj4WwxPXNAx0h
         e0NvQulGT9WK4oEMwYoXwC9juyCAyD4r8vAHCFgXkCJeKhMlrmcwatlZyysi8qcKWOZ7
         ICSb+9+VGNvnWWDcdMn2BHCaanLykrNAHU4QHSaeTHFiPEbi7decVja1kqpQ/tNyBf9e
         doUoRFcYgTCP86LLFGDg5wilscI39sb/ZSIr/aF2u5jN32AYhcsAsin6EMigzSUlCA/s
         PwTE3Q3FEKdPdLYHEp5NGyVNebADRCOyPxwWuPIQd4utEPfgBXYt6G5yT7k8gMg9rOUl
         LWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Xv8hHqHS5d8jtqpzIWIATIxlLuZVolfnYVX+p8KX0yI=;
        b=FyV+PUUDInzgAn5A6uc9/B4CeDK8It0lwDfmiLqpdRngPC5dumbC8UavTFgzeOlx6U
         MMkkgMqOaQQY0hM2h4u23y6iAHQoGxH6sq/YJxd7QkcOr9aQu/3q2xMEZWMrTkC6b8hD
         j/26zFJAUOrADOqaz7lECB1O0WwkMYMI69/vDxjX0T1AesMv11p6yfQC+nN8S0nvFdOM
         SU3nwqRR5Vu1B9HocV1DQN27rT4/O0Xx1FANv9qHRxx9DUeSPHBCFJAXxIRR4iwgI8/x
         8bkweTtiUMdSE0auQzVClVS3KZFiEoT4H5HeiymIOoMmUgZtGLyaThdODpa61onId7r9
         7mDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y85si6160860ywy.151.2019.04.01.05.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 05:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAwWS-0006gU-8R
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 08:58:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hAwWA-0006da-WA
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 08:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hAwW9-0003VW-J2
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 08:58:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54382)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hAwW5-0003PC-T2; Mon, 01 Apr 2019 08:58:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7450F368E7;
	Mon,  1 Apr 2019 12:58:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B3965D9C8;
	Mon,  1 Apr 2019 12:58:10 +0000 (UTC)
Date: Mon, 1 Apr 2019 14:58:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190401145809.55643fc6@redhat.com>
In-Reply-To: <20190321104745.28068-2-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 01 Apr 2019 12:58:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 01/10] hw/acpi: Make ACPI IO address space
 configurable
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
X-TUID: ExmAfG002Pt2

On Thu, 21 Mar 2019 10:47:36 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This is in preparation for adding support for ARM64 platforms
> where it doesn't use port mapped IO for ACPI IO space.
> 
> Also move the MEMORY_SLOT_SCAN_METHOD/MEMORY_DEVICES_CONTAINER
> definitions to header so that other memory hotplug event
> signalling mechanisms (eg. Generic Event Device on HW-reduced
> acpi platforms) can use the same from their respective event
> handler aml code.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/memory_hotplug.c         | 24 ++++++++++++++----------
>  hw/i386/acpi-build.c             |  3 ++-
>  include/hw/acpi/memory_hotplug.h |  8 ++++++--
>  3 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 297812d..80e25f0 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -29,12 +29,10 @@
>  #define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
>  #define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
>  #define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
> -#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
>  #define MEMORY_HOTPLUG_DEVICE        "MHPD"
>  #define MEMORY_HOTPLUG_IO_LEN         24
> -#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
>  
> -static uint16_t memhp_io_base;
> +static hwaddr memhp_io_base;
>  
>  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>  {
> @@ -209,7 +207,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
>  };
>  
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t io_base)
> +                              MemHotplugState *state, hwaddr io_base)
>  {
>      MachineState *machine = MACHINE(qdev_get_machine());
>  
> @@ -342,7 +340,8 @@ const VMStateDescription vmstate_memory_hotplug = {
>  
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method)
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs)
>  {
>      int i;
>      Aml *ifctx;
> @@ -365,14 +364,19 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>              aml_name_decl("_UID", aml_string("Memory hotplug resources")));
>  
>          crs = aml_resource_template();
> -        aml_append(crs,
> -            aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
> -                   MEMORY_HOTPLUG_IO_LEN)
> -        );
> +        if (rs == AML_SYSTEM_IO) {
> +            aml_append(crs,
> +                aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
> +                       MEMORY_HOTPLUG_IO_LEN)
> +            );
> +        } else {
> +            aml_append(crs, aml_memory32_fixed(memhp_io_base,
> +                            MEMORY_HOTPLUG_IO_LEN, AML_READ_WRITE));
> +        }
>          aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
>  
>          aml_append(mem_ctrl_dev, aml_operation_region(
> -            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
> +            MEMORY_HOTPLUG_IO_REGION, rs,
>              aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
>          );
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 416da31..6d6de44 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1852,7 +1852,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                         "\\_SB.PCI0", "\\_GPE._E02");
>      }
> -    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0", "\\_GPE._E03");
> +    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> +                             "\\_GPE._E03", AML_SYSTEM_IO);
>  
>      scope =  aml_scope("_GPE");
>      {
> diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
> index 77c6576..f95aa1f 100644
> --- a/include/hw/acpi/memory_hotplug.h
> +++ b/include/hw/acpi/memory_hotplug.h
> @@ -5,6 +5,9 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
>  
> +#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
> +#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> +
>  /**
>   * MemStatus:
>   * @is_removing: the memory device in slot has been requested to be ejected.
> @@ -29,7 +32,7 @@ typedef struct MemHotplugState {
>  } MemHotplugState;
>  
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t io_base);
> +                              MemHotplugState *state, hwaddr io_base);
>  
>  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
>                           DeviceState *dev, Error **errp);
> @@ -48,5 +51,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
>  
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method);
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs);
>  #endif

