Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp960865wrv;
        Wed, 17 Jul 2019 07:40:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRI5U3B4gBdwBj0S0Pasr0uzVqkdD7BXOEdA8qoMORAo1uZpPLg+QMCtkLnASDNy4/ioFN
X-Received: by 2002:a17:906:2f0f:: with SMTP id v15mr29990986eji.33.1563374442173;
        Wed, 17 Jul 2019 07:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563374442; cv=none;
        d=google.com; s=arc-20160816;
        b=ADRdaS+gHGxaD7ZrhvustLSx7XF6W6YB+PcaOvw1cKkwEtoVNTwYy2Ej09NKvllpBB
         JEP+gVfIQjKo6b+nLOX9p+LYQkvEhBr1xvHua35KLsrrOun2ag5IjOF/vJosILkbRDtZ
         5GJbHcqnGZW56s4DaBuXtW5tLp5nU2xjZ8Bamx3knPUJxydBNKZTc5QQbM/nIRqQQQlr
         n4k5eeCJR07pOF1sDEw6ylkkC1sOSyIcIIInX33yLmA9yR8L3Z6/OPNANRhVmonJViZP
         epwB+dFiXgPYgE3kM0dt2zmu8jrAZVYnGmHndhugGWQy5tBH+C1RWtDt8/52c6Mdk3GH
         Catg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=VMnjzVxoMFrE3eSDwhgVtXqtLHW67bWEhiAcR7WFJgs=;
        b=qXYSCUB4XWaQqRVMy/aM17OXRgb6kGpm8yr9x06Pou1aYx+5rhM4M6rLMuPbGe822i
         GtBwvxv2F+4fCmGGr9ALMIkseAwTjhuNm0TV0sfvxBrbwlsCIZFvCLRLIBrPmPFvf9bR
         xFB0PH1+FkyVVLKO+NwffjRQgn1DvEw4MYw2QrMKrx7Z8Ub/rqy+wQp19jIGDhL6nDGx
         uJ6Ju+kn4Awb6Pj8JBNz+rx/zjp4VTR4v6EAuopWHv2PPCfVzxpr+fAbrj4yNiW3NMU+
         XO7lVnfQv8c5j0xow1UusiPNwrgaAFUOgFqdS3slujRflLCpPuF6QLD8Qhpr1koMj8NF
         LxMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c50si14809167edc.412.2019.07.17.07.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 07:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnl6m-0001o1-5k
	for alex.bennee@linaro.org; Wed, 17 Jul 2019 10:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hnl6i-0001nj-Bs
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 10:40:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hnl6h-00044e-0i
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 10:40:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hnl6g-00043y-Mz; Wed, 17 Jul 2019 10:40:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A4956C18B2CC;
 Wed, 17 Jul 2019 14:40:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3844260BEE;
 Wed, 17 Jul 2019 14:40:27 +0000 (UTC)
Date: Wed, 17 Jul 2019 16:40:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190717164026.19145b9d@redhat.com>
In-Reply-To: <20190716153816.17676-5-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 17 Jul 2019 14:40:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v7 04/10] hw/arm/virt:
 Add memory hotplug framework
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
X-TUID: Og206iRDwRRk

On Tue, 16 Jul 2019 16:38:10 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> From: Eric Auger <eric.auger@redhat.com>
> 
> This patch adds the memory hot-plug/hot-unplug infrastructure
> in machvirt. The device memory is not yet exposed to the Guest
> either through DT or ACPI and hence both cold/hot plug of memory
> is explicitly disabled for now.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/Kconfig |  2 ++
>  hw/arm/virt.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index ab65ecd216..84961c17ab 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -20,6 +20,8 @@ config ARM_VIRT
>      select SMBIOS
>      select VIRTIO_MMIO
>      select ACPI_PCI
> +    select MEM_DEVICE
> +    select DIMM
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d9496c9363..907fb64bb9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -64,6 +64,8 @@
>  #include "hw/arm/smmuv3.h"
>  #include "hw/acpi/acpi.h"
>  #include "target/arm/internals.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/mem/nvdimm.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1871,6 +1873,40 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      return ms->possible_cpus;
>  }
>  
> +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> +                                 Error **errp)
> +{
> +
> +    /*
> +     * The device memory is not yet exposed to the Guest either through
> +     * DT or ACPI and hence both cold/hot plug of memory is explicitly
> +     * disabled for now.
> +     */
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        error_setg(errp, "memory cold/hot plug is not yet supported");
> +        return;
> +    }
> +
> +    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
> +}
> +
> +static void virt_memory_plug(HotplugHandler *hotplug_dev,
> +                             DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +
> +    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
> +
> +}
> +
> +static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> +                                            DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_memory_pre_plug(hotplug_dev, dev, errp);
> +    }
> +}
> +
>  static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>                                          DeviceState *dev, Error **errp)
>  {
> @@ -1882,12 +1918,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>                                       SYS_BUS_DEVICE(dev));
>          }
>      }
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_memory_plug(hotplug_dev, dev, errp);
> +    }
> +}
> +
> +static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                          DeviceState *dev, Error **errp)
> +{
> +    error_setg(errp, "device unplug request for unsupported device"
> +               " type: %s", object_get_typename(OBJECT(dev)));
>  }
>  
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>                                                          DeviceState *dev)
>  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
> +       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> @@ -1951,7 +1998,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> +    hc->pre_plug = virt_machine_device_pre_plug_cb;
>      hc->plug = virt_machine_device_plug_cb;
> +    hc->unplug_request = virt_machine_device_unplug_request_cb;
>      mc->numa_mem_supported = true;
>  }
>  

