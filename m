Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1845476njb;
        Thu, 6 Feb 2025 14:12:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5oltc+mzqBqmSavWKTAY6dsmC0IQwTmdqQidJCrOZpNxBIQdJNqJjF+OQ0VwknFktvsXvEkyChb6WKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG7g0OVXd0zi29fDonMtgdYPdI18BVSjshWnOmodM9y+jIXx9pNXBszgyZwmulWqVMfL5s1
X-Received: by 2002:a05:620a:258b:b0:7a9:abee:992 with SMTP id af79cd13be357-7c047ca7c17mr115046285a.50.1738879952761;
        Thu, 06 Feb 2025 14:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738879952; cv=none;
        d=google.com; s=arc-20240605;
        b=TilqYrZub9hEtMwlB0eRH4QS8wCKkr8HGtq7dpgAc8uYewaLJrL5Ofm+0w2xzMtG6L
         obpPTaCwOFZ2RQDR4JSULkbmfjo/049hancxOntXdsZnTRdjWsJ+hKgxxyb6upntwPAo
         8ppaK2vh2cRa3sS5g7dOlvL8wNQleqH/74uJd4YlLJMmkuAltjiwjPOuX3j8Syi1vC3r
         niI5wEu4US51JXDkOwtlSoG5phDdyQg2HOE6gkY4OTHhz5OpSdMQMuXGO4CA9uDGkEK2
         p2WXD9B2t0C1uCuC5u+iPiEuwt+/yrtOCpqTdvZf8q62NSPdPPxIL/XI+lVHKwITDdxb
         stPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=1kvd4DOi2VmxFqpp8w4ni6ug/P5xJWrEFTSvZ/wVIA4=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=cExbbs5qqYNLy6XZvRaDNzSrGvBpH6ED049npf8nlNioUDtSi6s0yg8QmQeKhM47FQ
         jDEjFyLmCw1mPVrrPFb/K6C43t8Qs+bQFSQR11Jldw0sVEzPigXJfxPOMIswl0voHBZF
         svL/5SyK6ufD8tlY/y3jmSzPiGk041hNVhq/uyGOhKqrG6bBbe96m78H29cRuqcETQig
         3u0gnv13oL0AifHZiWDKjOyxs3ofq9/qj1Tv9wIo7HwFSc/tYhrR4BosHKKvsxJEuyAQ
         zSvHznJJtIa///Cf9wuR5oV511uSVXeXrRylzmTrooS+9tHj6COlSx3RUG66ahf+oFys
         u8bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SoPWdAiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c04755a7c8si66670385a.182.2025.02.06.14.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SoPWdAiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgA6Y-0005YG-Er; Thu, 06 Feb 2025 17:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tzOlZwgKCPYusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6W-0005Wx-4E
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:12 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tzOlZwgKCPYusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6U-0001OR-2v
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:11 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-21a7cbe3b56so21805715ad.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 14:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879928; x=1739484728; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1kvd4DOi2VmxFqpp8w4ni6ug/P5xJWrEFTSvZ/wVIA4=;
 b=SoPWdAiLEVoGLUmptk6BRrC2QsV5JPYZGF/lVAPJcdshNZBsao6P/aI2EpFJi8DMMk
 FrzARhcR+8oVdUaeI6cckQY0Os1xkMch1XIFra0xoY9bfzRJmcb4VjNGY09f3tbq64WO
 b3G/HHEc9YZBt4ZAbmwJKm6afh09HrfuaTq+tCJ5nYGGRkOjbRCtb74BQE76gdbgsIGu
 0MjXGEMQg9XLd9oW2dsUs+yzWNulmrQ6PovHNcBXo59pmm4CMeXaARXKbpBFgnOGmtxj
 OPp9hpIVd75WWIujEcGRQz2aaBKoRhitCmfS5ZuJhmJQU/wmta+yjqMtDjuFeh1xRCPA
 YyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879928; x=1739484728;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1kvd4DOi2VmxFqpp8w4ni6ug/P5xJWrEFTSvZ/wVIA4=;
 b=c8EZWPQi7rwk6NpVyEs7YL970dAhL7l7CsZGb2E7m07NmtzEzMTdU99TKMj2CQIkC8
 ILwFdq8aRGBCzbDQKDcqjR9iC8RyqFdnTv4zCTbySMZTZHRhSy+wA7WC1hdfkEQPHrYI
 Wnr3Y71AihDDvG3ImhR8J3wUIGgvG96bBTjAlyOWIdskawsTvr5f8CCjlhRtcSKikiSR
 TdaNVvlqaYrpQUoRVNZK1pdCReSf3EnlyqgVO7gK8jL8rqp53lOn2rBI5hBNXPZ38vMt
 3gBhd4duam33wU1kPrQ3KYBnT5bC8B1u/2WKYTZ0R2mzGYkMp0OJMzEqkBqkdSiA3jh/
 JSsg==
X-Gm-Message-State: AOJu0YwbMy0pWiwfkU0+ZqLgvrVOroT+0leCjaVelWO8FtdtoJS+X/vO
 lcAtFJrHHAL+DOtKWuX5OTHZQhD5T+TOAZc7Zqof6DxBevyGHk2QSx79lHKvfqCUnD/fGgB7tPS
 +WFLjAeeg6w==
