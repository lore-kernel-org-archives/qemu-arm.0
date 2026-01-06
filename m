Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D41C47BEA
	for <qemu-arm@archiver.kernel.org>; Tue,  6 Jan 2026 10:55:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vd4iN-00075y-MD; Tue, 06 Jan 2026 05:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vd4iN-00075g-35
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 05:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vd4iK-0004Gn-Qq
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 05:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767696900;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luT4qiijpLJBZ58KW/k+hzS/YkHK1GZLBOqhc9h8oZM=;
 b=f9Ge+055AqstPuWrkKgg6yE442JZigYFlpYgwnpuQOndus8Y46+prCBpZzfeAJ8W3PsUCZ
 0A50b46EseSQAMj5sE+UlYqQArZhXWRgnQ0lLu8kVt+JbWc90Qvu7dN72zrxs3jYvC+YiS
 TdwQpy7tjfR7uKGZeJQEQqy3H23gRvE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-NrtCSdFNOf65CRBuRQ7iMA-1; Tue, 06 Jan 2026 05:54:57 -0500
X-MC-Unique: NrtCSdFNOf65CRBuRQ7iMA-1
X-Mimecast-MFC-AGG-ID: NrtCSdFNOf65CRBuRQ7iMA_1767696896
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430fcb6b2ebso442972f8f.2
 for <qemu-arm@nongnu.org>; Tue, 06 Jan 2026 02:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767696894; x=1768301694;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luT4qiijpLJBZ58KW/k+hzS/YkHK1GZLBOqhc9h8oZM=;
 b=ekk258aHYbbQS7NiAGMy51hGpMbajw9trZ5RgQAbqKbaMQyKLiGKI+SDlbJRQ4MIS7
 K2AaChZ3/ASKJehTE4QQ0KdGgYJ2MFvstqWQTnkVOMjAPae6AN9N4eo4LotNtMCMoE3J
 DSukZ7Fh7HmWGqQ1ueYfKdIEJrRrXvgR7wB1kIIPMzNshQP1zAVEvjK6Wz7CkAjTxTrK
 rGbslphjle2kh5WH2ENXdjxbYC4scVehc92k6FidPmmhm9GLaXxKec/DKOlFXKMzBT6h
 dRvadxFfvsuBSSxDp5vh0nxWAESJF3oyrocA1mNrXCxe/1/AG40m3V3+oMVkp0tK6Qh1
 mGwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUth9RhRKap2XDYba1yV4MTe1IVQgj+fYEsf/339ZfKwRyP0UerkhtjB463veIlh/HO/hQUp7T7+A==@nongnu.org
X-Gm-Message-State: AOJu0Yy4IRRrjjcufCCdu8C3VAu7aY1A9GUYI69LIJN1zNLo0yKl4lms
 ab2FYkA+5FNYE/yP/kRdDxUII1Ss+/P66Xa57z6u33VE5TO0djdd/lPL4DtIfQwFsudVL/Zudsu
 1lQMCUZQaGI2OMRRLaxfZ2MRYq49fhPw/fIvMkkxswXGvQN7oggQw7A==
X-Gm-Gg: AY/fxX6alWn03HOSX6Ee2MwKmJzvfdMPJHgwb4fYYUHt9PesGADbxCBle6KTQb3Lmxp
 Af+j/oaWlAPNUQhtIq7pJtdpE3yKggXyOoPZd0bfFwJsoCX92HfIN3f5fJs0crK2s8HorWLm5uY
 GYcbP+AIEZ9UovZRQDy3sdrDVK2r4LanP6J05No/UKOTk0gGBRO9SMU8s3fEDKouM7sCFwKDbkx
 ct75v99rw1SYMOB3xQu5HuwCkCe73VsMy1JKXloHoINEP0ZSp6IOn6Q5D55KOodwgxEi0iXIGxi
 B3yIiMe1lh/tC4PivQOq0OzVv0WOxUkYQdgzK+LGDPK654LjHJZrQW3UFnQpSQ1atz5VxdhRsiA
 J6z01FmW9HdlMGVEq6gjxrqpMKITlZJyGdxECrrTktB3XybKNUGc1dL3QlQ==
