Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA2606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JxHBLTE+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXvU-0006xv-8L; Mon, 09 Nov 2026 17:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xQXvM-0006kH-Vf
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:33:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xQXvK-00042t-OI
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794263588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nTheVlU2uNx8gWcy5SRyibC+5QxVg3f/0j2k4PbbQLA=;
 b=JxHBLTE+dHDTslnD9A1pjFAYKkBFl0g+Gku/yd8Zdup7cHL1Y9K17NLWfo23CvcqkIroaw
 0OVv7DlInfRzCXmmGY5iFVFyMvN9/SISOHWOTlgtrG3cY5eRsdDU3dCuVejwIuL/OVJTlW
 Yp1NXG6AVQeeiGhCZON3oqQiYMZf2xM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-XbtQCdTRN5iuDpJPzg317g-1; Mon, 09 Nov 2026 17:33:07 -0500
X-MC-Unique: XbtQCdTRN5iuDpJPzg317g-1
X-Mimecast-MFC-AGG-ID: XbtQCdTRN5iuDpJPzg317g_1794263586
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4b9fde3044dso7003405e9.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263586; x=1794868386;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nTheVlU2uNx8gWcy5SRyibC+5QxVg3f/0j2k4PbbQLA=;
 b=YVgSqsorDJFsag0LkbXyjCdr3k8IND0aeTVLoVwQa38WlT7dnf798OMdPjJ7+WQjLC
 eyMeE0nLzWgKP4ZKOV7u/ARtMMbYKkIu84RotydzehMYu1U7c+xS7BwcWhymOKEoAqOv
 Zs5Uegb82ACYno3G7RcE/W71kDOKnjMTQxxcENc1sHEynsL50evqrJnFwRdjfn5hqrn5
 KQ8psJS9/EhDBEL7j8sKz772nbYSRX+N0px5QYvZ1xLIh0nzI99r2yxQRslIwyNW8MLq
 /0Lmjtb33FVl0C7MrtujPZsh96le56BPfkhebju25Qi1ONqnk+IECKi/Rw4YThte1Y8F
 bjYA==
X-Gm-Message-State: APuU4Z8zho2iEwNdQXLX724RCiDsO5yy/IhNe/P++sqlJgqgZPGayxft
 Qiw0TZZCA0Cm/uzi0CI04I97fsgfwKCSKXW02cyKmSlPCoKQajV2DEVpwka4HjYudqsyvaOAs/9
 8PvOHb5jDl9oPYQP+YZyY7Y5hAlKzHlPc+cnxDSyyNiepnHb+V7d3XA==
X-Gm-Gg: AYBFou1/JrxFZYi9CHOm1gl/EZPNF5KchU7IGFCH+CN+kqDYki98T1WLyAwJX2ELQQa
 VM94NTKfBxnkM/yI05W024HrlAMCi17XyuvRVSL7dqy7F92Bf5KlmH77vvijW/PudjZOwWIVYKT
 1TEodi9pFjtmAiH8s6SPnHSBSnmjQT+3pXNMZV7OnzhEUtOPyGG92/2Pa6W9fmD5W9F79dL00Wm
 CmkS8HaFbro0eqDrEhe8vLWogh6+7m1GWZLgd/hTTFPhCiVIZ53ExH/KKYOKGc1huFq+HGT+RcJ
 UMONh1pu3h0vGbN4rMFXokRqI/bFsW0uC9GntaQiNQFKNxhh7ZrbN80YyCv2FmWVdrT8blPvZdO
 bZjktjLB0p+Uc+WC5o07s0X36CAHQEyoW
X-Received: by 2002:a05:600c:4f4a:b0:4a1:7e76:d02f with SMTP id
 5b1f17b1804b1-4ba0233cb70mr12248885e9.14.1794263586476; 
 Mon, 09 Nov 2026 14:33:06 -0800 (PST)
