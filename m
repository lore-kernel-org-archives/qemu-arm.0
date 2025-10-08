Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC49CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 21:58:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9A-0003s0-Ot; Wed, 08 Oct 2025 17:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c98-0003rS-RP
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:31 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c8x-0006cK-Vb
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:30 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b4ee87cc81eso222704a12.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960575; x=1760565375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SfcXr5UWt0SadCwReY9na2q03gghzKTQ+9WscMeEZpg=;
 b=CgGOnqL4cFJtDNn/yhFWzSXZpOUmGn8XqmYhhQSbiUoBkd0PcpaF5OkxkmofdSCitq
 ZPU9Cf47W9s5eZHOdvMyEcZhV6p0baEZNYknAVGOdcRohwJ9wAnYo1p9TrsBy1ro9tIh
 SsR0bugZZRI1iVA7qdpTR/w8b7t0mVRBWTJcxUNJh4l8TUJmkzS6TeRFVJ1Do267yL2E
 FYEQUHrzxDy2s2pQaWjS8KbH52/cmX+3Gnm7rA2+fOd4j6oWr5K/yUBtykNdjhntT8hK
 GmqQay3aEfo1bx8rVL+aixyX9XSpPxmsANJ1ZovmJRkorNNZ6XOq5nvu70Y5/E96EIOG
 +FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960575; x=1760565375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SfcXr5UWt0SadCwReY9na2q03gghzKTQ+9WscMeEZpg=;
 b=g/oYUGoCac/Vd3G5kXgrXRBft7MgAp8IbTxlsYa7swyZWYONlFAYU0un2MqS6Y3KP3
 DrEVhxnd0H6o46syquBfLgrDcQDG6Y50Woul0lxw+s5vD+SKS8bTletws17NYV8sq8DC
 H3SCKRyRUXi8Ww/ZiBiWq3p+/Zx0p8GLVcMXQN6U5fZUjTY61HRQqwHxNdsxkDv7C2Gn
 0nOo1zvi2AAscMcuzxhR0Qy0WpkKqv/Hf51Qx+q9CH58Y47/ykH5G33B4rx6EXGkBxUQ
 P4CQ6bcFXX4SahIWQLFDKrrGiSFP1jeKy4wh9Jj5cn2LnmHyu4KhUi/D0umVFi3a3gV3
 E3tA==
X-Gm-Message-State: AOJu0YyxZWrcdIgPZstoAC1yEca1DSQL4WhjPzWMeSCUkd+t94rswgHA
 AJhQGbHZpB097MbFRHlzobL1vBiV7g1yyGqlZDPOw9NjDIA5xY7gvkoCG62fGt+HPk4=
X-Gm-Gg: ASbGnct42jjytr6r1rX2TZ19oqn1gpg6KAr3FRvvzmzPgshDcZf6ajgZMmUPukwW8bl
 BJM2UBbMDm5zWA7t7SX48DCE28TscmSWj5bB1ckbL9W/UGMqfH0l05DPmz+dUdSL8gsPpucP8WL
 266NPu0wGt9xAIJefWDawmnkSkOtru3re/ALUCj3X5+sfD293aDX52ZiIZznkzXy7HMdM6580g1
 bUN7S3yf03Yff6TQUnrFmc4eZcKa2Pztg85sR2iGCGYuLqq749U3dFF+pB1Ye1vT9e1H0ZZbcmv
 C/9FzPMAAsScp6oRBjBqKRzGTpq/EcMX7p+GGwrcJUxxrPliZf4yjow3/UNRIOvcvYWGKE265cj
 yywxHKTSECscutcEEcb3CkKTtOsf3EG/1aARXBJlbBeYHoBT4oGxCuMNu
X-Google-Smtp-Source: AGHT+IEqOkBusYa9vJQSgd/uQIFbwD/J8wfgj4ZSJ5Ris2RDH/JQNYgwHEziMaoHBs5XzTo/0Um93w==
X-Received: by 2002:a17:903:3c6e:b0:267:ed5e:c902 with SMTP id
 d9443c01a7336-29027374b4fmr66808035ad.20.1759960574617; 
 Wed, 08 Oct 2025 14:56:14 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 00/73] target/arm: Implement FEAT_GCS
Date: Wed,  8 Oct 2025 14:55:00 -0700
Message-ID: <20251008215613.300150-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Changes from v6:
  - Resolve conflicts with master.
  - Fix size of TCGv cpu_gcssp[]
  - All patches now reviewed.

r~

