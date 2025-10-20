Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7414CCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 16:32:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAsnZ-000206-NX; Mon, 20 Oct 2025 12:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vAsnW-0001yc-C3
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 12:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vAsnT-0002N6-BV
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 12:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760977904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eliS72N0sdUsfaYKdTm7smRN3W9Mo6oi1QQs5hUEzKQ=;
 b=jDEdNlCwgpcEhcRIB7PZWc0AFqV/uj4cKF3W65ulpSnPqFleSFFHUhKm2jVDfOaPVbS1fI
 VBDJxHb4ZNM9H6rY2QRkxu//FP/2hbG6NmnbzqxrDxFzJnOxknSSs0kLKZNI2J/RLfSxHB
 mRtAijNXcpRAhYX33kOF8ESJSffc+Qs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-5BA0t71HO_qco1eNEcLDgg-1; Mon, 20 Oct 2025 12:31:42 -0400
X-MC-Unique: 5BA0t71HO_qco1eNEcLDgg-1
X-Mimecast-MFC-AGG-ID: 5BA0t71HO_qco1eNEcLDgg_1760977901
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47111dc7bdbso35041715e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 09:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760977901; x=1761582701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eliS72N0sdUsfaYKdTm7smRN3W9Mo6oi1QQs5hUEzKQ=;
 b=eer6IQHN0bE70NSdxxn05JXDlzOncMDvIp1xP0xzFrSfTG9B5PHRHY03ANklDLCVdn
 kqLK12WBK/IvlchtgxVIRlqsHhwlDn1wy1SCHj9tOKI6JEdkwYP4FbgZWY3Xr2vbfTuX
 hylQPikCPa5uvaqYdF483zIVl0tqESX4RdOnv2cdtpgwXaFIJMTHQP0/or2WLJUUiu45
 Rcx0mDFNhVISSiVSNX9nLEhdjaOUj2zBK8/+JCnCpCzI1eLMf3RyJeEtOQw7bHdXjwyY
 RxJaW0Assqx9RVnRxoCdFvylyzqIScrIz4zwYFHufPtvV+PuM0a6jllLEnX8qJ6/Gl5J
 Pj9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvGehtyJoUxM8vhRFc5hl7V768AYhJNUkk0IMoUOyIV+R70Vju7iVTDSRbxx91xwNxNm1l4XcBoA==@nongnu.org
X-Gm-Message-State: AOJu0Yx+U1kd7hBN4Izn87LDdCdIa6isbtrKJZRzPgofBILuGbS+gT/5
 UGuUJpKgYMGfyffixsNlfkdM2RMd6917UADWl9lMDnNroNPxlk+lAIM2+Z+iBQ69rdGRb3IRUe5
 X8zX8xxtfKaWQW10hMPO4s7KO4Bf8WTviXWU38MUI3Il6tJzD4pDcww==
X-Gm-Gg: ASbGncth4j83I9A3BRMuYCKoDjmNFclKaxgC2drIxoaIZNsj2t30felfVs+N+IDgcrN
 NRaZyLScsVnfS2Z7CESHfXrRbXdUwEaSw5xxB+F+NIQGaC0WV+M40fCeiNDDerM/w9A5TLRcaBV
 ezSsVAIqUPsC5YznJQEY4UhAIuqQVSTnCdn2JI4aH6Wk3lhlSNzzcYmw1b9Bkik7uRWYNYY1B9d
 SXKorhn/zPONztLO5VW2UpA5SNv37YRzrO/MfrEVXO7EOHzYD/gzFbFMGrtkBwjdQV9YkYUArcp
 HTzJBq2XRpX93f8/gdbcvlJ1/qomMNKES/gyLRA0pffCsDNR1NuZEn16djBbF/dneN9VmoEHwTc
 aNwOg
X-Received: by 2002:a05:600c:3553:b0:46e:1cc6:25f7 with SMTP id
 5b1f17b1804b1-4711789daf3mr102148505e9.9.1760977901101; 
 Mon, 20 Oct 2025 09:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1/qUuMW9W/6SyzKFOBMd3J952H15FJU+wRJs69YecWnaGH0CDN3lmy/KBxDvm/P5UMjY9uA==
X-Received: by 2002:a05:600c:3553:b0:46e:1cc6:25f7 with SMTP id
 5b1f17b1804b1-4711789daf3mr102148135e9.9.1760977900653; 
 Mon, 20 Oct 2025 09:31:40 -0700 (PDT)
Received: from [192.168.43.95] ([37.166.134.90])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710ca2a4a0sm122015085e9.0.2025.10.20.09.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 09:31:40 -0700 (PDT)
Message-ID: <b222848f-c933-43dc-b6e0-97dd8455cee6@redhat.com>
Date: Mon, 20 Oct 2025 18:31:38 +0200
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
X-Mimecast-MFC-PROC-ID: yx6PH3JxvnOanMjDbsngyX94Y1HfqaLjhFw5jhsSky8_1760977901
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> Accelerated SMMUv3 is only useful when the device can take advantage of
> the host's SMMUv3 in nested mode. To keep things simple and correct, we
> only allow this feature for vfio-pci endpoint devices that use the iommufd
> backend. We also allow non-endpoint emulated devices like PCI bridges and
> root ports, so that users can plug in these vfio-pci devices. We can only
> enforce this if devices are cold plugged. For hotplug cases, give appropriate
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
> +            } else {
> +                warn_report("Hot plugging an emulated device %s with "
> +                            "accelerated SMMUv3. This will bring down "
> +                            "performace", pdev->name);
> +            }
> +            /*
> +             * Both cases, we will return IOMMU address space. For hotplugged
> +             * vfio-pci dev without iommufd as backend, it will fail later in
> +             * smmuv3_notify_flag_changed() with "requires iommu MAP notifier"
> +             * error message.
> +             */
> +             return &sdev->as;
> +        } else {
> +            error_report("Device(%s) not allowed. Only PCIe root complex "
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
From that comment one understands the need of a single and common AS.
However it is not obvious why it shall be

&address_space_memory and not an AS created on purpose.

Eric

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
>  #define TYPE_PXB_DEV "pxb"
>  OBJECT_DECLARE_SIMPLE_TYPE(PXBDev, PXB_DEV)
>  