X-Received: from pgrx7.prod.google.com ([2002:a65:4547:0:b0:7fd:3c4b:d9d0])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9f4a:b0:1ed:e7f0:3136 with SMTP id
 adf61e73a8af0-1ee03a8db7cmr1698342637.20.1738879927803; 
 Thu, 06 Feb 2025 14:12:07 -0800 (PST)
Date: Thu,  6 Feb 2025 14:11:46 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-1-wuhaotsh@google.com>
Subject: [PATCH v4 00/17] hw/arm: Add NPCM8XX Support
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3tzOlZwgKCPYusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: lCsZovxZ4ISu

Changes since v3:

1. Removed REGS_END constants according to code review.
2. Added a few asserts according to code review.
3. A few minor style changes.

Changes since v2:

1. Update doc to include npcm845-evb description
2. Add g_assert for register size in CLK and GCR enter_reset function
3. Fix various 8xx SoC and board file issues.

Changes since v1:

1. Updated vbootrom and pc-bios
2. Split out CLK/GCR patches into refactoring and adding new features
3. Fixed a few misc items from the patches.

---

NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature
quad-core ARM Cortex A35 that supports both 32 bits and 64 bits
operations. This patch set aims to support basic functionalities
of the NPCM7XX BMCs. The patch set includes:

1. We derive most devices from the 7XX models and
made some modifications.
2. We have constructed a minimum vBootROM similar to the 7XX one at
https://github.com/google/vbootrom/tree/master/npcm8xx
and included it in the patch set.
3.  We added a new NPCM8XX SOC and an evaluation
board machine npcm845-evb.

The OpenBMC for NPCM845 evaluation board can be found at:
https://github.com/Nuvoton-Israel/openbmc/tree/npcm-v2.10/meta-evb/meta-evb-nuvoton/meta-evb-npcm845

The patch set can boot the evaluation board image built from the source
above to login prompt.

Hao Wu (17):
  roms: Update vbootrom to 1287b6e
  pc-bios: Add NPCM8XX vBootrom
  hw/ssi: Make flash size a property in NPCM7XX FIU
  hw/misc: Rename npcm7xx_gcr to npcm_gcr
  hw/misc: Move NPCM7XX GCR to NPCM GCR
  hw/misc: Add nr_regs and cold_reset_values to NPCM GCR
  hw/misc: Add support for NPCM8XX GCR
  hw/misc: Store DRAM size in NPCM8XX GCR Module
  hw/misc: Support 8-bytes memop in NPCM GCR module
  hw/misc: Rename npcm7xx_clk to npcm_clk
  hw/misc: Move NPCM7XX CLK to NPCM CLK
  hw/misc: Add nr_regs and cold_reset_values to NPCM CLK
  hw/misc: Support NPCM8XX CLK Module Registers
  hw/net: Add NPCM8XX PCS Module
  hw/arm: Add NPCM8XX SoC
  hw/arm: Add NPCM845 Evaluation board
  docs/system/arm: Add Description for NPCM8XX SoC

 MAINTAINERS                                   |   1 +
 configs/devices/aarch64-softmmu/default.mak   |   1 +
 docs/system/arm/nuvoton.rst                   |  27 +-
 hw/arm/Kconfig                                |  13 +
 hw/arm/meson.build                            |   1 +
 hw/arm/npcm7xx.c                              |   6 +
 hw/arm/npcm8xx.c                              | 804 ++++++++++++++++++
 hw/arm/npcm8xx_boards.c                       | 253 ++++++
 hw/misc/meson.build                           |   4 +-
 hw/misc/npcm7xx_gcr.c                         | 264 ------
 hw/misc/{npcm7xx_clk.c => npcm_clk.c}         | 235 +++--
 hw/misc/npcm_gcr.c                            | 482 +++++++++++
 hw/misc/trace-events                          |  12 +-
 hw/net/meson.build                            |   1 +
 hw/net/npcm_pcs.c                             | 410 +++++++++
 hw/net/trace-events                           |   4 +-
 hw/ssi/npcm7xx_fiu.c                          |  16 +-
 include/hw/arm/npcm7xx.h                      |   8 +-
 include/hw/arm/npcm8xx.h                      | 128 +++
 include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} |  43 +-
 include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} |  29 +-
 include/hw/net/npcm_pcs.h                     |  42 +
 include/hw/ssi/npcm7xx_fiu.h                  |   1 +
 pc-bios/README                                |   8 +-
 pc-bios/meson.build                           |   1 +
 pc-bios/npcm7xx_bootrom.bin                   | Bin 768 -> 768 bytes
 pc-bios/npcm8xx_bootrom.bin                   | Bin 0 -> 608 bytes
 roms/Makefile                                 |   6 +
 roms/vbootrom                                 |   2 +-
 29 files changed, 2433 insertions(+), 369 deletions(-)
 create mode 100644 hw/arm/npcm8xx.c
 create mode 100644 hw/arm/npcm8xx_boards.c
 delete mode 100644 hw/misc/npcm7xx_gcr.c
 rename hw/misc/{npcm7xx_clk.c => npcm_clk.c} (82%)
 create mode 100644 hw/misc/npcm_gcr.c
 create mode 100644 hw/net/npcm_pcs.c
 create mode 100644 include/hw/arm/npcm8xx.h
 rename include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} (83%)
 rename include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} (76%)
 create mode 100644 include/hw/net/npcm_pcs.h
 create mode 100644 pc-bios/npcm8xx_bootrom.bin

-- 
2.48.1.502.g6dc24dfdaf-goog

