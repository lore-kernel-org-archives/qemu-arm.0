Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1009436ejb;
        Mon, 5 Feb 2024 01:14:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRZ48wlEj6Lgz4kowzMS6rt5z2godPcApXpyKh2tz8kiOeKc00KitoHlCwQY4dkBhcQy7V
X-Received: by 2002:a05:6122:46a4:b0:4c0:292d:193d with SMTP id di36-20020a05612246a400b004c0292d193dmr1724932vkb.12.1707124482104;
        Mon, 05 Feb 2024 01:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707124482; cv=none;
        d=google.com; s=arc-20160816;
        b=FaIAoFpKRKxNerd1vYJh+0iGKIJJN9Y7XozXYJmRqzwbV5UCxwvI1tTDdIcwcu/oBq
         mII6B5crhJfYKLwmv0NiXmOfT3HTNtRvO0yBESc1IRcZMo9SNh5xJi3duUqtid6S23C1
         bcHylo8vqSF5mayIbkUC7bT5y9oxkvh2j8Fh3UHnn7Pct/5NfeQABTe9vA6uXxqAZj+N
         DTHy2fZrYtljqPfvX3w4rUBHc/aG2T/3KjkBn+NU/iVcM2vMcBN1nC946CsXYsRf8/CH
         S/N9HtVeDyCgwEbZWVLooKyzVmkC8yNBdHZKthrpM7khTP2dI0a1qb2lrAvOWYmLdxxX
         BBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DzNp7sWBNaERwY/1vkfXUPUo3G5xyIojHBmkAPU/Fto=;
        fh=kF11snTbKZyngJnSZflvrZJ3wtL12oSQlekX/bia6ZU=;
        b=HfWtMneSnxw+HSY2nBkOT5Visxd/7fEPEV9V6GeZGKyQnpSOGnpfvKAwEZLlg4O+h0
         Fe7MhG/R5RNHGgMZAgfl0+sGXbiHiX9H1tsPkq7eXfyLjcJF3Rr7ryBVY70ZxVSEDOZV
         JjtP/bJdKvzSCmwzIM21VRXuT7FbsALikB1bF7ZYUmWDz6xUIl2a1IkcPYJ+6QBkd0Rf
         OKGwWCPstHo3KcF7yjXeLqSqKhFle3bk9hdexxgdd/32NVxFFOeMmnTI1cYhVCt3bm+t
         VqjTl9KUlhDdx6Z4Aj1/zn0ue1HINEBXYBreb7R2Yrt65o3i3TbY7vNQxMU6eSW8hQq+
         4Miw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXWJbniP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCW2+E8eJktmuujMdliuuIvoQuwVuk42OAMxkEF4ttWm7aUlYX0G1e7vX07MQ0F+iHlJZcNuBxkIdYj8ETvokUfs465VN+qD
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23-20020a05620a12f700b00785767af0f3si3663261qkl.664.2024.02.05.01.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 01:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXWJbniP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWv3f-0002E9-4g; Mon, 05 Feb 2024 04:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rWv3e-0002Dz-6G
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 04:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rWv3c-0007FW-9R
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 04:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707124464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzNp7sWBNaERwY/1vkfXUPUo3G5xyIojHBmkAPU/Fto=;
 b=aXWJbniP+nbyr/SpEl1i1grw+GY49nlXfUhZ/v4vEEsSRiQAQ46VAsQGEMQv/pbxbcLMlC
 nnYCzt8DeuuxEm92P31FoOnZlXQQhIGVOj47IYamcd1lsy7QhFbGWFk18gEku23NG4CEaI
 qYb0/fGZgiSkXPmDXZfhrg90pWSgGzE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-IbPiq7DpMueOWrH9kfPHWQ-1; Mon, 05 Feb 2024 04:14:22 -0500
X-MC-Unique: IbPiq7DpMueOWrH9kfPHWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40ef75adf5fso22674695e9.0
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 01:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707124461; x=1707729261;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzNp7sWBNaERwY/1vkfXUPUo3G5xyIojHBmkAPU/Fto=;
 b=fBlLiKRiDR/Rk8//LRB9O+RvNVqvak1DzZaRL1Z9VBqCxat/9F5xG/b9zxx8O6lA+P
 4v4rvXeL0yHwp0tEW5AaIwY/jtKEm5oIfv26yG+yWEuGX1Q3I6qNodoJAgDSgYB+VZhH
 Y/w1mkIBLkYvqZREcB4oMmRYfF95Rok063X7dY9qBH3En0lcCy488TzvlpPkJuq5NiXk
 Xy/BA1ANHIkr+QgM6iv7iAMujSAwG0bHtzqhvOk8e356zofjJx8ItdUuahYnsDQtHHzx
 jd5J7WOy4PQ05hx5CB+bdZgmQhRNPcSeAV/qIFKKZWAp8b05PoUV+hlXL/ojUbLw/yur
 5T3g==
