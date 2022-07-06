Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4542352lft;
        Wed, 6 Jul 2022 01:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAVvvg6ADcBGybeKOP6T4pJ1f06Z9VqrBxmrI/qoQezPzSPREtVtjD/pv461F4br+ALqjS
X-Received: by 2002:a05:620a:2590:b0:6ab:91fd:438 with SMTP id x16-20020a05620a259000b006ab91fd0438mr25983912qko.312.1657096833752;
        Wed, 06 Jul 2022 01:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657096833; cv=none;
        d=google.com; s=arc-20160816;
        b=EQMvL9cMcDSSQXoccYG2ulsu/weuJlBI+RaJhNuq02aAl8/VyhmkdGfrY84k4KYe98
         YW+yprPTPZ+P+NP7ROhIMK1hEmvcUBlW/yy95vTkTF33ubxCx1d6+uU5s50P8OCaY+OM
         W3VY1UBkNwV0H2tafRswzxx9Ms5SPldW5nWV9zOjgP5XOeQTUfAKQpmykWkBdxzpCPYi
         CeI1e811+CXVUdY1FYa+56H8jixhfK+j0RH56NudFmoCBoLpe8RS+jcgQVinXiGgvk/u
         A5KcqWFw+EacKb1EfufMefJtygZFAusvqc5KyTZrxDnSkHtS+mEoqBmfTK3gIxapuM1Q
         OZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mSlsGv42K1iHLlEGMRNsQfc8mMOX07uLk1pgqzKzfP4=;
        b=Q9U0RizmMk3wGqeiwv3AU8z3qYy5tszyaHf24mlmaI1oF7OHdOrFeFMORXTErAkNNz
         3vr1ZbIrdo9tFpc+2zA1zmYLjXk/ovtlQ279zltFvhaOBB6kJz04XV4TLTCC+e8aUfRm
         /h3oNt6ERw7zvBSzK1iOqaauPjLFeHXEvOusfzX9hPoruVGAh5ZxKgsmBu6WmQtb/IWg
         IqBndJOXHpAuiLFiscdzIjD4Oe2LDJlUlEOtRqrGsCiN4RxD6HE8qZlgAE4kzP+oKVun
         R01G1YxQNCP74T9phFb6XCRtNNzoyaFnPv2fPl6DublTEHAN4NJDiXWRrrCFohW+0yE9
         TjPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Huk9Pqu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn31-20020a05620a2adf00b006b2773ad3f5si6634598qkb.252.2022.07.06.01.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Huk9Pqu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90aH-0000Om-6e
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kb-0005dv-GP
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:21 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90KY-0000Ij-5J
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z1so7263846plb.1
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSlsGv42K1iHLlEGMRNsQfc8mMOX07uLk1pgqzKzfP4=;
 b=Huk9Pqu4UUMiEz4vDexzMAZXIXF6/QoYW6wExBkgE1XXE8AJ3KnC5mekYP8Wrv7os6
 gDFqPbLLrrUmzuvPk2CrekLOkr1/alNuibCDyydIkRYADFm437F/sfxwuoeZZozcika2
 +v7fwHq2Qq7bU1w2ll/lLHRclwenYQ+sdZKVjDcf/VFOGZcXIEtHLHvMU7+vq2SYcoJO
 Xvib00PktQrAIq4/StmrCdUby0OuwydI3BXYVGVowsxnqAY8dPZBkvdt5taSumkUiI5B
 D1DGAXu7cUEzKyCSTj00b+yfrxCn0Vm/r8eQuVOcwpnLaTWlhyP2QVCe6Lekbs5wLaZq
 BGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSlsGv42K1iHLlEGMRNsQfc8mMOX07uLk1pgqzKzfP4=;
 b=s5qN48LvtPNLWgHrvT/+399pQmxywJXrUjkzRGr7rqVwKTq9hp0iEFGaIbHeRoRXaG
 7k0jqnf5Cbl+XUY/2VZIuQsQnjXkkGQzaSYMoe+gAlHZj01RQP/zgZaGsinAZx1a8DrW
 EZj9bp0uzbmPIREU7UyXIDXvByC60SUEhB4dnUL/KmWziglJ29g0N1SDkze0KKrHD3vv
 22lvJjcCGZeqmWfG/K0xh4Tlz496olTMKRnVjO0H0PFqLF0Wak1qh1HcvNiCKpVo0ffG
 Ugyn2BPe1LzrsQZFaSdsLm1wsXUQurwyb9iv8cQ8iwSFCByjq2DeQdabtl2O6o8yFyrv
 f9fQ==
