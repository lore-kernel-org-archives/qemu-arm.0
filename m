Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9802CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:51:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvN-0004yP-0i; Sat, 30 Aug 2025 11:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELM-0005n8-Iy
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:41 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELI-00040N-Pa
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b4cb3367d87so1189978a12.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532495; x=1757137295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YSDKOHMJ8LzZafWugFBoxtinx6LpqyI+FVcpeR420n4=;
 b=gtcG3ulzNkf74tCnDiHgfo4XWCQMCzQnyFWuvDN2nfPqT8+zO+yjtpoXUsgYk2eMh3
 tHmPojnrd/06ZT6xnWu48CkUp8KyW7WkYMJxIpC493Mr1RUcCp+BMJivjuxtGbaPLH7a
 tr0uzQHzln5Gg9YLDLRwrjyDz1RASD3K7lWMpNgYVM8zouQ7V1Yvixa3/FrEW8vX+U5E
 PNLkuSoy2xkTtxfMhJf1XofTkfO9Yi8vZ/pUvvfwYaOgGag00pEs2UG+1ZZMX3UU4P2p
 5xw7wN7tD3Iw2j0pU2T/Z91CRPeMv6GBC9yBIE6eJx9+GvbBYYVB2p8uw7wB6sGEeyMu
 cS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532495; x=1757137295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSDKOHMJ8LzZafWugFBoxtinx6LpqyI+FVcpeR420n4=;
 b=hqx8f4/d1pfrzFec6tbkIM9bvNL3dyhdYxrQ4OfKlI4aHqj6BoorvyM4JlM7ScVGw4
 3kn7v0cxKaayLs7ZcdV/1V9pNaYtxfRRdp2nF0biZXK3NtvyWhHpXv/D+e0PXanQnSC2
 KRIvrXG71oEgHyuEvxOxTSVHSWZFdfn570r/4xKCMGVUb5ruS/ZreZGaF1yufFFMRMrW
 3BlSHPtnav+yDbZfZbFEv08mSFwxV3Hb2+gja1waKIcNv9f8It+w4wBFuCaqIs58Vl9X
 TVogGxnRc7C5i2Kl3TiKMI8Z3dGW17dVYobt3Kfo/SVx8S9Bt11HlTUpjy9CyPf+uwlG
 bGxg==
X-Gm-Message-State: AOJu0Yxq24r5/AYnbWsCLw2Vc+lSIGvVNOZjiXolVGIeO6ZzACBWP2/u
 LJfSgvHTRDr/O9q89rUfRfwMkfBPM3DtxPyAD3Nm478ymD51c859ETKiXNVUVPc7LqisNFLbbge
 e5/xpHG4=
X-Gm-Gg: ASbGnctbEPj9RW3VHF9aSxayEtmi4bm1mWNGaFLa6nlC2uJldmOFHy6LtmtbY5EJB9X
 uzUD5mwHPsGlftrW6lIWerzfH4O88t97efSmQiWewC0qE4AySuAdDf5k009eUKMMrqCKrvFLGic
 MNK/OOYFPaNyRRdIRfuwftnRX0tLk/kovu28nBlohihxZBvOGc9Cm3WOHGi2Fxay1ZgkYBBeT8T
 0iQemNBebeCZqKquZIFePOVt1F1Xmd3PrsPyLA+84zP44Uh1B9E0D2bc6Vy7mbM2KFUQaJUK2Uo
 yHmy3c1Ls+jcxDYo0Aa3RNYKCfKgVTUD8NiNIjvcM/1f6nyTFssJEPD/kHUL2+emqNmoxiThsKL
 yu3B9Jzo7UbKlf+qDZqh4HEQsufyn/R+mDmDZNH31/WL+qdJ1v4E5TYF/qTWmwOZWvivFpU0=
X-Google-Smtp-Source: AGHT+IGSP+w37twFrhLFnUN/CRW2goG/NT0AZf+02atYQE+0WVPjHcN5zJ6B74K8H+x533vR3guuDw==
X-Received: by 2002:a17:90b:1b4b:b0:324:e6ea:f959 with SMTP id
 98e67ed59e1d1-3281543747cmr1645542a91.14.1756532494516; 
 Fri, 29 Aug 2025 22:41:34 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:41:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 00/84] target/arm: Implement FEAT_GCS
Date: Sat, 30 Aug 2025 15:40:04 +1000
Message-ID: <20250830054128.448363-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Based on Peter's tags/pull-target-arm-20250828.
Tree: https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-gcs

This includes the prerequisite features, ATS1A and S1PIE, and
not a prerequisite but closely related, S2PIE.

This passes the linux kselftests for gcs, with a 48-bit VA.
I also include a few smoke tests in tests/tcg/.


This includes a best-effort linux-user implementation.  Since we
don't have softmmu in user-only (yet), gcs stack pages get normal
read/write access.  This means we cannot write-protect the pages
in the same way the system implementation can.  But all of the
other parts of GCS work fine, which is good enough for testing.

Changes for v4:
  - Rebase on target-arm.next, which includes all prereqs.
  - Fixes up the minor conflicts with the elfload.c split.
  - Include Thiago's t-b on the system-mode enable patch.


r~


Richard Henderson (84):
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
 linux-user/qemu.h                  |   5 +
 target/arm/cpregs.h                |  46 ++-
 target/arm/cpu-features.h          |  20 ++
 target/arm/cpu.h                   | 242 ++--------------
 target/arm/internals.h             | 169 ++----------
 target/arm/mmuidx-internal.h       | 113 ++++++++
 target/arm/mmuidx.h                | 241 ++++++++++++++++
 target/arm/syndrome.h              |  35 +++
 target/arm/tcg/translate.h         |  46 ++-
 target/hppa/cpu.h                  |  28 +-
 tests/tcg/aarch64/gcs.h            |  80 ++++++
 accel/tcg/cputlb.c                 |  49 ++--
 linux-user/aarch64/cpu_loop.c      | 167 ++++++++---
 linux-user/aarch64/elfload.c       |   1 +
 linux-user/aarch64/signal.c        | 170 +++++++++++-
 linux-user/syscall.c               | 114 ++++++++
 target/arm/cpregs-gcs.c            | 152 ++++++++++
 target/arm/cpu.c                   |  17 +-
 target/arm/gdbstub64.c             |   2 +
 target/arm/helper.c                | 268 ++++++++++++++----
 target/arm/machine.c               |  62 ++++-
 target/arm/mmuidx.c                |  66 +++++
 target/arm/ptw.c                   | 429 +++++++++++++++++++++-------
 target/arm/tcg-stubs.c             |   2 +-
 target/arm/tcg/cpregs-at.c         |  69 +++--
 target/arm/tcg/cpu64.c             |   4 +
 target/arm/tcg/helper-a64.c        |  13 +-
 target/arm/tcg/hflags.c            |  38 +++
 target/arm/tcg/m_helper.c          |   4 +-
 target/arm/tcg/mte_helper.c        |   2 +-
 target/arm/tcg/op_helper.c         |   8 +-
 target/arm/tcg/tlb-insns.c         |  47 +++-
 target/arm/tcg/tlb_helper.c        |  18 +-
 target/arm/tcg/translate-a64.c     | 430 ++++++++++++++++++++++++++---
 target/arm/tcg/translate.c         |  78 ++++--
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
 51 files changed, 2931 insertions(+), 729 deletions(-)
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


