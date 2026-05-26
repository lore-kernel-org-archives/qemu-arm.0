Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900CCD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 12:33:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRqxV-0002mh-98; Tue, 26 May 2026 08:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRqxU-0002mQ-4j
 for qemu-arm@nongnu.org; Tue, 26 May 2026 08:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRqxS-0007WR-DT
 for qemu-arm@nongnu.org; Tue, 26 May 2026 08:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779798748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJR6N79aArGp9rTKdQs5MH26ZakYGnmVZYEivR48wYs=;
 b=GGb3saHlyDewRxUKkCk55eE0cVHCLEQh5ItKMtEzWyaDnq+7AgtizsQ9GN1UZrRUIKeXlJ
 5NoDyyR0G40nuTzSNzpk4g/GmdFG9HpQSh62CbhqiXSLFlKbhSj6hWgO0qcwE6KnqUH9MU
 GnAuwT+2NjkudtNvOuK9DB4buKmGJnU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-_y3SEq_pP4SjeGbM_DqfjA-1; Tue, 26 May 2026 08:32:18 -0400
X-MC-Unique: _y3SEq_pP4SjeGbM_DqfjA-1
X-Mimecast-MFC-AGG-ID: _y3SEq_pP4SjeGbM_DqfjA_1779798737
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4904bbc6094so24665555e9.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 05:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779798737; x=1780403537;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJR6N79aArGp9rTKdQs5MH26ZakYGnmVZYEivR48wYs=;
 b=qXtnRkf99Tptl+eM3jONisHtbLPQdfFyzF3j7emwh++nuQeou+7DGcRRnqn/mOEGsF
 5RIJAceiGEM6I9sFgra9y3FDOTs5hYo6bXl4GiDspNjNwvW1V8EL/nc04kJXjqFH3Vwf
 Oh0S+zu9oSoFyUHIFmVHRZFKGVDycnA6FsXeB2emMoEWO3M8xSBEm+Ht0vAsG4/AdUqC
 DsoJ++3+ljkdvr0b2IYOLTz7hPk5BYFM8CdOSxVNUbTAcxhP0nKmVmMauwIUVW1BNIAM
 iX6GQRl8MKA1zj1945HkBc9D2g3xukqxCtcM7r7m8yul4i+rmlRtSBlGJunnmy1x2RuK
 5/cA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8nq6Bh0tb7oscMwLX0lCdgrJtJw1j1uCJJxQGfBz10EEuNhqNyoLJRuP55LK/5TcOxaLo7mcL5PA==@nongnu.org
X-Gm-Message-State: AOJu0YzRRnJWaEd/SYPtu9GCNa7SLKjgtu4IGn0jc9IWHSJK4wsnw8zN
 d/ko8uTmqLfWNU86peVdxuRY+i3q6vz5qNZSHnjRMoXzqTFKYIR2xWuL1y2XHZEsV2gpQP1FQVw
 D4apipHR70jmcXA5wpH/HaK+IzMyQvNd+Y3KSCus/rsx9sCodyqPrqg==
X-Gm-Gg: Acq92OFLji6/LHBxNoGtp7hhOWi2go+GhHu0lI7Dvn7jZHWVXk5GXox0BGEG/akTFCx
 cq/LRoVua+Kxsa1BLf8C8wSz+buSikF159hjP2TmQDd3rrCUpK+Mc0Wsm+lG5NwZEg6lXep7IFP
 i7NkDgI+n06cMdTBi0kyBLk+aDp26G+cnRj6SCkyTZgqT5AcxuF47+yh7kMx3siROxNoTLTug64
 92/q+YkZGuT8dRgt+xAzJydd3Rg2p6Msxq690yb56oYWLcPvSl5f4eVFLOlY00ACW3pgACCK+7k
 c2C0+K36brYr3MFh+/SGGbimZqjZKdqEvFSFBa/y2051IueMfkdglsah3sq+j5BzE4zP/NoBkUs
 KbqyOgPH7F+9e7mJ0aPY+nO32Kj1CC66lyCu31YvHc3oIwIhj1GDjoXnmf2LDwuCVFiTZcQ==
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id
 5b1f17b1804b1-49042482762mr315623375e9.4.1779798737140; 
 Tue, 26 May 2026 05:32:17 -0700 (PDT)
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id
 5b1f17b1804b1-49042482762mr315622705e9.4.1779798736600; 
 Tue, 26 May 2026 05:32:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49045284855sm326447885e9.0.2026.05.26.05.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 05:32:16 -0700 (PDT)
Message-ID: <589a36eb-2d60-4f9b-a385-9e47565eeb85@redhat.com>
Date: Tue, 26 May 2026 14:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0 for CMDQV
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-18-skolothumtho@nvidia.com>
 <c0dd92b2-4ea9-45a2-afbf-b61910f71fe6@redhat.com>
 <CH3PR12MB75486D02EEBCE74D47B20834AB012@CH3PR12MB7548.namprd12.prod.outlook.com>
 <CH3PR12MB7548D57C770446ABED0EDB68AB0F2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548D57C770446ABED0EDB68AB0F2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aRaQi3D1mP7Bm8eL4N_OFq5UFbdk1a0zRtcQh11eago_1779798737
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Shameer,

