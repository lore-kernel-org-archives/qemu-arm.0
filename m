Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16548FF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:01:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJumz-00087V-C3; Mon, 04 May 2026 11:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJumx-00086f-9m
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJumu-00061x-Sd
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777906847;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgyG+JgynYWmUZNnLcW6/ZFDoGgc9nqUJcjRlVtM2MI=;
 b=ZayhJ4JuZSm4U988hXu/GCIH7aBPPtSY7wC2P3y5MYnqyCtwChH5WMrMKhsTS8z1QTqU9C
 EcSkwoaa0Pn3uj0+QgDOsBFH00qNlApuUZpjwA5hW2nUlFxfRmR+zWaRTSGwcfX7w17JHj
 LjMA5ksJS6gFvR44Ipn+KYHeAO7pRRY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-p6QgL_R4NIKuQ18y9UTBhw-1; Mon, 04 May 2026 11:00:44 -0400
X-MC-Unique: p6QgL_R4NIKuQ18y9UTBhw-1
X-Mimecast-MFC-AGG-ID: p6QgL_R4NIKuQ18y9UTBhw_1777906843
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-44d83e45febso1013134f8f.0
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906843; x=1778511643;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgyG+JgynYWmUZNnLcW6/ZFDoGgc9nqUJcjRlVtM2MI=;
 b=VfEoavDmLoDav/ZI8o1U+h9vorbGRNK1bvLA3tvYNMCQGwlwmoKLhtj3Q+cpi7A0J4
 3wWIjtOsT32e75eG+T7+3qrZvI3XWW4a39hgXvTmQqaN7NIJNnnHx/YwHcRgnCH/YRsk
 RR5ekqJqTLin9pMJkiRGeAEbmhl0Kp+NFvkjAS4KQfRqtKFFEGcEdbfmexsGp/kv6ulx
 tIJVHoTvabCdaQJAsmZZloCYrv1a5A036We2h0of6Ki7wmnwg/EhcD2F0d1H1ao/XqQa
 Q5c969qqZ3uEfTVM4PXaY71fXC2SK1sD4/pCKtmuouUrJoysB4c619dJzAWq/Tj1Rv8k
 Uh9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+eLelsJyw4lJJ9+EcTe2OKCijPRMl6sxMZgYrQ3H9zbLmw0pu0jcxFtsLoGaKG3L7FgjaA8jDXFQ==@nongnu.org
X-Gm-Message-State: AOJu0YyJ+dZDOYvF+ZsvNGAK1RhYmRnj1kXOdSzcSmTidb1skU1F+FXz
 V0Rp9+y7aIEeFVJMrdHCmRzh7QBO/x+o3SJhGBev5YeKi+NhodpkJTwc/C4BzAtfr5ElK0NQyH4
 8e811k2g0Vw6LWY2NY5q/4kitPe8uJg2yxY8b3sfBWenRCXu652me3w==
X-Gm-Gg: AeBDieuxxTQiKV/ln3GKRXqy0kdJGEI6y5lHCZ3Wui0KWuRHQ4dbRb0BAkgTjVIUcbA
 hXUMvYKAEhm5mZmPBdDgJ1KCZwa4kQeot3vV+b+K+zkgnFtZvQ8HZ7dXEZhyfkKQvK9LrxaD4qR
 H0d91mHOuJqZmqypRifwvDL5UmFX5tVhg34eWw3SMaZswpUuk9niUf3QHM5gMf3PGa6+EC8zdya
 GVC+3gJH8f3Get7oIbikv4YueFHjXeon2DnuVHSXxcdq1oxhUkHlgsl0wez7vyTIJitGTBr7I34
 zIY7JhmHZNTKr2DJ3rVSw7xRV39iGE5TLmE35zGRQjv5JsXl4s/QjLX9EtzafeWRJdgU1jOyf9+
 /t/KJi9LSGDRxDB51MElXDA6D5Cizsorm6G9U2M1t8q0Yvwn5cDmdJCfa/tNU3Rp6nkX+SM8Xfi
 cOtevy
X-Received: by 2002:a05:600c:83ce:b0:486:f893:56c6 with SMTP id
 5b1f17b1804b1-48a970eae79mr139778435e9.10.1777906842955; 
 Mon, 04 May 2026 08:00:42 -0700 (PDT)
X-Received: by 2002:a05:600c:83ce:b0:486:f893:56c6 with SMTP id
 5b1f17b1804b1-48a970eae79mr139776985e9.10.1777906841427; 
 Mon, 04 May 2026 08:00:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed69fasm394745785e9.3.2026.05.04.08.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:00:40 -0700 (PDT)
Message-ID: <17a85707-d4df-4f5f-879c-8e351f7cdbe7@redhat.com>
Date: Mon, 4 May 2026 17:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/31] system/iommufd: Remove unused viommu pointer
 from IOMMUFDVeventq
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-6-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-6-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oVaVtBsmc-6XXaZZlGtNvjpuXJzRzwESETnib5nWFBk_1777906843
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> The viommu field is assigned but never used. Callers freeing the
> veventq already have access to the IOMMUFDViommu object through other
> references, so this field is redundant.
>
> Removing it also simplifies upcoming changes where veventq is
> allocated based on the viommu id before the IOMMUFDViommu object is
> created (e.g. vendor CMDQV-based veventq allocation).
>
> No functional change.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/system/iommufd.h | 1 -
>  hw/arm/smmuv3-accel.c    | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 38cfceca84..b6599521b8 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -58,7 +58,6 @@ typedef struct IOMMUFDVdev {
>  
>  /* Virtual event queue interface for a vIOMMU */
>  typedef struct IOMMUFDVeventq {
> -    IOMMUFDViommu *viommu;
>      uint32_t veventq_id;
>      uint32_t veventq_fd;
>      uint32_t last_event_seq; /* Sequence number of last processed event */
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index c356ff9708..f65e654adf 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -549,7 +549,6 @@ bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
>      veventq = g_new0(IOMMUFDVeventq, 1);
>      veventq->veventq_id = veventq_id;
>      veventq->veventq_fd = veventq_fd;
> -    veventq->viommu = accel->viommu;
>      accel->veventq = veventq;
>  
>      /* Set up event handler for veventq fd */


