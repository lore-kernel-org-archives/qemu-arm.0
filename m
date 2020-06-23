Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4344102lfm;
        Tue, 23 Jun 2020 12:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwes8ZP49adZ0r10WfyZ7z8b/JPI0V/SNmwHTGDy/yGtIsiMjM9se/0/1X9QtuIXQNlLHMV
X-Received: by 2002:a25:2515:: with SMTP id l21mr41225067ybl.177.1592941354335;
        Tue, 23 Jun 2020 12:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941354; cv=none;
        d=google.com; s=arc-20160816;
        b=bxnkUlsvCZZDjzApj7CT81RDFp4GJL5nh9Ncb7054jyFJWfI+v3kQMg1EZRB8DE497
         eo8AMPkpM8T5DLn1uHBcuUkmTxvLw3GmP6T2rjsu0mDc0IJo4nhtNJ2eKPPI/2RmIuqr
         xJUtRAJ9lFMGUYsM4LVHmvhitBZo/Y+N0qhYLAC4gWubxK3cFN8mwK1omJEoLKeBhBWP
         /2CyfAPNNtz8u3c+1rDgs/m7ZAHicLM9vxonfr+y0n3Z9FLEZDafM0iX4Jg+mRBMqLE2
         XXkTVuYHhQIavjVxNizHS9+yLRoSzsh5Z3ePuWitXCB0uoxDce85RmzUD+eWaM3TtjYT
         oZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zif4Iu0ibSPdlekVkL/Ps4sAAAkBV8vgNAczaYynkk8=;
        b=DD6+XOcxg1bNypYdDdwNWpaPaphyeCeWk09gnW2y32ECxu9dqoPtWXD+UOB8awK9gb
         y2m5dWaDi46CenW2gqjWziSS9OHaHWe/1PvLH8BXW/z/65bq7SmWdKDluKdL3I3KxoCn
         aRaqF2WFtjW3q2i4Aggkar9QkBmQ7kvDg3xsvZ8/78wsHjN7c2V1vu3PjBHU7evPrrjq
         2wSXe/Lmt7G/XW4nXt0tcyXdSndZ/tvRZ+UEj2zuekWn5erdY2ujWqxm8piiTcYojZOP
         VNwoGbZCZWR2oi2e4BGt/cLMSV6ohoIOW64wXoWGPm2ApozjvLXlRa+evfyKInSREY2N
         LzZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=teivBIlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d137si18063720ybc.309.2020.06.23.12.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=teivBIlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnooT-00059h-KO
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojd-00047g-6J
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojb-0005kJ-DV
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:32 -0400
Received: by mail-pj1-x1030.google.com with SMTP id u14so1912786pjj.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zif4Iu0ibSPdlekVkL/Ps4sAAAkBV8vgNAczaYynkk8=;
 b=teivBIlz0RsXzXj80Y0/wW7EzdRs6OSB64/eSNCDDnuCk5DLNxtwRMSweaQd6DpPMs
 XL+ZiBTRYBmK0b+vc2rKM1cURUFWgIvFf+ImVLTk/3M4ja8lfwwbnmjOoUc62Qv8gzOX
 lqg3dJJetNDmby6pObea4rHDUIm7dHptPp3HSLRpiMVKKKbeuKGgaBk2MzUQtrs6YXa+
 K7estKxwANGBVjsx+wAOqQgyKh1AyL+m7BTBi88XDLFS6+dzhMg5nBRiUGHkmJeOvxXq
 cCeCRH/2Sia6z15L03TGM0bkxRfZ6r1urrHxaTacKpCeFOlAnnApurereWEq/mLZDRVh
 npRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zif4Iu0ibSPdlekVkL/Ps4sAAAkBV8vgNAczaYynkk8=;
 b=XsvS1wSfiu6bhWfBwGoN2WiIZ5tF01ay7yW2yr9mDnxwTuXlVcPRQDkfWNjy0cdVrh
 o9i4X2HO12nfEWgxc0S/i1W+ppmLcsgwvCXiVQk94wAT0mHGb6nsQlPZhgzQ9hJRZJVT
 dVVN2fs39bJvAmSEzfcYN8hDBgAdzGn/ArDFoWKHj9hCN3bhzYnYHNK3wsxThUAYVdgd
 od3rjpqL2W8xwPCwTF8KGEJQrabTTyETpZt4ZBB8mH7PLFsUiwlOuw9hl6niswkDL91l
 2uagwa+AYjw2n57D//pIEWUmQ0sE9inGut8qvsw3VJZ2CPcSws40gsWEdlV+wyfZDq2K
 rjcg==
X-Gm-Message-State: AOAM533CjJnUIGApX8JW2fdWPdlzxUFnfxbz+fsuLyBFAe0B395z5IAk
 cKNyq2tM92azPPcQrzqNSjLVxE3aQFk=
X-Received: by 2002:a17:902:b107:: with SMTP id
 q7mr25733514plr.266.1592941050095; 
 Tue, 23 Jun 2020 12:37:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 21/45] target/arm: Move regime_el to internals.h
Date: Tue, 23 Jun 2020 12:36:34 -0700
Message-Id: <20200623193658.623279-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IhytvKATg4Kt

We will shortly need this in mte_helper.c as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/helper.c    | 36 ------------------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5c69d4e5a5..c36fcb151b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -913,6 +913,42 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the exception level which controls this address translation regime */
+static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_E2:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    case ARMMMUIdx_SE10_0:
+        return arm_el_is_aa64(env, 3) ? 1 : 3;
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c31d03da..d14313de66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9793,42 +9793,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the exception level which controls this address translation regime */
-static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_E2:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    case ARMMMUIdx_SE10_0:
-        return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return 1;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-- 
2.25.1