On 5/22/26 12:01 PM, Shameer Kolothum Thodi wrote:
>>> On 5/19/26 12:36 PM, Shameer Kolothum wrote:
>>> Actually is the whole host passthrough principle is not really explained
>>> anywhere. At least that's my feeling. It would be nice to have a summary
>>> for it, in the coverletter and in individual patch. Or maybe we can link
>>> to another doc. Reading the kernel uapi does not really provide the full
>>> picture, at least that's my own feeling.
>> Fair point. A summary of operation is useful. I am thinking of adding
>> it at the top of hw/arm/tegra241-cmdqv.c:
>>
>> /*
>>    * Tegra241 CMDQV - overview
>>    * ---------------------------------------
>>    *...
>>    */
>>
>> I will populate the details and share it for review before v6.
> Please find below. Hopefully, I have captured all the important details.
> Please take a look and let me know.
>
> Thanks,
> Shameer
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index ebf12d0597..5a103f37b8 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -7,6 +7,84 @@
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>
> +/*
> + * Tegra241 CMDQV - overview
> + * =========================
> + *
> + * NVIDIA Tegra241 extends SMMUv3 with a Command Queue Virtualization (CMDQ-V)
> + * block. It lets a guest issue SMMU invalidation commands directly to
> + * dedicated hardware queues (vCMDQs) without trapping into the hypervisor on
> + * the fast path. vCMDQs are grouped into Virtual Interfaces (VINTFs); the
> + * host kernel allocates one VINTF per emulated SMMUv3 instance via iommufd.
> + * QEMU emulates the CMDQV MMIO region and drives the host kernel calls
> + * (VIOMMU_ALLOC, HW_QUEUE_ALLOC, mmap); the actual command processing happens
> + * on real hardware.
> + *
> + * MMIO layout (64KB pages, total TEGRA241_CMDQV_IO_LEN)
> + * -----------------------------------------------------
> + * The direct vCMDQ apertures (0x10000/0x20000) are HW aliases of the VINTF
> + * apertures (0x30000/0x40000); they expose the same per-vCMDQ register slots
> + * under different addressing.
> + *
> + *   0x00000  CMDQV Config page: QEMU-trapped.
> + *   0x10000  Direct vCMDQ Page 0 (control/status): QEMU-trapped and routed
> + *            via vintf_ptr() to either the mmap'd VINTF page (allocated
> + *            slot) or a per-vCMDQ register cache (unallocated slot).
> + *   0x20000  Direct vCMDQ Page 1 (BASE / DRAM addresses): QEMU-trapped.
> + *   0x30000  VINTF Page 0 (per-VINTF control/status): mmap'd from the host
> + *            via iommufd and installed into guest MMIO as a RAM-device
> + *            subregion after the first HW_QUEUE_ALLOC; subsequent accesses
> + *            bypass QEMU.
> + *   0x40000  VINTF Page 1 (per-VINTF BASE): QEMU-trapped.
> + *
> + * The direct vCMDQ aperture stays trapped (rather than aliased to the VINTF

direct vCMDQ aperture page 0 stays trapped as opposed to the VIINTF page0

> + * mmap) to preserve the spec's R/W register semantics for unallocated
> + * vCMDQs: the direct aperture allows programming before VINTF allocation,
> + * while aliasing would route through the VINTF drop path instead.
see last discussion
> + *
> + * Lifecycle (driven by guest events)
> + * ----------------------------------
> + * 1. First vfio-pci device attach (.set_iommu_device) triggers:
> + *    - tegra241_cmdqv_probe(): IOMMU_GET_HW_INFO confirms host CMDQV support.
> + *    - IOMMU_VIOMMU_ALLOC: the kernel allocates a VINTF for this VM,
> + *      configures the VM's VMID (from its stage-2 HWPT) in VINTF_CONFIG,
> + *      forces HYP_OWN=0, and returns the mmap offset/length for VINTF Page 0.
what about the v/p SID mapping. How does the kernel know which SIDs are
supposed to write into that VINTF? where do we pass this info?
> + *
> + * 2. Guest writes VINTF_CONFIG.ENABLE = 1:
> + *    QEMU mmap()s the offset from step 1 into its address space and reports
> + *    STATUS.ENABLE_OK = 1. The host VINTF was already enabled by
> + *    IOMMU_VIOMMU_ALLOC; QEMU only acks back.
> + *
> + * 3. Guest completes vCMDQ setup (BASE, CMDQ_ALLOC_MAP.ALLOC, CMDQV_EN,
> + *    VINTF.ENABLE, in any order; each precondition write retries the
> + *    allocation):
> + *    IOMMU_HW_QUEUE_ALLOC binds the guest BASE GPA (translated through
> + *    stage-2 and pinned by the kernel) to a host vCMDQ in this VM's VINTF.
> + *
> + * 4. After the first successful HW_QUEUE_ALLOC, the mmap'd VINTF Page 0 is
> + *    installed into guest MMIO as a RAM-device subregion. Guest vCMDQ Page 0
> + *    accesses (CMDQ_EN, PROD/CONS_INDX, STATUS, GERROR/GERRORN) thereafter
> + *    go straight to host hardware, bypassing QEMU.
> + *
> + * Per-VM isolation
> + * ----------------
> + * - Each VM has its own iommufd FD; all iommufd objects (VINTF, hw_queues,
> + *   mmap regions) belong to that FD. Cross-FD lookups fail, so one VM
> + *   cannot reach another VM's IDs.
> + * - IOMMU_VIOMMU_ALLOC configures the VM's VMID in VINTF_CONFIG; the CMDQV
> + *   hardware substitutes / checks VMID on every command the guest issues.
> + * - The kernel allocates the VINTF with HYP_OWN = 0, which restricts the
> + *   guest to a safe subset of commands.
> + * - Per VINTF, the kernel programs SID_MATCH and SID_REPLACE to restrict
> + *   invalidations to the StreamIDs assigned to this VM.
> + * - IOMMU_HW_QUEUE_ALLOC binds each vCMDQ to a single VINTF, so a guest
> + *   cannot reach a vCMDQ that belongs to another VM.
> + *
> + * Limits exposed to the guest
> + * ---------------------------
> + * One VINTF per emulated SMMUv3 and two vCMDQs per VINTF.
> + */
> +
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"

Eric


