Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3330383njc;
        Wed, 26 Mar 2025 06:59:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9SGgihABz6LURvLjseSUx9QEk8qUMHue7DpIPTxBIYC/EuZnuS4Qh34fHEP7rJp+htJg7Bjg8KiJzhg==@linaro.org
X-Google-Smtp-Source: AGHT+IGL6CRaDWRs7iJaCJIF3jr8PaJYg6uyUxI+ny6pTwW23eOLMpyjILmOUR64Jp1UZV2Zqupg
X-Received: by 2002:a05:620a:40c4:b0:7c5:9665:38d3 with SMTP id af79cd13be357-7c5ba1ef1d2mr3404333085a.46.1742997571966;
        Wed, 26 Mar 2025 06:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742997571; cv=none;
        d=google.com; s=arc-20240605;
        b=dFVHsX/YbTxr5vryl8aFgk8vZm0QeItegicB8RiipuUgTkQhQW/ifgx63PwbFR352W
         2mDFwfB7N2fmSd7qU8wTwqvNQvm0/E5l1Iiz8u4IUzNEsPlFVfw8ccCTTnRnvzB8Z6UW
         rACYPnI1cHwBIoAKbBXKQNziA41g+u2Dk/2jTO04U0DHJN9QvJdjAYHTu4vGsFmkfGxs
         1wQ149G7ogDr2M+vxSSNSIJD56QgGFkJKqYpCJM4K1dbc73YwcUw2w1l/k9G//IqgNuN
         MMvNcuOAa9vA/OBgwrNEWgytymAthdrXiOt4CfdyXVrhVQI2m/t+sAo2NXJdJLehjr5O
         1SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ikhE//JWK4Sdjg+6D/ARN9Oi1G3pFUwXzqX4b0H32PQ=;
        fh=LpAk4Z9OfJwq9D8XGuUHAKgmc9zyBy5+WbhPYM73FrQ=;
        b=jyzRMBettNdxgxg+2aGETrGcs7xTrGR3uX1mXzX0hTcr/B1+D+fordluxXU+zOL0eK
         knpWqHsOnMBGCQiTrs64iCB/P9wTymSXUK/wRsuV5P23f1GfVk/U+bBOfWxq/GXxBFAa
         BY2Oh8FaunClsuzFGNI0aiQZpS2LAXaJdu1EhDiV1uhLt2qxyP97CtcYATIrx2UTT4ZB
         mINB6Q4cDKiIdeEK51qSoyM4FjlYmI90/1ZGpR68Jjx9RqV+hOQrAj0D8pZIwQh+Zb4M
         g2w9Bm2nDHNSqckmQuuHCvV1Vxzs2CIRQXc98YqUHmQNiTkB1bbv8Sf+qilRFBLIVoUV
         k0Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QIQMPMSz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b92ce8f9si1180906985a.193.2025.03.26.06.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 06:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QIQMPMSz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txRHv-00071o-CH; Wed, 26 Mar 2025 09:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txRHt-00071B-JG
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 09:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txRHr-00036h-Qb
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 09:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742997558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikhE//JWK4Sdjg+6D/ARN9Oi1G3pFUwXzqX4b0H32PQ=;
 b=QIQMPMSzj+v2ExBKZpE104pLHeCllCW1Kgl/L3DF/W+YUSqwDkCXbUZtwx6rdRj8J6Sbml
 uNcKPP8D+C09KFL685mCz8NvSIxMTrykEk52fyQfEHm8PI1J0vf7mwPcIAE1rZuN5dg3sS
 k5VwawP4vG0ARglRncqMrVwrREnCzik=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-uHod6tUMNUO3mCWZ4P92Hg-1; Wed, 26 Mar 2025 09:59:16 -0400
