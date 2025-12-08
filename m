Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD864D3B7EA
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Dec 2025 17:06:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSegV-0004C8-B8; Mon, 08 Dec 2025 12:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSegQ-0004B6-KA
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:05:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSegP-0000sj-5g
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765213556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oIqYp8nt9HwkAw0iwJrM52KL5fAudO3SIU5ltgMSlE=;
 b=TXSJ/klImrlDdwNDyGd6sxRUD8JOFdYkWh+b5pvdDpseJjYI+ezVDD/jEYX0/8fFaHbWEN
 sSPxbZt31Krpe88WdVqQntWzzR4KDK2/y2QVJBfzn7opQDOlnjXowB2BmYBX55bDlfvAy/
 9CNNQmOC0JTAWjlAwyzLt4az0b4UR+o=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-U7zJydBROCqv277q-5OHtg-1; Mon, 08 Dec 2025 12:05:55 -0500
X-MC-Unique: U7zJydBROCqv277q-5OHtg-1
X-Mimecast-MFC-AGG-ID: U7zJydBROCqv277q-5OHtg_1765213555
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edaf9e48ecso124515831cf.0
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 09:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765213554; x=1765818354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0oIqYp8nt9HwkAw0iwJrM52KL5fAudO3SIU5ltgMSlE=;
 b=iiop84481aHZIGJm9YcbBu2cmpbPLFdOtx8X1bmcW1BT5IvfVqavXL0/rqARRb+NRc
 /sNcQFTxlsD0HFWvY/xTq0tnO5weG+HhhB4OP/TVLd4SWC8WSM/mXjPEdCruIXwtD+Pz
 C9/Zh8nCIN0JWt2a2NcvqLuv6kmCiBwJeLRFRqpkl8ui77cPFUfc0ngDIV0caGG+qbOA
 rVZZhMIEmkvDSYSNwGEWnaSzp5PVEnJI9Hk91rjyTWCUmVIFQr3sIXI1nWLu4zTiElHV
 zrBjtXvL9JVLUp4udzN7GmDuq0jsanlylkD9dE/EjRni2ax52NGfKIoZjWwOVhjSDo6A
 aUdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYL/TaK78uFS1h2057KQmlJz9vqw7RV03+nLD/E2NWdZdXZ3ApG4o4YqlGn2RXKjaG3c/Az/hkgQ==@nongnu.org
X-Gm-Message-State: AOJu0YwiAIxy/5cHx4TRabBD4aWRLqU9ElbWq77ju8zSpL3on9tifwA7
 uSLVPzoe94ZiZnAz25BMzUJ0bWJYDEc+iul9TgxtGhngRV3FLRo/BLTtAsKSWrbwVDKAZ8R3757
 yqac1VUq4RwLYWwJ7p6+U9Lg5hUlz9XNu82MHtG+cZBvddaqHe3JCx0vt5P1+dQ==
X-Gm-Gg: ASbGnctobwrQOwgO9IJLS3RydzyqKfw0oizObKNdN6mskQX5m9Mw7IR0jxyXbHqERux
 NC+/RBDew0OvVYsFDqKB3Uq/n+e3N6bZu0CuGSnZg+ibuuHcTg7Hzmf5kUvTAkkGdMt6G7qeIrB
 IJMo8xbympKWvtKA8etcgmswWxrvblVYwWqz7BZjuLyo1ClLTr03q8RkvVDr4h/SbF7tet8LEhi
 zMKC31/q/giQmHbVJQ/y0ev6xVYA5qtwKNEpuuPtVZDFQ/bgU9IyzO7bZJunBPUMvKGMus6rk/R
 ETOelcqjkQyeeUbe5AZk+HFOzhmplAWbT3rrD4UGq6/oa+lLkXTmZeccYH7R+4frYHFzzScDFnm
 sJjYI4zNYDZAmG3YJPyIG8TR+DNygrhAaTGP4w+fU8k2UvKetoWTvznwnnA==
X-Received: by 2002:ac8:5dc7:0:b0:4ee:c1a:f11f with SMTP id
 d75a77b69052e-4f03ff7338fmr117525921cf.84.1765213554528; 
 Mon, 08 Dec 2025 09:05:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCmxDXpHaIT0JVx/vCk61Ut6Ru1DZmZZRRYJBnPLB4LPP4pskD7VfmeMBd0RsrBYryc3S82A==
X-Received: by 2002:ac8:5dc7:0:b0:4ee:c1a:f11f with SMTP id
 d75a77b69052e-4f03ff7338fmr117525581cf.84.1765213554196; 
 Mon, 08 Dec 2025 09:05:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f0276b4f64sm88063521cf.13.2025.12.08.09.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 09:05:53 -0800 (PST)
Message-ID: <af520875-aae6-4869-a22e-96e057bbf8fa@redhat.com>
Date: Mon, 8 Dec 2025 18:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/33] hw/arm/smmuv3-accel: Initialize shared system
 address space
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251120132213.56581-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nG5OffRJuyPxcG-bdUVw0ImMWh_lHkU8UGeFyiQmudM_1765213555
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



On 11/20/25 2:21 PM, Shameer Kolothum wrote:
> To support accelerated SMMUv3 instances, introduce a shared system-wide
> AddressSpace (shared_as_sysmem) that aliases the global system memory.
> This shared AddressSpace will be used in a subsequent patch for all
> vfio-pci devices behind all accelerated SMMUv3 instances within a VM.
>
> Sharing a single system AddressSpace ensures that all devices behind
> accelerated SMMUv3s use the same system address space pointer. This
> allows VFIO/iommufd to reuse a single IOAS ID in iommufd_cdev_attach(),
> enabling the Stage-2 page tables to be shared within the VM rather than
> duplicated for each SMMUv3 instance.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 99ef0db8c4..b2eded743e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -11,6 +11,14 @@
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-accel.h"
>  
> +/*
> + * The root region aliases the global system memory, and shared_as_sysmem
> + * provides a shared Address Space referencing it. This Address Space is used
> + * by all vfio-pci devices behind all accelerated SMMUv3 instances within a VM.
> + */
> +static MemoryRegion root, sysmem;
> +static AddressSpace *shared_as_sysmem;
> +
>  static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
>                                                 PCIBus *bus, int devfn)
>  {
> @@ -51,9 +59,27 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_address_space = smmuv3_accel_find_add_as,
>  };
>  
> +static void smmuv3_accel_as_init(SMMUv3State *s)
> +{
> +
> +    if (shared_as_sysmem) {
> +        return;
> +    }
> +
> +    memory_region_init(&root, OBJECT(s), "root", UINT64_MAX);
> +    memory_region_init_alias(&sysmem, OBJECT(s), "smmuv3-accel-sysmem",
> +                             get_system_memory(), 0,
> +                             memory_region_size(get_system_memory()));
> +    memory_region_add_subregion(&root, 0, &sysmem);
> +
> +    shared_as_sysmem = g_new0(AddressSpace, 1);
> +    address_space_init(shared_as_sysmem, &root, "smmuv3-accel-as-sysmem");
> +}
> +
>  void smmuv3_accel_init(SMMUv3State *s)
>  {
>      SMMUState *bs = ARM_SMMU(s);
>  
>      bs->iommu_ops = &smmuv3_accel_ops;
> +    smmuv3_accel_as_init(s);
>  }


