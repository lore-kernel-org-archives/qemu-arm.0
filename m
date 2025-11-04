Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F2CCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 14:12:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGHlW-0000ej-Sn; Tue, 04 Nov 2025 09:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGHlU-0000dt-RQ
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGHlR-0003qB-IX
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762265520;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+W/rlbcUCIlG2wZMrAl39YK3Gxl6GXuNT8/hI5nrCms=;
 b=R+PabWGrLf2qdeqoh4JzuVpolOraRzbXsVee0X95P9YJx4qjl7KHz/VuGtTZ1o6b7tN6YM
 TTAVW0yJ7skVYgQwI5psvoovCoEkL76PyQEahPWnys/5polLIa+HB5L+JpfT63XB+tOSo5
 MH4qYCTRasK4W65xmhGUQNUTgrBoxkw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-K_viqbjHMOe3QMqd4DA37w-1; Tue, 04 Nov 2025 09:11:59 -0500
X-MC-Unique: K_viqbjHMOe3QMqd4DA37w-1
X-Mimecast-MFC-AGG-ID: K_viqbjHMOe3QMqd4DA37w_1762265518
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429cdb0706aso2443642f8f.0
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 06:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762265518; x=1762870318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+W/rlbcUCIlG2wZMrAl39YK3Gxl6GXuNT8/hI5nrCms=;
 b=Hc9VNCIFvz8QaMJfdZdN7Cw2QJwrryRbhwbvoBqpPFXmWgEsG/KTMzZhrXcr7GOHo1
 IKQSZ3lQaBxUwODfdmwtrhTWdEcdXKQgWqXsvyZFRZ8Mj2j7zCFd0sK7F3wSRt5sr9C2
 WNRa2rUmyeF46g1JYPtbFnEx1uRhgblxZXnYJI/4P+e0aRTY9gSjamH2JiUF3SbyPgKK
 3S4R+hMgrrFwtexprkY74+kLrEt71me1vVOQdt0y5eLnyQoyCTogDJzmnFOQp5kadLxE
 cGhd3tEQ5HTj6/OgPT93S4EMzxu6lzGxv1pGocQEytMUnxBu9pYThaKPc8DlVwVDJINL
 jiPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp/Ij7PD9QUMYKRQ+cCHHU1iApUMT/PO6w3EfR4pseExc5R/XEfRN5msHCfAb4cybrPOg+luJZ9A==@nongnu.org
X-Gm-Message-State: AOJu0Yx1I3dAD/9xhtDG0ODt//0RZjLQhZAq+x0xqkKi0BCTgAC7keKD
 yTiHXRpvSLGgF0O40pCYb7MgiPiHtDFXV4DO3Ti6pEq4rx/OGg6BrbuTSmmIPIOIzPnjIl3frsU
 HkY5GDyxo1PrhBRF0ezeIGkGGSK1JO3NDN9KHcQzF0U3EoBLcfOyw5Q==
X-Gm-Gg: ASbGncsPTTqPTVFmoCaH88X6BkvSJ9JWtj4mUKdZOPfvpY0BEqxpreMzr6BDLYBaGtg
 nfq90jOffkJFzp7PZS3UKsjL59KcgsJMvqAxLH6g2YBm1r/+pHxcu9PSn5EIXb2/CtIQUvN+JL2
 Wql4gCEhBXuwBpZVjfp4HC9enIqjIAixe2Qqe1sK6mHLaFpziWTGL8vN6VphYJDOPrTizpltnjV
 0evNzPrNYUXFSxSxsXzEcz72tsI7B4uBLWQyRjXjZlfW+LZIR+oZlVNsRGp3OFRl8YrRtxQu+7G
 6sBhhxuNClqRhWJBL8gyKWVbjhTzxO8UXE0uKQYbgzY6hf+JI1LO3dWRhBchTbuvk29xKCjStP5
 4KzrWsBPRQ9x6PfAPPwGVfwpKl2l9R+bL31ugnrVve81TMA==
X-Received: by 2002:a05:6000:1a8a:b0:429:d19f:d922 with SMTP id
 ffacd0b85a97d-429d19fdff8mr8238753f8f.11.1762265517647; 
 Tue, 04 Nov 2025 06:11:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdsxE2ONO79JJE6ndykx6hmefcPbbe3rGe4soyRyb0AJo30Vn6ixBIGKovyJFPrgvUzEBxwA==
X-Received: by 2002:a05:6000:1a8a:b0:429:d19f:d922 with SMTP id
 ffacd0b85a97d-429d19fdff8mr8238712f8f.11.1762265517103; 
 Tue, 04 Nov 2025 06:11:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc192ac4sm5087448f8f.17.2025.11.04.06.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 06:11:56 -0800 (PST)
