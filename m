Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087002lfc;
        Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
X-Received: by 2002:a63:c643:: with SMTP id x3mr8550499pgg.299.1584042142074;
        Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042142; cv=none;
        d=google.com; s=arc-20160816;
        b=EdAvq1U/JaCLalRkxwrhZqVcsFw2Fb57iw+C0OtmoUiwFegZGyJLJE26DCrZS26s9U
         RnetCHZ6NgHn0V4ztVv60eNRDNVNk+XxEWOVwA8My/5AHUXWQvWpNnxnlM4WO0F8Kpf6
         DvPhQy8SvFlky0+9qL9LJ7kYjlLUAt66ETJK1gxjnQilMLro4q+zqndOo6J9YwuTS6xQ
         CoDrvQNKTG1TSGDX3RmBKRA3CLQGGIOhQw7Lp9PhLoKXu3xJ84QauVtwEWonm8F3cv9f
         stffKS65+YOcSMDG3fi0Hze6O8YIEhNR85vQ8ZwBSi6ffaDF2YJcY2RK71nY0Cl25WgQ
         Sq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/zHbZh0dod5oMK8gTomTJjtjrWcaZXLW0KPv8APWrNg=;
        b=tBL1GqVNfapYXiHu/UMwvaG2pJ2TzcWV0wF3hSz38P1tJhShVVklqcM1+/u9I5Lt6P
         Z1oii4nYWHc1S922MShHpCAkGsBzUWhL7nLP+l0UN+F+rjDqcIl8B2BtEnDrc2yi5zJ0
         q399+GKFl3Q9xTXM6C200t+bssDuxLc43pakSEuPTqvzQBaQgapZ86+sSDPuSCs3YtwK
         m+hFy/Mwy0fER31G62pZ2Nmz5ul/N5AjQ7SxRl5dEp2qjM9WSQ8mD1dV/j2hGFY3GXjc
         RK/NxmB+rj5jukWgcE64hHEdKwe2+2MTRDpORduePcfraMhWkN5upQhVexH3tV+w4CqW
         4kBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i432OUSr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v6sor6256908ply.40.2020.03.12.12.42.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i432OUSr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/zHbZh0dod5oMK8gTomTJjtjrWcaZXLW0KPv8APWrNg=;
        b=i432OUSrFBi2EBZjUAVO190uA98WGRNaZI+mm7o//2CETnP4LAaVDpXgFBLgQ/ebkl
         K9vQYas1Jy/E0geOrwJOJFT2R7kUfQ3JBwMiOTDNJfLnlHTx0ogblk+yN2WLxyYfy696
         wX42rXSfpPho9sP7gHY39lWYiWwzW6XmqkdZqcZPT+EENqiivzv9+OPcz2lzRxmeo9MQ
         T8KA4BLnkgAqS1Fs1wMIc8OkXXOgLdd7rota1k822cnC/MmzHx0KG0uyapUU65Kb6OcN
         YVk1QdIttn87tdO9f2UGwgH8qFtHg0Krb/8eHeqiCFf2JfHOlT3HXXXtdCnu4kgWXIzN
         yGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/zHbZh0dod5oMK8gTomTJjtjrWcaZXLW0KPv8APWrNg=;
        b=LSyPpLYMWFjcbqUUkXc+IvhNZkenoSk9u7tgGTHCXqdM3n1gzpXxIqt0aiU/rfdb9z
         ZSpWzsOuo1AWbjlTHhO0zA4dBUnIgnuHplz/U2oHpchmWSWpVrURGs6n8dYd9xKJkReE
         AUtquc7icBm/XuFUPNZRM7q+zp2bABZAe7FSJ4kr+4xpZTtH2Z3LRlZrYybXl+8lMax/
         aiLd8nmWurjBojoCX3kAuDwnSJWBOu04SBXNBDEbPjmpaqdx5B65g6iLCkZCuFTyMFHS
         SNCRxwyQRt07bpv1T8bXHbBkKCLD7ZrOH+CLfH/RYpTaTy/f+y0YLtgMdzawglNq494i
         3FHg==
X-Gm-Message-State: ANhLgQ3jnoc8aWX/WoipDLYnsP5Br1Rz+h/UV/dWZB4DQi5kWXXG3Rur
	6xPvGzfSSYGazqv6xJTKTzk3biTO
X-Google-Smtp-Source: ADFU+vuWuZgiJ1wM8xKXS6la8kjMriZV7Tn9uSF63NjGWvV89wit8agYMmmVDnsq2VSylcSv4WpCTw==
X-Received: by 2002:a17:902:694c:: with SMTP id k12mr9425175plt.329.1584042141496;
        Thu, 12 Mar 2020 12:42:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 00/42] target/arm: Implement ARMv8.5-MemTag, system mode
