Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8552036wrx;
        Fri, 8 Mar 2019 08:14:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzeGO+5oMbAoAOHnIAT59+DDVZTY0Gb6tOxpUBQqV4JhcNpaoIjURPwi0sDxuLhrrY6SUrc
X-Received: by 2002:a25:3342:: with SMTP id z63mr3352278ybz.227.1552061647664;
        Fri, 08 Mar 2019 08:14:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552061647; cv=none;
        d=google.com; s=arc-20160816;
        b=x2Sqtg25ctXeislAB8obx8pRUMvn/sCNYFi3PAtgQRnC1fXr4fwvD6lQeGOSJQozmf
         GUs3XzJkwlELHFWs/15D4qVe9nNk7C7VCjq0VfSrqvSHcfriAjgHkZRoPhhi25bRafEk
         7XuPYmfDS8+Tp7AVrl4lpsc/E5/qi16jU3/gdc8n1alFF8bqyikPUj8hVpS+ZuR5xAV2
         lJD7Rkkd57zYXNr576YA+lcwlHogPF8So1GnmhIa5rHScrhUmc4F9WVjMfPHjVxqUvjh
         alKf+XMuhogn4KkgiXGJq8iIsLFHNCko76VcylkqXp7cDHZxcGpWLBuNcZNHNr1jrF9Q
         G0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=x7xSItSa+NtSEytI8Z//Ko2Noa5wqlN647coNbNpjWI=;
        b=L4Hm3XcpkYwc8jYqSySoZMsi2DHlAp2/0jsS16eahevgzlWR/hm35SS8zfnFZUB9a9
         LlT3mRc9G66tfFb1Mn5Q6p51+G+XAUhuNqMDCi8agX+7aKSOaNcZthavGxS2dpAthPZ+
         mSFT+Tl44ZrVwRsDOpfrjaH4f8XfCooMr95pkXH/AsHhaZnVXVPQfSELrFfY3SmaN7k1
         26GGeb6yEZfqQbyCNlsCB8AuKuVQtY67OInHtejUusEIrEUS8NBqzKQZw4qqNBXyZ7Oj
         0hFUC3WYNjZzqIIAszeWi69HmzCnzH4D/0al/3P4TZs0y31tNqypveK+GFHxCapo17Lb
         AWFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k68si4751491ywa.135.2019.03.08.08.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 08:14:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2I8N-0001An-3r
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 11:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2I89-00019c-3x
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 11:13:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2I88-0003Oq-8O
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 11:13:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2I87-0003NF-Uc; Fri, 08 Mar 2019 11:13:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 123D5A77F;
	Fri,  8 Mar 2019 16:13:51 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B181001DCC;
	Fri,  8 Mar 2019 16:13:46 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-3-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e2e5a025-34bb-7a34-80c7-99d8cef37f2c@redhat.com>
Date: Fri, 8 Mar 2019 17:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308114218.26692-3-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 08 Mar 2019 16:13:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 02/11] hw/acpi: Make ACPI IO address space
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZ/zhOSU3rQa

Hi,

On 3/8/19 12:42 PM, Shameer Kolothum wrote:
> This is in preparation for adding support for ARM64 platforms
> where it doesn't use port mapped IO for ACPI IO space.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/acpi/memory_hotplug.c         | 22 ++++++++++++++--------
>  hw/i386/acpi-build.c             |  3 ++-
>  include/hw/acpi/memory_hotplug.h |  5 +++--
>  3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index a6beb10..77ff0af 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -8,7 +8,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-misc.h"
>  
> -static uint16_t memhp_io_base;
> +static hwaddr memhp_io_base;
>  
>  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>  {
> @@ -182,7 +182,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
>  };
>  
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t io_base)
> +                              MemHotplugState *state, hwaddr io_base)
>  {
>      MachineState *machine = MACHINE(qdev_get_machine());
>  
> @@ -315,7 +315,8 @@ const VMStateDescription vmstate_memory_hotplug = {
>  
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method)
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs)
>  {
>      int i;
>      Aml *ifctx;
> @@ -338,14 +339,19 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
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
> index 622ccb9..d9b554f 100644
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
> index fbfcbe6..52f9027 100644
> --- a/include/hw/acpi/memory_hotplug.h
> +++ b/include/hw/acpi/memory_hotplug.h
> @@ -55,7 +55,7 @@ typedef struct MemHotplugState {
>  } MemHotplugState;
>  
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t io_base);
> +                              MemHotplugState *state, hwaddr io_base);
>  
>  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
>                           DeviceState *dev, Error **errp);
> @@ -74,5 +74,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
>  
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method);
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs);
>  #endif
> 
