Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2390934ejb;
        Tue, 30 May 2023 12:16:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ljlHDNBKURz4liyVmzuM8qdjKi+EsPWllfRqL393JUwesdtwG1jk2ved2qIyZpMC5NH7O
X-Received: by 2002:a05:620a:20d9:b0:75b:23a1:362b with SMTP id f25-20020a05620a20d900b0075b23a1362bmr3199749qka.60.1685474162627;
        Tue, 30 May 2023 12:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474162; cv=none;
        d=google.com; s=arc-20160816;
        b=hJOPQ3TkW2YWqda20P3DcS7wmK6upsem7sdecMqRZcv6y628YQQP+H3sazIYXmAyPZ
         +5Mslb3CfeV6SQm1nwbyem1Cuq9RVo5TtKQNG6e4g9dA6lbsh3OdRLqvkjKEUU5UqJ4R
         3JLt9mzjDCeABUomqWZIUeaHVYIj2nMu4nLS55iYpgNVJdofcVxwVWx07OnvtO0IABeY
         xvvbLxEBUZkclHTENbJl1B0hIhpo85UWMG85a4xrN68P3y6+k6HsIa2M2NLscVIUGyJb
         dqBBcLwB3CsqiPTkoTM3hgycwMxW1AVdpSCLFefnyu30fCZnJeiwkbOf8rmSPaq3DSpW
         Ya8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lVXqrkVpUbyPr7RXHtkXkDFqvAZ64HbnSrMT6ekrwjQ=;
        b=XJUqahDaWty43j6G2lqkyLLcbcDtGeLm6GWstz6NBTycOqp+1glGPYpWQKbOdJK3r5
         R6hVZMwHDSTUqOJQLzDqYUekRm6YpS+6gheP15VxHLNqe9q8z4xItUtMQwXo+LaUY/CF
         pOE+Qzz/EwpJwiUeDBBQiSBBzq2upwDDyaiab2Z7IDLKgJkPJ2ezfLTQRorSC5RS5grG
         5JGy0mOv7YM6sYl+eSNgWkuEma11+mNQn2Ir8Qx+Qaij+O8ZmnHU9YhyxifT2KE//6Bk
         8gWWA3vBTacz95ULYzBfN+KfpWF8qKti3ffI2po+0v2plNKuAYGV/4wJl05AIBZvFp0i
         X49A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uJgixujK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a0562140d6900b0062621e49152si3732199qvs.30.2023.05.30.12.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uJgixujK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44o7-0006y4-Ea; Tue, 30 May 2023 15:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44ny-00066V-3M
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:51 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nw-0004fR-3b
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-53fb64b3368so731187a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474086; x=1688066086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVXqrkVpUbyPr7RXHtkXkDFqvAZ64HbnSrMT6ekrwjQ=;
 b=uJgixujKJ/d/nRNxFx/EVQciw/q3LwnTawrZMIw0Qbr7IvJ4cWOXP4/FOFdtFufQzB
 OknjSxo+sBA4ynfMBOUZtO3WFxAzs8wYVWOikEYTQtROMT1+RcLFvibVEiV56eKy6L0C
 praMyHpuEJTnSdmWH0c+BT5jwk3lfJ1mHNm/tD8Z7rhbAy7i1qwM+bqPXb31/YWMf0KS
 Xs3U1K1voEbkdXZhv/8wFL0Zda9LL7Do/uks60KLbsuRAfiHJK1wI5HlDljuGP0SIfEZ
 aqP+TByhCSY+osvEWr3kJuWRquayKWRWr4nvxTJPgzbczOLjTsLigA10jCA5oQItp3vi
 0Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474086; x=1688066086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVXqrkVpUbyPr7RXHtkXkDFqvAZ64HbnSrMT6ekrwjQ=;
 b=Q08a7He1siyG6vGPB4Bmf6RDk7eYUfhlALfGmdAc7jBe2FPE5LUymUWqAp9OUA7NQR
 7JlJK9C06jRbzFH2NAjaJ67joqb1HD8JA/UlFSy/2xeJS/YP5kwgUUJEUybFqORkxA3C
 eX21k/LP4qlBesmmjejt5S7QhM6O/YabvWdpgzIiCFUUJShKKEGwVJjZY76rvkuZJCnj
 WzgxnME2KfmD0n4Jvm4KG6XSmmCqqQYxuSw48h7qMXvha79jrysesfMMzLKT0cSWTW79
 3NqKebcTUDBMFKTgob4t7rbQZRKZLQRB9LySRgZT6AZdBPTJjmbns7c4k3tq19ZYL0IR
 5AZw==
