Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466FDCD6E4A
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 15:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVAFN-0003E7-Bf; Thu, 04 Jun 2026 11:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wVAFM-0003DZ-Ax
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 11:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wVAFK-0002Ef-Br
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 11:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780587875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bd+Eq/SHlfjPT9OLcOXKzMgKPi0RpLrmvHcafQybNU=;
 b=KxHv/gd+7xNf8G0QA/NmoBoiiHqLTJyd24c2yef+/ghswFNIl//NZkyZUh3O3lQGs04Cn6
 F6Arn7opBm5gkQXOZUbHVhWIVBSymqxSb5wadQ9W/V5z10oxksiKCG3Y7peAkLFFYCFatH
 BnWKKTOCn5/rKQnBSW4SkfMEgt2xZq8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-nu8AbFbWOfipgXv6RpDtmA-1; Thu, 04 Jun 2026 11:44:34 -0400
X-MC-Unique: nu8AbFbWOfipgXv6RpDtmA-1
X-Mimecast-MFC-AGG-ID: nu8AbFbWOfipgXv6RpDtmA_1780587873
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45ef9f0af71so881009f8f.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 08:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780587873; x=1781192673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bd+Eq/SHlfjPT9OLcOXKzMgKPi0RpLrmvHcafQybNU=;
 b=qWWI8bMqiqGvAWRCxDd4k6+kBYzxQufqxW1uEUgSCMBTXPLgHK+X7UW5NNqY1Jt0wk
 px+5e/Otii8azuMW+F5TV7VTNcK6owH+j1C/SKC4bXeyGSKDQDGXAK4T0wrHtupkj2pm
 LiPyUSmisLX/9EjHg/mpzOwWDUuHiaaJS196DJdMUI3OXSrYLhkR0YhL4+yC7H69Ak8X
 FRoF1bz+ScSLPLX+Z/3R6w8zwNV+efdP9dBkuU6tQa6QooBK6LjN7fFX1MNGV4OAAUVU
 h7LHwNIeWilyJaEBfFb2dJxN5vdSHrYj4KLwYV+lljAtuLTAk4WKxWr+mMZ9b+Deu5ty
 /oeQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ92kY6uuQ0LB1Rhh5b+83/e13Ohql955pzAupQ/Yyc4SHFxTb0krlJhCw7H3CqqwFQwywdLu7cC/Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx4REYKpTOEWTo4ZN08h6gP4sYMcF54EMnTIIFafzycgXElArky
 u7JdKWEb6XQljz5uYcG82Z/1yhkCBChW0xa+0cpLbYoDcOrkVu9+rg+w4wkgTE3pPnC2ISdN1Jo
 g5/aXCi9TItu1U669oGIZUatFkW6z698DQizY7Efc6fE8atc+lobgZg==
X-Gm-Gg: Acq92OEx8iFMAdZ18CHQhjOYnF1e4tlnPFBmvyRarulODlARaZe99rGeb21MEaK6p+o
 NJTElCV8yrMYFqK73U78tpBJeNonX3DxeK1GmHdsJVeT2FjvkH3UkrfOloI8urZIqoE88kbZrlm
 sSAkXXg6PzmUCGXxvottXzJppYt24NPEiKqnSWQWr4GhfRXQX6rN0MHWUD8eqG/4NtkkFMp72HB
 2A46Y0grU3zTN11+psluBKG2PKUUhF/V/nG4dKfrM+UXm2ODeRterKeOvdmwUnie5ukYvWkS93a
 7rjmYZrtMxUId1OzchgVZga07Q+loYhpXVUjTl9I3MJojjdq7r5rTzXYXyA8/40iRHaOOzI72I3
 9zDTZVYdA/x3OEg0xhOmUcw9SXUxJk60ivYDXtTZtbf/cxa0grA5RvpRLNwstdCZy+JhdEsbVKK
 knMMh/
X-Received: by 2002:adf:d02a:0:b0:44f:69f4:39b5 with SMTP id
 ffacd0b85a97d-460276401efmr5248837f8f.29.1780587873232; 
 Thu, 04 Jun 2026 08:44:33 -0700 (PDT)
X-Received: by 2002:adf:d02a:0:b0:44f:69f4:39b5 with SMTP id
 ffacd0b85a97d-460276401efmr5248787f8f.29.1780587872756; 
 Thu, 04 Jun 2026 08:44:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm16696661f8f.12.2026.06.04.08.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 08:44:32 -0700 (PDT)
Message-ID: <3c4afa12-4e2d-4585-98c0-3c95b6016d07@redhat.com>
Date: Thu, 4 Jun 2026 17:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/31] hw/arm/tegra241-cmdqv: Document the CMDQV design
 and lifecycle
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260601114221.457995-1-skolothumtho@nvidia.com>
 <20260601114221.457995-31-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260601114221.457995-31-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eQFQKn5mTDsPjU_Ow5G0J0Ex9vYU8gRDvN8GGoLS68s_1780587873
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Shammer,

