Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277FAEE368C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 14:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqY6T-0001T4-GJ; Thu, 12 Feb 2026 09:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqY6M-0001PI-5i
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:55:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqY6K-00014G-Ka
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770908127;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ruwqeror+Sw96vUtLNAXeFD41KFyFfjG6+3eKywQLB0=;
 b=JpT3V3Jnz9+W8DPOhaZtNzGtRaTYh6iACIJJAaGXVeepJuOHBVxE0xVMO7FwbHehvgtQKj
 GHtDwWe0Dw9LG+k+ae7BkTDiVfLEGhG4/0sjm0s+Gd8enn0ReLYuASVJsN4huCFvWR7ZOA
 tEw1P1JK/C0aDooMGPvxaUQ2uDmFH6I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-kZ2TmHWdO1msdKum7TNjiw-1; Thu, 12 Feb 2026 09:55:24 -0500
X-MC-Unique: kZ2TmHWdO1msdKum7TNjiw-1
X-Mimecast-MFC-AGG-ID: kZ2TmHWdO1msdKum7TNjiw_1770908123
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so57286305e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 06:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770908123; x=1771512923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ruwqeror+Sw96vUtLNAXeFD41KFyFfjG6+3eKywQLB0=;
 b=PRU2RItAU7lExH/iEXff4/sOvmn9tXSrk/kEPgKf1mSWi0ePvUW0X41cYJkXl5dW3F
 KkfFsnOXEe+ZFZZD8SuDvjkcJBu1TgkVXwt30LvB5acHW4OATpIrBVvm+LYqMGclvvwP
 cc6vFA5HcSnAX2myU0qMRkpFkqj8GnKL1teOsslGYupO73D0Yctyhk6alZ8OeMiOm0ZZ
 1WuDLSbNeYN/NE//TyBHt1iPvnVGe7ROFUW204OWWlTptA76rg4o2ltw+gh33asjmg94
 WLyZgFIVAJzWzpkm6ve/04BLJxT+3pgoit0IDh2+RFlE9tme1IrrQh924Ef5LkL28ZY3
 G8Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrEoZcp3IgqbkcP+CnEKxYyO2yWBjpPkIxx9i6uZjF8pgirMo7BYHySpmF6/w/IYowkfIKe+ThYw==@nongnu.org
X-Gm-Message-State: AOJu0Yz6hc9pLU5sDqGI2o/HEMz91BHrrH9qU39j9bkyEpPBkH7pravU
 rF31AL5TqLkppIpWxzlTkS9i7H3aHqv8sKhXb9n8ZtkBO77Co16bG9nY2jNxfvf4tkyhBtVvE+M
 wAI2cQi5Ust0Wl2ovKKYlJWwOvnXTRdkQsIvcDj5hZmAOjBRgUYPICw==
X-Gm-Gg: AZuq6aLFUUhfz9rLvUJiwc3cDjPEa0AtSzbZ6HZNPAp9PrxGVs74rpAa31pmL7QEIij
 7DpBY5uZsppt8sx+MSBV5Cq+K5dhBke4v4Z3JdY8jpKRRRd8M9jI1qTtEOm8EH9thwoqtHLLATP
 mnwu8Ra+7pHY+keBrdY+Qysb7UjCGQTOgo8FifXBwHTv8lZkjMUnFPSFcgHXGJXkobFN7zblz/n
 hH+c1YWvk8YFA2w10buqcqGyK3GK4MCe1SXNx+k1wAFW+J+Sd5s5UvcdzSZ2fSGrbUKJpZ/mHNw
 I5Zod50A/J6jTTbboTjRmqwXN+ptLDECbdCjeVqd4n+7DRPaejmL6zblNxoRn+JqQVXTndyxQJn
 VVLATPoECg7KwD7gVXyUK9ABdp0zyE/VhJ3awzvR3xAnTlCg/1wxOyiRP2DV18ABzSU5Ukg==
X-Received: by 2002:a05:600c:458c:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-483656c60b8mr38185355e9.11.1770908123166; 
 Thu, 12 Feb 2026 06:55:23 -0800 (PST)
X-Received: by 2002:a05:600c:458c:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-483656c60b8mr38184755e9.11.1770908122637; 
 Thu, 12 Feb 2026 06:55:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835a5bf1efsm94069085e9.0.2026.02.12.06.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:55:22 -0800 (PST)
Message-ID: <f8a3488a-0c9b-4b0e-99bd-ba9f4cac416f@redhat.com>
Date: Thu, 12 Feb 2026 15:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-6-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-6-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NJdh4bjrc9et4atToE9o3YrsPyFZ_oro4DaAqbg_490_1770908123
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> CMDQ-Virtualization (CMDQV) is a hardware extension to SMMUv3 that enables
> virtualization of multiple command queues (VCMDQs).
>
> CMDQV support is a specialization of the IOMMUFD backed accelerated
> SMMUv3 path. Introduce an ops interface to factor CMDQV specific
> initialization and CMDQV vIOMMU/vEVENTQ allocation behavior out of
> the base implementation. The ops pointer and associated state are
> stored in the accelerated SMMUv3 state.
>
> No functional change
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index c9c10e55c3..ca087240e5 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -16,6 +16,23 @@
>  #endif
>  #include CONFIG_DEVICES
>  
> +/*
> + * CMDQ-Virtualization (CMDQV) hardware support, extends the SMMUv3 to
> + * support multiple VCMDQs with virtualization capabilities.
> + * CMDQV specific behavior is factored behind this ops interface.
> + */
> +typedef struct SMMUv3AccelCmdqvOps {
> +    bool (*init)(SMMUv3State *s, Error **errp);
> +    bool (*alloc_viommu)(SMMUv3State *s,
> +                         HostIOMMUDeviceIOMMUFD *idev,
> +                         uint32_t *out_viommu_id,
> +                         Error **errp);
> +    void (*free_viommu)(SMMUv3State *s);
> +    bool (*alloc_veventq)(SMMUv3State *s,  Error **errp);
> +    void (*free_veventq)(SMMUv3State *s);
> +    void (*reset)(SMMUv3State *s);
> +} SMMUv3AccelCmdqvOps;
> +
>  /*
>   * Represents an accelerated SMMU instance backed by an iommufd vIOMMU object.
>   * Holds bypass and abort proxy HWPT IDs used for device attachment.
> @@ -28,6 +45,8 @@ typedef struct SMMUv3AccelState {
>      uint32_t bypass_hwpt_id;
>      uint32_t abort_hwpt_id;
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops;
in my original thought this was not AccelCmdqOps but AccelOps. This
should be squashed with the patch that turns existing accel impl into
those ops implementation.
> +    void *cmdqv;
Sorry I misread the purpose of that field. This aims at storing cmdqv
data. But until this is actually used, I think it is useless to
introduce it.

Eric
>  } SMMUv3AccelState;
>  
>  typedef struct SMMUS1Hwpt {


