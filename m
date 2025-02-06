Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp668316dlb;
        Wed, 5 Feb 2025 17:32:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVipFcnk+R4F9kKbOR87lFRDtj7IvhtRQuUV5gU59L6pZFJZoiLj2OgslRYz6FQKD6X4vSJLhTYI8ZiIw==@linaro.org
X-Google-Smtp-Source: AGHT+IGhGWQlPJJ+gK8jVz2O4cHcZ5xGBu9uaABRkR1kjIhJBDT7S2Jy/J23C3nyMZpxeQ9f8GVL
X-Received: by 2002:a05:6214:27eb:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6e42fbd377emr76184346d6.23.1738805521146;
        Wed, 05 Feb 2025 17:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738805521; cv=none;
        d=google.com; s=arc-20240605;
        b=V+7DG+mkyViXbd2PBAszQXjjuUL1MtZrsLKnQu+6+8YHkJ0crq9WbVoMQH2KkLvu1t
         gNMt5sIa9BPzCmKRCeKh6ZoL5x9fGV5KfArOurGBwAuiAGHBi7ijYuRRoaiDD8u/iDH+
         MSzFXGhgLfR4/NlyV12hfw5qcxvadn2haGKWWQQF7El+eqnYff9smHlaumsL//07Ldxo
         KlEMuegONBDHQj4uZskARn/CO0xO1ZGqDudL3m6YZ1BEFYaOPQjsZ40FftUoYFEmhJA4
         eapdaH8ARmwgAl40P3W7UrisHWQ0MbovVNihNS/5JNBxyZhIJNXSeuuUgJVh/pTpU9SZ
         ZxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=6H53Z1uXZaAXgTmZF6LwgzkOoyjl/bBsioLhlrHPsI8=;
        fh=zEsyXHM5341ZmEZeRygnyMNFMy/uCeaSHp0n2rhaj2c=;
        b=J58ouKZSsnJ4zoLL5gbtvU9yEPVm6FRGqn8PXOaoAqFexprGXLAoU31UyCRC6UjwJx
         SB0G54xdJ16LC5O7g++wt+sFHiKTVXmJssdi7lrOHzy0Ojn/n2rRD3me0ZNmeDUO733z
         aXJ0ZUcyFr/8DGm8HRwJCma7H7zSefhBQ/cJV/0T92MM2YEbUp4DXXfMEr/CO+aPEWSn
         nmVbzZYIzeTbjNYue9n2P/ewLHWZ+vHQ+OdMzU+5VXk+QYUiZ/of81yqdEHJxluIaxpE
         w7MeehftYgmyQz0rPNrXQL14l5eKkuDybUY6db/BdGdOCJt/t+cHQ0kFzaUXwEUuvTjj
         0kEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Zk8/u6yr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba38113si2202316d6.110.2025.02.05.17.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 17:32:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Zk8/u6yr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfqk4-0005E7-S3; Wed, 05 Feb 2025 20:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33xCkZwgKCNQMK70EJI76EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjh-0005BS-Ge
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 20:31:24 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33xCkZwgKCNQMK70EJI76EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjc-0006sW-UU
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 20:31:19 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-21f02d17cd0so7433375ad.0
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2025 17:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738805471; x=1739410271; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6H53Z1uXZaAXgTmZF6LwgzkOoyjl/bBsioLhlrHPsI8=;
 b=Zk8/u6yrSIAxdgb5wkML6uE9CxY4+wpxppCdOInhzLYps0uNv5fOrhPSYSdbAt0aay
 0wQwqlhpg3DO+gxSwyNVK3yDBpIzJAUIj1BmRicr+NyABvwFuCXgrle6qI6DqoHqgxiQ
 JfN8PHEAuubk4HBnmyHt01+qWHuyu5QiGhPd0smA7srt4Bjt8ytrSTBJEjfFfaKils1Z
 EeUzbSJ0JA7yrnd3HcLPHi1wUsTQdG80+1fZKLWwkCNbx+Rt78d0VcZ6eB5qRKrXMoEg
 1mc2YlzxANS8QhER3EQl9HL+bD3uqNLU6imHK6cHEO3A4KsyQrd45X19bHUUIKtPZT9B
 NaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738805471; x=1739410271;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6H53Z1uXZaAXgTmZF6LwgzkOoyjl/bBsioLhlrHPsI8=;
 b=C/c0OI0/Cc3sWY+aTgpqlrwENdCNOcP57JdsFJYA/susmp+qB1sqtSzcCM63OBM64r
 H5bhrXUQCKkTSQqIEdNtJ7H9ashjdguq2wIcXvFGdbHA0piUfccYouMdO2FIItv/gqrU
 HXayGWS9ix/dFLQ9yF91in6+HB8YF0Feh/PtAo/SN/exOTdS+hEhctb2y0AlSJe9Oleh
 20xIYYaHspXNmWmJZyPAesqqaV0b0jt109U7l2k57ZZVcbvi8OFVlm4yO8ni1N5wyDZI
 w4yrpbdhO0ADuRsKfEmfM85oNxlQ2mgwSbH+nNOO/HHaZiHBiT1klPZu1ZxB9Y4V5qkT
 3Trw==
X-Gm-Message-State: AOJu0YxbGOwpRyC5BriAySVIIfmJ+0mATy5Nk06NH4do3zYoif1wjxOe
 comc2NK7OHrBfbP2GC0RAzTz5undSBNNEZ/ukDzPy9WnAnzJLsvZ2HPDEKFSKjVPO7v9GS/xb/f
 eQ7U6UC2e7g==
X-Received: from pjbpl10.prod.google.com ([2002:a17:90b:268a:b0:2f8:4024:b59a])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f786:b0:216:2abc:194f with SMTP id
 d9443c01a7336-21f17edec5cmr93802495ad.40.1738805471300; 
 Wed, 05 Feb 2025 17:31:11 -0800 (PST)
Date: Wed,  5 Feb 2025 17:30:48 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206013105.3228344-1-wuhaotsh@google.com>
Subject: [PATCH v3 00/17] hw/arm: Add NPCM8XX Support
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=33xCkZwgKCNQMK70EJI76EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: kcEMmS0526S8

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
 hw/misc/{npcm7xx_clk.c => npcm_clk.c}         | 240 ++++--
 hw/misc/npcm_gcr.c                            | 485 +++++++++++
 hw/misc/trace-events                          |  12 +-
 hw/net/meson.build                            |   1 +
 hw/net/npcm_pcs.c                             | 410 +++++++++
 hw/net/trace-events                           |   4 +-
 hw/ssi/npcm7xx_fiu.c                          |  11 +-
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
 29 files changed, 2434 insertions(+), 370 deletions(-)
 create mode 100644 hw/arm/npcm8xx.c
 create mode 100644 hw/arm/npcm8xx_boards.c
 delete mode 100644 hw/misc/npcm7xx_gcr.c
 rename hw/misc/{npcm7xx_clk.c => npcm_clk.c} (81%)
 create mode 100644 hw/misc/npcm_gcr.c
 create mode 100644 hw/net/npcm_pcs.c
 create mode 100644 include/hw/arm/npcm8xx.h
 rename include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} (83%)
 rename include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} (76%)
 create mode 100644 include/hw/net/npcm_pcs.h
 create mode 100644 pc-bios/npcm8xx_bootrom.bin

-- 
2.48.1.362.g079036d154-goog

