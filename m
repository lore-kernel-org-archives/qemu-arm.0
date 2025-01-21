Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp152715dlq;
        Tue, 21 Jan 2025 06:24:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUn+u2jXUMdWQWOlm7psz3uZbIjm28EAAJ1lqQAgNGYFve8vMIybnh5YT4oPjyDdcE92sxp1xFsoFn/Wg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvg0khur7P09hwRKbku5zBK/ft4mBKtXcyDJlCfjWiY6pL9yZhaPL/B4+Rf9Lsgv+ZsnTK
X-Received: by 2002:a05:622a:289:b0:466:d559:b528 with SMTP id d75a77b69052e-46e12e8ea76mr253464581cf.17.1737469494811;
        Tue, 21 Jan 2025 06:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469494; cv=none;
        d=google.com; s=arc-20240605;
        b=DkZ6Lip2Z9KQO25U60sGRa78dnAOicNHtlGdLhW6qKQi81kqcc9YXlM0Ynbb7cloB0
         hzq2ExJPQHCKIBpGR5D67i81YNChL/AyhLiRPI5vUdSfTdlnkuMWQwiudCiippqqOKOm
         VHJrfcX4m8WP1LdT3efwIu2uWPX2IVQyfNPWJi3+4qCDHjmP7vVj3pTYunEYfQhYT0+F
         Uqwgue37v/Z80GZYEaNClO6WEeWilf7ppgku4A2Peuxzl367/4AOLhNG9zrLQrJ/LDOi
         9auWjCUrRFHuKsplVRT1z+O0hnzNfbzeC/6inN1ZkUy1jvQf8fzlxSNUtlBgqtwM3TPd
         NLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=huBnZLMMoWYJ6yRI7yv6u3SXGmIuRg6gkaMshUEQcb4=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=XuYJ4TsilQXPCFQuLugIO+doALJZ18pJ7fnUqxgSwPfJNdNNnExEzxsfQ2pePBTfnp
         T7NIg3BwTJP7FoCFhtGMTVKFXJQ8ZmH3emG+zVvE3FVZZQ65TIEs6e7NMxgRuNeyyOSt
         pEX9yY1/XZy+1bdkqGQihBG9KC/Pur8py2ihCWCNXN0gWVcE++bSecFGScunH+GbmBuT
         oDIW/Wz0xf/DfzMk79EXQhymQvlU12casPTMl5At6dbq3EGsZ6xz40V1od+t2qVKjh8X
         AcuiGPjZyVTLlAyBCCV+9ShFs6JO0Avz17WcnHNlzntGA16VcjWb+s7ix/fgCrrHio5x
         MpVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wf3kJWY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e104873b2si120198461cf.471.2025.01.21.06.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wf3kJWY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFAV-0000KA-45; Tue, 21 Jan 2025 09:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAT-0000Jj-CJ
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:23:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAP-0002wf-VM
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:23:49 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso40946685e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469424; x=1738074224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=huBnZLMMoWYJ6yRI7yv6u3SXGmIuRg6gkaMshUEQcb4=;
 b=wf3kJWY2nzHFXuAKFGXVp+bjIkUfBgIzC6JWfyyzE8V5a8mEKk1/q+2HmbrzIUdtRL
 ahH03jR5fjKyld7zFTylCNDDfPrTnc6/bF6VOFyBhz4kUK5Dv1BtIA4viEadhvXdbYF9
 ULHthNGDW1/1MEx+CN4bppx2wmw7p26FRdxwpoD5fK22HL9VtO02PzoX2P9DKioWqt1C
 dZFrY7uOc7DlzfeguAQ3uUrvCVspN3tkvAzMNJVRIl8KzFXLnhpcA7629gnEYjmKg55z
 lMC47lhA5Gw2BhskEw/PwhjyJ2yPjbSlszHf/vn9lWYdfiur/DbTWzzLfKpZM/KsBkAj
 16aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469424; x=1738074224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huBnZLMMoWYJ6yRI7yv6u3SXGmIuRg6gkaMshUEQcb4=;
 b=vKIT8FBoVZS8vwBccukV0Cx38I/vvqfKItVnYfOmlLhpL8Iyty7UAk79l83/MYWb/b
 UoJle1YfZwCgGssg2xTW88ZPReC4zKPHA+HnZEWVCk7bZA29+x3Ag0CEC/eRjXoZZart
 pjnwAIvq6O5/spaQz+GHxgpW4UboKgUFTLknbvyjLoIEY57l7hpBp4rmpxmEPpKhE+g4
 +CLNVAPfDlzF5ktYZ5gqBrTuQWgY6U3x2W60b9QgvBwZgVwap0REqcMtwn8ignU7krGl
 oMUjKQtuV999hL0D0B4JRUvygRtiUDkouMa2DQSphD213BqFcNBW928KQBw1rBcMPmgw
 vOEQ==
X-Gm-Message-State: AOJu0YzTtKJKTXk28K8sQov6oQ9FzkHHSMzQ3uU6CfjY8KxpWyapahL+
 fjGU7F7AeRSR8jPMmd3tVtDLUOwxZi3O2kpgb+J+qb4M3l/zors21T/IwPQIBP8=
