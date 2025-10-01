Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDECCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:33:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v40gw-000211-3k; Wed, 01 Oct 2025 13:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v40gu-000206-FB
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v40gl-0006mW-9P
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759339939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3r1p8vISCDCx0GaiYXude5XWmxv2WN87Fd9OKHm+KWI=;
 b=jI6pSSFfXVH4obWs8M9E+cEj46U14ZAxJyp+ueEKchwqbYZfoXmqG+GVjTcH4h8Uazl+Ev
 bizRyO5svEYIxgqNRdVjaJ/6FITG4isFRrAec8CnsiLsZX5EZJZq5x+Us71ATzpOiW3mYT
 aci3EQY6ovEy14NgGvgGbphG6X/Z700=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-Ts8XEqaTPW6noPQ5vMV3zw-1; Wed, 01 Oct 2025 13:32:17 -0400
X-MC-Unique: Ts8XEqaTPW6noPQ5vMV3zw-1
X-Mimecast-MFC-AGG-ID: Ts8XEqaTPW6noPQ5vMV3zw_1759339936
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3f93db57449so23634f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759339936; x=1759944736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3r1p8vISCDCx0GaiYXude5XWmxv2WN87Fd9OKHm+KWI=;
 b=kgwR1N94c0viLBgXdTiMvhC3Xfq4guKJpIjzje6E55PBt05lvLdhITsixQSEB0uV0e
 yMfgEqByKMvD0H++BrmGN2B9gMWzXTBWY1f9Y5klzZfIy90Eg3QMqxf+cH4do7wXA9Ox
 M2RHOGhrq39zTluTOnVKoPewgA17VUJ39ZbnX/0tLfZ7//aghNzjWp2B2t52ISKWSst8
 JMc1s8MdtqVMDHVuiNCGFL+LpRG23HONAP0jTjvbjE9aaBHY4qb7wg1fUW8D+inbpY68
 nr8T2Cx2p+ljpLX43OXfOoxISuDEhM+6lsXlwd6OdvV4xnaDVFtSnnud8gvJQ6WPCJd6
 ShYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRyhFJsToORiCd9yhIbV8w0PAwrfF54Aqbh/F9gJDVrpeqrTjaBNNVMCmGaN/ty0L7cOmYr0q6KQ==@nongnu.org
X-Gm-Message-State: AOJu0YziAYhOoZT8WIwTrjFxQdm39uO3sN72b9DHIuqea9t7A+Qm6Rkz
 EVnEwCTV1qAyHa+G3QJCp/VIebmjFlkS0ZcS1sY80UiqF/4EF/8lwFc7iaBskXuIjdCZAAZbLRs
 HXoChQdMD7WdUpkcnCEmT2nFCreubpwsWgurB/CFt9KGgDQF4I440hw==
X-Gm-Gg: ASbGncvAS7ysLOMzuay4l1LarxrNqw+LuU2iHcNX4ZksvYZB4j/dhqLUeIigfVGeHpT
 RwKstUF5lyVUJfT320EApzJgvdZ551U+KELsBZ0SujgHd4bdRROUPVCeAsGet4l+AV6zA0YZ/dX
 edbG+0+OcXKKbumAGUMqrDzTmZrMpAYhJk32Su0gJVBYybza0p/2fIXNb43E+Y1SaZwPytCvp+w
 a/QksGC1zlJxcwA7gpbqDMurItQ9iUUsxjjKkjJWfV8EWFUXeBZJ1sOvsw2BPcwEgB+i5CPpxhH
 CJamkKJud3g0YFQJrphCr490O4kMaTQ0Jek63f5B4fPZOWek9Ripl4w9Xa9uZ0BsBeAsKPMPByW
 kvHAIWApDA6xEpnmE
X-Received: by 2002:a05:6000:250c:b0:3ec:6259:5079 with SMTP id
 ffacd0b85a97d-425577ecaefmr3750320f8f.11.1759339936049; 
 Wed, 01 Oct 2025 10:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW80hCbhP/Y8cbFUnu+HLSl/x7K+UWXMr2PvKM2Kbgzu16CnV2sPJnkusXKH4ObYd2oM9cIw==
X-Received: by 2002:a05:6000:250c:b0:3ec:6259:5079 with SMTP id
 ffacd0b85a97d-425577ecaefmr3750286f8f.11.1759339935580; 
 Wed, 01 Oct 2025 10:32:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f083asm26095f8f.43.2025.10.01.10.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 10:32:14 -0700 (PDT)
Message-ID: <cba0a4c0-9d0c-4137-ae0a-7460da56ac56@redhat.com>
Date: Wed, 1 Oct 2025 19:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/27] hw/arm/smmuv3-accel: Restrict accelerated SMMUv3
 to vfio-pci endpoints with iommufd
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E0Pf3Dxwk6hykdr2m3T3dCW2PN53SwFOEZyJbqXSaFY_1759339936
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.518,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Shameer,

On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> Accelerated SMMUv3 is only useful when the device can take advantage of
> the host's SMMUv3 in nested mode. To keep things simple and correct, we
> only allow this feature for vfio-pci endpoint devices that use the iommufd
> backend. We also allow non-endpoint emulated devices like PCI bridges and
> root ports, so that users can plug in these vfio-pci devices. We can only
> enforce this if devices are cold plugged. For hotplug cases, give appropriate

"We can only enforce this if devices are cold plugged": I don't really understand that statement. you do checks when the device is hotplugged too. For emulated device you eventually allow them but you could decide to reject them? 

