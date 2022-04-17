Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1275802lfk;
        Sun, 17 Apr 2022 11:15:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP5CXR/pjgiduPvX5Ke+09Q98gWgyxWSlNv+qZwgqUeDnrgt1fPI9P2K3h+gdDI2qKBNnR
X-Received: by 2002:a05:620a:d50:b0:67e:e2b:a552 with SMTP id o16-20020a05620a0d5000b0067e0e2ba552mr4532953qkl.401.1650219309538;
        Sun, 17 Apr 2022 11:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219309; cv=none;
        d=google.com; s=arc-20160816;
        b=z85UlIS9M2GR+7DSzF1Is3LqHJBDhi3SgmiWldn44Qi+aaT7Htrv5UiJT+mV2qSQcb
         gCkEWJ3zC42eoAFnPvGm3oMFg22j0/dPIkjc1TRyCBm9o2wK+NjIvd5qmuiwcoicCppQ
         oT+YVjJusdNAqvPE5Aq8B6fws4ooa9w7GlySlXZzHV9GPR/d/HAaZYsLSFOgOnLpZD1/
         XOShzez7vlvqw/P+AWWy0H+H+m/AvCm4XUoC2Cot3KYOuM1PNrrqtR448KTISH0zqB1V
         wRNXfCZE1nM0CaEKfhvSGozSLv4xjHrqajXbUja0uJ591i24+egYAQan9DJ+y37igDOn
         aLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cNQuYWlWJo1H5z1dgSCS+oQAsg1LmaUsgazYdgc9pgo=;
        b=geVJ6/gNnRhB7nRbHGnzoEfEniXoZloK8iv0RFN1D6ASCaQn9yT1P7Xsok2YcQnZrR
         wggnBusX4RtbwmdW/myDP1gVdyqwz10y1LULVYmtBi1znL/oKPogmKFLczi6wN34perR
         I0Nfe3bTB0thRmT04UgxB0QiKEykV0lUHaGFtQabh1Ku1uzcxouNCCeWiqiypDh+vGg7
         b/CuMFZeyBPhD49AslZwtbYbGIf2Zr2djKnzU8s+kt79l0hA/YSrf14F+GYBDP4+rPbJ
         M9F/uetidue2orF+oIOjp9KLMQkQGBNjT5zsp5R/kIt4IXFPYSTBKU9thWnYUMho/0oT
         PWAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ym3Y2Isq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw14-20020a056214238e00b00443c58b5a9bsi2283890qvb.532.2022.04.17.11.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ym3Y2Isq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9QS-0002Yq-W6
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xI-0001Es-OS
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xE-0003OE-IC
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t4so14975035pgc.1
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNQuYWlWJo1H5z1dgSCS+oQAsg1LmaUsgazYdgc9pgo=;
 b=ym3Y2Isq+BXoC2A9zRIR6pePFMeZnt2Y7+I1qAuS3ZvonwR7P9BlWi84Y5W2XNzSpR
 LpvPOjMiAahrDGD1fqOOMl/a0P/pEgv1/g7sB2O2Q+U0AVgmbBRTEROPJ4SLStTw0UiR
 UDJcMIArWg4UjD8Gagg+1rzUto7+LWZdpURYxmesbMtCS+Uqq1khyUtNF5DvzVSO5Cmp
 gwsAB+P/+cVQPaPQnxN+xFLLCyrwklEkyu0QAeqm4RMmteRe/yJbORbp6vEAKvCo0J8n
 SqvVl4NmghpXqHWuZsjCeawVvU33rPsB+ufwwGhnNWmDuGsvhik4DXyZ6MdRMJ0dkKjb
 Wg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNQuYWlWJo1H5z1dgSCS+oQAsg1LmaUsgazYdgc9pgo=;
 b=kPYDCbN/RrOWv9GfkdcaJd28l+Hvt9oSxRdSWjkhPIv6iN0UAThPE4LYVaD7fm/rR6
 ZF4fFuhOBzfgXBvAIoUhTdMeixwy4kafUdJAbnoitwRPDKY5G95B5Cv5OGQgA7aDx/ul
 pR4gtroDCtG005b8rq1f4Shsw5++bCm+WtGS8+G0Dr/gwfDKCLVjjqG5DIxB5h3xlxnm
 d6OOuLhz8GB32Uk68YepRTcZtf6rmGTxHvYH43/RV3iE7gb1zAcjkZIZapi/+f6Iwo+T
 lsRGvQnef4SCMLcEutlc00TNivsEVl78DYQ3fQCkzaVqIDNVvorOTVb1IAorWSIGXzPB
 qA0A==
