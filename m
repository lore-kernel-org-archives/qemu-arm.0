Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382898ejb;
        Tue, 19 Mar 2024 08:45:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqpns1AkCpj7V+CBn6qeIsTNs4gLyk4rXSfN+aiaoKrBhYIzK4KMOJUL/IDwoif3fIM7IGF3tlzwKBBhP6JfwFxK85iFAX
X-Google-Smtp-Source: AGHT+IGH6vXSXnUjF1y8iGwc0pjbzRnG8MV1U8g6E3srwd5otRVgo15cUl0Ql4wtepdUt/k4muZJ
X-Received: by 2002:ac8:5e0e:0:b0:430:b07a:bc42 with SMTP id h14-20020ac85e0e000000b00430b07abc42mr12354597qtx.67.1710863107784;
        Tue, 19 Mar 2024 08:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863107; cv=none;
        d=google.com; s=arc-20160816;
        b=zEaeiWgaq19xLGeS570wR/A1iL+zeSuNTvn4P0MvReYnmAALdbPD5aLXEb4ASv8s+f
         KM8Uo+cR1awFKz12QlFfUrmhAQGDSki38xqmAGoGsMARIbHcl1Y3TBAagsRHlBk5faCf
         6X/F8X3TaK6Nm6Ng2NpUHpOV2OrSQ3GWZQ0e70UxJ2A5J/ARAxClfHbjh8B6UeVhus5E
         Opi18i51S+PqDutWRbG9btRDlGfhIbJj9Ps+8t7Ingp7N2si7P5BkVIzQBfcMbdE62uG
         jEbGHVXjuzMKaANDjwrAcIY7cxKjpU75AkPx0VeEoRb/PmOzAkz7X3+FtEtGP663qEwE
         ZLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0tiLh1c9fdX0ozVWgoqbQG0Frf7N65+ls807ekbVUqA=;
        fh=LKT51Wr6Sd/Pu5cJwsqBUgX+/DR98RLXMan10LlCkHE=;
        b=EajhC8O6CR8RZQfHxIJRh+v2ml2t7EVQFsmZtF4To31wXi7zLRXgu/BbyqjddpKPDz
         DtUdK3CUbOkDLUa5dN5pI2EjZQ1xxLsTAXRKhP6G6EOyOzeQ9aS+9HT1Lo1eXhpwQA3j
         C2QWEgOJ2IMeX81W4Y+b96cpICoB3666q/l8YzWLsotsPJbRYPGZoE1YOMQ/pddSrMrt
         5TiMEiLqDdNAh9q5t+bsT8kz2Ci5H42wTa7t9T1WaybfbcOZPYSeciLkPKG+dtNtLLPa
         zgPrt+ANyQU9jAH5ZXEZVFMrrf1fTzKKN10RpygF0T33mcpv//i+hKy/ZNcIqn2nFxfH
         g3VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEqyQRb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020ac85d91000000b00430b7bf2193si8563726qtx.228.2024.03.19.08.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEqyQRb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbcX-0005Kk-Ro; Tue, 19 Mar 2024 11:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcW-0005J0-Ux
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcE-0004kw-ND
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33e672e10cfso2995726f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710862981; x=1711467781; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tiLh1c9fdX0ozVWgoqbQG0Frf7N65+ls807ekbVUqA=;
 b=bEqyQRb5Gj///JhmP2mf0YfkyoR2jO/gM2yRqo4PWTjjdT+zs/kvG7z8PAYRygCbfW
 fJYOs9n4nth8A35pswTuysO5smFO25daF/65g1zFsSabGzuGjUNf9O4YrPjtDU4/v2bN
 rPfq+bWEXLL8y+zSLqYYlbt5DnGdqY4oBNnjHt2/iRxOKs333+Qu3ZMI3PaTTaaNqHxD
 +8lRLrg5wiTaYuVZBOZJ1dBwij5L6rahcDNBGCPflQ3i3RUW6O1sOIALCPp+TVCp4BY6
 uAoiSL4sTqvfO8GvT1TXne13RGLCwZWhbva0kN1YYhPAMAsS9HG9Z7LtCk9eNR3ksbN8
 wEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710862981; x=1711467781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tiLh1c9fdX0ozVWgoqbQG0Frf7N65+ls807ekbVUqA=;
 b=tRQ+TFH0m4EElL924Iuj6d7Okla8w/2NR34a7Jb0cbUaLtx401eprkv3bUmd8/bDEj
 ES7oWthQR/Jq/TOA5TiIH8KrQWLRD+uVtd3huQWvXor1hxzsVfxd3ywEh1n1T1eTU/HO
 fKSSB2AFfcdP6DIVE1EuW8kX8W+QvggnMcLgskJMA4F1LXqgTkSccclNG6ymprXImgvJ
 SWezxeJLKAvabyKP8gzPi1U2Om8tp5ciBkWrsuhzpfhaeZniifUKijkugITL5yXIZSst
 MdSh6mwYGv5lYMEPaN2RlIO044MME53s/fOe3tgsHfL6idFiRIswFPNNyMFuBB3tcYpK
 x77g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzMncdMMO4yKkGZ8qhX4MuxphX//VBofgctrSoe+/Uh0gqgo/pZFDVfcGfjCACornPDkxUjkWCGlWnjJFmB9j1Wfcz
