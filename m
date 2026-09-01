Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8266C624D4
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:47:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1Plf-0006Lj-7Z; Tue, 01 Sep 2026 10:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1Plc-0006Jz-RL
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:47:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1Pla-0007Oh-F7
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:47:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-498012a61f6so53425e9.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788274028; x=1788878828; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MSvz2lR6dpinnvgPKTv3DuY2BF1CgLCvjsZyosCDWe0=;
 b=RytwsOWV/Qj3AXB7P/PzZlFe+aQQ7J+cgHqL7rq/E6iS94PNGwjj6ollot2O0DvRQb
 PyWMnpyuBwDTNsy8UzyKeA6HU3No9a4Ud0v7zwJnZX4pEq8qlt6jN/RmcBpGDpUxVEMK
 8y+pQtOr7GjIB+FzTfC6vay6UUmN5ryj7JiYhU6vYHKNQ3pPg6G7j5b6D+IBDTGLNz7e
 ANAQgHmnKSwApBP4AuJ55ddRgCzf85oK3oWFeA+YClLzDNnnBuDjsKNLLlfbPeP92OGx
 PeJPic/6rQ+m3ZO1RawnAX9YLM29zVU8ImoE4nfbDVmFiWRMMbsibbwFTPfCLkDPNTfq
 NDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788274028; x=1788878828;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MSvz2lR6dpinnvgPKTv3DuY2BF1CgLCvjsZyosCDWe0=;
 b=UjC5BT5a9RfaUORS2iqgH8rjpJ0I3XwUX0ZxH1jKjf0Q4VUP99NGZvBUhU9NOB8GRU
 E7klrU+3Zt4Si3CMsyxz3vbaD/2ydlUWQYrH6hnt4MG/EPNflU9qXyV+plXmbWq1QEdo
 iQoyAc+Fp3gv0euDZNddKepOcY3DZYWKQT7s4tv2ASLumijeAr6vqVUzdp4qxL5uHzEI
 FD95UjXUBZ9MQM7vxTyEa5FC15+uTHEGSK3WeLo0BgLTtG4tNsExqF5JKcyhEZvNMGPa
 BJajt2iHzGFHHTrqfjas79TIx1DDg4fMhN4CZwwPf3CC2xcAbh7iSgAfpt+H77E1NRfj
 rhUw==
X-Forwarded-Encrypted: i=1;
 AHgh+RocpcdSXpjoYI8JpLCCDiTAUCTjZ9Q4T4GwHW77u8rkLHGxj3eAIYm96WkOlIfo6k/eM7hmhflIUw==@nongnu.org
X-Gm-Message-State: AFuF++mmhspOCp3eCaMhgjdttTokHbNFq0Yy2XNv4smRBdg3AiSBHs1P
 i9c2cFqDet6Uda81X0HL/T86b47n8quGltAXUc9HxMv2+hRPGG9XpPYZ8dmxC2eDvRjURRwnyBh
 J/DZFXw==
X-Gm-Gg: AR+sD12Ag1AjmRX1jVP38Nv94kcOrU9FPGe7D5A+XtcfQnD2ztOQ0YoOswtCOOzgy+5
 5n0iZ5G6WLJDP7ewEHKan2yoUyYglT37cmsJw8EjjEYXq5C/KYWKrDr7ptuvsBUQ+JbxWJclDcJ
 2Sl1etHqCuVPGWJTupv5tyq9S/+BwT1+nw5kqcG0wmilzPS3MMUXvbMGXfTE7Z6JjCBILi8Ck6t
 V0MJqO0FsZrVIvL0FplxyRs70u6nfIq2Dr9Iu2qC2+l2IpcmQIuLkO/S6ySyBSY3H7uANrYhHXl
 NwjY+MTL6acX1Q7yS42Lsa0xE4OLxf0sRitbSDJ4Zxk4Gr9q+tLVCVQOBX5kWHJw10uj91XT/M1
 Nb9aXTILUu9tL3GciZa99iyq665NkHMGKWpgx+3mbO3ExlJaMJrmDVdCSpsfqiw4yHJq2CSsRuH
 2uCEqTc66OomT8HO3c/J3NLJNpQc4r435yPktiwfXD981gpIQOb1Wc3em3Y3DzgLOh03ww+q/qp
 Hg21t0yctl/QYneE66lsKw8T81Syo0=
X-Received: by 2002:a7b:cc99:0:b0:49c:cede:eeed with SMTP id
 5b1f17b1804b1-49cde7cbc28mr602095e9.15.1788274027702; 
 Tue, 01 Sep 2026 07:47:07 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce171c3sm75684865e9.8.2026.09.01.07.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:47:05 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:47:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 00/28] hw/arm/smmuv3: Support Secure state for SMMUv3
