Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp982241njh;
        Mon, 12 Aug 2024 18:21:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUr6T1T0giyBIBRsYkk/R8phk+u8Kk1VoOHmXF1x4ewOD+yCsQfRdb3TArXHtumVuSzxN/R146FwA9o51/wHWNxbEwdcjyv
X-Google-Smtp-Source: AGHT+IE2ZIKILkQwhCvZhUkr7gWXPBDe+l7Px+Es0pOhSpLpvBWIPTxKL7uDTYZdUQcAuAXv9eBI
X-Received: by 2002:a05:622a:4aca:b0:450:3eb:cb30 with SMTP id d75a77b69052e-45349aa2d0fmr32105241cf.42.1723512100487;
        Mon, 12 Aug 2024 18:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723512100; cv=none;
        d=google.com; s=arc-20160816;
        b=p7oXlhmHIyvW+Zh2gPsG62oROS1WzQCWQWLHdgyo67374EWerS9oWNnKS5gVv6oCcq
         xfTedMVLqpF1ClJVCEmJpFc2dF10to05T8IxCOA9zloTTu3JdHjWpE+duYgHM2oMPAXp
         PUiWAVEG4Uh/9YPgVC8ucPIk0jukF6lZqi0B9V13VWspiQW2DMWBrCRNeALe9WCNjJ+3
         EVhgpzJnNKgqafyp6OUFLjVdKx+XlJgQHEUD8k3YJk4jda73kfFHtP+om7CheMOvClba
         JOeL2hZu6klgrDE1ypTHCwo7RBhmP65c1otWfXiKS69VIcyv7I0vDQNG2PS8c8nLhhXL
         Y+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9ZTWsWk/SecPpff2uduq6vVjrbcNYRORm6NKSWu5gkw=;
        fh=l5jPQX5EasiEjW8QQAjnKNBKzLwNk/VtnMy6wx+mh/A=;
        b=Xpz+S5rWNbVc10QZjHdaUwLlcr9H51Z1CgQvOpeWIwPW++4XLcuekNpjgoqRuZXIj1
         bjKKKOtlJ2Y31GDD07AY99rxflCnVF+hnS4bryV13jWoKHucTMqApY9C86btPC48WNY1
         BS0k4ulZDNtJxEi79kOQG9uXyX9RJexic/BtsB2DhEG5KU66ynBteJHm0cL2fsHmp8jH
         BY44jEmNKwOB/9nZw6E6IiM5SfiJ7gjqcpyHChRrrbqQ8zumWgwdxvbG/XdjVhvFWNoB
         hQ2rmfrh5qhZzc5+G6h4POxo3iBunbmRMCXdb7Q8EGB2uNsGwyxEmJ+TQ35dksgdePc+
         mrSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkG9xjQi;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c1c8ff1si71397641cf.165.2024.08.12.18.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkG9xjQi;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723512100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZTWsWk/SecPpff2uduq6vVjrbcNYRORm6NKSWu5gkw=;
	b=bkG9xjQiZTkRCTgbNqbdIXKUkyloMx3IqnSPJMUk/SopnpOJQP4I4Ofyc+3KODfUwbIIfq
	Rb0YjqepYD70sI8OPnQqM/3DbxI3DriDp8bZiL6BpRigpqK4T39/1XPh0acPTZO3v7Da7y
	pmJiiaIljO/VHc55v477AgwbGJx4SAg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-oHvrMK9zOZGJLA1_cilJVQ-1; Mon, 12 Aug 2024 21:21:38 -0400
X-MC-Unique: oHvrMK9zOZGJLA1_cilJVQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2cb5847ff53so6167949a91.2
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 18:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723512097; x=1724116897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZTWsWk/SecPpff2uduq6vVjrbcNYRORm6NKSWu5gkw=;
        b=VzICL8/TqO1NSUusT0jGVo9Z+joxN7hxNDWIpsCkFFVyDG7/z1n9lMXjVzKSVEqNIV
         5V+bqSS8TvjJv/fbIQWAr2uQws3LzY07nZ3FRPVpOOp/d5aWqPxZ+IUyc4w3wMoEaGNl
         y/ZHmAgu48NqglFfQ9fsRBCKtzi9RjKNPZTg1Mcj01ko+Kdl1Quv682CR+APVdnFQviy
         ZsRsPODtnQ+S8J9BCsP3h5Xny37+vBiWU2FxBM7RnilVRCqwqLQnCUc/ZcQn5/fGNK+2
         8KZsvMvEDV9AcUp1IcstDd6uFz1tLQe9NfBwSFB2FCt1E1L/8dL7Pysg6j1aRDQTKOHg
         +YIA==
