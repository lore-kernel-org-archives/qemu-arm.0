Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622ABCCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:22:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDO7H-0005pY-FS; Mon, 27 Oct 2025 10:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDO7F-0005p5-Nn
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:22:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDO77-0005Ai-Q8
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761574940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCn5fTk8j5o5UyvD80qrdTGvWogk90Z1sWaEUZxvpfM=;
 b=ENLoWYLRtv1vPmX3BOD5yOp5wYx9lxZVsp1nPpBUp8RtI1O9OXgYNKASrPv/fAccyFjSNG
 F9Rhd1qWbik2wx+S4YnD1y2hzMTOIbiSul/K2AqOctjDidbiyf7ufDbDbXAt0ye0VYLdMk
 uaXhLBYb1vKieFQlp8/ucKKneGlj8z8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-9EqP8-UeOCWY55VDFbfVOQ-1; Mon, 27 Oct 2025 10:22:18 -0400
X-MC-Unique: 9EqP8-UeOCWY55VDFbfVOQ-1
X-Mimecast-MFC-AGG-ID: 9EqP8-UeOCWY55VDFbfVOQ_1761574937
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4770e0910e4so10573905e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761574937; x=1762179737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kCn5fTk8j5o5UyvD80qrdTGvWogk90Z1sWaEUZxvpfM=;
 b=V71ehhYFUcLh7JkD6Vc41Fdwoc8LOWhSTYTqdgIfWikBXG/492PYFciJ1Cw0kWRRNu
 h253+tJ7O9WVy5CSAEyL/nLTOeY7BoXB+07fqM908CkMy6WoRxTtjt9eERVi9KjDm6RH
 QGh+v4+O3NOsBQcpqHGqTIccQ4fz3bNe/ua0P6dToxx9cbfg+aGaTUOiW66IpyK0Fz7X
 vLmBX2mHE3vQHFjXLoy1H5futS/R28ApFfBCrSEPnX8Gkowua96UHlIH3vX2x8UPr8ua
 6bWlIJDYT5Bv1GWxC8KltKWk1VXVvEn41GnZLXYM/dhkYrjaFlg7AlAnXHX3D8hmW6dw
 GjKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHMkoheAiPm+60ovBmgGKGUt23zOB6VTDTPz6MprFGoQnbquetHFqVFGd1O9rf8txnEYGEOfMekQ==@nongnu.org
X-Gm-Message-State: AOJu0YyxmcUQ2xPTZr+M+O6ozBp6vkn/CHrWsvM4fAi/haZu7NpygYfE
 3OBTC3Ckh+NsVeSzUfd/lMUX0dARu54wfiR1qI15rSnoZBt+IA1rIOwCeQ2Px847MyHaai77RPw
 oOHwa2fydDHCpB0sObu5781dkPBAxCceOevm4y7Etc2yE+rw93bDiNA==
X-Gm-Gg: ASbGnctPWOnXN8uDTNyAs5yMtNpN3rA0FPC0wKYvCreV+SNEu11WNt3nKUXeAEsN6I1
 FMwhEZTAhX3Hfl9hIx8VOu7lCmXulAVF7eSCT3XHcJoOVnGfOBU2x3QUyvPvhJxOKa5B4JBfCwA
 U0a6hzzHeVwGTkPYDrX2DcK+510D/NvOU7Kc3pHRxQ0B+Nt2d7j+C67VMPQ0IvkHKd+nYxiGStS
 oEN1vjLZ3JsHqyDq3CQSSpy7MiIhaHUigVJriSUm0ptjvnUrGVcMftDJBYkrpPjyNNtJEp3ibsL
 VpNyZECqqjYcUfgcE9fuFpbK/yca3rPZ9XodZgK7Rs6NUUAl5UTDbC6t2IGLuZIky9TGkLlCH98
 WAiZF2zLO4hv4FVSdAmhceKMGVoc2GuKmcER23rf6RTjy+A==
