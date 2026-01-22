Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B93D6CFA6
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 21:35:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vj2Kr-0003iM-7i; Thu, 22 Jan 2026 16:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vj2Kh-0003eG-Rg
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 16:35:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vj2Kg-0003xg-2g
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 16:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769117707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fL7oemlFMMP/z+tSAAQcooDFeALPiXXKKPwfhePdOFI=;
 b=WVRklFLCMJz3H9eQZnNtQMtmLPAd1o605tONY/fvckoP5R9UguWQCqDZbGZf6Ie/qKeREJ
 ytU5+GCjF8quZgmvBFFjYsHfXQF/UQr0Y7xMm1XiLONCJSnm1PE7xdF14WAF0hPaB9/vyC
 DSNidfovhOfkIsyVMkcp+EG74SoentA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-9tbI6YEkN42rTH9Etyt2jg-1; Thu, 22 Jan 2026 16:35:05 -0500
X-MC-Unique: 9tbI6YEkN42rTH9Etyt2jg-1
X-Mimecast-MFC-AGG-ID: 9tbI6YEkN42rTH9Etyt2jg_1769117704
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43065ad16a8so951502f8f.1
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 13:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769117704; x=1769722504;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fL7oemlFMMP/z+tSAAQcooDFeALPiXXKKPwfhePdOFI=;
 b=nHNhKFsQThp2pOmAwCdY3IXXpvHpQSvQL/bW1VxOHcF0B83s9EG2HfikVoNNBjtdtu
 XBHsIEnUjGC/+2OiSZdVZdNJyox6UTByZQ6h6hnBTR96gLImOeJb6qt92MqjWOAWzb8V
 6UACIpLbMoHcC+IvRboxjdxxJaABxFl/3upP8SDeYwqU//JXr/iYMcgZxjlUHBU3KB5+
 TW0zHxvRAxNE6l66CV2owtPH9kgU8bxStvu8L8jIUcHYFFLj2gDIbpujkm/7xd5aiNqN
 dcx1meReA81I6ecZJD3/tJALsBqvGRNzPYTJ/MitZeMSrYzgn8Rp3pkZu2nQVzn3HwTL
 33aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1AtcCkqoqyP7n2dAQhpIkiGrWOMIJ1+ouACV3QkHXRsvll/Xkc2ThGFHc+E4nkohEtzFqpEIW6g==@nongnu.org
X-Gm-Message-State: AOJu0YzyChLaFWvL4OG0CZDp06uWQnQbcLvZSzNs2pcjMKC33EUqfWy/
 3nP4Ac1+KIlsGpBZQwDkz/i0hfYCclCBaEzYa8lgOlRviRK74hzzeI/lk228ekw8SmF2QQEYu2W
 WFgtkBXcZNYNVvuwEuu6VuHMfCXt++UfK5ciYh1Vb+gAy++ss+3LnrA==
X-Gm-Gg: AZuq6aJx1quzkjeituT2T53RCxAF/YU0YLz/0cWFL1OVdjvnGAuR5S5w5oHTHMEjS2y
 0lza5Gu59xjOMgMhuZcRdGbIB907mm9sq2DrzBLB1VxqBbyjLPDxc1D3ot4n0BmubCpXCgIDbfH
 h/npNMu4hUyuCprZoANm+XedIL27pcXqqnqGF17DEuRM1hrA0eP0fsIm9SO5S83oXSbZig2Ts+p
 KiCqnJswA3jvFQOUN0pmXU6yBVD97OXJE+eRBW4HeeDdnMW2jlWks2wZ3fW2k6oMq/reEGErZBM
 w9JRIXtT0iCN4eJOB1V5At72Oi23JGVOyhuMtBp6shXb664HPcu33RDvw3T/lSDSY715ypxLF+F
 jQ0C8M+dewgX21dOOh35YQFqreWMwoQStN8SeM6ci0LDEYk70
X-Received: by 2002:a05:6000:40dd:b0:432:a9db:f99b with SMTP id
 ffacd0b85a97d-435b13118f5mr1391937f8f.0.1769117704186; 
 Thu, 22 Jan 2026 13:35:04 -0800 (PST)
X-Received: by 2002:a05:6000:40dd:b0:432:a9db:f99b with SMTP id
 ffacd0b85a97d-435b13118f5mr1391895f8f.0.1769117703729; 
 Thu, 22 Jan 2026 13:35:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24f15sm1498854f8f.18.2026.01.22.13.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 13:35:03 -0800 (PST)
