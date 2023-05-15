Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6557042ejq;
        Mon, 15 May 2023 07:34:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6PTVrH3IpyAFy+POsXrRNdkNYlk9u8lkb6fX+CYEqHoNvfkrCILfRSmJPoGKnZSMWq1Ipm
X-Received: by 2002:a05:6214:628:b0:5ef:4254:d6f0 with SMTP id a8-20020a056214062800b005ef4254d6f0mr58653743qvx.36.1684161280278;
        Mon, 15 May 2023 07:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161280; cv=none;
        d=google.com; s=arc-20160816;
        b=aYWcNTCVx+MJ+Z/PrLoJjWlXwh9Na0oYqKXYJYPSo7/gKaoXSQClZjyzVVZwHoFuay
         MilLJhFZrbv9knotikygCM7JjByrBL/589SJcC1hbfakPlwmgnwjI0BhJfWbSjxiavIl
         hyI4gR8rS/hzbF09jZw/eYV8O7qCuMse1OTV76ajMTKb7ol2GHEgMid9sylMiZSKjuOC
         xQOFjrhWuyLEru5jHdeOCMCR6M7goGt5IcfgbOVezbGyAKt0+HKBZ4gFDWMWVziEjdpK
         gP1fx3K3ktVZlGrR3nOJxN0wn3ydRNKAC0PGeq/7vzzd1a2mteYUZAxKppKyIbovEyO2
         SI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=w2rE5nfLDJUcmbFWfBbtN5b2B3Bg6j8netQl/rXbAyE=;
        b=skngg7wFF5/PJhxtozm5bvMLU+b/+tMtlUltf5mEH2/gl24YHakzCvkCXn/Zz94hcC
         VQbUIMM9QNydL1iFoDA4yQRGMgm01W+4OhWkQSAEkeeGE8D85kw1BobK9F3sBtuUZcUv
         WF5v6eRleRcXzgopXaxBBGcVVrRHLvtKTU8B8xJ81SReW8i0K7J25pAUTlCdB1p3Xuku
         T8jXXZ2/mcsf1+gP+oqH2RFe47fy+CukEOqkA1pKyYLTeA+3XEaSOBhxNpyL4Y34/0dl
         4SFC06WmAYcYifxVUGG6620oSJTXtyoKU4YUcChE6BnJ+A5wWh4iebYTNNCRxYqmbv7Y
         jhsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvG48hnj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a05621421e200b005ef6e02d541si9773724qvj.188.2023.05.15.07.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvG48hnj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZGW-0006kO-VT; Mon, 15 May 2023 10:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGJ-0006gL-2o
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:19 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGG-0004pi-Pk
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aad5245632so91376375ad.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161195; x=1686753195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w2rE5nfLDJUcmbFWfBbtN5b2B3Bg6j8netQl/rXbAyE=;
 b=HvG48hnjggGkfmtI1J9t3WfxGqns05fe+XrrLdH1SgH7Z9zwnLaWyOwF7tiRc/AwG3
 pOXiMG1emr27+0BF8miY4Jl8dLgZIGICb9Rn3cr6aDhNYlNV/KkQOrBHjAOwp7uIp+o4
 oCFXy8Hv8BwN6GKh6Z28yIMjpC5daybh0PoMKy+5qX028PaQ5RoNCyN9SYi8iuOc0Vyr
 jg6Tl05/ULUvwP5DmiOU41RA7dl6VsvV/GFD9A4gjlJiHxxlcNJkJvMV+FO2jEgz4lNV
 0J9YQsn7NP8yMRHNnDIfe3QFxK3OaS3yHyFmdkcvW3+OdpZdRRkBY4+IWnh28GfmrglO
 uLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161195; x=1686753195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w2rE5nfLDJUcmbFWfBbtN5b2B3Bg6j8netQl/rXbAyE=;
 b=kDZlFw7HOsb9umBB9pDILOfPAGQ7EAMaa+i6NR/imo6Qe9oxfkw82aLHplOAlWTmso
 eYLJY0MWiJXdlVMN1pvAH3ywOsC3hx518hD6+82ejw4PEQ3J1SAzC36eieolyr9p1ykG
 NtABzX9cW+l5I+3mdvK38JL3LvtLPyjeE/7Sh09Q4MfM/aoFYdNForzcOEHSlI2sysxC
 8XwXboBTyHjPHZIwsMvunrH+BJtvfx7Mi9bmF+RZsS8q8uvdpF8ztSx3mCSfL5BbgQaT
 xZKMpwx1ImD6Aw0x1wAbZmFOEZZ1/vcPNziKUPY7ggubkmK3Sz+5E3QUqnlKf/3/oJjt
 9XRg==
X-Gm-Message-State: AC+VfDz9/smRq+l+a4WNyHSQ+FO3kHuW09IAgDqz9NiexSsqXITkbegw
 2mo5qjGA3rG80XI0eJu6fOYl8IJ9ekQ/ywpRPz8=
