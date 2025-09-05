Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA61CCA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 09:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuSvv-0001u9-Vs; Fri, 05 Sep 2025 05:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuSvs-0001sb-6s
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuSvk-000322-Bu
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 05:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757065223;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54mT/Q5vtaM1bWNgRvk/n22WQtgAGWNzrVXooY5qdps=;
 b=LazfMWx/vo4ydAoOxOa4Mc660uf3z8q7krBmsNZx9fVEAoyrV5iXgxpBi813ue+vCXaiac
 jskNE39wqGofPUsYIvGBUJ69zZ1lErsasUj32pZYKxYEXpk8EL5luXcbMDwYmv0fakEhcs
 w2nNYBdhnSAWTiTSBF7gBgPnJep82QE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-J2AOgfPXOGKjBdYVN79jpQ-1; Fri, 05 Sep 2025 05:40:22 -0400
X-MC-Unique: J2AOgfPXOGKjBdYVN79jpQ-1
X-Mimecast-MFC-AGG-ID: J2AOgfPXOGKjBdYVN79jpQ_1757065221
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3dc3f943e6eso1250162f8f.2
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 02:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757065221; x=1757670021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54mT/Q5vtaM1bWNgRvk/n22WQtgAGWNzrVXooY5qdps=;
 b=oQdlBtTU42xUrWk/SBUoUiXOmHjf43x9NeoFH+sVfayR4+mDbcyXkTZ13MxJrahVPN
 Z84nH90qw+AM0o63+AnGE+1KXUB7C21XYR+g8J3cg3G//DteP60vK+/yLgAONxdhrLzl
 YE+eG5TmFLW5Od5J4nGZyc6Fsk7Uuopzdtm6n7wcR8MG9kel885bXaDsUTcfGW1Nlgr6
 H1d3fGiPuxnWkwcUKsYFaelwGmp2/a0GkUhtqSnXXo+7+ie8EObP/1xubtSOKifj2ioB
 VXbkuq5br0zyba9yFOMErCEUje3dnHcI/F6S86mziNLNUVSAXFFwwFKhwHQfrg+L/YU0
 YwDA==
X-Gm-Message-State: AOJu0YyzVBaL36hK8f/bwXRKmXaF2ZJDNUCa/c0L6fn3S5YbceP1/VO0
 G7v73zFqEQWDqkOPYADkxzxwBc74elNtnNgq/SwJ31Hvq/QVGhf2W8IDQSy04+6tEvNCZzR0HUf
 5/V5o/vMA7DM7sI80+0ufSH2Qpo2+YEzx0DiTOoOscoAjRGZxjH9T9v1ziQTQfEZqbc+uOLlOW1
 dkYk58hc8W37KvC9Zcc/B/GVi54VWicTPHhOfzViW/Ms4=
X-Gm-Gg: ASbGnctn+M8GHVDV3N1Ddjp46003EuQLFd1KsKOuFxkcLT45da8vyypE5YcLfAxnvKD
 WBJ6EJJXRJiW58Jj/uNIQdThG0487bCK3AMbRFSpwTXEXgE9DEDXzM6bLkBMzdqlkjXlADM0GID
 GHQJLC21Brzf9H4JTcVAIZRXs09rEvQsy91cwIDfRGbnba8ZvZRKpajZzcYkfzhhb72LPQtnyCz
 7/Y4lXoeydJCGzw0YuitqWmzudwV0L0lRGLLuj2Tx6FxZGZydc4p+thtk5+p1ssYs/n4z3TtM1f
 pF1+LW3ZH7BwN9puOPow/kqHKZAqz3fH3aHOlIsY7RveIInWt85n339zp4olCaa30QZcx0DbHnH
 VCIqYnz/Gjpk=
X-Received: by 2002:a5d:5c84:0:b0:3df:d8ea:1f87 with SMTP id
 ffacd0b85a97d-3dfd8ea27a5mr6435869f8f.58.1757065220569; 
 Fri, 05 Sep 2025 02:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcXln/tANMdrKOsTvR0gTUUmtklS5+a+7IMIE4YSHWUS8SAGX5Y7mQISEWmsN2cudUtxFzNw==
X-Received: by 2002:a5d:5c84:0:b0:3df:d8ea:1f87 with SMTP id
 ffacd0b85a97d-3dfd8ea27a5mr6435820f8f.58.1757065219886; 
 Fri, 05 Sep 2025 02:40:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e23d29bb9esm4295644f8f.4.2025.09.05.02.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 02:40:18 -0700 (PDT)
Message-ID: <41ceadf1-07de-4c8a-8935-d709ac7cf6bc@redhat.com>
Date: Fri, 5 Sep 2025 11:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/15] hw/arm/smmuv3-accel: Support nested STE
 install/uninstall support
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, skolothumtho@nvidia.com
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-10-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-10-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w6EUpbP3yelIKcrq9e01M4_99gLEl4ttukO1rttm17o_1757065221
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

