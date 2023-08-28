Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1747725dlb;
        Mon, 28 Aug 2023 15:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1dtGh3xU20bVn3pEozaoJdBPXb4T7U+90aiZ3K2zo4oDR585CG7sJ6emuBGQ/rP8sIWFP
X-Received: by 2002:a05:620a:88e:b0:75d:4e8b:9d19 with SMTP id b14-20020a05620a088e00b0075d4e8b9d19mr25353828qka.26.1693260812918;
        Mon, 28 Aug 2023 15:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260812; cv=none;
        d=google.com; s=arc-20160816;
        b=njSp7O6o1bEAEjfzQkrpWisTJUMCppK1pmsGXaJmARrPeqsQNo+iovWzUBeQHtLktO
         UgbiCQN8x73jTErrSG1EDOs+8Oie7Ru3TVE/OK/2P5YfBaiUbMR1aE2cEUB4hD3rK6uq
         S52D0ul0dMZkpt2WoQxU4wWljdcFW9U8FiV6DLtFHfESbGKkRQjJVGsZEGcwZAiWPr7G
         9Z+8Hmsl0mMmjEU13/oRxJpcTt2SQQabOZNhhQJbAZqdX9zOJLN6p32j1z12636L+1U6
         2Hr96pp5VcgGxPrlo3znKrwcPHp1A0/F7kz7aQ+TarT75W2X6bwNwVGLXISNjzB9CJB7
         n3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vvWgyMZBL8l+yzNWAXsAE0ELDVGdPtARPo+/gTAnl9M=;
        fh=CBJPxJEjNCibwfpZfKrPGtkERKtYgP+G6TPhM7p5XaM=;
        b=hOJcSrWo18YEQn0mgUmhVGKSRTElzt3LL/5mg4PxRGLhmjc5qhQxgPiwRp3pOu2SUl
         KiN658t0R3e9bF3MWLM/8YxAfVvlB/HmHazUymMXx4dZLF+6kPxts+wMQHo+gNu0NJSF
         UE84/9gic05yx7l2lYRqqbpOf0Cu/YbZZOnlkuG3/7e8aP2MF81+aNUNIaF3itfu7x4c
         v5zhp3IqyFfK9VW+3KPvleXciA9J71/gAKu/2mUdVJL20zlyBizq8bAuLdXhd882lM9F
         JKJklr5x6DPER6q0PYizROFu4W/JNE2TdKGnpDjxGUHc1u21Z+o6E3oEWoKctyGQQwru
         t1/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDbLRUPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a05620a0cd400b0076db370bd17si3036049qkj.261.2023.08.28.15.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDbLRUPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qakU9-0005pW-JQ; Mon, 28 Aug 2023 18:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakU7-0005on-PP
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:13:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakU3-00046y-Rh
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:13:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso1890251f8f.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260798; x=1693865598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vvWgyMZBL8l+yzNWAXsAE0ELDVGdPtARPo+/gTAnl9M=;
 b=VDbLRUPKwlJ5uXO+SMF7VvAfasHRVSjuFlVgjnAHjQhp8dW/53LSIgybfHKjMrgICE
 X6zHLqwMNvD1RfyAUkg/5bcxiWlOlWZW3WAy7kAqgOYIlHF4URvaTUUgEPjR10QxfyfM
 SCSec3yE+sydhD0pwZqAx1g2SwwcWykWHPac/w3wB44j/x5LbC9EfzDJ9PenbDG+8sN8
 KSZ+mymBsf6E6aR/kB6+shVxeD7pFeDl2yMrix5bv5WhQLVCLeK7OqUXC9J1G/TnV5z6
 gojtRcq81CXFQjxpW6rENtZ6WEVvD/YwLOV7BZPrmjZsltWgQOLtRmlAnWgYnE+D6lMh
 /x/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260798; x=1693865598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vvWgyMZBL8l+yzNWAXsAE0ELDVGdPtARPo+/gTAnl9M=;
 b=QQaK8TCkAOTYhIy8SiCpiEtJIuohpywZ/HNCRrcet+S0QDpJqn7Oedvd8JrR/rPwwq
 y/NQ5HUC4oDBmHZ+xWh66wLs/Q8tSCCuaRb5iLL7DjtdGGm/PD2K0SG/BhS5b7bhwmhe
 XFRnZeuqblAWCdreKv8pLvco5wcpStvZxelJ4s4jcrPU5jT0Z/XTVq5RRc1q8nAl1H0L
 SuXperhROGNHbG1wpUKWe/lX1pJZ+bhBQTpPG0F8aoswLyTzM3O4ieunx+mS1z0V6Gcd
 d9x33BkrBZd+d5PaCVsgHG2z0rJLW6c85M/x5a1jS753EyJPrLtKMBzjCvndJhDbda7+
 kakA==
X-Gm-Message-State: AOJu0YydbfH5gpGuUvUt/pvQ6RAc3546XE0r9USUpshin6PZD2ipaw+s
 m+576cY+HxvoOqEpEIb6qBWfLQ==
X-Received: by 2002:adf:f14c:0:b0:317:59ea:1c6b with SMTP id
 y12-20020adff14c000000b0031759ea1c6bmr465012wro.35.1693260797825; 
 Mon, 28 Aug 2023 15:13:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a7bcbd7000000b003fef6881350sm12139194wmi.25.2023.08.28.15.13.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/11] target/translate: Remove unused "exec/cpu_ldst.h" /
 "qemu/main-loop.h"
Date: Tue, 29 Aug 2023 00:13:03 +0200
Message-ID: <20230828221314.18435-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: mS2Y4Wi9XG2i

Yet another boring 'header cleanups' series :/

Since v1:
- Addressed Richard review comment
- Added Richard R-b tag
- 3 more patches around 'qemu/qatomic.h'

Philippe Mathieu-Daudé (11):
  target/ppc/pmu: Include missing 'qemu/timer.h' header
  target/riscv/pmu: Restrict 'qemu/log.h' include to source
  target/translate: Include missing 'exec/cpu_ldst.h' header
  target/translate: Remove unnecessary 'exec/cpu_ldst.h' header
  target/translate: Restrict 'exec/cpu_ldst.h' to user emulation
  target/helpers: Remove unnecessary 'exec/cpu_ldst.h' header
  target/helper: Remove unnecessary 'qemu/main-loop.h' header
  target/mips: Remove unused headers in lcsr_helper.c
  target/xtensa: Include missing 'qemu/atomic.h' header
  qemu/processor: Remove unused 'qemu/atomic.h' header
  exec/translation-block: Clean up includes

 include/exec/exec-all.h              | 2 +-
 include/exec/translation-block.h     | 6 +++---
 include/qemu/processor.h             | 2 --
 target/riscv/pmu.h                   | 3 ---
 hw/xtensa/pic_cpu.c                  | 1 +
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
 target/xtensa/exc_helper.c           | 1 +
 target/xtensa/fpu_helper.c           | 1 -
 target/xtensa/mmu_helper.c           | 2 --
 target/xtensa/op_helper.c            | 3 +--
 target/xtensa/win_helper.c           | 1 -
 49 files changed, 17 insertions(+), 51 deletions(-)

-- 
2.41.0

