Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2911357ejc;
        Thu, 28 Sep 2023 17:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfX1LumJzgVliD3p5tzsq0QazIA7QaWarA3bKPnYMIyR+k1syTpUOmix2uhgpFMX23zCbA
X-Received: by 2002:a05:620a:24c5:b0:774:19a4:117a with SMTP id m5-20020a05620a24c500b0077419a4117amr2990465qkn.19.1695946875115;
        Thu, 28 Sep 2023 17:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695946875; cv=none;
        d=google.com; s=arc-20160816;
        b=m8l0F1mIay+BUXt4iBxdDQaEejAsRtld7bCL7pRdY/1jXjd7q8u31elO4+Zpj66e5p
         t72aomX54r/NyYiJx05EMB7taXBj4BnvWjML0hJDSceSm8oT3BJko2uSM6yz+W42OY6P
         hqsAloxifspX7xqH6NVtrVimModlIiPdbqaYBcdNn1btApsN77wFkSJZFHNbwPCTzB2Q
         NJjNqJRWeN09LGZlcBZZ/J9FZ5C8h4GQaDwl3h4J47GufQrpIIxir9rc9/hEgI1ixRih
         Y4aDHuWuCpmsAUwD+HkWL1bxPmw6tvKs20iMckKQy9SO8HaJ/kRIGb3TPaPtomshkW3m
         9yfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZJB2BdDh4bjeaVK/Hf9SI83loGC9TjsnJn0/tRn5dKg=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=CxOFZOOVuCqQLW1EdH7CWf3VerwIbcl9idaUrsnbyGoIThjTfQmym4et4qyinD+/ZK
         CWkgakNDFH0x54a4CQP8UxMwm2Gyj/5pKIxrc+b/X/xKEYg2AOOANL5rVuncV9tqW3FV
         2J26s4bk55y0Z1lKqG0pIFKCnYfZ4AVhy9GxW6tYzxBNfmfaRbpTh2zwxvLZz/JvFo3E
         puu6GiwMlQ1YV8gCjQXtvAaDxj5bYkVe8xu3ftV8IWlLg35Wzr2tQlqc/ZKV92Uy22ld
         Cpz1AmGmWeg7vMDgoXuQt/IMm107s3Mv4ViqQUBsX/6u4d+7v3J2HUenlUWozcURyjWP
         Av3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/oBzgcp";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bk27-20020a05620a1a1b00b00767e30f501asi9634893qkb.402.2023.09.28.17.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/oBzgcp";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695946874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJB2BdDh4bjeaVK/Hf9SI83loGC9TjsnJn0/tRn5dKg=;
	b=O/oBzgcp10CC5ZwHhKUjznf/aScWG4qFnUaMPEwN+T6UDD4y4MiZ4AP5/FEuPT+Jc7ARC2
	NJKYON45TYHePTnIoD3IR+ugLv35YSWBCD3fyAhZodJPfmKW24HzWFtg+fw18e3dXekzgg
	X/NSSXo/J783LPXCvlCRW2w3n9Vwx50=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-42ML8Ii5P2Km_je45677ww-1; Thu, 28 Sep 2023 20:21:12 -0400
X-MC-Unique: 42ML8Ii5P2Km_je45677ww-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-277616d8a01so106852a91.0
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 17:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946871; x=1696551671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJB2BdDh4bjeaVK/Hf9SI83loGC9TjsnJn0/tRn5dKg=;
        b=G2gnho22JnhFFoJG41bkuvGNxkVtDGFYeBHRNgDy1SZ1qKpXWEvQqzNoL+9eDYYQpR
         MYGOr2I3vqoWfvPjoXh80Q+yA0dvdsHM5fD8T3e6dBTwrbHdyZRbSlNwKiHE+a0VVxTz
         mngMycxVf/lZa6Y0HxXTejcKtP/XSVZQPFauI4qQ75H1ps4bv2m9SPZTl+cj3r/Az1zy
         D4qp69ibFhRFgZKOLW+jWahvhrTZNJZ2o7kkBdlv4kX1q79f8M97WJFUsp20ENeSC4i9
         B99MZxDtkqGuOBGjGQngRCUFOej+Xc2NFc3U5kWtHT7POhhe2y2ufSdRaICt1ONYBJe/
         fpNw==
