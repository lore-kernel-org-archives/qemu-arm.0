Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC5BFF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:59:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaH-0003x4-4y; Tue, 07 Apr 2026 15:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaE-0003wD-0x
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:34 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaC-0007I8-1Z
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35da9c0c007so5170627a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591970; x=1776196770; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vovGjGCXrEGJECwd7JDJsdOGWUdslff/Ng8+QaDU048=;
 b=azfGsLQLP8IpurxqHGr/uPQuuzaRd7YfqBKsRq2K4ydxB+dxv/WxWfF4h/hrMT9FQY
 XGoLmqstFGOTwvqfwhyLhnIVmreTdFmxEPRQw53Fu74t3RAgD0U/CQmkAFvkKDx31s4j
 dynHe4f6DpDv0g77kNSJYwIRFm72E21rpvYS5aRhRBF5KtqqPBurOAUSuPpzoFXCzY8D
 IbaRRsNn5nnAjIp7xDLS4todr1jTtkKznduNXJ3xVR5/KtU0RpZopU76ZXLxK3EySU9Y
 PlY7Qg0QG8CLB+pctBzSBzcYTKjd2DY6dXpwwW/TTeKcwA/cDU2j4X1e7dt7Aqr4RYb0
 /yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591970; x=1776196770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vovGjGCXrEGJECwd7JDJsdOGWUdslff/Ng8+QaDU048=;
 b=cD2DSmUcKaylPJwQ0O7tIIBIkqchEU1A29ygRXoQ6SSQXTNVUR/C+VP5lk6+RdrpF+
 wMscJBrB1vDKNyzpdFsuFBeNy2ersuvfA+uReaNYAgT6sl1m4gsbsUvP5/Aik06uHDQB
 7ufIaGWPD5t921/oAjWpr+sYTdjyaBclocFn3o0OMMJ7zZ6XGUNMURmjZrcvIuow4axP
 lD9KGK+OsP9tSnCoz66sOlS3QO0B0BkihNFhBoPP+EWTBMtp8brOmfBGLTa6zqHYPovM
 H9L3kvxuO1AaPmX6ZtfkKBySTnJHcR57VyKNc+QMEZDswbPKHGJyBABb8s67HBgaUVwZ
 zPeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVpSXVdjzmGwu5tYAC/doyu/jWR3XwVSXve1YEt4Ru9LH2wnhLg8/6h+S9a5mNCcnexcPWkB8Y9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyyvp7O9IWVQGGBbpK4XXfvTn9o/rTs//PSTnLSRcuQRB3VRTc8
 LYmEzp0PSLhKx4siaDuFpoow300a7Rm+BxdLBlLTdgTVAxnVhVYiuZXqA8Fe+dJkXXw=
X-Gm-Gg: AeBDiet/d3tjZG1ABKqMLjWrsHW5ZVx9lK5WIwNA+jN8VN1G1l5VZDx5GPo0aqCEv6V
 O1K+/0dp7sWS6lDCSJJrjrZWdQv+qloRW7wwuhETZaUddp3mM1NUh4Q/n54OZZKocIyDvCYpfD+
 Zr3qHc65dnp4luHPbdK+gnEh4Ib775ayw1qf6OeysYNaePjnNUHqTskW4tjXuQtYZrH/ON9xjGm
 g5ELuuzBDdozkwH6PDDTPWfRM2Sh20d6gsZpwEGIh/VdrDtpXSmDNmpxG44yC7jMHHwO2aveV3b
 Nd0kkyR69SCetguWOmh2GiCilzl1krSVrrZk+mO2qZcaKkaw8qzpXlkHQT3aF/jXvhVI0ViBJXK
 mAfLYEupHggQhdpRT962NHXuqzBraLKTM3AtRZsbFHj9CitpYi8MJvHmVBI3B+AFCLDTef9Lo/I
 BaUI1jHFB41Xgp21DXpOdo68/FsrmWgEIma8gWlBECaco3NJO1mMWINB0ax+p97WUSYklA1EJPp
 NIJ
X-Received: by 2002:a17:90b:3e88:b0:35d:9da0:4947 with SMTP id
 98e67ed59e1d1-35de67f788amr18343232a91.11.1775591970265; 
 Tue, 07 Apr 2026 12:59:30 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 00/21] target/arm: single-binary
Date: Tue,  7 Apr 2026 12:59:01 -0700
Message-ID: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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

This series tackles (most of) the rest of target/arm, especially tcg folder.

We extract tcg memory operation in a new header, with a new type representing
virtual addresses.

Initially, I went down the way to have a dynamic definition of TCGv, which
required much more boilerplate and runtime checks. After discussing with
Richard, I realized it was not needed, and that could simply split 32 and 64 bit
properly in different files instead. This approach will not work with other
architectures, requiring something else, but it's enough for target/arm.

Files left are:
- target/arm/tcg/mve_helper.c
- target/arm/tcg/m_helper.c
- target/arm/tcg/cpu32.c

