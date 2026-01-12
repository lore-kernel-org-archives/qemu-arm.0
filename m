Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62989C9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:44:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfK5j-0001L2-BK; Mon, 12 Jan 2026 10:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfK5h-0001FQ-4K
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 10:44:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfK5f-0002F1-CP
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 10:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768232662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaAQbrB1F1h4vV74DnTU8Wozi2Qvnh6xelY2kHN3sCc=;
 b=cERP7Wn9v5G5mG3liWUy8AwNGNIT41LbYYKAGi63VxpOPi47uC0rk5Qz6/3YyjubKwvOVz
 VNIXIYRtKo4DJDnn+wXri8YiGkmRnYVDqvxzQZdoTOv1TlTrxHxSh4wnv7lB38wdoP+5VA
 dQ/6m/m9um8blNGr8511ajfOa+KIjGQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-vqOxNt6JOX6mWLf8aZAagQ-1; Mon, 12 Jan 2026 10:44:15 -0500
X-MC-Unique: vqOxNt6JOX6mWLf8aZAagQ-1
X-Mimecast-MFC-AGG-ID: vqOxNt6JOX6mWLf8aZAagQ_1768232655
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso44179925e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 07:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768232654; x=1768837454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MaAQbrB1F1h4vV74DnTU8Wozi2Qvnh6xelY2kHN3sCc=;
 b=M4kqjMSZqnj5j0bXUmn/voFw+fbEcuGTgcpXyzQUHPuDwCoVIdSPAVEVBryu6qZnJ9
 NmHwOwnc5TDQfuiIi6Ldemrt9QN/w9E70Nfkb5GOUqOCJq30jm6uHO6uts/9dC/FtQfk
 OynIPr/1pbZpsXY7QyBT9yW+0QmBN68E0gRAc10sRo1XbqyMvaP0nafd8RIoj4eJnhha
 5mMHN1zlvGXYd65wcncr3xStaSCY2mM5zqUjL0PqCSdB87TGywQDhsFHALSJeQtiAFu1
 RvoRmbnb3gIhhZs6sA//s3M1QVYZPwdBu8gIpgciTop8t2aav9UWu8r+jTzPI/ccV9hN
 mbTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWv0XCHwxWYSJniajf42yOEvidoYhO2XFZvpl/iqadD0OvBNluuVbaNPTlPti/VavVRodUulxPPA==@nongnu.org
X-Gm-Message-State: AOJu0Yxv2Iv47kQCplbcsFpX2zaEF8tgJ2gA5o2xBbkHAzHHrFLwFjLA
 B0GmmPBp3HpGxW1xSpCAM2Xn37S7rTXkEBaApIZTWVpaVwvD0UKAgiwW9Aomhx1TzmTs3Yub7ty
 RDTlR+C2D6Y2tPAunLUS2EmCM/rrCeBQRPEm3tr59zB1cV0eFcI9jvT1sK4sNLg==
X-Gm-Gg: AY/fxX4O1oo+xG9qZZQe6uDjvOEBU50GKPD1i4ydR60OdnQ9tiURfkSZOUUO4+sWUuj
 fVYSIAB53GDtDCzTqC6sBZ6PAxW2rQJry1zfQXfJ5ZLS9ZP56JqpNPoRDY3QqvmGhYI85kgXtQ5
 QB346/S6EH0kj3Pnk8O6NvAtVRjWQiHGTqKtOuVq75P33PRtkwjq/SwVau6VCDvCs2IvwqH0/jl
 8ch0LvRqvaKmREurzbdhS9Aj7KM+2VSDvTbB9eW8BdiNUTM8ZL+mLbLKvZsjMyQ2FKBWfhXMwCQ
 vVrtrDbhDeXOaiN95op8ABIExDRI3Ub6ISE4mFkErwqOsdtqT2z7Naj5769P+D5UXxOZf7POXrS
 HbdTJ/G2PDgD4stuQdCuV8MeQZmtRMvhtxwXZH/FBge7qFCPkY3Q4/HUG9g==
X-Received: by 2002:a05:600c:4ed0:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-47d84b1a29fmr193619735e9.2.1768232654198; 
 Mon, 12 Jan 2026 07:44:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl2Zy6zC9mXwnZ5WytaKepvXYh/+Eq7JLfczR1nTe0VtgRcWdg3CoiLHYuuZcI74DWMfDy1Q==
X-Received: by 2002:a05:600c:4ed0:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-47d84b1a29fmr193619395e9.2.1768232653715; 
 Mon, 12 Jan 2026 07:44:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9c5sm40298505f8f.22.2026.01.12.07.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:44:13 -0800 (PST)
