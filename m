Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp19124ejb;
        Wed, 18 Oct 2023 12:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGrJWenZrc42heV/qRC5DPQmsMNHDHrkSBVRuNGg9yCsxkI2/dao7MmzoTdw9VhpUJBrR
X-Received: by 2002:ad4:5bce:0:b0:66d:78c8:262b with SMTP id t14-20020ad45bce000000b0066d78c8262bmr437198qvt.4.1697656076456;
        Wed, 18 Oct 2023 12:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697656076; cv=none;
        d=google.com; s=arc-20160816;
        b=cRUDU2cVImEoIlVwjxg23dvtlJQt9j1SLC7I8Mu4oCT0n9UB1zDXTB/zXiY+yeXfYM
         DVLsHyG/LgnPS2X6+K+f7v2uTnLE+ov5+5lh296ceBKtdtBGCOwOWTuW9YAnPDw5KPNK
         iItiNNk1SiYXhnOkuARHdM/+jErpLBIZ+MPNsOir1hIry5fcID1NaQOD8yQ8hZ+DnK7q
         vmxrZBvvc5iw6ZGCKzmsP3kyo9nX+WDrmiuR7obGZ9f6w4bciUuwaVj3HO0bkV1oacyH
         EwwnHFkZ/TFFSIqAHf+aG6trJGmGwwXM5L4azzyWo1QdZd7mYVP9dwsB9UxtfHIgd93X
         p4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OtLAGwEmzwXMW0eTnsLgGCNwhbx7LVbuUhIXl2K1ExI=;
        fh=TaqXyZoMCOPkM2Dr/MLCO/qxTHqW8F9GBijVcrBhWXc=;
        b=pSpkcrQrW2TWaX1r8nljXAbmb5ezh8KOjWjyj8MPv5AVo+8SK2O6wGfGFYZ+d+hz9b
         NdcZADyB5CbW3XBeExAFHPs4iM5oDLyBqD7vIrv3udHvIxl9LlDz+0n0nZF5ucKDUV1q
         DdA+TgRTuX+ebhYEHI5KaWqSDyBBSuHgRE67IUbI11waMedQ+gp7wmf76/XXL0Pc/I4g
         56NVfjAt5gvbWNqwCSs5uLshlmEyvH8joQvFdZI2X5iVv/ezqVblNP9PH1Ges8Mabc+0
         2MOatN8KakLiUtyXmKKhwQEiUgOrJeyr2LEKzIGyd/i2aixBL2UQN+cS2B2Bb3DimZ+U
         VENA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CkVgmupm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05620a0f8500b007758fab8c64si370302qkn.518.2023.10.18.12.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 12:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CkVgmupm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtBtU-0007UG-Tt; Wed, 18 Oct 2023 15:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qtBtS-0007JH-0J
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 15:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qtBtQ-0001iC-78
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 15:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697656061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtLAGwEmzwXMW0eTnsLgGCNwhbx7LVbuUhIXl2K1ExI=;
 b=CkVgmupmdV8Tss4DQtkQdmuQ/RBCa06WZWk1lHn79muKeSjWBxJt0x8CAxAAc4Tu8cG5fi
 Id/VAYALmuAlXGKE2iQCYWvn9JY2/zYpO2sXACdYOGSS3Vmrrs/2dCUU5hqRVlVrRm5zrq
 rOxzyYgd5E95TBB70sgdTpy/gAE0PZc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-u9qdEee3NUijMaVtbH26Ow-1; Wed, 18 Oct 2023 15:07:40 -0400
X-MC-Unique: u9qdEee3NUijMaVtbH26Ow-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3574413823eso70585ab.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 12:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697656059; x=1698260859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OtLAGwEmzwXMW0eTnsLgGCNwhbx7LVbuUhIXl2K1ExI=;
 b=is0c5Z5S5fZjB/B+2WEw1g7KbCPnGfPbNXuZ3Yfj6zUJ140z78hQzbzYaUUu1gQp1l
 7Du0TQuuwnatBstSo2omhaGYzvurYEsQsrbMdYmkmmp2HHzFVorhk5aHJHy9B2YpThwu
 nKLmAdXUyPimfc53jKGiuJyPR8Pwt+SGpYtAsCnQdX2ponSOTo8zOe404aoeBbdshcZQ
 UjgbsmxnnKK3cBW+TM1p39cs08/y/xa1eZY2q36NS6nI9/ALM0R9Bp+njj/NjwG6Ayyn
 xNVx6ZW3Y64LKWyoSoRQusGy85/ljJ/K32vaZBW3ZdQOxyaFBwLSmIDXTzqn7CKB8gcJ
 hoyg==
X-Gm-Message-State: AOJu0Yzk4VL3n8bsWnkagt9bExqSt1tk7qN1sOspKUV2MLdi5nBZpjji
 /H0Rjqvgy+6IRh3ECN1zM+nWifxyzmj55kkGNGeotzgbvdvpw/HPeDqC6U5ldF8oFPBwGmtMFv9
 VjfepEO+7C1WI
X-Received: by 2002:a05:6e02:1b81:b0:357:5c29:18ec with SMTP id
 h1-20020a056e021b8100b003575c2918ecmr6423701ili.1.1697656059598; 
 Wed, 18 Oct 2023 12:07:39 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b81:b0:357:5c29:18ec with SMTP id
 h1-20020a056e021b8100b003575c2918ecmr6423676ili.1.1697656059215; 
 Wed, 18 Oct 2023 12:07:39 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 h12-20020a056638062c00b00459d7c3dcf3sm1353701jar.115.2023.10.18.12.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 12:07:38 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:07:37 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, zhenzhong.duan@intel.com,
 yi.l.liu@intel.com
