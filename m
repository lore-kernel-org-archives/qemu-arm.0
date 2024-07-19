Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp179810njc;
        Thu, 18 Jul 2024 18:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMANh4gOla5Bnk08XLuAijTs2uNEVcVtRR91SeecO3tfjjHrXhb96pFm6oZpXQ52pCgUeG75kbM5LdO3fKOdsdhC2jzaE4
X-Google-Smtp-Source: AGHT+IFJKrWmKNuURf0T7S0ynC1tTFaatnM5U9F5oUP5/Khzcqfe2WvvOAjQUgS3RHIFxQJpEX9Z
X-Received: by 2002:a05:622a:1a23:b0:447:def0:c766 with SMTP id d75a77b69052e-44f96a63dc2mr27624921cf.51.1721351283762;
        Thu, 18 Jul 2024 18:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351283; cv=none;
        d=google.com; s=arc-20160816;
        b=TmuxB0TGzlDKeMDWmqSmZDKaFjzo8fwVIUOscYu90RvIfvO3jkJvZRNptzOSSfoxgV
         yt/VRUS6x7eKX/NHbo6KybGnHrgApT1diLqsMrSLGHpBkJSAyUNd6hsnoOwX1Hb356gl
         NQoCB5Ijk6QX2CknCaVXfdz+MS2RVkp+21RbPBACa35xZqBLvfP9Gqs2RkktzRHZFTOs
         n0LI3v0ZKNZWemRAAg0Pw0IUZc9w7m3dBP03ujn74cTmPkg2EiVwrJTc5ju8MTdcf58z
         9Mzf4Z4B3J81t2H3poSQ4MBEPxCAbJfRxOlYltJr6WbFlE/ljion/fIEbOLVIN1YMn9M
         NVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LPcrr2bAZZOdbv+u70EpAggSdOrt6lQpVBPjPm6dBzA=;
        fh=PMD1cJf9IbYeK/VmAJgusCYc7DxmYIcIgC7fGquy+wg=;
        b=x0yovRcnEhbQyenSTCo6PxLlDc/F71quWP3Gu1useVNaNVk5PEKK5M04C+/MgH+tAS
         RITacA0UUUO0mPJto+Xho3hel3GU0KLpAOjumkczQVHoYknrsC79MT3r/J9/VFbBS1ud
         VGM22BPmWGo2l7a4+tvdDgcxoN5TV6ZSuTfpXu+eixNv1bFoOvYHOfxAVd2lYwkb/SYT
         aauSCtYdcM1sAOtAox5gtFyxSXbIOfGa/XguM7O8q29sLp9rd9huhARNVxO/p4hEGpIA
         4m7XtbJe/SRNlhaI2kTUoZYkaWK5IuIC0ve70kpwmvrxjewkumSH4kZDoXQL8VlbP0Q4
         kuCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eP0MVxLd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ce070fdsi4365031cf.631.2024.07.18.18.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eP0MVxLd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUc5l-0002qF-Le; Thu, 18 Jul 2024 21:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5f-0002nX-Am
 for qemu-devel@nongnu.org; Thu, 18 Jul 2024 21:07:20 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5c-0000gc-A4
 for qemu-devel@nongnu.org; Thu, 18 Jul 2024 21:07:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1fc60c3ead4so11488665ad.0
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2024 18:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351234; x=1721956034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LPcrr2bAZZOdbv+u70EpAggSdOrt6lQpVBPjPm6dBzA=;
 b=eP0MVxLdvyJv3dOlhK8KwTdocUBGU8jQaY4FAZBKx5KwuINQyPpbYcH6CBPnHc+eUE
 pmoTY5P3Np9kmwOJ4yaDQFPRARzv2C6hgCZUW5E8I5c29d0ZPJdf/nsRe7b7G6TAYDX/
 0SpEBUyKLYv6EuEpO13WK6SxnUUzR3fSiwVdRA4/MSA0IV9vFTlkqwOqb3KAhA+Yxscm
 fmGo9QlIwd5sqLAnK7WlGtAVuCtpStX+6NAN8yj5xWkINWDbFFE9xIRWXRfWRZXbQcJR
 RCQFExdcv8o7qGPVC4dLGPWaw9QS0vVSaJMUiLvsS2Dtuyj2VfK99kK0JFm82CCQzuio
 6Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351234; x=1721956034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPcrr2bAZZOdbv+u70EpAggSdOrt6lQpVBPjPm6dBzA=;
 b=lw5ELJ09hkLjdy2fLyXkNyVYmtDImQ/gkUOHTBcJ0JKtmRTOjRakON9fF6Us2AspwH
 lOka9kSuqCcJ0Cdo28PEZtCmk8603PmFP2m5RxjJONgbXUOcjfB9rHZXOlrJ1A3SI4T5
 E5l45Um7fR5cs1HR26GGWmcguiz1g2WtL5KBnr/e/3K8QIQI8u6JGWAS9buqxIT9hj49
 MJQLDU7/yYkn+jdDsyy2XlL9vzrWX2EfEHFRCjykMeIYpyr7fRhoKbC602/AecoSeUSN
 eXCZIkLBNKN8pJc+5rBaJZO9lD06pevJ6ZoPx4MBZU+bkCyklOO6f1yDXjQO8XWVdXmV
 eSJA==
