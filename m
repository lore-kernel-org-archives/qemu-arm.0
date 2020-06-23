Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4347353lfm;
        Tue, 23 Jun 2020 12:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFpSyd6NQQOpW7+MD5U9EV6g6xK2BsXa1oin/95N7EFgYk5Rg4G6Vq8CyRhrlXDH0WJTZy
X-Received: by 2002:a5b:d09:: with SMTP id y9mr22009689ybp.234.1592941675598;
        Tue, 23 Jun 2020 12:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941675; cv=none;
        d=google.com; s=arc-20160816;
        b=zlFcZQJbEd+6/bnWvjtX+Geh8xa7g7YDwBcifnZk6c28EQz5m2F+EVNbat5wMhtl6w
         p3qZxWph6dCk/4lnJ/QE/x2QyRLur3cUEfhXaKzl4BG9eH0jVWgzHm5i7U0OasDh2vsq
         R7x6aLnfcAu4L6kgmSfJUad2uwAap+uJFdFe+0t6eiKK8qKTHxpuxRuDjBe3jH+FsFtY
         MWCxLY8SpWg2Bor8X2CXgIZZV4ijJTORvyf07wzm6vorgvssmizrVw/X7xSrFvKFR5a1
         pPp1PqQduDz3nwhZ0PwNGn7lUlFvKdf14H/03lCcNRCxe34QaRJ6gNyCBx4KOi9HRIJL
         Ad8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JUH08mqCPsYXydFaT0uxZthQYxuk222Kz13pCnZjYg4=;
        b=VvzhWy3E5jkUtdwM3bNLmBlVKcb8PcRquAKmj5Zh48lAvLSRTL5437Rcwtg9tiyAOV
         TQrmGefMdO1foJnOYaZUpAPYOGS4AsIBv/Rw2k30NSprtljpCr3kZx9yPVRSiwpGZjpt
         5ZbMQ1hDUFCrrAiCGJNDP+Ynvsk7dVZM2++JX5RH44K26Es30qsJNXP2vxQYzroYRUTb
         hLCmoJ+cj4GXD0cZANqKVeeXiPA7IBMcHacNY5hR23B1iHCHgSxVh2auD+rVdFhLK2wf
         i+jBkqALIBeCLTzsH56cOGU8ebRoU0EXYDgZMH2c4aWkF/q+0zsEqNEhrENgOzCHK5c6
         n5nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XvLSyXtd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si17822056ybd.490.2020.06.23.12.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XvLSyXtd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnote-0006vg-RE
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojW-0003oR-2G
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:26 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojT-0005fv-Oy
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:25 -0400
Received: by mail-pg1-x544.google.com with SMTP id t6so30138pgq.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JUH08mqCPsYXydFaT0uxZthQYxuk222Kz13pCnZjYg4=;
 b=XvLSyXtdGkC1xpSYLxLVdbXPE8v4DXJCWjNUSW6xLrwq39ch9syxT8dpnWIasBoBwJ
 /1kTuKphOm+XCQtRN/cVmst4yadttWXCwnGl0P85FWbh6nbRwpaCXkKl15A0t+meb9u+
 MHEcSZBa+VS8GBu6NaBUqmdn1mVRmdaw+uGHqlVyr2IEV61hG7FVy0W5zwDJT+VqmTVo
 WjXdqgfIV0//PbeAk13JeYEkiXsB4xm2RE1lWWuCYEc7AeyVUMBexeHbnoVzofbUfvBJ
 WmhvYhxkiJMyafXXw13u4vZdZzqt3as57k+ZB2sOqY6CQxWQhjc2Zk1Q0JwfWWlqgp10
 5xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JUH08mqCPsYXydFaT0uxZthQYxuk222Kz13pCnZjYg4=;
 b=BKvxvLhWT7++JchCT5vJsYazkSOsVXr7IoUpugHd84v0TkLR4u6G7+UblqNMnxzapN
 uW+R99UuBhjiHU1NfXwIlGwheDvcrgROdfHrwE/fNfeCO6aGwLKIyoUIrzekauh4cEFS
 mOafLEHXVE7aoz6OrN/lkOAeHjtb/A/52N5h2tE6SuCdOAFho4U/rq7hUZeVgNUPBgfJ
 9EaVV1RFigMuwSx3kccmQt3RmFLN4WRBlN0fQonruTeSciP2mYtwnfP8HvMbtXYtdVPd
 UvszIX1HrXO4b9LVXtMg7NJ0IdRYPLmcvECllGv4j4LJWTxjBPjpgZqsxyJeH/W0X2fW
 lDUw==
X-Gm-Message-State: AOAM533Gt7IWaB7eK/BbjbOts21L0Ob3RaX/LMxRylpTbY1xHbvPzsQz
 PLz5Bzs6efkYPtD8CRCXvCyxOg==
X-Received: by 2002:aa7:9092:: with SMTP id i18mr5863630pfa.18.1592941042320; 
 Tue, 23 Jun 2020 12:37:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 16/45] target/arm: Implement the STGP instruction
Date: Tue, 23 Jun 2020 12:36:29 -0700
Message-Id: <20200623193658.623279-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-TUID: Q88+ZhygO0b4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Handle atomicity, require pre-cleaned address.
v6: Fix constant offset shift, non-checked address, use pre-computed ata.
---
 target/arm/translate-a64.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c6152b3cc0..5d8c9483bc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2690,7 +2690,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2715,6 +2715,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2727,6 +2728,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2767,7 +2776,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         return;
     }
 
-    offset <<= size;
+    offset <<= (set_tag ? LOG2_TAG_GRANULE : size);
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
@@ -2777,8 +2786,22 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
 
+    if (set_tag) {
+        if (!s->ata) {
+            /*
+             * TODO: We could rely on the stores below, at least for
+             * system mode, if we arrange to add MO_ALIGN_16.
+             */
+            gen_helper_stg_stub(cpu_env, dirty_addr);
+        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
+        } else {
+            gen_helper_stg(cpu_env, dirty_addr, dirty_addr);
+        }
+    }
+
+    clean_addr = clean_data_tbi(s, dirty_addr);
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
-- 
2.25.1