X-Gm-Message-State: AC+VfDyV/JERJqdBET48H1jZm36dJYupKALdPsSjL5o6t+GPgfp+PUFh
 g8hdTKPjE0Ssu5GKEMRaClORnQ==
X-Received: by 2002:a17:90b:3e84:b0:256:4cd3:95c5 with SMTP id
 rj4-20020a17090b3e8400b002564cd395c5mr3813506pjb.5.1685474086035; 
 Tue, 30 May 2023 12:14:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/20] target/arm: Sink gen_mte_check1 into
 load/store_exclusive
Date: Tue, 30 May 2023 12:14:26 -0700
Message-Id: <20230530191438.411344-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0VFCBsks2JUj

No need to duplicate this check across multiple call sites.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 44 ++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 51f9d227e7..19f0f20896 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2381,11 +2381,16 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
  * races in multi-threaded linux-user and when MTTCG softmmu is
  * enabled.
  */
-static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
-                               TCGv_i64 addr, int size, bool is_pair)
+static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
+                               int size, bool is_pair)
 {
     int idx = get_mem_index(s);
     MemOp memop;
+    TCGv_i64 dirty_addr, clean_addr;
+
+    s->is_ldex = true;
+    dirty_addr = cpu_reg_sp(s, rn);
+    clean_addr = gen_mte_check1(s, dirty_addr, false, rn != 31, size);
 
     g_assert(size <= 3);
     if (is_pair) {
@@ -2393,7 +2398,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         if (size == 2) {
             /* The pair must be single-copy atomic for the doubleword.  */
             memop = finalize_memop(s, MO_64 | MO_ALIGN);
-            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
+            tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
             if (s->be_data == MO_LE) {
                 tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 32, 32);
@@ -2412,7 +2417,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 
             memop = finalize_memop_atom(s, MO_128 | MO_ALIGN_16,
                                         MO_ATOM_IFALIGN_PAIR);
-            tcg_gen_qemu_ld_i128(t16, addr, idx, memop);
+            tcg_gen_qemu_ld_i128(t16, clean_addr, idx, memop);
 
             if (s->be_data == MO_LE) {
                 tcg_gen_extr_i128_i64(cpu_exclusive_val,
@@ -2426,14 +2431,14 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         }
     } else {
         memop = finalize_memop(s, size | MO_ALIGN);
-        tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
+        tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
         tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
     }
-    tcg_gen_mov_i64(cpu_exclusive_addr, addr);
+    tcg_gen_mov_i64(cpu_exclusive_addr, clean_addr);
 }
 
 static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
-                                TCGv_i64 addr, int size, int is_pair)
+                                int rn, int size, int is_pair)
 {
     /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]
      *     && (!is_pair || env->exclusive_high == [addr + datasize])) {
@@ -2449,9 +2454,12 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
      */
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
-    TCGv_i64 tmp;
+    TCGv_i64 tmp, dirty_addr, clean_addr;
 
-    tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
+    dirty_addr = cpu_reg_sp(s, rn);
+    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, size);
+
+    tcg_gen_brcond_i64(TCG_COND_NE, clean_addr, cpu_exclusive_addr, fail_label);
 
     tmp = tcg_temp_new_i64();
     if (is_pair) {
@@ -2639,9 +2647,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    true, rn != 31, size);
-        gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
+        gen_store_exclusive(s, rs, rt, rt2, rn, size, false);
         return;
 
     case 0x4: /* LDXR */
@@ -2649,10 +2655,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    false, rn != 31, size);
-        s->is_ldex = true;
-        gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
+        gen_load_exclusive(s, rt, rt2, rn, size, false);
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         }
@@ -2704,9 +2707,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                        true, rn != 31, size);
-            gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
+            gen_store_exclusive(s, rs, rt, rt2, rn, size, true);
             return;
         }
         if (rt2 == 31
@@ -2723,10 +2724,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                        false, rn != 31, size);
-            s->is_ldex = true;
-            gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
+            gen_load_exclusive(s, rt, rt2, rn, size, true);
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
             }
-- 
2.34.1