X-Received: by 2002:a05:600c:4f4a:b0:4a1:7e76:d02f with SMTP id
 5b1f17b1804b1-4ba0233cb70mr12248565e9.14.1794263586063; 
 Mon, 09 Nov 2026 14:33:06 -0800 (PST)
Received: from x1 ([151.41.153.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0204784esm22593765e9.10.2026.11.09.14.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:33:05 -0800 (PST)
Date: Mon, 9 Nov 2026 23:33:02 +0100
From: Gustavo Romero <gromero@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/86] hw/intc/arm_gicv5: Implement virtualization support
Message-ID: <z45u3asa2mt2qj7yiura5gcgq7jnr2r2by45pry7i2plmnsrvb@atuzttjt5cxq>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Id5QFWvWSZGiadmOkF_PBzF_4MrEfK7aLhRgIMUiJVI_1794263586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

On Tue, Oct 13, 2026 at 09:38:07AM +0100, Peter Maydell wrote:
> This patchset adds virtualization support to our GICv5 model, and lets
> the "virt" board use -machine gic-version=x-5,virtualization=on.
> 
> Virtualization in the GICv5 is more complicated than it is in GICv3.
> This is because in GICv3 virtualization is mostly delegated to software,
> and only the CPU interface has hardware virtualization support. In
> GICv5 the hardware does a lot more of the work, so virtualization
> support is needed in both the CPU interface and the IRS.
> 
> I've structured this patchset as:
>  * initial preparatory and bug-fixing patches
>  * add virt support to the cpu interface
>  * add virt support to the IRS
>  * remove the check in virt that stops the user enabling virt
> 
> The first 11 patches have been on this list already; I've copied
> across Reviewed-by tags for those patches which got them.
> 
> The current spec for the GICv5 is at
> https://support.arm.com/documentation/aes0070/00eac0/
> 
> The kernel support for using GICv5 virtualization is not yet in
> mainline, but it has landed in the kvmarm/next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
> Similarly kvmtool support to run the inner guest is still work
> in progress, but the tree at
> https://gitlab.arm.com/linux-arm/kvmtool-sb.git gicv5_wip
> will work with the kvmarm/next tree.
> 
> This series can pass the kernel's vgic_v5 selftest, and boot an
> inner guest to userspace with kvmtool.
> 
> In an ideal world I'd like to land this for 11.2, but I appreciate
> that it's a lot of code to review and only two weeks til softfreeze;
> we'll see how it goes.
> 
> If you want a git branch of this I've pushed the patchset to
>  https://gitlab.com/pm215/qemu.git gicv5-virt
> 
> thanks
> -- PMM
> 
> Peter Maydell (86):
>   hw/intc/arm_gicv5: Make IRS_IDR0 reads return actual value, not 0
>   hw/intc/arm_gicv5: Ignore low bits in IRS_IST_BASER.ADDR
>   hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
>   hw/intc/arm_gicv5: Regularize spacing in config_readl() switch
>   hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
>   hw/intc/arm_gicv5: Free memory in finalize
>   target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set IRQ/FIQ status
>   target/arm: Only allow GICv5 on CPUs without AArch32 at EL1..3
>   hw/intc/arm_gicv5: Pass CPU index to CPU interface
>   hw/intc/arm_gicv5: Pass cpuidx rather than iaffid in gicv5_get_hppi()
>   hw/intc/arm_gicv5: Use correct type for value in lpi_cache_get_hppi()
>   hw/intc/arm_gicv5: Relax QEMU_GICV5_MIN_LPI_ID_BITS to 0
>   target/arm: GICv5 cpuif: Implement ICH_APR_EL2
>   target/arm: GICv5 cpuif: Implement ICH_PPI_{ENABLE,PEND,ACTIVE} regs
>   target/arm: GICv5 cpuif: Implement ICH_PPI_PRIORITYR<n>_EL2
>   target/arm: GICv5 cpuif: Implement ICH_PPI_DVIR<n>_EL2
>   target/arm: GICv5 cpuif: Implement ICH_VCTLR_EL2 and ICH_VCMR_EL2
>   target/arm: GICv5 cpuif: Implement GIC fine-grained trap registers
>   target/arm: GICv5 cpuif: Mark GIC registers for fine-grained traps
>   target/arm: GICv5 cpuif: Mark GIC insns for fine-grained traps
>   target/arm: GICv5 cpuif: Implement ICC_SRE_ELx
>   target/arm: GICv5 cpuif: Implement ICH_PPI_HVIR<n>_EL2
>   target/arm: GICv5 cpuif: Implement ICV_APR_EL1
>   target/arm: GICv5 cpuif: Implement ICV_CR0_EL1
>   target/arm: GICv5 cpuif: Implement ICV_PCR_EL1
>   target/arm: GICv5 cpuif: Implement ICV_PPI_ENABLER<n>_EL1
>   target/arm: GICv5 cpuif: Implement ICV_PPI_PRIORITYR<n>_EL1
>   target/arm: GICv5 cpuif: Add comment about ICV_PPI_HMR<n>_EL1
>   target/arm: GICv5 cpuif: Implement ICV_PPI_CACTIVER<n>_EL1,
>     ICV_PPI_SACTIVER<n>_EL1
>   target/arm: GICv5 cpuif: Implement ICV_PPI_CPENDR<n>_EL1,
>     ICV_PPI_SPENDR<n>_EL1
>   target/arm: GICv5 cpuif: Calculate current virtual PPI HPPI
>   target/arm: GICv5 cpuif: Add virtual support to IRS/cpuif HPPI APIs
>   target/arm: GICv5 cpuif: Implement ICV_HPPIR_EL1
>   target/arm: GICv5 cpuif: Implement gicv5_update_virq_vfiq()
>   target/arm: GICv5 cpuif: Implement ICH_CONTEXTR_EL2
>   target/arm: GICv5 cpuif: ask the GIC for the virtual HPPI
>   target/arm: GICv5 cpuif: Handle LD/VD insns when setting
>     domain/virtual args
>   target/arm: GICv5 cpuif: Handle virtual interrupts for GIC CDEOI
>   target/arm: GICv5 cpuif: Handle virtual interrupts for GIC CDDI
>   target/arm: GICv5 cpuif: Handle virtual interrupts for GICR CDIA,
>     CDNMIA
>   target/arm: GICv5 cpuif: Handle GIC VDPEND VM argument
>   target/arm: GICv5 cpuif: Implement GIC VDnnn insns
>   target/arm: GICv5 cpuif: Implement GIC LDnnn insns
>   target/arm: GICv5 cpuif: Handle PPI injection in vPPI pending reads
>   target/arm: GICv5 cpuif: Handle PPI injection in vPPI pending writes
>   target/arm: GICv5 cpuif: Handle injected PPIs in GICR CDIA
>   target/arm: GICv5 cpuif: Update on HCR_EL2.{NV,NV1} and SCR_EL3.NS
>     changes
>   target/arm: GICv5 cpuif: Update VFIQ/VIRQ when direct-injected PPIs
>     change
>   hw/intc: Move GICv5 register and data definitions into a header
>   hw/intc/arm_gicv5: Correct offset for IRS_VMT_STATUSR
>   hw/intc/arm_gicv5: Ask CPUs whether IRS needs virtualization support
>   hw/intc/arm_gicv5: Indicate virtualization in ID registers
>   hw/intc/arm_gicv5: Implement IRS_VMT_BASER and IRS_VMT_STATUSR
>   hw/intc/arm_gicv5: IMplement IRS_VMT_CFGR
>   hw/intc/arm_gicv5: Implement IRS_VMAP_L2_VMTR
>   hw/intc/arm_gicv5: Implement IRS_VMAP_VMR
>   hw/intc/arm_gicv5: Factor out code to fill in a GICv5ISTConfig
>   hw/intc/arm_gicv5: Cache info about valid VMs in a hashtable
>   hw/intc/arm_gicv5: Populate VM cache when VM table becomes valid
>   hw/intc/arm_gicv5: Implement IRS_VMAP_VISTR
>   hw/intc/arm_gicv5: Factor out "make an L2 IST valid" function
>   hw/intc/arm_gicv5: Implement IRS_VMAP_L2_VISTR
>   hw/intc/arm_gicv5: Cache VPE table information
>   hw/intc/arm_gicv5: Implement IRS_VMAP_VPER
>   hw/intc/arm_gicv5: Implement IRS_VPE_SELR and IRS_VPE_STATUSR
>   hw/intc/arm_gicv5: Implement IRS_VPE_DBR
>   hw/intc/arm_gicv5: Implement IRS_VPE_CR0
>   hw/intc/arm_gicv5: Implement gicv5_set_resident()
>   hw/intc/arm_gicv5: Take cpuidx for stream commands on virtual
>     interrupts
>   hw/intc/arm_gicv5: Handle virtual=true in gicv5_set_priority()
>   hw/intc/arm_gicv5: Handle virtual=true for setting enabled, pending,
>     handling
>   hw/intc/arm_gicv5: Handle virtual=true for setting pending
>   hw/intc/arm_gicv5: Handle virtual=true in gicv5_set_target()
>   hw/intc/arm_gicv5: Handle virtual=true in gicv5_deactivate()
>   hw/intc/arm_gicv5: Handle activation of a virtual interrupt
>   hw/intc/arm_gicv5: Handle virtual=true in gicv5_request_config()
>   hw/intc/arm_gicv5: Implement irs_recalc_vhppi()
>   hw/intc/arm_gicv5: Recalculate vHPPIs on VIST and VPE mapping
>   hw/intc/arm_gicv5: Add virtual support to gicv5_get_hppi()
>   hw/intc/arm_gicv5: Implement IRS_VPE_HPPIR
>   hw/intc/arm_gicv5: Implement ringing doorbells for VPEs
>   hw/intc/arm_gicv5: Handle vHPPIs when IRS_CR0.IRSEN is toggled
>   hw/intc/arm_gicv5: Implement saving virtual interrupt state to guest
>     memory
>   hw/intc/arm_gicv5: Implement reporting of Quiesced state
>   hw/intc/arm_gicv5: Implement no-passthrough IRS_SPI_VMR
>   hw/arm/virt: allow virtualization=on with gicv5
> 
>  hw/arm/virt.c                      |    5 +-
>  hw/intc/arm_gicv5.c                | 2554 +++++++++++++++++++++++-----
>  hw/intc/arm_gicv5_common.c         |   30 +-
>  hw/intc/trace-events               |   19 +-
>  include/hw/intc/arm_gicv5.h        |   18 +
>  include/hw/intc/arm_gicv5_common.h |   40 +-
>  include/hw/intc/arm_gicv5_regs.h   |  325 ++++
>  include/hw/intc/arm_gicv5_stream.h |   81 +-
>  target/arm/cpregs.h                |   85 +-
>  target/arm/cpu-features.h          |    8 +
>  target/arm/cpu.c                   |   72 +-
>  target/arm/cpu.h                   |   33 +-
>  target/arm/gicv5-stubs.c           |    8 +
>  target/arm/helper.c                |   23 +-
>  target/arm/internals.h             |   23 +
>  target/arm/tcg/gicv5-cpuif.c       | 1390 +++++++++++++--
>  target/arm/tcg/trace-events        |   10 +-
>  17 files changed, 4089 insertions(+), 635 deletions(-)
>  create mode 100644 include/hw/intc/arm_gicv5_regs.h
> 
> -- 
> 2.43.0
> 
> 

Tested-by: Gustavo Romero <gromero@redhat.com>


Cheers,
Gustavo


