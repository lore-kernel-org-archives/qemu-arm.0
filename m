Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C452FEFCD74
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzXtz-0005xt-Bz; Mon, 09 Mar 2026 06:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzXtj-0005vS-9k
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 06:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzXte-0006T1-NI
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 06:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773052292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsfuLPjL7R2VeAaDZOW9eIiFoe68uuih/4a9T+dUmlQ=;
 b=O8WuZ3MqmVX7Pq/F4fZZok2x24r57aFT+eWfLTTK6qykLUpRRfMNHOX7hKqtCit6qio3V0
 E4Z+WS6JyB2SISTm6joCvQ8cBvS0iBzMRz3j3l9MDXmnRFB7J/WcHm5Gwx5bmSpF3ojvcm
 zAuqmRvv3gyI0vMwAX2ks9Rl3Gk8sj0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-F2AeTKC7OZuRD_aXH-oMQQ-1; Mon, 09 Mar 2026 06:31:31 -0400
X-MC-Unique: F2AeTKC7OZuRD_aXH-oMQQ-1
X-Mimecast-MFC-AGG-ID: F2AeTKC7OZuRD_aXH-oMQQ_1773052291
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4852fbfc379so19314755e9.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 03:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773052290; x=1773657090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fsfuLPjL7R2VeAaDZOW9eIiFoe68uuih/4a9T+dUmlQ=;
 b=p3KPjI9BF8Q1dFZ+UGnozBoyXphoyuLOJQlFE83gJuL5CCBzdmmfVrbQVan4Z/C0Kd
 Sf0RpznwDoAzb2xKU69lxAOROutRGe6vbgdT19/rTdAbxFzN1NLeCsuFMn6hvgF+oeig
 qv6jo2MiZVD1UEAJORI0yyhXBeVAAS7t/ZJH9zq6k9lEPBY2ESEG5PI/aWHQ9158advf
 WUAFpgbifawX7C3j/Ln7VyZLBDYsTJ+Os/J9R5vhK1td1Hx3SO7ubc5z+atUkLqDfhlM
 w5evp6D9P50nQ62JpOQpKnu7UVgs51XmqSn0c05DpIE/0I5u6BQUCov8GH5iKTXsUgZA
 bIdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRXcsX5zMDAOyHJtlvpar5NJJJxI4c8WITepQ2XX50GE248nC86ZUG7wJJjg2lfBzXMd959pImDQ==@nongnu.org
X-Gm-Message-State: AOJu0YzvJdCPIIjsfydaDjjz21aqGaxqR3SQnhtmaEEAeCJhOcxc2voi
 r/R4THLkCE5sFSY+u/i20tqF28V+TEupKf5qeI7wAO+DA/XaBMKmZNWsk+XLnW51kEL2Fa9BIrT
 VODarpIBcu5Er5HeMick6dEIBuWzdTuXm8xAf9NeSP3SB816b//giQA==
X-Gm-Gg: ATEYQzzi0/mvn2k5c5Ryi22qBWDj0LQEV66xnNB1G8OBOPdmlFP6fV21Z4yLEp+h4Si
 uFdRzJ27QqpyXND3IRBnRcIEUCjAAZeyVlqI7B0+/DH7VdO6TG9Y++HN98s3mWXbTpBjLTx6ifY
 kGRMHPdVZWzjIhO8XyjO65Lep4O2ycjX0IyHRZgU27OVRBngvDpjuots9Sj7YJLypSACiv3q+/+
 oYZFj7wzwBW9HwpaTPWWlqbS0lCtiCwaPp7eIUxAr4d8YgYMLPIQHMdo+833P3F1ewkdk8wdB0/
 m/3WLAEYEFALg7lzfZs+l8abAvANoBpFjSaJKHk+i10DGqnSuiNS6230kvcRWYqwQdeZrWUQZTy
 vpwckUS5e3imjpTNd611ozL0ADKwuddwrq3/8FLpyN9tYI0MZpKov28tYTRLvQcmEtx73iA==
