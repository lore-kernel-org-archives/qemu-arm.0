Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E66CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:53:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Ge-00056i-U9; Fri, 29 May 2026 15:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GQ-0004wn-T8
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:04 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GM-0005Wl-GW
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:00 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7e690c213e3so1077066a34.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084376; x=1780689176; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ok88gh+OkxGmNS5ksukav/rTkZmdr1XXBj/dobKaKrs=;
 b=CSYBf7N55xy/nkIfNCU7QoMjRS3AZT/TTJ9uHrsjxH++OY9R6v3oro5Fkf7ruFpXFm
 jJb/PiVtBNPHbOi6TA/R14WMKhy6DNNjw9zC+cgfb1IbA09iT1UoytOCnTooCXyPY04u
 ASmAYETISC+Bvq4eS5dETMVvjeXJz0r0LBD3d1yFE585IefScGSwAxvYLGoaJcKBK0Y6
 1ibh8/a4Pcrgg8pkKPfxruS+H5bw8SYubllzWak9N1IZqVv7dT6jx+uTjlfJVLFxiIRg
 +hC2U6/hWbOeFQKnJjAsT3nXPdngAYXPrgs/T5q9yAYlUJYREC3cdns+S9LNludswrU4
 yogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084376; x=1780689176;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ok88gh+OkxGmNS5ksukav/rTkZmdr1XXBj/dobKaKrs=;
 b=hEObTPOg29nkieT0BWr0GRUR6ecX3cCAGhVQDDCoLB/gpUioFq1hkWYvTuYoqH3Y3Z
 VEyrokF4dcF3kiwGZ4K1PIcz+u9X9BD7YAdqVcvEOyo3J5Oy2pHZYbg2s/LjXj2dh6Yc
 SGAKluLmGDMfyJVEhiVEsMaIgHz6GMbpQxhDDUMEXm2w8IPbEmplXBhYH6zsqRhEjyOE
 mwB1cyWkEiiem+FVvH3bDpch/Z3RHn8kBpE9YWgTxMWHFZvyMvgkpg42sf6P1CkSsJiY
 VowqDrJbHCWHjg4TujBFDUL+42gvnA7VL9CGgRQ6s/mITeq1PPPuWF6gqehxfm8Jc/Zh
 b0FA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/htFuBKbGjb7SJV7dXcv1CxVcHymjxiy2hLXgrB3076DCukfZUtZcDz/rigmj+/2a2ZKNFG1qrZg==@nongnu.org
X-Gm-Message-State: AOJu0Yxp7vg8zI/zVHh3lF0ceO5xnZvLyRueZ83911sfwdrWyf8hyiGS
 TjGFQW8VwnGvSwNWsHndTCTDK1MglPTaX3GPHV3mrTh6EkU2h4saXQ2N
X-Gm-Gg: Acq92OGHIdq00gEd/UKdLYaP+coWFj+teKkxzRvvaPtfJaRfYGJj5emt6ZaXUA2WK1n
 lqaYZaHzeEGl40CEqdYHyFHLNOTXFm6DdrrEzI50R6NWaXIpVUj/tkQ82mdSB0LgSAnKaaE2gA9
 BT6hvymeahdnW0K1Fth/4cJYHX7K5iI4Vx1Sg4L9pLS8f5nr3FcsjN898JhlTHdy4Y+p6UXcT70
 JdR3Dpzh+YSBldQ9g3nbj0juZIj21I5vxCR3B9evX+JpdxL5lKv/it9+Hjzm3Lu4LHdbM0PL3RM
 ls6zxPjN/IjITm43wDrOimsYoS8xGB84a6IulC01U6C0NRorJKdhYnBfYZSRR9cCUcjj3zcNecw
 O15LkoqfTz7b5nHxt9Zb2QgRxMK6ccFEC0k+LfKSbwic3+wLTz2LnDRyNV9Es2eZRQPKgCv/8cd
 2oKG2t7vbALMJ0cyxssGPI63s9DgRhkTiRmZv8zDYHlXo=