X-Received: by 2002:a05:6000:22c2:b0:430:f622:8cca with SMTP id
 ffacd0b85a97d-432bca5790bmr2626828f8f.56.1767696894503; 
 Tue, 06 Jan 2026 02:54:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYCp84H9fzjSawsEughzGU0Iz/m2pYPIzSTka+aG9K9Te1WoQtbyAP5oBzjJ2UI/lYjl/sFw==
X-Received: by 2002:a05:6000:22c2:b0:430:f622:8cca with SMTP id
 ffacd0b85a97d-432bca5790bmr2626806f8f.56.1767696893989; 
 Tue, 06 Jan 2026 02:54:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df91fsm3843192f8f.23.2026.01.06.02.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 02:54:53 -0800 (PST)
Message-ID: <4a1e1e8a-8480-4294-a176-b5e630b7d0c7@redhat.com>
Date: Tue, 6 Jan 2026 11:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 32/33] vfio: Synthesize vPASID capability to VM
To: Shameer Kolothum <skolothumtho@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "alex@shazbot.org" <alex@shazbot.org>
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-33-skolothumtho@nvidia.com>
 <7dc608a7-b36b-4250-befd-d26115b54e26@redhat.com>
 <483fa0e2-aeb5-43b7-a136-692bbd24d0ba@intel.com>
 <CH3PR12MB75489918DACE8B009A8F4F32AB86A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75489918DACE8B009A8F4F32AB86A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B-yA1TVLbj9S6Hn7HmCTzWIyLlT38xYBiC8iR6kAu0A_1767696896
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 1/5/26 5:33 PM, Shameer Kolothum wrote:
> Hi Eric/ Yi,
>
> [Cc: Alex]
>
>> -----Original Message-----
>> From: Yi Liu <yi.l.liu@intel.com>
>> Sent: 09 December 2025 11:17
>> To: eric.auger@redhat.com; Shameer Kolothum
>> <skolothumtho@nvidia.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: Re: [PATCH v6 32/33] vfio: Synthesize vPASID capability to VM
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 2025/12/9 17:51, Eric Auger wrote:
>>> Hi Shameer,
>>> On 11/20/25 2:22 PM, Shameer Kolothum wrote:
>>>> From: Yi Liu <yi.l.liu@intel.com>
>>>>
>>>> If user wants to expose PASID capability in vIOMMU, then VFIO would also
>>>> need to report the PASID cap for this device if the underlying hardware
>>>> supports it as well.
>>>>
>>>> As a start, this chooses to put the vPASID cap in the last 8 bytes of the
>>>> vconfig space. This is a choice in the good hope of no conflict with any
>>>> existing cap or hidden registers. For the devices that has hidden registers,
>>>> user should figure out a proper offset for the vPASID cap. This may require
>>>> an option for user to config it. Here we leave it as a future extension.
>>>> There are more discussions on the mechanism of finding the proper offset.
>>>>
>>>>
>> https://lore.kernel.org/kvm/BN9PR11MB5276318969A212AD0649C7BE8C
>> BE2@BN9PR11MB5276.namprd11.prod.outlook.com/
>>>> Since we add a check to ensure the vIOMMU supports PASID, only devices
>>>> under those vIOMMUs can synthesize the vPASID capability. This gives
>>>> users control over which devices expose vPASID.
>>>>
>>>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>>>> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>>> ---
>>>>   hw/vfio/pci.c      | 38 ++++++++++++++++++++++++++++++++++++++
>>>>   include/hw/iommu.h |  1 +
>>>>   2 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 8b8bc5a421..e11e39d667 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -24,6 +24,7 @@
>>>>   #include <sys/ioctl.h>
>>>>
>>>>   #include "hw/hw.h"
>>>> +#include "hw/iommu.h"
>>>>   #include "hw/pci/msi.h"
>>>>   #include "hw/pci/msix.h"
>>>>   #include "hw/pci/pci_bridge.h"
>>>> @@ -2500,7 +2501,12 @@ static int
>> vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
>>>>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>>>>   {
>>>> +    HostIOMMUDevice *hiod = vdev->vbasedev.hiod;
>>>> +    HostIOMMUDeviceClass *hiodc =
>> HOST_IOMMU_DEVICE_GET_CLASS(hiod);
>>>>       PCIDevice *pdev = PCI_DEVICE(vdev);
>>>> +    uint64_t max_pasid_log2 = 0;
>>>> +    bool pasid_cap_added = false;
>>>> +    uint64_t hw_caps;
>>>>       uint32_t header;
>>>>       uint16_t cap_id, next, size;
>>>>       uint8_t cap_ver;
>>>> @@ -2578,12 +2584,44 @@ static void vfio_add_ext_cap(VFIOPCIDevice
>> *vdev)
>>>>                   pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>>>>               }
>>>>               break;
>>>> +        /*
>>>> +         * VFIO kernel does not expose the PASID CAP today. We may
>> synthesize
>>>> +         * one later through IOMMUFD APIs. If VFIO ever starts exposing it,
>>>> +         * record its presence here so we do not create a duplicate CAP.
>>>> +         */
>>>> +        case PCI_EXT_CAP_ID_PASID:
>>>> +             pasid_cap_added = true;
>>>> +             /* fallthrough */
>>>>           default:
>>>>               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>>>>           }
>>>>
>>>>       }
>>>>
>>>> +#ifdef CONFIG_IOMMUFD
>>>> +    /* Try to retrieve PASID CAP through IOMMUFD APIs */
>>>> +    if (!pasid_cap_added && hiodc && hiodc->get_cap) {
>>>> +        hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_GENERIC_HW,
>> &hw_caps, NULL);
>>>> +        hiodc->get_cap(hiod,
>> HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2,
>>>> +                       &max_pasid_log2, NULL);
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * If supported, adds the PASID capability in the end of the PCIe config
>>>> +     * space. TODO: Add option for enabling pasid at a safe offset.
>>>> +     */
>>>> +    if (max_pasid_log2 && (pci_device_get_viommu_flags(pdev) &
>>>> +                           VIOMMU_FLAG_PASID_SUPPORTED)) {
>>>> +        bool exec_perm = (hw_caps & IOMMU_HW_CAP_PCI_PASID_EXEC);
>>>> +        bool priv_mod = (hw_caps & IOMMU_HW_CAP_PCI_PASID_PRIV);
>>>> +
>>>> +        pcie_pasid_init(pdev, PCIE_CONFIG_SPACE_SIZE -
>> PCI_EXT_CAP_PASID_SIZEOF,
>>>> +                        max_pasid_log2, exec_perm, priv_mod);
>>>> +        /* PASID capability is fully emulated by QEMU */
>>>> +        memset(vdev->emulated_config_bits + pdev->exp.pasid_cap, 0xff, 8);
>>>> +    }
>>>> +#endif
>>>> +
>>>>       /* Cleanup chain head ID if necessary */
>>>>       if (pci_get_word(pdev->config + PCI_CONFIG_SPACE_SIZE) == 0xFFFF) {
>>>>           pci_set_word(pdev->config + PCI_CONFIG_SPACE_SIZE, 0);
>>>> diff --git a/include/hw/iommu.h b/include/hw/iommu.h
>>>> index 9b8bb94fc2..9635770bee 100644
>>>> --- a/include/hw/iommu.h
>>>> +++ b/include/hw/iommu.h
>>>> @@ -20,6 +20,7 @@
>>>>   enum viommu_flags {
>>>>       /* vIOMMU needs nesting parent HWPT to create nested HWPT */
>>>>       VIOMMU_FLAG_WANT_NESTING_PARENT = BIT_ULL(0),
>>>> +    VIOMMU_FLAG_PASID_SUPPORTED = BIT_ULL(1),
>>>>   };
>>>>
>>>>   #endif /* HW_IOMMU_H */
>>> Besides the fact the offset is arbitrarily chosen so that this is the
>>> last cap of the vconfig space, the code looks good to me.
>>> So
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> Just wondering whether we couldn't add some generic pcie code that
>>> parses the extended cap linked list to check the offset range is not
>>> used by another cap before allowing the insertion at a given offset?
>>> This wouldn't prevent a subsequent addition from failing but at least we
>>> would know if there is some collision.this could be added later on though.
>>>
>> You're absolutely right. My approach of using the last 8 bytes was a
>> shortcut to avoid implementing proper capability parsing logic
>> (importing pci_regs.h and maintaining a cap_id-to-cap_size mapping
>> table), and it simplified PASID capability detection by only examining
>> the last 8bytes by a simple dump :(. However, this approach is not
>> good as we cannot guarantee that the last 8bytes are unused by any
>> device.
>>
>> Let's just implement the logic to walk the linked list of ext_caps to
>> find an appropriate offset for our use case.
> I had a go at this. Based on my understanding, even if we walk the PCIe
> extended capability linked list, we still can't easily determine the size
> occupied by the last capability as the extended capability header does not
> encode a length, it only provides the "next" pointer, and for the last entry
> next == 0.
If my understanding is correct when walking the linked list, you can
enumerate the start index and the PCIe extended Capability variable size
which is made of fix header size + register block variable size which
depends on the capability ID). After that we shall be able to allocate a
slot within holes or at least check that adding the new prop at the end
of the 4kB is safe, no?. What do I miss?

Thanks

Eric
>
> Given that, I tried the following approach,
>
> -locate the last extended capability (using the existing helper),
> -reserve a fixed window (512 bytes) for that final capability,
> -and synthesize PASID at the end of PCIe config space (0xff8) only if it
> looks like there is enough room.
>
> Maybe I am missing something here.. Please let me know if there is a
> better way to address this.
>
> Thanks,
> Shameer
>
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index b302de6419..89178f2b7e 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -1005,8 +1005,8 @@ bool pcie_cap_is_arifwd_enabled(const PCIDevice *dev)
>   */
>
>  /* Passing a cap_id value > 0xffff will return 0 and put end of list in prev */
> -static uint16_t pcie_find_capability_list(PCIDevice *dev, uint32_t cap_id,
> -                                          uint16_t *prev_p)
> +uint16_t pcie_find_capability_list(PCIDevice *dev, uint32_t cap_id,
> +                                   uint16_t *prev_p)
>  {
>      uint16_t prev = 0;
>      uint16_t next;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 8b8bc5a421..e8354e8b8d 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -24,6 +24,7 @@
>  #include <sys/ioctl.h>
>
>  #include "hw/hw.h"
> +#include "hw/iommu.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
>  #include "hw/pci/pci_bridge.h"
> @@ -2498,9 +2499,72 @@ static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
>      return 0;
>  }
>
> +/*
> + * Try to retrieve PASID capability information via IOMMUFD APIs and,
> + * if supported, synthesize a PASID PCIe extended capability for the
> + * VFIO device.
> + *
> + * The PASID capability is placed at the end of the PCIe extended
> + * configuration space. Determining the exact size of the last
> + * existing extended capability is non trivial, as PCIe extended
> + * capabilities do not generically encode their total size and
> + * vendor defined extensions are permitted.
> + *
> + * For now, reserve a fixed window (512 bytes) for the last extended
> + * capability and only insert  PASID if sufficient space remains.
> + */
> +static void vfio_pci_synthesize_pasid_cap(VFIOPCIDevice *vdev)
> +{
> +    HostIOMMUDevice *hiod = vdev->vbasedev.hiod;
> +    HostIOMMUDeviceClass *hiodc;
> +    HostIOMMUDevicePasidInfo pasid_info;
> +    PCIDevice *pdev = PCI_DEVICE(vdev);
> +    uint16_t last = 0;
> +    uint16_t pasid_offset;
> +
> +    if (vdev->vbasedev.mdev) {
> +        return;
> +    }
> +
> +    hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
> +    if (!hiodc || !hiodc->get_pasid_info ||
> +        !hiodc->get_pasid_info(hiod, &pasid_info) ||
> +        !(pci_device_get_viommu_flags(pdev) & VIOMMU_FLAG_PASID_SUPPORTED)) {
> +        return;
> +    }
> +
> +    /*
> +     * Locate the last PCIe extended capability present in the device
> +     * configuration space.
> +     */
> +    pcie_find_capability_list(pdev, 0x1ffff, &last);
> +
> +    /*
> +     * Reserve space at the end of PCIe configuration space for PASID.
> +     * If the last extended capability appears too close to the end,
> +     * refuse to insert PASID.
> +     */
> +    if (last + 512 > PCIE_CONFIG_SPACE_SIZE - PCI_EXT_CAP_PASID_SIZEOF) {
> +        warn_report("vfio: no space to synthesize PASID extended capability");
> +        return;
> +    }
> +
> +    pasid_offset = PCIE_CONFIG_SPACE_SIZE - PCI_EXT_CAP_PASID_SIZEOF;
> +
> +    pcie_pasid_init(pdev, pasid_offset,
> +                    pasid_info.max_pasid_log2,
> +                    pasid_info.exec_perm,
> +                    pasid_info.priv_mod);
> +
> +    /* PASID capability is fully emulated by QEMU */
> +    memset(vdev->emulated_config_bits + pdev->exp.pasid_cap, 0xff,
> +           PCI_EXT_CAP_PASID_SIZEOF);
> +}
> +
>  static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>  {
>      PCIDevice *pdev = PCI_DEVICE(vdev);
> +    bool pasid_cap_added = false;
>      uint32_t header;
>      uint16_t cap_id, next, size;
>      uint8_t cap_ver;
> @@ -2562,6 +2626,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>           * accesses, exact size doesn't seem worthwhile.
>           */
>          size = vfio_ext_cap_max_size(config, next);
> +        printf("%s: Shameer: cap_id 0x%x size 0x%x\n",__func__, cap_id, size);
>
>          /* Use emulated next pointer to allow dropping extended caps */
>          pci_long_test_and_set_mask(vdev->emulated_config_bits + next,
> @@ -2578,12 +2643,24 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>                  pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>              }
>              break;
> +        /*
> +         * VFIO kernel does not expose the PASID CAP today. We may synthesize
> +         * one later through IOMMUFD APIs. If VFIO ever starts exposing it,
> +         * record its presence here so we do not create a duplicate CAP.
> +         */
> +        case PCI_EXT_CAP_ID_PASID:
> +             pasid_cap_added = true;
> +             /* fallthrough */
>          default:
>              pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>          }
>
>      }
>
> +    if (!pasid_cap_added) {
> +        vfio_pci_synthesize_pasid_cap(vdev);
> +    }
> +
>      /* Cleanup chain head ID if necessary */
>      if (pci_get_word(pdev->config + PCI_CONFIG_SPACE_SIZE) == 0xFFFF) {
>          pci_set_word(pdev->config + PCI_CONFIG_SPACE_SIZE, 0);
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index 42cebcd033..1a477b05b2 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -130,6 +130,8 @@ bool pcie_cap_is_arifwd_enabled(const PCIDevice *dev);
>
>  /* PCI express extended capability helper functions */
>  uint16_t pcie_find_capability(PCIDevice *dev, uint16_t cap_id);
> +uint16_t pcie_find_capability_list(PCIDevice *dev, uint32_t cap_id,
> +                                   uint16_t *prev_p);
>  void pcie_add_capability(PCIDevice *dev,
>                           uint16_t cap_id, uint8_t cap_ver,
>                           uint16_t offset, uint16_t size);
> @@ -138,6 +140,7 @@ void pcie_sync_bridge_lnk(PCIDevice *dev);
>  void pcie_acs_init(PCIDevice *dev, uint16_t offset);
>  void pcie_acs_reset(PCIDevice *dev);
>
> +uint16_t pcie_get_ext_cap_next_offset(PCIDevice *pdev, uint16_t cap_size);
>  void pcie_ari_init(PCIDevice *dev, uint16_t offset);
>  void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num);
>  void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned);
>
>