On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Allocates a s1 HWPT for the Guest s1 stage and attaches that
> to the dev. This will be invoked when Guest issues
dev: I think you shall be more precise because there are so many now ;-)
> SMMU_CMD_CFGI_STE/STE_RANGE.
>
> While at it, we are also exporting both smmu_find_ste() and
> smmuv3_flush_config() from smmuv3.c for use here.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c    | 130 +++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h    |  17 +++++
>  hw/arm/smmuv3-internal.h |   4 ++
>  hw/arm/smmuv3.c          |   8 ++-
>  hw/arm/trace-events      |   1 +
>  5 files changed, 157 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index fe90d48675..74bf20cfaf 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -18,9 +18,139 @@
>  
>  #include "smmuv3-accel.h"
>  
> +#include "smmuv3-internal.h"
> +
>  #define SMMU_STE_VALID      (1ULL << 0)
>  #define SMMU_STE_CFG_BYPASS (1ULL << 3)
>  
> +static void
> +smmuv3_accel_dev_uninstall_nested_ste(SMMUv3AccelDevice *accel_dev, bool abort)
> +{
> +    HostIOMMUDeviceIOMMUFD *idev = accel_dev->idev;
> +    SMMUS1Hwpt *s1_hwpt = accel_dev->s1_hwpt;
> +    uint32_t hwpt_id;
> +
> +    if (!s1_hwpt || !accel_dev->viommu) {
> +        return;
> +    }
> +
> +    if (abort) {
> +        hwpt_id = accel_dev->viommu->abort_hwpt_id;
> +    } else {
> +        hwpt_id = accel_dev->viommu->bypass_hwpt_id;
> +    }
> +
> +    host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, &error_abort);
> +    iommufd_backend_free_id(s1_hwpt->iommufd, s1_hwpt->hwpt_id);
> +    accel_dev->s1_hwpt = NULL;
> +    g_free(s1_hwpt);
> +}
> +
> +static int
> +smmuv3_accel_dev_install_nested_ste(SMMUv3AccelDevice *accel_dev,
> +                                    uint32_t data_type, uint32_t data_len,
> +                                    void *data)
> +{
> +    SMMUViommu *viommu = accel_dev->viommu;
> +    SMMUS1Hwpt *s1_hwpt = accel_dev->s1_hwpt;
> +    HostIOMMUDeviceIOMMUFD *idev = accel_dev->idev;
> +    uint32_t flags = 0;
> +
> +    if (!idev || !viommu) {
> +        return -ENOENT;
> +    }
> +
> +    if (s1_hwpt) {
> +        smmuv3_accel_dev_uninstall_nested_ste(accel_dev, true);
> +    }
> +
> +    s1_hwpt = g_new0(SMMUS1Hwpt, 1);
> +    s1_hwpt->iommufd = idev->iommufd;
> +    iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid,
> +                               viommu->core.viommu_id, flags, data_type,
> +                               data_len, data, &s1_hwpt->hwpt_id, &error_abort);
> +    host_iommu_device_iommufd_attach_hwpt(idev, s1_hwpt->hwpt_id, &error_abort);
We don't want error_abort here in the prospect to support hotplug. Also
I think you should properly cascade any error through Error handles, at
least on the install path
> +    accel_dev->s1_hwpt = s1_hwpt;
> +    return 0;
> +}
> +
> +void smmuv3_accel_install_nested_ste(SMMUState *bs, SMMUDevice *sdev, int sid)
return bool and pass Error handle
> +{
> +    SMMUv3AccelDevice *accel_dev;
> +    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid,
> +                           .inval_ste_allowed = true};
> +    struct iommu_hwpt_arm_smmuv3 nested_data = {};
> +    uint32_t config;
> +    STE ste;
> +    int ret;
> +
> +    if (!bs->accel) {
> +        return;
> +    }
> +
> +    accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
> +    if (!accel_dev->viommu) {
> +        return;
> +    }
> +
> +    ret = smmu_find_ste(sdev->smmu, sid, &ste, &event);
> +    if (ret) {
> +        error_report("failed to find STE for sid 0x%x", sid);
> +        return;
> +    }
> +
> +    config = STE_CONFIG(&ste);
> +    if (!STE_VALID(&ste) || !STE_CFG_S1_ENABLED(config)) {
> +        smmuv3_accel_dev_uninstall_nested_ste(accel_dev, STE_CFG_ABORT(config));
> +        smmuv3_flush_config(sdev);
> +        return;
> +    }
> +
> +    nested_data.ste[0] = (uint64_t)ste.word[0] | (uint64_t)ste.word[1] << 32;
> +    nested_data.ste[1] = (uint64_t)ste.word[2] | (uint64_t)ste.word[3] << 32;
> +    /* V | CONFIG | S1FMT | S1CTXPTR | S1CDMAX */
use bitmasks here and below?
> +    nested_data.ste[0] &= 0xf80fffffffffffffULL;
> +    /* S1DSS | S1CIR | S1COR | S1CSH | S1STALLD | EATS */
> +    nested_data.ste[1] &= 0x380000ffULL;
> +    ret = smmuv3_accel_dev_install_nested_ste(accel_dev,
> +                                              IOMMU_HWPT_DATA_ARM_SMMUV3,
> +                                              sizeof(nested_data),
> +                                              &nested_data);
> +    if (ret) {
> +        error_report("Unable to install nested STE=%16LX:%16LX, sid=0x%x,"
> +                      "ret=%d", nested_data.ste[1], nested_data.ste[0],
> +                      sid, ret);
error_setg everywhere
> +    }
> +
> +    trace_smmuv3_accel_install_nested_ste(sid, nested_data.ste[1],
> +                                          nested_data.ste[0]);
> +}
> +
> +static void
> +smmuv3_accel_ste_range(gpointer key, gpointer value, gpointer user_data)
> +{
> +    SMMUDevice *sdev = (SMMUDevice *)key;
> +    uint32_t sid = smmu_get_sid(sdev);
> +    SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
> +
> +    if (sid >= sid_range->start && sid <= sid_range->end) {
> +        SMMUv3State *s = sdev->smmu;
> +        SMMUState *bs = &s->smmu_state;
> +
> +        smmuv3_accel_install_nested_ste(bs, sdev, sid);
> +    }
> +}
> +
> +void
> +smmuv3_accel_install_nested_ste_range(SMMUState *bs, SMMUSIDRange *range)
> +{
> +    if (!bs->accel) {
> +        return;
> +    }
> +
> +    g_hash_table_foreach(bs->configs, smmuv3_accel_ste_range, range);
> +}
> +
>  static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
>                                                  PCIBus *bus, int devfn)
>  {
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 55a6a353fc..06e81b630d 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -29,10 +29,16 @@ typedef struct SMMUViommu {
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
>  } SMMUViommu;
>  
> +typedef struct SMMUS1Hwpt {
> +    IOMMUFDBackend *iommufd;
> +    uint32_t hwpt_id;
> +} SMMUS1Hwpt;
> +
>  typedef struct SMMUv3AccelDevice {
>      SMMUDevice  sdev;
>      AddressSpace as_sysmem;
>      HostIOMMUDeviceIOMMUFD *idev;
> +    SMMUS1Hwpt  *s1_hwpt;
>      SMMUViommu *viommu;
>      QLIST_ENTRY(SMMUv3AccelDevice) next;
>  } SMMUv3AccelDevice;
> @@ -45,10 +51,21 @@ typedef struct SMMUv3AccelState {
>  
>  #if defined(CONFIG_ARM_SMMUV3) && defined(CONFIG_IOMMUFD)
>  void smmuv3_accel_init(SMMUv3State *s);
> +void smmuv3_accel_install_nested_ste(SMMUState *bs, SMMUDevice *sdev, int sid);
> +void smmuv3_accel_install_nested_ste_range(SMMUState *bs,
> +                                           SMMUSIDRange *range);
to me should return an int or bool and convey Error handle
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *d)
>  {
>  }
> +static inline void
> +smmuv3_accel_install_nested_ste(SMMUState *bs, SMMUDevice *sdev, int sid)
> +{
> +}
> +static inline void
> +smmuv3_accel_install_nested_ste_range(SMMUState *bs, SMMUSIDRange *range)
> +{
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b6b7399347..738061c6ad 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -547,6 +547,10 @@ typedef struct CD {
>      uint32_t word[16];
>  } CD;
>  
> +int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
> +                  SMMUEventInfo *event);
> +void smmuv3_flush_config(SMMUDevice *sdev);
> +
>  /* STE fields */
>  
>  #define STE_VALID(x)   extract32((x)->word[0], 0, 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2f5a8157dd..c94bfe6564 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -630,8 +630,8 @@ bad_ste:
>   * Supports linear and 2-level stream table
>   * Return 0 on success, -EINVAL otherwise
>   */
> -static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
> -                         SMMUEventInfo *event)
> +int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
> +                  SMMUEventInfo *event)
>  {
>      dma_addr_t addr, strtab_base;
>      uint32_t log2size;
> @@ -900,7 +900,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>      return cfg;
>  }
>  
> -static void smmuv3_flush_config(SMMUDevice *sdev)
> +void smmuv3_flush_config(SMMUDevice *sdev)
>  {
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
> @@ -1342,6 +1342,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>  
>              trace_smmuv3_cmdq_cfgi_ste(sid);
>              smmuv3_flush_config(sdev);
> +            smmuv3_accel_install_nested_ste(bs, sdev, sid);
>  
>              break;
>          }
> @@ -1361,6 +1362,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              sid_range.end = sid_range.start + mask;
>  
>              trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, sid_range.end);
> +            smmuv3_accel_install_nested_ste_range(bs, &sid_range);
>              smmu_configs_inv_sid_range(bs, sid_range);
>              break;
>          }
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index c4537ca1d6..7d232ca17c 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -69,6 +69,7 @@ smmu_reset_exit(void) ""
>  #smmuv3-accel.c
>  smmuv3_accel_set_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x)"
>  smmuv3_accel_unset_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x"
> +smmuv3_accel_install_nested_ste(uint32_t sid, uint64_t ste_1, uint64_t ste_0) "sid=%d ste=%"PRIx64":%"PRIx64
>  
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
Thanks

Eric