X-Received: by 2002:a17:903:124a:b0:1ac:4d01:dfec with SMTP id
 u10-20020a170903124a00b001ac4d01dfecmr45062416plh.54.1684161195037; 
 Mon, 15 May 2023 07:33:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 00/54] tcg: Improve atomicity support
Date: Mon, 15 May 2023 07:32:19 -0700
Message-Id: <20230515143313.734053-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: saIOy9vD8V6/

v4: https://lore.kernel.org/qemu-devel/20230503070656.1746170-1-richard.henderson@linaro.org/

The main objective here is to support Arm FEAT_LSE2, which says that any
single memory access that does not cross a 16-byte boundary is atomic.
This is the MO_ATOM_WITHIN16_* control.

While I'm touching all of this, a secondary objective is to handle the
atomicity of the IBM machines.  Power treats misaligned accesses as
atomic on the lsb of the pointer.  This is the MO_ATOM_SUBALIGN control.

By default, acceses are atomic only if aligned, which is the current
behaviour of the tcg code generator (mostly, anyway, there were bugs).
This is the MO_ATOM_IFALIGN control.

Changes for v5:
  - Drop MO_ATMAX_*.  The two cases we really care about become
    MO_ATOM_{IFALIGN,WITHIN16}_PAIR.  Some r-b dropped as a consequence.
  - Introduce struct TCGAtomAlign, and more consistently install
    it into struct HostAddress, to reduce the variance between
    the host backends.
  - All prerequisites merged!

Patches lacking review:
  01-include-exec-memop-Add-MO_ATOM_.patch
  02-accel-tcg-Honor-atomicity-of-loads.patch
  03-accel-tcg-Honor-atomicity-of-stores.patch
  07-tcg-Add-128-bit-guest-memory-primitives.patch
  09-tcg-i386-Add-have_atomic16.patch
  10-accel-tcg-Use-have_atomic16-in-ldst_atomicity.c.i.patch
  11-accel-tcg-Add-aarch64-specific-support-in-ldst_at.patch
  14-accel-tcg-Add-have_lse2-support-in-ldst_atomicity.patch
  20-tcg-arm-Adjust-constraints-on-qemu_ld-st.patch
  24-tcg-sparc64-Allocate-g2-as-a-third-temporary.patch
  25-tcg-sparc64-Rename-tcg_out_movi_imm13-to-tcg_out_.patch
  26-target-sparc64-Remove-tcg_out_movi_s13-case-from-.patch
  27-tcg-sparc64-Rename-tcg_out_movi_imm32-to-tcg_out_.patch
  29-tcg-sparc64-Use-standard-slow-path-for-softmmu.patch
  31-tcg-loongarch64-Check-the-host-supports-unaligned.patch
  36-tcg-Introduce-tcg_out_movext3.patch
  37-tcg-Merge-tcg_out_helper_load_regs-into-caller.patch
  39-tcg-Introduce-atom_and_align_for_opc.patch
  40-tcg-i386-Use-atom_and_align_for_opc.patch
  45-tcg-ppc-Use-atom_and_align_for_opc.patch
  46-tcg-riscv-Use-atom_and_align_for_opc.patch
  48-tcg-sparc64-Use-atom_and_align_for_opc.patch
  54-tcg-s390x-Support-128-bit-load-store.patch


r~