X-MC-Unique: uHod6tUMNUO3mCWZ4P92Hg-1
X-Mimecast-MFC-AGG-ID: uHod6tUMNUO3mCWZ4P92Hg_1742997555
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d3b211d0eso4973885e9.1
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 06:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742997555; x=1743602355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ikhE//JWK4Sdjg+6D/ARN9Oi1G3pFUwXzqX4b0H32PQ=;
 b=AFHR2JSgre9+o6jhJLxmhwYSDz8Id2XTdyVwS6zfyyZUM3Lf7R0QfGT4j+qPPyLawp
 mWKtnNiKU0YZTq36mFguHcA2W0FyFlxbJ2t612780iq7S8YrInQIHaYwxGdzsJ+jzxov
 VwpeFZSbzKVwW12x8SSWTemL5F4pRz9kuONLLHxZ8WEaDs4Gc/myf3Y6uCf6UyLpg6kW
 dFAwcg/x2CaebTshZM7ZCaUZ5VlKfU/IazoTvVNEVXQ36xS4SrypYj+0ffSvZBJpu2B0
 l6hZmq+6UvE1DxT/SKk977aFSF4keqSVZ70xi4v0x0ZvVgFno9GaN4IpABR/OCiABzHf
 g49w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN+Ho5VWA8fW0E+Bb71fBmMLRF8ShjdZLz6G9EGaUR9BWpzLtydIlWzj/ZvlkztM+DcxzpdBVeLQ==@nongnu.org
X-Gm-Message-State: AOJu0YxISzZ5BvnE12kAsypbQuSKDHnLrHmnEaL3QCxcdn6psvBcX0hU
 JsEFAOEumYhdck/AkPQ3eXvegerL8UFhKrRYX3C0CCNKIsR7+zyBXDOdRh/H+ssaouqFyk25If2
 z1Zp8O8XkQfmg8NFwanNF7bxy9foxfv6Wuqa2KhJc4SBxds6mtw==
X-Gm-Gg: ASbGncsaoi0eRKtjWAqGdUOwp+zs6raf2/4mVZhq14b39TbMleEJ44JHRGqPpqY9VpM
 YWMsyoLof//bY1P5yiLPwsRzVy8++bJzxQ8DZ6kTWjaEg0Rr/PW6aTfVrEDyDKt/u4lFDkBkwTo
 icmv3RaZ2QQPJNtj+hH9aLi9MozpiB/2++e2n83pesmmz8/yZu02rOODOcFPDqw3dDwhNxobYEY
 8rRBAyxGmQQMYIYduw/XtuOokbS6vecpZpQqk6M9rUTPm6+t7Q42oOisEPC2UGvzrfnSDqM56TH
 gbZ9q6Z2jmGeU1dec0ScQHot6aD5zQxShljIlmYLMo3TZe3mF4d/VkLmH+k1u5A=
X-Received: by 2002:a05:6000:1a88:b0:39a:c86d:e094 with SMTP id
 ffacd0b85a97d-39acc46dd0bmr3313250f8f.17.1742997555087; 
 Wed, 26 Mar 2025 06:59:15 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:39a:c86d:e094 with SMTP id
 ffacd0b85a97d-39acc46dd0bmr3313218f8f.17.1742997554593; 
 Wed, 26 Mar 2025 06:59:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b2654sm16699286f8f.41.2025.03.26.06.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:59:13 -0700 (PDT)
Message-ID: <092113d0-9cd8-4384-b65a-46922239c794@redhat.com>
Date: Wed, 26 Mar 2025 14:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hKP56rMtsUo8dLWU-nLplf3HSj5K6-b2r-gASoK_szE_1742997555
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
X-TUID: 0TeVZ481SGow