Message-ID: <2a68c364-a046-4c5d-a2d1-2f02b1b89abf@redhat.com>
Date: Mon, 12 Jan 2026 16:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] hw/arm: Introduce Tegra241 CMDQV support for
 accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: igYaCE5jI0q2vthlWce8SWbbXAvWQTK0Alcgxud8vHg_1768232655
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> Hi,
>
> This RFC series adds initial support for NVIDIA Tegra241 CMDQV
> (Command Queue Virtualisation), an extension to ARM SMMUv3 that
> provides hardware accelerated virtual command queues (VCMDQs) for
> guests. CMDQV allows guests to issue SMMU invalidation commands
> directly to hardware without VM exits, significantly reducing TLBI
> overhead.
>
> Thanks to Nicolin for the initial patches and testing on which this RFC
> is based.
>
> This is based on v6[0] of the SMMUv3 accel series, which is still under
> review, though nearing convergence.  This is sent as an RFC, with the goal
> of gathering early feedback on the CMDQV design and its integration with
> the SMMUv3 acceleration path.
>
> Background:
>
> Tegra241 CMDQV extends SMMUv3 by allocating per-VM "virtual interfaces"
> (VINTFs), each hosting up to 128 VCMDQs.
Can you add a reference to some specification documet please?
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
Do I understand correctly that this Tegra241 CMDQV aware driveris
enabled by the CONFIG_TEGRA241_CMDQV on guest? Is it fully supported
upstream?

Eric
>
> VCMDQ support is integrated via the IOMMU_HW_QUEUE_ALLOC mechanism,
> allowing QEMU to attach guest configured VCMDQ buffers to the
> underlying CMDQV hardware through IOMMUFD. The Linux kernel already
> supports the full CMDQV virtualisation model via IOMMUFD[0].
>
> Summary of QEMU changes:
>
>  - Integrated into the existing SMMUv3 accel path via a
>    "tegra241-cmdqv" property.
>  - Support for allocating vIOMMU objects of type
>    IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.
>  - Mapping and emulation of the CMDQV MMIO register layout.
>  - VCMDQ/VINTF read/write handling and queue allocation using IOMMUFD
>    APIs.
>  - Reset and initialisation hooks, including checks for at least one
>    cold-plugged device.
>  - CMDQV hardware reads guest queue memory using host physical addresses
>    provided through IOMMUFD, which requires that the VCMDQ buffer be
>    physically contiguous not only in guest PA space but also in host
>    PA space. When Tegra241 CMDQV is enabled, QEMU must therefore only
>    expose a CMDQV size that the host can reliably back with contiguous
>    physical memory. Because of this constraint, it is suggested to use
>    huge pages to back the guest RAM.
>  - ACPI DSDT node generation for CMDQV devices on the virt machine.
>
> These patches have been sanity tested on NVIDIA Grace platforms.
>
> ToDo / revisit:
>  - Prevent hot-unplug of the last device associated with vIOMMU as
>    this might allow associating a different host SMMU/CMDQV.
>  - Locking requirements around error event propagation.
>
> Feedback and testing are very welcome.
>
> Thanks,
> Shameer
> [0] https://lore.kernel.org/qemu-devel/20251120132213.56581-1-skolothumtho@nvidia.com/
> [1] https://lore.kernel.org/all/cover.1752126748.git.nicolinc@nvidia.com/
>
> Nicolin Chen (12):
>   backends/iommufd: Update iommufd_backend_get_device_info
>   backends/iommufd: Update iommufd_backend_alloc_viommu to allow user
>     ptr
>   backends/iommufd: Introduce iommufd_backend_alloc_hw_queue
>   backends/iommufd: Introduce iommufd_backend_viommu_mmap
>   hw/arm/tegra241-cmdqv: Add initial Tegra241 CMDQ-Virtualisation
>     support
>   hw/arm/tegra241-cmdqv: Map VINTF Page0 into guest
>   hw/arm/tegra241-cmdqv: Add read emulation support for registers
>   system/physmem: Add helper to check whether a guest PA maps to RAM
>   hw/arm/tegra241-cmdqv:: Add write emulation for registers
>   hw/arm/tegra241-cmdqv: Add reset handler
>   hw/arm/tegra241-cmdqv: Limit queue size based on backend page size
>   hw/arm/virt-acpi: Advertise Tegra241 CMDQV nodes in DSDT
>
> Shameer Kolothum (4):
>   hw/arm/tegra241-cmdqv: Allocate vEVENTQ object
>   hw/arm/tegra241-cmdqv: Read and propagate Tegra241 CMDQV errors
>   virt-acpi-build: Rename AcpiIortSMMUv3Dev to AcpiSMMUv3Dev
>   hw/arm/smmuv3: Add tegra241-cmdqv property for SMMUv3 device
>
>  backends/iommufd.c        |  65 ++++
>  backends/trace-events     |   2 +
>  hw/arm/Kconfig            |   5 +
>  hw/arm/meson.build        |   1 +
>  hw/arm/smmuv3-accel.c     |  16 +-
>  hw/arm/smmuv3.c           |  18 +
>  hw/arm/tegra241-cmdqv.c   | 759 ++++++++++++++++++++++++++++++++++++++
>  hw/arm/tegra241-cmdqv.h   | 337 +++++++++++++++++
>  hw/arm/trace-events       |   5 +
>  hw/arm/virt-acpi-build.c  | 110 +++++-
>  hw/vfio/iommufd.c         |   6 +-
>  include/exec/cpu-common.h |   2 +
>  include/hw/arm/smmuv3.h   |   3 +
>  include/hw/arm/virt.h     |   2 +
>  include/system/iommufd.h  |  16 +
>  system/physmem.c          |  12 +
>  16 files changed, 1332 insertions(+), 27 deletions(-)
>  create mode 100644 hw/arm/tegra241-cmdqv.c
>  create mode 100644 hw/arm/tegra241-cmdqv.h
>


