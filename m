Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD990D29C28
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 13:59:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhpmw-0001hz-Jf; Mon, 19 Jan 2026 08:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vhpmo-0001Wf-GX
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 08:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vhpmm-00051K-OL
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 08:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768831150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yw0RG/NghKbwEG67RRRsVMs/xtwoknsN3+p1LWHz6kQ=;
 b=TgeabY7Hn3IBUNx3q2QMaKKpFMBUI6GgVsTFi4M6f1+ZkRMInawIAIpGezgL29ySRJAHvA
 iV5+Rt+cPEGlcBLOkUzZRzUlhQddaIu/1yhtToamqS2H37+X5X2SnIsqyCwaqKa60HUk2Z
 822ZBTnt7olt2gOJGeiR/PKmPsaul1Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-icRjTRNuNoazf1e5dOUeBA-1; Mon, 19 Jan 2026 08:59:09 -0500
X-MC-Unique: icRjTRNuNoazf1e5dOUeBA-1
X-Mimecast-MFC-AGG-ID: icRjTRNuNoazf1e5dOUeBA_1768831148
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4325cc15176so3016928f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 05:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768831148; x=1769435948;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yw0RG/NghKbwEG67RRRsVMs/xtwoknsN3+p1LWHz6kQ=;
 b=qbpOL9MFEUwxVUBroFMP2yNuuGVWFnIOhP7glN+XK3qgS063kQ9jkBqUagXRBUA709
 3elOMqORwwMu8rQHHhk3ZOzdP8SvOpDkHKInLMvkJyvfdLP/c2QR8imoDp9A7LDnhJWJ
 BlUAhbQOdLjsO7N3FZ2rY9LkOdCihbpBiYWc7TfVPJ2TqUarjF2zOo1rzAQsZMBgwtR1
 oZt5yQL+L4AXKWbK5Zm67fl+O1+/N4gIZyBkEVIrevHfAmTr6qybkRTSaCQpvOVALhmV
 bdymyVUJ5uSjL3zPhcFCxS2U9qdS1tAZMu0RpZf6RbmmA8+m1pxqJfzNsLa/GSkyB50o
 ySCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8pJhEc7apH7zaEDNRe6ll2eJlzTqY5OJ3lPFq/IvWYGYGjPRtCnUCRGhaUZ2nArlSUKdo1U4X+A==@nongnu.org
X-Gm-Message-State: AOJu0YwFlLlFHCO5fi7nsib7IFen3HKopqqL48jP+LgFpiyYZNFnvSkP
 ZhsRQbzBjzYadOMEDSd2wnw+gWA3P7+uMx/5kcC3ct5xLoQ86lJJfOofpPTUJQnvR62dwyQY2Kl
 DosxT9kemuXEc8OqX2OQDL5QUdWr1bZgg4Vi+Z5Mz9egpmOBZ/V9OVQ==
X-Gm-Gg: AZuq6aKTrzBgL2GpVUJpdCP2y5bqnrhyi46xkvlLwLS8lXbhIMAHqftVjqYZ0wXNeel
 X0TRC0vFwENLGB0Q2WMmlNPljqByyinz/DI6/xZbmZOjEptHr0g6XxS7QK6mixiP1AHhdRghNGR
 tLY7S3CpuMPr3cAbkFFU5ZJL1II/7YO9RzXfUBP0hNSF8kbPgSsW6cf7O+gUaV+vcCogVxvQFSD
 QXs7ZfBXr8dptygxoud/QxYz+Aobg3ZMzhbRD4uUTI0Ahv4nx/wxj/KyTP9Dpx1LMGm74GnxvAS
 cRIxz2wUbo6inyepwDsrNfA1gEPrm0DhQrw7S3M5qbU7nI4I/49VsSiq3lD3XZikpuiPIHg13xa
 /s+19UacQlv1j/3RgoYKp5WW7KmoPNfMLpYkoH4E3QQXrVys++OPd2SnCSg==