X-Gm-Message-State: AOAM530/zGJp8pbWwxYTClU0Ld+SuJ6DcWlr/O6DkUOYsxFbV06a3qyg
 6DicD9u91hpEA94ACSuX9jvjcucepDakEA==
X-Received: by 2002:a63:cf0c:0:b0:380:fb66:fa2a with SMTP id
 j12-20020a63cf0c000000b00380fb66fa2amr7099075pgg.273.1650217495172; 
 Sun, 17 Apr 2022 10:44:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/60] target/arm: Change cpreg access permissions to enum
Date: Sun, 17 Apr 2022 10:43:55 -0700
Message-Id: <20220417174426.711829-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSaewd60tvUy

Create a typedef as well, and use it in ARMCPRegInfo.
This won't be perfect for debugging, but it'll nicely
display the most common cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 44 +++++++++++++++++++++++---------------------
 target/arm/helper.c |  5 ++---
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 031e4b7ec8..2c991ab5df 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -156,31 +156,33 @@ enum {
  * described with these bits, then use a laxer set of restrictions, and
  * do the more restrictive/complex check inside a helper function.
  */
-#define PL3_R 0x80
-#define PL3_W 0x40
-#define PL2_R (0x20 | PL3_R)
-#define PL2_W (0x10 | PL3_W)
-#define PL1_R (0x08 | PL2_R)
-#define PL1_W (0x04 | PL2_W)
-#define PL0_R (0x02 | PL1_R)
-#define PL0_W (0x01 | PL1_W)
+typedef enum {
+    PL3_R = 0x80,
+    PL3_W = 0x40,
+    PL2_R = 0x20 | PL3_R,
+    PL2_W = 0x10 | PL3_W,
+    PL1_R = 0x08 | PL2_R,
+    PL1_W = 0x04 | PL2_W,
+    PL0_R = 0x02 | PL1_R,
+    PL0_W = 0x01 | PL1_W,
 
-/*
- * For user-mode some registers are accessible to EL0 via a kernel
- * trap-and-emulate ABI. In this case we define the read permissions
- * as actually being PL0_R. However some bits of any given register
- * may still be masked.
- */
+    /*
+     * For user-mode some registers are accessible to EL0 via a kernel
+     * trap-and-emulate ABI. In this case we define the read permissions
+     * as actually being PL0_R. However some bits of any given register
+     * may still be masked.
+     */
 #ifdef CONFIG_USER_ONLY
-#define PL0U_R PL0_R
+    PL0U_R = PL0_R,
 #else
-#define PL0U_R PL1_R
+    PL0U_R = PL1_R,
 #endif
 
-#define PL3_RW (PL3_R | PL3_W)
-#define PL2_RW (PL2_R | PL2_W)
-#define PL1_RW (PL1_R | PL1_W)
-#define PL0_RW (PL0_R | PL0_W)
+    PL3_RW = PL3_R | PL3_W,
+    PL2_RW = PL2_R | PL2_W,
+    PL1_RW = PL1_R | PL1_W,
+    PL0_RW = PL0_R | PL0_W,
+} CPAccessRights;
 
 typedef enum CPAccessResult {
     /* Access is permitted */
@@ -264,7 +266,7 @@ struct ARMCPRegInfo {
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
-    int access;
+    CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
     int secure;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1bbaf0a3af..33ba77890b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8712,7 +8712,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * to encompass the generic architectural permission check.
      */
     if (r->state != ARM_CP_STATE_AA32) {
-        int mask = 0;
+        CPAccessRights mask;
         switch (r->opc1) {
         case 0:
             /* min_EL EL1, but some accessible to EL0 via kernel ABI */
@@ -8741,8 +8741,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
             break;
         default:
             /* broken reginfo with out-of-range opc1 */
-            assert(false);
-            break;
+            g_assert_not_reached();
         }
         /* assert our permissions are not too lax (stricter is fine) */
         assert((r->access & ~mask) == 0);
-- 
2.25.1

