Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3053960ejc;
        Mon, 28 Aug 2023 07:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk3MfBnuVB6xW+/Mdqc2ww4FfJBHtlxB4BWZqkWvQ0r1r3RvTFxVWkMw9Rtmdq6tjg8V76
X-Received: by 2002:a05:6358:2925:b0:134:e458:688d with SMTP id y37-20020a056358292500b00134e458688dmr28401366rwb.15.1693234562166;
        Mon, 28 Aug 2023 07:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234562; cv=none;
        d=google.com; s=arc-20160816;
        b=sJXQAsIpX1VI0VEpFbDDsGMDvMZhCkKJNCQs7UPeRJtviLM9vEKgDr3j4yiwIrUe7G
         4Bxv8Y3P7ns12mToJyKWFXcXeVN+tTK9L2PeJ5P454z462+iL5Se9RN/F1Bq/N9fOse/
         DQUpi1G3+GBMDHAZm8UuCLOIVSaVo1JKvkcuH9odG8IwSA0HIkmQQ5JIhuFNzUZuEhLO
         8MD5ICxqKgce9VmEsSZvGcWv/KoitVbD4j5DqTI5ZEowYu29DaAX0aWdLNd7AOXizal9
         KE9bfLh3voK0MY/suD87NmEtSPIBZHYaJUrIGfBmEoCY1Tg11dkDgXUyFkJcWap8xpzb
         FD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LZVBTLQ7o6iqgGaPYrq/8xZ+5YbpKZVyztY/hfXbBKA=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=aCidBVNyaKhRqpRT8UqU+b7aAmzcVtMcUeWFMwFOY/BMb1XIeh8UNP3LlJvombx6cP
         6nQ4ypODWkjyDWpyNJdUYc4AAPR2TJfkEBU5GOo5dqWo80dOD3guwT/fOQfhUnbpazOc
         P5Oim+pSvsCcWdd1826hku8E5j7a4Q720qJ8LLUrncpWpsEVbT+WMXQmlEHe6t9tTAvx
         RHPHdovzzlRJlMF909TRPUK+mMbrNdz0u/jbM1ddSfo6hHHkZ/UVmod21325puc+UYlt
         q3fNAUMjplXfl55Y4lFVQmGKdt+sHN4I2sa5TeZQlwRUyAVresAvPjCmMy9+YKZuT7Zn
         NjBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwCwnBvr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac87d0d000000b00403c7a46698si2791328qtb.440.2023.08.28.07.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwCwnBvr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadej-0003Bn-I5; Mon, 28 Aug 2023 10:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadei-0003Bd-Pu
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:55:52 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadeg-0000bQ-Ho
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:55:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so525459f8f.0
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234548; x=1693839348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LZVBTLQ7o6iqgGaPYrq/8xZ+5YbpKZVyztY/hfXbBKA=;
 b=iwCwnBvrXgGyy+qOsBH4SDCkhiq2Ep9B+bPTEn6CF/XeWdwSja6Ylrw7JBBV6NeQtH
 W+geRXjsEXHE+LFLbO8u53bdG7IRwlrz8NudRt+ZQ4YF+/TonBprtgdGtw+ro02Yjit8
 wtEklxA3P7dBVmmzEtoqYY2+sRnu5YpKGrZNC3klGXYBm0SkhbQ3rO2BVu+FulQQWnYc
 OGqFrNmku0NJurlG9RWwwSrr+RNKnS5mbUtwjTA4QahWnj6lgVua7T5hMf/UbgXpNx5J
 T8EP08lBcNmyWeGegB637iTUOrBh26hkyQGD+4INX4uuwv2+7Xw9vzvLy7BK3ph02zKw
 L3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234548; x=1693839348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZVBTLQ7o6iqgGaPYrq/8xZ+5YbpKZVyztY/hfXbBKA=;
 b=NH0HOuTilWV42JtRi4YBz/P1yII795ysbt8ffsBI1WAebpmqz0vMYOk3LxXqA1MnOk
 5fQcWEgnfeCJfVjZEe2gC19VZt8Kr2RILdrr9kVma7cuVGWf6ddHooe9QZ0PosO5/3gO
 /keELFIQh8utlN9pQZhDwV8Ai8kImrg6VwXQEL+JfM5lAlAEJEpBvTwL2X4GPycYXkQS
 xmkyCzuQPOHi7b3BbyRF0axWW+l1ka3HFKWkdlsym1izEMW1otzj23MEPxxTScHxd1bD
 vOufCGqyPA2y56f2J1BfsSCbSXfqZcl6Vc6KWwQc/pb1YOF05dRZYMI2BttYG08Yz2Zi
 pWuw==
