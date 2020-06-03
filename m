Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp30637lfc;
        Tue, 2 Jun 2020 18:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSADMr3+ewaIjL5Xl9K8awQOgz84J/cKsWwz5HRGA9pSSSgm6GOGnx1fP5x3VeYCpenanJ
X-Received: by 2002:a5b:78b:: with SMTP id b11mr19632284ybq.42.1591146813447;
        Tue, 02 Jun 2020 18:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591146813; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUMTOE3jy0DfV4yfgGTZzudXFU6v6y3mseyI1utkDJMOVrI6av71qXFgs2HYmEniYh
         MAor7+hSRlqBGcfSS5zRiJoOu8CJ5wWE9Ll6nB+65szt+nvrQnNeGSIA5kY+3ttEtrFd
         VdLI56AmZ9CPnOTpRfpg5b1u2vIToAd+LfQNrx7GoeLGTxEPbN0i5zaH+YEq2LyXpq+6
         Qx1AVrENUpRkOj/hN4L6rvkH69+MNtJD3Feqv20E8LKQtjYAQ3TTMW//3RfVBrHbkWcb
         fiDp8mqkEj8RTXQnquHmCtbJ0JgLTlJl1a0foo3i0Y9f7jdV+9YR4NWhf4P9Sb8i7nX0
         Yh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PzrD96dOtD3NK1lLspXRiLRSKjspuQFil7VkeAR8vEY=;
        b=DP5W53YvQYj8Ndype1AnIWeNsNn9QrSunQkNVAiw1G8Rp/aml+tmoE9QlOE9X5Psbc
         eb11s06VaPkU/w4PWjThJdDuPUlTH5EiC8XTSteMvivdKPNj2+R6n7sQarCeHsHUrAnT
         amky66O6GSB0/yQjNEc01KziDfe7Xz1umt3epMZrrR/ehf+cLdUGOtv+6QVmMr9jjpFl
         NVV5VqEn49uw6sirwWZyjwR+qtZ/1epajYt+v+AUAoxQDkX23qFLcyjgPxQjBZqqmhX3
         57/o7jIV4VlBmkYM2UlZ5r3o12VZPFhOoJfAsEhrlZ9l/5RIWMwvQouS4FVhjWbxL52c
         nVcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LpwZ1wHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si279607ybf.393.2020.06.02.18.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LpwZ1wHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgHyG-0003KP-JV
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy6-0003HC-EQ
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:22 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy4-0003Tr-Lu
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:21 -0400
Received: by mail-pf1-x441.google.com with SMTP id 64so409970pfg.8
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzrD96dOtD3NK1lLspXRiLRSKjspuQFil7VkeAR8vEY=;
 b=LpwZ1wHmMMyHeQuYGskrwbuGrTgDRCSUlwVE1NrYcEo6QGFE9bLw3ALS3Wm70SVVbD
 hLwTQcqTWMd7xM4Atk5Rgs4JRUof/iLLhNJOvTfMo7r2WzOYah+iJS6ABXcOaPnsCvK8
 RjlPhFqKnn6HJN+Zi6GlLHGlo5MuFUGYV5iLzG0mCIGNd9eR0MPvFDGIa6rCGL8qvbY3
 slye8rDOup3CJtyvY+7z1Xqb72oTC0XqHWsXQHm//e+m1JMBmWjEOQ3fCYX9T4l2hW22
 KTkEO54PLGFv3Z7iUPVHB3tgxuAbiBU67hzVK1lzaNRvpL5mPgSXwrwb8nUcpnAeVrZ2
 kpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzrD96dOtD3NK1lLspXRiLRSKjspuQFil7VkeAR8vEY=;
 b=VqtyxqeELgqMmwmMJ7LSBKF6Puy7ZlJp6u6UIHCO4eJ67KMH6uAVckfqKP7Iq0inA2
 Zy55VKBjzSY7UG86HSsuNdtptAmrjojDlceeSIi2jAo0kU4YAvUwKO1atFEJowiDMYNE
 aRO6gzOL3jQV9PaLo2Okpz1rqd7qyA1FOyJRnc9E6eFa5v3EtnyIFZbr9Jpi/pv/wcYQ
 qWXFGhBNuqvsGcOXpKGbhjXlUuDp/aCsKrlyrcO3YfIvoCvm+93SKNJcz1I+5sakMhlJ
 741Vv+WrzEwIstCWZsfe4t3szb6xcw1rhDkZk2rQId8JPGGWd+BDcDq9Vh8Jm7LNX0ky
 aEpg==
X-Gm-Message-State: AOAM5327aMxSlJOI65gyI3KfmSGxUrlPsR4cthLe8xm9anBmfw0JG6dg
 VLPXVi2x26DlBxK5ebJ4aVYdWw==
X-Received: by 2002:a17:90b:23cb:: with SMTP id
 md11mr2383208pjb.108.1591146798833; 
 Tue, 02 Jun 2020 18:13:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/42] target/arm: Implement ARMv8.5-MemTag, system mode
Date: Tue,  2 Jun 2020 18:12:35 -0700
Message-Id: <20200603011317.473934-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BzSZX/NUQF9S

Version 6 was back in March:
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg03790.html

Version 7 is a rebase on master, which now contains all prereqs.
In addition, two bugs fixed, pointed out by users of the branch.

I've done light testing against

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=devel/mte-v4

I still have not implemented the arm,armv8.5-memtag OF property
expected by that branch, so I have been disabling it.


r~


diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b297a37c1b13..b5f18e63f8d1 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -155,6 +155,7 @@ s64 mte_ftr_filter
                return ID_AA64PFR1_MTE_NI;
        }
 
+#if 0
        /* check the DT "memory" nodes for MTE support */
        for_each_node_by_type(np, "memory") {
                memory_checked = true;
@@ -167,6 +168,7 @@ s64 mte_ftr_filter
                mte_capable = false;
                return ID_AA64PFR1_MTE_NI;
        }
+#endif
 
        return val;
 }


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
 target/arm/internals.h         |  148 ++++
 target/arm/translate-a64.h     |    5 +
 target/arm/translate.h         |   23 +-
 hw/arm/virt.c                  |   52 ++
 linux-user/aarch64/cpu_loop.c  |    7 +
 linux-user/arm/cpu_loop.c      |    7 +
 target/arm/cpu.c               |   77 +-
 target/arm/cpu64.c             |    1 +
 target/arm/helper-a64.c        |   94 +--
 target/arm/helper.c            |  350 ++++++--
 target/arm/mte_helper.c        |  897 ++++++++++++++++++++
 target/arm/op_helper.c         |   16 +
 target/arm/sve_helper.c        |  746 ++++++++++++++---
 target/arm/tlb_helper.c        |   41 +-
 target/arm/translate-a64.c     |  607 ++++++++++++--
 target/arm/translate-sve.c     | 1421 ++++++++++++++++++++------------
 target/arm/translate-vfp.inc.c |    2 +-
 target/arm/translate.c         |   16 +-
 target/arm/Makefile.objs       |    1 +
 23 files changed, 4206 insertions(+), 850 deletions(-)
 create mode 100644 target/arm/mte_helper.c

-- 
2.25.1

