Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4347107lfm;
        Tue, 23 Jun 2020 12:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2NBKlJqtO+EDKV2AxgvFIfLfkyIsB6kPZJ/3RE7Hqun3W7/fTrKc5Q1yz4JEV4HZae4Rj
X-Received: by 2002:a25:c646:: with SMTP id k67mr39831665ybf.110.1592941653474;
        Tue, 23 Jun 2020 12:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941653; cv=none;
        d=google.com; s=arc-20160816;
        b=V6EGQNzwJafB86Uo3NtIRTvCWa3CWN3T3FDEorWu6vzcU/0CiLmLZybVGg7r56Tbo9
         1L3NLn76jJ8lwwT6oIX3b/6Ys+J/gVnjwkAmjU8w/DXKdPYqv19PUpHlQ3HUdiwDWorv
         UppraG47CG+bGZgRdD+Z4JVFJnV9jvQ8RtRCiHpGcDrSKts4DvX8FJvtj+ls7D+sEO/p
         ADhJKKidVJzO953EH2W+Ms4I1hkf581aVdvgI4/oePeSnOtTrQ13SVpBbSZz9eBeoUM7
         jpdfwIozRnkcFib6hhtwD1L9qnnIoBj7EahWIwlT5qedqd1lxpr6z7W1/RrkOl/l+9YF
         vqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W/rZx6/dQQS4+8bjQVnnd9qMpghesUglRuSwZ7vUtvw=;
        b=IMC0hJVKhcS74Ov31h6782JC8p/wdKP7LTjjKPW+DEzQzZ5fLKjOW59WkLiLjrqGcd
         XnuDRclbJN69i8ezLtE1gt3SpZYAz7zvU67UVhzkYtD7cehz6D7JuhH5ztfOJGWjOIZC
         g+mFi40S2XjPbZRevFFkDwMWE53T81xfzO2OK79fZzjRyjHlfpwsDlwXwtoLnxCC+SNf
         gcAOFHmohW6RBmyDYCn5j8JxsQb9YgfaeqFer57n65n1f6QjSFyJYlEGEgi2lGsw8l1C
         VAgaIBjQ7KaHIYKaewWdsJu8GdzuvJF3C/EoOsI4wdw/D2hN7tOch26JqUUCZqIl9CcC
         QM3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ha5HGUKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si19918551ybg.40.2020.06.23.12.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ha5HGUKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnotI-0005xg-KS
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojm-0004YN-VM
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:43 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojl-0005pR-14
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:42 -0400
Received: by mail-pj1-x1041.google.com with SMTP id h22so2008522pjf.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/rZx6/dQQS4+8bjQVnnd9qMpghesUglRuSwZ7vUtvw=;
 b=Ha5HGUKejv0XFOetYZTmisMG/dkUnI4OXuLRS1tlXDpjS+ilMoT+UaCvcMj/E5McLs
 YFpwhAIgIBLKULTXpURyP0rZ9wNenvLf5mzkIkgK0+4I15jZoPW7MKnKRieAQkAYH9Qm
 8b4TdVM2klWi0iAL1kxoRT/jqw8Rs3S2sBDtmuA44h2zjeJdNiQdTTRRPU0U+7x6gjpY
 bjvl/K1KcAp5NocAo6rn/4se+fZbg0qcVWidqMdWuIui6Q8TkJVY4x0LziKUPWRe4x9M
 8KjN3yePFvNXX4MUpiuXQinIHpDFxxhiLJpNrfcYBkucgMIyP8Nn/iVozsXbaRp2OFvS
 tZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/rZx6/dQQS4+8bjQVnnd9qMpghesUglRuSwZ7vUtvw=;
 b=XfhIEN8NFe+pBv/atCbfBLpV39auwXBnWPJtsQKaVQe2uyknsSW5M+1aYZ6Mz6Tu8S
 bkbSCVeGn/U5ahgyTd6lzCc5SC8jMhmfpZTG7egx7SQ0qgsDw2iHY663qzSjnBVaSZXg
 ZvAhDQ8/Rdm1Wk/zgkxXfIxmHIL70FRk5s/p5FJbWn8M2Bwr0VBkZdXTpZ1QQOD9RyAy
 5fLn9my+9YuNUe19IP3FEJlBHJU3+YvpWCjdKVG/4d0bzKjnLqfP89Xp712EcdJHysnV
 S7cgqUNGBhqHxXOsnI6TVbrnRelo24zYJsDbCUFlW5/a/7/oSDFdP88S5sCohvKeb1hQ
 3dMA==
