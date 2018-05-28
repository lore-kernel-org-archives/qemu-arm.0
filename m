Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2532405wre;
        Mon, 28 May 2018 07:24:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIRtXhPUnkRhnVD+RZM5dYTYgmQ2uE8CWoi43reiGcCMbrzIAV79My2RWR0RIE6pGzq5Az6
X-Received: by 2002:a37:c402:: with SMTP id d2-v6mr11671420qki.79.1527517492734;
        Mon, 28 May 2018 07:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517492; cv=none;
        d=google.com; s=arc-20160816;
        b=vkvM5XeJT8VtJ6PTJJjWkbpQgWZhaKq4DhDEObRVN9Us5Vw5mFciS5oLZ2emcM+ozE
         oOEpKFYGt5dj5dcCHrOyxAnhU9jB4+jVBEspCeCDnrFYluHDK2BgSaLiRF+DpW/RCd6e
         40B90N3cfG1TOzsRaPT3LulbgninjZYvA8B+y9bmxwopM8FMkuF38kL8X4CjVFqqZbf9
         AoxBevrb4Q/aOsAeI7Xn7l+X5F6XvlcAKz/j/be0b3eeiEaoUhFmd15eRR39yWwvalWl
         3+IE1VDLpEP2j+ycvulVhkE9bepgQb4NQlDpTNGsPT5Fuf/v8UroKPsWeKY5Pnps/ZKr
         1OHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=YNVS3rXNEeUFIJPW1fO2AQQfFFRaLcURqvYTcbqt/Yo=;
        b=zOzNrhtH2a2mXd0hrm6x9bVwl5VUVi0dje1ZGedinM4SQo6ZETUrkdZ3N4BzjZa2jF
         CYvEqUFOjH0WgHFl3DqjnAZ6uTTNY1EULhsEYw8Shm08ZaOOkgjRqaXZ016YLUhqYjHo
         onscIKevj4XKLmQydywy9wRe4VWUEEijgKnFlUQg875aumjdGEhpW+D+/aHR7qJBm5+V
         x7oiczkI0T1pXwCc2OFehZbOs4yiEweGIK1NwmZTpCnyGV5VQwPFNcD0Z+RIGOnOHvjO
         SyXgv5jlhPj0FDOxOQF6bS2DlcmRuFZTGCHLadZEJMiJaEv7E5OAixrv+WA9ASNFrGHz
         uKAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i20-v6si4161988qti.354.2018.05.28.07.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ4u-0001Zk-5H
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:24:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ23-000822-Ir
	for qemu-devel@nongnu.org; Mon, 28 May 2018 10:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ22-0006RL-5y
	for qemu-devel@nongnu.org; Mon, 28 May 2018 10:21:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56554 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNJ1z-0006Pm-77; Mon, 28 May 2018 10:21:51 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD16E7CBBA;
	Mon, 28 May 2018 14:21:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 176BD1117642;
	Mon, 28 May 2018 14:21:46 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-4-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1f8e3cd4-1e54-5350-3804-c77bbbfbd3e4@redhat.com>
Date: Mon, 28 May 2018 16:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180516152026.2920-4-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 14:21:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 14:21:50 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC v2 3/6] hw/arm/virt: Add pc-dimm mem hotplug
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ev/peFTPtosK

Hi Shameer,

On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> This will be used in subsequent patches to model a chunk of
> memory as pc-dimm(cold plug) if the valid iova regions are
> non-contiguous. This is not yet a full hotplug support.
Please can you give more details about this restriction?
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  default-configs/aarch64-softmmu.mak |  1 +
>  hw/arm/virt.c                       | 82 +++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h               |  2 +
>  3 files changed, 85 insertions(+)
> 
> diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
> index 9ddccf8..7a82ed8 100644
> --- a/default-configs/aarch64-softmmu.mak
> +++ b/default-configs/aarch64-softmmu.mak
> @@ -8,3 +8,4 @@ CONFIG_DDC=y
>  CONFIG_DPCD=y
>  CONFIG_XLNX_ZYNQMP=y
>  CONFIG_XLNX_ZYNQMP_ARM=y
> +CONFIG_MEM_HOTPLUG=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 05fcb62..be3ad14 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1552,9 +1552,82 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      return ms->possible_cpus;
>  }
>  
> +static void virt_dimm_plug(HotplugHandler *hotplug_dev,
> +                         DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    PCDIMMDevice *dimm = PC_DIMM(dev);
> +    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> +    MemoryRegion *mr;
> +    uint64_t align;
> +    Error *local_err = NULL;
> +
> +    mr = ddc->get_memory_region(dimm, &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    align = memory_region_get_alignment(mr);
I see that on PC machine class they have an "enforce_aligned_dimm"
option. Also looks memory_region_get_alignment(mr) can return 0.

if (memory_region_get_alignment(mr) && pcmc->enforce_aligned_dimm) {


> +    pc_dimm_memory_plug(dev, &vms->hotplug_memory, mr, align, &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
useless block and error_propagate does nothing if local_err is NULL so
we are fine.
> +
> +out:
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> +                           DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    PCDIMMDevice *dimm = PC_DIMM(dev);
> +    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> +    MemoryRegion *mr;
> +    Error *local_err = NULL;
> +
> +    mr = ddc->get_memory_region(dimm, &local_err);
don't you want to avoid executing the following if local_err?
> +    pc_dimm_memory_unplug(dev, &vms->hotplug_memory, mr);
needs a rebase on top of "pc-dimm: no need to pass the memory region"
in master pc_dimm_memory_unplug we now have
 MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);

Thanks

Eric
> +    object_unparent(OBJECT(dev));
> +
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_machinedevice_plug_cb(HotplugHandler *hotplug_dev,
> +                                      DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_plug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "device plug request for not supported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void virt_machinedevice_unplug_cb(HotplugHandler *hotplug_dev,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_unplug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "device unplug for not supported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
> +                                             DeviceState *dev)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        return HOTPLUG_HANDLER(machine);
> +    }
> +    return NULL;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>  
>      mc->init = machvirt_init;
>      /* Start max_cpus at the maximum QEMU supports. We'll further restrict
> @@ -1573,6 +1646,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +
> +    mc->get_hotplug_handler = virt_get_hotplug_handler;
This requires a rebase on top of Igor's  and David's series.

Thanks

Eric
> +    hc->plug = virt_machinedevice_plug_cb;
> +    hc->unplug = virt_machinedevice_unplug_cb;
> +
>  }
>  
>  static const TypeInfo virt_machine_info = {
> @@ -1582,6 +1660,10 @@ static const TypeInfo virt_machine_info = {
>      .instance_size = sizeof(VirtMachineState),
>      .class_size    = sizeof(VirtMachineClass),
>      .class_init    = virt_machine_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +         { TYPE_HOTPLUG_HANDLER },
> +         { }
> +    },
>  };
>  
>  static void machvirt_machine_init(void)
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index fc24f3a..a39f29e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
>  #include "hw/arm/arm.h"
> +#include "hw/mem/pc-dimm.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -108,6 +109,7 @@ typedef struct {
>      uint32_t gic_phandle;
>      uint32_t msi_phandle;
>      int psci_conduit;
> +    MemoryHotplugState hotplug_memory;
>  } VirtMachineState;
>  
>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> 
