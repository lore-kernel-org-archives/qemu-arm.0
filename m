Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20940CA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 10:32:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuTjG-0006EY-BH; Fri, 05 Sep 2025 06:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTj6-0006AU-Bt
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTir-000299-4K
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757068269;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkWw8qVMXyHSG1oIuWMI2STblMssoHOl8GtrevSAU28=;
 b=cR8hIp/Q6dnS5qNYaVuGbqVqrL1TL+cX4U9bauKnL3A92TluWiqPDFxqlLXWyRnWhVqCVH
 LpGge6/7nur3ElQASGvrvPDAPslJZcEY2XTRMv/cNDeF4g+s2KkhVwHTdDHCWNMFSRhvKk
 1pSNY2j/V1DDqG+ZWKqblAZ5U8woE7I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-T6Kx-N20MH60b2QAPHsJQw-1; Fri, 05 Sep 2025 06:31:08 -0400
X-MC-Unique: T6Kx-N20MH60b2QAPHsJQw-1
X-Mimecast-MFC-AGG-ID: T6Kx-N20MH60b2QAPHsJQw_1757068267
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3dc0f2fd4acso1190688f8f.2
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 03:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757068266; x=1757673066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkWw8qVMXyHSG1oIuWMI2STblMssoHOl8GtrevSAU28=;
 b=STPwvomodBIN73p0mrdRnnY3SJNeWCMjeDtJuIiAD7Zq+b2hnge48B1uLVPYMMWxTn
 ld7ZIpasIwECa6/zWTfYwcS42qslULxweLq1xub6JdPdbp7A1H5h2blED5c7unbywWEK
 pHrM6v9Uia/eld/TEjQRJ19QmJxW5Qy0+jdwgYra67iIEU/sqTs1Ab+OW+EOswBUQCfC
 SsQFZe69Vr7Gme/WZw8zWqA8TA1t7m32NvNMleNLBPOpN0N3BkMDptoZheAmFt6vtr4d
 tCceNqA5mni/nwQJqXDYcCFWWxB17lKCA7ZVrYlyAxzjrDlbeXHYVPgCACTl/4HJe++o
 aFfw==
X-Gm-Message-State: AOJu0YyHKuR7S/7gW6AW1+aS5BNnmaTng8TxqqncrFfRlTqZb9SVD5EE
 js5cU3wHsMsyKMoHP0RwopJERi4g/sJ4Kra1oghzFD8LdqD/nwgiLX8WwHRgZBLQDq/GeJeEdih
 HualBDc3MbgGjbdr38VHleYPQIXYSRpR97n+uzubcQIyjDcUoy5jCBe5iXLfq4MrbTFecdGxu8n
 jPda5acOWNWJ9bgMytD8TaNZ/RhzD3vW737HZE/OU2pUQ=
X-Gm-Gg: ASbGnctz/lswmsxb4k33Vf+YjmXpc3hUK+fRtImG7lpTfNK0fJUPPSm7IsGtQv5PFzf
 mPc9sduGZKRCG5Yqgfh+ck4xgtJ2ItMGUCLoE95kmeb9kmYz+X3DGe3HDodmjocMnqswMrIqOgg
 o3SBUXCS8j3A6xgzhTXPBaSAN6DyG7yIpYdxiMSnPJT9E+kXI7HFS80fQI5lVCbwi1dnz+9krU7
 WIvbKp4KlBhO08yJxXEBPuZM0ERppls6Ls+cXXqVd+9SK0foERdbzwneplyCiDrs7JKFzpRgIp1
 c/z+Hu95kaD/JyKjE35qu3oCn62dnyc3KAWKpTM+/ap2ira0+zYjN+SgtOYuE7Rg9eZau4sct7A
 kM2OT1UXe+KQ=
X-Received: by 2002:a5d:5f96:0:b0:3e5:50:e060 with SMTP id
 ffacd0b85a97d-3e50050e3e9mr21913f8f.52.1757068266439; 
 Fri, 05 Sep 2025 03:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1ubhMcekTqnJg9dvfMsFlB1/2RSTXfTJiKILhA9ebfmsuK/uiRF7cyC40iD3E6bxZo5bH3Q==
X-Received: by 2002:a5d:5f96:0:b0:3e5:50:e060 with SMTP id
 ffacd0b85a97d-3e50050e3e9mr21856f8f.52.1757068265815; 
 Fri, 05 Sep 2025 03:31:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d21a32dbc5sm28526799f8f.11.2025.09.05.03.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:31:05 -0700 (PDT)
