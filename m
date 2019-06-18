Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3680956wrg;
        Tue, 18 Jun 2019 05:43:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwz04Ov3nYHT90MwKesQskdAKAilWri45/YjjFGgaC5kBh0my3UZGO/aKmWK+Divybi7vct
X-Received: by 2002:a50:ac68:: with SMTP id w37mr45162033edc.10.1560861797758;
        Tue, 18 Jun 2019 05:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560861797; cv=none;
        d=google.com; s=arc-20160816;
        b=e8Xe+38F7TIpATzcQwmfuaoxxrbat2FrrwkF5z8gddhHJYtw6F8tPyFXl9CLb80Fns
         sNaFHXvOAa84I2cdRybB/rnBNg8v88nbHa8A5lDw3wsNc+WjGljpwcb3yD1Y3Fj1N1yW
         nxBwGREwbXa3LuEE3X3DYiAT3BPAGnDps9btLjNgJvHnMERl5qqMCxZRuJkOe5b956Px
         myu7yPVOXaw6xtxk63eOM3CdMkXuVQvRlFXaRLu7ccocw3M7DZJ7+vmuHfZkSkqgQyp8
         Ktr9bu14r6maCPc61/BHkKw8leKsPCfrDG9mFYyoI2ovN+9tRtv0q9NSYs2eIVIVClCs
         6ySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AIRbHwzpJNsYHvPLQj/CgozAVCtIswNKMyQrs6vXsVo=;
        b=oi3YHok2bP48w3WnLbXFHkoJJpYHsJuXsGoWBCDp9M/VqbYF1DXl3KXtdIritBmFX/
         GAVXtLtgPbR0KLeKu4DNQvMUb8O1+Gk3x27Nty16nhunxt4zCKduerEAmbXb4wjl3x3A
         W3sHog3C2uStCwHUbga1igRtsDxNYHCtz/W5Za/Lbe8WoK9WCmJQLcGVYOq/kP5X9/lk
         izh2HNYXjYDpRQ+HpoxGi7k2lgH9323WRt0L5p6MdPcFCqGLhdBMlEcBEkuohLQ1fnnD
         KgfNwuMPFsyPGyXwllWt3PIpMqaCnu4R+X+BQbsmjE551SQDG5wXxjhFmmuCwf9JXr0F
         4Viw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si9070212ejh.373.2019.06.18.05.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 05:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdDSF-0005Ng-MU
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 08:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hdDRP-0005KK-Vc
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hdDRK-0003wn-Cl
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:42:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hdDRK-0003sd-3C; Tue, 18 Jun 2019 08:42:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D68A9356CA;
 Tue, 18 Jun 2019 12:42:14 +0000 (UTC)
Received: from [10.36.117.84] (ovpn-117-84.ams2.redhat.com [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 454BF3793;
 Tue, 18 Jun 2019 12:42:12 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <20190522162252.28568-5-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5e59ade1-91ab-e9c8-2c41-97217355c612@redhat.com>
Date: Tue, 18 Jun 2019 14:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190522162252.28568-5-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 18 Jun 2019 12:42:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 4/8] hw/arm/virt: Add memory hotplug
 framework
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
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zZMz2lHxnXqR

Hi Shameer,

On 5/22/19 6:22 PM, Shameer Kolothum wrote:
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
> ---
>  hw/arm/Kconfig |  2 ++
>  hw/arm/virt.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index af8cffde9c..6ef22439b5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -19,6 +19,8 @@ config ARM_VIRT
>      select PLATFORM_BUS
>      select SMBIOS
>      select VIRTIO_MMIO
small conflict to be resolved here after addition of "select ACPI_PCI".

> +    select MEM_DEVICE
> +    select DIMM
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5331ab71e2..3df8c389ff 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -62,6 +62,8 @@
>  #include "hw/arm/smmuv3.h"
>  #include "hw/acpi/acpi.h"
>  #include "target/arm/internals.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/mem/nvdimm.h">
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1862,6 +1864,40 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      return ms->possible_cpus;
>  }
>  
> +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> +                                 Error **errp)
> +{
> +
> +    /*
> +     * The device memory is not yet exposed to the Guest either through> +     * DT or ACPI and hence both cold/hot plug of memory is explicitly
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
> @@ -1873,12 +1909,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
> @@ -1942,7 +1989,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> +    hc->pre_plug = virt_machine_device_pre_plug_cb;
>      hc->plug = virt_machine_device_plug_cb;
> +    hc->unplug_request = virt_machine_device_unplug_request_cb;
>  }
>  
>  static void virt_instance_init(Object *obj)
> 
Thanks

Eric