X-Gm-Message-State: AOAM533CtqN5+2btJDGTD0m97weL59NGyqS7Lof3wmZKretxJpWNp7pp
 18phA0cNHdXCjuDij0n7n7YvCA==
X-Received: by 2002:a17:902:9b92:: with SMTP id
 y18mr23782189plp.228.1592941059702; 
 Tue, 23 Jun 2020 12:37:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 28/45] target/arm: Use mte_checkN for sve unpredicated loads
Date: Tue, 23 Jun 2020 12:36:41 -0700
Message-Id: <20200623193658.623279-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-TUID: AQ0CdPfV0Z3a

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Drop the out-of-line helper (pmm).
---
 target/arm/translate-sve.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ac7b3119e5..11e0dfc210 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4342,71 +4342,76 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     int len_remain = len % 8;
     int nparts = len / 8 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 addr, t0, t1;
+    TCGv_i64 dirty_addr, clean_addr, t0, t1;
 
-    addr = tcg_temp_new_i64();
-    t0 = tcg_temp_new_i64();
+    dirty_addr = tcg_temp_new_i64();
+    tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    tcg_temp_free_i64(dirty_addr);
 
-    /* Note that unpredicated load/store of vector/predicate registers
+    /*
+     * Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
-     * operations on larger quantities.  There is no nice way to force
-     * a little-endian load for aarch64_be-linux-user out of line.
-     *
+     * operations on larger quantities.
      * Attempt to keep code expansion to a minimum by limiting the
      * amount of unrolling done.
      */
     if (nparts <= 4) {
         int i;
 
+        t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
-            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
             tcg_gen_st_i64(t0, cpu_env, vofs + i);
+            tcg_gen_addi_i64(clean_addr, cpu_reg_sp(s, rn), 8);
         }
+        tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
+        /* Copy the clean address into a local temp, live across the loop. */
+        t0 = clean_addr;
+        clean_addr = tcg_temp_local_new_i64();
+        tcg_gen_mov_i64(clean_addr, t0);
+        tcg_temp_free_i64(t0);
+
         gen_set_label(loop);
 
-        /* Minimize the number of local temps that must be re-read from
-         * the stack each iteration.  Instead, re-compute values other
-         * than the loop counter.
-         */
+        t0 = tcg_temp_new_i64();
+        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+
         tp = tcg_temp_new_ptr();
-        tcg_gen_addi_ptr(tp, i, imm);
-        tcg_gen_extu_ptr_i64(addr, tp);
-        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
-
-        tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
-
         tcg_gen_add_ptr(tp, cpu_env, i);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_gen_st_i64(t0, tp, vofs);
         tcg_temp_free_ptr(tp);
+        tcg_temp_free_i64(t0);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
     }
 
-    /* Predicate register loads can be any multiple of 2.
+    /*
+     * Predicate register loads can be any multiple of 2.
      * Note that we still store the entire 64-bit unit into cpu_env.
      */
     if (len_remain) {
-        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
-
+        t0 = tcg_temp_new_i64();
         switch (len_remain) {
         case 2:
         case 4:
         case 8:
-            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
+                                MO_LE | ctz32(len_remain));
             break;
 
         case 6:
             t1 = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUL);
-            tcg_gen_addi_i64(addr, addr, 4);
-            tcg_gen_qemu_ld_i64(t1, addr, midx, MO_LEUW);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 4);
+            tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
             tcg_temp_free_i64(t1);
             break;
@@ -4415,9 +4420,9 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
             g_assert_not_reached();
         }
         tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
+        tcg_temp_free_i64(t0);
     }
-    tcg_temp_free_i64(addr);
-    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(clean_addr);
 }
 
 /* Similarly for stores.  */
-- 
2.25.1

