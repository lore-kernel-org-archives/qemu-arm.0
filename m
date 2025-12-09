Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FB6D3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 07:57:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSsbH-0003BK-SQ; Tue, 09 Dec 2025 02:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSsbB-00038r-KB
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:57:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSsb8-0005NH-Lt
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765267044;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5AagdL2iyr2na9seZhmgi69fZT20TIYm8eETB/EiH4=;
 b=CQ1bIRZ/uQ4c0MdiDpeFlxGgAJiDodVpeOhXOv92cjVC0eiDzyTKOzrXVR2rTLfOFe3FYc
 E4PkCg+IRNwlP+N+D18DYW53T/9CUhIrsSLzJKVDq74Z9CRMJbnGnenCyv0GF9FrgMGJlH
 dfOr8kVxnSQCcRRWpotDxZpJjjtfJ5M=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-S7pNabXGPK2BqjQOMyJH7Q-1; Tue, 09 Dec 2025 02:57:22 -0500
X-MC-Unique: S7pNabXGPK2BqjQOMyJH7Q-1
X-Mimecast-MFC-AGG-ID: S7pNabXGPK2BqjQOMyJH7Q_1765267041
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso8625220a12.3
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 23:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765267041; x=1765871841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5AagdL2iyr2na9seZhmgi69fZT20TIYm8eETB/EiH4=;
 b=C00rQanSKoYcFsqHeP/Nn8Ql2RV0m7t1asJSBywvD2CGXAV2QuSrSxs1VcjSD8upD4
 lcA5BQNo6WL2v9UeACM2ParzwxZA+BfDNrIZo8y3uRSyKQDVrEdhbfIIS/2KS4HFwJf0
 QVqM5svw2NtzhSMghM0uPEgoyL9YWqV3bLwd19FxOvMamHHjT/H9cGhLZkbgvDSW71YP
 7mR7c0yqApbm5lT2v+HdShrkkB/hhZdW89H4P7Vdf8pK6tf1mRVgRIJtFJ+1K6/TiA+e
 WRPeLBoFYiKYl0KRZ+lXtzTsTN3bRRX5EgjiDsWYGKdqHnBqdSHxQQD9kjwzNJ5T3lKo
 uvEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhV0PXXrsokoYTufsdGRc0+VtOSr9EqeYcRr/sFB0pJP6/Tae14pau5smFTUeD+Gchu5synjvhTA==@nongnu.org
X-Gm-Message-State: AOJu0YzJChhGNUsdCeFelIeXYTHKtHKLbTsWy6oPMab4a1U5dN045B9+
 HszKbAW/WwezepgjRmkEAhFBBABJgaYdsCctwZae/lSNfTKLbF0vilaHoiyesCoViDTWowHIqQ6
 BjOGV9bmj1kV+RR8vOqfb0YZJrhOkcEXuiY473Iwru44BuX42f2n+yw==
X-Gm-Gg: ASbGncvhivq5229l8kBP2gYk0AONr2DEhA700nOMznLnea2FigB3+ZvUZdmYgtVBKav
 6q68RutPOf/7IaUPPfFmcV3VvWnrVREItkU8Y/2SaW5O+Fs9CuwZTy00NELZaJ0hngzK/o56mWM
 nluF71w8urVtEwdLiGHYkcXGtMM1ijAAjqrf2LHMRq6iJY+OTizcQhTy5xyh5xeqPlWhRHpK+tK
 EKvBdmYEbsEpTJqZwWhJmLQAHA3C25Wojxwf0VzSyezwsriCDNKEQCyhqIWxN2DOeM8rPBWn6cj
 Otwb+ySib18trN/lI6OrwNBQNHgcsKCOMljbNJd7YoM6FUcLs2GW0xgzP3WKK+TdSkK8n0/4xk9
 fvbLxG0mhHHW8kzl+3tZqeiM91m1dTbi0b0VQY2e0q/9IDTgB5E1AaXsRUQ==
X-Received: by 2002:a05:7022:69a4:b0:119:e56c:18b3 with SMTP id
 a92af1059eb24-11e032aca60mr6834687c88.27.1765267040654; 
 Mon, 08 Dec 2025 23:57:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG0NiPDhNIVzdgC7m8qH4nR/fSn7RM326XGlmct3DPPb4OvqjIFamQv83K4DLcj3psSzFBDQ==
X-Received: by 2002:a05:7022:69a4:b0:119:e56c:18b3 with SMTP id
 a92af1059eb24-11e032aca60mr6834668c88.27.1765267040139; 
 Mon, 08 Dec 2025 23:57:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11df749f8ddsm45704915c88.0.2025.12.08.23.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:57:19 -0800 (PST)
