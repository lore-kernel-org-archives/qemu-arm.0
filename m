Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2883517lft;
        Mon, 27 Jun 2022 21:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sw/SgMMKVio1ugGJmxwL+hr1QtPiUbqKbe4ULktoCQjt35cpiw/NgtrdYGqCiRT6+j2vp6
X-Received: by 2002:a05:620a:2716:b0:6af:20c2:4ba3 with SMTP id b22-20020a05620a271600b006af20c24ba3mr6656500qkp.505.1656390115141;
        Mon, 27 Jun 2022 21:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390115; cv=none;
        d=google.com; s=arc-20160816;
        b=qlWGDy1pXG3pq7MgxOYLxT9mRRrlJUaDBhaH5mH4Ppxex9tT9leiz+UzZ1DLG1hrF/
         JCQ166UaTAbh4oQcf32crlrO/Zo8QtyDyCzvdQxtgMtJUcKZqWCy/hA8DtMe33NwJ704
         AyiPs3GxU+8bMEc7+poxbevCU3HFthGnM6TOF713+sCxzakb/S60kraQMcquZfahTYjD
         z8PjZbzPRG9Pn+i0jTF61FZSeUq1h5pgxVIsBVs0eHY9rVqNfYkjd4sKauE9gugV+kJk
         If/SdVYuT87kMf2vVFTmUC6/IcGyRVHKEoQF/oJpN4PSmQxJBFCJeN2UrH7jI/KI7ffg
         CMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ILJ4Kz68ASRNzR6UBmLHINCe4zgwapAsaTAlt+05Ed8=;
        b=OYcuEFqRur4fmc90kD+YE+zvEBMIuW+HgxVwxeVXfza4OrFaLTMkIkBPZjLUfbCHiB
         tiD534yR7Z+u49rBbCLQwHw9yt6VFkuuHTo/ybtdSnV72E+G04+O8IhYEay4SdcPeEwJ
         DH2qGZlSsLyii6bNs1Sx8lED8++C8I95ZgfhP7dDmzoQ+jX9fvQGSzGERbG+0awTu92e
         lg058pxRNi+qi4tKj1JigaOgCQYKDUUHTkDOXbkOZn3lIEZ/bFW8ua5mazV5tVncsDlj
         FSMLC2Pzxv6GsBmxj6jKdBdk60CbQjjdOFz5jqQBEKcnWC9G+slgdaAWkQBW0yy0Emq6
         xLpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nLPbe7q5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a05620a401200b006af53bc733asi540346qko.468.2022.06.27.21.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nLPbe7q5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62ja-000164-CU
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62j8-00014F-NP
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62j6-0003ct-TD
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id a15so10858221pfv.13
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILJ4Kz68ASRNzR6UBmLHINCe4zgwapAsaTAlt+05Ed8=;
 b=nLPbe7q5Wql7A/8XQ+XnINuS8M59VAhkVNRnhQRJwMOakD+FwPDZUUd0xe1j+T6ac9
 RT+EH57wyqoBcAV+nct0M38Hx0BuAp5y3iJybu3mLtGEZuoQEoCrsve/RFUP6v/yY2uq
 qkpr2LlZTKmQ5kUPTLq98ExQkZj9g4Xt2+/DfN7AzYD9KQ4a3W3EW6H3XBCU5rq+a+bb
 nPJvUbMH5Ne3AfAp+kac+ItASGcvNHHwaSoNpsMcQcOwVIgdN1BJpa0mmzD8CcDx6aR4
 cnO8Ok+MoxK9SeOYXkUgf9HKSzgavKqw1TtH21t1RI4Va6z3Q7Yx1/ja5LyNEaEseCEM
 veGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILJ4Kz68ASRNzR6UBmLHINCe4zgwapAsaTAlt+05Ed8=;
 b=C9BtC6B8UrEuq0sSC7SK/K+mypX4tD8sGH3aKQzqtudcaNBzDTuTm/g1JPwqbtycY8
 IXE0xbwntdD764i4J1UiS9y+3A+QbND4zep+dtB6AbsN4RRmEKbudWy3n3wl462ffr3P
 uyPKXnl6ky+iXLZGBiEnxYSiDCzjJHAEpN2B1PvmxDT+6YOqy/DZcJqjP0YkcKWCk6Mb
 QEqGymeDUPgKjmYnR5JhtSIwcbLSeHGROUdGVM6smeUdztv//8g03YGVmYdc8cD7m5QG
 a4vQ/N1ZaFGCTNQbN/R6/8HXjzscHHrZy6C4cOdCaJLvyV1rICiamp4RtUXFf+v6IJ5g
 jaCA==
X-Gm-Message-State: AJIora9scD7CsLLWzp9ng4XKpwovSc92nGXXP9zPX/ACzsg2/UGGpiy4
 ynSUqiecHL3VgvAyZnvsU1PHgtGZo05s7w==
X-Received: by 2002:a65:6e9b:0:b0:3fc:587a:6dcd with SMTP id
 bm27-20020a656e9b000000b003fc587a6dcdmr15549810pgb.200.1656390083008; 
 Mon, 27 Jun 2022 21:21:23 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 00/45] target/arm: Scalable Matrix Extension
Date: Tue, 28 Jun 2022 09:50:32 +0530
Message-Id: <20220628042117.368549-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: 2Vow8gwkQMrk

Changes for v4:
  * Rebase on mainline (20 patches upstreamed).
  * Adjust sve_access_check when PSTATE.SM set.
  * Adjust sve insns to indicate not valid while streaming.
  * Other misc adjustments per review.


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
 target/arm/sme-fa64.decode        |   59 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  242 ++++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   57 +-
 target/arm/sme_helper.c           | 1104 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 ++-
 target/arm/translate-sme.c        |  376 ++++++++++
 target/arm/translate-sve.c        |  387 ++++++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2776 insertions(+), 134 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1