X-Forwarded-Encrypted: i=1; AJvYcCXP/nuX/+cRhH2XsYtjS8q51QZgVEVUvmN91FIX9zoe7nRl91Dtmd074HJJOt2ZAGz9anVVnry9lH3wpIoUP97Xjq/8p7u8
X-Gm-Message-State: AOJu0YwdxZZLPu0+KvvM0aBN6NBRAnNDIBcldvmr5PP4x3BHRS84tpgk
	GjP8vlynBRYC9UVd8xaOdDKeSw8AzpyZHqEueyCTViu7/mKETxHWZv6Z/6pkl4D5X6wzwJMCqSj
	jpXwxsSpcIODxvJwpcGv+LOhJ3z+QoYhILxO+mWwFiH1MBeFpOWZGiQ==
X-Received: by 2002:a17:90a:4e08:b0:2cf:7cce:cc19 with SMTP id 98e67ed59e1d1-2d3924d6b93mr2290854a91.6.1723512097401;
        Mon, 12 Aug 2024 18:21:37 -0700 (PDT)
X-Received: by 2002:a17:90a:4e08:b0:2cf:7cce:cc19 with SMTP id 98e67ed59e1d1-2d3924d6b93mr2290817a91.6.1723512096931;
        Mon, 12 Aug 2024 18:21:36 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c64b1fsm10010729a91.7.2024.08.12.18.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 18:21:36 -0700 (PDT)
Message-ID: <64e9feaa-8df2-4108-9e73-c72517fb074a@redhat.com>
Date: Tue, 13 Aug 2024 11:21:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 18/29] arm/virt: Add/update basic hot-(un)plug
 framework
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-19-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-19-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5bx1QSR2HYqO

On 6/14/24 9:36 AM, Salil Mehta wrote:
> Add CPU hot-unplug hooks and update hotplug hooks with additional sanity checks
> for use in hotplug paths.
> 
> Note: The functional contents of the hooks (currently left with TODO comments)
> will be gradually filled in subsequent patches in an incremental approach to
> patch and logic building, which would roughly include the following:
> 
> 1. (Un)wiring of interrupts between vCPU<->GIC.
> 2. Sending events to the guest for hot-(un)plug so that the guest can take
>     appropriate actions.
> 3. Notifying the GIC about the hot-(un)plug action so that the vCPU can be
>     (un)stitched to the GIC CPU interface.
> 4. Updating the guest with next boot information for this vCPU in the firmware.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a72cd3b20d..f6b8c21f26 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -85,6 +85,7 @@
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/char/pl011.h"
>   #include "qemu/guest-random.h"
> +#include "qapi/qmp/qdict.h"
>   
>   static GlobalProperty arm_virt_compat[] = {
>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
> @@ -3002,11 +3003,23 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>   static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                 Error **errp)
>   {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>       MachineState *ms = MACHINE(hotplug_dev);
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>       ARMCPU *cpu = ARM_CPU(dev);
>       CPUState *cs = CPU(dev);
>       CPUArchId *cpu_slot;
>   
> +    if (dev->hotplugged && !vms->acpi_dev) {
> +        error_setg(errp, "GED acpi device does not exists");
> +        return;
> +    }
> +
> +    if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
> +        error_setg(errp, "CPU hotplug not supported on this machine");
> +        return;
> +    }
> +
>       /* sanity check the cpu */
>       if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
>           error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
> @@ -3049,6 +3062,22 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>       }
>       virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
>   
> +    /*
> +     * Fix the GIC for this new vCPU being plugged. The QOM CPU object for the
> +     * new vCPU need to be updated in the corresponding QOM GICv3CPUState object
> +     * We also need to re-wire the IRQs for this new CPU object. This update
> +     * is limited to the QOM only and does not affects the KVM. Later has
> +     * already been pre-sized with possible CPU at VM init time. This is a
> +     * workaround to the constraints posed by ARM architecture w.r.t supporting
> +     * CPU Hotplug. Specification does not exist for the later.
> +     * This patch-up is required both for {cold,hot}-plugged vCPUs. Cold-inited
> +     * vCPUs have their GIC state initialized during machvit_init().
> +     */
> +    if (vms->acpi_dev) {
> +        /* TODO: update GIC about this hotplug change here */
> +        /* TODO: wire the GIC<->CPU irqs */
> +    }
> +
>       /*
>        * To give persistent presence view of vCPUs to the guest, ACPI might need
>        * to fake the presence of the vCPUs to the guest but keep them disabled.
> @@ -3060,6 +3089,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>   static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                             Error **errp)
>   {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>       MachineState *ms = MACHINE(hotplug_dev);
>       CPUState *cs = CPU(dev);
>       CPUArchId *cpu_slot;
> @@ -3068,10 +3098,81 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>       cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
>       cpu_slot->cpu = CPU(dev);
>   
> +    /*
> +     * Update the ACPI Hotplug state both for vCPUs being {hot,cold}-plugged.
> +     * vCPUs can be cold-plugged using '-device' option. For vCPUs being hot
> +     * plugged, guest is also notified.
> +     */
> +    if (vms->acpi_dev) {
> +        /* TODO: update acpi hotplug state. Send cpu hotplug event to guest */
> +        /* TODO: register cpu for reset & update F/W info for the next boot */
> +    }
> +
>       cs->disabled = false;
>       return;
>   }
>   
> +static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
> +                                    DeviceState *dev, Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    ARMCPU *cpu = ARM_CPU(dev);
> +    CPUState *cs = CPU(dev);
> +
> +    if (!vms->acpi_dev || !dev->realized) {
> +        error_setg(errp, "GED does not exists or device is not realized!");
> +        return;
> +    }
> +

