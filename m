Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2923407lfq;
        Mon, 11 Jan 2021 11:10:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5+9aMS1X6lVUz9riYODTVIv4EM52kUVs9hT3L+og+pV00G5P6twwNm1BRoKn1rYz4eTBf
X-Received: by 2002:a25:dfc2:: with SMTP id w185mr2020864ybg.82.1610392204209;
        Mon, 11 Jan 2021 11:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392204; cv=none;
        d=google.com; s=arc-20160816;
        b=G7sT12LD2i/jUTaDi6qELrt+++doNh1Az6W9V+Y77OZI/ZJWZTTGFkhbrCv485sXxU
         vMWnhsATolmMKuY89Cxby1UI7t/x+shzvLm+p9w0Qbmn1eEGAKq0pSP6TH8jEt55r9BT
         iS/ZDDba/0GGZKMd/rfJZhtigqgLYr8TwgPiS+hVNJ7s+p0zIPdj6BzxAbXS7wGksLxQ
         jXEr/DxkVBStD9OTEhtGsvt1w9gixmO9gURsVsUiBiHxsEsNYw6ceynVRF67zjPlzoEF
         2crhZ8W/HqlN2DNtV7jKbKJjZC0COndq/J+pJT5kWkU7U9sTCIm/QHa4brO/A2iVIEVu
         LfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5o6p1C7v9u1rYVGcSBwWhWoi7b3iNDgzQwEbf6mExPY=;
        b=HPP5FQhUYdPD9mFZSiwiCJD27kH1SdUq7ZbyKgFkSRHIQvzMYgHArKq1fUVkJF+mJX
         rwazCJHXDkQUTw4BaUD8ZR0JEJPoDxmLNvM4bMMXXec6mI+YO9f1LF4+eoUTrZ2YkVzJ
         /UT1H5I8dpmnNG9Ts0DAHT5AOYx6Zxaf8mARGt5u/e6ZThjw3YKZR5BFOQ32Df0EE2KF
         KoSCtJiX/1L3W4aFjOc7tqPkoffZrxJJCpTk6YU8MJB1Km4aY8LHsZPZ2l11VddqAG9s
         9XBvdQaYDz7Mrc2eDcA5pfBSdYoWSMwn3z357fqKF14z78bpEGIjlSYyPEB2JLX4cu/+
         5kPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZkjMUq72;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p191si684107ybc.360.2021.01.11.11.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZkjMUq72;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2Zn-00057m-EG
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RQ-0005iJ-SC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:25 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RP-0006NU-AR
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:24 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x12so324243plr.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5o6p1C7v9u1rYVGcSBwWhWoi7b3iNDgzQwEbf6mExPY=;
 b=ZkjMUq72RsfIIrpUdML+UKLNv5NwNmGxQvCuyAlukFVQ8NpAJWOE5ckZe+teWrTRzn
 v3fWS6WnVvW/Ov0j9fa5bdD8gm62oCrytk5cKbG8z6pFX+EXgTtNhTDBYObfXYUr1y2H
 xEFKw79OYrPiCkeejIWm4dwOvP5plL5oE597qssLIl1squKzQFvobY29nVpgnEPLjZW1
 h2jjH+oBsef/73LyyxImZZvojQPceexHat+m3dSAWiOjlyxshAaAu7lZCKRe3uVONpEi
 mBei9Gbr6DIHID7Vkv+s/KpYsTQYCGLe3hliLw2NZSFmxtz2C8UTSN3lDVPSbU1WMv+Z
 IIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5o6p1C7v9u1rYVGcSBwWhWoi7b3iNDgzQwEbf6mExPY=;
 b=rrayfWHxCkYWksovJCZyqd/7Wi+EUDfAk9Hoy4JqVkK1lMFjXexSwJbxby7ozUBWIz
 GIzxcTDhmSOaYgCPU6Gt08BsfZfbTGrKYWZpER3rPOT0bXSkNPcIjE+OA1M9avNOqOOx
 k3h6/JsSitJeIPwkZZzEia7KnGUIabS5EVEdmrRGig/92Hcyn1wnXlgxudtwj9FOhc0v
 yUqPckGCrdzpyMiQMus6QudoP0A2F2AaiwwVDPQs1nKibBp6MNxdD9Try1h81GXW/Nl7
 2HYdZsT8hV2ml+HRtYP5d3eUfz6PL19r/qXEDDYUpC0v+Dk6MdkHn2MI/lqlwVnFeo0j
 ixUQ==
X-Gm-Message-State: AOAM531Bk74a9yfq+rBDIopHU+uOyOXQwdjgpAtxNvpV0XzM2jIg4PB3
 rFQxQ7lVtUywzw5z+J8RWG2bejAX/pFwMg==
X-Received: by 2002:a17:90a:658c:: with SMTP id
 k12mr283372pjj.31.1610391681404; 
 Mon, 11 Jan 2021 11:01:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/30] target/arm: Rename TBFLAG_ANY, PSTATE_SS
Date: Mon, 11 Jan 2021 09:00:46 -1000
Message-Id: <20210111190113.303726-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOBIdVn7ICnm

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So PSTATE_SS -> PSTATE__SS in the uses, and document it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 2 +-
 target/arm/helper.c        | 4 ++--
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index aa0bc6e281..89d69cbcd1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3266,7 +3266,7 @@ typedef ARMCPU ArchCPU;
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
 FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 29, 1)     /* Not cached. */
+FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
 FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
 /* Target EL if we take a floating-point-disabled exception */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0d70b37adc..7a7e4c3ad4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13094,11 +13094,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     0            x       Inactive (the TB flag for SS is always 0)
      *     1            0       Active-pending
      *     1            1       Active-not-pending
-     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
+     * SS_ACTIVE is set in hflags; PSTATE__SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
         (pstate_for_ss & PSTATE_SS)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
+        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE__SS, 1);
     }
 
     *pflags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ef63edfc68..80a3a5f5fb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14748,7 +14748,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
     dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 460476384c..67d509d29c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8872,7 +8872,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-- 
2.25.1