X-Gm-Message-State: AOJu0YyfKQxkD7aU95DdWVV2PpXcwUtqVQ9lFEdZ1Zoaex2sfXs+6x9b
 aI++8Un1GeoLsSU7ZHVFDlKwkvUXXA9qkWPbmJR/flhHCGhzwAp2EGk4/+h13z8dqQpbz2EKmlB
 0OG+OoQ==
X-Received: by 2002:a17:902:da8e:b0:1fc:58e2:82c8 with SMTP id
 d9443c01a7336-1fc58e296b9mr51652145ad.49.1721351234233; 
 Thu, 18 Jul 2024 18:07:14 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 00/12] Fixes for user-only munmap races
Date: Fri, 19 Jul 2024 11:06:55 +1000
Message-ID: <20240719010707.1319675-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y64xd/thMDhh

Changes for v3:
  * Fix patch 3 (sve) vs goto do_fault (pmm)
  * Fix patch 12 (rvv) vs watchpoints and goto ProbeSuccess (max chou).
  * Apply r-b.

r~

BALATON Zoltan (1):
  target/ppc/mem_helper.c: Remove a conditional from dcbz_common()

Richard Henderson (11):
  accel/tcg: Move {set,clear}_helper_retaddr to cpu_ldst.h
  target/arm: Use set/clear_helper_retaddr in helper-a64.c
  target/arm: Use set/clear_helper_retaddr in SVE and SME helpers
  target/ppc: Hoist dcbz_size out of dcbz_common
  target/ppc: Split out helper_dbczl for 970
  target/ppc: Merge helper_{dcbz,dcbzep}
  target/ppc: Improve helper_dcbz for user-only
  target/s390x: Use user_or_likely in do_access_memset
  target/s390x: Use user_or_likely in access_memmove
  target/s390x: Use set/clear_helper_retaddr in mem_helper.c
  target/riscv: Simplify probing in vext_ldff

 accel/tcg/user-retaddr.h      |  28 ---------
 include/exec/cpu_ldst.h       |  34 +++++++++++
 target/ppc/helper.h           |   6 +-
 accel/tcg/cpu-exec.c          |   3 -
 accel/tcg/user-exec.c         |   1 -
 target/arm/tcg/helper-a64.c   |  14 ++++-
 target/arm/tcg/sme_helper.c   |  16 ++++++
 target/arm/tcg/sve_helper.c   |  42 +++++++++++---
 target/ppc/mem_helper.c       |  52 +++++++++--------
 target/ppc/translate.c        |  24 ++++----
 target/riscv/vector_helper.c  |  31 +++++-----
 target/s390x/tcg/mem_helper.c | 103 +++++++++++++++++++++-------------
 12 files changed, 224 insertions(+), 130 deletions(-)
 delete mode 100644 accel/tcg/user-retaddr.h

-- 
2.43.0