X-Received: by 2002:a05:6000:4387:b0:431:9f1:e4c8 with SMTP id
 ffacd0b85a97d-4356998ad34mr13226328f8f.17.1768831147940; 
 Mon, 19 Jan 2026 05:59:07 -0800 (PST)
X-Received: by 2002:a05:6000:4387:b0:431:9f1:e4c8 with SMTP id
 ffacd0b85a97d-4356998ad34mr13226294f8f.17.1768831147446; 
 Mon, 19 Jan 2026 05:59:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356999824csm23185633f8f.39.2026.01.19.05.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 05:59:06 -0800 (PST)
Message-ID: <0bb600f2-f47c-4b2d-832a-f19ed4f3fe7b@redhat.com>
Date: Mon, 19 Jan 2026 14:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/36] hw/arm/smmuv3-accel: Implement
 get_msi_direct_gpa callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, clg@redhat.com, alex@shazbot.org,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20260111195508.106943-1-skolothumtho@nvidia.com>
 <20260111195508.106943-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260111195508.106943-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b4uQg7vapiB4uWzStooMAvkEm1jWWmYk4JxU5Q_jMMw_1768831148
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.016,
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



On 1/11/26 8:53 PM, Shameer Kolothum wrote:
> Accelerated SMMUv3 instances rely on the physical SMMUv3 for nested
> translation (guest Stage-1, host Stage-2). In this mode, the guest Stage-1
> tables are programmed directly into hardware, and QEMU must not attempt to
> walk them for translation, as doing so is not reliably safe. For vfio-pci
> endpoints behind such a vSMMU, the only translation QEMU needs to perform
> is for the MSI doorbell used during KVM MSI setup.
>
> Implement the callback so that kvm_arch_fixup_msi_route() can retrieve the
> MSI doorbell GPA directly, instead of attempting a software walk of the
> guest translation tables.
>
> Also introduce an SMMUv3 device property to carry the MSI doorbell GPA.
> This property will be set by the virt machine in a subsequent patch.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.c   | 10 ++++++++++
>  hw/arm/smmuv3.c         |  2 ++
>  include/hw/arm/smmuv3.h |  1 +
>  3 files changed, 13 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index c125974d12..c6ee123cdf 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -393,6 +393,15 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      }
>  }
>  
> +static uint64_t smmuv3_accel_get_msi_gpa(PCIBus *bus, void *opaque, int devfn)
> +{
> +    SMMUState *bs = opaque;
> +    SMMUv3State *s = ARM_SMMUV3(bs);
> +
> +    g_assert(s->msi_gpa);
> +    return s->msi_gpa;
> +}
> +
>  /*
>   * Only allow PCIe bridges, pxb-pcie roots, and GPEX roots so vfio-pci
>   * endpoints can sit downstream. Accelerated SMMUv3 requires a vfio-pci
> @@ -497,6 +506,7 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_viommu_flags = smmuv3_accel_get_viommu_flags,
>      .set_iommu_device = smmuv3_accel_set_iommu_device,
>      .unset_iommu_device = smmuv3_accel_unset_iommu_device,
> +    .get_msi_direct_gpa = smmuv3_accel_get_msi_gpa,
>  };
>  
>  /* Based on SMUUv3 GPBA.ABORT configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7a32afd800..6ed9914b1e 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1998,6 +1998,8 @@ static const Property smmuv3_properties[] = {
>       * Defaults to stage 1
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    /* GPA of MSI doorbell, for SMMUv3 accel use. */
> +    DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index e54ece2d38..5616a8a2be 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -67,6 +67,7 @@ struct SMMUv3State {
>      /* SMMU has HW accelerator support for nested S1 + s2 */
>      bool accel;
>      struct SMMUv3AccelState *s_accel;
> +    uint64_t msi_gpa;
>  };
>  
>  typedef enum {


