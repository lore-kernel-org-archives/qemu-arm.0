Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B23ECAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:25:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWab-0005yT-5O; Tue, 16 Sep 2025 10:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa0-0005iE-7n
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWZu-0008HL-Dx
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-24b13313b1bso38048645ad.2
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032559; x=1758637359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LMjMVOgJcYXZvCDmiPzCs3a165WfhnsVl+wtDVLvZWM=;
 b=VFwaatbbXQFiJoTin0hxO5HGJHlqo5MaWzJCVlLP+AuASsDKyEVfgX5WJjZCf4B4sq
 0MSLJsOZI48PAjw4kGLXUOJNq0dSV5Hj2/OTb74+UQGuF1Nd5BgGKyVl+J+ljZsBQlVy
 bDM+helOFIb8+5Uoh8MqfjsRbCXmfYWUquH3oCDtZaBJOVRaM7AJkQHTiYf16kOPyKJ0
 35Q5Rm8pa/hqMo+KDcavoxbTwB4FfQiIxKD14JaEaoIH47JnrsL2vwn2rpK+LihqKlnm
 wbnsJBbd6/0fdVf5RUa7xUih2Od/oqSgwh6Nco2J+CvQqZMzK1CHah64fJ3tjXzaVTul
 4tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032559; x=1758637359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LMjMVOgJcYXZvCDmiPzCs3a165WfhnsVl+wtDVLvZWM=;
 b=JRQ6Zu5ccxfRIyPcXdlcIlTtB6g7lhid9IXaJa72KrUZVw+ewI1t6twHunyLnxtt6U
 FnhyUfEBIasxsbzvM9EMKbNKd/5qXKf52eIzV7dPJlIyvFp0+qjF2byKTC+YZLeGvA2w
 6w1QaYqUTreJ3BAfgBg+SmolGuLPDKUtFMMWYMMYoWEkyLNY0drXFlON2ADFW5AUSP6U
 dbCFphhVUidhkqXG8vcn+fyIfQMvi03n9sAiB3gHP3JdZyu5SHt0vdFpKjgC2Ryhhs3b
 G8MLRs1mHfm6nlfC7B6VbXW62eFbv/pxn4cbKtsUonEMjMChpKZm0m5vkCQorZVme1i2
 B7QQ==
X-Gm-Message-State: AOJu0Yyz5ixYuAjcqaD5vopCxNA12rwSZKAMzPfqH3IVMuuwmN2Zz4lu
 BFmcTTbaACMofrk/hk4ngJGCJKlZUve3Vqd0/IBy5GQMjFxKfwiqwN6XPKcighqrD5E=
X-Gm-Gg: ASbGnct3Isbp5XZCtGwQqpil9F4IW7df+iAfVD7mA3ZgxzQD67OY2w9Tu+jLaqpoRgi
 2TXhGDcRRAjxE8tcFCtDg4wsG+DS0rY8WJWy8eWYejkPus1RQFNjVBJ7baGpLvOoZn97g0ifqfH
 CPe64EfkoFzxI0TUV/4Crof5AfS/AffKNqtzpwhpEfn/xDxFtVdb3IeHTq3sx2l9fPsFfHY4JXW
 07O7e6GrI5veD7BnTH01RRNDn8u6/ucCobkntkAom7i1m98cPF0ctp0hIYju6DXxNwQ7OZKdhRB
 x7qT+oiBl2thJoseOcs32HXZ2b6Q6aOepKl/Lud9SRSE5XNL8N34410Tf2itZIG0W99HMBMB5KJ
 p+eEiSLx+CYk0n+e8Z0a82MD6223i
X-Google-Smtp-Source: AGHT+IF02yUMfaiBidq7yXvo5ua068lcUycFxTtYAm6yR06VuOEfMmLCpzfxX6Uy4RhGw5PgvEtUZg==
X-Received: by 2002:a17:903:2444:b0:266:e8c3:4731 with SMTP id
 d9443c01a7336-266e8c35152mr97414835ad.23.1758032559543; 
 Tue, 16 Sep 2025 07:22:39 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 00/36] target/arm: Reorg VHE redirection