X-Gm-Message-State: AJIora8Mt+2K63cQny2/0BcUSzkDWsg8el9Oy72TXG2JOsrjuFIdEIiD
 BLBGYpPyWnW1REIjzLc+nujJZQ==
X-Received: by 2002:a17:902:e943:b0:16b:db5b:4fe8 with SMTP id
 b3-20020a170902e94300b0016bdb5b4fe8mr18719032pll.38.1657095856371; 
 Wed, 06 Jul 2022 01:24:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 00/45] target/arm: Scalable Matrix Extension
Date: Wed,  6 Jul 2022 13:53:26 +0530
Message-Id: <20220706082411.1664825-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CYIPk5vb7xLH

Changes for v5:
  * Use macros for vertical tile slice addressing.
  * Other misc adjustments per review.

Patches without r-b:
  03-target-arm-Trap-non-streaming-usage-when-Streamin.patch
  07-target-arm-Mark-PMULL-FMMLA-as-non-streaming.patch
  19-target-arm-Implement-SME-MOVA.patch
  20-target-arm-Implement-SME-LD1-ST1.patch
  23-target-arm-Implement-SME-ADDHA-ADDVA.patch
  24-target-arm-Implement-FMOPA-FMOPS-non-widening.patch
  25-target-arm-Implement-BFMOPA-BFMOPS.patch
  26-target-arm-Implement-FMOPA-FMOPS-widening.patch
  35-linux-user-aarch64-Add-SM-bit-to-SVE-signal-conte.patch
  37-linux-user-aarch64-Do-not-allow-duplicate-or-shor.patch


r~


Richard Henderson (45):
  target/arm: Handle SME in aarch64_cpu_dump_state
  target/arm: Add infrastructure for disas_sme
  target/arm: Trap non-streaming usage when Streaming SVE is active
  target/arm: Mark ADR as non-streaming
  target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
  target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA, FTSSEL as
    non-streaming
  target/arm: Mark PMULL, FMMLA as non-streaming
  target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
  target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
  target/arm: Mark string/histo/crypto as non-streaming
  target/arm: Mark gather/scatter load/store as non-streaming
  target/arm: Mark gather prefetch as non-streaming
  target/arm: Mark LDFF1 and LDNF1 as non-streaming
  target/arm: Mark LD1RO as non-streaming
  target/arm: Add SME enablement checks
  target/arm: Handle SME in sve_access_check
  target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
  target/arm: Implement SME ZERO
  target/arm: Implement SME MOVA
  target/arm: Implement SME LD1, ST1
  target/arm: Export unpredicated ld/st from translate-sve.c
  target/arm: Implement SME LDR, STR
  target/arm: Implement SME ADDHA, ADDVA
  target/arm: Implement FMOPA, FMOPS (non-widening)
  target/arm: Implement BFMOPA, BFMOPS
  target/arm: Implement FMOPA, FMOPS (widening)
  target/arm: Implement SME integer outer product
  target/arm: Implement PSEL
  target/arm: Implement REVD
  target/arm: Implement SCLAMP, UCLAMP
  target/arm: Reset streaming sve state on exception boundaries
  target/arm: Enable SME for -cpu max
  linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
  linux-user/aarch64: Reset PSTATE.SM on syscalls
  linux-user/aarch64: Add SM bit to SVE signal context
  linux-user/aarch64: Tidy target_restore_sigframe error return
  linux-user/aarch64: Do not allow duplicate or short sve records
  linux-user/aarch64: Verify extra record lock succeeded
  linux-user/aarch64: Move sve record checks into restore
  linux-user/aarch64: Implement SME signal handling
  linux-user: Rename sve prctls
  linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
  target/arm: Only set ZEN in reset if SVE present
  target/arm: Enable SME for user-only
  linux-user/aarch64: Add SME related hwcap entries

 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   56 +-
 target/arm/cpu.h                  |    7 +
 target/arm/helper-sme.h           |  126 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   18 +
 target/arm/translate-a64.h        |   45 ++
 target/arm/translate.h            |   16 +
 target/arm/sme-fa64.decode        |   60 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  243 ++++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   56 +-
 target/arm/sme_helper.c           | 1124 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 ++-
 target/arm/translate-sme.c        |  373 ++++++++++
 target/arm/translate-sve.c        |  393 ++++++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2799 insertions(+), 135 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1