X-Gm-Message-State: AOJu0Yzx+e3QffkEaNXYDQYkQf9jEBg3rpBWnrtIrsWt0O6dPi3Hs6Sm
	Hcuxi0xHCfMlyyoh0GjMwSbNhxq85Wi7Squo3PBCwr7wlIfeBZB11Ykxl4gPl/yKRLSMCsoV8Cl
	jhbywa38bmfGffK/3
X-Received: by 2002:a17:90a:e48:b0:274:a241:a7a8 with SMTP id p8-20020a17090a0e4800b00274a241a7a8mr4379703pja.0.1695946871179;
        Thu, 28 Sep 2023 17:21:11 -0700 (PDT)
X-Received: by 2002:a17:90a:e48:b0:274:a241:a7a8 with SMTP id p8-20020a17090a0e4800b00274a241a7a8mr4379645pja.0.1695946870581;
        Thu, 28 Sep 2023 17:21:10 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id mg11-20020a17090b370b00b002609cadc56esm142947pjb.11.2023.09.28.17.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 17:21:09 -0700 (PDT)
Message-ID: <f18990cd-c211-4c23-aecb-0aec076bc19b@redhat.com>
Date: Fri, 29 Sep 2023 10:20:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 25/37] arm/virt: Add/update basic hot-(un)plug
 framework
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-26-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-26-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: M4fftxAsguHa

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> Add CPU hot-unplug hooks and update hotplug hooks with additional sanity checks
> for use in hotplug paths.
> 
> Note, Functional contents of the hooks(now left with TODO comment) shall be
> gradually filled in the subsequent patches in an incremental approach to patch
> and logic building which would be roughly as follows:
> 1. (Un-)wiring of interrupts between vCPU<->GIC
> 2. Sending events to Guest for hot-(un)plug so that guest can take appropriate
>     actions.
> 3. Notifying GIC about hot-(un)plug action so that vCPU could be (un-)stitched
>     to the GIC CPU interface.
> 4. Updating the Guest with Next boot info for this vCPU in the firmware.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3b068534a8..dce02136cb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -81,6 +81,7 @@
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/char/pl011.h"
>   #include "qemu/guest-random.h"
> +#include "qapi/qmp/qdict.h"
>   
>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -2985,12 +2986,23 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>   {
>       VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>       MachineState *ms = MACHINE(hotplug_dev);
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>       ARMCPU *cpu = ARM_CPU(dev);
>       CPUState *cs = CPU(dev);
>       CPUArchId *cpu_slot;
>       int32_t min_cpuid = 0;
>       int32_t max_cpuid;
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

I guess these can be combined to:

        if (dev->hotplugged && (!mc->has_hotpluggable_cpus || !vms->acpi_dev)) {
            error_setg(errp, "CPU hotplug not supported or GED ACPI device not exist");
        }

Besides, need we check (vms->gic_version == VIRT_GIC_VERSION_3)?

>       /* sanity check the cpu */
>       if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
>           error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
> @@ -3039,6 +3051,22 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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

When looking at these 'TODO', it seems you need order the patches to make those
preparatory patches ahead of this one. In this way, the 'TODO' can be avoided.

>       /*
>        * To give persistent presence view of vCPUs to the guest, ACPI might need
>        * to fake the presence of the vCPUs to the guest but keep them disabled.
> @@ -3050,6 +3078,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>   static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                             Error **errp)
>   {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>       MachineState *ms = MACHINE(hotplug_dev);
>       CPUState *cs = CPU(dev);
>       CPUArchId *cpu_slot;
> @@ -3058,10 +3087,81 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>       cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
>       cpu_slot->cpu = OBJECT(dev);
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

We needn't validate vms->acpi_dev again since it has been done in pre_plug().

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
> +    cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
> +
> +    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
> +
> +    /* TODO: unwire the gic-cpu irqs here */
> +    /* TODO: update the GIC about this hot unplug change */
> +
> +    /* TODO: unregister cpu for reset & update F/W info for the next boot */
> +

Same as above.

> +    qobject_unref(dev->opts);
> +    dev->opts = NULL;
> +
> +    cpu_slot->cpu = NULL;
> +    cs->disabled = true;
> +
> +    return;
> +}
> +
>   static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                               DeviceState *dev, Error **errp)
>   {
> @@ -3185,6 +3285,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
>                                        errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        virt_cpu_unplug_request(hotplug_dev, dev, errp);
>       } else {
>           error_setg(errp, "device unplug request for unsupported device"
>                      " type: %s", object_get_typename(OBJECT(dev)));
> @@ -3198,6 +3300,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
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
