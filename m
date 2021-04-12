Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4114510lfr;
        Mon, 12 Apr 2021 10:36:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Rbah4afqlnj/iPxUGLxT3+L9hldxvwiBWAlcbiPHn+ltJgd3+UVu5Ri9MF3GC4rkY5x/
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr24339647otk.279.1618249005509;
        Mon, 12 Apr 2021 10:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618249005; cv=none;
        d=google.com; s=arc-20160816;
        b=YZ7j9/vwBFmfo4xpcvaO5DcZwoifr4ve0OXKHpbc9mmYIi8eiSKFjKgTAi4gFFOyME
         A0iM/5YljgFxNFPfqE7jyQXy1CjG/b4+tx95VaPwi17JYtUBSGfKy4TmWuVEQ1k+XhQT
         nsE939v/4Jh+k6aMxsboG3bgjRyQKvyrmz2NEFY4OJvSOohLg5vXCoDUE/UbwyUlNIUU
         mX0kHCpGNgfQ2PRnrnIN0JGupR3NX3N2IzmVlUAnevy9hWZJNVhEpNiLLqqsodb7jWLI
         dKIe1sAg4s10ycr+F2GcvIY3lDKbQVF2zDgVaIWI7Q9Ub1q0s2AOm+/ct/bcbDehZh+P
         jTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WDw4Ui0mDQaD87KLUYKXnDfMvGFGqVuMdk5gS1Tf3hs=;
        b=ZVqJQkarH8QmokyRqNelNCtPR0vBDiE9CQUqHnxQ2HLdbABIA4zz3DWRjtgsv27JMO
         mo2JDZn+iKVQVzBswvmfdZf9toMK8uMwsZ4GD6Jac2GFRMNrfDWDCOYKdmb3RVtOILDf
         fWhglkG6mdnTlN/wm7kn/Oq+ntuac8s4paBrLHt5ToC2T+lRRhgyh/P1qbZLuTppfqIK
         BnMXRYoJV40oUWVO0OQ/lqG3L7Mf/85jXLQynMJjG/3W9A8yuwpGz3WIk6Fn1/ix8cUW
         5p1cBivNxuiEMlR8+hu5TeI1f/ttMKWj5Ppjm0Q980EevkukpXLmaf8o28FQdyF7oDTy
         vnzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Utv3vl6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si940684oom.67.2021.04.12.10.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 10:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Utv3vl6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lW0UO-0005i9-IY
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 13:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lW0UE-0005fM-3I
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 13:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lW0U5-0005Ti-OT
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 13:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618248982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDw4Ui0mDQaD87KLUYKXnDfMvGFGqVuMdk5gS1Tf3hs=;
 b=Utv3vl6cM6pv0rG4tByUidPDEJ3Fh9ramLjlK9FnQhhC5PS1mAB0yqIFBrY3RtNwa5TbxK
 sAy29hrlEZ8ktGP4sykWYGGlzRCZtDCPTwcUZqmmCwHI2WhzgP+K4k3OR1uvwGmp2ELVSR
 DXwoYJKYg7MUxyEVMwVfheay7B1UJPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-0z9Qd1q8MlesjNsEt0oHVA-1; Mon, 12 Apr 2021 13:36:20 -0400
X-MC-Unique: 0z9Qd1q8MlesjNsEt0oHVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEB4F85EE8B;
 Mon, 12 Apr 2021 17:36:17 +0000 (UTC)
Received: from [10.36.113.253] (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6E75D9DE;
 Mon, 12 Apr 2021 17:36:08 +0000 (UTC)
Subject: Re: [PATCH RFC RESEND v2 2/6] hw/pci: Add iommu option for pci root
 bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-3-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <88a49b26-40a2-e563-14eb-126944876113@redhat.com>
Date: Mon, 12 Apr 2021 19:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616656965-23328-3-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mqNjdyPhQv5G

Hi Wang,

On 3/25/21 8:22 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> This add iommu option for pci root bus, including primary bus
> and pxb root bus. The option is valid only if there is a virtual
> iommu device.
> 
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>

same in this patch I would prefer to inverse the logic and use something
like bypass_iommu.

Sorry it an invasive change for you. Maybe wait for the other's feedbacks.

> ---
>  hw/arm/virt.c                       | 25 +++++++++++++++++++++++++
>  hw/i386/pc.c                        | 19 +++++++++++++++++++
>  hw/pci-bridge/pci_expander_bridge.c |  3 +++
>  hw/pci-host/q35.c                   |  1 +
>  include/hw/arm/virt.h               |  1 +
>  include/hw/i386/pc.h                |  1 +
Also I think this patch would need to be split into several ones (at
least this is what I would do)
- 1 patch for the pci_expander_bridge.c  change ("add an iommy bypass prop")
- 1  patch for virt machine where you add a machine option to bypass the
iommu translation for the root bus.
- 1 patch of pc/q35

Indeed the patch title title does not reflect the machine changes and
the pxb changes
>  6 files changed, 50 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e0..446b3b867f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1366,6 +1366,7 @@ static void create_pcie(VirtMachineState *vms)
>      }
>  
>      pci = PCI_HOST_BRIDGE(dev);
> +    pci->iommu = vms->primary_bus_iommu;
>      vms->bus = pci->bus;
>      if (vms->bus) {
>          for (i = 0; i < nb_nics; i++) {
> @@ -2319,6 +2320,20 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>      }
>  }