Pierrick Bouvier (1):
  tests/functional: update tests using TF-A/TF-RMM to support FEAT_GCS

Richard Henderson (72):
  target/arm: Add isar feature test for FEAT_S1PIE, FEAT_S2PIE
  target/arm: Enable TCR2_ELx.PIE
  target/arm: Implement PIR_ELx, PIRE0_ELx, S2PIR_EL2 registers
  target/arm: Force HPD for stage2 translations
  target/arm: Cache NV1 early in get_phys_addr_lpae
  target/arm: Populate PIE in aa64_va_parameters
  target/arm: Implement get_S1prot_indirect
  target/arm: Implement get_S2prot_indirect
  target/arm: Expand CPUARMState.exception.syndrome to 64 bits
  target/arm: Expand syndrome parameter to raise_exception*
  target/arm: Implement dirtybit check for PIE
  target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu max
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
  target/arm: Make helper_exception_return system-only
  target/arm: Export cpsr_{read_for,write_from}_spsr_elx
  target/arm: Expand pstate to 64 bits
  target/arm: Add syndrome data for EC_GCS
  target/arm: Add arm_hcr_el2_nvx_eff
  target/arm: Use arm_hcr_el2_nvx_eff in access_nv1
  target/arm: Split out access_nv1_with_nvx
  target/arm: Implement EXLOCKException for ELR_ELx and SPSR_ELx
  target/arm: Split {full,core}_a64_user_mem_index
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

 include/exec/memopidx.h                       |   9 +-
 include/hw/core/cpu.h                         |   7 +-
 linux-user/aarch64/gcs-internal.h             |  38 ++
 linux-user/aarch64/target_prctl.h             |  96 ++++
 linux-user/aarch64/target_signal.h            |   1 +
 linux-user/qemu.h                             |   5 +
 target/arm/cpregs.h                           |  22 +
 target/arm/cpu-features.h                     |  15 +
 target/arm/cpu.h                              | 243 ++--------
 target/arm/internals.h                        | 148 +-----
 target/arm/mmuidx-internal.h                  | 113 +++++
 target/arm/mmuidx.h                           | 241 ++++++++++
 target/arm/syndrome.h                         |  35 ++
 target/arm/tcg/helper-a64.h                   |   5 +-
 target/arm/tcg/translate.h                    |  46 +-
 tests/tcg/aarch64/gcs.h                       |  80 ++++
 accel/tcg/cputlb.c                            |   3 -
 linux-user/aarch64/cpu_loop.c                 |   5 +
 linux-user/aarch64/elfload.c                  |   1 +
 linux-user/aarch64/signal.c                   | 138 +++++-
 linux-user/syscall.c                          | 114 +++++
 target/arm/cpregs-gcs.c                       | 156 +++++++
 target/arm/cpu.c                              |  17 +-
 target/arm/gdbstub64.c                        |   2 +
 target/arm/helper.c                           | 283 ++++++++---
 target/arm/machine.c                          | 113 ++++-
 target/arm/mmuidx.c                           |  66 +++
 target/arm/ptw.c                              | 365 ++++++++++++---
 target/arm/tcg-stubs.c                        |   2 +-
 target/arm/tcg/cpu64.c                        |   3 +
 target/arm/tcg/helper-a64.c                   |  35 +-
 target/arm/tcg/hflags.c                       |  38 ++
 target/arm/tcg/mte_helper.c                   |   2 +-
 target/arm/tcg/op_helper.c                    |  11 +-
 target/arm/tcg/tlb-insns.c                    |  47 +-
 target/arm/tcg/tlb_helper.c                   |  18 +-
 target/arm/tcg/translate-a64.c                | 438 ++++++++++++++++--
 target/arm/tcg/translate.c                    |  78 +++-
 tests/tcg/aarch64/gcspushm.c                  |  71 +++
 tests/tcg/aarch64/gcsss.c                     |  74 +++
 tests/tcg/aarch64/gcsstr.c                    |  48 ++
 docs/system/arm/emulation.rst                 |   4 +
 target/arm/meson.build                        |   9 +-
 target/arm/tcg/a64.decode                     |   5 +
 .../aarch64/test_device_passthrough.py        |   4 +-
 tests/functional/aarch64/test_rme_sbsaref.py  |   4 +-
 tests/functional/aarch64/test_rme_virt.py     |   4 +-
 tests/tcg/aarch64/Makefile.target             |   5 +
 48 files changed, 2662 insertions(+), 605 deletions(-)
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


