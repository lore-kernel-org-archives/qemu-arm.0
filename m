Received: by 2002:a05:7022:4428:b0:9b:2b00:a62d with SMTP id ca40csp3463763dlb;
        Tue, 18 Mar 2025 18:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUa614T0HaW6I1Ij7JQ9/aCgRURoRPvRHlH+uQ8c+FpUmq/mnfUU/dx9rHvs5Ey72BhGtVA/tq3n60nbA==@linaro.org
X-Google-Smtp-Source: AGHT+IHGw+pDEtDfryWSkQw9rHpLd4rwx8BVUWTQejTRCBGRywtMxLRN/7+fhWv7vSgS3yrgYn6F
X-Received: by 2002:a05:620a:3710:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7c5a84a8edcmr96723885a.39.1742347925395;
        Tue, 18 Mar 2025 18:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742347925; cv=none;
        d=google.com; s=arc-20240605;
        b=OoSgycvMEeof/oGuIsgjCLZjKBg5ekt/Rw71sySwiuvc40ILOhhp+u58KoK901ryon
         HKu7nR/MZwBXYcpn4Fc1lx8u7/Wy38Hfwas+Nn+CbVYv0urZjlftTSvRrEil2KZdSlRb
         f62bjLnDnqxdF4W2hQbifS8eOhpsMXSDCUKy13DrVfOsZEVQJOeFN6znf8saej0OoFwI
         +BEI6du+d3gs4HfzF3KpK+DUpAxHeBqITrIha0toKfJlL6dAjJvC90jRQUNysP4cv1D3
         LRMIKGMaazTqxv+kYlK85unUtB9oCKTAhpwH0ybkJDswmCjquEY4eMallyAI3otjxRKn
         7bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vFNC5DCk5BvDTzKW4gazY23seiRM0V7bofGKfYEmvBc=;
        fh=/0Dz2qRWC8JIQcDLajYxH1d+gWRcT9mrYHrhqwthItA=;
        b=ZAuG+t0COkWNYRc5x3e1POH/MFl8LpU8EUNVRqELsxArH1pD4/6G5FCpyTIngN+3se
         EMmsDDpDEDB9NbCYhd+/htuNpYgUlpnpkoIzbZIgdpeoUF+opk+bbIrN700WU7+7WMJe
         CPrB1T9n8WK7gj0fJsR4mJiaT3FjDKv5NCWTUQ7u4vBf67fzFO6ouZj39WVdoTult7oU
         9m3ZCz5DEvJ6cGfQhZKTDF51ZKR9YlJj5D5tXfodkGU6kCSYXixvoj/GtPV0ZHhMTXMZ
         CFlRYlf1PKYk7KkVFujdgEu6jIU8cSVLzRPN032jIjnbNrDfjubx8QL3eYHegRf9KQ5k
         K0Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RCI3JQcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573b72f30si1312940285a.52.2025.03.18.18.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 18:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RCI3JQcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuiHf-0006lD-6e; Tue, 18 Mar 2025 21:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tuiHP-0006kI-8L
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 21:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tuiHJ-0006ts-Op
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 21:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742347886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFNC5DCk5BvDTzKW4gazY23seiRM0V7bofGKfYEmvBc=;
 b=RCI3JQcQEHa6Pc+zV1cSG5DWjl+M6nPl74ARl3zBvodWcUDXlu62oLbS5gJsC5+AkHq498
 V0d0BG9x8llOaUFxJTYX9QO8RE1Q984OceMS02QYVDp9TNTq50XfWbFok+at2kwMzMvFh3
 NpuEqbkIasRvthEgOwGp6AK1d7Rz5i4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-YXCRteoUOgqCVqcBCsYcVg-1; Tue, 18 Mar 2025 21:31:24 -0400
X-MC-Unique: YXCRteoUOgqCVqcBCsYcVg-1
X-Mimecast-MFC-AGG-ID: YXCRteoUOgqCVqcBCsYcVg_1742347884
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85dad58e80fso1373112339f.3
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 18:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742347884; x=1742952684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vFNC5DCk5BvDTzKW4gazY23seiRM0V7bofGKfYEmvBc=;
 b=GvElP8nDVFRafzk77LWuWOxkhKDo1gsDkKkf3yL9G699GY2EKCKKXx307H1JOZ7RW0
 3JXalBMdgWRKeqC5IQNREb4QsXFXZNBM/V6mdV1uMDiClEEJ3eLcK9EtXiAsiIiB1rJZ
 zhteZf7NY+fijMHVrx4xo/9W3L2XXU3vzSKxf0NXEFfhhDV56p1LLfzSsNwvG8bLP2qT
 8ZQdZMGUcg+tiRAfGhesOnrcdXE/N5vmVNBJ3Fs0VEuTZ7jsfDJF/YyZLlVnTapJdIdZ
 jZpYfq/AY99ElG5MvSPjTSGwXoyno2t39gB4QyI1ZaOn+U0SHaMxGZ1Kxqz5O/Sp7Y6m
 /oMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhw9Z8ynobUKOGr0GV3I6UDr0EAL0p7j93myc4XT/kMP2oIEJeBYqOnH0OQ1Hp4OdK2aRl5FYgfg==@nongnu.org
