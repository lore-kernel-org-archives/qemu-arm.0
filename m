Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp393555lfg;
        Wed, 10 Mar 2021 02:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuh/J80C65ZIyOrTdKJiSUTwsT4x8WPQnjqV1TjrHyZkoz1FkrKjB6nh+t4VE6wkVkNMwd
X-Received: by 2002:a25:824c:: with SMTP id d12mr3189079ybn.137.1615372009689;
        Wed, 10 Mar 2021 02:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615372009; cv=none;
        d=google.com; s=arc-20160816;
        b=cn8YIATofiDHe272d7UPaHemVtKkhzMo+0qnAOtwhKCIduzie/85wE5IxOxrIQiU2P
         0OYCXqoDj/KYWyS9UC+Ifm6n+UowCzcawZNb6Y0wEkkMvkxfs0Laqy+UAgFhV8MU8BYj
         Z49udmyChQCfxxUfSRCU0sgQ+B2YyLgEjmMZWHmlxZ7byhTVVkWJazt07AvNjwKQfZjO
         Yc0fm0wE85UM1ZKyrW6aNuSeicX10rBRA0MTJFcn82Y4VtTyIN+J4qs55kfJgd/PaUF2
         ANLb8YrrZ9JocqYikZ/Od+/HalfM18MMySTYP8+jg4iIghuSowHwRDs67X+LZWRBOwZ7
         2ALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FwIVk9TDN3wTwMerpy/yjrfrS7RijRCQd7SwqxSWCWo=;
        b=GBuDNBOXteJrVSH36XDjBg9Qa3tODgIsDYomDQ7N/BTwI2OCQiVz5nZrDGQq69tKGs
         Fp1XEjsrJh0N+bEsxhmXrmg4EJD6dVjhx3ryeUC+oXVzJyj850JIkCwzwBLAA/L7fyFF
         03byy6TUd0lC4VjUnYp1DEraFKoaFRDWoOxOYsfZ9XqDo53rVukqwJfiYfRwe54RMrMM
         ywee8n0Wo2wMfnKPqdqm25Eu9TFGEs0Bc00BISDgr1aMgI/s65jMZ9xsFEZX782AiEvB
         lfUsgByxi4dPmAkfOQggheNaeiUSu7bdfojWBO+aunEKR2uFoS0Fzxr++pN041yoHT43
         udSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJSPvtq8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16si19649339ybq.342.2021.03.10.02.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 02:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJSPvtq8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJw3E-00072B-Vn
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 05:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJw1R-0005JA-7N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJw1O-0005r7-0y
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615371893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwIVk9TDN3wTwMerpy/yjrfrS7RijRCQd7SwqxSWCWo=;
 b=IJSPvtq86w4GNs20+kHwvZOVb6A220FEKmwyhy5n3ChxA1/axdROrW9Vi+i/zyZsX3GJkY
 UbrnPcx30I7gCcpt2wdDDnE4U/4Vgw63phafn1j8M5p63e+q1pMyX4XC10Ay2OoVjd0kPy
 R3QkN7JoaIjKojZQn7CDxC81b4248hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-tbYYThxrPMa8foXZdQNrPg-1; Wed, 10 Mar 2021 05:24:51 -0500
X-MC-Unique: tbYYThxrPMa8foXZdQNrPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1142519067E5;
 Wed, 10 Mar 2021 10:24:50 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B30B660C0F;
 Wed, 10 Mar 2021 10:24:44 +0000 (UTC)
Subject: Re: [RFC RESEND PATCH 2/4] hw/pci: Add iommu option for pci root bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <1614414831-39712-3-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d5cac8e3-2584-e904-0d1f-92058b45975e@redhat.com>
Date: Wed, 10 Mar 2021 11:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614414831-39712-3-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /94QUNYdxeQo

Hi Xingang,

On 2/27/21 9:33 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> This add iommu option for pci root bus, including primary bus
> and pxb root bus. Default option is set to true, and the option
> is valid only if the iommu option for machine is properly set.
> 
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/arm/virt.c                       | 29 +++++++++++++++++++++++++++++
>  hw/pci-bridge/pci_expander_bridge.c |  6 ++++++
>  hw/pci/pci.c                        |  2 +-
>  include/hw/arm/virt.h               |  1 +
>  4 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 371147f3ae..0c9e549759 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -79,6 +79,7 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/char/pl011.h"
>  #include "qemu/guest-random.h"
> +#include "include/hw/pci/pci_bus.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1232,6 +1233,10 @@ static void create_smmu(const VirtMachineState *vms,
>  
>      dev = qdev_new("arm-smmuv3");
>  
> +    if (vms->primary_bus_iommu) {
> +        bus->flags |= PCI_BUS_IOMMU;
> +    }
> +
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> @@ -2305,6 +2310,20 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
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
> @@ -2629,6 +2648,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
> @@ -2696,6 +2722,9 @@ static void virt_instance_init(Object *obj)
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
>  
> +    /* Iommu is enabled by default for primary bus */
> +    vms->primary_bus_iommu = true;
> +
>      /* Default disallows RAS instantiation */
>      vms->ras = false;
>  
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index aedded1064..0412656265 100644
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
> @@ -254,6 +255,10 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>      bus->address_space_io = pci_get_bus(dev)->address_space_io;
>      bus->map_irq = pxb_map_irq_fn;
>  
> +    if (pxb->iommu) {
> +        bus->flags |= PCI_BUS_IOMMU;
> +    }
> +
>      PCI_HOST_BRIDGE(ds)->bus = bus;
>  
>      pxb_register_bus(dev, bus, &local_err);
> @@ -301,6 +306,7 @@ static Property pxb_dev_properties[] = {
>      /* Note: 0 is not a legal PXB bus number. */
>      DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>      DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> +    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
looks a bit odd to me that we have a property for the PXE-PCIe extra
root complex and not for the gpex device. Wouldn't it make sense to add
one for the GPEX too? In the positive you still could have a machine
option that would force the GPEX property value?
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a9ebef8a35..dc969989c9 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2712,7 +2712,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>  
>          iommu_bus = parent_bus;
>      }
> -    if (iommu_bus && iommu_bus->iommu_fn) {
> +    if (pci_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>      }
>      return &address_space_memory;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ee9a93101e..babe829486 100644
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
> 
Thanks

Eric

