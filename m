Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10362C87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLgV-0006N9-9W; Sat, 02 Aug 2025 19:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLg1-0006C9-9d
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:09 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLfy-0004nR-Fe
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:08 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2eff5d1c7efso2019179fac.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177405; x=1754782205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gj0HYXH5K/X5UW7ipGwXTjJQIp/SZMWwHX6LGLA5Jq4=;
 b=vdNjaqff6OkaDScE72vkBiAP/RhDGYTV2jDMrcUWx4D4w0uOpXJPqI7PUWQPk4trDr
 yW1Hupn52LOdK+cnej3CeH0jQsvK0wbwtp0JFx3ulueKFcD0GVFBdjVbjSENRtEGE/Hl
 GX//qIb4/6rqbhlwjsgVZuSZTX0xwCPfKH7E64VuJXw26pb4/X0NmNwfXoupwHpKmUgc
 R/OHBT58Yd2FAb0cWvVaUgchHf5vJ/VEa6R0JJTvzhUeceCXN+ni5fN8ERULp1JeB9qD
 jtcO/pZe1RpDk4rCMbLaiqBVTmsHvIheDlMGYF2FJFXtzzmwFNQuWLa+x5F7HuFVVq6F
 dWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177405; x=1754782205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gj0HYXH5K/X5UW7ipGwXTjJQIp/SZMWwHX6LGLA5Jq4=;
 b=QySigjA9KltOGieiQi1fzmHSiyc2VKBINtLRxr+xtjW8LD52T4ZavWD8s7OyjQp8vD
 RvCi/q8H90sDKM657z/HEFvGzGNWoCFZFFEjGAn/1ATlqyw93+3xbTG2wzhD/TByv22k
 7gFa7eaebGYR9Xa2A1I4pn4Q60rotq1x3bsPl6kOHHPBPGSGkSxQjD9WNTv8brGVJiw3
 dnQiu/Mrd1tUay6toX6R9ktnOYwARFlAwETum/skM1MZRTmd1uyHYj+GwiP2+XOn/pHO
 suBovSenmyaO+K76TN85ZcAt8uSYBzCQPyNyhSoREFwBR2AXT8ABtF697NIEEC5HaQAy
 ZD1A==
X-Gm-Message-State: AOJu0Yxne37PvCiHr2eiDD/pSGKJ7AvOpJ/aZvl6qvbHQJnvhHj0e6py
 gYKzxhYeoEEhpow1N7/VqSUFoMFLRPeGT/QKhkmnTGrW35RtbhMMD+lfHRzR6lpyucM=
X-Gm-Gg: ASbGncsOE0wB3fETUtDBK5wd0LaJCDwFggFI+wO9RuAg+QM45zlp9ri+yPDSmF+aC6L
 mgTzGCpjnkgyF2DVr76IPl0F0gW03pEzZtwl9x4tV3YiMviRIe6V/X478n7++N8Is3BTQvr2vHc
 Ee2rVlVHWBKYerMwZ6NzWsdcIG83G+YCo4Ufs24TUpRLDE15eh2kG7d6ygHpCVEnNoQHgVBx3IX
 brE2iJ64TUvymRleLwwrM0sSvmCGSvAi2X2QF5nYEfw7YvLGYkSERKk+AT4f6583yZIfLMtze3z
 He94SfAjZcXm9/Znw4Qz1nFcHTCDtIsfPs/VKbaDew6WVVVU1BmN1D6lwpW3OOIbTtxasU3Hb0Y
 2iZ6kCKWZfejQvVxBbH2zKnyryARLoYgLVBC9vO2l/UPsVga5uTr/
X-Google-Smtp-Source: AGHT+IG4lxwDdAb3A3jO0gOLjX+rsw+DQkxLC7EKogdI5M2/t3L7Z4jfEy1Zko7kuZVAGe6zLOyuhA==
X-Received: by 2002:a05:687c:2618:b0:30b:7d90:1061 with SMTP id
 586e51a60fabf-30b7d906456mr915854fac.4.1754177404678; 
 Sat, 02 Aug 2025 16:30:04 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:30:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/85] target/arm: Implement FEAT_GCS
Date: Sun,  3 Aug 2025 09:28:28 +1000
Message-ID: <20250802232953.413294-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Based-on: 20250727074202.83141-1-richard.henderson@linaro.org
("[PATCH for-10.2 v9 0/6] target/arm: Add FEAT_MEC to max cpu")

Tree: https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-gcs

This includes the prerequisite features, ATS1A and S1PIE, and
not a prerequisite but closely related, S2PIE.

This passes the linux kselftests for gcs, with a 48-bit VA.
I also include a few smoke tests in tests/tcg/.

