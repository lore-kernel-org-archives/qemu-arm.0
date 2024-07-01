Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1571819njm;
        Mon, 1 Jul 2024 13:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPlR0mWy+ZDRWLA9x0wlOjEpqgqxSY7sEipgPJV5ZxURerePeojY5LW/s3r334jRGaoKBGsyiSWTepZCRqMeqLkNGPzH/+
X-Google-Smtp-Source: AGHT+IHJeQcHNaWaTR/EutDS0dVWvK0UQvxKLwmDj4IaCcqWvPG8v5/fm4I5OPfHIIIU2KnyO98d
X-Received: by 2002:a05:620a:4011:b0:79d:554d:731f with SMTP id af79cd13be357-79d6baa4709mr1634073585a.29.1719864528410;
        Mon, 01 Jul 2024 13:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719864528; cv=none;
        d=google.com; s=arc-20160816;
        b=LKof9eYYANuuiDaQtvQ08l1nynZsJrBpzPB888TUDRR2E1fRzrUxHHWw1Uv2vVmAR1
         EN2sIsjA9Pyo1n5TAlssQtfShOQv9bKgCUKjEoO702PDV/lmbarxKOfqhOt0HHZOdtmK
         9NZ/MyFIgaEhcrctRxIwjmy6jszL7f/OE5VzS6Bv8Zj3VWaLVcOIVF91R3CCsx6uFg/y
         wVgCkmC3RngC7GgZZ1OXgwjuD8zHWcgVwltEbVW8jS4g+DBTM6qm2YCTjIU/nEImV1y5
         8mESMdMh2yMOLGJKnnGiuXCp6MHy+Q7K1p472vgDRGZLRDoTWB+E7AkvhEtUFjzP2usn
         i4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9lWbyZwchYtAOT8Zdf/tSo6hD879WtfwPr9e9f4EYjc=;
        fh=oG5TAraZilCLqI+KAsPBB5qCtj8UiuxlParTjj7YcfY=;
        b=GMObskGBbRfjQrDkgTLRVwpMwRAHCilSRvgIH5vQQd5gS9LHfmfnWc24uZOQJXDOcy
         9TWqMTlvGEDuiEYROksaUtupq+lWcQqYt3XyD/SVBusaLSX7S/hAKKpdv7rqlc+g6rGZ
         KIE/2OSmstZlshhap1DqJ/K/RxT2FHnQ8greAaxAXK7e9y0a/qM+8Rge4TpHJhdJ5J07
         zS83tEg7udmcXQCsa6rCn9CH5SVgv6toJrwaRVIGaK9s7u/XkIn7yKHLZ2jeWzatHNz/
         VLM2u5nx2LP8Q85LWTRxCVc3taQTZCIgqT/yQwpnbtHeTBh8R5WsU6c6WzWCqwR68hge
         ftKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SWU+KmOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f0126si959032585a.328.2024.07.01.13.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 13:08:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SWU+KmOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sONK2-0000wu-Fx; Mon, 01 Jul 2024 16:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sONJu-0000ur-Nk
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 16:08:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sONJs-0006in-DA
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 16:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719864489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9lWbyZwchYtAOT8Zdf/tSo6hD879WtfwPr9e9f4EYjc=;
 b=SWU+KmOYfmeIurhRYU/RvkHHSbx9rtLUakjiWipEPj5M88+9d/FNqXhRhia0B6Ce5axQ30
 EYYCF0ZgX1yaw4DqbS0fabr3ZGVKyLcgpbpmN4Nha3X0LCASWCm4pCPwWumDiVe8KAGojP
 ViHNfFKYRmnWJt1V3H7EfhwzawFqlLg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-njc81i43Pr-e-4-TgHV4vg-1; Mon, 01 Jul 2024 16:08:07 -0400
X-MC-Unique: njc81i43Pr-e-4-TgHV4vg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3673ce35cc7so1963800f8f.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 13:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719864485; x=1720469285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lWbyZwchYtAOT8Zdf/tSo6hD879WtfwPr9e9f4EYjc=;
 b=Zy/1DsnzW9DQpWcNQfw+zQn/AMDpBBPDTgSrF5/ivB1rkSteBAAPXVRhwFIGlSK9Df
 z7cc52aaKrIybfzzkyCBvzyScjS5YuWgWscHgdczFZPfJO7188InmpLeis0Y43GX/IC0
 ZBZdLZaldfYXLxZmcjC8Hi3K/8NbOgCgivMzkUh2SZkCp+LIJJjey8yjhmFx/3BjvuQI
 yLzzQr+1Q4siO2C9zFnR3dPEigv4Sa7UWTFc9kGyeBmh4mkXapDr9x3y2UL67jz2XG8I
 lZj2kMd/RQtumE3MtPL7rZcC/VQ/7e5GE0ohEVOT7VVbwd4YmrNpJg7+77MvRFYKQn+j
 NLoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoWWc1C3ehGcAXmJz0F9fpYLyDcu5KHPThTJzVdF/AE1qduDbNfTbWYSEcGU0QKZ2cm0a3A5qUoZADrWzcK2bVuiyG