> warnings.
>
> Another reason for this limit is to avoid problems with IOTLB
> invalidations. Some commands (e.g., CMD_TLBI_NH_ASID) lack an associated
> SID, making it difficult to trace the originating device. If we allowed
> emulated endpoint devices, QEMU would have to invalidate both its own
> software IOTLB and the host's hardware IOTLB, which could slow things
> down.
>
> Since vfio-pci devices in nested mode rely on the host SMMUv3's nested
> translation (S1+S2), their get_address_space() callback must return the
> system address space so that VFIO core can setup correct S2 mappings
> for guest RAM.
>
> So in short:
>  - vfio-pci devices(with iommufd as backend) return the system address
>    space.
>  - bridges and root ports return the IOMMU address space.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c               | 68 ++++++++++++++++++++++++++++-
>  hw/pci-bridge/pci_expander_bridge.c |  1 -
>  include/hw/pci/pci_bridge.h         |  1 +
>  3 files changed, 68 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 79f1713be6..44410cfb2a 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -7,8 +7,13 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  
>  #include "hw/arm/smmuv3.h"
> +#include "hw/pci/pci_bridge.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/vfio/pci.h"
> +
>  #include "smmuv3-accel.h"
>  
>  static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
> @@ -29,15 +34,76 @@ static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
>      return accel_dev;
>  }
>  
> +static bool smmuv3_accel_pdev_allowed(PCIDevice *pdev, bool *vfio_pci)
> +{
> +
> +    if (object_dynamic_cast(OBJECT(pdev), TYPE_PCI_BRIDGE) ||
> +        object_dynamic_cast(OBJECT(pdev), TYPE_PXB_PCIE_DEV) ||
> +        object_dynamic_cast(OBJECT(pdev), TYPE_GPEX_ROOT_DEVICE)) {
> +        return true;
> +    } else if ((object_dynamic_cast(OBJECT(pdev), TYPE_VFIO_PCI))) {
> +        *vfio_pci = true;
> +        if (object_property_get_link(OBJECT(pdev), "iommufd", NULL)) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
>  static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
>                                                int devfn)
>  {
> +    PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
>      SMMUState *bs = opaque;
>      SMMUPciBus *sbus = smmu_get_sbus(bs, bus);
>      SMMUv3AccelDevice *accel_dev = smmuv3_accel_get_dev(bs, sbus, bus, devfn);
>      SMMUDevice *sdev = &accel_dev->sdev;
> +    bool vfio_pci = false;
> +
> +    if (pdev && !smmuv3_accel_pdev_allowed(pdev, &vfio_pci)) {
> +        if (DEVICE(pdev)->hotplugged) {
> +            if (vfio_pci) {
> +                warn_report("Hot plugging a vfio-pci device (%s) without "
> +                            "iommufd as backend is not supported", pdev->name);
with accelerated SMMUv3.

why don't we return NULL and properly handle this in the caller. May be
worth adding an errp to get_address_space(). I know this is cumbersome
though.
> +            } else {
> +                warn_report("Hot plugging an emulated device %s with "
> +                            "accelerated SMMUv3. This will bring down "
> +                            "performace", pdev->name);
performance
> +            }
> +            /*
> +             * Both cases, we will return IOMMU address space. For hotplugged
In both cases?
> +             * vfio-pci dev without iommufd as backend, it will fail later in
> +             * smmuv3_notify_flag_changed() with "requires iommu MAP notifier"
> +             * error message.
> +             */
> +             return &sdev->as;
> +        } else {
> +            error_report("Device(%s) not allowed. Only PCIe root complex "
device (%s)
> +                         "devices or PCI bridge devices or vfio-pci endpoint "
> +                         "devices with iommufd as backend is allowed with "
> +                         "arm-smmuv3,accel=on", pdev->name);
> +            exit(1);
> +        }
> +    }
>  
> -    return &sdev->as;
> +    /*
> +     * We return the system address for vfio-pci devices(with iommufd as
> +     * backend) so that the VFIO core can set up Stage-2 (S2) mappings for
> +     * guest RAM. This is needed because, in the accelerated SMMUv3 case,
> +     * the host SMMUv3 runs in nested (S1 + S2)  mode where the guest
> +     * manages its own S1 page tables while the host manages S2.
> +     *
> +     * We are using the global &address_space_memory here, as this will ensure
> +     * same system address space pointer for all devices behind the accelerated
> +     * SMMUv3s in a VM. That way VFIO/iommufd can reuse a single IOAS ID in
> +     * iommufd_cdev_attach(), allowing the Stage-2 page tables to be shared
> +     * within the VM instead of duplicating them for every SMMUv3 instance.
> +     */
> +    if (vfio_pci) {
> +        return &address_space_memory;
> +    } else {
> +        return &sdev->as;
> +    }
>  }
>  
>  static const PCIIOMMUOps smmuv3_accel_ops = {
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index 1bcceddbc4..a8eb2d2426 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -48,7 +48,6 @@ struct PXBBus {
>      char bus_path[8];
>  };
>  
> -#define TYPE_PXB_PCIE_DEV "pxb-pcie"
>  OBJECT_DECLARE_SIMPLE_TYPE(PXBPCIEDev, PXB_PCIE_DEV)
>  
>  static GList *pxb_dev_list;
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index a055fd8d32..b61360b900 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -106,6 +106,7 @@ typedef struct PXBPCIEDev {
>  
>  #define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
>  #define TYPE_PXB_CXL_BUS "pxb-cxl-bus"
> +#define TYPE_PXB_PCIE_DEV "pxb-pcie"
I agree with Nicolin, you shall rather move that change in a seperate patch.
>  #define TYPE_PXB_DEV "pxb"
>  OBJECT_DECLARE_SIMPLE_TYPE(PXBDev, PXB_DEV)
>  
Thanks

Eric