X-Gm-Message-State: AOJu0Yz9iRTSPhqKZNAOKSicywhnc5VhOww2yRCggfpBCsodvdZdgtDU
 BuSyTJyZkolSxOeTCHRrSRypD5dPwXmjjf9MkI1PKjyRLSFbZMgCwa7zkq+/mJf5sCWZ5T3XGCw
 K5fgCuY3rYn3ehvuLKrE4dteArqYSaZ6dFospdw6fcoKTVFOiqg==
X-Received: by 2002:a05:600c:46cb:b0:40f:bdf1:58cc with SMTP id
 q11-20020a05600c46cb00b0040fbdf158ccmr4230229wmo.33.1707124461547; 
 Mon, 05 Feb 2024 01:14:21 -0800 (PST)
X-Received: by 2002:a05:600c:46cb:b0:40f:bdf1:58cc with SMTP id
 q11-20020a05600c46cb00b0040fbdf158ccmr4230210wmo.33.1707124461206; 
 Mon, 05 Feb 2024 01:14:21 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVdoLYOvCva2nfQ97SqK0QGnWa+LPFccwGXmsWN617vAlXGYM6DsRhPlf2vPUCmAEE11AMPn1gXTZXjrw7pXlfRSztkT8cJxbeiOoBbDxe+SwOQOwno6djeXPExDAll8xPlmMZTAiq61uRXSg6rcrvTk00l8RCdOgapSnfkVKVFSmSslis0zqq857FywD1N0aa616dfNFlvyoR/SaFpaBj8H5ZfF37C6VhjpDbk8V51Ezi3m9jA5hXdCpAw7x/ybJAG013rjPbC4h1CyDoW+WxE4ZNTN0RR9KdX2QtOw4SgXP+B5eYFpB+6Ymd6lYYTLWn0cDsV6Z6lRp7wJqSMaU1QqDcZgk5a5cg=
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a05600c1c8f00b0040eea5dc778sm2060515wms.1.2024.02.05.01.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:14:20 -0800 (PST)
Message-ID: <319bda87-1d7e-40e3-812f-0f9c4d61f357@redhat.com>
Date: Mon, 5 Feb 2024 10:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] virtio-iommu: Add an option to define the input
 range width
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, yanghliu@redhat.com
Cc: mst@redhat.com, jasowang@redhat.com
References: <20240201163324.564525-1-eric.auger@redhat.com>
 <20240201163324.564525-2-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240201163324.564525-2-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.361,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ph9HWg1ssP9P

On 2/1/24 17:32, Eric Auger wrote:
> aw-bits is a new option that allows to set the bit width of
> the input address range. This value will be used as a default for
> the device config input_range.end. By default it is set to 64 bits
> which is the current value.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - Check the aw-bits value is within [32,64]
> ---
>   include/hw/virtio/virtio-iommu.h | 1 +
>   hw/virtio/virtio-iommu.c         | 7 ++++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 781ebaea8f..5fbe4677c2 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
>       bool boot_bypass;
>       Notifier machine_done;
>       bool granule_frozen;
> +    uint8_t aw_bits;
>   };
>   
>   #endif
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index ec2ba11d1d..7870bdbeee 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>        */
>       s->config.bypass = s->boot_bypass;
>       s->config.page_size_mask = qemu_real_host_page_mask();
> -    s->config.input_range.end = UINT64_MAX;
> +    if (s->aw_bits < 32 || s->aw_bits > 64) {
> +        error_setg(errp, "aw-bits must be within [32,64]");
> +    }
> +    s->config.input_range.end =
> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;


This could be simplified :

   s->config.input_range.end = BIT_ULL(s->aw_bits) - 1;

Anyhow,


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



>       s->config.domain_range.end = UINT32_MAX;
>       s->config.probe_size = VIOMMU_PROBE_SIZE;
>   
> @@ -1525,6 +1529,7 @@ static Property virtio_iommu_properties[] = {
>       DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>                        TYPE_PCI_BUS, PCIBus *),
>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