Date: Thu, 12 Mar 2020 12:41:37 -0700
Message-Id: <20200312194219.24406-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4BR01cf9xk1f

I've done quite a lot of reorg since v5, so much so that I've dropped
most of the review tags that had been given.

There are a couple of major improvements to note:

* The effective ATA bit is in hflags, noting whether access to the
  allocation tags is enabled by the OS.  This is moderately expensive
  to compute, so it's better to hold on to that.  This allows trivial
  inlining of some of the operations.

* Updates for SVE, and thus

Based-on: <20200311064420.30606-1-richard.henderson@linaro.org>
("target/arm: sve load/store improvements")

* Architecture updates, to F.a released this month.

* There are now real patches for the kernel:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/mte-v2

  Booting that and running my user-mode tests showed up a few bugs.


r~


Richard Henderson (42):
  target/arm: Add isar tests for mte
  target/arm: Improve masking of SCR RES0 bits
  target/arm: Add support for MTE to SCTLR_ELx
  target/arm: Add support for MTE to HCR_EL2 and SCR_EL3
  target/arm: Rename DISAS_UPDATE to DISAS_UPDATE_EXIT
  target/arm: Add DISAS_UPDATE_NOCHAIN
  target/arm: Add MTE system registers
  target/arm: Add MTE bits to tb_flags
  target/arm: Implement the IRG instruction
  target/arm: Implement the ADDG, SUBG instructions
  target/arm: Implement the GMI instruction
  target/arm: Implement the SUBP instruction
  target/arm: Define arm_cpu_do_unaligned_access for user-only
  target/arm: Add helper_probe_access
  target/arm: Implement LDG, STG, ST2G instructions
  target/arm: Implement the STGP instruction
  target/arm: Restrict the values of DCZID.BS under TCG
  target/arm: Simplify DC_ZVA
  target/arm: Implement the LDGM, STGM, STZGM instructions
  target/arm: Implement the access tag cache flushes
  target/arm: Move regime_el to internals.h
  target/arm: Move regime_tcr to internals.h
  target/arm: Add gen_mte_check1
  target/arm: Add gen_mte_checkN
  target/arm: Implement helper_mte_check1
  target/arm: Implement helper_mte_checkN
  target/arm: Add helper_mte_check_zva
  target/arm: Use mte_checkN for sve unpredicated loads
  target/arm: Use mte_checkN for sve unpredicated stores
  target/arm: Use mte_check1 for sve LD1R
  target/arm: Add mte helpers for sve scalar + int loads
  target/arm: Add mte helpers for sve scalar + int stores
  target/arm: Add mte helpers for sve scalar + int ff/nf loads
  target/arm: Handle TBI for sve scalar + int memory ops
  target/arm: Add mte helpers for sve scatter/gather memory ops
  target/arm: Complete TBI clearing for user-only for SVE
  target/arm: Implement data cache set allocation tags
  target/arm: Set PSTATE.TCO on exception entry
  target/arm: Enable MTE
  target/arm: Cache the Tagged bit for a page in MemTxAttrs
  target/arm: Create tagged ram when MTE is enabled
  target/arm: Add allocation tag storage for system mode

 target/arm/cpu.h               |   36 +-
 target/arm/helper-a64.h        |   16 +
 target/arm/helper-sve.h        |  491 +++++++++++
 target/arm/helper.h            |    2 +
 target/arm/internals.h         |  145 ++++
 target/arm/translate-a64.h     |    5 +
 target/arm/translate.h         |   23 +-
 hw/arm/virt.c                  |   52 ++
 linux-user/aarch64/cpu_loop.c  |    7 +
 linux-user/arm/cpu_loop.c      |    7 +
 target/arm/cpu.c               |   79 +-
 target/arm/cpu64.c             |    1 +
 target/arm/helper-a64.c        |   94 +--
 target/arm/helper.c            |  350 ++++++--
 target/arm/mte_helper.c        |  894 ++++++++++++++++++++
 target/arm/op_helper.c         |   16 +
 target/arm/sve_helper.c        |  750 ++++++++++++++---
 target/arm/tlb_helper.c        |   41 +-
 target/arm/translate-a64.c     |  607 ++++++++++++--
 target/arm/translate-sve.c     | 1425 ++++++++++++++++++++------------
 target/arm/translate-vfp.inc.c |    2 +-
 target/arm/translate.c         |   16 +-
 target/arm/Makefile.objs       |    1 +
 23 files changed, 4204 insertions(+), 856 deletions(-)
 create mode 100644 target/arm/mte_helper.c

-- 
2.20.1