Richard Henderson (54):
  include/exec/memop: Add MO_ATOM_*
  accel/tcg: Honor atomicity of loads
  accel/tcg: Honor atomicity of stores
  tcg: Unify helper_{be,le}_{ld,st}*
  accel/tcg: Implement helper_{ld,st}*_mmu for user-only
  tcg/tci: Use helper_{ld,st}*_mmu for user-only
  tcg: Add 128-bit guest memory primitives
  meson: Detect atomic128 support with optimization
  tcg/i386: Add have_atomic16
  accel/tcg: Use have_atomic16 in ldst_atomicity.c.inc
  accel/tcg: Add aarch64 specific support in ldst_atomicity
  tcg/aarch64: Detect have_lse, have_lse2 for linux
  tcg/aarch64: Detect have_lse, have_lse2 for darwin
  accel/tcg: Add have_lse2 support in ldst_atomicity
  tcg/i386: Use full load/store helpers in user-only mode
  tcg/aarch64: Use full load/store helpers in user-only mode
  tcg/ppc: Use full load/store helpers in user-only mode
  tcg/loongarch64: Use full load/store helpers in user-only mode
  tcg/riscv: Use full load/store helpers in user-only mode
  tcg/arm: Adjust constraints on qemu_ld/st
  tcg/arm: Use full load/store helpers in user-only mode
  tcg/mips: Use full load/store helpers in user-only mode
  tcg/s390x: Use full load/store helpers in user-only mode
  tcg/sparc64: Allocate %g2 as a third temporary
  tcg/sparc64: Rename tcg_out_movi_imm13 to tcg_out_movi_s13
  target/sparc64: Remove tcg_out_movi_s13 case from tcg_out_movi_imm32
  tcg/sparc64: Rename tcg_out_movi_imm32 to tcg_out_movi_u32
  tcg/sparc64: Split out tcg_out_movi_s32
  tcg/sparc64: Use standard slow path for softmmu
  accel/tcg: Remove helper_unaligned_{ld,st}
  tcg/loongarch64: Check the host supports unaligned accesses
  tcg/loongarch64: Support softmmu unaligned accesses
  tcg/riscv: Support softmmu unaligned accesses
  tcg: Introduce tcg_target_has_memory_bswap
  tcg: Add INDEX_op_qemu_{ld,st}_i128
  tcg: Introduce tcg_out_movext3
  tcg: Merge tcg_out_helper_load_regs into caller
  tcg: Support TCG_TYPE_I128 in tcg_out_{ld,st}_helper_{args,ret}
  tcg: Introduce atom_and_align_for_opc
  tcg/i386: Use atom_and_align_for_opc
  tcg/aarch64: Use atom_and_align_for_opc
  tcg/arm: Use atom_and_align_for_opc
  tcg/loongarch64: Use atom_and_align_for_opc
  tcg/mips: Use atom_and_align_for_opc
  tcg/ppc: Use atom_and_align_for_opc
  tcg/riscv: Use atom_and_align_for_opc
  tcg/s390x: Use atom_and_align_for_opc
  tcg/sparc64: Use atom_and_align_for_opc
  tcg/i386: Honor 64-bit atomicity in 32-bit mode
  tcg/i386: Support 128-bit load/store with have_atomic16
  tcg/aarch64: Rename temporaries
  tcg/aarch64: Support 128-bit load/store
  tcg/ppc: Support 128-bit load/store
  tcg/s390x: Support 128-bit load/store

 docs/devel/loads-stores.rst      |   36 +-
 docs/devel/tcg-ops.rst           |   11 +-
 meson.build                      |   52 +-
 accel/tcg/tcg-runtime.h          |    3 +
 include/exec/memop.h             |   37 +
 include/qemu/cpuid.h             |   18 +
 include/tcg/tcg-ldst.h           |   72 +-
 include/tcg/tcg-opc.h            |    8 +
 tcg/aarch64/tcg-target-con-set.h |    2 +
 tcg/aarch64/tcg-target.h         |   15 +-
 tcg/arm/tcg-target-con-set.h     |   16 +-
 tcg/arm/tcg-target-con-str.h     |    5 +-
 tcg/arm/tcg-target.h             |    3 +-
 tcg/i386/tcg-target.h            |    7 +-
 tcg/loongarch64/tcg-target.h     |    3 +-
 tcg/mips/tcg-target.h            |    4 +-
 tcg/ppc/tcg-target-con-set.h     |    2 +
 tcg/ppc/tcg-target-con-str.h     |    1 +
 tcg/ppc/tcg-target.h             |    4 +-
 tcg/riscv/tcg-target.h           |    4 +-
 tcg/s390x/tcg-target-con-set.h   |    2 +
 tcg/s390x/tcg-target.h           |    4 +-
 tcg/sparc64/tcg-target-con-set.h |    2 -
 tcg/sparc64/tcg-target-con-str.h |    1 -
 tcg/sparc64/tcg-target.h         |    4 +-
 tcg/tcg-internal.h               |    2 +
 tcg/tci/tcg-target.h             |    4 +-
 accel/tcg/cputlb.c               |  840 +++++++++++-------
 accel/tcg/user-exec.c            |  489 +++++++----
 tcg/tcg-op.c                     |  254 ++++--
 tcg/tcg.c                        |  504 +++++++++--
 tcg/tci.c                        |  150 +---
 accel/tcg/ldst_atomicity.c.inc   | 1389 ++++++++++++++++++++++++++++++
 tcg/aarch64/tcg-target.c.inc     |  374 +++++---
 tcg/arm/tcg-target.c.inc         |  147 +---
 tcg/i386/tcg-target.c.inc        |  358 ++++++--
 tcg/loongarch64/tcg-target.c.inc |   92 +-
 tcg/mips/tcg-target.c.inc        |  108 +--
 tcg/ppc/tcg-target.c.inc         |  207 +++--
 tcg/riscv/tcg-target.c.inc       |  135 +--
 tcg/s390x/tcg-target.c.inc       |  175 ++--
 tcg/sparc64/tcg-target.c.inc     |  715 +++++----------
 tcg/tci/tcg-target.c.inc         |    5 +
 43 files changed, 4201 insertions(+), 2063 deletions(-)
 create mode 100644 accel/tcg/ldst_atomicity.c.inc

-- 
2.34.1

