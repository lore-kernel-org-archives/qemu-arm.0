Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1553688njb;
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhG/q/ee4VPMVsWotRSSFyINoD37WoriUzzHuVABYlQVVj4qnMtPtS4SRUJ+nW1u5NA4r4L0HJTwE/Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IFUhaWJuco7eKyMeMnCQcWix3pifr3L3ZsA+LZEZepUmtk4qfLGcQK9aH1lRjco/aR0nQoc
X-Received: by 2002:ad4:5de8:0:b0:6d4:25c4:e775 with SMTP id 6a1803df08f44-6e66ccbc0e0mr289737866d6.15.1739990890437;
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990890; cv=none;
        d=google.com; s=arc-20240605;
        b=i3LD1lxpFPZ5TLudRQ3CGtnq6FBpOmRAK6rRMt9Gx7z3QKyAWPu0JTkAOYMckm+lNf
         q7rUq+1f56GBdPnF1ApQLDJNcSJe7z5p7lmOFMh0lSqKfb96G9wJu9ve1VrujZjH0scy
         1kwAG6iqeSsiXkyba5Xw9t3VBT9zxqwGLzOyD+hjwhYMlc9uPgESN26+6SZQu6VKTVU2
         I5FbTacghWyMZ/ikl6+brAmHT3xpzMi1Udk+Pb9FlzFqIeuCaJtIChpsArp0urIcninN
         fy1pY6wrLChKSKIA1AjfQ5tC7C3rRgqq0zOz3MVhbZqN3kj4/CmptlfJ400dqaj8SWjy
         TkxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=YRjQoDBiw6x1CeKFLUk8y/8E5FWr/phQtEIRRCz8Jjc=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=YKUTKU5l5oPLsgGNPHLDSq5Z/aIjIsgAl4Zx5+3mIqieKNPl70z2RG3S1sl765ITx8
         4ncU4RQWseayXSrV1yEpuMx9OUJbPuvdoYQu8qH0XUxVPDFA6rw0GK+cgk47pm+GgVc9
         wL/TfmwW1xHOqmwYW7bHdfQI/EEvAt+Dvx5CAEDn0orNDBJwKQ1vc56Y5OgJURfj+kaA
         qyCKyS+irGKLf9yr/apVY8Dh1Dz1uN8IWridW8XLpWtbGXu8WLSZoTA4BmRAnu9/qs4N
         +uYu7PtrBba9G5MG2sJtkNWf4D93IT9FBnn8uyIpcmSP+iELZ6U4hLSk0jfNZPPAMZYq
         Kj+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Zes3eIb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9cf442si133286636d6.473.2025.02.19.10.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Zes3eIb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkp5k-0002zw-J1; Wed, 19 Feb 2025 13:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_ya2ZwgKCGoecPIWbaPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5Y-0002wH-Nd
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:35 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_ya2ZwgKCGoecPIWbaPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5W-0004gD-JD
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:28 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fc1eabf4f7so291212a91.1
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 10:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990784; x=1740595584; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YRjQoDBiw6x1CeKFLUk8y/8E5FWr/phQtEIRRCz8Jjc=;
 b=Zes3eIb10iKKuiZ+TtH5O96d+PG20CBSF3tWp/M3HMgSxah4s5N39VHyvEdUVb9+MV
 LThU3UNiC9XukfFkMZ7IY3MAbbEBPB3i2I/B0eUauvAQ1UU9BdrZrug4wvWz0nM69zXy
 tqa+g5D8qvEB+STLU22PBI6/CnIceHwyL7eCanV3QDQIav+AUtiPvYGBEboPhlWzoDCp
 eQThkcFBEldqpbiGqIVZUmnNz6BEdUb9xQrTV3LG9ZL8H6KTHkaGOHQw3FTcqWps9sqd
 y8pTUpLepohAJ16izHCblfPnlovdGAoovxpStUWVFQmGG5cLYzqIgyN25LBX/QBYBZUm
 DkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990784; x=1740595584;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YRjQoDBiw6x1CeKFLUk8y/8E5FWr/phQtEIRRCz8Jjc=;
 b=SYWb4BLI434PbgssdEESEcmuESsjsuQjr7GYhR2cImDjQBNq0OPNJ7WZVnDYMaS/dQ
 9MRW3gRTfAHaX1SDnO6MhPPPZApi4Lj4GeLVZPc23OUldTDfj+nrUo7UyM/G+UBKlR2v
 2LF1UT6rtob83fi5+LrCBxOZcixCCygp+EQwgA9QYhYhlQP8eEA9n/RbWVlqHolpX73z
 +F6OfR4a6RTteUU+04FtgRqt1brDuisOdcpPNnoTXXqXTVIGka3Rgvery+kih7p3sR7l
 Totni9/omhgWgZqSy0ocWSS+k8pNhGWsyYS4ArUiMn1wsw0abQUdijC3CG0ZBlznN89Y
 D8vA==
X-Gm-Message-State: AOJu0YzlqTAr8v59/b2VfC1J6FuBXltT9MSDRZWjxl+yYT5u7mmFYTsS
 n4YzSiHK4aVG20FDEQTSzC6CJxQvNly+uWO/BOqhMXl4swuIMU4WlDn9Y0qC1JR54bgxijevFyh
 D9JOQNgXCRg==
X-Received: from pjbnd5.prod.google.com ([2002:a17:90b:4cc5:b0:2e9:38ea:ca0f])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2789:b0:2ee:f80c:6889 with SMTP id
 98e67ed59e1d1-2fc4116bc28mr32224508a91.33.1739990783747; 
 Wed, 19 Feb 2025 10:46:23 -0800 (PST)
Date: Wed, 19 Feb 2025 10:45:51 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-1-wuhaotsh@google.com>
Subject: [PATCH v5 00/17] hw/arm: Add NPCM8XX Support
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3_ya2ZwgKCGoecPIWbaPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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
X-TUID: Xqlmxobl6K5Q

Changes since v4:

1. Bump vmstate versions on NPCM CLK and GCR modules.
2. Remove "hw/boards.h" include in npcm8xx.h and add it in npcm8xx*.c
3. Use cpu_to_le32 instead of tswap32 in npcm8xx.c

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
 hw/arm/npcm8xx.c                              | 805 ++++++++++++++++++
 hw/arm/npcm8xx_boards.c                       | 254 ++++++
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
 include/hw/arm/npcm8xx.h                      | 127 +++
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
 29 files changed, 2434 insertions(+), 369 deletions(-)
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
2.48.1.601.g30ceb7b040-goog

