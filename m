Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6965702wrx;
        Fri, 22 Feb 2019 05:39:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbcLQgKWKkhS9wE3P3USPkbxokg+UpaSAfAPqazTDRNkE+Qtne/Utv0/A8trTVx0vFCXKlO
X-Received: by 2002:a0d:edc3:: with SMTP id w186mr3250147ywe.301.1550842768416;
        Fri, 22 Feb 2019 05:39:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550842768; cv=none;
        d=google.com; s=arc-20160816;
        b=CNNXpxuijFKNed5WhyMeireg1JeM634tdv3rPuPqQ9MHCyCkkcj7OALLTEbrPEg20I
         DuA1DxEF2vchS4RX64PssAYa8JO3ZMl+I633N/WgJCWNUFIuecO2aq8PLQ4FJE4a8JLx
         714l196Omt7m509sDOAXNsTNxb9RVKDwZu/ba2jzic5P9/IHfopeN1aR1BYMGyhPMNWQ
         D8/twG5BUARkcUGguQVVZfASdDvN95hw0zl07H4ha5R222Pl2JTRVf35t6hkJ03TYoXT
         0Lp2NiDex7KR4g3ThsSoDw7RAA1yHg8GZ1bViPYmOPP1Uy5la7NQXKJZQ7QBtCOL83Vi
         A+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=QazDfhLhIosPbNXVB5xXO7UWiGQG6zT0y75XaQmCJEo=;
        b=k7nfEXb8Kh2YrxdZN2UaTKiwXyxABhLN09rRJXih4BWPZD6toHVP6bKLJ9aKAfhJaH
         sz02cp8wywG10zAWefcT6cVJHjhVg3KsMNmN/P9lHYz1CKCxj+iBViUNevfVBVD7LNUu
         YHAStgQkLQqPzQa5Ww1JxaYzt/RkBWHXUbs1jP2kF4m6GVfydxd4dhQiwQvm/8I78aGt
         h/jWJAOoKN/WM8llyfAnrWfZxANDdpilLCtlfvoG1kE156jJprefoYRcbJwq40eKdfr6
         UR1frmzSB+GadXZ975znrRaP5rpe7u96CFEY2QMlTN7kVUX69AATlK8MmgPBS0l6X/oA
         T0uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f76si822086ywb.305.2019.02.22.05.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 05:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxB31-0002vY-SC
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 08:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxAqP-0002Ai-QU
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 08:26:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxAqE-0004Mx-8N
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 08:26:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxAq8-00046J-EH; Fri, 22 Feb 2019 08:26:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2D66356F6;
	Fri, 22 Feb 2019 13:26:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3C391001E6D;
	Fri, 22 Feb 2019 13:25:57 +0000 (UTC)
Date: Fri, 22 Feb 2019 14:25:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222142556.38027ef4@redhat.com>
In-Reply-To: <20190220224003.4420-11-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 22 Feb 2019 13:26:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 10/17] hw/arm/virt: Add memory hotplug
 framework
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
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95WBfnqddqFE

On Wed, 20 Feb 2019 23:39:56 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This patch adds the the memory hot-plug/hot-unplug infrastructure
> in machvirt. It is still not enabled as no device memory is allocated.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>

with nit below fixed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v4 -> v5:
> - change in pc_dimm_pre_plug signature
> - CONFIG_MEM_HOTPLUG replaced by CONFIG_MEM_DEVICE and CONFIG_DIMM
> 
> v3 -> v4:
> - check the memory device is not hotplugged
> 
> v2 -> v3:
> - change in pc_dimm_plug()'s signature
> - add pc_dimm_pre_plug call
> 
> v1 -> v2:
> - s/virt_dimm_plug|unplug/virt_memory_plug|unplug
> - s/pc_dimm_memory_plug/pc_dimm_plug
> - reworded title and commit message
> - added pre_plug cb
> - don't handle get_memory_region failure anymore
> ---
>  default-configs/arm-softmmu.mak |  2 ++
>  hw/arm/virt.c                   | 64 ++++++++++++++++++++++++++++++++-
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 734ca721e9..0a78421f72 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -163,3 +163,5 @@ CONFIG_PCI_EXPRESS_DESIGNWARE=y
>  CONFIG_STRONGARM=y
>  CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
> +CONFIG_MEM_DEVICE=y
> +CONFIG_DIMM=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5b656f9db5..470ca0ce2d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -60,6 +60,8 @@
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
>  #include "target/arm/internals.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/mem/nvdimm.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1804,6 +1806,49 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      return ms->possible_cpus;
>  }
>  
> +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> +                                 Error **errp)
> +{
> +    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
> +
> +    if (dev->hotplugged) {
> +        error_setg(errp, "memory hotplug is not supported");
> +    }
> +
> +    if (is_nvdimm) {
> +        error_setg(errp, "nvdimm is not yet supported");
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
> +    Error *local_err = NULL;
> +
> +    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> +
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_memory_unplug(HotplugHandler *hotplug_dev,
> +                               DeviceState *dev, Error **errp)
> +{
> +    pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
> +    object_unparent(OBJECT(dev));
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
> @@ -1815,12 +1860,27 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>                                       SYS_BUS_DEVICE(dev));
>          }
>      }
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +            virt_memory_plug(hotplug_dev, dev, errp);
wrong indent

> +    }
> +}
> +
> +static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
> +                                          DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_memory_unplug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "device unplug request for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
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
> @@ -1884,7 +1944,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> +    hc->pre_plug = virt_machine_device_pre_plug_cb;
>      hc->plug = virt_machine_device_plug_cb;
> +    hc->unplug = virt_machine_device_unplug_cb;
>  }
>  
>  static void virt_instance_init(Object *obj)