X-Received: by 2002:a05:600c:3b8e:b0:485:35a4:939c with SMTP id
 5b1f17b1804b1-48535a4a188mr84759215e9.29.1773052290405; 
 Mon, 09 Mar 2026 03:31:30 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8e:b0:485:35a4:939c with SMTP id
 5b1f17b1804b1-48535a4a188mr84758615e9.29.1773052289961; 
 Mon, 09 Mar 2026 03:31:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852470a654sm83147495e9.29.2026.03.09.03.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 03:31:29 -0700 (PDT)
Message-ID: <b3627b0d-5e21-46de-adba-1c9ec84fb602@redhat.com>
Date: Mon, 9 Mar 2026 11:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/32] hw/arm/tegra241-cmdqv: Probe host Tegra241 CMDQV
 support
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-11-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-11-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SGOw_cYzMJZpx4S992taFQkSYqkexHC-zZcnEW3pcpk_1773052291
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> Use IOMMU_GET_HW_INFO to check whether the host supports Tegra241 CMDQV.
>
> Validate the returned data type, version, number of vCMDQs and SIDs per
> VM. Fail the probe if the host does not meet the expected requirements.

Can you explain why it is important to check 

number of vCMDQs and SIDs per VM? 

>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  5 +++++
>  hw/arm/tegra241-cmdqv.c | 32 ++++++++++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 07e10e86ee..312064a081 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -10,6 +10,11 @@
>  #ifndef HW_ARM_TEGRA241_CMDQV_H
>  #define HW_ARM_TEGRA241_CMDQV_H
>  
> +#define TEGRA241_CMDQV_VERSION             1
> +#define TEGRA241_CMDQV_NUM_CMDQ_LOG2       1
> +#define TEGRA241_CMDQV_MAX_CMDQ            (1U << TEGRA241_CMDQV_NUM_CMDQ_LOG2)
> +#define TEGRA241_CMDQV_NUM_SID_PER_VM_LOG2 4
> +
>  const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
>  
>  #endif /* HW_ARM_TEGRA241_CMDQV_H */
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index ad5a0d4611..a270fa7ce4 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -38,8 +38,36 @@ static bool tegra241_cmdqv_init(SMMUv3State *s, Error **errp)
>  static bool tegra241_cmdqv_probe(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                                   Error **errp)
>  {
> -    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> -    return false;
> +    uint32_t data_type = IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV;
> +    struct iommu_hw_info_tegra241_cmdqv cmdqv_info;
> +    uint64_t caps;
> +
> +    if (!iommufd_backend_get_device_info(idev->iommufd, idev->devid, &data_type,
> +                                         &cmdqv_info, sizeof(cmdqv_info), &caps,
> +                                         NULL, errp)) {
> +        return false;
> +    }
> +    if (data_type != IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV) {
> +        error_setg(errp, "Host CMDQV: unexpected data type %u (expected %u)",
> +                   data_type, IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV);
> +        return false;
> +    }
> +    if (cmdqv_info.version != TEGRA241_CMDQV_VERSION) {
> +        error_setg(errp, "Host CMDQV: unsupported version %u (expected %u)",
> +                   cmdqv_info.version, TEGRA241_CMDQV_VERSION);
> +        return false;
> +    }
> +    if (cmdqv_info.log2vcmdqs < TEGRA241_CMDQV_NUM_CMDQ_LOG2) {
> +        error_setg(errp, "Host CMDQV: insufficient vCMDQs log2=%u (need >= %u)",
> +                   cmdqv_info.log2vcmdqs, TEGRA241_CMDQV_NUM_CMDQ_LOG2);
> +        return false;
> +    }
> +    if (cmdqv_info.log2vsids < TEGRA241_CMDQV_NUM_SID_PER_VM_LOG2) {
> +        error_setg(errp, "Host CMDQV: insufficient SIDs log2=%u (need >= %u)",
> +                   cmdqv_info.log2vsids, TEGRA241_CMDQV_NUM_SID_PER_VM_LOG2);
> +        return false;
> +    }
> +    return true;
>  }
>  
>  static const SMMUv3AccelCmdqvOps tegra241_cmdqv_ops = {
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric


