Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2371CD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 15:53:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXhiH-0001H6-AW; Thu, 11 Jun 2026 11:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXhiG-0001Gh-47
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXhiE-0003wS-40
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781193175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edqsxyAdaMXhekp7RRkv+Sct7cvEicgqfPFTS5N1oxk=;
 b=iYjDkoeqHFO3e+OkBavAv8+FYqs/zq02CsRPXCqKWTNzhxyphMxr/k5ynigRig41EU7t3J
 jdH2mZ04J75yoVaEVxQe6Id/Kw27XHMlV90/xvPGhbIrsj2neVrX7NQsGt0YDVrSuC1sCc
 p2t6gOYSdI+mIiDV/fVekxnWMRsomWk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-XPddv-A2MQaLpbTm7SPuVg-1; Thu, 11 Jun 2026 11:52:54 -0400
X-MC-Unique: XPddv-A2MQaLpbTm7SPuVg-1
X-Mimecast-MFC-AGG-ID: XPddv-A2MQaLpbTm7SPuVg_1781193173
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-46011aa5000so3629005f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 08:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781193173; x=1781797973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edqsxyAdaMXhekp7RRkv+Sct7cvEicgqfPFTS5N1oxk=;
 b=aNd+0NZVXKVaP7V9OZR2i/kI/vfM/p1/eZxEspjXBEHY0KmR8s9HQF1Ic/iKH/YK2t
 nrOgN3VuIJKjOgOrjwPfgCe7YZ2NDmSPkscfED0UHBPjLdvH76LSb+mZMhg2rRSlxLsn
 B4H0+Il7LfTFGgx6lyUXPOYUff6BtAbOHwFTYvc/bUor80dkZS3UO2IkAiC167JbmXNA
 OV93T+LeiKaGZnmRxakzAYht/cn4V0qF1Ri6IEvfqOwGJ042fq/4qw757lmnV+xtakpE
 SvKsE4EhiuPFZgU13Yi/AHSNkAW+Wuwv/Kx9iLdmYCNhCHOwIT0HQ2oWcC05cVAmxRs/
 oUOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ibU0uGP2RkGIsIbBXCT3iaZsJ6urslDhobthCBpZyysda0SW4Ewpb8gayHAYJfULL6NpannW8vg==@nongnu.org
X-Gm-Message-State: AOJu0YwDdHEQehVqu62BtPa28W85S7qFTaamjHS9SBnH1X4H4M0U6lYu
 TnW1ENeBv7xu20KOX+Kf04T39ZyKH5JSojgrFk9jsA6yUbEiaKEWpn7ln7cXQIOQEYP9hwfX3Uy
 SHnhisajRSPihF2RTW3vimIyH7vieV4KucAToVAhio/mNrqWPh9XEfQ==
X-Gm-Gg: Acq92OHIVQBCvPgCGTmxNOZp4WrYAb101I3SwdcbsnPMif+CpK+A3Cnzvw+QR6dysyB
 bSdC9IHUmLbswGOWAxwl/6qSKYb+0wHnI+ePk+7lhrfC+cswc8sQdfxKzfbZ9CnxctXGSz95iIT
 R0D6SfaC1UohgbhjRwpGZiEFaopgpbo7dCW+U9SRZJAg4RppBfY5GZ5ZsztomDdWQktHOr6gdvK
 OEyK4yLQcmQ8vZQ4Ki+aOlKVjuttboDBf73UD5aMOYABgSg91hi8zwlOaQ1tgitNhyWe5qxv6LR
 5bT5kgo5625Cr8rIKpbpUWs2DEOt+AaQjt8YQhIQQfU8s2cwuY7XySNNEjKG5sxuSSUpK7Ri9kM
 9VaEwhVRtQsgoYt4J5I5UEnR9TKNTFbVq5k5Ijr6/DIAo9AygyvUBNcg5YNE/jffzYoLe7gzrhR
 jpfphx
X-Received: by 2002:a5d:6f0f:0:b0:460:138d:c9b3 with SMTP id
 ffacd0b85a97d-4606758d2fdmr5290002f8f.2.1781193173101; 
 Thu, 11 Jun 2026 08:52:53 -0700 (PDT)
X-Received: by 2002:a5d:6f0f:0:b0:460:138d:c9b3 with SMTP id
 ffacd0b85a97d-4606758d2fdmr5289938f8f.2.1781193172631; 
 Thu, 11 Jun 2026 08:52:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f67c6sm79073444f8f.16.2026.06.11.08.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:52:52 -0700 (PDT)
Message-ID: <79e43ff2-00fb-4cab-ae8a-21e5fb23d8e7@redhat.com>
Date: Thu, 11 Jun 2026 17:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/31] hw/arm/virt: Introduce Tegra241 CMDQV support
 for accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260609112552.378999-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260609112552.378999-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qldQI3xGRv_8KntokKn6zhu0xOkvqqdS36NxAmGo_xk_1781193173
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Shameer, Peter,

On 6/9/26 1:25 PM, Shameer Kolothum wrote:
> Hi,
>
> Changes from v6:
>  https://lore.kernel.org/qemu-devel/20260601114221.457995-1-skolothumtho@nvidia.com/
>
>  - Addressed v6 feedback and picked up R-by/T-by tags. Thanks!
>  - mmap the host VINTF Page0 at IOMMU_VIOMMU_ALLOC instead of on VINTF
>    enable (patch #14)
>  - Reset the per-VCMDQ Page0 cache when a queue is freed (patch #19)
>  - Distributed the reset teardown into the patches that introduce each
>    resource (patches #18, #21)
>  - Added a VCMDQ readiness helper and renamed the Page0 backing-pointer
>    helper to vintf_lvcmdq_ptr() (patches #18, #19)
>  - Trace the VCMDQ Page0 backing, hw vs cache (patch #19)
>  - Renamed patch #24 to reflect the changes accurately
>  - Updated the design and lifecycle documentation (patch #30)
>  - Based on top of Nathan's "Resolve AUTO properties" v6 series [0].
>  
> Please find the complete branch here:
>  https://github.com/shamiali2008/qemu-master/tree/master-vcmdq-v7-ext
>  
> Sanity tested on NVIDIA Grace. Further testing in progress.

Successfully tested on Grace-Hopper. Feel free to take my T-b:

Tested-by: Eric Auger <eric.auger@redhat.com>

All patches are now reviewed. Peter, please consider pulling this if you
are satisfied with it, in addition to

[PATCH v6 0/9] hw/arm/smmuv3-accel: Resolve AUTO properties <https://lore.kernel.org/all/20c8948f-1933-4410-96fc-10a2d53cb40a@redhat.com/#r>
[PATCH v2] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is called only
once per bus

( see
https://lore.kernel.org/all/20c8948f-1933-4410-96fc-10a2d53cb40a@redhat.com/)

Thanks

Eric



>
> Feedback and testing are very welcome.
>
> Thanks,
> Shameer
> [0] https://lore.kernel.org/qemu-devel/20260608174900.2227340-1-nathanc@nvidia.com/
>
> ---
> Background(from RFCv1):
> https://lore.kernel.org/qemu-devel/20251210133737.78257-1-skolothumtho@nvidia.com/
>
> Thanks to Nicolin for the initial patches and testing on which this
> is based.
>
> Tegra241 CMDQV extends SMMUv3 by allocating per-VM "virtual interfaces"
> (VINTFs), each hosting up to 128 VCMDQs.
>
> Each VINTF exposes two 64KB MMIO pages:
>  - Page0 – guest owned control and status registers (directly mapped
>            into the VM)
>  - Page1 – queue configuration registers (trapped/emulated by QEMU)
>
> Unlike the standard SMMU CMDQ, a guest owned Tegra241 VCMDQ does not
> support the full command set. Only a subset, primarily invalidation
> related commands, is accepted by the CMDQV hardware. For this reason,
> a distinct CMDQV device must be exposed to the guest, and the guest OS
> must include a Tegra241 CMDQV aware driver to take advantage of the
> hardware acceleration.
>
> VCMDQ support is integrated via the IOMMU_HW_QUEUE_ALLOC mechanism,
> allowing QEMU to attach guest configured VCMDQ buffers to the
> underlying CMDQV hardware through IOMMUFD. The Linux kernel already
> supports the full CMDQV virtualisation model via IOMMUFD[0].
> ---
>
> Nicolin Chen (15):
>   backends/iommufd: Update iommufd_backend_get_device_info
>   backends/iommufd: Update iommufd_backend_alloc_viommu to allow user
>     ptr
>   backends/iommufd: Introduce iommufd_backend_alloc_hw_queue
>   backends/iommufd: Introduce iommufd_backend_viommu_mmap
>   hw/arm/tegra241-cmdqv: Implement CMDQV init
>   hw/arm/tegra241-cmdqv: Implement CMDQV vIOMMU alloc/free
>   hw/arm/tegra241-cmdqv: mmap host VINTF Page0 for CMDQV
>   hw/arm/tegra241-cmdqv: Emulate CMDQ-V Config region
>   hw/arm/tegra241-cmdqv: Emulate VCMDQ register reads
>   hw/arm/tegra241-cmdqv: Emulate VCMDQ register writes
>   hw/arm/tegra241-cmdqv: Allocate HW VCMDQs once configured
>   hw/arm/tegra241-cmdqv: Use mmap'd host VINTF page0 for virtual VINTF
>     page0
>   hw/arm/tegra241-cmdqv: Initialize register state on reset
>   hw/arm/tegra241-cmdqv: Limit queue size based on backend page size
>   hw/arm/virt-acpi: Advertise Tegra241 CMDQV nodes in DSDT
>
> Shameer Kolothum (16):
>   system/iommufd: Remove unused viommu pointer from IOMMUFDVeventq
>   hw/arm/smmuv3-accel: Introduce CMDQV ops interface
>   hw/arm/tegra241-cmdqv: Add Tegra241 CMDQV ops backend stub
>   hw/arm/smmuv3-accel: Wire CMDQV ops into accel lifecycle
>   hw/arm/virt: Use stored SMMUv3 device list for IORT build
>   hw/arm/tegra241-cmdqv: Probe host Tegra241 CMDQV support
>   hw/arm/virt: Link SMMUv3 CMDQV resources to platform bus
>   hw/arm/tegra241-cmdqv: Route allocated VCMDQ Page0 accesses to the
>     mmap'd host VINTF page0
>   memory: Allow RAM device regions to skip IOMMU mapping
>   hw/arm/smmuv3-accel: Introduce common helper for veventq read
>   hw/arm/tegra241-cmdqv: Read and propagate Tegra241 CMDQV errors
>   hw/arm/smmuv3: Add per-device identifier property
>   hw/arm/smmuv3-accel: Introduce helper to query CMDQV type
>   hw/arm/smmuv3-accel: Enforce viommu association when CMDQV is active
>   hw/arm/tegra241-cmdqv: Document the CMDQV design and lifecycle
>   hw/arm/smmuv3: Add cmdqv property for SMMUv3 device
>
>  hw/arm/smmuv3-accel.h         |   48 ++
>  hw/arm/tegra241-cmdqv.h       |  384 +++++++++++
>  include/hw/arm/smmuv3.h       |    3 +
>  include/hw/arm/virt.h         |    1 +
>  include/system/iommufd.h      |   17 +-
>  include/system/memory.h       |   21 +
>  backends/iommufd.c            |   64 ++
>  hw/arm/smmuv3-accel-stubs.c   |   12 +
>  hw/arm/smmuv3-accel.c         |  194 ++++--
>  hw/arm/smmuv3.c               |   10 +
>  hw/arm/tegra241-cmdqv-stubs.c |   16 +
>  hw/arm/tegra241-cmdqv.c       | 1119 +++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c      |  127 ++--
>  hw/arm/virt.c                 |   37 ++
>  hw/vfio/iommufd.c             |    4 +-
>  hw/vfio/listener.c            |    6 +
>  system/memory.c               |   10 +
>  backends/trace-events         |    4 +-
>  hw/arm/Kconfig                |    5 +
>  hw/arm/meson.build            |    2 +
>  hw/arm/trace-events           |   11 +
>  hw/vfio/trace-events          |    1 +
>  qemu-options.hx               |    8 +
>  23 files changed, 2024 insertions(+), 80 deletions(-)
>  create mode 100644 hw/arm/tegra241-cmdqv.h
>  create mode 100644 hw/arm/tegra241-cmdqv-stubs.c
>  create mode 100644 hw/arm/tegra241-cmdqv.c
>


