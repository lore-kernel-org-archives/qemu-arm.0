Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1596001njm;
        Mon, 1 Jul 2024 14:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFg41/ZPWaxbl7T/5PmK0+6lcUqPjuuH8SbNbShHf2H9Pv7ckr8v+7/ONZuBhpHD+204bq6o0C4NoJz/+t6XyWB3mFgDc7
X-Google-Smtp-Source: AGHT+IFfq1wge08d4kSh5x8UR0MxDy4qgogYBZ7H9k5tMGWOh83pvNih0T4SMOO04vh5yttd/rtG
X-Received: by 2002:a05:6214:1bcc:b0:6b0:7f36:8ae1 with SMTP id 6a1803df08f44-6b5b7184c4cmr101613176d6.52.1719868495673;
        Mon, 01 Jul 2024 14:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719868495; cv=none;
        d=google.com; s=arc-20160816;
        b=OB6jnRZ+V9+E8xQYcRp4elfNMAI93Y0dPm+GcuaHR5YYr1dmdl1qSfWtqIFvpOq2kP
         8d/19hKkNzcIzioCdOM8jM6Z8bxLDoT56VdlqhX0m8B4PMcBi0zBn6EkuqS+xOVFx5GV
         6lHmYh3mNQHL+mF/vXG/Qu2Q5DZ6Yb5Dz2KtIlCajAvdCR3MAltFw8SQ84S9/0eIpoSb
         Jl8Q/OreMleyewTW7FrwO3WQgNYjO+ZgFySc1xXmj5C6u9F6hGW4a9+HTvzcET9FqxMT
         vkEd3xiLD2UYzjg+mH3gMAuPwvDyTTpjXQIugVgXxTa9CJsVzft+EbWH+SHmJmm1jmgc
         b7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=3fY9NGJXUfh+G8Fe4Rnm80jIH0RR/F/rmrmGUiwg7dk=;
        fh=Ey7csb7YIc8MiEpziXLF6GUju9dUUx3tdnCLP1sTF+g=;
        b=CBVqYqYXU2cibKS8aYJGkXamqI6nq+nxOxWBU81A6DM0N+4VXZnaZoh6qPcPlpofCd
         7RAiw5IHpNLQkFso6JpmShXUVB+nDHfUoaimNV+4TXjw679vo8K+HuV46ijMoHox0lrc
         MLJTWZEo9hy1B48xkvP4cg7URnG2Vyhgruw8c+XUUwHwuz3VGqGUcLiDeVfgcP7kqP54
         JT6oY7BTia/4GhvfFhEwQQruSaz/orG3OmferGYVAS2FXLinNiklwLGD9XCU6nX5ni76
         RifEnA/86kdVLmuZ9DdYohaL35enR4/JxDcLHyJlTXNc6HGtEm8EneYaBNBksDkJ0XEL
         djdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g3hSP/8W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e60a73bsi91333876d6.462.2024.07.01.14.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 14:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g3hSP/8W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOOMM-0007EQ-Ry; Mon, 01 Jul 2024 17:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sOOMM-0007EG-0N
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 17:14:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sOOMK-0007Q6-2M
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 17:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719868486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fY9NGJXUfh+G8Fe4Rnm80jIH0RR/F/rmrmGUiwg7dk=;
 b=g3hSP/8WNaVuO50mjyIIpsslZh/ioMyoBuIxxy3OZ13UyDFWqKvWkla72VjF3R5IdDy7d8
 fE5p725UU5rUm68fGQ1z5L5zucMS+XeI7oT2oJ9kd7kYolvu2ttAtNqQpp870Q1OTRMYqe
 9eb1ABWgBex2KEUahQI+ShRMEbT6WCA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-ZBipVUfUNW6Sij7nzoksNQ-1; Mon, 01 Jul 2024 17:14:44 -0400
X-MC-Unique: ZBipVUfUNW6Sij7nzoksNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4256569a4faso23024205e9.1
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 14:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719868483; x=1720473283;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fY9NGJXUfh+G8Fe4Rnm80jIH0RR/F/rmrmGUiwg7dk=;
 b=mVCeuw90olprFQ+gvWYHr9/YdVawyBFEuXaDfPzn89nfOhIqG3szl1iPa6/Mzxe0aZ
 s5QvGMFwJ5j22gfwrNc8HNAoYYEuKfH/ffiW03C9PS6aFZnw2Z654A1S3zJgNoU3vHy4
 UDuze74K3BHFE0NwYzOEHqGnZBkdAKczNI5H3j2iumMV+2ocSC7iHMSy0XaO15pqqbqE
 2OynIExCq3RZVrM4zrQV4DZd8Bg5P7f7BjZxJm9anxOYnqJGzN16ZIjpXgD9F5AsKNg6
 YIh9I/Q4g0w0yQX8nBE5hw8U27heklTJTJqnPo12QZdM0sksAQidpKkzKZSfribYb8oI
 3Mug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKGwmdrKQ14Bq3ch7RMhs2I6ELw5WAJrXVAn/2NSBGyDQrUq7PfucMa/AmHIyyGj8UYG5oasUOnHdKyYqheUSLc1yu
X-Gm-Message-State: AOJu0YwX+MYa97dXwJIXtQu0YKs9tc+BpRDD2h4RD7R0vKB0T3yi6XrY
 UeynKqNfdBPNxG+4eR5BNLE0YVJzOEAXUkHAg0aSl04aB8JYj/dumW/cmxKC1ACYuM3ljeAFH5P
 9hWdlrCdeOwbPVofUYfpqSk1yoz7T6voQuU8zP+tYay/2h8gjhw==
X-Received: by 2002:a05:600c:1c21:b0:424:8be4:f2c with SMTP id
 5b1f17b1804b1-4257984de8fmr59809435e9.2.1719868483724; 
 Mon, 01 Jul 2024 14:14:43 -0700 (PDT)
X-Received: by 2002:a05:600c:1c21:b0:424:8be4:f2c with SMTP id
 5b1f17b1804b1-4257984de8fmr59809275e9.2.1719868483153; 
 Mon, 01 Jul 2024 14:14:43 -0700 (PDT)
Received: from redhat.com ([176.12.141.208]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b068e93sm169796125e9.24.2024.07.01.14.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 14:14:42 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:14:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: Re: [PATCH v2 0/7] VIRTIO-IOMMU/HostIOMMUDevice: Fixes and page size
 mask rework
Message-ID: <20240701171314-mutt-send-email-mst@kernel.org>
References: <20240701084957.1567641-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240701084957.1567641-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
X-TUID: epedg6Bzl1no

On Mon, Jul 01, 2024 at 10:48:52AM +0200, Eric Auger wrote:
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
> https://github.com/eauger/qemu/tree/virtio-iommu-psmask-rework-v2


So presumably will be merged with rest of host iommu stuff.
For virtio bits:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> ---
> v1 -> v2:
> - Don't update mask if the granule is frozen (Zhenzhong)
> - Collected Zhenzhong's and Cédric's R-bs
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
>  hw/virtio/virtio-iommu.c              | 123 +++++++++++++-------------
>  system/memory.c                       |  13 ---
>  hw/virtio/trace-events                |   2 +-
>  10 files changed, 119 insertions(+), 137 deletions(-)
> 
> -- 
> 2.41.0

