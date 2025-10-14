Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B4CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:10:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJ3-00021T-OT; Tue, 14 Oct 2025 16:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ2-000219-HN
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIr-0005Jl-Oq
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:36 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-27d2c35c459so41157805ad.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472440; x=1761077240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nJYlo0OiXoHFOl/mBi+NzOWKzk1tHIAZuQS9beBjKho=;
 b=iN7M1JaNnOyaWUKgB4Qb5t4amYTWrLMY4urrjU17EPb55McrkfMPVyVgaad3r5ZSDm
 vVH0UhJcpf4bT6Suvi8JYf1HO1K3lOwVSkgucC0XZPlfwnmmukvsk05BSjZ+iNFLjPml
 JlRptKuC53cnVc1eq9y5j5FlZE+rTfXY1/Ams6JTTGBv3udPEKjiaPqIFhsoevskkayP
 WqvV/+OqAJBxgXEu5jwqN9A1Np0qBpIeXwItGs0OTUHwtcD3MncDT09oiPMITPnSIQQI
 /1zvOZ4WAXBmm/ObdXqJc1AemnVrWoPbDyMtAH257zXAKuZOi6iiPLJKnWhK5sC3L19J
 mlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472440; x=1761077240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nJYlo0OiXoHFOl/mBi+NzOWKzk1tHIAZuQS9beBjKho=;
 b=Lf7/2bIZy4Pfq1vib2pc+K/7q73em4Qs2mQ5vZLLUDSA16UAniqXPEK9zT7+JrrMWF
 eivXr29u+KoFxdub5cbn6LhUGahuRggCHJeZ0W4rtVi6EQ5rlMO1QHfma5dkMkyeTSEw
 IS88u1m8axuFDIedUr/yden6gRxd7FmxkWrWZXNGBK6bIPzQK4RqSZ74+hJVgqgLeesw
 F+bNzfwxOPDPHZURRioZWH0DGk003K+lXSwnN9klo4p1vQw1u5rzSG8aChtUV3EoE30w
 rnUcTTig2vM2pAglUdgyYFjAZn/AVKEqyrKse5QvpZjITblY6p0VRwHvAl7B9MPC+gAH
 ydAQ==
X-Gm-Message-State: AOJu0YyshzGUkpkMVD5irqHFf1GFtQrvZMZqhQFK69m6y2l++xL0a3Ti
 7qUw/cHp+s1IIHZY8sUwfmd1PuP24fBhvaJjUhLVPLKKd5KdFaGgJvJfqA7sGKB8u10k8D8f+k/
 v/YLc+p8=
X-Gm-Gg: ASbGncuTx3zoCT/TyRmtBTA/en944LqhrWAVTwppcL38PmauiQFRz52SrwDd4Ku52PT
 VDG7g43S5HsAS5svOqnNr1uaUpz/EUitaMRSPbYPbjIV9/1sqP+RjEywin3qJNeiLXgNp0bx5QS
 HA6uHOOA5KhZqHJpmYza2wZ/fURwCCyFvmTspZ7w5R3ZvgrKGSN/LpfqYnThH0Hj9R8UlSnx81F
 nES3gEakA3RXgLUW5TEU+c1IRb0sIw8Y2BvZQre6MILFBUlA2278CaD2/2own9Iw+X3p3qU0LoX
 3yy4rpcRW0JQP8O9myjTf0/hZJSbJV3h+1nySA5mEv+x3t/vQ69ZD0lQLQ2LpI+Pl6eRtfiaXCk
 S9/MV5QVJApAPsYbD5t+n68UeduTJZI6q2pcdWur/DRkEY0FkhQVQN6VdfNM/mw==
X-Google-Smtp-Source: AGHT+IG0WN7QBtUj2770IMPGFWz9k+NTd5lWht5HLtwxStD7w8WLplclgozJqvzKT0HA8FNiI60sPA==
X-Received: by 2002:a17:902:db11:b0:274:6d95:99d2 with SMTP id
 d9443c01a7336-290273434bamr359900045ad.39.1760472439470; 
 Tue, 14 Oct 2025 13:07:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/37] target/arm: Implement FEAT_SYSREG128
Date: Tue, 14 Oct 2025 13:06:41 -0700
Message-ID: <20251014200718.422022-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Based-on: 20251014195017.421681-1-richard.henderson@linaro.org
("[PATCH v2 0/7] target/arm: Implement FEAT_AIE")

