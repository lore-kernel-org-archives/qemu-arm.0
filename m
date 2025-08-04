Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56F7C87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj0uR-0001ce-Sc; Mon, 04 Aug 2025 15:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06M-00013a-H0
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:40:05 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06K-0000rZ-65
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:40:02 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76bed310fa1so1870021b3a.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332796; x=1754937596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/YP7H+skmVEbiTBDchbdeF2EpV3qFqgl9BUJ7WkvewA=;
 b=cn3Ysu3bIOUP9ITJfz5JZJyBwJUKjLVAefKuKrf1++CBp7SLX1ssDAGnY981D7AWB0
 ao9/cjtsxs9krXmn6IINNxXEGv5Iq+pNBM7zUUjBj/BKWKl4cdOxV53EN6Ntpjvy0qxq
 JUkpER0+ShJuyiC5SP1pS0cptdCGCDsaYFY+u/IuZXcaCTjTDJfel1il6fH3GzwkDh+v
 Y9q84SybRBs/WNP5YJ4SZDtGGQasQCCKzmv+8hN8PO1ZP6hEq1ugYY19bBtKgYxHHl3s
 LQSpd0XjS0oxX+Hl3FkcExriaZ2MpgvLsXyvVgWl0iyJMdltbvLLSz00seXm2ExHrGji
 mJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332796; x=1754937596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/YP7H+skmVEbiTBDchbdeF2EpV3qFqgl9BUJ7WkvewA=;
 b=Ho05Y6KMSztE0REfsfq5ybs/zyAXpBlOvibq3QjZE30vyCpreXqyCLh4fOskzE+46N
 TUr1MzlqMOFemmt3M88QB3U1Q6UfQdsuN6TFnikZ2FlL2KhSsovai8ZLLb5JMY7VoJXE
 vEUIlwnzbfjinaU9Y/9uFL7XT2DVjrxEj8WGuYz0jCy61S8MIaWl1M07OAIFHuU3AIrl
 7NFwjQ0L53Oo9dQV//6Rr6lSHPSaOsFx0YN2I7BBoVmqSKZZsjuyiSIR8aPN6cGBmwgR
 IKaPKl26FMAf/mw4cxzyeNYUW4qZam45s2ITWsUFhnJP6OqlUrb3DKX7Nx5CNSb6obXF
 shpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTYeJ0FS2gj2zh5A3utzxrWDzLp7XXKFOHuIRNIPSAen9ojDgro6l54RSJpmlXyDl3VdPrqpCLqw==@nongnu.org
X-Gm-Message-State: AOJu0YwU1lpH7cRk/gpP7f0RefnuXs4Hr3A8Joh/C2/nzeYJjCyoh9w5
 3+H2/F1aKwP1hFfXiU6bJcNF8wlkZxPsZqtZ1Mv2/xCo49WjA1et3+UTA8bQBvUEjX8=
X-Gm-Gg: ASbGncsWsvzouOrSco1mf6tl13VYxzzMZgiFlNUVUfWlgJux+Y2i4RdMDJunVAs5/Bc
 je2AX3+fTves3WzfIX6CCw2gCU+yU3YOpJQPb3Bw1AyHXZxGL+K91Yb72a7XnDhnZuy7C2roM9Z
 nnLq0J9Yaq9EpkVle8CmNXzf7eLSpEq7tskOpGevAYgAZ/9P6zbtLsa1A6UbEBIy5r9IvzWLjMO
 SsF4aCH57KBcsp7ttlz6G6jxUhWGCidSYeKemBcaAh6ECJeXiR2YzhUF9+dH8L/31kyXf5jrymP
 5OADyGibeGrZbfrbCEds1o2lGxCD71fJO3BRs/IFOEko5b5tEvRmeO+hSXRpUxl54AuA7MnASCt
 xDWAWUBFraZXmyETt174eTA==
X-Google-Smtp-Source: AGHT+IE9V5Ru91u8rQ7ca+11wT1UPMlrUkY4HZYosPbz4vMnLM626AX2Y/XVCXlVupbXYvRzG+b0eA==
X-Received: by 2002:a05:6a21:32a8:b0:240:af8:1784 with SMTP id
 adf61e73a8af0-2400af81b60mr6514471637.1.1754332796394; 
 Mon, 04 Aug 2025 11:39:56 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:39:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 00/12] single-binary: compile once semihosting
Date: Mon,  4 Aug 2025 11:39:38 -0700
Message-ID: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
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

This series compiles once semihosting files in system mode.
The most complicated file was semihosting/arm-compat-semi.c, which was carefully
cleaned in easy to understand steps.

v2
--

- use vaddr for syscalls.c/.h
- static qualifier for console_{in,out}_gf
- use vaddr for arm-compat-semi.c
- semihosting/arm-compat-semi: fix cast for common_semi_set_ret

v3
--

- keep common_semi_sys_exit_extended (Peter)

Pierrick Bouvier (12):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/syscalls: replace uint64_t with vaddr where appropriate
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: change common_semi_sys_exit_extended
  target/riscv/common-semi-target: remove sizeof(target_ulong)
  target/{arm,riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with uint64_t
  semihosting/arm-compat-semi: eradicate target_long
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode

 include/semihosting/common-semi.h             |   6 +
 include/semihosting/guestfd.h                 |   7 --
 include/semihosting/semihost.h                |   2 +
 include/semihosting/syscalls.h                |  30 ++---
 semihosting/arm-compat-semi-stub.c            |  19 +++
 semihosting/arm-compat-semi.c                 |  65 ++++++++---
 semihosting/guestfd.c                         |  26 +----
 semihosting/syscalls.c                        | 109 +++++++++---------
 ...mon-semi-target.h => common-semi-target.c} |  22 ++--
 ...mon-semi-target.h => common-semi-target.c} |  27 +++--
 semihosting/meson.build                       |  18 +--
 target/arm/meson.build                        |   4 +
 target/riscv/meson.build                      |   4 +
 13 files changed, 190 insertions(+), 149 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (53%)

-- 
2.47.2


