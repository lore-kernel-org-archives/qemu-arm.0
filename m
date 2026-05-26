Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA19ECD5BD0
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 09:31:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRo8C-0002MC-SX; Tue, 26 May 2026 05:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRo8B-0002LW-QS
 for qemu-arm@nongnu.org; Tue, 26 May 2026 05:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRo89-0002Gg-NY
 for qemu-arm@nongnu.org; Tue, 26 May 2026 05:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779787880;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnTVsmuQT9pSkyj+6cp6lv+f/P9MMNzNx1hUsif2Jys=;
 b=eDiUbInJi61LwkVb0JMxXvSDUfxBZ8p1h5ZDB/+Cr1cUC4nTE5kcQ8GMOJosVzgRZuRYw9
 y0F6xciER3hFQQHI7y+f7Fa7AImQreCU/oXfv+ybu1oGfuHT7lrK3KIBVhs/8DSOffKBVF
 gQAL0wU+gp/fa1EKcdeLsUV2BwHNAKk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-t86309H1PSyMg1fHK-2ChA-1; Tue, 26 May 2026 05:31:16 -0400
X-MC-Unique: t86309H1PSyMg1fHK-2ChA-1
X-Mimecast-MFC-AGG-ID: t86309H1PSyMg1fHK-2ChA_1779787876
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48feb0298d7so83465985e9.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 02:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779787876; x=1780392676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BnTVsmuQT9pSkyj+6cp6lv+f/P9MMNzNx1hUsif2Jys=;
 b=GzNnU5up/l6ODvgUXuCh5hDKl7S4AVddzCtWr3yqZie2tAwal13xL2aXA0oyrN0b4z
 2VH2rtqH4L9RKUFiTib20g/d14iMQmGne8CsZK1D+jaaGO4NynUGsYz2TNQDjwwrqe1p
 K6gpXIY6h5O01fJs035B2EgdCKw2vUXHlt4nKWyrXWzM2a5rsO6wCDPOcNl2Xs7MLFjp
 F+tG5B8QZeq5pdSNMw1Kqc/2aZ0i3t8jDKNmU4JuWKhhLUYLm4hgyPd5M60HEKvlVW8c
 CgNDlZK6bo3lN1ljHmw0F1oFzcMu4HJ4PseFkySskBbwcxnGWpXTHvJ2oP+1ggsT4byN
 VWrQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Zi5EPSnX3VM5sRdxr7yL/8uiLqoX/6hWV9DlVbxX+SoGURqzMLI89i/byyMv/DUTg/YtdjFFhgw==@nongnu.org
X-Gm-Message-State: AOJu0Yx6zz8jrepSsPjbXFOaC4WpuJnt7Bfj0XNJrPHS3roOaf7t1KnX
 Gwh28IFg+usx0VbCUFYkV8vuJAiA1aYtz6bgDh7q6CcMGmLZ4v0r9wOHnyImVke1+DkhZeh/gUy
 /tUcwX5NwBJyC4xtLYglboj7XuU7MEI4Z2f4bbGS+ti25WOfeYEqWYA==
X-Gm-Gg: Acq92OFM0mOuqyO7ShcTid6NskmLirw/DHIbcZS4yKToZlq2V9LtKocW5zu6Ka/gkgP
 s52y4VZVJ/CSigsx+5tuUOGebEHH34OYtqEUVuGYZ+h2iSEfuZ6TETzn01aRlSVMuIvNMa3ZseX
 4fPlwSG6W3BZoD6EjsJ8B0vhyNwgvguuxUTn510Cj+5QJUOOUc9QnGN067zYR3slXNxBiQHqiTx
 udjtGIqIb87vcPCIJLdD1t4tZSDHurp/mnNF9V1AW/qow6brYgyOMS6Kk9hqzgsHGSiV3BRa9cz
 t66J/RZH7j4Bwd+DVoCu7KKRDr/nure5qW3v8eM6q2T2TslAw/29U7GGYcUu+5SI8DwwIcuhG3X
 W8JO4+Cu2hbVHrfLYa0CXT/09iNo4Qke3jucJRKfDjWVbnoQYKVAdOpszXW55yDqKaAG4WA==