Message-ID: <17b918c9-46bd-4d52-95a7-ee1ec1620a76@redhat.com>
Date: Tue, 9 Dec 2025 08:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/33] hw/arm/smmuv3-accel: Add set/unset_iommu_device
 callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-13-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251120132213.56581-13-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ObtI-cJu1I45qaeKmUFCXR6KAz9dWFNaC3fzocA74kY_1765267041
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 11/20/25 2:21 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Implement the VFIO/PCI callbacks to attach and detach a HostIOMMUDevice
> to a vSMMUv3 when accel=on,
>
>  - set_iommu_device(): attach a HostIOMMUDevice to a vIOMMU
>  - unset_iommu_device(): detach and release associated resources
>
> In SMMUv3 accel=on mode, the guest SMMUv3 is backed by the host SMMUv3 via
> IOMMUFD. A vIOMMU object (created via IOMMU_VIOMMU_ALLOC) provides a per-VM,
> security-isolated handle to the physical SMMUv3. Without a vIOMMU, the
> vSMMUv3 cannot relay guest operations to the host hardware nor maintain
> isolation across VMs or devices. Therefore, set_iommu_device() allocates
> a vIOMMU object if one does not already exist.
>
> There are two main points to consider in this implementation:
>
> 1) VFIO core allocates and attaches a S2 HWPT that acts as the nesting
>    parent for nested HWPTs(IOMMU_DOMAIN_NESTED). This parent HWPT will
>    be shared across multiple vSMMU instances within a VM.
>
> 2) A device cannot attach directly to a vIOMMU. Instead, it attaches
>    through a proxy nested HWPT (IOMMU_DOMAIN_NESTED). Based on the STE
>    configuration,there are three types of nested HWPTs: bypass, abort,
>    and translate.
>     -The bypass and abort proxy HWPTs are pre-allocated. When SMMUv3
>      operates in global abort or bypass modes, as controlled by the GBPA
>      register, or issues a vSTE for bypass or abort we attach these
>      pre-allocated nested HWPTs.
>     -The translate HWPT requires a vDEVICE to be allocated first, since
>      invalidations and events depend on a valid vSID.
>     -The vDEVICE allocation and attach operations for vSTE based HWPTs
>      are implemented in subsequent patches.
>
> In summary, a device placed behind a vSMMU instance must have a vSID for
> translate vSTE. The bypass and abort vSTEs are pre-allocated as proxy
> nested HWPTs and is attached based on GBPA register. The core-managed
> nesting parent S2 HWPT is used as parent S2 HWPT for all the nested
> HWPTs and is intended to be shared across vSMMU instances within the
> same VM.
>
> set_iommu_device():
>   - Reuse an existing vIOMMU for the same physical SMMU if available.
>     If not, allocate a new one using the nesting parent S2 HWPT.
>   - Pre-allocate two proxy nested HWPTs (bypass and abort) under the
>     vIOMMU and install one based on GBPA.ABORT value.
>   - Add the device to the vIOMMU’s device list.
>
> unset_iommu_device():
>   - Re-attach device to the nesting parent S2 HWPT.
>   - Remove the device from the vIOMMU’s device list.
>   - If the list is empty, free the proxy HWPTs (bypass and abort)
>     and release the vIOMMU object.
>
> Introduce struct SMMUv3AccelState, representing an accelerated SMMUv3
> instance backed by an iommufd vIOMMU object, and storing the bypass and
> abort proxy HWPT IDs.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    | 154 +++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h    |  16 ++++
>  hw/arm/smmuv3-internal.h |   3 +
>  hw/arm/trace-events      |   4 +
>  include/hw/arm/smmuv3.h  |   1 +
>  5 files changed, 178 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index bd4a7dbde1..4dd56a8e65 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -8,6 +8,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
> +#include "trace.h"
>  
>  #include "hw/arm/smmuv3.h"
>  #include "hw/iommu.h"
> @@ -15,6 +16,7 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/vfio/pci.h"
>  
> +#include "smmuv3-internal.h"
>  #include "smmuv3-accel.h"
>  
>  /*
> @@ -43,6 +45,156 @@ static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
>      return accel_dev;
>  }
>  
> +static uint32_t smmuv3_accel_gbpa_hwpt(SMMUv3State *s, SMMUv3AccelState *accel)
> +{
> +    return FIELD_EX32(s->gbpa, GBPA, ABORT) ?
> +           accel->abort_hwpt_id : accel->bypass_hwpt_id;
> +}
> +
> +static bool
> +smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                          Error **errp)
> +{
> +    struct iommu_hwpt_arm_smmuv3 bypass_data = {
> +        .ste = { SMMU_STE_CFG_BYPASS | SMMU_STE_VALID, 0x0ULL },
> +    };
> +    struct iommu_hwpt_arm_smmuv3 abort_data = {
> +        .ste = { SMMU_STE_VALID, 0x0ULL },
> +    };
> +    uint32_t s2_hwpt_id = idev->hwpt_id;
> +    uint32_t viommu_id, hwpt_id;
> +    SMMUv3AccelState *accel;
> +
> +    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> +                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> +                                      s2_hwpt_id, &viommu_id, errp)) {
> +        return false;
> +    }
> +
> +    accel = g_new0(SMMUv3AccelState, 1);
> +    accel->viommu.viommu_id = viommu_id;
> +    accel->viommu.s2_hwpt_id = s2_hwpt_id;
> +    accel->viommu.iommufd = idev->iommufd;
> +
> +    /*
> +     * Pre-allocate HWPTs for S1 bypass and abort cases. These will be attached
> +     * later for guest STEs or GBPAs that require bypass or abort configuration.
> +     */
> +    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid, viommu_id,
> +                                    0, IOMMU_HWPT_DATA_ARM_SMMUV3,
> +                                    sizeof(abort_data), &abort_data,
> +                                    &accel->abort_hwpt_id, errp)) {
> +        goto free_viommu;
> +    }
> +
> +    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid, viommu_id,
> +                                    0, IOMMU_HWPT_DATA_ARM_SMMUV3,
> +                                    sizeof(bypass_data), &bypass_data,
> +                                    &accel->bypass_hwpt_id, errp)) {
> +        goto free_abort_hwpt;
> +    }
> +
> +    /* Attach a HWPT based on SMMUv3 GBPA.ABORT value */
> +    hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp)) {
> +        goto free_bypass_hwpt;
> +    }
> +    s->s_accel = accel;
> +    return true;
> +
> +free_bypass_hwpt:
> +    iommufd_backend_free_id(idev->iommufd, accel->bypass_hwpt_id);
> +free_abort_hwpt:
> +    iommufd_backend_free_id(idev->iommufd, accel->abort_hwpt_id);
> +free_viommu:
> +    iommufd_backend_free_id(idev->iommufd, accel->viommu.viommu_id);
> +    g_free(accel);
> +    return false;
> +}
> +
> +static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
> +                                          HostIOMMUDevice *hiod, Error **errp)
> +{
> +    HostIOMMUDeviceIOMMUFD *idev = HOST_IOMMU_DEVICE_IOMMUFD(hiod);
> +    SMMUState *bs = opaque;
> +    SMMUv3State *s = ARM_SMMUV3(bs);
> +    SMMUPciBus *sbus = smmu_get_sbus(bs, bus);
> +    SMMUv3AccelDevice *accel_dev = smmuv3_accel_get_dev(bs, sbus, bus, devfn);
> +
> +    if (!idev) {
> +        return true;
> +    }
> +
> +    if (accel_dev->idev) {
> +        if (accel_dev->idev != idev) {
> +            error_setg(errp, "Device already has an associated idev 0x%x",
> +                       idev->devid);
> +            return false;
> +        }
> +        return true;
> +    }
> +
> +    if (s->s_accel) {
> +        goto done;
> +    }
> +
> +    if (!smmuv3_accel_alloc_viommu(s, idev, errp)) {
> +        error_append_hint(errp, "Unable to alloc vIOMMU: idev devid 0x%x: ",
> +                          idev->devid);
> +        return false;
> +    }
> +
> +done:
> +    accel_dev->idev = idev;
> +    accel_dev->s_accel = s->s_accel;
> +    QLIST_INSERT_HEAD(&s->s_accel->device_list, accel_dev, next);
> +    trace_smmuv3_accel_set_iommu_device(devfn, idev->devid);
> +    return true;
> +}
> +
> +static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
> +                                            int devfn)
> +{
> +    SMMUState *bs = opaque;
> +    SMMUv3State *s = ARM_SMMUV3(bs);
> +    SMMUPciBus *sbus = g_hash_table_lookup(bs->smmu_pcibus_by_busptr, bus);
> +    HostIOMMUDeviceIOMMUFD *idev;
> +    SMMUv3AccelDevice *accel_dev;
> +    SMMUv3AccelState *accel;
> +    SMMUDevice *sdev;
> +
> +    if (!sbus) {
> +        return;
> +    }
> +
> +    sdev = sbus->pbdev[devfn];
> +    if (!sdev) {
> +        return;
> +    }
> +
> +    accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
> +    idev = accel_dev->idev;
> +    accel = accel_dev->s_accel;
> +    /* Re-attach the default s2 hwpt id */
> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, idev->hwpt_id, NULL)) {
> +        error_report("Unable to attach the default HW pagetable: idev devid "
> +                     "0x%x", idev->devid);
> +    }
> +
> +    accel_dev->idev = NULL;
> +    accel_dev->s_accel = NULL;
> +    QLIST_REMOVE(accel_dev, next);
> +    trace_smmuv3_accel_unset_iommu_device(devfn, idev->devid);
> +
> +    if (QLIST_EMPTY(&accel->device_list)) {
> +        iommufd_backend_free_id(accel->viommu.iommufd, accel->bypass_hwpt_id);
> +        iommufd_backend_free_id(accel->viommu.iommufd, accel->abort_hwpt_id);
> +        iommufd_backend_free_id(accel->viommu.iommufd, accel->viommu.viommu_id);
> +        g_free(accel);
> +        s->s_accel = NULL;
> +    }
> +}
> +
>  /*
>   * Only allow PCIe bridges, pxb-pcie roots, and GPEX roots so vfio-pci
>   * endpoints can sit downstream. Accelerated SMMUv3 requires a vfio-pci
> @@ -145,6 +297,8 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .supports_address_space = smmuv3_accel_supports_as,
>      .get_address_space = smmuv3_accel_find_add_as,
>      .get_viommu_flags = smmuv3_accel_get_viommu_flags,
> +    .set_iommu_device = smmuv3_accel_set_iommu_device,
> +    .unset_iommu_device = smmuv3_accel_unset_iommu_device,
>  };
>  
>  static void smmuv3_accel_as_init(SMMUv3State *s)
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 0dc6b00d35..c72605caab 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -10,10 +10,26 @@
>  #define HW_ARM_SMMUV3_ACCEL_H
>  
>  #include "hw/arm/smmu-common.h"
> +#include "system/iommufd.h"
> +#include <linux/iommufd.h>
>  #include CONFIG_DEVICES
>  
> +/*
> + * Represents an accelerated SMMU instance backed by an iommufd vIOMMU object.
> + * Holds bypass and abort proxy HWPT IDs used for device attachment.
> + */
> +typedef struct SMMUv3AccelState {
> +    IOMMUFDViommu viommu;
> +    uint32_t bypass_hwpt_id;
> +    uint32_t abort_hwpt_id;
> +    QLIST_HEAD(, SMMUv3AccelDevice) device_list;
> +} SMMUv3AccelState;
> +
>  typedef struct SMMUv3AccelDevice {
>      SMMUDevice sdev;
> +    HostIOMMUDeviceIOMMUFD *idev;
> +    QLIST_ENTRY(SMMUv3AccelDevice) next;
> +    SMMUv3AccelState *s_accel;
>  } SMMUv3AccelDevice;
>  
>  #ifdef CONFIG_ARM_SMMUV3_ACCEL
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b6b7399347..81212a58f1 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -583,6 +583,9 @@ typedef struct CD {
>      ((extract64((x)->word[7], 0, 16) << 32) |           \
>       ((x)->word[6] & 0xfffffff0))
>  
> +#define SMMU_STE_VALID      (1ULL << 0)
> +#define SMMU_STE_CFG_BYPASS (1ULL << 3)
> +
>  static inline int oas2bits(int oas_field)
>  {
>      switch (oas_field) {
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index f3386bd7ae..2aaa0c40c7 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -66,6 +66,10 @@ smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s
>  smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
>  smmu_reset_exit(void) ""
>  
> +#smmuv3-accel.c
> +smmuv3_accel_set_iommu_device(int devfn, uint32_t devid) "devfn=0x%x (idev devid=0x%x)"
> +smmuv3_accel_unset_iommu_device(int devfn, uint32_t devid) "devfn=0x%x (idev devid=0x%x)"
> +
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
>  strongarm_ssp_read_underrun(void) "SSP rx underrun"
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index bb7076286b..e54ece2d38 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -66,6 +66,7 @@ struct SMMUv3State {
>  
>      /* SMMU has HW accelerator support for nested S1 + s2 */
>      bool accel;
> +    struct SMMUv3AccelState *s_accel;
>  };
>  
>  typedef enum {
Looks good to me

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