X-Received: by 2002:a05:6820:2219:b0:69d:9547:c963 with SMTP id
 006d021491bc7-69e102e3a3fmr448179eaf.27.1780084375960; 
 Fri, 29 May 2026 12:52:55 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:52:54 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Subject: [PATCH v7 00/15] target/arm: add support for MTE4
Date: Fri, 29 May 2026 12:52:40 -0700
Message-Id: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQwW7DIAwG4FepOI8JDJhkp73HtINLTIu0NFMSo
 VZV3n2k2lSSHQ3+ftm+i4nHxJN4O9zFyDlNabiUwr8cRDjT5cQydaUWoMBprVoZmWbZz2wleqs
 Iywc3RpT+75Fjuj6yPj5LfU7TPIy3R3TW6+tvitZVStZSSQ8cXYjgMbbvp57S12sYerGmZKgl1
 hKKbMlrgKOP5HEvzZ9EpZWrpSmyQVJd23IEtntpn9Jsds62yI4oKuNd2b3bS/eUTtlauiLBAKF
 tGE34Ny1WcnshXKd1zoegjTbHzYWWZfkBKzNk8MQBAAA=
X-Change-ID: 20251109-feat-mte4-6740a6202e83
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=6006;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=OFM4fpr0XFE0STalNDwszH1i66X+hsEEnHenLXRMqkQ=;
 b=NAz8ohM56XYBS4eyl00F0Vf3O0GIAMAJzo5ql+LCCk+ZKPeAlLsZ3d/ad3SckWRQkutN/skWX
 hkpAaVwLuCDB2uojleKkvjYzmDShf3Q35dMHGZ8wdBgPZzWN3FMNyBl
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=brookmangabriel@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This series implements ARM's Enhanced Memory Tagging Extension
(MTE4). MTE4 implies the presence of several subfeatures:
FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR, FEAT_MTE_STORE_ONLY,
FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM, none of which are
currently implemented in QEMU. This patch implements all five.

Testing:
  - Included for FAR and STORE_ONLY.
  - The MTE_CANONICAL/NAT test from v2, modified so MTE_CANONICAL is
    enabled in user mode (removed from tree in v3).
  - A bare-metal testsuite that sets up page tables for S1 and S2
    translation, to test the Tagged NoTagAccess fault.
  - The bare-metal testsuite also was used to test LDGM and similar
    instructions not permitted in user-mode.
  - The bare-metal testsuite also was used to test the mtx related
    patches.

Thanks,
Gabriel Brookman

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3116
Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
Changes in v7:
- initialized "tagged" in combine_cacheattrs (MTEPERM), per Peter
- alphabetized MTE4 features on docs, per Richard
- moved comment in docs, per Richard
- rebased onto master, incrementing bits in TBFLAGS since FPMR_EL
- Link to v6: https://lore.kernel.org/qemu-devel/20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com

Changes in v6:
- Moved certain functions between patches (Richard)
- Added G_NORETURN to canonical_tag_write_fail
- Updated ldg and bounds check functions to Richard's versions, tested
  these
- Link to v5: https://lore.kernel.org/qemu-devel/20260504-feat-mte4-v5-0-232a648e63c6@gmail.com

Changes in v5:
- MTX check feature split into three commits as per Richard's suggestion
- MTX passed down to instruction helpers in a new argument
- allocation_tag_mem_probe checks for probe in MTEPERM case
- tbi helper combined into tbi_or_mtx_helper
- MTX checks added to sme and sve functions
- bug with type conversion in LDGM helper fixed
- fixed multi-page tag-check bug and multi-page ST2G bug
- removed erroneous changes to _stub functions
- reorganized PAuth & MTX interactions to make them more readable
- Link to v4: https://lore.kernel.org/qemu-devel/20260309-feat-mte4-v4-0-daaf0375620d@gmail.com

