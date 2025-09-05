Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61BFCA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 10:12:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuTQ9-0001Io-0o; Fri, 05 Sep 2025 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTQ6-0001F1-Tm
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTQ1-00053M-Iz
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757067100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sl5vXkm1zgAhsI1IydC5oOGgKEGuSu3xWGkzoq2ARQU=;
 b=BF9G67CG7HZr1A2ooaZWwMsToshe/qIzPbFA7/IWOIogzb7xSvNPxchisMrV8N4smCgOt8
 nR6aM1iziibpdA8P5nsLMDpS6tgM0Tb2djRN767ij+4vdsedfkLaSoehhTg2bsl/zQ9cMn
 n2psTOFZeCRgvhmgoaGECS5+2dcyShg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-D2pDR5NBNIm6p5MpjIz4VA-1; Fri, 05 Sep 2025 06:11:39 -0400
X-MC-Unique: D2pDR5NBNIm6p5MpjIz4VA-1
X-Mimecast-MFC-AGG-ID: D2pDR5NBNIm6p5MpjIz4VA_1757067098
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3e04ea95c6cso1117704f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 03:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757067096; x=1757671896;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sl5vXkm1zgAhsI1IydC5oOGgKEGuSu3xWGkzoq2ARQU=;
 b=Cdns75dBP77xGF2cuK/efyY8wwu3Ymb01SkuvWoxewrDRG1omXSYx4zOVtlkcnRpOr
 2xIicJhHfQxYYj5r8htVZZcFx2PDzF9XJnHFOT+jp2jC5n/V639+yyWGawYZizyOrSF2
 5vhVsH4dQB31SqcEdGFu2Dlbup2UGXq1DFS8Wb8tZotQSAARpVmTYK3XfYm0svFgP8oS
 ew3mqN0y7hxHux8ypOYwzcjYUj7eETJpml5Xm0O7naV6F7stcCAUHzdruTOUhaxbb/Pl
 d+AM42pgOPiUPGLYWnwYmQ9N9fnAcmNkAgd8Ysq0L15/OR312G28TnnNwq38cNL/06mC
 MYPA==
X-Gm-Message-State: AOJu0YyBjqJY1ooHX+Fh7l+gE2tNcJ0eJ+tW8nQO0BgekVXCbdxyfB1I
 xJGuk2e5ory7ap7lHjQoDPQiFsLmwOsTcu8i47Dnj0eqeBKGNYI2an209bdX//cSQkVZ9ghJXPo
 L5VZhuh6x2eEnRnW1QFv3JYvCyoVsUxuUfC3s8Eh03Bi/OFMoDatmC1cQ/w0GpOmzGR7tEnoMv3
 f4spVuRx8X4V1WXG2CEFzeXSb+QQ3HgDX7HMUacRm83c8=
X-Gm-Gg: ASbGncuEQvnwJ+LvGoH8aDQCLn223A241I7H3n6XlpPk0zyD7KuKaPYlAkXHMcCuodt
 uT5wGCyB4k6welZmib7ni5pouZWdeDoljyrccu1pVJdCrVJnSA0HW9YgHijH6NuJBXX5+6yNtNv
 kjUR5AaeaNFR27aJJvD0uhGa1f4F5xp7u4XtccRdMHYKFBQ2gY8JuWsyIXbruyGo3vMD/s4ownw
 yw2CG+kQ84OWk8nKpHRW4VQ/0CYEDTFLORwCnxYUnb6Jk6AxAJ+lQCsZviiMtGkkCDksqE3s87S
 cYV9rbVJWUm03YSQbTuEiwfHeCWAsKVSF1ai9baBTKd0FIa3rFFpHFoBdNpeOFFZpMFWIAjuIG3
 E3ZfQUGwFW+8=
X-Received: by 2002:a5d:5d8a:0:b0:3d1:c805:816 with SMTP id
 ffacd0b85a97d-3d1dca7c538mr14506544f8f.2.1757067096268; 
 Fri, 05 Sep 2025 03:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2VF7nfO323MivjzixnEDdQ6u/sneZuBZ0sXoKT+4C+H0Mu4e+5IunXA2D339b13jc8GU1Jg==
X-Received: by 2002:a5d:5d8a:0:b0:3d1:c805:816 with SMTP id
 ffacd0b85a97d-3d1dca7c538mr14506509f8f.2.1757067095718; 
 Fri, 05 Sep 2025 03:11:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e329475a13sm2740992f8f.14.2025.09.05.03.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:11:35 -0700 (PDT)