Message-ID: <c2935990-ac0b-4272-b3aa-92a555d88e99@redhat.com>
Date: Fri, 5 Sep 2025 12:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 12/15] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-13-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-13-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EQtoFQZ2kSFi8oZOyQa5jIbIl8kuthj1RJu75pTj_tE_1757068267
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Helpers will batch the commands and issue at once to host SMMUv3.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c    | 65 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h    | 16 ++++++++++
>  hw/arm/smmuv3-internal.h | 12 ++++++++
>  3 files changed, 93 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 04c665ccf5..1298b4f6d0 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -168,6 +168,71 @@ smmuv3_accel_install_nested_ste_range(SMMUState *bs, SMMUSIDRange *range)
>      g_hash_table_foreach(bs->configs, smmuv3_accel_ste_range, range);
>  }
>  
> +/* Update batch->ncmds to the number of execute cmds */
> +bool smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch)
> +{
> +    SMMUv3State *s = ARM_SMMUV3(bs);
> +    SMMUv3AccelState *s_accel = s->s_accel;
> +    uint32_t total = batch->ncmds;
> +    IOMMUFDViommu *viommu_core;
> +    int ret;
> +
> +    if (!bs->accel) {
> +        return true;
> +    }
> +
> +    if (!s_accel->viommu) {
> +        return true;
> +    }
> +
> +    viommu_core = &s_accel->viommu->core;
> +    ret = iommufd_backend_invalidate_cache(viommu_core->iommufd,
> +                                           viommu_core->viommu_id,
> +                                           IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3,
> +                                           sizeof(Cmd), &batch->ncmds,
> +                                           batch->cmds, NULL);
> +    if (!ret || total != batch->ncmds) {
> +        error_report("%s failed: ret=%d, total=%d, done=%d",
> +                      __func__, ret, total, batch->ncmds);
> +        return ret;
> +    }
> +
> +    batch->ncmds = 0;
> +    return ret;
> +}
> +
> +/*
> + * Note: sdev can be NULL for certain invalidation commands
> + * e.g., SMMU_CMD_TLBI_NH_ASID, SMMU_CMD_TLBI_NH_VA etc.
> + */
> +void smmuv3_accel_batch_cmd(SMMUState *bs, SMMUDevice *sdev,
> +                           SMMUCommandBatch *batch, Cmd *cmd,
> +                           uint32_t *cons)
> +{
> +    if (!bs->accel) {
> +        return;
> +    }
> +
> +   /*
> +    * We may end up here for any emulated PCI bridge or root port type
> +    * devices. The batching of commands only matters for vfio-pci endpoint
> +    * devices with Guest S1 translation enabled. Hence check that, if
> +    * sdev is available.
> +    */
> +    if (sdev) {
> +        SMMUv3AccelDevice *accel_dev;
> +        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
> +
> +        if (!accel_dev->s1_hwpt) {
> +            return;
> +        }
> +    }
> +
> +    batch->cmds[batch->ncmds] = *cmd;
> +    batch->cons[batch->ncmds++] = *cons;
> +    return;
> +}
> +
>  static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
>                                                  PCIBus *bus, int devfn)
>  {
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 21028e60c8..d06c9664ba 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -13,6 +13,7 @@
>  #include "hw/arm/smmu-common.h"
>  #include "system/iommufd.h"
>  #include <linux/iommufd.h>
> +#include "smmuv3-internal.h"
>  #include CONFIG_DEVICES
>  
>  typedef struct SMMUS2Hwpt {
> @@ -55,6 +56,10 @@ void smmuv3_accel_init(SMMUv3State *s);
>  void smmuv3_accel_install_nested_ste(SMMUState *bs, SMMUDevice *sdev, int sid);
>  void smmuv3_accel_install_nested_ste_range(SMMUState *bs,
>                                             SMMUSIDRange *range);
> +bool smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch);
> +void smmuv3_accel_batch_cmd(SMMUState *bs, SMMUDevice *sdev,
> +                           SMMUCommandBatch *batch, struct Cmd *cmd,
> +                           uint32_t *cons);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *d)
>  {
> @@ -67,6 +72,17 @@ static inline void
>  smmuv3_accel_install_nested_ste_range(SMMUState *bs, SMMUSIDRange *range)
>  {
>  }
> +static inline bool smmuv3_accel_issue_cmd_batch(SMMUState *bs,
> +                                               SMMUCommandBatch *batch)
> +{
> +    return true;
> +}
> +static inline void smmuv3_accel_batch_cmd(SMMUState *bs, SMMUDevice *sdev,
> +                                          SMMUCommandBatch *batch,
> +                                          struct Cmd *cmd, uint32_t *cons)
> +{
> +    return;
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 738061c6ad..8cb6a9238a 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -547,6 +547,18 @@ typedef struct CD {
>      uint32_t word[16];
>  } CD;
>  
> +/*
> + * SMMUCommandBatch - batch of invalidation commands for accel smmuv3
> + * @cmds: Pointer to list of commands
> + * @cons: Pointer to list of CONS corresponding to the commands
It is not totally clear to me how the list of "CONS" indexes is used. Is
it meant to store errors, how do you update cons index in case it starts
failing, ...

Thanks

Eric
> + * @ncmds: Number of cmds in the batch
> + */
> +typedef struct SMMUCommandBatch {
> +    struct Cmd *cmds;
> +    uint32_t *cons;
> +    uint32_t ncmds;
> +} SMMUCommandBatch;
> +
>  int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>                    SMMUEventInfo *event);
>  void smmuv3_flush_config(SMMUDevice *sdev);