X-Gm-Message-State: AOJu0YzP1PnzwzGxrV6Ek5YzmQnpm7cSVhAcHri2sc3IEREdIvnqoCQi
 DFVPL7meO4O+BbFQ8yB+dILUY9mih3ShywCGg3pUZe5dAsFADvqh8UgF4Z57sn/hisdwRm/mS2O
 g2UW/iMAUrgYQU1xP/QmuZUE/MKBbVeoXMN2dAaoBsv2kgqSGfQ==
X-Gm-Gg: ASbGncteMfpJGShB9uW8yCs7bWZO1OA/A9ZodZ7QGeXJBnu0s2RK0wh54XykO5fCVL4
 nvFRX17qepYPSP4SUEsYgCEhyPtPyD+iaoLEwiXtDkan28qTqgLnuapY2/P89c0/oq2nLlARsvX
 UCvEQ97B4L/WEya67BJ01U8DK3xrx0jOsE0SQ7yhMJNtyFciJgdeSYsdDUX6hliybU0z1ty3FGT
 1db0kIIY4GQ2Q/3HMGd9OwMZX5339J6iip3oqtNPOCaC3snxQO/S7nNhGHqbE9CD3CW+WNrK6bm
 abLIN0V5yWNZlPl4
X-Received: by 2002:a05:6602:6a46:b0:85b:3b30:9aa6 with SMTP id
 ca18e2360f4ac-85e1377d824mr117538239f.2.1742347883962; 
 Tue, 18 Mar 2025 18:31:23 -0700 (PDT)
X-Received: by 2002:a05:6602:6a46:b0:85b:3b30:9aa6 with SMTP id
 ca18e2360f4ac-85e1377d824mr117535639f.2.1742347883615; 
 Tue, 18 Mar 2025 18:31:23 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f263701f6dsm2996059173.26.2025.03.18.18.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 18:31:23 -0700 (PDT)
Message-ID: <28452954-7be2-4114-8d37-a208250b6f83@redhat.com>
Date: Tue, 18 Mar 2025 21:31:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z30l0PiDlh7AJKo6VZbNsdqpM3qsx2qrPWC4voNN7GM_1742347884
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oUp0IQegxbLS

Shameer,

Hi,


On 3/11/25 10:10 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Inroduce an SMMUCommandBatch and some helpers to batch and issue the
   ^^^^^^^^ Introduce
> commands.  Currently separate out TLBI commands and device cache commands
> to avoid some errata on certain versions of SMMUs. Later it should check
> IIDR register to detect if underlying SMMU hw has such an erratum.
Where is all this info about 'certain versions of SMMUs' and
'check IIDR register' has something to do with 'underlying SMMU hw such an erratum',
-- which IIDR (& bits)? or are we talking about rsvd SMMU_IDR<> registers?


And can't these helpers be used for emulated smmuv3 as well as accelerated?

Thanks,
- Don
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/smmuv3-accel.c    | 69 ++++++++++++++++++++++++++++++++++++++++
>   hw/arm/smmuv3-internal.h | 29 +++++++++++++++++
>   2 files changed, 98 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 76134d106a..09be838d22 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -160,6 +160,75 @@ void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>                                             nested_data.ste[0]);
>   }
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
>   static bool
>   smmuv3_accel_dev_attach_viommu(SMMUv3AccelDevice *accel_dev,
>                                  HostIOMMUDeviceIOMMUFD *idev, Error **errp)
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 46c8bcae14..4602ae6728 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -549,13 +549,42 @@ typedef struct CD {
>       uint32_t word[16];
>   } CD;
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
>   int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>                     SMMUEventInfo *event);
>   void smmuv3_flush_config(SMMUDevice *sdev);
>   
>   #if defined(CONFIG_ARM_SMMUV3_ACCEL) && defined(CONFIG_IOMMUFD)
> +int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch);
> +int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
> +                            SMMUCommandBatch *batch, Cmd *cmd,
> +                            uint32_t *cons, bool dev_cache);
>   void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid);
>   #else
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
>   static inline void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>   {
>   }