Subject: Re: [PATCH v3 03/13] vfio: Collect container iova range info
Message-ID: <20231018130737.3815d3c4.alex.williamson@redhat.com>
In-Reply-To: <20231011175516.541374-4-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231011175516.541374-4-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3SxrBVuwggNu

On Wed, 11 Oct 2023 19:52:19 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Collect iova range information if VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
> capability is supported.
> 
> This allows to propagate the information though the IOMMU MR
> set_iova_ranges() callback so that virtual IOMMUs
> get aware of those aperture constraints. This is only done if
> the info is available and the number of iova ranges is greater than
> 0.
> 
> A new vfio_get_info_iova_range helper is introduced matching
> the coding style of existing vfio_get_info_dma_avail. The
> boolean returned value isn't used though. Code is aligned
> between both.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - Turn nr_iovas into a int initialized to -1
> - memory_region_iommu_set_iova_ranges only is called if nr_iovas > 0
> - vfio_get_info_iova_range returns a bool to match
>   vfio_get_info_dma_avail. Uniformize both code by using !hdr in
>   the check
> - rebase on top of vfio-next
> ---
>  include/hw/vfio/vfio-common.h |  2 ++
>  hw/vfio/common.c              |  9 +++++++
>  hw/vfio/container.c           | 44 ++++++++++++++++++++++++++++++++---
>  3 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 7780b9073a..848ff47960 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -99,6 +99,8 @@ typedef struct VFIOContainer {
>      QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
>      QLIST_ENTRY(VFIOContainer) next;
>      QLIST_HEAD(, VFIODevice) device_list;
> +    int nr_iovas;
> +    GList *iova_ranges;

Nit, nr_iovas seems like it has a pretty weak use case here.  We can
just test iova_ranges != NULL for calling set_iova_ranges.  In patch 13
we can again test against NULL, which I think also negates the need to
assert nr_iovas since the NULL test automatically catches the zero
case.  Otherwise

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

>  } VFIOContainer;
>  
>  typedef struct VFIOGuestIOMMU {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5ff5acf1d8..9d804152ba 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -699,6 +699,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
>              goto fail;
>          }
>  
> +        if (container->nr_iovas > 0) {
> +            ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
> +                    container->iova_ranges, &err);
> +            if (ret) {
> +                g_free(giommu);
> +                goto fail;
> +            }
> +        }
> +
>          ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
>                                                      &err);
>          if (ret) {
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index adc467210f..5122ff6d92 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -382,7 +382,7 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
>      /* If the capability cannot be found, assume no DMA limiting */
>      hdr = vfio_get_iommu_type1_info_cap(info,
>                                          VFIO_IOMMU_TYPE1_INFO_DMA_AVAIL);
> -    if (hdr == NULL) {
> +    if (!hdr) {
>          return false;
>      }
>  
> @@ -394,6 +394,33 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
>      return true;
>  }
>  
> +static bool vfio_get_info_iova_range(struct vfio_iommu_type1_info *info,
> +                                     VFIOContainer *container)
> +{
> +    struct vfio_info_cap_header *hdr;
> +    struct vfio_iommu_type1_info_cap_iova_range *cap;
> +
> +    hdr = vfio_get_iommu_type1_info_cap(info,
> +                                        VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE);
> +    if (!hdr) {
> +        return false;
> +    }
> +
> +    cap = (void *)hdr;
> +
> +    container->nr_iovas = cap->nr_iovas;
> +    for (int i = 0; i < cap->nr_iovas; i++) {
> +        Range *range = g_new(Range, 1);
> +
> +        range_set_bounds(range, cap->iova_ranges[i].start,
> +                         cap->iova_ranges[i].end);
> +        container->iova_ranges =
> +            range_list_insert(container->iova_ranges, range);
> +    }
> +
> +    return true;
> +}
> +
>  static void vfio_kvm_device_add_group(VFIOGroup *group)
>  {
>      Error *err = NULL;
> @@ -535,6 +562,12 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
>      }
>  }
>  
> +static void vfio_free_container(VFIOContainer *container)
> +{
> +    g_list_free_full(container->iova_ranges, g_free);
> +    g_free(container);
> +}
> +
>  static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>                                    Error **errp)
>  {
> @@ -616,6 +649,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container->error = NULL;
>      container->dirty_pages_supported = false;
>      container->dma_max_mappings = 0;
> +    container->nr_iovas = -1;
> +    container->iova_ranges = NULL;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>      QLIST_INIT(&container->vrdl_list);
> @@ -652,6 +687,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>          if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
>              container->dma_max_mappings = 65535;
>          }
> +
> +        vfio_get_info_iova_range(info, container);
> +
>          vfio_get_iommu_info_migration(container, info);
>          g_free(info);
>  
> @@ -765,7 +803,7 @@ enable_discards_exit:
>      vfio_ram_block_discard_disable(container, false);
>  
>  free_container_exit:
> -    g_free(container);
> +    vfio_free_container(container);
>  
>  close_fd_exit:
>      close(fd);
> @@ -819,7 +857,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>  
>          trace_vfio_disconnect_container(container->fd);
>          close(container->fd);
> -        g_free(container);
> +        vfio_free_container(container);
>  
>          vfio_put_address_space(space);
>      }