On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Inroduce an SMMUCommandBatch and some helpers to batch and issue the
> commands.  Currently separate out TLBI commands and device cache commands
> to avoid some errata on certain versions of SMMUs. Later it should check
> IIDR register to detect if underlying SMMU hw has such an erratum.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c    | 69 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-internal.h | 29 +++++++++++++++++
>  2 files changed, 98 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 76134d106a..09be838d22 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -160,6 +160,75 @@ void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>                                            nested_data.ste[0]);
>  }
>  
> +/* Update batch->ncmds to the number of execute cmds */
> +int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch)
> +{
> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(bs);
> +    uint32_t total = batch->ncmds;
> +    IOMMUFDViommu *viommu_core;
> +    int ret;
> +
> +    if (!bs->accel) {
> +        return 0;
> +    }
> +
> +    if (!s_accel->viommu) {
> +        return 0;
> +    }
> +    viommu_core = &s_accel->viommu->core;
> +    ret = iommufd_backend_invalidate_cache(viommu_core->iommufd,
> +                                           viommu_core->viommu_id,
> +                                           IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3,
> +                                           sizeof(Cmd), &batch->ncmds,
> +                                           batch->cmds);
> +    if (total != batch->ncmds) {
> +        error_report("%s failed: ret=%d, total=%d, done=%d",
> +                      __func__, ret, total, batch->ncmds);
> +        return ret;
> +    }
> +
> +    batch->ncmds = 0;
> +    batch->dev_cache = false;
> +    return ret;
> +}
> +
> +int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
I think you shall document that sdev can be NULL and also when this
helper shall be called with sdev != NULL

Thanks

Eric
> +                            SMMUCommandBatch *batch, Cmd *cmd,
> +                            uint32_t *cons, bool dev_cache)
> +{
> +    int ret;
> +
> +    if (!bs->accel) {
> +        return 0;
> +    }
> +
> +    if (sdev) {
> +        SMMUv3AccelDevice *accel_dev;
> +        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
> +        if (!accel_dev->s1_hwpt) {
> +            return 0;
> +        }
> +    }
> +
> +    /*
> +     * Currently separate out dev_cache and hwpt for safety, which might
> +     * not be necessary if underlying HW SMMU does not have the errata.
> +     *
> +     * TODO check IIDR register values read from hw_info.
> +     */
> +    if (batch->ncmds && (dev_cache != batch->dev_cache)) {
> +        ret = smmuv3_accel_issue_cmd_batch(bs, batch);
> +        if (ret) {
> +            *cons = batch->cons[batch->ncmds];
> +            return ret;
> +        }
> +    }
> +    batch->dev_cache = dev_cache;
> +    batch->cmds[batch->ncmds] = *cmd;
> +    batch->cons[batch->ncmds++] = *cons;
> +    return 0;
> +}
> +
>  static bool
>  smmuv3_accel_dev_attach_viommu(SMMUv3AccelDevice *accel_dev,
>                                 HostIOMMUDeviceIOMMUFD *idev, Error **errp)
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 46c8bcae14..4602ae6728 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -549,13 +549,42 @@ typedef struct CD {
>      uint32_t word[16];
>  } CD;
>  
> +/**
> + * SMMUCommandBatch - batch of invalidation commands for smmuv3-accel
> + * @cmds: Pointer to list of commands
> + * @cons: Pointer to list of CONS corresponding to the commands
> + * @ncmds: Total ncmds in the batch
> + * @dev_cache: Issue to a device cache
> + */
> +typedef struct SMMUCommandBatch {
> +    Cmd *cmds;
> +    uint32_t *cons;
> +    uint32_t ncmds;
> +    bool dev_cache;
> +} SMMUCommandBatch;
> +
>  int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>                    SMMUEventInfo *event);
>  void smmuv3_flush_config(SMMUDevice *sdev);
>  
>  #if defined(CONFIG_ARM_SMMUV3_ACCEL) && defined(CONFIG_IOMMUFD)
> +int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch);
> +int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
> +                            SMMUCommandBatch *batch, Cmd *cmd,
> +                            uint32_t *cons, bool dev_cache);
>  void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid);
>  #else
> +static inline int smmuv3_accel_issue_cmd_batch(SMMUState *bs,
> +                                               SMMUCommandBatch *batch)
> +{
> +    return 0;
> +}
> +static inline int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
> +                                          SMMUCommandBatch *batch, Cmd *cmd,
> +                                          uint32_t *cons, bool dev_cache)
> +{
> +    return 0;
> +}
>  static inline void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>  {
>  }