X-Gm-Message-State: AOJu0YxT5/bgZDmF2UWYpbThZ7SJsMfl7RhPHFPzJ+CUStTEZLpWqVT/
 K/mNmu9Vh/4CF66CGDQF4bGFmXOnixgG7Zj3Kqhlw2wXwojg7/YZ9Tp31N3pprydmXewWaKlAsY
 C52MFq+kySn/SaH7PLYB5VhTkb56efOtPCm8LCfdT5PH9+39xBzpEJ4P/Ug==
X-Received: by 2002:a5d:6890:0:b0:360:9436:b928 with SMTP id
 ffacd0b85a97d-367756aae29mr4569356f8f.27.1719864485589; 
 Mon, 01 Jul 2024 13:08:05 -0700 (PDT)
X-Received: by 2002:a5d:6890:0:b0:360:9436:b928 with SMTP id
 ffacd0b85a97d-367756aae29mr4569340f8f.27.1719864484972; 
 Mon, 01 Jul 2024 13:08:04 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1129ccsm10964601f8f.117.2024.07.01.13.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:08:04 -0700 (PDT)
Date: Mon, 1 Jul 2024 16:07:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: Re: [PATCH 0/7] VIRTIO-IOMMU/HostIOMMUDevice: Fixes and page size
 mask rework
Message-ID: <20240701160734-mutt-send-email-mst@kernel.org>
References: <20240626082727.1278530-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240626082727.1278530-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RM55cpnpQDPs

On Wed, Jun 26, 2024 at 10:26:45AM +0200, Eric Auger wrote:
> The 2 first patches are fixes of
> cf2647a76e ("virtio-iommu: Compute host reserved regions")
> They can be taken separately of the rest.
> 
> Then the series uses the HostIOMMUDevice interface to fetch
> information about the page size mask supported along the assigned
> device and propagate it to the virtio-iommu. This is a similar
> work as what was done in
> 
> VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling series
> 
> but this time for the page size mask. Using this new
> infrastructure allows to handle page size mask conflicts
> earlier on device hotplug as opposed to current QEMU
> abort:
> 
> qemu-system-aarch64: virtio-iommu virtio-iommu-memory-region-8-0
> does not support frozen granule 0x10000
> qemu: hardware error: vfio: DMA mapping failed, unable to continue
> 
> With this series the hotplug nicely fails.
> 
> Also this allows to remove hacks consisting in transiently enabling
> IOMMU MRs to collect coldplugged device page size mask before machine
> init. Those hacks were introduced by
> 
> 94df5b2180d6 ("virtio-iommu: Fix 64kB host page size VFIO device
> assignment")
> 
> The series can be found at:
> https://github.com/eauger/qemu/tree/virtio-iommu-psmask-rework-v1


virtio things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge.

> 
> Eric Auger (7):
>   virtio-iommu: Fix error handling in
>     virtio_iommu_set_host_iova_ranges()
>   vfio-container-base: Introduce vfio_container_get_iova_ranges() helper
>   HostIOMMUDevice : remove Error handle from get_iova_ranges callback
>   HostIOMMUDevice: Introduce get_page_size_mask() callback
>   virtio-iommu : Retrieve page size mask on
>     virtio_iommu_set_iommu_device()
>   memory: remove IOMMU MR iommu_set_page_size_mask() callback
>   virtio-iommu: Revert transient enablement of IOMMU MR in bypass mode
> 
>  include/exec/memory.h                 |  38 --------
>  include/hw/vfio/vfio-container-base.h |   9 ++
>  include/sysemu/host_iommu_device.h    |  11 ++-
>  hw/vfio/common.c                      |   8 --
>  hw/vfio/container-base.c              |  15 ++++
>  hw/vfio/container.c                   |  16 ++--
>  hw/vfio/iommufd.c                     |  21 +++--
>  hw/virtio/virtio-iommu.c              | 121 +++++++++++++-------------
>  system/memory.c                       |  13 ---
>  hw/virtio/trace-events                |   2 +-
>  10 files changed, 117 insertions(+), 137 deletions(-)
> 
> -- 
> 2.41.0