X-Gm-Gg: ASbGnctaIiqPoMEocrp13KWEq4DAXZz4xktHnOE3Y96/t6BChkdXhQRzfrMRnkj1zaC
 omcvpx06TeR1HFhdS8T7203VNIL8OVxdKiVt5za0hHgMklP3cUMVD/W02PHLW4xgCv3PwJ5Djww
 eJXr/4/urBVY3IvxDB5usUqTlD38PFDYJwiMiJuQAMsKokWZ4pssUaO4LWXj2O1UcNO5D6d35AN
 m82Xrv/zi6aL2hzEdMCgM5/7GPIHhEpiRf0bVuPl3ASrPPtsYgUfWBcxrR+ICtQvhewPbXx4Cei
 cRkHAk/bLVBAVBVAv+hbmQVoEmKgth2YxfwRdGuMstGJ
X-Received: by 2002:a05:600c:1da8:b0:434:a711:ace4 with SMTP id
 5b1f17b1804b1-4389eca3ca1mr159671455e9.17.1737469423851; 
 Tue, 21 Jan 2025 06:23:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890469ba8sm178907415e9.37.2025.01.21.06.23.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/28] cpus: Restrict CPU has_work() handlers to system
 emulation
Date: Tue, 21 Jan 2025 15:23:13 +0100
Message-ID: <20250121142341.17001-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RuhCQYbadGBi

On user emulation, threads always have work to do, and
CPUClass::has_work() is never called. Restrict it to system
emulation, allowing to simplify a bit and reduce code built
on user emulation.

Based-on: <20250121114056.53949-1-philmd@linaro.org>
 "cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro"

Philippe Mathieu-Daudé (28):
  target/hexagon: Ensure not being build on system emulation
  target/rx: Ensure not being build on user emulation
  target/tricore: Ensure not being build on user emulation
  cpus: Restrict cpu_get_memory_mapping() to system emulation
  cpus: Restrict cpu_has_work() to system emulation
  cpus: Un-inline cpu_has_work()
  cpus: Introduce SysemuCPUOps::has_work() handler
  target/alpha: Move has_work() from CPUClass to SysemuCPUOps
  target/arm: Move has_work() from CPUClass to SysemuCPUOps
  target/avr: Move has_work() from CPUClass to SysemuCPUOps
  target/hexagon: Remove CPUClass:has_work() handler
  target/hppa: Move has_work() from CPUClass to SysemuCPUOps
  target/i386: Move has_work() from CPUClass to SysemuCPUOps
  target/loongarch: Move has_work() from CPUClass to SysemuCPUOps
  target/m68k: Move has_work() from CPUClass to SysemuCPUOps
  target/microblaze: Move has_work() from CPUClass to SysemuCPUOps
  target/mips: Move has_work() from CPUClass to SysemuCPUOps
  target/openrisc: Move has_work() from CPUClass to SysemuCPUOps
  target/ppc: Move has_work() from CPUClass to SysemuCPUOps
  target/riscv: Move has_work() from CPUClass to SysemuCPUOps
  target/rx: Move has_work() from CPUClass to SysemuCPUOps
  target/s390x: Restrict I/O handler installers to system emulation
  target/s390x: Move has_work() from CPUClass to SysemuCPUOps
  target/sh4: Move has_work() from CPUClass to SysemuCPUOps
  target/sparc: Move has_work() from CPUClass to SysemuCPUOps
  target/tricore: Move has_work() from CPUClass to SysemuCPUOps
  target/xtensa: Move has_work() from CPUClass to SysemuCPUOps
  cpus: Remove CPUClass::has_work() handler

 include/hw/core/cpu.h            | 30 ++++++++++++------------------
 include/hw/core/sysemu-cpu-ops.h |  4 ++++
 target/hexagon/cpu.h             |  4 ++++
 target/i386/cpu.h                |  4 ++--
 target/mips/internal.h           |  4 ++--
 target/riscv/cpu.h               |  9 +++++----
 target/riscv/internals.h         |  3 ---
 target/rx/cpu.h                  |  6 ++++--
 target/s390x/s390x-internal.h    |  5 +++++
 target/tricore/cpu.h             |  4 ++++
 hw/core/cpu-common.c             |  6 ------
 hw/core/cpu-system.c             |  6 ++++++
 target/alpha/cpu.c               |  4 +++-
 target/arm/cpu.c                 |  4 +++-
 target/avr/cpu.c                 |  2 +-
 target/hexagon/cpu.c             |  6 ------
 target/hppa/cpu.c                |  4 +++-
 target/i386/cpu.c                |  8 +++-----
 target/loongarch/cpu.c           |  8 +++-----
 target/m68k/cpu.c                |  4 +++-
 target/microblaze/cpu.c          |  4 +++-
 target/mips/cpu.c                |  4 +++-
 target/openrisc/cpu.c            |  4 +++-
 target/ppc/cpu_init.c            |  4 +++-
 target/riscv/cpu.c               |  8 +++-----
 target/rx/cpu.c                  |  8 +-------
 target/rx/helper.c               |  4 ----
 target/s390x/cpu-system.c        | 18 ++++++++++++++++++
 target/s390x/cpu.c               | 18 ------------------
 target/s390x/interrupt.c         |  8 ++------
 target/sh4/cpu.c                 |  4 ++--
 target/sparc/cpu.c               |  4 +++-
 target/tricore/cpu.c             |  2 +-
 target/xtensa/cpu.c              | 12 +++++-------
 34 files changed, 114 insertions(+), 113 deletions(-)

-- 
2.47.1

