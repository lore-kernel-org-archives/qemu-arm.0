Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02569CD4F5E
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 12:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ2F3-000501-1v; Thu, 21 May 2026 08:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wQ2F1-0004zs-H8
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wQ2Ez-0001J1-Iy
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779365464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ls/h+mBaYPKEcug4ENQoj5FSj8qrgO/Q/7qjGXBsW0=;
 b=GJTdYgU5hRyQO954xCC5FOd7iVI3ILjHAp/mMrwN041iIcmxo7CM/BXvGCE2nllX+Jwqg6
 bZkawrL+1tfMuE0zQtXNtfETqtX+FzcN54szhqGAL+aHpEYWjV97XesPQcvKXjSaESFHRd
 st43Jcy2j+XPATHfVWTkAJfd/KY7F/k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-O6rPeADzOdi_p2ouPLHJbw-1; Thu, 21 May 2026 08:10:59 -0400
X-MC-Unique: O6rPeADzOdi_p2ouPLHJbw-1
X-Mimecast-MFC-AGG-ID: O6rPeADzOdi_p2ouPLHJbw_1779365459
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fd2b502e2so52033245e9.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 05:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779365458; x=1779970258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ls/h+mBaYPKEcug4ENQoj5FSj8qrgO/Q/7qjGXBsW0=;
 b=TDo1q38UeRdpN+nOP2IE9U6/OvQS/lv4mO66KpRIHKHbVi0DLZrSUEJ3avIs86XfJA
 A+ABhcoodEZD42uaGaCSTowTY498jUBM3sC0Ge6K+NkIiQQMHWKYHA7XnQzw4b3qMmvn
 gHHHAddY9khwLhbu9lZ8Qc/V5buk2PDT6pnA0PNIRk/sIeW+Cgg2qkIEZye8iehBZ9ok
 tloQgPuw/ZhjwZVpY5eJsspqixv5DIjvhp2KVb+UOJwdEBQBwrPM86xpx4ii8Hor4ziT
 I+GeqXtKrY72n0NnryNwm266D1zg/FnBdYfFBku56ihp+IjUqfx8AdXt5mzzaQHEtfCG
 fLSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FnOJ1Ns7o3MmvSLFFGxB7YVcVx92kFFovoLPGDafiqHAcVXfTLyNHTjkmfJblzESLQz1tUWQ1lQ==@nongnu.org
X-Gm-Message-State: AOJu0YzJY5UFPqhPVNNNEVWjp2zhtfXtAgMsRZOifV0bbDa6/lQHhx89
 gjIfV7WX8ZSlt/QTj/tvop/DDMOx0xrX/aFzp1PYR3cShJyhEkNg4VMtJLU3Il3RkT1yGfEtFcQ
 M3CQXDtGBBjww4QnBuFrGYHgY9HMp2t158CxGDhYEb6hJrHF7qppMoQ==
X-Gm-Gg: Acq92OFhZ8RYWmVDjlXVp2OLfzzWn7Akoi1NFCZUnsKIUgqjNslYdcJuDVLZwt7WjRz
 gNeq2xiFR9bh2abE0k/RCUkwo2zzlGi8pKQOZPF6bYMHjJ0TQxTI2UBGTGR765bjmy0t2PJTDdH
 TwqEXexhE7B8ys97HcF3R7KKnWzlzy20xmK3xaLY7ibW7lOcVi9HtaWgB3Qid3KiM74OEcO4lq/
 AkPWpvt5TjFQqDC004/zbDoFpgG1CjGEGbL9Y2dVaS3DtrDsJ1blzeczrkruBljFePcTE8bvFkP
 jMoFfJ780vj1YN5dQFokZhDoFldgGYVIhXHfjfv2s9Y1GREge8b71DOXlNUqddX+gQ/JUgUPNC1
 lZFp5fgELjL4llMoBz9RpbnUHuEhBqMUI1b4Wps+26M2P9OdEB2HhR2A6vNYgRdAQSEOfRX2YG1
 2+OQnK
X-Received: by 2002:a05:600c:a04:b0:48a:97b6:7420 with SMTP id
 5b1f17b1804b1-490360e46d3mr35720265e9.24.1779365458553; 
 Thu, 21 May 2026 05:10:58 -0700 (PDT)