Message-ID: <8b1b899d-4024-40a2-a856-f51aab5dd457@redhat.com>
Date: Thu, 22 Jan 2026 22:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 36/37] hw/vfio/pci: Synthesize PASID capability for
 vfio-pci devices
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 alex@shazbot.org, nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20260121175248.87649-1-skolothumtho@nvidia.com>
 <20260121175248.87649-37-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260121175248.87649-37-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WiBHldVUV3NeEnDdLqRYI_8Toc7u06dfqY_wWZUI6tM_1769117704
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.07,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/21/26 18:52, Shameer Kolothum wrote:
> Add support for synthesizing a PCIe PASID extended capability for
> vfio-pci devices when PASID is enabled via a vIOMMU and supported by
> the host IOMMU backend.
> 
> PASID capability parameters are retrieved via IOMMUFD APIs and the
> capability is inserted into the PCIe extended capability list using
> the insertion helper. A new x-vpasid-cap-offset property allows
> explicit control over the placement; by default the capability is
> placed at the end of the PCIe extended configuration space.
> 
> If the kernel does not expose PASID information or insertion fails,
> the device continues without PASID support.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   hw/vfio/pci.c           | 75 +++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/pci.h           |  1 +
>   hw/vfio/trace-events    |  1 +
>   include/hw/core/iommu.h |  1 +
>   4 files changed, 78 insertions(+)

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index c734472721..36d8fbe872 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -24,6 +24,7 @@
>   #include <sys/ioctl.h>
>   
>   #include "hw/core/hw-error.h"
> +#include "hw/core/iommu.h"
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
>   #include "hw/pci/pci_bridge.h"
> @@ -2498,9 +2499,62 @@ static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
>       return 0;
>   }
>   
> +/*
> + * Try to retrieve PASID capability information via IOMMUFD APIs and,
> + * if supported, synthesize a PASID PCIe extended capability for the
> + * VFIO device.
> + *
> + * Use user-specified PASID capability offset if provided, otherwise
> + * place it at the end of the PCIe extended configuration space.
> + */
> +static bool vfio_pci_synthesize_pasid_cap(VFIOPCIDevice *vdev, Error **errp)
> +{
> +    HostIOMMUDevice *hiod = vdev->vbasedev.hiod;
> +    HostIOMMUDeviceClass *hiodc;
> +    PasidInfo pasid_info;
> +    PCIDevice *pdev = PCI_DEVICE(vdev);
> +    uint16_t pasid_offset;
> +
> +    if (!hiod) {
> +        return true;
> +    }
> +
> +    hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
> +    if (!hiodc || !hiodc->get_pasid_info ||
> +        !hiodc->get_pasid_info(hiod, &pasid_info) ||
> +        !(pci_device_get_viommu_flags(pdev) & VIOMMU_FLAG_PASID_SUPPORTED)) {
> +        return true;
> +    }
> +
> +    /* Use user-specified offset if set, otherwise place PASID at the end. */
> +    if (vdev->vpasid_cap_offset) {
> +        pasid_offset = vdev->vpasid_cap_offset;
> +    } else {
> +        pasid_offset = PCIE_CONFIG_SPACE_SIZE - PCI_EXT_CAP_PASID_SIZEOF;
> +    }
> +
> +    if (!pcie_insert_capability(pdev, PCI_EXT_CAP_ID_PASID, PCI_PASID_VER,
> +                                pasid_offset, PCI_EXT_CAP_PASID_SIZEOF)) {
> +        error_setg(errp, "vfio: Placing PASID capability at offset 0x%x failed",
> +                   pasid_offset);
> +        return false;
> +    }
> +    trace_vfio_pci_synthesize_pasid_cap(vdev->vbasedev.name, pasid_offset);
> +
> +    pcie_pasid_common_init(pdev, pasid_offset, pasid_info.max_pasid_log2,
> +                           pasid_info.exec_perm, pasid_info.priv_mod);
> +
> +    /* PASID capability is fully emulated by QEMU */
> +    memset(vdev->emulated_config_bits + pdev->exp.pasid_cap, 0xff,
> +           PCI_EXT_CAP_PASID_SIZEOF);
> +    return true;
> +}
> +
>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>   {
>       PCIDevice *pdev = PCI_DEVICE(vdev);
> +    bool pasid_cap_added = false;
> +    Error *err = NULL;
>       uint32_t header;
>       uint16_t cap_id, next, size;
>       uint8_t cap_ver;
> @@ -2578,12 +2632,24 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>                   pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>               }
>               break;
> +        /*
> +         * VFIO kernel does not expose the PASID CAP today. We may synthesize
> +         * one later through IOMMUFD APIs. If VFIO ever starts exposing it,
> +         * record its presence here so we do not create a duplicate CAP.
> +         */
> +        case PCI_EXT_CAP_ID_PASID:
> +            pasid_cap_added = true;
> +            /* fallthrough */
>           default:
>               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>           }
>   
>       }
>   
> +    if (!pasid_cap_added && !vfio_pci_synthesize_pasid_cap(vdev, &err)) {
> +        error_report_err(err);
> +    }
> +
>       /* Cleanup chain head ID if necessary */
>       if (pci_get_word(pdev->config + PCI_CONFIG_SPACE_SIZE) == 0xFFFF) {
>           pci_set_word(pdev->config + PCI_CONFIG_SPACE_SIZE, 0);
> @@ -3756,6 +3822,8 @@ static const Property vfio_pci_properties[] = {
>                        TYPE_IOMMUFD_BACKEND, IOMMUFDBackend *),
>   #endif
>       DEFINE_PROP_BOOL("skip-vsc-check", VFIOPCIDevice, skip_vsc_check, true),
> +    DEFINE_PROP_UINT16("x-vpasid-cap-offset", VFIOPCIDevice,
> +                       vpasid_cap_offset, 0),
>   };
>   
>   #ifdef CONFIG_IOMMUFD
> @@ -3913,6 +3981,13 @@ static void vfio_pci_class_init(ObjectClass *klass, const void *data)
>                                             "destination when doing live "
>                                             "migration of device state via "
>                                             "multifd channels");
> +   object_class_property_set_description(klass, /* 11.0 */
> +                                          "x-vpasid-cap-offset",
> +                                          "PCIe extended configuration space offset at which to place a "
> +                                          "synthetic PASID extended capability when PASID is enabled via "
> +                                          "a vIOMMU. A value of 0 (default) places the capability at the "
> +                                          "end of the extended configuration space. The offset must be "
> +                                          "4-byte aligned and within the PCIe extended configuration space");
>   }
>   
>   static const TypeInfo vfio_pci_info = {
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 0f78cf9cdb..d6495d7f29 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -187,6 +187,7 @@ struct VFIOPCIDevice {
>       bool defer_kvm_irq_routing;
>       bool clear_parent_atomics_on_exit;
>       bool skip_vsc_check;
> +    uint16_t vpasid_cap_offset;
>       VFIODisplay *dpy;
>       Notifier irqchip_change_notifier;
>       VFIOPCICPR cpr;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 180e3d526b..b48c4abe7a 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -40,6 +40,7 @@ vfio_pci_hot_reset_result(const char *name, const char *result) "%s hot reset: %
>   vfio_pci_populate_device_config(const char *name, unsigned long size, unsigned long offset, unsigned long flags) "Device '%s' config: size: 0x%lx, offset: 0x%lx, flags: 0x%lx"
>   vfio_pci_populate_device_get_irq_info_failure(const char *errstr) "VFIO_DEVICE_GET_IRQ_INFO failure: %s"
>   vfio_mdev(const char *name, bool is_mdev) " (%s) is_mdev %d"
> +vfio_pci_synthesize_pasid_cap(const char *name,  uint16_t offset)  "%s offset: 0x%x"
>   vfio_add_ext_cap_dropped(const char *name, uint16_t cap, uint16_t offset) "%s 0x%x@0x%x"
>   vfio_pci_reset(const char *name) " (%s)"
>   vfio_pci_reset_flr(const char *name) "%s FLR/VFIO_DEVICE_RESET"
> diff --git a/include/hw/core/iommu.h b/include/hw/core/iommu.h
> index d5401a397b..86af315c15 100644
> --- a/include/hw/core/iommu.h
> +++ b/include/hw/core/iommu.h
> @@ -20,6 +20,7 @@
>   enum viommu_flags {
>       /* vIOMMU needs nesting parent HWPT to create nested HWPT */
>       VIOMMU_FLAG_WANT_NESTING_PARENT = BIT_ULL(0),
> +    VIOMMU_FLAG_PASID_SUPPORTED = BIT_ULL(1),
>   };
>   
>   /* Host IOMMU quirks. Extracted from host IOMMU capabilities */


