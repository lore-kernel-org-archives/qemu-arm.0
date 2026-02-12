Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF199EE368C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 14:53:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqXwD-0007tp-1R; Thu, 12 Feb 2026 09:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXvv-0007MH-6f
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXvr-0006MW-Am
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770907478;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54SHBBPNFsC0ZFulw8wmW3134g9+RXDqPlgB8aDRbaw=;
 b=YnKV7ozVPHY+29nHq6pnd1qfJy1padhwwH64L4Nkut6vqwnF7sm+rHGBMd0P/butNW8Xgr
 Zgm/y6XWI6B0AzcW54MB34gDNFDw4Nkv693wCV9JJHLLsgTfRyHtT1aUyBq+m9lrVrbvag
 Zp7vH10KCpOSW18xqQvKOmwjMQ5X4CQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-dkVXsutQOJGs1hnR4YOu1w-1; Thu, 12 Feb 2026 09:44:37 -0500
X-MC-Unique: dkVXsutQOJGs1hnR4YOu1w-1
X-Mimecast-MFC-AGG-ID: dkVXsutQOJGs1hnR4YOu1w_1770907476
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-482ef3af991so11822395e9.0
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 06:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770907476; x=1771512276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54SHBBPNFsC0ZFulw8wmW3134g9+RXDqPlgB8aDRbaw=;
 b=HZGvL7YH1KEjZP1QdzEoCVJLTBAxmlUCQd6uRuWG1jnQw6G/V+GTrSPzcYYZkag7Cj
 DjZONp94W50NWp+L8SG26bIkCFrhOVFS2J/+BVxdHpLt9PLAIoQKT0LXq6k1RfgJE15Z
 aO8ONql3pAiupg0qPDVpT/H4ACEkaTkpAAYoH0VrsrJMrRuXsn6q0MSle/GQnyT+9+E+
 +E7qX5H4pTo+S6ygMIugNBOkzPwL3vWapHQakdrus7IcgMlGCU5N4p1D7Bp89bWCv6rU
 PcLhtaWJJd27aVJKEY/PvvbOMqiXmSLVMraPtElRQ7veu7tqY9phK1olpDgrwpkNfulc
 qYPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0TytRh4wZ6F1wteoJWEceB37rtD0VZK9a0MYAb5VMyp83klidq6QUMPuoCfaaExWOEeueFXiucg==@nongnu.org
X-Gm-Message-State: AOJu0Ywt4rEHpfGoBpQ53YVXhV8y7PB8us/+0duYDB5GLZd5na6JBmVc
 xVN4fNpw548Vq+H4iyGCtOEqE8fKfcdG5EgvcKfxigB7h1jSfQ0Fi8VsPll2jZ/iR8LB1vxwLll
 BTKLOzShZEiJnTBiFIN/dYs3dtIo4hYpCw6Dq2TTs9NOXSadUa1KThA==
X-Gm-Gg: AZuq6aLKCVeZqIHB4D5myDSF8DykgPPw5WDZL6Ny+LAdZ88b6jUa66aBNQ132rvrNB9
 Sm0KXoiIP7odwOHN1IgqQgtvKEkzjfyeYSbUL59Jg85RBOlRWm6lvePR0XnVbLfWfBaV0LhJVNI
 OB7G8P9V21q0qCdTPIGk8JgSevKrsysAs+WenMMBViFhW0o5avltqvEwdZbJdkDukvhjoi2LoXH
 QLRwTalEHsMp9d4fwfYCgpa5QMC6ECd8t6xNh/rmnc0pAjE+F4VPJjrEETcgDO+rCzvKUsvCsXh
 zPaWWu2C8ydPPDv8qZwq17S0kvnZoJU1jtiNGLZ+khC9AGvoXbbBuD18JW/a00mrRZD5p3Tq841
 1PLNJkyFD38P/eH+phvTFLkHBnKECOe8GViJfReaQsb9mCT+UFJxhoOVewge5/CzUd0MqXA==
X-Received: by 2002:a05:600c:8010:b0:483:14ec:5925 with SMTP id
 5b1f17b1804b1-48365febeaemr41532465e9.2.1770907476148; 
 Thu, 12 Feb 2026 06:44:36 -0800 (PST)
X-Received: by 2002:a05:600c:8010:b0:483:14ec:5925 with SMTP id
 5b1f17b1804b1-48365febeaemr41531675e9.2.1770907475634; 
 Thu, 12 Feb 2026 06:44:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835bc7b986sm42324555e9.17.2026.02.12.06.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:44:35 -0800 (PST)
Message-ID: <d33ee89b-0f75-4c6c-8331-b422840c85ba@redhat.com>
Date: Thu, 12 Feb 2026 15:44:33 +0100
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
X-Mimecast-MFC-PROC-ID: 7gX5-waYpj8L6UQa7BC2E9crp2LboPVp6VeFCc7UpMw_1770907476
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
> +    void *cmdqv;
effectively looks duplucate, check !cmdqv_ops ?

Eric
>  } SMMUv3AccelState;
>  
>  typedef struct SMMUS1Hwpt {