On 6/1/26 1:42 PM, Shameer Kolothum wrote:
> Add an overview describing the Tegra241 CMDQV passthrough model, MMIO
> layout, guest-driven lifecycle, and per-VM isolation.
some suggestions inline. Thank you very much for the documentation
efforts! That's really helpful.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 93 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 4dba1783fa..5dbf68b421 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -7,6 +7,99 @@
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
s/are grouped/are exclusively allocated to VINTFS?
> + * host kernel allocates one VINTF per emulated SMMUv3 instance via iommufd.
> + * QEMU emulates the CMDQV MMIO region and drives the host kernel calls
> + * (VIOMMU_ALLOC, HW_QUEUE_ALLOC, mmap); the actual command processing
> + * happens on real hardware.
> + *
> + * A vCMDQ becomes functional only once allocated to a VINTF; until then,
> + * register accesses only touch the QEMU-side cache and no command
> + * processing happens. After allocation, command processing runs on the
state is migrated from cache to HW and command processing ...
> + * host hardware, and guest accesses to the live control/status registers
> + * bypass QEMU and reach the host directly.
> + *
> + * MMIO layout (64KB pages, total TEGRA241_CMDQV_IO_LEN)
> + * -----------------------------------------------------
> + * The direct vCMDQ apertures (0x10000/0x20000) are HW aliases of the VINTF
> + * apertures (0x30000/0x40000); they expose the same per-vCMDQ register slots
> + * under different addressing.
I would put above sentence after the layout description.
> + *
> + *   0x00000  CMDQV Config page: QEMU-trapped.
> + *   0x10000  Direct vCMDQ Page 0 (control/status): QEMU-trapped and routed
> + *            to either the mmap'd VINTF Page 0 (if the vCMDQ has been
> + *            allocated to a VINTF) or a per-vCMDQ register cache (otherwise).
> + *   0x20000  Direct vCMDQ Page 1 (BASE / DRAM addresses): QEMU-trapped.
> + *   0x30000  VINTF Page 0 (per-VINTF control/status): mmap'd from the host
> + *            via iommufd and installed into guest MMIO as a RAM-device
> + *            subregion after the first HW_QUEUE_ALLOC; subsequent accesses
> + *            bypass QEMU.
> + *   0x40000  VINTF Page 1 (per-VINTF BASE): QEMU-trapped. Although this is
> + *            a HW alias of the direct Page 1, the kernel only exposes mmap
> + *            for VINTF Page 0; VINTF Page 1 is not mmap'd and stays trapped.
> + *
> + * The direct vCMDQ Page 0 stays trapped rather than aliased to the VINTF
> + * Page 0 mmap. Direct aperture read/write is not an expected common usecase,
You can justify it as you did in the individual patch (to keep
management of unmapped vcmds in direct page compliant with the spec)
> + * but trapping keeps accesses well-defined for an unallocated vCMDQ.
> + *
> + * Lifecycle (driven by guest events)
> + * ----------------------------------
> + * 1. First vfio-pci device attach (.set_iommu_device) triggers:
> + *    - tegra241_cmdqv_probe(): IOMMU_GET_HW_INFO confirms host CMDQV support.
> + *    - IOMMU_VIOMMU_ALLOC: the kernel allocates a VINTF for this VM,
> + *      configures the VM's VMID (from its stage-2 HWPT) in VINTF_CONFIG,
> + *      forces HYP_OWN=0, and returns the mmap offset/length for VINTF Page 0.
> + *
> + * 2. Guest writes VINTF_CONFIG.ENABLE = 1:
> + *    QEMU mmap()s the offset from step 1 into its address space and reports
> + *    STATUS.ENABLE_OK = 1. The host VINTF was already enabled by
> + *    IOMMU_VIOMMU_ALLOC; QEMU only acks back.
the host VINTF ... : I would add this in 1. I would remove "QEMU only
acks back."
> + *
> + * 3. Guest completes vCMDQ setup (BASE, CMDQ_ALLOC_MAP.ALLOC, CMDQV_EN,
> + *    VINTF.ENABLE, in any order; each precondition write retries the
the HW queue allocation:
> + *    allocation):
> + *    IOMMU_HW_QUEUE_ALLOC binds the guest BASE GPA (translated through
> + *    stage-2 and pinned by the kernel) to a host vCMDQ in this VM's VINTF.
the guest is granted a new host vcmdq in its vintf?
> + *
> + * 4. After the first successful HW_QUEUE_ALLOC, the mmap'd VINTF Page 0 is
> + *    installed into guest MMIO as a RAM-device subregion. Guest VINTF Page 0
> + *    accesses (CMDQ_EN, PROD/CONS_INDX, STATUS, GERROR/GERRORN) thereafter
> + *    go straight to host hardware, bypassing QEMU.
> + *
> + * 5. Guest SMMU driver programs a Stream Table Entry for a passthrough
> + *    device: IOMMU_VDEVICE_ALLOC programs SID_MATCH/SID_REPLACE in this
> + *    VM's VINTF so the device's guest vSID translates to its host pSID.
> + *    Commands referencing unmapped SIDs are rejected by HW.
> + *
> + * Per-VM isolation
> + * ----------------
> + * - Each VM has its own iommufd FD; all iommufd objects (VINTF, vdevices,
> + *   hw_queues, mmap regions) belong to that FD. Cross-FD lookups fail, so
> + *   one VM cannot reach another VM's IDs.
> + * - IOMMU_VIOMMU_ALLOC configures the VM's VMID in VINTF_CONFIG; the CMDQV
> + *   hardware substitutes / checks VMID on every command the guest issues.
> + * - The kernel allocates the VINTF with HYP_OWN = 0, which restricts the
> + *   guest to a safe subset of commands.
> + * - IOMMU_VDEVICE_ALLOC populates SID_MATCH/SID_REPLACE so invalidations
> + *   only reach the host StreamIDs assigned to this VM (see step 5).
> + * - IOMMU_HW_QUEUE_ALLOC binds each vCMDQ to a single VINTF, so a guest
> + *   cannot reach a vCMDQ that belongs to another VM.
> + *
> + * Limits exposed to the guest
> + * ---------------------------
> + * One VINTF per emulated SMMUv3 and two vCMDQs per VINTF. Maximum vCMDQ
> + * size is 8MiB. The queue must be physically contiguous (the HW reads it
> + * via host PA), so QEMU caps it to the host memory-backend page size. Use
> + * hugepage backing large enough to keep CMDQS at the HW maximum.
> + */
> +
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
Thanks

Eric