>  
> +static bool virt_get_primary_bus_iommu(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->primary_bus_iommu;
> +}
> +
> +static void virt_set_primary_bus_iommu(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->primary_bus_iommu = value;
> +}
> +
>  static CpuInstanceProperties
>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  {
> @@ -2652,6 +2667,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set the IOMMU type. "
>                                            "Valid values are none and smmuv3");
>  
> +    object_class_property_add_bool(oc, "primary_bus_iommu",
> +                                  virt_get_primary_bus_iommu,
> +                                  virt_set_primary_bus_iommu);
> +    object_class_property_set_description(oc, "primary_bus_iommu",
> +                                          "Set on/off to enable/disable "
> +                                          "iommu for primary bus");
> +
>      object_class_property_add_bool(oc, "ras", virt_get_ras,
>                                     virt_set_ras);
>      object_class_property_set_description(oc, "ras",
> @@ -2719,6 +2741,9 @@ static void virt_instance_init(Object *obj)
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
>  
> +    /* The primary bus is attached to iommu by default */
> +    vms->primary_bus_iommu = true;
> +
>      /* Default disallows RAS instantiation */
>      vms->ras = false;
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25a03..b64e4bb7f2 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1529,6 +1529,21 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
>      pcms->hpet_enabled = value;
>  }
>  
> +static bool pc_machine_get_primary_bus_iommu(Object *obj, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +
> +    return pcms->primary_bus_iommu;
> +}
> +
> +static void pc_machine_set_primary_bus_iommu(Object *obj, bool value,
> +                                             Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +
> +    pcms->primary_bus_iommu = value;
> +}
> +
>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
> @@ -1628,6 +1643,7 @@ static void pc_machine_initfn(Object *obj)
>  #ifdef CONFIG_HPET
>      pcms->hpet_enabled = true;
>  #endif
> +    pcms->primary_bus_iommu = true;
>  
>      pc_system_flash_create(pcms);
>      pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
> @@ -1752,6 +1768,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
>  
> +    object_class_property_add_bool(oc, "primary_bus_iommu",
> +        pc_machine_get_primary_bus_iommu, pc_machine_set_primary_bus_iommu);
> +
>      object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
>          pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
>          NULL, NULL);
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index aedded1064..f1a0eadc03 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -57,6 +57,7 @@ struct PXBDev {
>  
>      uint8_t bus_nr;
>      uint16_t numa_node;
> +    bool iommu;
>  };
>  
>  static PXBDev *convert_to_pxb(PCIDevice *dev)
> @@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>      bus->map_irq = pxb_map_irq_fn;
>  
>      PCI_HOST_BRIDGE(ds)->bus = bus;
> +    PCI_HOST_BRIDGE(ds)->iommu = pxb->iommu;
>  
>      pxb_register_bus(dev, bus, &local_err);
>      if (local_err) {
> @@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
>      /* Note: 0 is not a legal PXB bus number. */
>      DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>      DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> +    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 2eb729dff5..3b23fd0975 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -64,6 +64,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
>                                  s->mch.address_space_io,
>                                  0, TYPE_PCIE_BUS);
>      PC_MACHINE(qdev_get_machine())->bus = pci->bus;
> +    pci->iommu = PC_MACHINE(qdev_get_machine())->primary_bus_iommu;
>      qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
>  }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..1fbb19710f 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -147,6 +147,7 @@ struct VirtMachineState {
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> +    bool primary_bus_iommu;
>      VirtMSIControllerType msi_controller;
>      uint16_t virtio_iommu_bdf;
>      struct arm_boot_info bootinfo;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index dcf060b791..07b08b3ac6 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,6 +45,7 @@ typedef struct PCMachineState {
>      bool sata_enabled;
>      bool pit_enabled;
>      bool hpet_enabled;
> +    bool primary_bus_iommu;
>      uint64_t max_fw_size;
>  
>      /* NUMA information: */
> 

Thanks

Eric