Changes in v4:
- MTX now interacts with PAuth.
- Canonical tag checking only takes place in canonically tagged regions
- MTX bits enable tag checking
- MTX bits are placed in MTEDESC for access in mte_check helper
- Separate feature bits are used to delineate each feature
- PRCTL functions renamed and refactored as per Richard's suggestion
- Link to v3: https://lore.kernel.org/qemu-devel/20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com

Changes in v3:
- Added prctl for MTE_STORE_ONLY to linux-user
- mte_check is no longer generated on read when STORE_ONLY enabled
- Implemented LDGM instruction
- Removed "long" datatype as per Richard's suggestion
- Implemented masking for VA range checks when MTX bit enabled
- Implemented MTE_PERM, with NoTagAccess attribute
- Removed user-mode test for MTE_CANONICAL, since can't enable in
  user-mode.
- Removed TBI from mte_check generation logic
- Link to v2: https://lore.kernel.org/qemu-devel/20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com

Changes in v2:
- Added tests for STORE_ONLY.
- Refined commit messages.
- Added FEAT_MTE_CANONICAL_TAGS and FEAT_MTE_NO_ADDRESS_TAGS + tests.
- fixed TCSO bit macro names.
- Link to v1: https://lore.kernel.org/qemu-devel/20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com

To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Helge Deller <deller@gmx.de>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

---
Gabriel Brookman (15):
      target/arm: implement MTE_PERM
      target/arm: add TCSO bitmasks to SCTLR
      target/arm: mte_check unemitted on STORE_ONLY load
      linux-user: add MTE_STORE_ONLY to prctl
      target/arm: emit tag check when MTX without TBI
      target/arm: add MTX to MTEDESC and DisasContext
      target/arm: add canonical tag check helper
      target/arm: add canonical MTE check logic
      target/arm: load on canonical tag loads ext bits
      target/arm: fault on tag store to canonical tag
      target/arm: skip tag bit bounds check if MTX is on
      target/arm: tag is not a part of PAuth with MTX
      docs: add MTE4 features to docs
      tests/tcg: add test for MTE FAR
      tests/tcg: add test for MTE_STORE_ONLY

 docs/system/arm/emulation.rst        |   5 ++
 linux-user/aarch64/mte_user_helper.c |  11 ++-
 linux-user/aarch64/mte_user_helper.h |  14 ++--
 linux-user/aarch64/target_prctl.h    |   6 +-
 target/arm/cpu-features.h            |  15 ++++
 target/arm/cpu.h                     |   5 ++
 target/arm/gdbstub64.c               |   2 +-
 target/arm/helper.c                  |  36 +++++++--
 target/arm/internals.h               |  40 ++++++++--
 target/arm/ptw.c                     |  60 ++++++++++++--
 target/arm/tcg/cpu64.c               |   5 ++
 target/arm/tcg/helper-a64-defs.h     |  16 ++--
 target/arm/tcg/helper-a64.c          |   7 +-
 target/arm/tcg/hflags.c              |  25 +++++-
 target/arm/tcg/mte_helper.c          | 146 +++++++++++++++++++++++++++++------
 target/arm/tcg/pauth_helper.c        |  18 ++++-
 target/arm/tcg/sme_helper.c          |   4 +-
 target/arm/tcg/sve_helper.c          |   6 +-
 target/arm/tcg/translate-a64.c       |  45 +++++++----
 target/arm/tcg/translate.h           |   3 +
 tests/tcg/aarch64/Makefile.target    |   2 +-
 tests/tcg/aarch64/mte-10.c           |  49 ++++++++++++
 tests/tcg/aarch64/mte-9.c            |  48 ++++++++++++
 tests/tcg/aarch64/mte.h              |   7 +-
 24 files changed, 484 insertions(+), 91 deletions(-)
---
base-commit: 2db91528542672cf0db78b3f2cc0e22b36302b38
change-id: 20251109-feat-mte4-6740a6202e83

Best regards,
--  
Gabriel Brookman <brookmangabriel@gmail.com>