v10
---

- extract patch for endianness handling in arm_disas_set_info
- added some comments

v9
--

- introduce aarch64_translate_code *before* adding parameter to translator_loop
- use TCG_TYPE_VA as address type for translator_loop
- remove inline marker on functions merged from arm_ldst.h to translate.c
- refactor arm_ldl_code/arm_lduw_code

v8
--

- make translate.c compilation unit common.

v7
--

- add parameter to translator_loop to indicate address type for current tb.
- remove TCGv from target/arm/tcg/translate.c

v6
--

- meson.build: extract decode files in separate variables and explicitly include
  them in user and system code. The duplication is now minimized: one instance
  for all system binaries, and one per user binary.

v5
--

- reimplemented what v0 did with new approach defining new tcg-op-mem header
- reapply all straightforward patches from v0
- only translate.c is left, but first want to validate that changes here are ok
  for maintainers before doing more.

v0
--

See original thread:
https://lore.kernel.org/qemu-devel/20260109053158.2800705-1-pierrick.bouvier@linaro.org/#t

Note about v1 -> v4
-------------------

- After v0 which was trying to do too many changes, v1 to v4 focused on smaller
  things, and all patches have been merged already.
  https://patchew.org/QEMU/20260219040150.2098396-1-pierrick.bouvier@linaro.org/

Pierrick Bouvier (21):
  include/tcg/tcg-op: extract memory operations to tcg-op-mem.h
  target/arm/translate.h: remove tcg-op.h include
  target/arm/tcg/translate.h: remove tcg-op-gvec.h include
  target/arm/tcg/translate.h: remove TARGET_AARCH64
  target/arm/tcg/translate-vfp.c: make compilation unit common
  target/arm/tcg/translate-neon.c: make compilation unit common
  target/arm/tcg/translate-mve.c: make compilation unit common
  target/arm/tcg/translate-m-nocp.c: make compilation unit common
  target/arm/tcg/op_helper.c: make compilation unit common
  target/arm/tcg/gengvec.c: make compilation unit common
  target/arm/tcg/translate.c: remove MO_TE usage
  target/arm/tcg/translate.c: replace target_ulong with uint32_t
  target/arm/tcg/translate.c: extract aarch64_translate_code()
  tcg/translator: add parameter to translator_loop for current addr type
  target/arm/tcg/translate.c: replace TCGv with TCGv_va
  target/arm/tcg/translate-a64.c: use translator_ldl_end instead of
    arm_ldl_code
  target/arm/tcg/arm_ldst.h: merge in translate.c
  target/arm/tcg/translate.c: replace translator_ldl_swap with
    translator_ldl_end
  target/arm/cpu.c: simplify endianness handling in arm_disas_set_info
  target/arm/tcg/translate.c: remove target_ulong
  target/arm/tcg/translate.c: make compilation unit common

 include/exec/translator.h        |   4 +-
 include/tcg/tcg-op-mem.h         | 126 +++++++++++++++++++++++++++++++
 include/tcg/tcg-op.h             | 100 +-----------------------
 target/arm/internals.h           |   2 +
 target/arm/tcg/arm_ldst.h        |  47 ------------
 target/arm/tcg/translate.h       |  14 +---
 accel/tcg/translate-all.c        |   1 -
 accel/tcg/translator.c           |   4 +-
 target/alpha/translate.c         |   3 +-
 target/arm/cpu.c                 |   6 +-
 target/arm/tcg/op_helper.c       |   1 -
 target/arm/tcg/stubs32.c         |  24 ++++++
 target/arm/tcg/translate-a64.c   |  17 ++++-
 target/arm/tcg/translate-sme.c   |   1 +
 target/arm/tcg/translate-sve.c   |   1 +
 target/arm/tcg/translate.c       |  73 +++++++++++-------
 target/avr/translate.c           |   3 +-
 target/hexagon/translate.c       |   3 +-
 target/hppa/translate.c          |   3 +-
 target/i386/tcg/translate.c      |   3 +-
 target/loongarch/tcg/translate.c |   3 +-
 target/m68k/translate.c          |   3 +-
 target/microblaze/translate.c    |   3 +-
 target/mips/tcg/translate.c      |   3 +-
 target/or1k/translate.c          |   3 +-
 target/ppc/translate.c           |   3 +-
 target/riscv/translate.c         |   3 +-
 target/rx/translate.c            |   3 +-
 target/s390x/tcg/translate.c     |   3 +-
 target/sh4/translate.c           |   3 +-
 target/sparc/translate.c         |   3 +-
 target/tricore/translate.c       |   3 +-
 target/xtensa/translate.c        |   3 +-
 target/arm/tcg/meson.build       |  57 ++++++++++----
 34 files changed, 304 insertions(+), 228 deletions(-)
 create mode 100644 include/tcg/tcg-op-mem.h
 create mode 100644 target/arm/tcg/stubs32.c

-- 
2.47.3