Date: Tue, 16 Sep 2025 07:22:01 -0700
Message-ID: <20250916142238.664316-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Prerequisite for FEAT_SYSREG128, split out of 

  20250827010453.4059782-1-richard.henderson@linaro.org
  [RFC PATCH 00/61] target/arm: Implement FEAT_SYSREG128

which also reorganizes how ARMCPRegInfo are allocated during registration.


r~


Richard Henderson (36):
  target/arm: Introduce KVMID_AA64_SYS_REG64
  target/arm: Move compare_u64 to helper.c
  target/arm/hvf: Split out sysreg.c.inc
  target/arm/hvf: Reorder DEF_SYSREG arguments
  target/arm/hvf: Add KVMID_TO_HVF, HVF_TO_KVMID
  target/arm/hvf: Remove hvf_sreg_match.key
  target/arm/hvf: Replace hvf_sreg_match with hvf_sreg_list
  target/arm/hvf: Sort the cpreg_indexes array
  target/arm/hvf: Use raw_read, raw_write to access
  target/arm: Use raw_write in cp_reg_reset
  target/arm: Rename all ARMCPRegInfo from opaque to ri
  target/arm: Drop define_one_arm_cp_reg_with_opaque
  target/arm: Restrict the scope of CPREG_FIELD32, CPREG_FIELD64
  target/arm: Replace cpreg_field_is_64bit with cpreg_field_type
  target/arm: Add CP_REG_AA32_64BIT_{SHIFT,MASK}
  target/arm: Rename CP_REG_AA32_NS_{SHIFT,MASK}
  target/arm: Convert init_cpreg_list to g_hash_table_foreach
  target/arm: Remove cp argument to ENCODE_AA64_CP_REG
  target/arm: Reorder ENCODE_AA64_CP_REG arguments
  target/arm: Split out add_cpreg_to_hashtable_aa{32,64}
  target/arm: Improve asserts in define_one_arm_cp_reg
  target/arm: Move cp processing to define_one_arm_cp_reg
  target/arm: Move cpreg elimination to define_one_arm_cp_reg
  target/arm: Add key parameter to add_cpreg_to_hashtable
  target/arm: Split out alloc_cpreg
  target/arm: Hoist the allocation of ARMCPRegInfo
  target/arm: Remove name argument to alloc_cpreg
  target/arm: Move alias setting for wildcards
  target/arm: Move writeback of CP_ANY fields
  target/arm: Move endianness fixup for 32-bit registers
  target/arm: Rename TBFLAG_A64_NV2_MEM_E20 with *_E2H
  target/arm: Split out redirect_cpreg
  target/arm: Redirect VHE FOO_EL1 -> FOO_EL2 during translation
  target/arm: Redirect VHE FOO_EL12 to FOO_EL1 during translation
  target/arm: Rename some cpreg to their aarch64 names
  target/arm: Remove define_arm_vh_e2h_redirects_aliases

 target/arm/cpregs.h            | 111 ++--
 target/arm/cpu.h               |   3 +-
 target/arm/internals.h         |   3 +
 target/arm/kvm-consts.h        |  14 +-
 target/arm/tcg/translate.h     |   2 +
 hw/intc/arm_gicv3_cpuif.c      |  10 +-
 target/arm/cpu.c               |  10 +-
 target/arm/gdbstub.c           |  14 +-
 target/arm/helper.c            | 928 +++++++++++++++------------------
 target/arm/hvf/hvf.c           | 239 ++-------
 target/arm/kvm.c               |  11 -
 target/arm/tcg/hflags.c        |   8 +-
 target/arm/tcg/translate-a64.c |  47 +-
 target/arm/hvf/sysreg.c.inc    | 146 ++++++
 14 files changed, 738 insertions(+), 808 deletions(-)
 create mode 100644 target/arm/hvf/sysreg.c.inc

-- 
2.43.0


