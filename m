Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8493AFD064F
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 07:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0EPb-0002R8-U0; Wed, 11 Mar 2026 03:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0EPX-0002Pj-6k
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 03:55:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0EPU-0007d4-OL
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 03:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773215716;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uSlSc4FjElAj8G0g8yiuXkmjML//DckDNBnVkqAa94=;
 b=NuFp+4Mh538YiJsxqm2czitlff94FcgUR/RSMaOw7lKT/IX/wfmdwZ6WBRZ+Pa9YrM+z01
 x2oJXx2fsacy6+WkgF/0c5Bj3JVPMsi7VcM28dHXv499QeiY1VQ3rYR8l0Gl0RgnU0fj2T
 jTagLPHWUIsWxHfAz4jTrRN6bAMWEDw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-PB7PIFDPPJ6XM7kJIz219w-1; Wed, 11 Mar 2026 03:55:14 -0400
X-MC-Unique: PB7PIFDPPJ6XM7kJIz219w-1
X-Mimecast-MFC-AGG-ID: PB7PIFDPPJ6XM7kJIz219w_1773215713
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-439cbc5fd75so5352616f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 00:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773215713; x=1773820513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/uSlSc4FjElAj8G0g8yiuXkmjML//DckDNBnVkqAa94=;
 b=Ct54R2TOdDRARxQP9/0gg9NIpESvVG0p5xHUF+NF3hMJwIMSKP/hbOmSn0Xe7z7vZm
 ufQGKwjPHJNJT8nfwcVmilRvAens2kUa5I7DRaNqhLO7NYCxdJ6lU2wPfNGRiYbojqar
 uHybU+VbO971MT2EcuhPmWv+zZxNZ15HLH2Wmtg+5DgVXesy6nWwUCXg2nioVrUCtHQP
 sb11GXtOb/0p+bMUijQq8EdT8ckTUOTBdW1KbQXFVr8NGmJ/d+XO2azkon49c1sj/AGd
 YESNcTBKQMGk2iioD2CVeJjsn6UDFUQKyMhu8uWTwvuA5IQYcIvM6iuyKcKKDVAmDEvE
 9AnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1QZwF6t44EJ5CFKIvxm+u9uyzvzwOM2QMuGZFgoB0XHsJapGoJlkcyktfFd8Y3cPFv+gJHR0hSA==@nongnu.org
X-Gm-Message-State: AOJu0YxvO5Q5LosXc/LNqeqorxzuwpRQOGKy5+IlmPZxZYCprGLplkyp
 8IU3cgMd5JNaYwdQ95sXl4FPZBQIRnKRfOFd7qO5MFUwWmE1nFQfdSlenH+cjD0ibCvUsWK7mgj
 43eZ4Or8yQgaIXd3tmeWfQmGkd0Hi6P/0z80wbP0QPq5Dpu3OHirnUA==
X-Gm-Gg: ATEYQzxX4SHQR1tETLUhNxiZYfc7REOe8oYH7jVSm1RGjcGwuf/5DK00Lc9W+2X8g+n
 h3v8RaEGFYblcVLCnpcFlDBLdcjUYEjnBZDFq7wuUPNGhedToVmf4khxgk80w/GC6ecd0PpEHUF
 Fn4+Ixnj/Q4prCy0t7yuUM1QiSHgbIJdReH//UeD6UgoB3MNs22TPfCT69GDvO6ibPNQa1MRI7O
 u6zSveWc7Edj31s2rTcPPY30Zfia1VEyxvgcFgzrZ3XbWcZx6MjfAuom1erH+FZx4ocGh66hIrQ
 AsBLOWwZCnS9EPeJ90ih38pr0XYn0GU8Ms/iZnFQBO7v4Gc/iLaXFipLMmmZm6x/+zK6bViKGG7
 1HmJu0sru1wmCC16LWPddWR5rpgEKHQGnOzKDoId8C4G5llmMliwGE/eIZuHpPTn2jdh+4g==
X-Received: by 2002:a05:6000:2386:b0:439:b811:11de with SMTP id
 ffacd0b85a97d-439f81bd4aemr3008904f8f.7.1773215713185; 
 Wed, 11 Mar 2026 00:55:13 -0700 (PDT)
X-Received: by 2002:a05:6000:2386:b0:439:b811:11de with SMTP id
 ffacd0b85a97d-439f81bd4aemr3008842f8f.7.1773215712694; 
 Wed, 11 Mar 2026 00:55:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f143asm4998019f8f.23.2026.03.11.00.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 00:55:12 -0700 (PDT)