X-Received: by 2002:a05:600c:a04:b0:48a:97b6:7420 with SMTP id
 5b1f17b1804b1-490360e46d3mr35719795e9.24.1779365458086; 
 Thu, 21 May 2026 05:10:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903cae778asm20189015e9.13.2026.05.21.05.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 05:10:57 -0700 (PDT)
Message-ID: <4c820b96-0426-4839-82ab-70fc2d146406@redhat.com>
Date: Thu, 21 May 2026 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/32] memory: Allow RAM device regions to skip IOMMU
 mapping
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-22-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-22-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mAraNP1o7bsZaHBIpa6zeFvUGAxtcwZ2pdmlussm5Bs_1779365459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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

Hi Shameer,

On 5/19/26 12:36 PM, Shameer Kolothum wrote:
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
> device regions that should not be IOMMU mapped, paired with
> memory_region_skip_iommu_map() / memory_region_set_skip_iommu_map()
> accessors. When the flag is set, the VFIO listener skips DMA mapping
> for that region.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/system/memory.h | 21 +++++++++++++++++++++
>  hw/vfio/listener.c      |  4 ++++
>  system/memory.c         | 10 ++++++++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/include/system/memory.h b/include/system/memory.h
> index af5f96f6ff..b11d6bf07f 100644
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
> @@ -1743,6 +1745,25 @@ static inline bool memory_region_is_romd(const MemoryRegion *mr)
>   */
>  bool memory_region_is_protected(const MemoryRegion *mr);
>  
> +/**
> + * memory_region_skip_iommu_map: check whether a memory region is excluded
> + *                               from IOMMU mapping
> + *
> + * Returns %true if @mr is a RAM device region marked to skip IOMMU mapping.
> + *
> + * @mr: the memory region being queried
> + */
> +bool memory_region_skip_iommu_map(const MemoryRegion *mr);
> +
> +/**
> + * memory_region_set_skip_iommu_map: mark a RAM device region to skip IOMMU
> + *                                   mapping
> + *
> + * @mr: the memory region being modified
> + * @skip: %true to skip IOMMU mapping, %false to allow it
> + */
> +void memory_region_set_skip_iommu_map(MemoryRegion *mr, bool skip);
> +
>  /**
>   * memory_region_has_guest_memfd: check whether a memory region has guest_memfd
>   *     associated
> diff --git a/hw/vfio/listener.c b/hw/vfio/listener.c
> index 0b72a2cf5e..18100e9897 100644
> --- a/hw/vfio/listener.c
> +++ b/hw/vfio/listener.c
> @@ -610,6 +610,10 @@ void vfio_container_region_add(VFIOContainer *bcontainer,
>          }
>      }
>  
> +    if (memory_region_skip_iommu_map(section->mr)) {
Maybe add a trace-point just as above
trace_vfio_listener_region_add_no_dma_map()

Otherwise looks good to me.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> +        return;
> +    }
> +
>      ret = vfio_container_dma_map(bcontainer, iova, int128_get64(llsize),
>                                   vaddr, section->readonly, section->mr);
>      if (ret) {
> diff --git a/system/memory.c b/system/memory.c
> index 739ba11da6..48245fd01b 100644
> --- a/system/memory.c
> +++ b/system/memory.c
> @@ -1814,6 +1814,16 @@ bool memory_region_is_protected(const MemoryRegion *mr)
>      return mr->ram && (mr->ram_block->flags & RAM_PROTECTED);
>  }
>  
> +bool memory_region_skip_iommu_map(const MemoryRegion *mr)
> +{
> +    return memory_region_is_ram_device(mr) && mr->ram_device_skip_iommu_map;
> +}
> +
> +void memory_region_set_skip_iommu_map(MemoryRegion *mr, bool skip)
> +{
> +    mr->ram_device_skip_iommu_map = skip;
> +}
> +
>  bool memory_region_has_guest_memfd(const MemoryRegion *mr)
>  {
>      return mr->ram_block && mr->ram_block->guest_memfd >= 0;


