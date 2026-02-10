Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB1BEB2711
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpu9I-0007hw-8J; Tue, 10 Feb 2026 15:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9F-0007RV-IL
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:49 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9D-00088o-7e
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:48 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c613161b489so1796520a12.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754546; x=1771359346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sIWUOqnZLyGKePk6QDBiFdhDuhnslcwsH8LlDsj2/ZI=;
 b=NN+F3VsOssPoB5qZhwwpHk9puu5EzQyp4JG1s9Fj6g1fRS2BUy2b3oDbFn7sOA/8Ms
 RyE7du+CUhuCshLdIEUJWyb+mVnpO/xUf05YlnPaedYFMWWCbiNna1ejqvaQ8SJhoK8i
 e3jJOWGx1Up7Hg4Hvqyy+pSBMI8Mjw3wGGTraFwF65dVhwmZN+mBLZR4vMJ6QkEAVwhy
 t034V+IX6Xrs5Ksatnn0Z/k/E4G2PtaiQdm73qsNhUw/qF+J/VSHmU+YNn7wS+h38Xap
 qmqtmmu4uQnGVTEzF84H2h1c3elgcZEkM4hD4ftAB6qQ5GlD9ZzKxbmjbVFq/9akPoIT
 MzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754546; x=1771359346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIWUOqnZLyGKePk6QDBiFdhDuhnslcwsH8LlDsj2/ZI=;
 b=dWZbMkYOYpUrV/XTApKhSIm4Xn+CC9VxB2ny9zdMhmotyf2Nr/YhMFjiLuY+7rqEzm
 EonlUByqOOc2K0PQtRz0nB+3NiUx4+Fb9rYMtB18yLA4Iy1XTpop8thnW2u6m6mZI7BR
 +cEqe6fMi++6yqIJ0Xhh1PSuMNnmWG2Pr1WmQW5gUkNhtDSMXEcpgIfl40Swhm6EFi5J
 2Za7sq33zS8S8M3zwfaC9gMbMGcM80h8QkIUqC34CK4O0t3rBAVTs5Yw6KnZ3/K9aKyK
 zQstNgifZ3zMHFWNHqaBfr386JI0GVKCCf5I61ZDh7RstlU1rtKosD0OfZIjDX9xgKie
 lRYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb3wFAbH/A2UlrKi73rlNocUXgf4mbAoq+KqL05Clh1dBh9K1JScBB58Cux1JFfI/HMekowopJAQ==@nongnu.org
X-Gm-Message-State: AOJu0YwDW1m4B9wZjEehwfkRN/SM9aPTQuULUaiH78k5pDILnF3d+bcV
 u1saaw74eXp/nb2GNNZVrHo8AMECLq+4XPtBeK3x6aIu/WSbzS2eMR9nmW+0HL/l/S0=
X-Gm-Gg: AZuq6aLx9iKpK65sz9XfKDSSrjl2E01aToynXmzi8jXjijrurl9BN87IhSv5RK2B9I/
 4z4vG++GaEXeE8XC3G91xMRfl9e2E028O67ll+xVq1mBvyVod6MjDc5oDEIcfvgLtWQ2TnSNeny
 03MrCUhuamZ5FVAbwPocXgNG3PxwKgNitE/0zzk2psUhGyQbiAVcGdqgMszUPpgnJSI0Snm29jT
 TPAORgQq0pekCC5gZL4k6tQWm9u3qRK7/5drz+R+IepDk1RR42Gf8A22hdlPwdEcuPDpFWEoFIf
 OMAqPIG9g3NfyAxzUdKthvY6viQwIcUB9sKCUtqU/ih6HgxTlf+Ga/3BzhznPtssUohQPSdCjJ+
 SUq2yfEpN08COce8QRME11mLZUJDDPwZt0+J/xvOUHGVEnRjny5gWhXfhO7xLKQCAtyq810nZVS
 SATfEMma8jRy6WPNBqX+ZFarxHc7E5Jgok/cRFhfY4WvXcsL3FTFOjswKs4wEgGs6i7SuJx1CAV
 Dai
X-Received: by 2002:a17:902:d48a:b0:2a9:43a9:d367 with SMTP id
 d9443c01a7336-2ab27f57751mr2999185ad.51.1770754545632; 
 Tue, 10 Feb 2026 12:15:45 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab0b392cb5sm38523225ad.70.2026.02.10.12.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:15:45 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 00/12] target/arm: single-binary
Date: Tue, 10 Feb 2026 12:15:28 -0800
Message-ID: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52a.google.com
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

This series continues cleaning target/arm, especially tcg folder.

For now, it contains some cleanups in headers, and it splits helpers per
category, thus removing several usage of TARGET_AARCH64.
First version was simply splitting 32 vs 64-bit helpers, and Richard asked
to split per sub category.

v3
--

- translate.h: missing vaddr replacement
- move tcg_use_softmmu to tcg/tcg-internal.h to avoid duplicating compilation
  units between system and user builds.
- eradicate TARGET_INSN_START_EXTRA_WORDS by calling tcg_gen_insn_start with
  additional 0 parameters if needed.

v2
--

- add missing kvm_enabled() in arm-qmp-cmds.c
- didn't extract arm_wfi for tcg/psci.c. If that's a hard requirement, I can do
  it in next version.
- restricted scope of series to helper headers, so we can validate things one
  step at a time. Series will keep on growing once all patches are reviewed.
- translate.h: use vaddr where appropriate, as asked by Richard.

