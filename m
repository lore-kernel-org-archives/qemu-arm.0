Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp231145njc;
        Wed, 12 Mar 2025 05:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpbCJb4g7/FNlciEcQdMRCScrn7dXx7bteE3YJxL6Z/dXzljihSHOtb3D40XIIngrEqN5aRdsJFtncnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFx1cIHxRTSR7ZiEanNhejgtBxqCGpFPpTiaPKybEpdqUNYLga4blvun5AgiryyFyLeS1UO
X-Received: by 2002:a05:620a:2788:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7c543c2ab58mr2241555385a.26.1741784031146;
        Wed, 12 Mar 2025 05:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741784031; cv=none;
        d=google.com; s=arc-20240605;
        b=YM48l2Pi3wbIZOIrYgLUHs0bTInhymvVLPfepoUHy5KkxYkFnPMRoh0Yhe9PfFSl8M
         1GEp2bE6PB8RQtEvic7i236e2uu3112HBgk0n9jybw2WUqwBe/E3hbmYoE+xMV0lVexe
         VRiMtwEcOiRHxvfh/WA/QdDrRuNQqS2GaXczfSctY/BOjS/YtnLWz9LtVa1rmkMnx7lT
         KkYFRV1SNjLdyfTGiYmU+V4n4n/R9lrmvPIIBHy1ZVwCGk62jpF1ma7PAgsSWmP6X2q3
         KunUQf9v+Y9Sw9kYpU7DPW8XjGVJjKit9m4+dN5Mudvct8vw9dkNln17m8n8DgjKzZbn
         YaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tAuNzg/BldTf5xbzrXz0vUIzDl2grnbUsziFphFbU7Q=;
        fh=UIxhWN/AuU/92rCsgj/Dtv6tYflNLDEGXcA1EOrVfFE=;
        b=amzRffEaqjT4u7W+3AtCosKvmbcNY9nBFHgm+0xMQnfqBuWUwXYMDcsbBZkDCJhsCl
         wN7+rv3ej9tvLLFolNMbt0CtGTKyEpK3SZT6UNEfzyzZcBsuEgDfFSLnEe/JSKZwr0fO
         4a3i7sw+z6bF/jgKu1Su+s5Fdxc1eVQMk3A9u1B6JikDzgA72Zng4WN+Xh82iRUefx2O
         naNmKJ3dQBCWbNc6UunkVpSi4X7CMAlLAULuOzAEK6Cbd4/UTawMkVMdf3j1Rx+Folje
         puegXSdwQ8ecDgSY4e1EGpL320fYJYWKui0aNjS9EHU43Ig8Vaipoc/VekhFA+BZTcS6
         IAeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X1BoDjvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c55e58ebb6si429024285a.288.2025.03.12.05.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 05:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X1BoDjvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsLaF-0007KP-Vy; Wed, 12 Mar 2025 08:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsLaE-0007Jc-2T
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 08:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsLaB-0005Ye-FW
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 08:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741783988;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAuNzg/BldTf5xbzrXz0vUIzDl2grnbUsziFphFbU7Q=;
 b=X1BoDjvTi/Fl2GVG2KVT/EyJjRFBk7PMUU36Z783X5jjSPM5fPMH2iwriTS5rOUBakBfP8
 /1LSswauja2uwKjfcWAi920dq4nttwljb92qNcuL06bGTKf5DfNaE2u8YqxoIadlz8BLLa
 KWyURDNJNL8rR+ODDSGCD4mmALiS/cs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-IdtFDUdmPAeoSySFLHkCRg-1; Wed, 12 Mar 2025 08:53:06 -0400
X-MC-Unique: IdtFDUdmPAeoSySFLHkCRg-1
X-Mimecast-MFC-AGG-ID: IdtFDUdmPAeoSySFLHkCRg_1741783986
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-474f079562dso225098691cf.1
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 05:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741783986; x=1742388786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tAuNzg/BldTf5xbzrXz0vUIzDl2grnbUsziFphFbU7Q=;
 b=hGRJmcZjVeN/wF3gEsLvnxHWDpElTkezhxhonmvm7NO6Tpvu3Cq+Em5SM1no/0M0/4
 Mm+00MdsjjvEy5Hz2mavqsVdx0O1ee3J0W8Ee9bLh44K37IUCBonEXOPSzBUQAvpz9ZU
 6xm9rU6ZQuP8HI7Mzq6AEshenueYCLjwHxpr234VXw8nligPsNqIzi23rSoFFRsau8Wm
 vYP4GZnZaGWGhQ4NqoJR5Fpo9Qt/wAZKmU+i8BFjya3TJwngxeExxkTH7TyviZDfo8c6
 J2T18HkKqM4YHqHBx3IE9eWjEI2WuWHpg5JAwzHx9srG/EQkh992Oczqs/1hloC7ofLI
 6zLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO1Zex0mCn8EvPSKFx4IjN4u4OH0opZmUZI0fbIn+7/bf8OisVGJM1kVuL/08BQIcpR+13KKI3+A==@nongnu.org
