Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8669CD3436
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 12:40:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKbXm-00015c-Tw; Wed, 06 May 2026 08:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKbXk-00014W-8a
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:40:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKbXi-0004ab-IT
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778071197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTY+y6lxu+9OaHPL+ucozMuhMIymeEa9IfUfmo8cQfA=;
 b=ZYXqHvCpw1PRzHo2okOjFnVExW8RzOCKy6JT0AGkwMrCkXTJxti1sXsvlyRLS9hTqWDIcG
 GSq7LlmNV54H0YZn5j/JlHPFkaGHhSBZi344BBMsdAeN3OqoPexp/S8Ixn3r6UWAAMmzZt
 1u5Rmn0P8GGMHczQnwaL0zoe+MCYfas=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-632QMB-5Pb-Ewini0o1nMA-1; Wed, 06 May 2026 08:39:54 -0400
X-MC-Unique: 632QMB-5Pb-Ewini0o1nMA-1
X-Mimecast-MFC-AGG-ID: 632QMB-5Pb-Ewini0o1nMA_1778071193
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-488d2cd2674so50410485e9.0
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 05:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778071193; x=1778675993;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTY+y6lxu+9OaHPL+ucozMuhMIymeEa9IfUfmo8cQfA=;
 b=ebXaOGRowuDfCvfCmG9jZT0c4MAFMW11tfckB9bN8+HCcraiMM7XSC4VdVLlUJnHax
 LA5RRFFoAssj38iYeiDbJEOXYuJ4jx93UKp+M4XiTJsHJaKxWq3+MQzcPf0v8aNdvkB/
 xwtsTEn3CQffC/saWYDEFgWirsORymxnXq/b4gmEmY9NwTccToScNFmzXpif0Kn/64mX
 Mm3/LiObG+VDUETTq1ccCtAi0gi+Oe4F5FJKxlWbocIsPf9+1ofnFI3dTY+9NAlKA3t/
 8vYfaejn2/Z5ImPyXVBrNNeqQuBK2zM1MTQ79A5pExqOFQoikUX6N0ahm3vS7MCvtMrT
 ZjXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+eD7SFGtkn4pK7+JmDNgrJg7Kqj8bd9wMp09TNWMpjuXTB2dc4CItOK5Q83XyY+LEjq4ly4qN6Dg==@nongnu.org
X-Gm-Message-State: AOJu0YyEh+1sqgLXmSdpyFIrsf+hyNHHvcJeoLYbfBKpjAcFEqi2PXzH
 jIngTIHroTnE/KBXbUOdCgYIjkG8nP059bFjwiCSf7OWy/FADbPtFT3DuiGtNwTO/pS3h/52/L3
 i29rYPbM7DSYn3C60nK3I5PpupVsN7GxlHEJFfxcqH20gC7jHWKyf5Q==
X-Gm-Gg: AeBDiesJpFo4Rcym7ZPs233e3EVYSmEl7KBGkEy3jdKt3+wM3XquHL5k4oZ/aWMgAnD
 nrsPyDi9Vht2sYnCHRJo/WGBAgOHGgl3mt6UKNNEZo2LuWlXgue9kJL71o4h7k9WCjqP1qUmME6
 FFp/HOCLukgGX4hvIO4FU7Xq/5X9hxnGuML8NgWHWsg4j3VLV8DUwraSc42sJxU1JJlVQMNlc8G
 b9LxzbfvHsYeEMYHWiV8+UKXstOjURNC9bbtYZ9TimoUOMCiSQJWa9vugTXQfHUQnXMuSbp8+Bn
 8NZNGSkdvh11VH16k4KrrDlJ38wcJ1gZF/MdVpMBeJ3n558nOGGlJ5g369Ui8dEsNIcKQQqzUH0
 /kJYkCyT40s9ZshktxQACIQmSGjqiMfKKblAhPZxoKIhxlMq7v3NqMutyOZuXlC1/XDcDTuW3kC
 cJCSEW
X-Received: by 2002:a05:600c:4e0c:b0:48d:46a:6e5b with SMTP id
 5b1f17b1804b1-48e51e19110mr62965455e9.7.1778071193196; 
 Wed, 06 May 2026 05:39:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0c:b0:48d:46a:6e5b with SMTP id
 5b1f17b1804b1-48e51e19110mr62964895e9.7.1778071192797; 
 Wed, 06 May 2026 05:39:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5312dc04sm19713595e9.19.2026.05.06.05.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 05:39:52 -0700 (PDT)
Message-ID: <99702165-9570-4a54-9137-b40a52c7b0e8@redhat.com>
Date: Wed, 6 May 2026 14:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] memory: Allow RAM device regions to skip IOMMU
 mapping
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-22-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-22-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZmepRM9sge5_-UVSvRB6ie0Kk0mcFhFJ8TFGbjqaTdQ_1778071193
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Some RAM device regions created with memory_region_init_ram_device_ptr()
> are not intended to be P2P DMA targets.
>
> The VFIO listener currently treats all RAM device regions as DMA
> capable and attempts to map them into the IOMMU. For regions without
> dma-buf backing this fails and prints warnings such as:
>
>   IOMMU_IOAS_MAP failed: Bad address, PCI BAR?
>
> Introduce a MemoryRegion flag (ram_device_skip_iommu_map) to mark RAM
> device regions that should not be IOMMU mapped. When set, the VFIO
> listener skips DMA mapping for that region.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/system/memory.h | 2 ++
>  hw/vfio/listener.c      | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/include/system/memory.h b/include/system/memory.h
> index 7aed255e81..9df15e833a 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -864,6 +864,8 @@ struct MemoryRegion {
>  
>      /* For devices designed to perform re-entrant IO into their own IO MRs */
>      bool disable_reentrancy_guard;
> +    /* RAM device region that does not require IOMMU mapping for P2P */
> +    bool ram_device_skip_iommu_map;
>  };
>  
>  struct IOMMUMemoryRegion {
> diff --git a/hw/vfio/listener.c b/hw/vfio/listener.c
> index 960da9e0a9..32d33a740a 100644
> --- a/hw/vfio/listener.c
> +++ b/hw/vfio/listener.c
> @@ -614,6 +614,11 @@ void vfio_container_region_add(VFIOContainer *bcontainer,
>          }
>      }
>  
> +    if (memory_region_is_ram_device(section->mr) &&
> +        section->mr->ram_device_skip_iommu_map) {
nit might be better the create an accessor including both checks
like memory_region_is_protected

Thanks

Eric
> +        return;
> +    }
> +
>      ret = vfio_container_dma_map(bcontainer, iova, int128_get64(llsize),
>                                   vaddr, section->readonly, section->mr);
>      if (ret) {


