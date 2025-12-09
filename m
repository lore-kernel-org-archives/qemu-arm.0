Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49727D1CDC6
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 10:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSug9-0006vI-UJ; Tue, 09 Dec 2025 05:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vSug8-0006uu-9W
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 05:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vSug6-00069D-FZ
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 05:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765275038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HA1uu7P5ypWd/pwcxH7QEvAtm3A1ezIsQvmP6ciroIA=;
 b=Vcmqc+OPeDs2PcIY7+8GxY9YDxShcPAPkRuFRFzNM7AlN7Yo25WcdyKinrijOumwu0MqJX
 +4RM1sV1aMuFlYrQO+kNZPoSk5lGYOlWVKivrbljEEnUuE8Q8JajbgdObK8m7A14GTXJbG
 fAxZn+WAFE2M2eJNE7s55vsX2IFKoqs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-KEwKFk72OJumP5h4rgAmQA-1; Tue, 09 Dec 2025 05:10:37 -0500
X-MC-Unique: KEwKFk72OJumP5h4rgAmQA-1
X-Mimecast-MFC-AGG-ID: KEwKFk72OJumP5h4rgAmQA_1765275036
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42b487cda00so3105140f8f.3
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 02:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765275035; x=1765879835;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HA1uu7P5ypWd/pwcxH7QEvAtm3A1ezIsQvmP6ciroIA=;
 b=jSPKAtqEg6JMy49p6CrHqzMy6Pgxx/a8ry3otbmuRLopgb3ERdZCiAeFIUMD4wniq+
 53k8B4JilI5H4xBmvwSemI4PTwC2eQ0WiczIAcOS4hxkO9QTKQ7jI198dIyygXDC9DKf
 1gS0GaxeSoJMnjs2iA/xGY6SpixEOm811D1YEXBjoT88yxC1tggdbe0/B/vIhe6alRa9
 NItFg7mbw4a6F4XUYg0B495NIYD0UvbgU7PoBPf7rJ2heiXc5PjjeDdrdMOy6zky+y4t
 Ou9rSOHWhW6QJi6W1HAm03fOQuaIX5wjTzcmvLUwfSHUb2AmWeVs8/AH3F6pkqRLlSCv
 Hz0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2+YPBz6EBIQxerz0rfIQOeKCs7e/nu68G45bI9oGze1e3Z/f8DOACHawjTU5mH7/I0N/Gm9lQ+g==@nongnu.org
X-Gm-Message-State: AOJu0YxY6ceJ/gxOdsc3XIl1BnzGhRNstOWw5mzcelypprSpzYZAB9uK
 W6cMTjksZYxaDCJ7AytZGW6pqr3m70Z/fZVZMah7VYJgbLvUnsb2TtV+zXOJMB2ZTi6uTFrOkVG
 xTx/8YUgthht73UaUHPPLITLx+asgKYVb1eLD1ecs9+ND3gjIRvDF9g==
X-Gm-Gg: ASbGncu9Mhx9WSyMAfRWq8BTdnnJ70fMISxvPAZu2uevB/qa3LS0RNiIaxXj2PyZCZk
 uvKxfn4c5dNRPC3qYfVi8iXjO0Yt6SScOHSFYWeE35XQV7yvNr3pV16tomyz9s4dq6fz6nbGhu2
 rV549EOOJv9vFBsUHbiGlUKD9ymhS2w1pKhTqjgdJ/sTaQlEisY2X7FCNxxC0KSuVF7WDqa3JwK
 2O9kONMSZPOQ1/KV9nDnHGPX8ugbM7BnugzhgeXlyFTexCwXchgCWgtq1aAKhlFf8ulLI88a9NI
 aFrhAgM04qFN8em/rAL1uqLo2R2gXfGyjIDch8TjrevUmdWT4ee5PS3kjogetm2Dt621PtHMLjh
 NYzn6mjQZta4+mwkKbEgU2QinttSD/7OfCqSracEg5O/XoiAv
X-Received: by 2002:a05:6000:200d:b0:42b:3cd2:e9b3 with SMTP id
 ffacd0b85a97d-42f89f487dbmr10778369f8f.33.1765275034609; 
 Tue, 09 Dec 2025 02:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvwTaC6Flq1HHiE3UyPqwY5l1IsWya5GOb9K/FWNSTOIXtF44Z0l0sBHAa6IkKneHOH0Gdng==
X-Received: by 2002:a05:6000:200d:b0:42b:3cd2:e9b3 with SMTP id
 ffacd0b85a97d-42f89f487dbmr10778323f8f.33.1765275034151; 
 Tue, 09 Dec 2025 02:10:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331a4fsm34341805f8f.33.2025.12.09.02.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:10:33 -0800 (PST)
Message-ID: <2ce54748-5a35-4ae9-9dea-f893a3467825@redhat.com>
Date: Tue, 9 Dec 2025 11:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 31/32] vfio: Synthesize vPASID capability to VM
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-32-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20251031105005.24618-32-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QYyor-yHdPh5KQ5eeEeNcNTTylIC40xeIgdXg7U5RQc_1765275036
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hello Shameer, Yi,