X-Gm-Message-State: AOJu0YwtaN6W8UJDNUQeysqQ/bgW9wby4+td9ZfnHGmBPg425OMxZzkt
 SmFmyAb8tH8+4hzA+TXtyYCAOxbDDf487PNAG5jPrVnjdbqjNhGXFBje7tnyx29NgFBy0t1uNy/
 hmf0ufeS/3KSSbK0lASUaorrBwsBxdrLsYzzce0Qrz5mD0IoA9A==
X-Gm-Gg: ASbGncuVuzHWV4+o5T5BFFD2DRacJYsnDAmkIT2VkhVM3AtnnSk5CVxB5Ld80Ug6o4w
 TlpZiPFYnIfp7n44wO8ZUS6jH2FtAY5wX5bPUNhsNuKDz1idp08oX1agkHZcwLr7X5819XQ38pP
 /PM/aNUfxBzv+uU5wqmUa0yGTWNzU6tUl94YXJcSLd9kBq4fvXKBx5jw1K+zIckO5Q02aUVEdfl
 1UlXJEw892fsqp3B2Ld/845ern3GKoJ/LB/qar5iZ695FquNLED7t8Y8VDxGRCv9yy7VFQ/DEPn
 EA27kZNvpoudGCk9YqNQTN9itLlGdTCQnnVj+CbxENdZhKoS6YSTxYHmjhI9OZ0=
X-Received: by 2002:a05:622a:a548:b0:476:6189:4f3d with SMTP id
 d75a77b69052e-47661895271mr181015321cf.17.1741783986122; 
 Wed, 12 Mar 2025 05:53:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a548:b0:476:6189:4f3d with SMTP id
 d75a77b69052e-47661895271mr181014971cf.17.1741783985747; 
 Wed, 12 Mar 2025 05:53:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-476905e344esm36718901cf.46.2025.03.12.05.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 05:53:05 -0700 (PDT)
Message-ID: <c6f90782-8fbd-46d6-8334-88c6b1d42a96@redhat.com>
Date: Wed, 12 Mar 2025 13:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/20] hw/arm/smmuv3-accel: Add
 set/unset_iommu_device callback
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-10-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-10-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pRxTEKhQT9hW-xFGBbA_elgMiPP67qu9-SPbQLK5dgY_1741783986
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3Vn0Q8FQgndP

Hi Shameer,