There's something subtly wrong with a 52-bit VA.  Most everything
works fine, but the first GCS lookup faults on a missing level 3
page table entry: a Translation fault, not a Permission fault.
The kernel then panics.  Either there's something amiss with our
implementation of FEAT_LPA2, or there's a kernel bug.

This includes a best-effort linux-user implementation.  Since we
don't have softmmu in user-only (yet), gcs stack pages get normal
read/write access.  This means we cannot write-protect the pages
in the same way the system implementation can.  But all of the
other parts of GCS work fine, which is good enough for testing.

Changes for v2:
  - Add arm_mmuidx_is_valid
  - Revise and merge back the linux-user/aarch64 changes for
    syndromes and ESR records.


r~


Richard Henderson (85):
  linux-user/aarch64: Split out signal_for_exception
  linux-user/aarch64: Check syndrome for EXCP_UDEF
  linux-user/aarch64: Generate ESR signal records
  target/arm: Add prot_check parameter to pmsav8_mpu_lookup
  target/arm: Add in_prot_check to S1Translate
  target/arm: Skip permission check from
    arm_cpu_get_phys_page_attrs_debug
  target/arm: Introduce get_phys_addr_for_at
  target/arm: Skip AF and DB updates for AccessType_AT
  target/arm: Add prot_check parameter to do_ats_write
  target/arm: Fill in HFG[RWI]TR_EL2 bits for Arm v9.5
  target/arm: Remove outdated comment for ZCR_EL12
  target/arm: Implement FEAT_ATS1A
  target/arm: Add isar feature test for FEAT_S1PIE, FEAT_S2PIE
  target/arm: Enable TCR2_ELx.PIE
  target/arm: Implement PIR_ELx, PIRE0_ELx, S2PIR_EL2 registers
  target/arm: Force HPD for stage2 translations
  target/arm: Cache NV1 early in get_phys_addr_lpae
  target/arm: Populate PIE in aa64_va_parameters
  target/arm: Implement get_S1prot_indirect
  target/arm: Implement get_S2prot_indirect
  target/arm: Do not migrate env->exception
  target/arm: Expand CPUARMState.exception.syndrome to 64 bits
  target/arm: Expand syndrome parameter to raise_exception*
  target/arm: Implement dirtybit check for PIE
  target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu max
  include/hw/core/cpu: Introduce MMUIdxMap
  include/hw/core/cpu: Introduce cpu_tlb_fast
  include/hw/core/cpu: Invert the indexing into CPUTLBDescFast
  target/hppa: Adjust mmu indexes to begin with 0
  include/exec/memopidx: Adjust for 32 mmu indexes
  include/hw/core/cpu: Widen MMUIdxMap
  target/arm: Split out mmuidx.h from cpu.h
  target/arm: Convert arm_mmu_idx_to_el from switch to table
  target/arm: Remove unused env argument from regime_el
  target/arm: Convert regime_el from switch to table
  target/arm: Convert regime_has_2_ranges from switch to table
  target/arm: Remove unused env argument from regime_is_pan
  target/arm: Convert regime_is_pan from switch to table
  target/arm: Remove unused env argument from regime_is_user
  target/arm: Convert regime_is_user from switch to table
  target/arm: Convert arm_mmu_idx_is_stage1_of_2 from switch to table
  target/arm: Convert regime_is_stage2 to table
  target/arm: Introduce mmu indexes for GCS
  target/arm: Introduce regime_to_gcs
  target/arm: Support page protections for GCS mmu indexes
  target/arm: Implement gcs bit for data abort
  target/arm: Add GCS cpregs
  target/arm: Add GCS enable and trap levels to DisasContext
  target/arm: Implement FEAT_CHK
  target/arm: Expand pstate to 64 bits
  target/arm: Add syndrome data for EC_GCS
  target/arm: Implement EXLOCKException for ELR_ELx and SPSR_ELx
  target/arm: Split {arm,core}_user_mem_index
  target/arm: Introduce delay_exception{_el}
  target/arm: Emit HSTR trap exception out of line
  target/arm: Emit v7m LTPSIZE exception out of line
  target/arm: Implement GCSSTR, GCSSTTR
  target/arm: Implement GCSB
  target/arm: Implement GCSPUSHM
  target/arm: Implement GCSPOPM
  target/arm: Implement GCSPUSHX
  target/arm: Implement GCSPOPX
  target/arm: Implement GCSPOPCX
  target/arm: Implement GCSSS1
  target/arm: Implement GCSSS2
  target/arm: Add gcs record for BL
  target/arm: Add gcs record for BLR
  target/arm: Add gcs record for BLR with PAuth
  target/arm: Load gcs record for RET
  target/arm: Load gcs record for RET with PAuth
  target/arm: Copy EXLOCKEn to EXLOCK on exception to the same EL
  target/arm: Implement EXLOCK check during exception return
  target/arm: Enable FEAT_GCS with -cpu max
  linux-user/aarch64: Implement prctls for GCS
  linux-user/aarch64: Allocate new gcs stack on clone
  linux-user/aarch64: Release gcs stack on thread exit
  linux-user/aarch64: Implement map_shadow_stack syscall
  target/arm: Enable GCSPR_EL0 for read in user-mode
  linux-user/aarch64: Inject SIGSEGV for GCS faults
  linux-user/aarch64: Generate GCS signal records
  linux-user: Change exported get_elf_hwcap to abi_ulong
  linux-user/aarch64: Enable GCS in HWCAP
  tests/tcg/aarch64: Add gcsstr
  tests/tcg/aarch64: Add gcspushm
  tests/tcg/aarch64: Add gcsss

 include/exec/cputlb.h              |  32 +--
 include/exec/memopidx.h            |   9 +-
 include/hw/core/cpu.h              |  25 +-
 linux-user/aarch64/gcs-internal.h  |  38 +++
 linux-user/aarch64/target_prctl.h  |  96 +++++++
 linux-user/aarch64/target_signal.h |   1 +
 linux-user/loader.h                |   2 +-
 linux-user/qemu.h                  |   5 +
 target/arm/cpregs.h                |  46 ++-
 target/arm/cpu-features.h          |  20 ++
 target/arm/cpu.h                   | 242 ++--------------
 target/arm/internals.h             | 170 ++---------
 target/arm/mmuidx-internal.h       | 113 ++++++++
 target/arm/mmuidx.h                | 241 ++++++++++++++++
 target/arm/syndrome.h              |  35 +++
 target/arm/tcg/translate.h         |  46 ++-
 target/hppa/cpu.h                  |  28 +-
 tests/tcg/aarch64/gcs.h            |  80 ++++++
 accel/tcg/cputlb.c                 |  49 ++--
 linux-user/aarch64/cpu_loop.c      | 158 ++++++++---
 linux-user/aarch64/signal.c        | 161 ++++++++++-
 linux-user/elfload.c               |  11 +-
 linux-user/syscall.c               | 114 ++++++++
 target/arm/cpregs-gcs.c            | 141 ++++++++++
 target/arm/cpu.c                   |  17 +-
 target/arm/gdbstub64.c             |   1 +
 target/arm/helper.c                | 270 ++++++++++++++----
 target/arm/machine.c               |  62 +++-
 target/arm/mmuidx.c                |  66 +++++
 target/arm/ptw.c                   | 430 +++++++++++++++++++++-------
 target/arm/tcg-stubs.c             |   2 +-
 target/arm/tcg/cpregs-at.c         |  69 +++--
 target/arm/tcg/cpu64.c             |   4 +
 target/arm/tcg/helper-a64.c        |  13 +-
 target/arm/tcg/hflags.c            |  38 +++
 target/arm/tcg/m_helper.c          |   4 +-
 target/arm/tcg/mte_helper.c        |   2 +-
 target/arm/tcg/op_helper.c         |   8 +-
 target/arm/tcg/tlb-insns.c         |  47 +++-
 target/arm/tcg/tlb_helper.c        |  13 +-
 target/arm/tcg/translate-a64.c     | 437 ++++++++++++++++++++++++++---
 target/arm/tcg/translate.c         |  78 +++--
 tcg/tcg.c                          |   3 +-
 tests/tcg/aarch64/gcspushm.c       |  71 +++++
 tests/tcg/aarch64/gcsss.c          |  74 +++++
 tests/tcg/aarch64/gcsstr.c         |  48 ++++
 docs/system/arm/emulation.rst      |   5 +
 target/arm/meson.build             |   9 +-
 target/arm/tcg/a64.decode          |   5 +
 tcg/aarch64/tcg-target.c.inc       |   2 +-
 tcg/arm/tcg-target.c.inc           |   2 +-
 tests/tcg/aarch64/Makefile.target  |   5 +
 52 files changed, 2914 insertions(+), 734 deletions(-)
 create mode 100644 linux-user/aarch64/gcs-internal.h
 create mode 100644 target/arm/mmuidx-internal.h
 create mode 100644 target/arm/mmuidx.h
 create mode 100644 tests/tcg/aarch64/gcs.h
 create mode 100644 target/arm/cpregs-gcs.c
 create mode 100644 target/arm/mmuidx.c
 create mode 100644 tests/tcg/aarch64/gcspushm.c
 create mode 100644 tests/tcg/aarch64/gcsss.c
 create mode 100644 tests/tcg/aarch64/gcsstr.c

-- 
2.43.0