Message-ID: <apblZqQ26iFM-X3t@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=smostafa@google.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Aug 14, 2026 at 12:15:15AM +0800, Tao Tang wrote:
> Hi all,
> 
> This is v5 of the Secure SMMUv3 series.
> 
> Many thanks to everyone who reviewed the earlier versions. This version contains
> 28 commits in total. Only one patch touches hw/pci (patch #23); the remaining
> patches are confined to the Arm SMMUv3 model. Also some patches in v4 have been
> merged into the mainline QEMU tree, so the v5 series is now smaller than v4.
> 
> Secure Stage 2 is not implemented. Secure STEs which enable Stage 2 are
> rejected with C_BAD_STE. Realm and Root programming interfaces are outside the
> scope of this series.
> 
> Commits layout:
> ---------------
> The commits are roughly grouped as follows:
> 1. (#23, hw/pci only) Add a PCIDevice "sec-sid" property so boards can mark a
>   device's SEC_SID (system integration knob).
> 2. (#1-2, #24-27) Core data-structure and plumbing refactors.
> 3. (#3-8) Introduce SEC_SID through caches, notifiers, and helpers.
> 4. (#9-12) Page table walk related updates (e.g. NSCFG/PTE helpers).
> 5. (#13-15) EVTQ/CMDQ handling and invalidation paths.
> 6. (#16-22) MMIO/register access checks and architectural corner cases.
> 7. (#28) A temporary [NOT-MERGE] commit used with Hafnium to exercise
>   secure-bank register access.
> 
> 
> Main updates:
> -------------
> - (#23, hw/pci only) Add a "sec-sid" property to PCIDevice and consume it from
>   the SMMU in #24 to select the security context and validate capabilities.
> 
>   @Michael: could you please review the hw/pci change
>   ("hw/pci: Add sec-sid property to PCIDevice") and confirm this kind of
>   system-integration property is acceptable for the PCI subtree?
> 
>   For context, I previously posted this as a standalone patch [1]:
>   [1] https://lore.kernel.org/qemu-devel/20251211102729.227376-1-tangtao1634@phytium.com.cn/
> 
>   The commit in this v5 series is an updated version based on Pierrick's
>   feedback (notably switching sec-sid to a string property). We also discussed
>   the need for this knob as a prerequisite for accurately modelling SMMU secure
>   state here [2]:
> 
>   [2] https://lore.kernel.org/qemu-devel/4870b7df-4cb3-457e-9a18-87f3558adf09@linaro.org/
> 
>   We do need a stable way for boards to statically mark devices that may issue
>   Secure transactions.
> 
> other updates:
> - Drop the CR0 and CFGI_CD fixes which are already upstream.
> - Select MemTxAttrs and AddressSpace on demand from SEC_SID and keep the
>   programming-interface namespace in the configuration and IOTLB keys.
> - Route CMDQ, EventQ, IRQ and GERROR handling through the originating
>   programming-interface bank.
> - Tighten MMIO RAZ/WI, writability and reserved-bit handling.
> - Reject unsupported non-NS IOMMU notifier registration.
> - Make secure-impl an on/off/auto property, resolve auto from the Secure
>   AddressSpace, and require Stage 1 support when enabled.
> 
> 
> Testing notes:
> --------------
> - Testing MMIO accesses
>   The branch currently contains one commit explicitly marked [NOT-MERGE]. It is
>   only used to cooperate with Hafnium to exercise and validate secure-bank
>   register read/write paths in a small, reproducible setup as described in [3]:
>   [3] https://hnusdr.github.io/2025/08/09/Test-Secure-SMMU-with-Hafnium-ENG/
> 
>   This commit is not intended for upstream and will be dropped before posting
>   the final mergeable series.
> 
>   For reference, the Hafnium test logs show the SMMU being initialized
>   successfully:
> 
>   INFO: Loading VM id 0x8001: op-tee.
>   INFO: Loaded with 4 vCPUs, entry at 0xe300000.
>   INFO: Hafnium initialisation completed
> 
>   With all smmu* traces enabled in QEMU, we can also observe secure-bank MMIO
>   accesses and secure CMDQ consumption (sec_sid=1), including CFGI invalidations
>   with ssec=1.
> 
> - Testing DMA translation
>   DMA translation/invalidation is tested with qtest and iommu-testdev.
>   The required secure/space extensions are still under RFC at [4].
>   Branch [5] adds the integration needed to test this series.
> 
>   [4] https://gitlab.com/TaoTang/qemu/tree/qtest-secure-v5
>   [5] https://gitlab.com/TaoTang/qemu/tree/integration/secure-smmu-v5-qtest
> 
>   This covers Secure S1 translation and the unsupported SEL2 negative case:
> 
>     QTEST_QEMU_BINARY=./build/qemu-system-aarch64 \
>       ./build/tests/qtest/iommu-smmuv3-test --tap -k \
>       -p /aarch64/iommu-testdev/translation/secure-s1-only
> 
>     QTEST_QEMU_BINARY=./build/qemu-system-aarch64 \
>       ./build/tests/qtest/iommu-smmuv3-test --tap -k \
>       -p /aarch64/iommu-testdev/translation/secure-s2-only-bad-ste
> 
> 
> The patches are available in:
> https://gitlab.com/TaoTang/qemu/tree/series/secure-smmu-v5
> 
> CI is all green:
> https://gitlab.com/TaoTang/qemu/-/pipelines/2757878178
> 
> Best regards,
> Tao
> 
> 
> Tao Tang (28):
>   hw/arm/smmuv3: Introduce secure registers
>   hw/arm/smmuv3: Introduce banked registers for SMMUv3 state
>   hw/arm/smmuv3: Thread SEC_SID through helper APIs
>   hw/arm/smmuv3: Track SEC_SID in configs and events
>   hw/arm/smmu-common: Add security-aware address space selector
>   hw/arm/smmuv3: Plumb transaction attributes into config helpers
>   hw/arm/smmuv3: Reject secure STEs with stage-2 enabled
>   hw/arm/smmu-common: Key configuration cache on SMMUDevice and SEC_SID
>   hw/arm/smmu: Add PTE NS/NSTable helpers
>   hw/arm/smmuv3: Store CD NSCFG in TT info
>   hw/arm/smmu-common: Implement secure state handling in ptw
>   hw/arm/smmuv3: Tag IOTLB cache keys with SEC_SID
>   hw/arm/smmuv3: Pass sec_sid into cmdq consume path
>   hw/arm/smmuv3: Make evtq producer use SEC_SID
>   hw/arm/smmu: Make CMDQ invalidation security-state aware
>   hw/arm/smmuv3: Add access checks for GERROR_IRQ_CFG registers
>   hw/arm/smmuv3: Add access checks for STRTAB_BASE and CR2 registers
>   hw/arm/smmuv3: Add access checks for CMDQ and EVENTQ registers
>   hw/arm/smmuv3: Determine register bank from MMIO offset
>   hw/arm/smmuv3: Route IRQ and GERROR handling by SEC_SID
>   hw/arm/smmuv3: Implement SMMU_S_INIT register
>   hw/arm/smmuv3: Harden security checks in MMIO handlers
>   hw/pci: Add sec-sid property to PCIDevice
>   hw/arm/smmuv3: Select sec-sid from PCI property and validate
>     SECURE_IMPL
>   hw/arm/smmuv3: Reject IOMMU notifiers for non-NS devices
>   hw/arm/smmuv3: Initialize the secure register bank
>   hw/arm/smmuv3: Add secure bank migration and secure-impl property
>   [NOT-MERGE] hw/arm/smmuv3: temporarily enable SEL2 bit and some other
>     features
> 
>  hw/arm/smmu-common.c           |  406 +++++++--
>  hw/arm/smmu-internal.h         |   13 +
>  hw/arm/smmuv3-accel-stubs.c    |    6 +-
>  hw/arm/smmuv3-accel.c          |  104 ++-
>  hw/arm/smmuv3-accel.h          |    6 +-
>  hw/arm/smmuv3-internal.h       |   39 +-
>  hw/arm/smmuv3.c                | 1426 +++++++++++++++++++++++++-------
>  hw/arm/tegra241-cmdqv.c        |    6 +-
>  hw/arm/trace-events            |   37 +-
>  hw/pci/pci.c                   |    7 +
>  include/hw/arm/smmu-common.h   |   74 +-
>  include/hw/arm/smmuv3-common.h |   77 +-
>  include/hw/arm/smmuv3.h        |   33 +-
>  include/hw/pci/pci_device.h    |    3 +
>  14 files changed, 1780 insertions(+), 457 deletions(-)

I verified this series without the last patch does not break my
nested (NS) SMMUv3 setup.

Also, I see the series is getting in a good shape and have many tags,
so it might be a good idea to drop the RFC.

Thanks,
Mostafa

> 
> --
> 2.34.1
> 