X-Received: by 2002:a05:600c:4511:b0:490:6869:46c3 with SMTP id
 5b1f17b1804b1-490686947bemr101932305e9.30.1779787875609; 
 Tue, 26 May 2026 02:31:15 -0700 (PDT)
X-Received: by 2002:a05:600c:4511:b0:490:6869:46c3 with SMTP id
 5b1f17b1804b1-490686947bemr101931555e9.30.1779787875035; 
 Tue, 26 May 2026 02:31:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d6ebf0sm35074765f8f.34.2026.05.26.02.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 02:31:14 -0700 (PDT)
Message-ID: <6b944d99-617e-4ae9-a48d-9e28c6a8bcde@redhat.com>
Date: Tue, 26 May 2026 11:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/32] system/physmem: Add
 qemu_ram_backend_pagesize_min() helper
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-27-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-27-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lugvAuAxuajRFgO0hZyqBi6pvDjdH6t0JUbaZrioPZI_1779787876
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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



On 5/19/26 12:37 PM, Shameer Kolothum wrote:
> Some hardware accelerators DMA directly to the host physical address
s/DMA/perform DMA accesses
> of a guest-resident buffer (e.g. set up via IOMMUFD). The HPA is
> contiguous only within a single host backing page; a buffer larger
> than the smallest backing page in use may span non-contiguous host
> pages and fault.
>
> Introduce qemu_ram_backend_pagesize_min(), which returns the smallest
> page size among RAM regions backed by a memory-backend object. Falls
Don't you have means to be more precise? I mean you know the GPA of the
cmdq, can't you make sure it belongs to a specific ramblock and check
its min page_size?

By the way there is find_min_backend_pagesize() that exists. Can't you
reuse that?

Thanks

Eric
> back to qemu_real_host_page_size() if no memory-backend RAM blocks
> are found. Callers can use this to bound the size of buffers that
> must remain host-physically contiguous.
>
> A subsequent Tegra241 CMDQV support patch will use this to bound the
> command queue size exposed to the guest.
>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/system/ramblock.h |  1 +
>  system/physmem.c          | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/include/system/ramblock.h b/include/system/ramblock.h
> index 4435f8d55f..7f7ea53557 100644
> --- a/include/system/ramblock.h
> +++ b/include/system/ramblock.h
> @@ -175,6 +175,7 @@ int qemu_ram_get_fd(const RAMBlock *rb);
>  
>  size_t qemu_ram_pagesize(const RAMBlock *block);
>  size_t qemu_ram_pagesize_largest(void);
> +size_t qemu_ram_backend_pagesize_min(void);
>  #include "exec/target_page.h"
>  #include "exec/hwaddr.h"
>  
> diff --git a/system/physmem.c b/system/physmem.c
> index 46b36c7b10..7ccec52aa2 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -1999,6 +1999,35 @@ size_t qemu_ram_pagesize_largest(void)
>      return largest;
>  }
>  
> +/*
> + * Returns the smallest page size among RAM regions backed by a
> + * memory-backend object. Falls back to qemu_real_host_page_size() if no
> + * memory-backend RAM blocks are found.
> + */
> +size_t qemu_ram_backend_pagesize_min(void)
> +{
> +    RAMBlock *rb;
> +    size_t pg, min_pg = SIZE_MAX;
> +
> +    RAMBLOCK_FOREACH(rb) {
> +        MemoryRegion *mr = rb->mr;
> +
> +        if (!mr || !memory_region_is_ram(mr)) {
> +            continue;
> +        }
> +        if (!object_dynamic_cast(mr->owner, TYPE_MEMORY_BACKEND)) {
> +            continue;
> +        }
> +
> +        pg = qemu_ram_pagesize(rb);
> +        if (pg && pg < min_pg) {
> +            min_pg = pg;
> +        }
> +    }
> +
> +    return (min_pg == SIZE_MAX) ? qemu_real_host_page_size() : min_pg;
> +}
> +
>  static int memory_try_enable_merging(void *addr, size_t len)
>  {
>      if (!machine_mem_merge(current_machine)) {


