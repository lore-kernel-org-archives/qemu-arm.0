Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp12426526wrx;
        Wed, 27 Feb 2019 08:28:29 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYeR48QxzjdLyl8ooYT9OsxHJJ+nbGlgnSgCUs685hSuigq1K7icmAkap/23DJhWHXYvo4g
X-Received: by 2002:a25:6741:: with SMTP id b62mr2637800ybc.151.1551284909115;
        Wed, 27 Feb 2019 08:28:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551284909; cv=none;
        d=google.com; s=arc-20160816;
        b=WrQISEMwrDaUuFYH84nczOBxuAlHrnSFjClpf8qhVPjaxidiVUtFF4nIsGf8XFLJJr
         BVte+CW8TPE1w87uAm/XIG183VFZyCP5xW0WMySZZx/THFlo7Z2t0c/PenN2DSkrnXff
         wJ+YoRsHnvyP3hjnmcRJulAMi31ba4GPh0eWbg9QCI3yXjRDZ5geY54oB0Ib5UX9a726
         19KtyMU56h0qMr4tI7Ph4YswF7cT80belSmjpY46YM8OUCQH3DDyNICx07IuXNMEk079
         pZpIDgVY98I0novN0YHhTuA+3u14whlRyWHGnOeci2DmtzCe4jfsXg1TIoqevomNZnOd
         DJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=FUML+tWUUmhnqRmAjVsjQOEysi54KA66rue/CV0tQa8=;
        b=ZhEhPqooFYFzWXRLGBgqTysG7PAO9lKve4TIQ2tuqRqIBMitO/keY7CdJACeV0BMjO
         HrW7mxn282Um+vyORfk3ounnkyRo1rqgvgQFRBpmvhJuQmO8AkshCBukMdcQzcKfVMPi
         BHfej3/+QbKvbEhTiEAUzlEzpNILuZsmZc/ccVs2PoYZ1ds0JLBxevQn0wuHmhv69ux+
         i6jkZ/ZXheTrHQoEKr8Af9eRdXdBu4cfD9gwMtZxIV/92kdNTI61okaY6Ppg+4N96RkM
         1OhuLmymErylOSKLh3gFaNT4128K6ADlZi4uDRAVpssS5JJuWRKcH9BJtxLY3sTduvz4
         S6OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si2769180ybk.352.2019.02.27.08.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 08:28:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gz24K-0005MD-Jw
	for alex.bennee@linaro.org; Wed, 27 Feb 2019 11:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gz248-0005Ke-Iq
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 11:28:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gz246-0006ru-IC
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 11:28:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gz244-0006ZJ-EA; Wed, 27 Feb 2019 11:28:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75FC1A3283;
	Wed, 27 Feb 2019 16:27:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD9534AB;
	Wed, 27 Feb 2019 16:27:40 +0000 (UTC)
Date: Wed, 27 Feb 2019 17:27:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190227172739.70fb0d18@redhat.com>
In-Reply-To: <20190128110545.20644-2-shameerali.kolothum.thodi@huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 27 Feb 2019 16:27:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 1/4] hw:acpi: Make ACPI IO address space
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
	linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
	xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pBTyRQEmSED8

On Mon, 28 Jan 2019 11:05:43 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This is in preparation for adding support for ARM64 platforms
> where it doesn't use port mapped IO for ACPI IO space.
> 
> Also add a flag to identify hw reduced ACPI platforms as they
> might use GPIO hw for signaling ACPI platform events.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/acpi/memory_hotplug.c         | 13 ++++++++-----
>  hw/i386/acpi-build.c             |  3 ++-
>  include/hw/acpi/memory_hotplug.h |  6 ++++--
>  3 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 921cad2..05f1d45 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -34,7 +34,7 @@
>  #define MEMORY_HOTPLUG_IO_LEN         24
>  #define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
>  
> -static uint16_t memhp_io_base;
> +static hwaddr memhp_io_base;
>  
>  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>  {
> @@ -208,7 +208,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
>  };
>  
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t io_base)
> +                              MemHotplugState *state, hwaddr io_base)
>  {
>      MachineState *machine = MACHINE(qdev_get_machine());
>  
> @@ -279,7 +279,9 @@ void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
>      mdev->is_enabled = true;
>      if (dev->hotplugged) {
>          mdev->is_inserting = true;
> -        acpi_send_event(DEVICE(hotplug_dev), ACPI_MEMORY_HOTPLUG_STATUS);
> +        if (!mem_st->hw_reduced_acpi) {
> +            acpi_send_event(DEVICE(hotplug_dev), ACPI_MEMORY_HOTPLUG_STATUS);
> +        }
Why do you restrict it to non hw_reduced_acpi?

If anything else, I'd expect virt board (or hotplug controller (GED or whatever)
implement AcpiDeviceIfClass and implement arm/virt board specific call backs)

then you won't need duplicate and carry hw_reduced_acpi in generic code.

The rest of the patch looks good.

>      }
>  }
>  
> @@ -341,7 +343,8 @@ const VMStateDescription vmstate_memory_hotplug = {
>  
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method)
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs)
>  {
>      int i;
>      Aml *ifctx;
> @@ -371,7 +374,7 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>          aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
>  
>          aml_append(mem_ctrl_dev, aml_operation_region(
> -            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
> +            MEMORY_HOTPLUG_IO_REGION, rs,
>              aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
>          );
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 2e21a31..b62c1a3 100644
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
> index 77c6576..ec56579 100644
> --- a/include/hw/acpi/memory_hotplug.h
> +++ b/include/hw/acpi/memory_hotplug.h
> @@ -26,10 +26,11 @@ typedef struct MemHotplugState {
>      uint32_t selector;
>      uint32_t dev_count;
>      MemStatus *devs;
> +    bool hw_reduced_acpi; /*true for hw reduced acpi platform */
>  } MemHotplugState;
>  
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t io_base);
> +                              MemHotplugState *state, hwaddr io_base);
>  
>  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
>                           DeviceState *dev, Error **errp);
> @@ -48,5 +49,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
>  
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method);
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs);
>  #endif