X-Gm-Message-State: AOJu0Yz9GRzkkgEPcS21TPWZN7zamL9RbHvgAthWhMNBbKLHMPMhXnh6
 Wbs5mqx1qGSqcQOKB1ANrzTbZQ==
X-Received: by 2002:a05:6000:9:b0:319:8d94:c245 with SMTP id
 h9-20020a056000000900b003198d94c245mr20189722wrx.69.1693234548557; 
 Mon, 28 Aug 2023 07:55:48 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a5d4904000000b0031779a6b451sm10682474wrq.83.2023.08.28.07.55.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:55:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] target/translate: Remove unused "exec/cpu_ldst.h" /
 "qemu/main-loop.h"
Date: Mon, 28 Aug 2023 16:55:37 +0200
Message-ID: <20230828145545.81165-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: DgLw/w8V5w4A

Yet another boring 'header cleanups' series :/

Philippe Mathieu-Daudé (8):
  target/ppc/pmu: Include missing 'qemu/timer.h' header
  target/riscv/pmu: Restrict 'qemu/log.h' include to source
  target/translate: Include missing 'exec/cpu_ldst.h' header
  target/translate: Remove unnecessary 'exec/cpu_ldst.h' header
  target/translate: Restrict 'exec/cpu_ldst.h' to user emulation
  target/helpers: Remove unnecessary 'exec/cpu_ldst.h' header
  target/helper: Remove unnecessary 'qemu/main-loop.h' header
  target/mips: Remove unused headers in lcsr_helper.c

 include/exec/exec-all.h              | 2 +-
 target/riscv/pmu.h                   | 3 ---
 target/alpha/translate.c             | 1 -
 target/arm/ptw.c                     | 1 -
 target/avr/helper.c                  | 1 +
 target/cris/op_helper.c              | 1 -
 target/hexagon/translate.c           | 1 -
 target/hppa/translate.c              | 1 -
 target/i386/tcg/fpu_helper.c         | 1 +
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/loongarch/cpu.c               | 1 +
 target/loongarch/iocsr_helper.c      | 1 -
 target/loongarch/op_helper.c         | 1 -
 target/m68k/translate.c              | 1 -
 target/microblaze/translate.c        | 1 -
 target/mips/tcg/fpu_helper.c         | 1 -
 target/mips/tcg/ldst_helper.c        | 1 +
 target/mips/tcg/msa_helper.c         | 1 +
 target/mips/tcg/sysemu/lcsr_helper.c | 5 -----
 target/nios2/op_helper.c             | 1 -
 target/nios2/translate.c             | 1 -
 target/openrisc/translate.c          | 1 -
 target/ppc/int_helper.c              | 1 -
 target/ppc/machine.c                 | 1 -
 target/ppc/mem_helper.c              | 1 -
 target/ppc/mmu_common.c              | 1 -
 target/ppc/mmu_helper.c              | 1 -
 target/ppc/power8-pmu.c              | 2 +-
 target/ppc/translate.c               | 2 --
 target/riscv/csr.c                   | 1 -
 target/riscv/m128_helper.c           | 1 -
 target/riscv/op_helper.c             | 2 +-
 target/riscv/pmu.c                   | 1 +
 target/riscv/vector_helper.c         | 1 +
 target/s390x/tcg/crypto_helper.c     | 1 -
 target/s390x/tcg/excp_helper.c       | 1 -
 target/s390x/tcg/fpu_helper.c        | 1 -
 target/s390x/tcg/misc_helper.c       | 1 -
 target/sh4/translate.c               | 1 -
 target/sparc/translate.c             | 1 -
 target/xtensa/dbg_helper.c           | 1 -
 target/xtensa/fpu_helper.c           | 1 -
 target/xtensa/mmu_helper.c           | 2 --
 target/xtensa/op_helper.c            | 2 --
 target/xtensa/win_helper.c           | 1 -
 45 files changed, 11 insertions(+), 46 deletions(-)

-- 
2.41.0

