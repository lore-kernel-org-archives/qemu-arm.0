Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A6DCD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 17:24:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL2SE-0002p0-RW; Thu, 07 May 2026 13:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL2SC-0002o8-Nr
 for qemu-arm@nongnu.org; Thu, 07 May 2026 13:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL2SA-0002TW-4Q
 for qemu-arm@nongnu.org; Thu, 07 May 2026 13:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778174640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+Dy0rDw03bCuXXYTGyTwCG/lFo+pNsm0eO/jf2GXb8=;
 b=JpeJfffA16s7VAna7mTrkMiTzw3pvD/TsaU8jrlUJ2qz0fkRynsm2O3l1LjHyFjKm637TV
 4Lk+d6BrA6F78wzRrBMohW0Q/FsKr57Ean7TJhRtRLibID65yYwp7E+jKbhWHSud7UTcH7
 UflnU4kv382461f+cQZ5aYvouv2sc4s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-j_qI2vPpNRitomxaCdnyPw-1; Thu, 07 May 2026 13:23:59 -0400
X-MC-Unique: j_qI2vPpNRitomxaCdnyPw-1
X-Mimecast-MFC-AGG-ID: j_qI2vPpNRitomxaCdnyPw_1778174638
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ba5520bee9dso104268266b.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 10:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778174638; x=1778779438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+Dy0rDw03bCuXXYTGyTwCG/lFo+pNsm0eO/jf2GXb8=;
 b=fu7MOwlXtlURvP+LAEGt6IVmVRCtrwrA23qQLxOSrnM7IVec861lBXZmPCJ6jRO6vH
 HXvQFxSxEkVqRdomFwTAQMzNq7G6RTTUu+sZxcte72BIWbuJbIHKQLi4eJPgtoPhx+oc
 frs1RiTlNZu8rbBgLKZ1gX0eGXyNXRbb7FLwytvRDZZZNYT9ZcbqqgGATtjEEoGtqL9t
 MQpUm0VP0eKFZJykQxIgFDPvUVONObxF6e9dYopmNvsuICyJdZt99U+FUw8gXnUGLzHB
 +MtezPFw0WPoIptcFDhH6dKpMl/PqjZRexSpRjP2PTXjGw6kOBUpVGTdprzJ5XvCo7Tw
 HJJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/67lnnBCaBK+En4IpwMmFEwgYaotr69EbYKFbaNl5bdSY/JBLTxdfxb/4a+AWC44Ewy4h8Lu5LIw==@nongnu.org
X-Gm-Message-State: AOJu0Yx9jbL5w1m3s4wnTZaH8zQZML8ixJ38g/CNkyRBqp80vxgwIpsN
 McxfNKWQYLuJORH6iiDEYAsPnMXT6+leNkpmOvbpXzj9bVFx0VAaII8WwFjHRRyy9BZAXVJXyMe
 CrkfLL8MlHEDN1wm3FJcZPxx2HBvgGuVb8w2UCPLghi6qBHvcQRG1KQ==
X-Gm-Gg: AeBDieuyLtcm4zXtDwZ3PxH/Tv9ZpdrqOdCbqSQSNumMQPaPeip98IgI/Fg9MtXU1kF
 v+MB9NLHWOS64GThpQwXJA67SwE5tnrjOxBskpKRlBNYqKKOwMcdjs/02N8TI8Icw3V6cJHzNFG
 z2h3W5JfhKjsgKWeDB0Ip2v6ht3Z3QMOjWXpEeBBu3+1Kn2qAlD6LgLcCYgXWXqIjLKvSFATW0N
 rLX0twf82hm5aTVsREZP2FW6Sarl/kdBwAkOOEk8Vc5t+4Wc+xfI97Qeiay/wjucGh0nh5/0fxu
 9mGnik+z069FKwnfiantLESV4h/seAzK1UwAYcgZEMLIsYS9RjYL5NN8/kEspN2KinDY5TkRGuF
 mMHGuWJqD5Wm69/H+B5MVzzkUgyXMJiQ4r3cM3Dkygtoygip15Nbab8j9aTwnfsIk00YIGQ==