Changes for v2:
  - The VHE rewrite has been merged.
  - The ARMCPU data are two separate uint64_t not Int128.
  - The write128fn callback uses two separate uint64_t arguments.
  - The read128fn callback continues to return Int128.
  - Updated arm_gdb_get_sysreg for 128-bit registers.

The final patch may be used to test all of this, but is not intended
for merge.  All of this should enabled if and only if FEAT_D128.


r~


Richard Henderson (37):
  target/arm: Implement isar tests for FEAT_SYSREG128, FEAT_SYSINSTR128
  target/arm: Define CP_REG_SIZE_U128
  target/arm: Update ARMCPRegInfo for 128-bit sysregs
  target/arm: Asserts for ARM_CP_128BIT in define_one_arm_cp_reg
  target/arm: Split add_cpreg_to_hashtable_aa64
  target/arm: Add raw_read128, raw_write128
  target/arm: Add read_raw_cp_reg128, write_raw_cp_reg128
  target/arm: Use cpreg_field_type in arm_gen_one_feature_sysreg
  target/arm: Merge arm_gen_one_feature_sysreg into the single caller
  target/arm: Handle MO_128 in arm_gdb_get_sysreg
  target/arm: Handle ARM_CP_128BIT in cpu reset
  target/arm: Put 128-bit sysregs into a separate list
  target/arm/kvm: Assert no 128-bit sysregs in kvm_arm_init_cpreg_list
  target/arm/hvf: Assert no 128-bit sysregs in hvf_arch_init_vcpu
  migration: Add vmstate_info_int128
  target/arm: Migrate cpreg128 registers
  target/arm: Add syn_aa64_sysreg128trap
  target/arm: Introduce helper_{get,set}_cp_reg128
  target/arm: Implement MRRS, MSRR, SYSP
  target/arm: Consolidate definitions of PAR
  target/arm: Extend PAR_EL1 to 128-bit
  target/arm: Consolidate definitions of TTBR[01]
  target/arm: Split out flush_if_asid_change
  target/arm: Use flush_if_asid_change in vmsa_ttbr_write
  target/arm: Extend TTBR system registers to 128-bit
  target/arm: Implement TLBIP IPAS2E1, IPAS2LE1
  target/arm: Implement TLBIP IPAS2E1IS, IPAS2LE1IS
  target/arm: Implement TLBIP RVAE1, RVAAE1, RVALE1, RVAALE1
  target/arm: Implement TLBIP RIPAS1E1, RIPAS1LE1, RIPAS2E1IS,
    RIPAS2LE1IS
  target/arm: Implement TLBIP RVA{L}E2{IS,OS}
  target/arm: Implement TLBIP RVA{L}E3{IS,OS}
  target/arm: Implement TLBIP VA{L}E1{IS,OS}
  target/arm: Implement TLBIP VAE2, VALE2
  target/arm: Implement TLBIP VAE3, VALE3
  target/arm: Implement TLBIP VA{L}E2{IS,OS}
  target/arm: Implement TLBIP VA{L}E3{IS,OS}
  NOTFORMERGE: Enable FEAT_SYSREG128, FEAT_SYSINSTR128 for cpu max

 include/migration/vmstate.h    |   1 +
 target/arm/cpregs.h            |  31 ++
 target/arm/cpu-features.h      |  10 +
 target/arm/cpu.h               |  33 +-
 target/arm/internals.h         |   1 +
 target/arm/kvm-consts.h        |   2 +
 target/arm/syndrome.h          |  10 +
 target/arm/tcg/helper.h        |   2 +
 migration/vmstate-types.c      |  30 ++
 target/arm/cpu.c               |  20 +-
 target/arm/gdbstub.c           |  87 +++--
 target/arm/helper.c            | 663 ++++++++++++++++++++++++++-------
 target/arm/hvf/hvf.c           |   4 +
 target/arm/kvm.c               |   2 +
 target/arm/machine.c           |  50 +++
 target/arm/tcg/cpregs-at.c     |   4 +
 target/arm/tcg/cpu64.c         |   2 +
 target/arm/tcg/op_helper.c     |  29 ++
 target/arm/tcg/tlb-insns.c     | 494 ++++++++++++++++++------
 target/arm/tcg/translate-a64.c | 169 +++++++--
 target/arm/tcg/a64.decode      |  12 +-
 21 files changed, 1312 insertions(+), 344 deletions(-)

-- 
2.43.0