How can a vCPU be unplugged even when it hasn't been realized? :)

> +    if (!mc->has_hotpluggable_cpus) {
> +        error_setg(errp, "CPU hot(un)plug not supported on this machine");
> +        return;
> +    }
> +
> +    if (cs->cpu_index == first_cpu->cpu_index) {
> +        error_setg(errp, "Boot CPU(id%d=%d:%d:%d:%d) hot-unplug not supported",
> +                   first_cpu->cpu_index, cpu->socket_id, cpu->cluster_id,
> +                   cpu->core_id, cpu->thread_id);
> +        return;
> +    }
> +
> +    /* TODO: request cpu hotplug from guest */
> +
> +    return;
> +}
> +
> +static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
> +                            Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    MachineState *ms = MACHINE(hotplug_dev);
> +    CPUState *cs = CPU(dev);
> +    CPUArchId *cpu_slot;
> +
> +    if (!vms->acpi_dev || !dev->realized) {
> +        error_setg(errp, "GED does not exists or device is not realized!");
> +        return;
> +    }
> +

Same question as above.

> +    cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
> +
> +    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
> +
> +    /* TODO: unwire the gic-cpu irqs here */
> +    /* TODO: update the GIC about this hot unplug change */
> +
> +    /* TODO: unregister cpu for reset & update F/W info for the next boot */
> +
> +    qobject_unref(dev->opts);
> +    dev->opts = NULL;
> +
> +    cpu_slot->cpu = NULL;
> +    cs->disabled = true;
> +
> +    return;
> +}
> +

The 'return' isn't needed.

>   static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                               DeviceState *dev, Error **errp)
>   {
> @@ -3196,6 +3297,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
>                                        errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        virt_cpu_unplug_request(hotplug_dev, dev, errp);
>       } else {
>           error_setg(errp, "device unplug request for unsupported device"
>                      " type: %s", object_get_typename(OBJECT(dev)));
> @@ -3209,6 +3312,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
>           virt_dimm_unplug(hotplug_dev, dev, errp);
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        virt_cpu_unplug(hotplug_dev, dev, errp);
>       } else {
>           error_setg(errp, "virt: device unplug for unsupported device"
>                      " type: %s", object_get_typename(OBJECT(dev)));

Thanks,
Gavin