X-Received: by 2002:a05:600c:1554:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-475cb044e25mr135969395e9.28.1761574937418; 
 Mon, 27 Oct 2025 07:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9NR8N/kkzVkTzHwK9+gpJ85QYrb0POD8JDOYoVpBTaXTdRShQRJoF5z94p4FfHYH2GlrqKA==
X-Received: by 2002:a05:600c:1554:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-475cb044e25mr135969155e9.28.1761574936986; 
 Mon, 27 Oct 2025 07:22:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm135158165e9.0.2025.10.27.07.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:22:16 -0700 (PDT)
Message-ID: <34131356-6c93-4f52-8f2e-21339ea3c5a8@redhat.com>
Date: Mon, 27 Oct 2025 15:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/27] hw/arm/smmuv3-accel: Install S1 bypass hwpt on
 reset
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-20-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-20-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S2bGqGke0M2Y3B5N-i8gdXuVsikWiJ31ccV8bciNWd8_1761574937
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> When the guest reboots with devices in nested mode (S1 + S2), any QEMU/UEFI
> access to those devices can fail because S1 translation is not valid during
> the reboot. For example, a passthrough NVMe device may hold GRUB boot info
> that UEFI tries to read during the reboot.
>
> Set S1 to bypass mode during reset to avoid such failures.
>
> Reported-by: Matthew R. Ochs <mochs@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 29 +++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h |  4 ++++
>  hw/arm/smmuv3.c       |  1 +
>  3 files changed, 34 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index defeddbd8c..8396053a6c 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -634,6 +634,35 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_msi_address_space = smmuv3_accel_find_msi_as,
>  };
>  
> +/*
> + * If the guest reboots and devices are configured for S1+S2, Stage1 must
> + * be switched to bypass. Otherwise, QEMU/UEFI may fail when accessing a
> + * device, e.g. when UEFI retrieves boot partition information from an
> + * assigned vfio-pci NVMe device.
> + */
> +void smmuv3_accel_attach_bypass_hwpt(SMMUv3State *s)
> +{
> +    SMMUv3AccelDevice *accel_dev;
> +    SMMUViommu *viommu;
> +
> +    if (!s->accel || !s->s_accel->viommu) {
> +        return;
> +    }
> +
> +    viommu = s->s_accel->viommu;
> +    QLIST_FOREACH(accel_dev, &viommu->device_list, next) {
> +        if (!accel_dev->vdev) {
> +            continue;
> +        }
> +        if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
> +                                                   viommu->bypass_hwpt_id,
> +                                                   NULL)) {
I would prefer we pass a proper local_err, add the hint below and then
report the concatenated error.

Eric
> +            error_report("Failed to install bypass hwpt id %u for dev id %u",
> +                          viommu->bypass_hwpt_id, accel_dev->idev->devid);
> +        }
> +    }
> +}
> +
>  void smmuv3_accel_init(SMMUv3State *s)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 3bdba47616..75f858e34a 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -48,6 +48,7 @@ bool smmuv3_accel_install_nested_ste_range(SMMUv3State *s, SMMUSIDRange *range,
>                                             Error **errp);
>  bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>                                  Error **errp);
> +void smmuv3_accel_attach_bypass_hwpt(SMMUv3State *s);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *s)
>  {
> @@ -70,6 +71,9 @@ smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>  {
>      return true;
>  }
> +static inline void smmuv3_accel_attach_bypass_hwpt(SMMUv3State *s)
> +{
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 5830cf5a03..94b2bbc374 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1913,6 +1913,7 @@ static void smmu_reset_exit(Object *obj, ResetType type)
>      if (c->parent_phases.exit) {
>          c->parent_phases.exit(obj, type);
>      }
> +    smmuv3_accel_attach_bypass_hwpt(s);
>  }
>  
>  static void smmu_realize(DeviceState *d, Error **errp)