On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Implement a set_iommu_device callback:
>  -Find an existing S2 hwpt to test attach() or allocate a new one
>    (Devices behind the same physical SMMU should share an S2 HWPT.)
>  -Attach the device to the S2 hwp
>  -Allocate a viommu with the returned s2 hwpt.
>  -Allocate bypass and abort hwpt and attach bypass hwpt.
>  -and add it to its device list
>
> Also add an unset_iommu_device doing the opposite cleanup routine.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/meson.build            |   2 +-
>  hw/arm/smmuv3-accel.c         | 183 ++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events           |   4 +
>  include/hw/arm/smmuv3-accel.h |  23 +++++
>  include/system/iommufd.h      |   6 ++
>  5 files changed, 217 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index e8593363b0..dd41a86619 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -55,7 +55,7 @@ arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
>  arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
> -arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
> +arm_ss.add(when: ['CONFIG_ARM_SMMUV3_ACCEL', 'CONFIG_IOMMUFD'], if_true: files('smmuv3-accel.c'))
I guess we could set from patch 3 onwards?
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_ss.add(when: 'CONFIG_XEN', if_true: files(
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 6610ebe4be..1c696649d5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -7,6 +7,8 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "trace.h"
> +#include "qemu/error-report.h"
>  
>  #include "hw/arm/smmuv3-accel.h"
>  #include "hw/pci/pci_bridge.h"
> @@ -30,6 +32,185 @@ static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *s, SMMUPciBus *sbus,
>      return accel_dev;
>  }
>  
> +static bool
> +smmuv3_accel_dev_attach_viommu(SMMUv3AccelDevice *accel_dev,
> +                               HostIOMMUDeviceIOMMUFD *idev, Error **errp)
> +{
> +    struct iommu_hwpt_arm_smmuv3 bypass_data = {
> +        .ste = { 0x9ULL, 0x0ULL },
I would suggest to use defines.
> +    };
> +    struct iommu_hwpt_arm_smmuv3 abort_data = {
> +        .ste = { 0x1ULL, 0x0ULL },
same
> +    };
> +    SMMUDevice *sdev = &accel_dev->sdev;
> +    SMMUState *s = sdev->smmu;
> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(s);
> +    SMMUS2Hwpt *s2_hwpt;
> +    SMMUViommu *viommu;
> +    uint32_t s2_hwpt_id;
> +    uint32_t viommu_id;
> +
> +    if (s_accel->viommu) {
> +        accel_dev->viommu = s_accel->viommu;
> +        return host_iommu_device_iommufd_attach_hwpt(
> +                       idev, s_accel->viommu->s2_hwpt->hwpt_id, errp);
> +    }
> +
> +    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid, idev->ioas_id,
> +                                    IOMMU_HWPT_ALLOC_NEST_PARENT,
> +                                    IOMMU_HWPT_DATA_NONE, 0, NULL,
> +                                    &s2_hwpt_id, errp)) {
> +        return false;
> +    }
> +
> +    /* Attach to S2 for MSI cookie */
> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, s2_hwpt_id, errp)) {
> +        goto free_s2_hwpt;
> +    }
> +
> +    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> +                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> +                                      s2_hwpt_id, &viommu_id, errp)) {
> +        goto detach_s2_hwpt;
> +    }
> +
> +    viommu = g_new0(SMMUViommu, 1);
> +    viommu->core.viommu_id = viommu_id;
> +    viommu->core.s2_hwpt_id = s2_hwpt_id;
> +    viommu->core.iommufd = idev->iommufd;
> +
> +    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid,
> +                                    viommu->core.viommu_id, 0,
> +                                    IOMMU_HWPT_DATA_ARM_SMMUV3,
> +                                    sizeof(abort_data), &abort_data,
> +                                    &viommu->abort_hwpt_id, errp)) {
> +        error_report("failed to allocate an abort pagetable");
is that error_report needed as we have the error handle already?
> +        goto free_viommu;
> +    }
> +
> +    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid,
> +                                    viommu->core.viommu_id, 0,
> +                                    IOMMU_HWPT_DATA_ARM_SMMUV3,
> +                                    sizeof(bypass_data), &bypass_data,
> +                                    &viommu->bypass_hwpt_id, errp)) {
> +        error_report("failed to allocate a bypass pagetable");
same
> +        goto free_abort_hwpt;
> +    }
> +
> +    /*
> +     * Attach the bypass STE which means S1 bypass and S2 translate.
> +     * This is to make sure that the vIOMMU object is now associated
> +     * with the device and has this STE installed in the host SMMUV3.
> +     */
> +    if (!host_iommu_device_iommufd_attach_hwpt(
> +                idev, viommu->bypass_hwpt_id, errp)) {
> +        error_report("failed to attach the bypass pagetable");
same
if you prefer you can add error "hint"
> +        goto free_bypass_hwpt;
> +    }
> +
> +    s2_hwpt = g_new0(SMMUS2Hwpt, 1);
> +    s2_hwpt->iommufd = idev->iommufd;
> +    s2_hwpt->hwpt_id = s2_hwpt_id;
> +    s2_hwpt->ioas_id = idev->ioas_id;
> +
> +    viommu->iommufd = idev->iommufd;
> +    viommu->s2_hwpt = s2_hwpt;
> +
> +    s_accel->viommu = viommu;
> +    accel_dev->viommu = viommu;
> +    return true;
> +
> +free_bypass_hwpt:
> +    iommufd_backend_free_id(idev->iommufd, viommu->bypass_hwpt_id);
> +free_abort_hwpt:
> +    iommufd_backend_free_id(idev->iommufd, viommu->abort_hwpt_id);
> +free_viommu:
> +    iommufd_backend_free_id(idev->iommufd, viommu->core.viommu_id);
> +    g_free(viommu);
> +detach_s2_hwpt:
> +    host_iommu_device_iommufd_attach_hwpt(idev, accel_dev->idev->ioas_id, errp);
This should be detach.

Eric
> +free_s2_hwpt:
> +    iommufd_backend_free_id(idev->iommufd, s2_hwpt_id);
> +    return false;
> +}
> +
> +static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
> +                                          HostIOMMUDevice *hiod, Error **errp)
> +{
> +    HostIOMMUDeviceIOMMUFD *idev = HOST_IOMMU_DEVICE_IOMMUFD(hiod);
> +    SMMUState *s = opaque;
> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(s);
> +    SMMUPciBus *sbus = smmu_get_sbus(s, bus);
> +    SMMUv3AccelDevice *accel_dev = smmuv3_accel_get_dev(s, sbus, bus, devfn);
> +    SMMUDevice *sdev = &accel_dev->sdev;
> +
> +    if (!idev) {
> +        return true;
> +    }
> +
> +    if (accel_dev->idev) {
> +        if (accel_dev->idev != idev) {
> +            error_report("Device 0x%x already ha an associated idev",
> +                         smmu_get_sid(sdev));
> +            return false;
> +        } else {
> +            return true;
> +        }
> +    }
> +
> +    if (!smmuv3_accel_dev_attach_viommu(accel_dev, idev, errp)) {
> +        error_report("Unable to attach viommu");
> +        return false;
> +    }
> +
> +    accel_dev->idev = idev;
> +    QLIST_INSERT_HEAD(&s_accel->viommu->device_list, accel_dev, next);
> +    trace_smmuv3_accel_set_iommu_device(devfn, smmu_get_sid(sdev));
> +    return true;
> +}
> +
> +static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
> +                                            int devfn)
> +{
> +    SMMUDevice *sdev;
> +    SMMUv3AccelDevice *accel_dev;
> +    SMMUViommu *viommu;
> +    SMMUState *s = opaque;
> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(s);
> +    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
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
> +    if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
> +                                               accel_dev->idev->ioas_id,
> +                                               NULL)) {
> +        error_report("Unable to attach dev to the default HW pagetable");
> +    }
> +
> +
> +    accel_dev->idev = NULL;
> +    QLIST_REMOVE(accel_dev, next);
> +    trace_smmuv3_accel_unset_iommu_device(devfn, smmu_get_sid(sdev));
> +
> +    viommu = s_accel->viommu;
> +    if (QLIST_EMPTY(&viommu->device_list)) {
> +        iommufd_backend_free_id(viommu->iommufd, viommu->bypass_hwpt_id);
> +        iommufd_backend_free_id(viommu->iommufd, viommu->abort_hwpt_id);
> +        iommufd_backend_free_id(viommu->iommufd, viommu->core.viommu_id);
> +        iommufd_backend_free_id(viommu->iommufd, viommu->s2_hwpt->hwpt_id);
> +        g_free(viommu->s2_hwpt);
> +        g_free(viommu);
> +        s_accel->viommu = NULL;
> +    }
> +}
>  static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
>                                                int devfn)
>  {
> @@ -77,6 +258,8 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
>          return;
>      }
>      bs->get_address_space = smmuv3_accel_find_add_as;
> +    bs->set_iommu_device = smmuv3_accel_set_iommu_device;
> +    bs->unset_iommu_device = smmuv3_accel_unset_iommu_device;
>  }
>  
>  static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 7790db780e..17960794bf 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -58,6 +58,10 @@ smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s
>  smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
>  smmu_reset_exit(void) ""
>  
> +#smmuv3-accel.c
> +smmuv3_accel_set_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x)"
> +smmuv3_accel_unset_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x"
> +
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
>  strongarm_ssp_read_underrun(void) "SSP rx underrun"
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> index 86c0523063..aca6838dca 100644
> --- a/include/hw/arm/smmuv3-accel.h
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -12,16 +12,39 @@
>  #include "hw/arm/smmu-common.h"
>  #include "hw/arm/smmuv3.h"
>  #include "qom/object.h"
> +#include "system/iommufd.h"
> +
> +#include <linux/iommufd.h>
>  
>  #define TYPE_ARM_SMMUV3_ACCEL   "arm-smmuv3-accel"
>  OBJECT_DECLARE_TYPE(SMMUv3AccelState, SMMUv3AccelClass, ARM_SMMUV3_ACCEL)
>  
> +typedef struct SMMUS2Hwpt {
> +    IOMMUFDBackend *iommufd;
> +    uint32_t hwpt_id;
> +    uint32_t ioas_id;
> +} SMMUS2Hwpt;
> +
> +typedef struct SMMUViommu {
> +    IOMMUFDBackend *iommufd;
> +    IOMMUFDViommu core;
> +    SMMUS2Hwpt *s2_hwpt;
> +    uint32_t bypass_hwpt_id;
> +    uint32_t abort_hwpt_id;
> +    QLIST_HEAD(, SMMUv3AccelDevice) device_list;
> +    QLIST_ENTRY(SMMUViommu) next;
> +} SMMUViommu;
> +
>  typedef struct SMMUv3AccelDevice {
>      SMMUDevice  sdev;
> +    HostIOMMUDeviceIOMMUFD *idev;
> +    SMMUViommu *viommu;
> +    QLIST_ENTRY(SMMUv3AccelDevice) next;
>  } SMMUv3AccelDevice;
>  
>  struct SMMUv3AccelState {
>      SMMUv3State smmuv3_state;
> +    SMMUViommu *viommu;
>  };
>  
>  struct SMMUv3AccelClass {
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 53920bae5b..9c106ea078 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -37,6 +37,12 @@ struct IOMMUFDBackend {
>      /*< public >*/
>  };
>  
> +typedef struct IOMMUFDViommu {
> +    IOMMUFDBackend *iommufd;
> +    uint32_t s2_hwpt_id;
> +    uint32_t viommu_id;
> +} IOMMUFDViommu;
> +
>  bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>  void iommufd_backend_disconnect(IOMMUFDBackend *be);
>  