Message-ID: <318947de-4467-4ced-a5d2-929e3df210ef@redhat.com>
Date: Tue, 4 Nov 2025 15:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-16-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-16-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Sny9n78QAWOfdq0JXebgRC7GyaUT3TM68VXc8VY5Kc_1762265518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer, Nicolin,

On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> On ARM, devices behind an IOMMU have their MSI doorbell addresses
> translated by the IOMMU. In nested mode, this translation happens in
> two stages (gIOVA → gPA → ITS page).
>
> In accelerated SMMUv3 mode, both stages are handled by hardware, so
> get_address_space() returns the system address space so that VFIO
> can setup stage-2 mappings for system address space.

Sorry but I still don't catch the above. Can you explain (most probably
again) why this is a requirement to return the system as so that VFIO
can setup stage-2 mappings for system address space. I am sorry for
insisting (at the risk of being stubborn or dumb) but I fail to
understand the requirement. As far as I remember the way I integrated it
at the old times did not require that change:
https://lore.kernel.org/all/20210411120912.15770-1-eric.auger@redhat.com/
I used a vfio_prereg_listener to force the S2 mapping.

What has changed that forces us now to have this gym


>
> However, QEMU/KVM also calls this callback when resolving
> MSI doorbells:
>
>   kvm_irqchip_add_msi_route()
>     kvm_arch_fixup_msi_route()
>       pci_device_iommu_address_space()
>         get_address_space()
>
> VFIO device in the guest with a SMMUv3 is programmed with a gIOVA for
> MSI doorbell. This gIOVA can't be used to setup the MSI doorbell
> directly. This needs to be translated to vITS gPA. In order to do the
> doorbell transalation it needs IOMMU address space.
>
> Add an optional get_msi_address_space() callback and use it in this
> path to return the correct address space for such cases.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/pci/pci.c         | 18 ++++++++++++++++++
>  include/hw/pci/pci.h | 16 ++++++++++++++++
>  target/arm/kvm.c     |  2 +-
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index fa9cf5dab2..1edd711247 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2982,6 +2982,24 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>      return &address_space_memory;
>  }
>  
> +AddressSpace *pci_device_iommu_msi_address_space(PCIDevice *dev)
> +{
> +    PCIBus *bus;
> +    PCIBus *iommu_bus;
> +    int devfn;
> +
> +    pci_device_get_iommu_bus_devfn(dev, &iommu_bus, &bus, &devfn);
> +    if (iommu_bus) {
> +        if (iommu_bus->iommu_ops->get_msi_address_space) {
> +            return iommu_bus->iommu_ops->get_msi_address_space(bus,
> +                                 iommu_bus->iommu_opaque, devfn);
> +        }
> +        return iommu_bus->iommu_ops->get_address_space(bus,
> +                                 iommu_bus->iommu_opaque, devfn);
> +    }
> +    return &address_space_memory;
> +}
> +
>  int pci_iommu_init_iotlb_notifier(PCIDevice *dev, IOMMUNotifier *n,
>                                    IOMMUNotify fn, void *opaque)
>  {
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index dfeba8c9bd..b731443c67 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -664,6 +664,21 @@ typedef struct PCIIOMMUOps {
>                              uint32_t pasid, bool priv_req, bool exec_req,
>                              hwaddr addr, bool lpig, uint16_t prgi, bool is_read,
>                              bool is_write);
> +    /**
> +     * @get_msi_address_space: get the address space for MSI doorbell address
> +     * for devices
> +     *
> +     * Optional callback which returns a pointer to an #AddressSpace. This
> +     * is required if MSI doorbell also gets translated through vIOMMU(eg: ARM)
> +     *
> +     * @bus: the #PCIBus being accessed.
> +     *
> +     * @opaque: the data passed to pci_setup_iommu().
> +     *
> +     * @devfn: device and function number
> +     */
> +    AddressSpace * (*get_msi_address_space)(PCIBus *bus, void *opaque,
> +                                            int devfn);
>  } PCIIOMMUOps;
>  
>  bool pci_device_get_iommu_bus_devfn(PCIDevice *dev, PCIBus **piommu_bus,
> @@ -672,6 +687,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
>  bool pci_device_set_iommu_device(PCIDevice *dev, HostIOMMUDevice *hiod,
>                                   Error **errp);
>  void pci_device_unset_iommu_device(PCIDevice *dev);
> +AddressSpace *pci_device_iommu_msi_address_space(PCIDevice *dev);
>  
>  /**
>   * pci_device_get_viommu_flags: get vIOMMU flags.
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..0df41128d0 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1611,7 +1611,7 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> -    AddressSpace *as = pci_device_iommu_address_space(dev);
> +    AddressSpace *as = pci_device_iommu_msi_address_space(dev);
>      hwaddr xlat, len, doorbell_gpa;
>      MemoryRegionSection mrs;
>      MemoryRegion *mr;

Eric