X-Gm-Message-State: AOJu0Yy26i5lvwWMAWJPc9OMddTbhzT+bJ2ct1K+unDwf3ZZFpJDBHPQ
 R6iJxDip6MTCV9UjfqYwZkwhIqkY37LIyert5O2611qO/WqaiPIf1shtSkvHUiM=
X-Received: by 2002:adf:ffc5:0:b0:33e:7cc8:bd68 with SMTP id
 x5-20020adfffc5000000b0033e7cc8bd68mr1946703wrs.31.1710862980859; 
 Tue, 19 Mar 2024 08:43:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 bv16-20020a0560001f1000b00341798ba0a8sm4440386wrb.87.2024.03.19.08.42.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 00/27] accel/tcg: Introduce TCGCPUOps::get_cpu_state()
 handler
Date: Tue, 19 Mar 2024 16:42:29 +0100
Message-ID: <20240319154258.71206-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tHBO/mPrf4IA

Hi,

This series introduce a generic get_cpu_state() handler in
TCGCPUOps and convert each target to it.

This is required to get a single cpu_get_tb_cpu_state()
for heterogeneous emulation (since this method is called
by accel/tcg/).

Regards,

Phil.

Philippe Mathieu-Daudé (27):
  accel/tcg: Ensure frontends define restore_state_to_opc handler
  accel/tcg: Introduce TCGCPUOps::get_cpu_state() handler
  target/alpha: Convert to TCGCPUOps::get_cpu_state()
  target/arm: Restrict TCG-specific declarations
  target/arm: Convert to TCGCPUOps::get_cpu_state()
  target/avr: Convert to TCGCPUOps::get_cpu_state()
  target/cris: Convert to TCGCPUOps::get_cpu_state()
  target/hexagon: Convert to TCGCPUOps::get_cpu_state()
  target/hppa: Convert to TCGCPUOps::get_cpu_state()
  target/i386: Convert to TCGCPUOps::get_cpu_state()
  target/loongarch: Convert to TCGCPUOps::get_cpu_state()
  target/m68k: Convert to TCGCPUOps::get_cpu_state()
  target/microblaze: Convert to TCGCPUOps::get_cpu_state()
  target/mips: Convert to TCGCPUOps::get_cpu_state()
  target/nios2: Convert to TCGCPUOps::get_cpu_state()
  target/openrisc: Convert to TCGCPUOps::get_cpu_state()
  target/ppc: Indent ppc_tcg_ops[] with 4 spaces
  target/ppc: Convert to TCGCPUOps::get_cpu_state()
  target/riscv: Convert to TCGCPUOps::get_cpu_state()
  target/rx: Convert to TCGCPUOps::get_cpu_state()
  target/s390x: Restrict TCG-specific declarations
  target/s390x: Convert to TCGCPUOps::get_cpu_state()
  target/sh4: Convert to TCGCPUOps::get_cpu_state()
  target/sparc: Convert to TCGCPUOps::get_cpu_state()
  target/tricore: Convert to TCGCPUOps::get_cpu_state()
  target/xtensa: Convert to TCGCPUOps::get_cpu_state()
  accel/tcg: Remove check on TARGET_HAS_CPU_GET_TB_CPU_STATE

 accel/tcg/internal-target.h             |   2 +
 include/hw/core/tcg-cpu-ops.h           |   3 +
 target/alpha/cpu.h                      |  11 ---
 target/arm/cpu.h                        |   3 -
 target/arm/internals.h                  |   6 +-
 target/avr/cpu.h                        |  18 ----
 target/cris/cpu.h                       |  10 ---
 target/hexagon/cpu.h                    |  12 ---
 target/hppa/cpu.h                       |  42 ---------
 target/i386/cpu.h                       |  14 ---
 target/loongarch/cpu.h                  |  12 ---
 target/m68k/cpu.h                       |  16 ----
 target/microblaze/cpu.h                 |   8 --
 target/mips/cpu.h                       |   9 --
 target/mips/tcg/tcg-internal.h          |   2 +
 target/nios2/cpu.h                      |  12 ---
 target/openrisc/cpu.h                   |  10 ---
 target/ppc/cpu.h                        |  14 +--
 target/riscv/cpu.h                      |   3 -
 target/rx/cpu.h                         |   9 --
 target/s390x/cpu.h                      |  28 ------
 target/s390x/s390x-internal.h           |   4 +
 target/sh4/cpu.h                        |  15 ----
 target/sparc/cpu.h                      |  35 +-------
 target/tricore/cpu.h                    |  12 ---
 target/xtensa/cpu.h                     |  68 ---------------
 accel/tcg/cpu-exec.c                    |   6 +-
 accel/tcg/translate-all.c               |   8 ++
 target/alpha/cpu.c                      |  12 +++
 target/arm/cpu.c                        | 110 ++++++++++++++++++++++++
 target/arm/helper.c                     | 109 -----------------------
 target/arm/tcg-stubs.c                  |   4 -
 target/arm/tcg/cpu-v7m.c                |   1 +
 target/avr/cpu.c                        |  19 ++++
 target/cris/cpu.c                       |  11 +++
 target/hexagon/cpu.c                    |  13 +++
 target/hppa/cpu.c                       |  43 +++++++++
 target/i386/cpu.c                       |   2 +-
 target/i386/tcg/tcg-cpu.c               |  15 ++++
 target/loongarch/cpu.c                  |  15 ++++
 target/m68k/cpu.c                       |  17 ++++
 target/microblaze/cpu.c                 |   9 ++
 target/mips/cpu.c                       |   1 +
 target/mips/tcg/translate.c             |   9 ++
 target/nios2/cpu.c                      |  13 +++
 target/openrisc/cpu.c                   |  11 +++
 target/ppc/cpu_init.c                   |  27 +++---
 target/ppc/helper_regs.c                |  13 +--
 target/riscv/cpu.c                      |   2 +-
 target/riscv/cpu_helper.c               |  87 -------------------
 target/riscv/tcg/tcg-cpu.c              |  88 +++++++++++++++++++
 target/rx/cpu.c                         |  10 +++
 target/s390x/cpu.c                      |   1 +
 target/s390x/tcg/mem_helper.c           |   2 +-
 target/s390x/tcg/translate.c            |  23 +++++
 target/sh4/cpu.c                        |  16 ++++
 target/sparc/cpu.c                      |   1 +
 target/sparc/translate.c                |  33 +++++++
 target/tricore/cpu.c                    |  13 +++
 target/xtensa/cpu.c                     |  69 +++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |   2 +-
 61 files changed, 611 insertions(+), 582 deletions(-)

-- 
2.41.0