Message-ID: <d29ccf81-59d2-4ae4-9548-f27cfc4255c5@redhat.com>
Date: Fri, 5 Sep 2025 12:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 11/15] hw/pci/pci: Introduce optional
 get_msi_address_space() callback.
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, skolothumtho@nvidia.com
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-12-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-12-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DPKk1XVDddPxB1cgffBRPVzjJUMDa69HUMxrbnOZj68_1757067098
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> On ARM, when a device is behind an IOMMU, its MSI doorbell address is
> subject to translation by the IOMMU. This behavior affects vfio-pci
> passthrough devices assigned to guests using an accelerated SMMUv3.
>
> In this setup, we configure the host SMMUv3 in nested mode, where
> VFIO sets up the Stage-2 (S2) mappings for guest RAM, while the guest
> controls Stage-1 (S1). To allow VFIO to correctly configure S2 mappings,
> we currently return the system address space via the get_address_space() callback for vfio-pci devices.
>
> However, QEMU/KVM also uses this same callback path when resolving the
> address space for MSI doorbells:
>
> kvm_irqchip_add_msi_route()
>   kvm_arch_fixup_msi_route()
>     pci_device_iommu_address_space()
>
> This leads to problems when MSI doorbells need to be translated.
Worth to explain the exact "problem" ;-)

Eric
>
> To fix this, introduce an optional get_msi_address_space() callback.
> In the SMMUv3 accelerated case, this callback returns the IOMMU address
> space if the guest has set up S1 translations for the vfio-pci device.
> Otherwise, it returns the system address space.
>
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c | 25 +++++++++++++++++++++++++
>  hw/pci/pci.c          | 19 +++++++++++++++++++
>  include/hw/pci/pci.h  | 16 ++++++++++++++++
>  target/arm/kvm.c      |  2 +-
>  4 files changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> i	ndex f1584dd775..04c665ccf5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -346,6 +346,30 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      }
>  }
>  
> +static AddressSpace *smmuv3_accel_find_msi_as(PCIBus *bus, void *opaque,
> +                                                  int devfn)
> +{
> +    SMMUState *bs = opaque;
> +    SMMUPciBus *sbus;
> +    SMMUv3AccelDevice *accel_dev;
> +    SMMUDevice *sdev;
> +
> +    sbus = smmu_get_sbus(bs, bus);
> +    accel_dev = smmuv3_accel_get_dev(bs, sbus, bus, devfn);
> +    sdev = &accel_dev->sdev;
> +
> +    /*
> +     * If the assigned vfio-pci dev has S1 translation enabled by
> +     * Guest, return IOMMU address space for MSI translation.
> +     * Otherwise, return system address space.
> +     */
> +    if (accel_dev->s1_hwpt) {
> +        return &sdev->as;
> +    } else {
> +        return &accel_dev->as_sysmem;
> +    }
> +}
> +
>  static bool smmuv3_accel_pdev_allowed(PCIDevice *pdev, bool *vfio_pci)
>  {
>  
> @@ -407,6 +431,7 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_viommu_cap = smmuv3_accel_get_viommu_cap,
>      .set_iommu_device = smmuv3_accel_set_iommu_device,
>      .unset_iommu_device = smmuv3_accel_unset_iommu_device,
> +    .get_msi_address_space = smmuv3_accel_find_msi_as,
>  };
>  
>  void smmuv3_accel_init(SMMUv3State *s)
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 13de0e2809..404aeb643d 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2957,6 +2957,25 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
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
> +        } else {
> +            return iommu_bus->iommu_ops->get_address_space(bus,
> +                                 iommu_bus->iommu_opaque, devfn);
> +        }
> +    }
> +    return &address_space_memory;
> +}
> +
>  int pci_iommu_init_iotlb_notifier(PCIDevice *dev, IOMMUNotifier *n,
>                                    IOMMUNotify fn, void *opaque)
>  {
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d1d43e9fb9..55138c406e 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -639,12 +639,28 @@ typedef struct PCIIOMMUOps {
>                              uint32_t pasid, bool priv_req, bool exec_req,
>                              hwaddr addr, bool lpig, uint16_t prgi, bool is_read,
>                              bool is_write);
> +    /**
> +     * @get_msi_address_space: get the address space for MSI doorbell address
> +     * for devices
> +     *
> +     * Optional callback which returns a pointer to an #AddressSpace. This
> +     * is required if MSI doorbell also gets translated through IOMMU(eg: ARM)
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
>  AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
>  bool pci_device_set_iommu_device(PCIDevice *dev, HostIOMMUDevice *hiod,
>                                   Error **errp);
>  void pci_device_unset_iommu_device(PCIDevice *dev);
> +AddressSpace *pci_device_iommu_msi_address_space(PCIDevice *dev);
>  
>  /**
>   * pci_device_get_viommu_cap: get vIOMMU capabilities.
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 6672344855..c78d0d59bb 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1535,7 +1535,7 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> -    AddressSpace *as = pci_device_iommu_address_space(dev);
> +    AddressSpace *as = pci_device_iommu_msi_address_space(dev);
>      hwaddr xlat, len, doorbell_gpa;
>      MemoryRegionSection mrs;
>      MemoryRegion *mr;


