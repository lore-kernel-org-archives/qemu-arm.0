Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4052217lfm;
        Mon, 24 May 2021 19:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSjrTDKfuqlEX/jGWn7FM4qbNABh9X50YKxk8ruMfla2jSsuoOtrXIr+xVp3Jfw4YjAuPO
X-Received: by 2002:a37:ae86:: with SMTP id x128mr32984005qke.427.1621908526400;
        Mon, 24 May 2021 19:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908526; cv=none;
        d=google.com; s=arc-20160816;
        b=YXaWstN0syoxFexHE5LDIdIv9t1CTq10WdTeLUaDlsVpwTFa4YE4kdCvVYFIwx6oEG
         bFFN7jooF7ys79uGbX0j36mNVfl9SMm7QYDp5SzMjjDBkKOikiO/4JteKqX2aNDJuTqo
         AZUuFkPfVP9xWnW6voVigbpwrjUgMBxvCJ9MjGhCe8QHRRX38G5zEwnU4IOLlN1vx5XM
         Fd/2k5FW2HwJDKBJ4FYGdPAoLn0IF8TIQTjY+4O0+II+4qS9gVTSskRN+ZfTrc4cjgCt
         h2y2LFJpoLgL57YNt4No8R++QoFwKZBdGoIVM7AXDdndXBQdaNAXWgP6n8q0LujQeW/4
         3mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7dZqpG1NzFwardXCWOeWwh7nv+Kax2dkw5cg803fy2E=;
        b=E4Uk7EqWVRUHT7V3pHi/CNUO6Gln6MXa3BYb65MsvZYI87O+FPRL1e09hSz6E49OBv
         FFOD4cDatj1ZqK4B98wssYM8rEa3XiFy3jECiJctePu5i7Dvju1uEyHUEhhDmVWuzejj
         4z3yXyV3s5+6eQ5Ucnzx7k5O5t06Kt74Fud0i+qAlZ8DqHV2gCGLY+cUHroORPWaCCsv
         3cbAp9Ymo479dNLogcGqs8d9nL6JFlnzoWhvIyakwC0Eqgl3w4uBXXpOFkXVWhiybOrj
         KJDcprmX6zJMbANnK0G1EyMUTaxyAjQ2SzCjRPlxDBXJh22mFao6UN7Qfnj+tju+FJxZ
         vTzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HA0d8y2R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77si11676964qkk.309.2021.05.24.19.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HA0d8y2R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMUv-00059x-K2
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb7-0006HG-9t
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLav-0005ru-EF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso12174414pjb.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dZqpG1NzFwardXCWOeWwh7nv+Kax2dkw5cg803fy2E=;
 b=HA0d8y2Rk0ku9qXs3WUgDfZjLkAwN4SXYnQzk24FRjgwVoEZrmZCs2k7zmUkeL1hIX
 hTUmweP1anMCPj91tSyvMzB2QS4xDZgz7aOE/odjwDxhDRe3pBsmLNh9u7XYCNmFzvqu
 J9FoLsiXDYFqFMrUgJcn7NeZb9e3d5gbpwKD9fg8u2laj/3pvpyYTGyBFAkdkQ3+aaaf
 kUjyXBDbU758GrXCN+ICwey3NEDyBHiYOEfGT5zqvVw7ISsJgrICrH6vtzCB93SCl4QO
 UKW0rV2HvEy2XKzafsF8W4rej9VN+fEVwh/sbNCxdoSKS3zmvAMBA2JFVtfHclblVBNW
 KjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dZqpG1NzFwardXCWOeWwh7nv+Kax2dkw5cg803fy2E=;
 b=JyCi/dcEY50I3qN7z7pRWeRTlkTMj9AQWMpP0CVU8iR3CxmL1MSs4Zn+vJH8e4jQVr
 PRva1bJeqITQyIKomvJp+0ancAaEMmvPDkKWWWsrPLPTs7fq+w/5YgP/1KabEEVcKe6N
 gowe4Vq6dXmD78OC5PXhQFjidHah05k3BSYeLWKLlgp4DJF2Bi1ROtrFCFofF+rOXI04
 DLwW1NOymST/XvOD/i8bgGaLykm9wzF2C1e5L9IC9QyGjzEEh875VFIQsPIlBJyKNNd/
 jZyCBa4ufptizNqTmfYTHh8BR9e7R5iG5CQTtkxhqTyojXjLtqh3dT27jeQYzJEfV5d3
 YVMQ==
X-Gm-Message-State: AOAM531uu6rqKB15ZpyLaPMionGhO1rM6Lpkob/w6CV3u4+Y76Gd+e86
 +3F1GpNQGbNZFZF1fYOrPK2BPvuMrI1INg==
X-Received: by 2002:a17:90a:8581:: with SMTP id
 m1mr2847606pjn.47.1621905051167; 
 Mon, 24 May 2021 18:10:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 83/92] target/arm: Implement aarch64 SUDOT, USDOT
Date: Mon, 24 May 2021 18:03:49 -0700
Message-Id: <20210525010358.152808-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CoUf3R6FquP9

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c75601b221..b2b684df55 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4206,6 +4206,11 @@ static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
 }
 
+static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a8edd2d281..c875481784 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12175,6 +12175,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_dp, s);
         break;
+    case 0x03: /* USDOT */
+        if (size != MO_32) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = dc_isar_feature(aa64_i8mm, s);
+        break;
     case 0x18: /* FCMLA, #0 */
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
@@ -12215,6 +12222,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
+    case 0x3: /* USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -13360,6 +13371,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+    case 0x0f: /* SUDOT, USDOT */
+        if (is_scalar || (size & 1) || !dc_isar_feature(aa64_i8mm, s)) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = MO_32;
+        break;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
@@ -13474,6 +13492,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
+    case 0x0f: /* SUDOT, USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                         extract32(insn, 23, 1)
+                         ? gen_helper_gvec_usdot_idx_b
+                         : gen_helper_gvec_sudot_idx_b);
+        return;
+
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
-- 
2.25.1