Pierrick Bouvier (12):
  target/arm: extract helper-mve.h from helper.h
  target/arm: extract helper-a64.h from helper.h
  target/arm: extract helper-sve.h from helper.h
  target/arm: extract helper-sme.h from helper.h
  tcg: move tcg_use_softmmu to tcg/tcg-internal.h
  target/arm: move exec/helper-* plumbery to helper.h
  target/arm/tcg/psci.c: make compilation unit common
  target/arm/tcg/cpu-v7m.c: make compilation unit common
  target/arm/tcg/vec_helper.c: make compilation unit common
  target/arm/tcg/translate.h: replace target_ulong with vaddr
  target/arm/tcg/translate.h: replace target_long with int64_t
  include/tcg/tcg-op.h: eradicate TARGET_INSN_START_EXTRA_WORDS

 include/tcg/tcg-op-common.h                   |   8 +
 include/tcg/tcg-op.h                          |  29 ---
 include/tcg/tcg.h                             |   6 -
 target/alpha/cpu-param.h                      |   2 -
 target/arm/cpu-param.h                        |   7 -
 target/arm/helper-a64.h                       |  14 ++
 target/arm/helper-mve.h                       |  14 ++
 target/arm/helper-sme.h                       |  14 ++
 target/arm/helper-sve.h                       |  14 ++
 target/arm/helper.h                           |  17 +-
 .../tcg/{helper-a64.h => helper-a64-defs.h}   |   0
 target/arm/tcg/{helper.h => helper-defs.h}    |   0
 .../tcg/{helper-mve.h => helper-mve-defs.h}   |   0
 .../tcg/{helper-sme.h => helper-sme-defs.h}   |   0
 .../tcg/{helper-sve.h => helper-sve-defs.h}   |   0
 target/arm/tcg/translate-a32.h                |   2 +-
 target/arm/tcg/translate.h                    |  22 +-
 target/arm/tcg/vec_internal.h                 |  49 ++++
 target/avr/cpu-param.h                        |   2 -
 target/hexagon/cpu-param.h                    |   2 -
 target/hppa/cpu-param.h                       |   2 -
 target/i386/cpu-param.h                       |   2 -
 target/loongarch/cpu-param.h                  |   2 -
 target/m68k/cpu-param.h                       |   2 -
 target/microblaze/cpu-param.h                 |   2 -
 target/mips/cpu-param.h                       |   2 -
 target/or1k/cpu-param.h                       |   2 -
 target/ppc/cpu-param.h                        |   2 -
 target/riscv/cpu-param.h                      |   7 -
 target/rx/cpu-param.h                         |   2 -
 target/s390x/cpu-param.h                      |   2 -
 target/sh4/cpu-param.h                        |   2 -
 target/sparc/cpu-param.h                      |   2 -
 target/tricore/cpu-param.h                    |   2 -
 target/xtensa/cpu-param.h                     |   2 -
 tcg/tcg-internal.h                            |   6 +
 target/alpha/translate.c                      |   4 +-
 target/arm/debug_helper.c                     |   4 +-
 target/arm/helper.c                           |   5 +-
 target/arm/tcg/arith_helper.c                 |   4 +-
 target/arm/tcg/crypto_helper.c                |   4 +-
 target/arm/tcg/gengvec64.c                    |   3 +-
 target/arm/tcg/helper-a64.c                   |   6 +-
 target/arm/tcg/hflags.c                       |   4 +-
 target/arm/tcg/m_helper.c                     |   2 +-
 target/arm/tcg/mte_helper.c                   |   3 +-
 target/arm/tcg/mve_helper.c                   |   6 +-
 target/arm/tcg/neon_helper.c                  |   4 +-
 target/arm/tcg/op_helper.c                    |   2 +-
 target/arm/tcg/pauth_helper.c                 |   3 +-
 target/arm/tcg/psci.c                         |   4 +-
 target/arm/tcg/sme_helper.c                   |   5 +-
 target/arm/tcg/sve_helper.c                   |   6 +-
 target/arm/tcg/tlb_helper.c                   |   4 +-
 target/arm/tcg/translate-a64.c                |   3 +
 target/arm/tcg/translate-mve.c                |   1 +
 target/arm/tcg/translate-sme.c                |   3 +
 target/arm/tcg/translate-sve.c                |   3 +
 target/arm/tcg/translate.c                    |  25 +-
 target/arm/tcg/vec_helper.c                   | 224 ++----------------
 target/arm/tcg/vec_helper64.c                 | 142 +++++++++++
 target/arm/tcg/vfp_helper.c                   |   4 +-
 target/avr/translate.c                        |   2 +-
 target/hexagon/translate.c                    |   2 +-
 target/i386/tcg/translate.c                   |   2 +-
 target/loongarch/tcg/translate.c              |   2 +-
 target/m68k/translate.c                       |   2 +-
 target/microblaze/translate.c                 |   2 +-
 target/or1k/translate.c                       |   2 +-
 target/ppc/translate.c                        |   2 +-
 target/rx/translate.c                         |   2 +-
 target/sh4/translate.c                        |   4 +-
 target/sparc/translate.c                      |   2 +-
 target/tricore/translate.c                    |   2 +-
 target/xtensa/translate.c                     |   2 +-
 tcg/tcg.c                                     |   4 -
 target/arm/tcg/meson.build                    |  11 +-
 77 files changed, 383 insertions(+), 381 deletions(-)
 create mode 100644 target/arm/helper-a64.h
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/helper-sve.h
 rename target/arm/tcg/{helper-a64.h => helper-a64-defs.h} (100%)
 rename target/arm/tcg/{helper.h => helper-defs.h} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve-defs.h} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme-defs.h} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve-defs.h} (100%)
 create mode 100644 target/arm/tcg/vec_helper64.c

-- 
2.47.3