On 10/31/25 11:50, Shameer Kolothum wrote:
> From: Yi Liu <yi.l.liu@intel.com>
> 
> If user wants to expose PASID capability in vIOMMU, then VFIO would also
> report the PASID cap for this device if the underlying hardware supports
> it as well.
> 
> As a start, this chooses to put the vPASID cap in the last 8 bytes of the
> vconfig space. This is a choice in the good hope of no conflict with any
> existing cap or hidden registers. For the devices that has hidden registers,
> user should figure out a proper offset for the vPASID cap. This may require
> an option for user to config it. Here we leave it as a future extension.
> There are more discussions on the mechanism of finding the proper offset.
> 
> https://lore.kernel.org/kvm/BN9PR11MB5276318969A212AD0649C7BE8CBE2@BN9PR11MB5276.namprd11.prod.outlook.com/
> 
> Since we add a check to ensure the vIOMMU supports PASID, only devices
> under those vIOMMUs can synthesize the vPASID capability. This gives
> users control over which devices expose vPASID.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   hw/vfio/pci.c      | 37 +++++++++++++++++++++++++++++++++++++
>   include/hw/iommu.h |  1 +
>   2 files changed, 38 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 06b06afc2b..2054eac897 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -24,6 +24,7 @@
>   #include <sys/ioctl.h>
>   
>   #include "hw/hw.h"
> +#include "hw/iommu.h"
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
>   #include "hw/pci/pci_bridge.h"
> @@ -2500,7 +2501,12 @@ static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
>   
>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>   {
> +    HostIOMMUDevice *hiod = vdev->vbasedev.hiod;
> +    HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
>       PCIDevice *pdev = PCI_DEVICE(vdev);
> +    uint64_t max_pasid_log2 = 0;
> +    bool pasid_cap_added = false;
> +    uint64_t hw_caps;
>       uint32_t header;
>       uint16_t cap_id, next, size;
>       uint8_t cap_ver;
> @@ -2578,12 +2584,43 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>                   pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>               }
>               break;
> +        case PCI_EXT_CAP_ID_PASID:
> +             pasid_cap_added = true;
> +             /* fallthrough */
>           default:
>               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>           }
>   
>       }
>   
> +#ifdef CONFIG_IOMMUFD

The HostIOMMUDevice concept was introduced to abstract the use of
the Host IOMMU backends in VFIO (and other parts of QEMU):

- the VFIO IOMMU type1 backend, also referred as 'legacy',
- IOMMUFD

Adding code in VFIO under CONFIG_IOMMUFD should be avoided always
when possible. There are exceptions, such as for the definition
of the properties below in this file. This is, however, due to the
dual-bus nature of the VFIO devices and the limitation of QEMU class
inheritance.

In this case, I think we can extend HostIOMMUDevice and associated
class, to handle PASID support. Please rework this patch. I can
merge as a prereq change.


Also, IOMMUFD backend is not supported on all platforms, so these
changes, even if correct, won't compile.

Thanks,

C.


> +    /*
> +     * Although we check for PCI_EXT_CAP_ID_PASID above, the Linux VFIO
> +     * framework currently hides this capability. Try to retrieve it
> +     * through alternative kernel interfaces (e.g. IOMMUFD APIs).
> +     */
> +    if (!pasid_cap_added && hiodc->get_cap) {
> +        hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_GENERIC_HW, &hw_caps, NULL);
> +        hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2,
> +                       &max_pasid_log2, NULL);
> +    }
> +
> +    /*
> +     * If supported, adds the PASID capability in the end of the PCIe config
> +     * space. TODO: Add option for enabling pasid at a safe offset.
> +     */
> +    if (max_pasid_log2 && (pci_device_get_viommu_flags(pdev) &
> +                           VIOMMU_FLAG_PASID_SUPPORTED)) {
> +        bool exec_perm = (hw_caps & IOMMU_HW_CAP_PCI_PASID_EXEC) ? true : false;
> +        bool priv_mod = (hw_caps & IOMMU_HW_CAP_PCI_PASID_PRIV) ? true : false;
> +
> +        pcie_pasid_init(pdev, PCIE_CONFIG_SPACE_SIZE - PCI_EXT_CAP_PASID_SIZEOF,
> +                        max_pasid_log2, exec_perm, priv_mod);
> +        /* PASID capability is fully emulated by QEMU */
> +        memset(vdev->emulated_config_bits + pdev->exp.pasid_cap, 0xff, 8);
> +    }
> +#endif
> +
>       /* Cleanup chain head ID if necessary */
>       if (pci_get_word(pdev->config + PCI_CONFIG_SPACE_SIZE) == 0xFFFF) {
>           pci_set_word(pdev->config + PCI_CONFIG_SPACE_SIZE, 0);
> diff --git a/include/hw/iommu.h b/include/hw/iommu.h
> index 9b8bb94fc2..9635770bee 100644
> --- a/include/hw/iommu.h
> +++ b/include/hw/iommu.h
> @@ -20,6 +20,7 @@
>   enum viommu_flags {
>       /* vIOMMU needs nesting parent HWPT to create nested HWPT */
>       VIOMMU_FLAG_WANT_NESTING_PARENT = BIT_ULL(0),
> +    VIOMMU_FLAG_PASID_SUPPORTED = BIT_ULL(1),
>   };
>   
>   #endif /* HW_IOMMU_H */


