Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F6AC9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJxi-0002gV-CE; Mon, 12 Jan 2026 10:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfJxD-0002VD-BG
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 10:35:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfJxB-0008QB-Jr
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 10:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768232136;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCwcELSsn9WdaTLRhYvKD92lhq/VC4006wLLCTeMYzs=;
 b=h1N2OH6oCYIrJE4MjVrFLNBQc8Vy+c00Wkd0p4mefxHjeub1IfOGLqJem2LXB87Y76dk06
 YsZq1IFueLAURlF9kfsqtWPYNLPLNuVkAtdZEzJsjjnFQXJHyz514Ei+8dYjozbUYfmiCb
 ++JFK7p0NMMDGC4Iu7TG/kbpjCqvZnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-9fR4NVqEPC2OpUuSKHkHYQ-1; Mon, 12 Jan 2026 10:35:35 -0500
X-MC-Unique: 9fR4NVqEPC2OpUuSKHkHYQ-1
X-Mimecast-MFC-AGG-ID: 9fR4NVqEPC2OpUuSKHkHYQ_1768232134
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477771366cbso50798915e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 07:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768232134; x=1768836934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCwcELSsn9WdaTLRhYvKD92lhq/VC4006wLLCTeMYzs=;
 b=LUauQA/Bna8uWMoBVuxyeOs4NUmoOVZvBekOsdS46biblB2ozKGicpqwxS4pFZyUz0
 NPPQryfqq7B4wm/SYzSIGZJ+gpXxHeluIpeK3o1OO918+zaGRauHg/4fHGdRKnh/2lln
 9iFswuBlDx/PiORK8QAsuOGGaqdjRJlV6TbSfH/YtWPCoBPoQEGyz+IU1hZtiIHBzoIx
 OtherSGlnKxmEfdynOCnI6mf3io+aUqJ0KOHlRzXjECbQiKuyrhhmbh+xXahtPI7QyJt
 TbgIvmtsMFTP4cLpji6G8PYbTqyHHjuou2VHOzzC2irmgsKGD00zMwNv+UUU2v1+w58q
 oC0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9E1zk0MkNri/E6rDTFVb1V+cAOJ2M9203YD4W386PV2CRWh24ASqxpUCIW9W/6wN5hFj+xklvPA==@nongnu.org
X-Gm-Message-State: AOJu0Yz1LMa3GYaOdU7jQxOYHFuEvz7Pth9JFRypJ/2y5oQJqr/tNzZ6
 1f+Wp2yUyC65xnTCjH2Y2qH4KOswgXSyBeIa8eaXRUJNDDo/2bbPYE7yrH2wfmFAjloIMVyAXN7
 5z0jKJ02BT8LQLOa7yIduFVgCSshT4KgOgs86uZNTeKXGXsfMELLAlg==
X-Gm-Gg: AY/fxX6rbPxUAmbQjTpae4vzSmLtEG4+28dNqiOR5u6H3LKmA4Z603aOgAZTCwJavZW
 qXpfv4/3ng/9HMF4wCtpjSGXXThlZ0xBqpnMa6xXdhJtrvZuG7KACn+xIdssSVa0n9FgDXk7/Zt
 itHUhbZHKPnIMHNB4RRR6xl2ldsAjoK2JBj8SGZUiFjUWPDIFegvm4CQWmaxcKYeaD9r+/+Hyhn
 3l2zIeNBlyLG/SLKBVDkBdCtdPiA7Dnzt1H/7Hnrw6QmD3+llQLZ/ImvtHK1Nkh26mzSskSti43
 RaUhgfD4+BwyQxGuc7q6dpS+o1zk8jMwJtsK/8BsTeBwIcNLzxmKerCZCx3kQXO0WVUTBghwL+w
 +L2tTz2QWh/mOBZMe4J/PKqw2+79ViJDatyN3fnTcDohGmDPtFCgRzIzO1A==
X-Received: by 2002:a05:600c:470c:b0:47a:7fbf:d5c8 with SMTP id
 5b1f17b1804b1-47d84b3b3c1mr184960725e9.26.1768232133895; 
 Mon, 12 Jan 2026 07:35:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtAZ5Vjo+biBSTLCZdzHw0SLZAbcNUH9IQtw7UMvkGAa8LZ8iBhabDi7ktvGbmo3QvqPlqMA==
X-Received: by 2002:a05:600c:470c:b0:47a:7fbf:d5c8 with SMTP id
 5b1f17b1804b1-47d84b3b3c1mr184960455e9.26.1768232133518; 
 Mon, 12 Jan 2026 07:35:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacc5sm39069218f8f.5.2026.01.12.07.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:35:33 -0800 (PST)
Message-ID: <5d4c0d2e-0711-49f8-ad2b-36d3fbd4f344@redhat.com>
Date: Mon, 12 Jan 2026 16:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/16] system/physmem: Add helper to check whether a
 guest PA maps to RAM
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-9-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-9-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F8Gwl8iSXIYxZ3pcR4wV4NeOHWfwMt8Ea8Sz5p3_HHA_1768232134
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Introduce cpu_physical_memory_is_ram(), a helper that performs an
> address_space translation and returns whether the resolved MemoryRegion is
> backed by RAM.
>
> This will be used by the upcoming Tegra241 CMDQV support to validate
> guest provided VCMDQ buffer addresses.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/exec/cpu-common.h |  2 ++
>  system/physmem.c          | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index e0be4ee2b8..76b91d1b9b 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -148,6 +148,8 @@ void qemu_flush_coalesced_mmio_buffer(void);
>  
>  typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
>  
> +bool cpu_physical_memory_is_ram(hwaddr phys_addr);
> +
>  int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
>  
>  /* vl.c */
> diff --git a/system/physmem.c b/system/physmem.c
> index c9869e4049..1f6c821a0e 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -4068,6 +4068,18 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>      return 0;
>  }
>  
> +bool cpu_physical_memory_is_ram(hwaddr phys_addr)
I guess this would need to match the new address_space_is_io()

Eric
> +{
> +    MemoryRegion *mr;
> +    hwaddr l = 1;
> +
> +    RCU_READ_LOCK_GUARD();
> +    mr = address_space_translate(&address_space_memory, phys_addr, &phys_addr,
> +                                 &l, false, MEMTXATTRS_UNSPECIFIED);
> +
> +    return memory_region_is_ram(mr);
> +}
> +
>  int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
>  {
>      RAMBlock *block;