Message-ID: <22acfd93-72cd-49ca-b2f6-a080bf66104c@redhat.com>
Date: Wed, 11 Mar 2026 08:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0 for CMDQV
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-18-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-18-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlNC589rSqNZVn59Skxj6nqy3-9O-rlima_3RcDreh0_1773215713
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Global VCMDQ pages provide a VM wide view of all VCMDQs, while the
> VINTF pages expose a logical view local to a given VINTF. Although real
> hardware may support multiple VINTFs, the kernel currently exposes a
> single VINTF per VM.
>
> The kernel provides an mmap offset for the VINTF Page0 region during
> vIOMMU allocation. However, the logical-to-physical association between
> VCMDQs and a VINTF is only established after HW_QUEUE allocation. Prior
> to that, the mapped Page0 does not back any real VCMDQ state.
>
> When VINTF is enabled, mmap the kernel provided Page0 region and
> unmap it when VINTF is disabled. This prepares the VINTF mapping
> in advance of subsequent patches that add VCMDQ allocation support.
So at some point we transition from something that is purely emulated
(page 1 global cmdq) to something that is mmapped on a host page. How do
we transfer the state of the cmdq from one to the other?

Thanks

Eric
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  3 +++
>  hw/arm/tegra241-cmdqv.c | 44 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index d379b8860c..3ce9f539ae 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -18,6 +18,8 @@
>  #define TEGRA241_CMDQV_MAX_CMDQ            (1U << TEGRA241_CMDQV_NUM_CMDQ_LOG2)
>  #define TEGRA241_CMDQV_NUM_SID_PER_VM_LOG2 4
>  
> +#define VINTF_PAGE_SIZE 0x10000
> +
>  /*
>   * Tegra241 CMDQV MMIO layout (64KB pages)
>   *
> @@ -34,6 +36,7 @@ typedef struct Tegra241CMDQV {
>      SMMUv3AccelState *s_accel;
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
> +    void *vintf_page0;
>  
>      /* Register Cache */
>      uint32_t config;
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index e1f1562c44..a3767a85a3 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -151,6 +151,39 @@ static uint64_t tegra241_cmdqv_read(void *opaque, hwaddr offset, unsigned size)
>      }
>  }
>  
> +static bool
> +tegra241_cmdqv_munmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
> +{
> +    if (!cmdqv->vintf_page0) {
> +        return true;
> +    }
> +
> +    if (munmap(cmdqv->vintf_page0, VINTF_PAGE_SIZE) < 0) {
> +        error_setg_errno(errp, errno, "Failed to unmap VINTF page0");
> +        return false;
> +    }
> +    cmdqv->vintf_page0 = NULL;
> +    return true;
> +}
> +
> +static bool tegra241_cmdqv_mmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
> +{
> +    IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
> +
> +    if (cmdqv->vintf_page0) {
> +        return true;
> +    }
> +
> +    if (!iommufd_backend_viommu_mmap(viommu->iommufd, viommu->viommu_id,
> +                                     VINTF_PAGE_SIZE,
> +                                     cmdqv->cmdqv_data.out_vintf_mmap_offset,
> +                                     &cmdqv->vintf_page0, errp)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  /*
>   * Write a VCMDQ register using VCMDQ0_* offsets.
>   *
> @@ -216,7 +249,7 @@ tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0, int index,
>  }
>  
>  static void tegra241_cmdqv_write_vintf(Tegra241CMDQV *cmdqv, hwaddr offset,
> -                                       uint64_t value)
> +                                       uint64_t value, Error **errp)
>  {
>      int i;
>  
> @@ -227,8 +260,10 @@ static void tegra241_cmdqv_write_vintf(Tegra241CMDQV *cmdqv, hwaddr offset,
>  
>          cmdqv->vintf_config = value;
>          if (value & R_VINTF0_CONFIG_ENABLE_MASK) {
> +            tegra241_cmdqv_mmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
>          } else {
> +            tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>          }
>          break;
> @@ -251,6 +286,7 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>                                   unsigned size)
>  {
>      Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
> +    Error *local_err = NULL;
>      int index;
>  
>      if (offset >= TEGRA241_CMDQV_IO_LEN) {
> @@ -276,7 +312,7 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>          cmdqv->cmdq_alloc_map[(offset - A_CMDQ_ALLOC_MAP_0) / 4] = value;
>          break;
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
> -        tegra241_cmdqv_write_vintf(cmdqv, offset, value);
> +        tegra241_cmdqv_write_vintf(cmdqv, offset, value, &local_err);
>          break;
>      case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
>          /* Same decoding as read() case: See comments above */
> @@ -300,6 +336,10 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset);
>      }
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
>  }
>  
>  static void tegra241_cmdqv_free_viommu(SMMUv3State *s)


