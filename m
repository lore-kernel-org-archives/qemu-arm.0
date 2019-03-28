Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp777843wrx;
        Thu, 28 Mar 2019 08:42:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzySmb0xh64d/72PdbIHikXFN9rjbwzicJQ2pc0upxO5OdLdCr4zpPzrEtcnjHWzGz0h/Bv
X-Received: by 2002:a02:700f:: with SMTP id f15mr32051114jac.139.1553787774195;
        Thu, 28 Mar 2019 08:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553787774; cv=none;
        d=google.com; s=arc-20160816;
        b=vYD8zNSnA34kOTYOlGRVgxhK2dzhcv752RYLGSMOZbwm7LWW5ytYWRSRk/yunxmVet
         9ZVfCVmIweEsnJeKKWSrYup364rCYKGq2JGDJkPMFQPx5qqwOhmnX5QMYCrm3+MTSicm
         Vz0pfazBT6mopLJk5vmz1s2FyK03zDMeq4ZMLmeZAbn1ZBNhEk7Q3V32F7QMLKmDgSBa
         ryik3XBcp898NbVUZyxb6T1Ep1YoSQtQopbwzf1G8dGm5QVzgr2Nt98ZtpA0t/jTTpUJ
         RD5l0ILLz33+s4qMjVYsOSUsLukiPPc7flfaYEGU3XMDTumurN+TWfUGzYwmHlmo1EUi
         ZlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=IG30vbEpxPvdxtOLtjBr5ZMyl2jzcJJNyzuoeANNglQ=;
        b=NefJw1xFEVr7sMAiMqFIb7XpGDaa5l1Enbb30j6HH9T0Ru4cREn+6jXaYV1J0ExK2X
         1pM4xkbLidG+Ohi+ERo0Hvi9fiYTGQSWFOXbQYOyO5OhsAOq/agvbkPUYVFeWFaKowbJ
         HgYVqKKs2fsjeQDdhVFEWXyalWS/gKBxwmQxZWvQ8PDDWvAkNsGqsTXyomPkB5NOOpMQ
         g/iXUu/g8G8fg/sykxhbgdYVoxMnl6/LwMW8EH12efwWAlhaiw0CkpBiSvTADPSmdxcG
         AaqG6gk043zndwWG3Co4shCM+WKo0ds9/bw++0yDjGbNXOcuDaXccx376YWsb5Mpq8ZP
         F1ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si11306393iob.30.2019.03.28.08.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 08:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9XB7-00044B-Ee
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 11:42:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9X6T-0000Ie-IR
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9X6S-00072S-Cj
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:38:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9X6S-00072L-0q; Thu, 28 Mar 2019 11:38:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C652F7C837;
	Thu, 28 Mar 2019 15:38:02 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7050D619C4;
	Thu, 28 Mar 2019 15:37:57 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-5-shameerali.kolothum.thodi@huawei.com>
Message-ID: <dd71b47f-bb96-ce64-85f7-94b782a0f64e@redhat.com>
Date: Thu, 28 Mar 2019 16:37:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321104745.28068-5-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 28 Mar 2019 15:38:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 04/10] hw/arm/virt: Add memory hotplug
 framework
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
X-TUID: UMpDiDyZ3aif

Hi Shameer,

On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> This patch adds the the memory hot-plug/hot-unplug infrastructure
s/the the/the (sorry my fault)
> in machvirt. It is still not enabled as device memory is not yet
> reported to guest.
s/ reported to guest / exposed to the guest either through DT or ACPI.
Note even cold-plug would not work yet.


> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  default-configs/arm-softmmu.mak |  3 +++
>  hw/arm/virt.c                   | 53 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2a7efc1..795cb89 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -159,3 +159,6 @@ CONFIG_MUSICPAL=y
>  
>  # for realview and versatilepb
>  CONFIG_LSI_SCSI_PCI=y
> +
> +CONFIG_MEM_DEVICE=y
> +CONFIG_DIMM=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ce2664a..d0ff20d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -61,6 +61,8 @@
>  #include "hw/arm/smmuv3.h"
>  #include "hw/acpi/acpi.h"
>  #include "target/arm/internals.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/mem/nvdimm.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1806,6 +1808,42 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
Maybe this patch should be moved at the end since from this patch
onwards, it becomes possible to instantiate a DIMM slot (with cold-plug
qemu command line) that won't work properly. Of we simply disable
cold-plug for PCDIMM as well at the moment?

Thanks

Eric
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
> @@ -1817,12 +1855,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
> @@ -1886,7 +1935,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
