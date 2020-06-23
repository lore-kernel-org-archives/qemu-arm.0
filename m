Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4358243lfm;
        Tue, 23 Jun 2020 13:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX6NfFOXiFMXOkFqfYJ4x9yTzMpk+TH4IV85cd0YyMqBWyZBduRH8fhNcoCTPFQoK1npXS
X-Received: by 2002:a25:5d04:: with SMTP id r4mr35257288ybb.290.1592942569859;
        Tue, 23 Jun 2020 13:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592942569; cv=none;
        d=google.com; s=arc-20160816;
        b=NNqqagMbWo/IsnVuA1d3RcedCcDMbv8teRF3mA22/w8r0Q52iL4dPZuo7AFc+Av2ZZ
         3dHFiGLyL3k/XD1y6icrlM3aqPZl7GFHRbGCixPVTMItwrdtMsccou9GLxSPvXUGAhty
         aWWiOT67QC2IJgCqpFBJ04+UhrZBVaJrADN8iehiJlKS7drazMLDUesoCCaX/4u2RV7J
         k6MH6L/kAQbxcaoJODTclKsJMyfmWveRsLX0B24KmvFrepOeaZrG29yENN+nB8a3T2PA
         sTM7bOY/82Ukxh7J6bXrzUHz4nljRBGb5sJzxXtL4cPe+LaQVInWaS8EMSNrL8uY3cV1
         AAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rcFv549aa6vm0WyOmr9ZtAI+qbXjy1Qjdhyb2qG7F7k=;
        b=QX0kFQSJHkp2GZ5zA/SzUxvE7+to4sGevcdtML97R/tRoJbFJvMm5r50B4CSiJqapT
         XQiKzQ8oS1OjjGPUPUEpdXycHYAW800eTfdB8MFRDhWiUpQqsRNt2n2BMLPHeNwiz3a9
         9bxMh14YL9NbYVDBQkGq0fFOs7e/UMZkGQzZDyTGPR+CyYV6pvMSFKuWkWq+LanKzMLt
         hXtDimSc3Ltp+NL7SeEvqQW1NaNCyMnN32j+KYtfy1qGQzS31GCT1R72LihEzozoLl4j
         i0BoSbH6X8EoFTdQnyArbI5/VqMy7RhVP0MvmqVf0fFDINostfu80gV3zsfsX7JHD3d4
         BDtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQxZg2my;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si872418ybs.181.2020.06.23.13.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 13:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQxZg2my;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnp85-0008KT-5s
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 16:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojo-0004c5-Cg
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:44 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojm-0005py-Di
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:43 -0400
Received: by mail-pl1-x641.google.com with SMTP id k6so9533120pll.9
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcFv549aa6vm0WyOmr9ZtAI+qbXjy1Qjdhyb2qG7F7k=;
 b=VQxZg2myiGdQPKAkfrBbc4JtVbOLGTm562QXxSNDlRFi2BRpN6YX20AsWEaQmDz0sQ
 W5dWfiROO3PVmYNjEDPWX1raJiQBSIMKFjNOCi2dUk0kGY2MEkg9PAKDpqVFsT1pvceJ
 aHWSu9jWEJRuNfMk8xM3rtXOX5dVFRALRoqEDj+wCNInwKiGXFncQI24XdO+bvJZ2su6
 ZPT7qQZ7S8gC/FVINNs/l43kQ6PcQWDbgTcMUTJw3dfgrUvFNdaXn9BqCs4bHeEThL8G
 FWouXncnpgdDDUDaRgaWkAK7ryHSIZ5GvIYlVkvL+voDHslj6o1fTysvzVWYqQZ7v/IC
 p1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcFv549aa6vm0WyOmr9ZtAI+qbXjy1Qjdhyb2qG7F7k=;
 b=SimrC0hM4OAd0hYkLF6feg05tp/6vD4i1Ijj72U/Xamigpk0TZKa2UkMN9Qn87eZSv
 1sP+h2PU8BRDbS4WOP74QrRfPD4QT+YtqLkIdwWimyjMBPR3k2jLASapbueLlKHEFRcW
 /S9b0Wbj0BSpQ7+h7FUuXnK/OGjjkgJ5r5OIGLVDnJbI5y5k2C4YmgenTKXo8R9jYQqf
 ppvRG/MnuOlXDgGYfQ0XFeis71MBgvnNqSC9A0Tk2094n4fAynhRZPUffgN51AJQKlvy
 02iVjpzCO3bdpOYxAQHRYotAXjkjyZkHUQ1c3iXRtfDQkUlrQImko7y+Es8Z1EOOEAG2
 7NSg==
X-Gm-Message-State: AOAM531pzZFkjczEstYgEsPBqMv70BJsPnECbVeH2Vp0JIosVlNyfE33
 IA+lWWzhdj2VvyXjGIT5nDKeJQ==
X-Received: by 2002:a17:902:7c18:: with SMTP id
 x24mr24375261pll.26.1592941061047; 
 Tue, 23 Jun 2020 12:37:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 29/45] target/arm: Use mte_checkN for sve unpredicated
 stores
Date: Tue, 23 Jun 2020 12:36:42 -0700
Message-Id: <20200623193658.623279-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-TUID: V4crFqp+KBVD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Drop the out-of-line helper (pmm).
---
 target/arm/translate-sve.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 11e0dfc210..4a613ca689 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4432,10 +4432,12 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     int len_remain = len % 8;
     int nparts = len / 8 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 addr, t0;
+    TCGv_i64 dirty_addr, clean_addr, t0;
 
-    addr = tcg_temp_new_i64();
-    t0 = tcg_temp_new_i64();
+    dirty_addr = tcg_temp_new_i64();
+    tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
@@ -4448,33 +4450,35 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     if (nparts <= 4) {
         int i;
 
+        t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_ld_i64(t0, cpu_env, vofs + i);
-            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_addi_i64(clean_addr, cpu_reg_sp(s, rn), 8);
         }
+        tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr t2, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+
+        /* Copy the clean address into a local temp, live across the loop. */
+        t0 = clean_addr;
+        clean_addr = tcg_temp_local_new_i64();
+        tcg_gen_mov_i64(clean_addr, t0);
+        tcg_temp_free_i64(t0);
 
         gen_set_label(loop);
 
-        t2 = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(t2, cpu_env, i);
-        tcg_gen_ld_i64(t0, t2, vofs);
-
-        /* Minimize the number of local temps that must be re-read from
-         * the stack each iteration.  Instead, re-compute values other
-         * than the loop counter.
-         */
-        tcg_gen_addi_ptr(t2, i, imm);
-        tcg_gen_extu_ptr_i64(addr, t2);
-        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
-        tcg_temp_free_ptr(t2);
-
-        tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
-
+        t0 = tcg_temp_new_i64();
+        tp = tcg_temp_new_ptr();
+        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
+        tcg_temp_free_ptr(tp);
+
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        tcg_temp_free_i64(t0);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
@@ -4482,29 +4486,30 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
+        t0 = tcg_temp_new_i64();
         tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
-        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
 
         switch (len_remain) {
         case 2:
         case 4:
         case 8:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx,
+                                MO_LE | ctz32(len_remain));
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL);
-            tcg_gen_addi_i64(addr, addr, 4);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
             break;
 
         default:
             g_assert_not_reached();
         }
+        tcg_temp_free_i64(t0);
     }
-    tcg_temp_free_i64(addr);
-    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(clean_addr);
 }
 
 static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
-- 
2.25.1