X-Received: by 2002:a17:907:3cd6:b0:bb8:fd89:4a74 with SMTP id
 a640c23a62f3a-bc56b12645cmr546539366b.14.1778174637659; 
 Thu, 07 May 2026 10:23:57 -0700 (PDT)
X-Received: by 2002:a17:907:3cd6:b0:bb8:fd89:4a74 with SMTP id
 a640c23a62f3a-bc56b12645cmr546534666b.14.1778174636829; 
 Thu, 07 May 2026 10:23:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bca57eaec7csm10137066b.46.2026.05.07.10.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 10:23:56 -0700 (PDT)
Message-ID: <e7a172be-41b4-40c8-8b1b-2814450d110a@redhat.com>
Date: Thu, 7 May 2026 19:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/31] hw/arm/tegra241-cmdqv: Limit queue size based on
 backend page size
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-27-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-27-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RfNAWEMss43fgf3toFU7g8D3iIVPgpiEtwlc6WV35Wc_1778174638
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
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

Hi Shameer,

On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> CMDQV HW reads guest queue memory in its host physical address setup via
> IOMMUFD. This requires the guest queue memory is not only contiguous in
> guest PA space but also in host PA space. With Tegra241 CMDQV enabled, we
> must only advertise a CMDQS that the host can safely back with physically
s/a CMDQS/ a command queue size (CMDQS)
> contiguous memory. Allowing a queue larger than the host page size could
a queue size
> cause the hardware to DMA across page boundaries, leading to faults.
>
> Walk the RAMBlock list to find the smallest memory-backend page size, then
> limit IDR1.CMDQS so the guest cannot configure a command queue that exceeds
what is the minimal CMDQS required? 
> that contiguous backing. Fall back to the real host page size if no
> memory-backend RAM blocks are found.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index af68add2f0..2870886783 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -14,6 +14,9 @@
>  #include "hw/arm/smmuv3.h"
>  #include "hw/core/irq.h"
>  #include "smmuv3-accel.h"
> +#include "smmuv3-internal.h"
> +#include "system/ramblock.h"
> +#include "system/ramlist.h"
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
>  
> @@ -646,9 +649,38 @@ free_viommu:
>      return false;
>  }
>  
> +static size_t tegra241_cmdqv_min_ram_pagesize(void)
shouldn't we put that rather in system/physmem.c
there we also have qemu_ram_pagesize_largest() for instance

> +{
> +    RAMBlock *rb;
> +    size_t pg, min_pg = SIZE_MAX;
> +
> +    RAMBLOCK_FOREACH(rb) {
> +        MemoryRegion *mr = rb->mr;
> +
> +        /* Only consider real RAM regions */
> +        if (!mr || !memory_region_is_ram(mr)) {
> +            continue;
> +        }
> +
> +        /* Skip RAM regions that are not backed by a memory-backend */
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
>  static void tegra241_cmdqv_init_regs(SMMUv3State *s, Tegra241CMDQV *cmdqv)
>  {
>      int i;
> +    size_t pgsize;
> +    uint32_t val;
>  
>      cmdqv->config = V_CONFIG_RESET;
>      cmdqv->param = FIELD_DP32(0, PARAM, CMDQV_VER, CMDQV_VER);
> @@ -681,6 +713,15 @@ static void tegra241_cmdqv_init_regs(SMMUv3State *s, Tegra241CMDQV *cmdqv)
>          cmdqv->vcmdq_base[i] = 0;
>          cmdqv->vcmdq_cons_indx_base[i] = 0;
>      }
> +
> +    /*
> +     * CMDQ must not cross a physical RAM backend page. Adjust CMDQS so the
> +     * queue fits entirely within the smallest backend page size, ensuring
> +     * the command queue is physically contiguous in host memory.
> +     */
> +    pgsize = tegra241_cmdqv_min_ram_pagesize();
> +    val = FIELD_EX32(s->idr[1], IDR1, CMDQS);
> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS, MIN(ctz64(pgsize) - 4, val));
>  }
>  
>  static void tegra241_cmdqv_reset(SMMUv3State *s)
Eric


